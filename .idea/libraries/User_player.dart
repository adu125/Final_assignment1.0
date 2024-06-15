import 'Map_design.dart';
import 'Inventory.dart';

class Player {
  String name;
  List<Item> inventory = [];

  Player({this.name = ''});


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


  void storeItemsInInventory(Item item) {
    inventory.add(item);
    print('${item.name} has been added to your inventory.');
  }


  void itemDescription(String itemName) {
    Item item = getInventoryItem(itemName);
    print(item.description);
  }


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

  Item getInventoryItem(String itemName) {
    var item = inventory.firstWhere(
          (item) => item.name == itemName,
      orElse: () => Item('Unknown', false, 'Item not found in inventory.'),
    );
    return item;
  }
}
