class ApiModel {
  List<Data>? data;
  int? code;
  String? message;
  String? imageUrl;

  ApiModel({this.data, this.code, this.message, this.imageUrl});

  ApiModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    code = json['code'];
    message = json['message'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    data['message'] = this.message;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class Data {
  int? id;
  Null? unitId;
  String? code;
  String? name;
  String? featuredImage;
  String? price;
  Null? weight;
  Null? description;
  int? isFeatured;
  int? customizeBox;
  int? status;
  int? createdBy;
  int? updatedBy;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.unitId,
      this.code,
      this.name,
      this.featuredImage,
      this.price,
      this.weight,
      this.description,
      this.isFeatured,
      this.customizeBox,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unitId = json['unit_id'];
    code = json['code'];
    name = json['name'];
    featuredImage = json['featured_image'];
    price = json['price'];
    weight = json['weight'];
    description = json['description'];
    isFeatured = json['is_featured'];
    customizeBox = json['customize_box'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['unit_id'] = this.unitId;
    data['code'] = this.code;
    data['name'] = this.name;
    data['featured_image'] = this.featuredImage;
    data['price'] = this.price;
    data['weight'] = this.weight;
    data['description'] = this.description;
    data['is_featured'] = this.isFeatured;
    data['customize_box'] = this.customizeBox;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
