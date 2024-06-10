import 'package:hive/hive.dart';

// part 'product.g.dart'; // Part file for Hive code generation

@HiveType(typeId: 0) // Specify Hive type ID for this class
class Product extends HiveObject {
  @HiveField(0)
  final String img;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String price;

  @HiveField(4)
  final String rating;

  Product({
    required this.img,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
  });
}
