import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearna_assessment/features/reels/data/models/reel_model.dart';
import 'package:ulearna_assessment/features/reels/presentation/blocs/reels_bloc.dart';
import 'package:ulearna_assessment/features/reels/presentation/blocs/reels_event.dart';
import 'package:ulearna_assessment/features/reels/presentation/blocs/video_player_cubit.dart';
import 'package:ulearna_assessment/features/reels/presentation/widgets/comment.dart';
import 'package:ulearna_assessment/features/reels/presentation/widgets/image_cached.dart';
import 'package:video_player/video_player.dart';

class ReelWidget extends StatelessWidget {
  final ReelModel reel;
  final String videoPath;

  const ReelWidget(this.reel, this.videoPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoPlayerCubit(reel.cdnUrl ?? ""),
      child: Builder(
        builder: (context) {
          return _ReelContent(reel: reel);
        },
      ),
    );
  }
}

class _ReelContent extends StatelessWidget {
  final ReelModel reel;

  const _ReelContent({required this.reel});

  @override
  Widget build(BuildContext context) {
    final videoCubit = context.watch<VideoPlayerCubit>();
    final controller = videoCubit.controller;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onDoubleTap: () {
            context.read<ReelsBloc>().add(LikeReelEvent(reel.id ?? 0));
          },
          onTap: () {
            videoCubit.togglePlayPause();
          },
          child: Container(
            color: Colors.black,
            width: double.infinity,
            height: 812.h,
            child: controller.value.isInitialized
                ? Column(
                    children: [
                      Expanded(child: VideoPlayer(controller)),
                    ],
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ),
        Positioned(
          top: 450.h,
          right: 15.w,
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  context.read<ReelsBloc>().add(LikeReelEvent(reel.id ?? 0));
                },
                icon: Icon(
                  reel.isLiked! ? Icons.favorite : Icons.favorite_border,
                  color: reel.isLiked! ? Colors.red : Colors.white,
                  size: 24.w,
                ),
                //  ),
              ),
              SizedBox(height: 3.h),
              Text(
                reel.totalLikes != null ? reel.totalLikes.toString() : "0",
                style: TextStyle(fontSize: 12.sp, color: Colors.white),
              ),
              SizedBox(height: 15.h),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return CommentScreen(reel.totalComments ?? 0);
                    },
                  );
                },
                child: Icon(
                  Icons.chat_sharp,
                  color: Colors.white,
                  size: 28.w,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                reel.totalComments != null
                    ? reel.totalComments.toString()
                    : "0",
                style: TextStyle(fontSize: 12.sp, color: Colors.white),
              ),
              SizedBox(height: 15.h),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 28.w,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                reel.totalShare != null ? reel.totalShare.toString() : "0",
                style: TextStyle(fontSize: 12.sp, color: Colors.white),
              ),
              SizedBox(height: 15.h),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 28.w,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                reel.totalWishlist != null
                    ? reel.totalWishlist.toString()
                    : "0",
                style: TextStyle(fontSize: 12.sp, color: Colors.white),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                    size: 14.w,
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    reel.totalViews != null ? reel.totalViews.toString() : "0",
                    style: TextStyle(fontSize: 8.sp, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 40.h,
          left: 10.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: SizedBox(
                      height: 35.h,
                      width: 35.w,
                      child: CachedImage(reel.thumbCdnUrl),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    reel.userFullname ?? "User",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 300.w,
                child: Text(
                  reel.title ?? "",
                  maxLines: 3,
                  softWrap: true,
                  style: TextStyle(
                    overflow: TextOverflow.fade,
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
