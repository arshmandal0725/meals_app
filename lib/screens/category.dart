import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/filter.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/drawer.dart';
import 'package:meals_app/widgets/grid_item.dart';
import 'package:meals_app/data/data.dart';
import 'package:meals_app/models/model.dart';

const Map<Filter, bool> kInitialFilters = {
  Filter.gluttenFree: false,
  Filter.lactoseFree: false,
  Filter.vegiterian: false,
  Filter.vegan: false,
};
var selctedFilter = kInitialFilters;

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.fav ,required this.consist});
  final void Function(Meal meal) fav;
 final List<Meal> consist;
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        lowerBound: 0,
        upperBound: 1);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void navFilter(BuildContext context) async {
    Navigator.of(context).pop();
    final result = await Navigator.push<Map<Filter, bool>>(context,
        MaterialPageRoute(builder: (ctx) {
      return FilterScreen(
        selectedFilter: selctedFilter,
      );
    }));
    setState(() {
      selctedFilter = result ?? kInitialFilters;
    });
  }

  @override
  Widget build(BuildContext context) {
    var availableMeals = dummyMeals.where((meal) {
      if (selctedFilter[Filter.gluttenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selctedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selctedFilter[Filter.vegiterian]! && !meal.isVegetarian) {
        return false;
      }
      if (selctedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    });
    void navigatemeal(BuildContext context, Category category) {
      final clist = availableMeals
          .where((meals) => meals.categories.contains(category.id))
          .toList();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => MealScreen(
                    meal: clist,
                    title: category.title,
                    fav: widget.fav,
                    consist: widget.consist,
                  )));
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Pick Your Category'),
        ),
        drawer: Drawer(
          child: MainDrawer(
            navigateFilter: () {
              navFilter(context);
            },
          ),
        ),
        body: AnimatedBuilder(
          animation: _animationController,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: availableCategories
                .map((category) => CategoryGridItem(
                      item: category,
                      navigate: () {
                        navigatemeal(context, category);
                      },
                    ))
                .toList(),
          ),
          builder: (context, child) => Padding(
            padding:
                EdgeInsets.only(top: 50 - _animationController.value * 50),
            child: child,
          ),
        ));
  }
}
