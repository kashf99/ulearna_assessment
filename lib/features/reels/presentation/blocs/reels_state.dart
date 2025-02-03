// reels_state.dart

import 'package:ulearna_assessment/features/reels/data/models/reel_model.dart';

abstract class ReelsState {

  List<Object?> get props => [];
}

class InitialReelsState extends ReelsState {
  final List<ReelModel> reels;

  InitialReelsState(this.reels);
}

class UpdatedReelsState extends ReelsState {
  final List<ReelModel> reels;

  UpdatedReelsState(this.reels);

 
}

class ErrorReelsState extends ReelsState {
  final String message;

  ErrorReelsState(this.message);

  @override
  List<Object?> get props => [message];
}
