import 'package:flutter/material.dart';
import 'package:meals_app/screens/category.dart';

enum Filter { gluttenFree, lactoseFree, vegiterian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.selectedFilter});
  final Map<Filter, bool> selectedFilter;
  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = selctedFilter[Filter.gluttenFree]!;
  bool _isLactoseFree = selctedFilter[Filter.lactoseFree]!;
  bool _isVegiterian = selctedFilter[Filter.vegiterian]!;
  bool _isVegan = selctedFilter[Filter.vegan]!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Filters section'),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop({
              Filter.gluttenFree: _isGlutenFree,
              Filter.lactoseFree: _isLactoseFree,
              Filter.vegiterian: _isVegiterian,
              Filter.vegan: _isVegan
            });
            return false;
          },
          child: Column(
            children: [
              SwitchListTile(
                  title: Text(
                    'Gluten Free',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  value: _isGlutenFree,
                  onChanged: (index) {
                    setState(() {
                      _isGlutenFree = index;
                    });
                  }),
              SwitchListTile(
                  title: Text(
                    'Lactose Free',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  value: _isLactoseFree,
                  onChanged: (index) {
                    setState(() {
                      _isLactoseFree = index;
                    });
                  }),
              SwitchListTile(
                  title: Text(
                    'Vegiterian',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  value: _isVegiterian,
                  onChanged: (index) {
                    setState(() {
                      _isVegiterian = index;
                    });
                  }),
              SwitchListTile(
                  title: Text(
                    'Vegan',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  value: _isVegan,
                  onChanged: (index) {
                    setState(() {
                      _isVegan = index;
                    });
                  })
            ],
          ),
        ));
  }
}
