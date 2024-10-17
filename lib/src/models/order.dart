import './../models/food.dart';

class Order {

    double total = 0.00;
    Map<String, int> quantityItems = <String, int>{};
    List<Food> itemsOrdered = <Food>[];

}
