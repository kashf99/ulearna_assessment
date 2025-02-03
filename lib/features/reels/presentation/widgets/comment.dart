import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearna_assessment/core/network/api_service.dart';
import 'package:ulearna_assessment/features/reels/data/models/comment_model.dart';
import 'package:ulearna_assessment/features/reels/data/repositories/reels_repository.dart';
import 'package:ulearna_assessment/features/reels/presentation/blocs/reels_bloc.dart';
import 'package:ulearna_assessment/features/reels/presentation/blocs/reels_event.dart';
import 'package:ulearna_assessment/features/reels/presentation/blocs/reels_state.dart';
import 'package:ulearna_assessment/features/reels/presentation/widgets/image_cached.dart';

class CommentScreen extends StatelessWidget {
  final int totalComments;
  final TextEditingController commentController = TextEditingController();

  CommentScreen(this.totalComments, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReelsBloc(
        ReelsRepositoryImpl(apiService: ReelApiService()),
      )..add(FetchReelEvent()),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
        child: Container(
          color: Colors.white,
          height: 200.h,
          child: Stack(
            children: [
              Positioned(
                top: 8.h,
                left: 140.w,
                child: Container(
                  width: 100.w,
                  height: 3.h,
                  color: Colors.black,
                ),
              ),
              BlocBuilder<ReelsBloc, ReelsState>(
                builder: (context, state) {
                  if (state is UpdatedReelsState) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return //Text("5");
                              commentItem(CommentModel(
                                  profileImage: "",
                                  text: "",
                                  userName: index.toString()));
                        },
                        itemCount: totalComments,
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 60.h,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 45.h,
                        width: 260.w,
                        child: TextField(
                          controller: commentController,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            hintText: 'Add a comment',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          commentController.clear();
                          // }
                        },
                        child: const Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget commentItem(CommentModel comment) {
    return ListTile(
      leading: ClipOval(
        child: Container(
          decoration:
              BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          height: 35.h,
          width: 35.w,
          child: CachedImage(
            comment.profileImage,
          ),
        ),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      title: Text(
        comment.userName ?? "",
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}


