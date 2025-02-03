import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearna_assessment/core/network/api_service.dart';
import 'package:ulearna_assessment/features/reels/data/repositories/reels_repository.dart';
import 'package:ulearna_assessment/features/reels/presentation/blocs/reels_bloc.dart';
import 'package:ulearna_assessment/features/reels/presentation/blocs/reels_event.dart';
import 'package:ulearna_assessment/features/reels/presentation/blocs/reels_state.dart';
import 'package:ulearna_assessment/features/reels/presentation/widgets/reel_widget.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

   
    return BlocProvider(
      create: (context) => ReelsBloc(ReelsRepositoryImpl(apiService: ReelApiService()))..add(FetchReelEvent()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<ReelsBloc, ReelsState>(
          builder: (context, state) {
            if (state is UpdatedReelsState) {
              return PageView.builder(
                scrollDirection: Axis.vertical,
                controller: pageController,
                itemCount: state.reels.length,
                onPageChanged: (mainPageIndex) {
                  if (mainPageIndex == state.reels.length - 2) {
                    context.read<ReelsBloc>().add(FetchReelEvent());
                  }
                },
                itemBuilder: (context, index) {
                  return ReelWidget(state.reels[index], "");
                },
              );
            } else if (state is ErrorReelsState) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
