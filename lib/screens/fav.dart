import 'package:flutter/material.dart';
import 'package:meals_app/screens/category.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/models/meal_model.dart';

class Fav extends StatefulWidget {
  const Fav({super.key});
  @override
  State<StatefulWidget> createState() {
    return FavState();
  }
}

void status(BuildContext context, String message) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
    duration: const Duration(seconds: 1),
  ));
}

class FavState extends State<Fav> {
  int? page;
  List<Meal> meal = [];

  void selectpage(int index) {
    setState(() {
      page = index;
    });
  }

  bool consist = false;
  void addremove(Meal x) {
    final isSelected = meal.contains(x);
    setState(() {
      if (isSelected) {
        meal.remove(x);
        status(context, "An item is removed from favourites.");
      } else {
        meal.add(x);
        status(context, "An item is added to favourites");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activPage = CategoriesScreen(
      fav: addremove,
      consist: meal,
    );
    if (page == 1) {
      activPage = MealScreen(
        meal: meal,
        title: "Favourites",
        fav: addremove,
        consist: meal,
      );
    }
    return Scaffold(
      body: activPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectpage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourite")
        ],
      ),
    );
  }
}
