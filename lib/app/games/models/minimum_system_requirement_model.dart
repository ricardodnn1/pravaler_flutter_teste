class MinimumSystemRequirementsModel {
  String? os;
  String? processor;
  String? memory;
  String? graphics;
  String? storage;

  MinimumSystemRequirementsModel(
      {this.os, this.processor, this.memory, this.graphics, this.storage});

  MinimumSystemRequirementsModel.fromJson(Map<String, dynamic> json) {
    os = json['os'];
    processor = json['processor'];
    memory = json['memory'];
    graphics = json['graphics'];
    storage = json['storage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['os'] = this.os;
    data['processor'] = this.processor;
    data['memory'] = this.memory;
    data['graphics'] = this.graphics;
    data['storage'] = this.storage;
    return data;
  }
} 