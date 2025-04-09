class HomeModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;

  HomeModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = (json['price'] as num?)?.toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    return data;
  }
}
