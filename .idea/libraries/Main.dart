import 'Map_design.dart';
import 'dart:io';
import 'User_player.dart';

Player currentplayer = Player();

void play() {
  currentplayer = Player();

  print('=================================================================');
  print('                  Welcome to The Haunted Mansion               ');
  print('');
  print('                      What is your name?                       ');
  currentplayer.name = stdin.readLineSync() ?? '';
  stdout.writeln('                          ');

  print('   You awake in a cold mansion. You do not know where you are  ');
  print('                    or what you are doing here                 ');
  if (currentplayer.name.isEmpty) {
    print(' You do not remember your own name                             ');
  } else {
    print('           At least you know that your name is ${currentplayer.name} ');
  }
  print('=================================================================');
  stdin.readLineSync();
}

void main() {
  Navigation navB = Navigation();
  play();
  navB.activeroom = navB.level.entrance; // Initialize activeroom to the entrance room
  navB.doLook();
  navB.looping();
}

class Navigation extends Level {
  Room? activeroom;

  Level level = Level();

  void looping() {
    do {
      doLook();
    } while (activeroom != level.tortureRoom);
    print('Game over');
    exit(0);
  }

  void doLook() {
    print('=================================================================');
    if (activeroom != null) {
      print('|                 You are now in the ${activeroom!.name}              |');
      print('${activeroom!.roomDescription}');
      print('| I can go these directions: ${activeroom!.getAvailableDirNames().join(", ")} or look around |');
      print('=================================================================');
      String? path = stdin.readLineSync();

      if (path == null) {
        print('Goodbye! Exiting game...');
        exit(0);
      }

      if (path == 'look around') {
        print('You see: ${activeroom!.items.keys.join(", ")}');
        if (activeroom == level.kitchen1) {
          print('You found a flashlight!');
          activeroom!.items.remove('Flashlight');
          currentplayer.inventory.add(level.flashlight);
          return doLook();
        }
        if (activeroom == level.Bedroom) {
          print('You found a hidden room! Would you like to enter? (yes/no)');
          String? response = stdin.readLineSync();
          if (response == 'yes') {
            // Add the basement as an available exit from the bedroom
            level.Bedroom.setExit('down', level.Basement);
            // Set the active room to be the basement
            activeroom = level.Basement;
            return doLook();
          } else if (response == 'no') {
            return doLook();
          } else {
            print('Invalid response. Please enter "yes" or "no".');
            return doLook();
          }
        }
        return doLook();
      }

      // Check if the path is forward
      if (path == 'forward') {
        // Check if the active room is the basement and the player has the flashlight
        if (activeroom == level.Basement && !currentplayer.inventory.contains(level.flashlight)) {
          print('A ghost appears! It has now made you one of them. You might want to explore more. There is way to defeat the ghost');
          print('Game over');
          exit(0);
        }
      }

      Room? nextRoom = activeroom!.getExit(path);
      if (nextRoom != null) {
        activeroom = nextRoom;
      } else {
        print('Invalid direction. Please choose another direction.');
      }
    }
  }
}
