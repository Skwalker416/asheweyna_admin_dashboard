class Product {
  String? sId;
  String? name;
  String? description;
  int? quantity;
  double? price;
  double? offerPrice;
  ProRef? proCategoryId;
  ProRef? proUsersId;
  ProRef? proVendorId;
  ProTypeRef? proVariantTypeId;
  List<String>? proVariantId;
  List<Images>? images;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Product(
      {this.sId,
      this.name,
      this.description,
      this.quantity,
      this.price,
      this.offerPrice,
      this.proCategoryId,
      this.proUsersId,
      this.proVendorId,
      this.proVariantTypeId,
      this.proVariantId,
      this.images,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price']?.toDouble();
    ;
    offerPrice = json['offerPrice']?.toDouble();
    ;
    proCategoryId = json['proCategoryId'] != null
        ? new ProRef.fromJson(json['proCategoryId'])
        : null;
    proUsersId = json['proUsersId'] != null
        ? new ProRef.fromJson(json['proUsersId'])
        : null;
    proVendorId = json['proVendorId'] != null
        ? new ProRef.fromJson(json['proVendorId'])
        : null;
    proVariantTypeId = json['proVariantTypeId'] != null
        ? new ProTypeRef.fromJson(json['proVariantTypeId'])
        : null;
    proVariantId = json['proVariantId'].cast<String>();
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['offerPrice'] = this.offerPrice;
    if (this.proCategoryId != null) {
      data['proCategoryId'] = this.proCategoryId!.toJson();
    }
    if (this.proUsersId != null) {
      data['proUsersId'] = this.proUsersId!.toJson();
    }
    if (this.proVendorId != null) {
      data['proVendorId'] = this.proVendorId!.toJson();
    }
    if (this.proVariantTypeId != null) {
      data['proVariantTypeId'] = this.proVariantTypeId!.toJson();
    }
    data['proVariantId'] = this.proVariantId;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ProRef {
  String? sId;
  String? name;

  ProRef({this.sId, this.name});

  ProRef.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class ProTypeRef {
  String? sId;
  String? type;

  ProTypeRef({this.sId, this.type});

  ProTypeRef.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    return data;
  }
}

class Images {
  int? image;
  String? url;
  String? sId;

  Images({this.image, this.url, this.sId});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    url = json['url'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['url'] = this.url;
    data['_id'] = this.sId;
    return data;
  }
}
