import 'package:myapp/model/pizza_model.dart';

List<PizzaModel> getPizza() {
  List<PizzaModel> pizza = [];
  PizzaModel pizzaModel = PizzaModel();

  pizzaModel.name = "Cheese Pizza";
  pizzaModel.image = "images/pizza1.png";
  pizzaModel.price = "10.99";
  pizza.add(pizzaModel);
  pizzaModel = PizzaModel();

  pizzaModel.name = "Margherita";
  pizzaModel.image = "images/pizza2.png";
  pizzaModel.price = "12.99";
  pizza.add(pizzaModel);
  pizzaModel = PizzaModel();

  return pizza;
}
