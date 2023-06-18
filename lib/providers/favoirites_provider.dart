import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class favouritesMealNotifier extends StateNotifier<List<Meal>> {
  favouritesMealNotifier() : super([]); //Initializing data

  bool toggleMealFavouriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealProvider =
    StateNotifierProvider<favouritesMealNotifier, List<Meal>>(
  (ref) {
    return favouritesMealNotifier();
  },
);
