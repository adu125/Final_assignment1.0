import 'Map_design.dart';
import 'Inventory.dart';

class Player {
  String name;
  List<Item> inventory = [];

  Player({this.name = ''});

  // Method to pick up an item from a room and add it to the player's inventory
  void pickupItem(Room room, String itemName) {
    Item? item = room.getItem(itemName);
    if (item != null) {
      inventory.add(item);
      room.items.remove(itemName);
      print('Picked up $itemName.');
    } else {
      print('Item $itemName not found in the room.');
    }
  }

  // Method to store an item in the player's inventory
  void storeItemsInInventory(Item item) {
    inventory.add(item);
    print('${item.name} has been added to your inventory.');
  }

  // Method to get the description of an item in the player's inventory
  void itemDescription(String itemName) {
    Item item = getInventoryItem(itemName);
    print(item.description);
  }

  // Method to list all items in the player's inventory
  void itemsInInventory() {
    if (inventory.isNotEmpty) {
      print('Items in your inventory:');
      for (var item in inventory) {
        print('- ${item.name}');
      }
    } else {
      print('Your inventory is empty.');
    }
  }

  // Method to get an item from the player's inventory by name
  Item getInventoryItem(String itemName) {
    var item = inventory.firstWhere(
          (item) => item.name == itemName,
      orElse: () => Item('Unknown', false, 'Item not found in inventory.'),
    );
    return item;
  }
}
