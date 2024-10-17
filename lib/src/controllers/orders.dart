import './../models/order.dart';
import './../models/food.dart';

Order order = Order();

// Add an item into itemsOrdered
void addItem(Order order, Food food, int quantity) {
  
    // Check if item already exists;
    // if is a new item in the list append to the Map quantityItems
    if (order.quantityItems[food.id] == null || order.itemsOrdered.contains(food)) {
        // New item
        var newItem = <String, int>{food.id : quantity};
        // Update quantityItems
        order.quantityItems.addEntries(newItem.entries);
        // Update total price
        order.total += quantity * food.price;
        return;
    }

    order.itemsOrdered.add(food);

    // Update quantityItems
    order.quantityItems.update(food.id, (value) => value += quantity);
    // Update total price
    order.total += quantity * food.price;
}

// Remove an item from itemsOrdered
void removeItem(Order order, Food food, int quantity) {

    // Check if the item exists
    if (order.itemsOrdered.contains(food) == false || quantity > order.quantityItems[food.id]!) {
        return;
    }
    // Check if quantity is not bigger than the ordered quantity
    order.itemsOrdered.remove(food);

    // Update quantityItems
    order.quantityItems.update(food.id, (value) => value -= quantity);
    // Update total price
    order.total -= quantity * food.price;
}

/*void testOrder(Order order) {
    for (Food food in foods) {
        addItem(order, food, 2);
    }
}*/
