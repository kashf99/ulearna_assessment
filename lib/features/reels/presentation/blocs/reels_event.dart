// reels_event.dart

abstract class ReelsEvent {
  List<Object?> get props => [];
}

class FetchReelEvent extends ReelsEvent {}

class PlayReelEvent extends ReelsEvent {
  final int reelId;

  PlayReelEvent(this.reelId);
}

class PauseReelEvent extends ReelsEvent {
  final int reelId;

  PauseReelEvent(this.reelId);
}

class LikeReelEvent extends ReelsEvent {
  final int reelId;

  LikeReelEvent(this.reelId);

  @override
  List<Object?> get props => [reelId];
}

class LoadMoreReelsEvent extends ReelsEvent {}
