import 'package:pravaler_flutter_teste/app/games/models/minimum_system_requirement_model.dart';
import 'package:pravaler_flutter_teste/app/games/models/screenshot_model.dart';

class GameModel {
  int? id;
  String? title;
  String? thumbnail;
  String? status;
  String? shortDescription;
  String? description;
  String? gameUrl;
  String? genre;
  String? platform;
  String? publisher;
  String? developer;
  String? releaseDate;
  String? freetogameProfileUrl;
  MinimumSystemRequirementsModel? minimumSystemRequirements;
  List<ScreenshotModel>? screenshots;

  GameModel(
      {this.id,
      this.title,
      this.thumbnail,
      this.status,
      this.shortDescription,
      this.description,
      this.gameUrl,
      this.genre,
      this.platform,
      this.publisher,
      this.developer,
      this.releaseDate,
      this.freetogameProfileUrl,
      this.minimumSystemRequirements,
      this.screenshots});

  GameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    status = json['status'];
    shortDescription = json['short_description'];
    description = json['description'];
    gameUrl = json['game_url'];
    genre = json['genre'];
    platform = json['platform'];
    publisher = json['publisher'];
    developer = json['developer'];
    releaseDate = json['release_date'];
    freetogameProfileUrl = json['freetogame_profile_url'];
    minimumSystemRequirements = json['minimum_system_requirements'] != null
        ? new MinimumSystemRequirementsModel.fromJson(
            json['minimum_system_requirements'])
        : null;
    if (json['screenshots'] != null) {
      screenshots = <ScreenshotModel>[];
      json['screenshots'].forEach((v) {
        screenshots!.add(new ScreenshotModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['status'] = this.status;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['game_url'] = this.gameUrl;
    data['genre'] = this.genre;
    data['platform'] = this.platform;
    data['publisher'] = this.publisher;
    data['developer'] = this.developer;
    data['release_date'] = this.releaseDate;
    data['freetogame_profile_url'] = this.freetogameProfileUrl;
    if (this.minimumSystemRequirements != null) {
      data['minimum_system_requirements'] =
          this.minimumSystemRequirements!.toJson();
    }
    if (this.screenshots != null) {
      data['screenshots'] = this.screenshots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}