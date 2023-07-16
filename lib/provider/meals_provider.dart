import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/data.dart';

final mealsprovider = Provider((ref) {
  return dummyMeals;
});
