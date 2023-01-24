﻿class ScreenshotModel {
  int? id;
  String? image;

  ScreenshotModel({this.id, this.image});

  ScreenshotModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}