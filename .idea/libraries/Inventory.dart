class Item {
  String name;
  bool usable;
  bool needsItem;
  String description;

  Item(this.name, this.usable, this.description, {this.needsItem = false});

  String Name() {
    return name;
  }

  bool canUse() {
    return usable;
  }

  String getDescription() {
    return description;
  }

  @override
  String toString() {
    return description;
  }
}
