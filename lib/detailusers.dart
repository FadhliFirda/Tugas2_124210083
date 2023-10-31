class DetailUserModel {
  Data? data;
  Support? support;

  DetailUserModel({
    this.data,
    this.support,
  });

  DetailUserModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;
    support = (json['support'] as Map<String,dynamic>?) != null ? Support.fromJson(json['support'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['data'] = data?.toJson();
    json['support'] = support?.toJson();
    return json;
  }
}

class Data {
  int? id;
  String? email;
  String? namaawal;
  String? namaterakhir;
  String? foto;

  Data({
    this.id,
    this.email,
    this.namaawal,
    this.namaterakhir,
    this.foto,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    email = json['email'] as String?;
    namaawal = json['first_name'] as String?;
    namaterakhir = json['last_name'] as String?;
    foto = json['foto'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['email'] = email;
    json['first_name'] = namaawal;
    json['last_name'] = namaterakhir;
    json['foto'] = foto;
    return json;
  }
}

class Support {
  String? url;
  String? text;

  Support({
    this.url,
    this.text,
  });

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'] as String?;
    text = json['text'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['url'] = url;
    json['text'] = text;
    return json;
  }
}