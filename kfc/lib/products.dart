class Products {
  String name;
  String price;
  String imagepath;
  String rating;
  int quantity;

  Products({
    required this.name,
    required this.price,
    required this.imagepath,
    required this.rating,
    this.quantity = 0,
  });

  String get _name => name;
  String get _price => price;
  String get _imagepath => imagepath;
  String get _rating => rating;
}
