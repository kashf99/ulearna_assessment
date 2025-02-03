import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCubit extends Cubit<bool> {
  late VideoPlayerController controller;

  VideoPlayerCubit(String videoPath) : super(true) {
    _initializeController(videoPath);
  }

  Future<void> _initializeController(String videoPath) async {

    try {
      controller = VideoPlayerController.networkUrl(Uri.parse(videoPath));
      await controller.initialize();
      final fileInfo = await checkCacheFor(videoPath);

      if (fileInfo != null && fileInfo.file.path != "") {
      
        try {
          controller = VideoPlayerController.file(File(fileInfo.file.path));
          await controller.initialize().then((value) {
            controller.setLooping(true);
            controller.setVolume(1);
            controller.play();
            emit(true);
          });
        } catch (e) {
          controller = VideoPlayerController.networkUrl(Uri.parse(videoPath));
          await controller.initialize();
          playFromUrl(videoPath);
        }
      } else {
        playFromUrl(videoPath);
      }
    } finally {}
  }

  playFromUrl(videoPath) {
    cachedForUrl(videoPath);
    controller.setLooping(true);
    controller.setVolume(1);
    controller.play();
    emit(true);
  }

  playFromCache() {}

  Future<FileInfo?> checkCacheFor(String url) async {
    final FileInfo? value = await DefaultCacheManager().getFileFromCache(url);
    return value;
  }

  void cachedForUrl(String url) async {
    await DefaultCacheManager().getSingleFile(url).then((value) {
    });
  }

  void togglePlayPause() {
    if (controller.value.isInitialized) {
      if (controller.value.isPlaying) {
        controller.pause();
        emit(false);
      } else {
        controller.play();
        emit(true);
      }
    }
  }

  @override
  Future<void> close() async {
    await controller.dispose();
    return super.close();
  }
}
