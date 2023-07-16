import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/meal_recipee.dart';
import 'package:meals_app/widgets/meal_list.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.meal,
    required this.title,
    required this.fav,
    required this.consist,
  });
  final List<Meal> meal;
  final String title;
  final void Function(Meal meal) fav;
  final List<Meal> consist;

  void navigatefrommeal(BuildContext context, Meal meals) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MealRecipee(
        meals: meals,
        fav: fav,
        consist: consist,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: meal
            .map((meals) => MealList(
                  meals: meals,
                  navigaterecipee: () {
                    navigatefrommeal(context, meals);
                  },
                ))
            .toList(),
      ),
    );

    if (meal.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Uhho......nothing to show.",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "try selecting another category.",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(title),
        ),
        body: content);
  }
}
