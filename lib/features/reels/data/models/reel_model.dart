class ReelModel {
  int? id;
  String? title;
  String? url;
  String? cdnUrl;
  String? thumbCdnUrl;
  int? userId;
  String? status;
  String? slug;
  String? encodeStatus;
  int? priority;
  int? categoryId;
  int? totalViews;
  int? totalLikes;
  int? totalComments;
  int? totalShare;
  int? totalWishlist;
  int? duration;
  String? byteAddedOn;
  String? byteUpdatedOn;
  dynamic bunnyStreamVideoId;
  String? bytePlusVideoId;
  String? language;
  String? orientation;
  int? bunnyEncodingStatus;
  String? deletedAt;
  int? videoHeight;
  int? videoWidth;
  dynamic location;
  int? isPrivate;
  int? isHideComment;
  String? description;
  String? userFullname;
  String? userUsername;
  String? userProfilePicture;
  String? userProfilePictureCdn;
  String? userDesignation;
  List? userResolutions;
  bool? isLiked;
  bool? isWished;
  bool? isFollow;
  String? videoAspectRatio;
  String? localVideoPath;
  ReelModel(
      {this.id,
      this.title,
      this.url,
      this.cdnUrl,
      this.thumbCdnUrl,
      this.userId,
      this.status,
      this.slug,
      this.encodeStatus,
      this.priority,
      this.categoryId,
      this.totalViews,
      this.totalLikes,
      this.totalComments,
      this.totalShare,
      this.totalWishlist,
      this.duration,
      this.byteAddedOn,
      this.byteUpdatedOn,
      this.bunnyStreamVideoId,
      this.bytePlusVideoId,
      this.language,
      this.orientation,
      this.bunnyEncodingStatus,
      this.deletedAt,
      this.videoHeight,
      this.videoWidth,
      this.location,
      this.isPrivate,
      this.isHideComment,
      this.description,
      this.userFullname,
      this.userUsername,
      this.userProfilePicture,
      this.userProfilePictureCdn,
      this.userDesignation,
      this.userResolutions,
      this.isLiked,
      this.isWished,
      this.localVideoPath,
      this.isFollow,
      this.videoAspectRatio});

  ReelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    cdnUrl = json['cdn_url'];
    thumbCdnUrl = json['thumb_cdn_url'];
    userId = json['user_id'];
    status = json['status'];
    slug = json['slug'];
    encodeStatus = json['encode_status'];
    priority = json['priority'];
    categoryId = json['category_id'];
    totalViews = json['total_views'];
    totalLikes = json['total_likes'];
    totalComments = json['total_comments'];
    totalShare = json['total_share'];
    totalWishlist = json['total_wishlist'];
    duration = json['duration'];
    byteAddedOn = json['byte_added_on'];
    byteUpdatedOn = json['byte_updated_on'];
    bunnyStreamVideoId = json['bunny_stream_video_id'];
    bytePlusVideoId = json['byte_plus_video_id'];
    language = json['language'];
    orientation = json['orientation'];
    bunnyEncodingStatus = json['bunny_encoding_status'];
    deletedAt = json['deleted_at'];
    videoHeight = json['video_height'];
    videoWidth = json['video_width'];
    location = json['location'];
    isPrivate = json['is_private'];
    isHideComment = json['is_hide_comment'];
    description = json['description'];
    userFullname = json['user']['fullname'];
    userUsername = json['user']['username'];
    userProfilePicture = json['user']['profile_picture'];
    userProfilePictureCdn = json['user']['profile_picture_cdn'];
    userDesignation = json['user']['designation'];
    userResolutions = json['user']['resolutions'];
    isLiked = json['is_liked'];
    isWished = json['is_wished'];
    isFollow = json['is_follow'];
    videoAspectRatio = json['video_aspect_ratio'];
    localVideoPath = "";
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'cdn_url': cdnUrl,
      'thumb_cdn_url': thumbCdnUrl,
      'user_id': userId,
      'status': status,
      'slug': slug,
      'encode_status': encodeStatus,
      'priority': priority,
      'category_id': categoryId,
      'total_views': totalViews,
      'total_likes': totalLikes,
      'total_comments': totalComments,
      'total_share': totalShare,
      'total_wishlist': totalWishlist,
      'duration': duration,
      'byte_added_on': byteAddedOn,
      'byte_updated_on': byteUpdatedOn,
      'bunny_stream_video_id': bunnyStreamVideoId,
      'byte_plus_video_id': bytePlusVideoId,
      'language': language,
      'orientation': orientation,
      'bunny_encoding_status': bunnyEncodingStatus,
      'deleted_at': deletedAt,
      'video_height': videoHeight,
      'video_width': videoWidth,
      'location': location,
      'localVideoPath': "",
      'is_private': isPrivate,
      'is_hide_comment': isHideComment,
      'description': description,
      'user': {
        'fullname': userFullname,
        'username': userUsername,
        'profile_picture': userProfilePicture,
        'profile_picture_cdn': userProfilePictureCdn,
        'designation': userDesignation,
        'resolutions': userResolutions,
      },
      'is_liked': isLiked,
      'is_wished': isWished,
      'is_follow': isFollow,
      'video_aspect_ratio': videoAspectRatio,
    };
  }
}
