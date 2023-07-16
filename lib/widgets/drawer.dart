import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.navigateFilter});
  final void Function() navigateFilter;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lunch_dining,
                  size: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Cooking Time",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20),
                )
              ],
            )),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 30,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text(
            "Filter",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          onTap:navigateFilter,
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            size: 30,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text(
            "Back",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
