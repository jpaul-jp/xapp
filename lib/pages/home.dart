import 'package:flutter/material.dart';
import 'package:myapp/model/category_model.dart';
import 'package:myapp/service/category_data.dart';
import 'package:myapp/service/pizza_data.dart';
import 'package:myapp/model/pizza_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<PizzaModel> pizza = [];
  String selectedCategory = "0";

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    pizza = getPizza();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "images/logo.png",
                      height: 50,
                      width: 110,
                      fit: BoxFit.contain,
                    ),
                    Text("Order your favourite food!"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20.0),
                    decoration: BoxDecoration(
                      color: Color(0xffececf8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.search, color: Colors.white, size: 30.0),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    image: categories[index].image!,
                    name: categories[index].name!,
                    categoryindex: index.toString(),
                    selectedCategory: selectedCategory,
                    onTap: () {
                      setState(() {
                        selectedCategory = index.toString();
                      });
                    },
                  );
                },
              ),
            ),
            // ✅ Wrap in Expanded so GridView can scroll inside the Column
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.6,
                ),
                itemCount: pizza.length,
                itemBuilder: (context, index) {
                  return FoodTile(
                    image: pizza[index].image!,
                    name: pizza[index].name!,
                    price: pizza[index].price!.toString(),
                  );
                },
              ),
            ),
          ], // end Column children
        ),
      ),
    );
  }
}

// ✅ Proper StatelessWidget instead of a plain function
class FoodTile extends StatelessWidget {
  final String image, name, price;

  const FoodTile({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            image,
            height: 150,
            width: 150,
            fit: BoxFit.contain,
          ),
          Text(name),
          Text("\$$price"),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String name, image, categoryindex, selectedCategory;
  final VoidCallback onTap;

  const CategoryTile({
    super.key,
    required this.name,
    required this.image,
    required this.categoryindex,
    required this.selectedCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedCategory == categoryindex;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        margin: EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffef2b39) : Color(0xffececf8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              height: isSelected ? 50 : 40,
              width: isSelected ? 50 : 40,
              fit: BoxFit.cover,
            ),
            SizedBox(width: isSelected ? 8.0 : 10.0),
            Text(
              name,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}