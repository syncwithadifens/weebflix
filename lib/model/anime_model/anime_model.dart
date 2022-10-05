class AnimeModel {
  String? animeId;
  String? animeTitle;
  String? animeImg;
  String? releasedDate;
  String? animeUrl;

  AnimeModel({
    this.animeId,
    this.animeTitle,
    this.animeImg,
    this.releasedDate,
    this.animeUrl,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) => AnimeModel(
        animeId: json['animeId'] as String?,
        animeTitle: json['animeTitle'] as String?,
        animeImg: json['animeImg'] as String?,
        releasedDate: json['releasedDate'] as String?,
        animeUrl: json['animeUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'animeId': animeId,
        'animeTitle': animeTitle,
        'animeImg': animeImg,
        'releasedDate': releasedDate,
        'animeUrl': animeUrl,
      };
}
