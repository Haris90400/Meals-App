import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegeterian, vegan }

class FiltersScreen extends StatefulWidget {
  final Map<Filter, bool> curentFilters;

  FiltersScreen({super.key, required this.curentFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFreeFilterSet = false;
  var lactoseFreeFilterSet = false;
  var vegeterianFreeFilterSet = false;
  var veganFreeFilterSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    glutenFreeFilterSet = widget.curentFilters[Filter.glutenFree]!;
    lactoseFreeFilterSet = widget.curentFilters[Filter.lactoseFree]!;
    vegeterianFreeFilterSet = widget.curentFilters[Filter.vegeterian]!;
    veganFreeFilterSet = widget.curentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: glutenFreeFilterSet,
            Filter.lactoseFree: lactoseFreeFilterSet,
            Filter.vegeterian: veganFreeFilterSet,
            Filter.vegan: veganFreeFilterSet
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  glutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free items',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free items',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegeterianFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  vegeterianFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegeterian items',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: veganFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  veganFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegan items',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
