import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/item_icondata.dart';
import 'package:transparent_image/transparent_image.dart';

class MealList extends StatelessWidget {
  const MealList(
      {super.key, required this.meals, required this.navigaterecipee});
  final Meal meals;
  final void Function() navigaterecipee;

  String get upparcomp {
    return meals.complexity.name[0].toUpperCase() +
        meals.complexity.name.substring(1);
  }

  String get upparafford {
    return meals.affordability.name[0].toUpperCase() +
        meals.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: navigaterecipee,
        splashColor: Theme.of(context).primaryColor,
        child: Stack(children: [
          Hero(
            tag: meals.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meals.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        meals.title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextIcon(
                              icon: Icons.schedule,
                              label: '${meals.duration} min'),
                          const SizedBox(
                            width: 25,
                          ),
                          TextIcon(icon: Icons.work, label: upparcomp),
                          const SizedBox(
                            width: 25,
                          ),
                          TextIcon(
                              icon: Icons.price_change_outlined,
                              label: upparafford)
                        ],
                      )
                    ],
                  )))
        ]),
      ),
    );
  }
}
