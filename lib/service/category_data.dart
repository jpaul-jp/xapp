import 'package:myapp/model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [
    CategoryModel(name: "Pizza", image: "images/pizza.png"),
    CategoryModel(name: "Burger", image: "images/burger.png"),
    CategoryModel(name: "Chinese", image: "images/chinese.png"),
    CategoryModel(name: "Mexican", image: "images/tacos.png"),
  ];
  return categories;
}
