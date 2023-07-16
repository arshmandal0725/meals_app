import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';

class MealRecipee extends StatefulWidget {
  const MealRecipee(
      {super.key,
      required this.meals,
      required this.fav,
      required this.consist});
  final Meal meals;
  final void Function(Meal meal) fav;
  final List<Meal> consist;

  @override
  State<MealRecipee> createState() => _MealRecipeeState();
}

class _MealRecipeeState extends State<MealRecipee> {
  IconData iconButton() {
    final isSelected = widget.consist.contains(widget.meals);
    IconData icon = Icons.favorite_border;
    setState(() {
      icon = isSelected ? Icons.favorite : Icons.favorite_border;
    });
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                  onPressed: () {
                    widget.fav(widget.meals);
                    iconButton();
                  },
                  icon: Icon(iconButton())))
        ],
        centerTitle: false,
        title: Text(widget.meals.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
                tag: widget.meals.id,
                child: Image(image: NetworkImage(widget.meals.imageUrl))),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Ingridients",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 20,
            ),
            for (final ingridient in widget.meals.ingredients)
              Text(
                ingridient,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            const SizedBox(
              height: 30,
            ),
            Text("Recipe",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(
              height: 20,
            ),
            for (final recipe in widget.meals.steps)
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  recipe,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
          ],
        ),
      ),
    );
  }
}
