import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearna_assessment/features/reels/data/models/reel_model.dart';
import 'package:ulearna_assessment/features/reels/data/repositories/reels_repository.dart';
import 'package:ulearna_assessment/features/reels/presentation/blocs/reels_event.dart';
import 'package:ulearna_assessment/features/reels/presentation/blocs/reels_state.dart';



class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  final ReelsRepository reelsRemoteDataSource;

  int page = 1;
  bool isFetching = false;
  bool hasMoreData = true;

  ReelsBloc(this.reelsRemoteDataSource,)
      : super(InitialReelsState([])) {
    on<FetchReelEvent>((event, emit) async {
      if (isFetching || !hasMoreData) return; // Prevent duplicate calls
      isFetching = true;

      try {
        List<ReelModel> newReels =
            await reelsRemoteDataSource.fetchReelsData(page);
        if (newReels.isEmpty) {
          hasMoreData = false;
          return;
        } else {
          page++;
          List<ReelModel> previousReels = (state is UpdatedReelsState)
              ? (state as UpdatedReelsState).reels
              : [];
      

          emit(UpdatedReelsState([...previousReels, ...newReels]));
        }
      } catch (e) {
        emit(ErrorReelsState("Failed to load reels"));
      } finally {
        isFetching = false;
      }
    });
    on<LikeReelEvent>((event, emit) async {
      final currentState = state;

      if (currentState is UpdatedReelsState) {
        final updatedReels = currentState.reels.map((reel) {
          if (reel.id == event.reelId) {
            reel.isLiked = !reel.isLiked!;
            if (reel.isLiked!) {
              reel.totalLikes = reel.totalLikes! + 1;
            } else {
              if (reel.totalLikes! > 0) {
                reel.totalLikes = reel.totalLikes! - 1;
              }
            } 
          }
          return reel;
        }).toList();

        emit(UpdatedReelsState(updatedReels));
      }
    });

    on<PlayReelEvent>((event, emit) async {
      final currentState = state;
      if (currentState is UpdatedReelsState) {
        emit(UpdatedReelsState(currentState.reels));
      }
    });

    on<PauseReelEvent>((event, emit) async {
      final currentState = state;
      if (currentState is UpdatedReelsState) {
        emit(UpdatedReelsState(currentState.reels));
      }
    });
  }
}
