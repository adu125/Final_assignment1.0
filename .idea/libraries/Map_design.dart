import 'Inventory.dart';
import 'Main.dart';
import 'User_player.dart';

class Room {
  String name;
  String roomDescription;
  Map<String, Room> rooms = {};
  Map<String, Item> items = {};
  List<Item> inventory = [];

  Room(this.name, this.roomDescription);

  void setExit(String direction, Room room) {
    rooms[direction] = room;
  }

  String getDescription() {
    return roomDescription;
  }

  void setItem(Item item) {
    items[item.name] = item;
  }

  List<Item> getInventory() {
    return inventory;
  }

  Item takeItem(String name) {
    Item? temp;
    for (Item _item in inventory) {
      if (_item.name == name) {
        temp = _item;
        break;
      }
    }
    if (temp != null) {
      inventory.remove(temp);
    }
    return temp ?? Item('none', false, 'Item not found');
  }

  Item? getItem(String itemName) {
    return items[itemName];
  }

  void addItem(Item item) {
    inventory.add(item);
  }

  void addItems(List<Item> newItems) {
    for (Item i in newItems) {
      inventory.add(i);
      print('You found an item!');
    }
  }

  Room? getExit(String dirName) {
    return rooms[dirName];
  }

  List<String> getAvailableDirNames() {
    return rooms.keys.toList();
  }

  List<String> getAvailableItems() {
    return items.keys.toList();
  }

  void describe() {
    print(roomDescription);
  }
}

class Level {
  Room kitchen1 = Room(
    'Kitchen',
      'The room is dark with no windows but the \n light from the hallway shows that it must be a small kitchen. \nYou see a small stove and a sink and at the end of the room are some tables with pots and pans.\nThere are two doors in the room, one immediately to the right \nand the other between the tables at the end of the room.'
  );
  Room storage = Room(
    'The Storage',
      'This room is even darker than the kitchen \nand it takes a minute for your eyes to adjust\n to the dark. When your eyes finally adjust you notice a couple\nof barrels against the wall in front of you.\nThis must be a storage room. There is a large crate on\nyour right and between it and the crates in \nfront of you is a path leading to a door\nat the end of the room.'
  );
  Room familyRoom = Room(
    'The Family Room',
      "this is a well-lit room, full of natural \nlight coming in from five different windows.\nThere is a big red sofa in the middle of the room.  The sofa is facing a large fireplace\n with a coffee table and\ntwo chairs in between. All the furniture in the room are antique furniture, \neverything from the sofa set in front of the fireplace to the desk and chair\nin the corner of the room.",
  );
  Room Bar = Room(
    'The Bar',
"The bar is a dimly lit abyss, a place where shadows cling to every\n corner. The air is thick with the smell of stale beer and an\n underlying scent of something rotten, something long dead. The\n bar counter, scarred and worn, is sticky to the touch, as if it\n hasn't been cleaned in years. Dim, \nflickering lights hang from the ceiling, casting a sickly\n yellow glow that does little to dispel the darkness. The bottles\n behind the bar are covered in a fine layer of dust, their\n contents murky and uninviting. The emptiness is palpable, oppressive. No voices, no laughter,\n only the faint hum of old, malfunctioning appliances. Each creak\n of the floorboards sounds unnaturally loud, echoing in the\n silence. A row of empty stools stretches along the counter, their\n cushions torn and stuffing peeking through. A single, cracked\n mirror behind the bar reflects the desolation, its surface\n smeared and cloudy. The air feels thick, almost suffocating, as if the walls are\n closing in. The oppressive silence and the weight of unseen eyes\n make it clear: this bar has secrets, and it's been waiting for\n someone to discover them."
  );
  Room entrance = Room(
    'The Entrance',
    "As you approach the entrance, a sense of dread grips you. The grand double\n doors, scarred and splintered, loom like the maw of some ancient beast. The\n brass handles, cold and tarnished, seem to beckon you forward with skeletal\n fingers. Above, a decaying chandelier sways gently, casting eerie shadows that\n dance like malevolent spirits. \nThe air is thick with the stench of mold and\n decay, mixed with a faint metallic tang. Each step you take on the cracked\n tiles echoes ominously, as if the house itself is aware of your presence. The\n faded wallpaper peels away in long, curling strips, revealing dark stains that\n hint at unspeakable horrors. An oppressive silence fills the space, broken only\n by the occasional creak of unseen footsteps. Cobwebs drape the corners like\n ghostly veils, and the shadows seem to writhe with a life of their own. As\n you stand before the entrance, a chill runs down your spine, and you can’t shake\n the feeling that something malevolent is watching, waiting for you to cross the\n threshold into darkness." );


  Room hallway1 = Room(
    'The Hallway from Entrance',
"The hallway stretches out before you, a narrow passage of shadow and\n unease. The walls are cloaked in a thick layer of dust and grime, with faded\n portraits staring down with hollow eyes. To your left and right, old wooden\n doors stand ajar, their darkened frames like gaping mouths ready to swallow\n you whole. The floorboards creak beneath your feet, \neach step sending shivers\n through the silence. A cold draft snakes through the hall, carrying whispers\n that seem to come from nowhere and everywhere at once. The flickering light\n casts twisted shadows that play tricks on your mind. On the left, the door\n opens to a room exuding dread, while the door on the right reveals nothing\n but impenetrable darkness. The air is thick with the smell of mildew and\n something far more sinister, making your skin crawl and heart race. Every\n fiber of your being screams to turn back, but the hallway beckons you deeper\n into its maw. You can't shake the feeling that unseen eyes are watching,\n following your every move, waiting to strike."

  );
  Room livingroom = Room(
    'The Livingroom',
"The living room is frozen in time, a solemn sanctuary of \nforgotten memories. Heavy curtains veil the windows, casting the \nroom in perpetual twilight. Shadows dance across faded furniture, their movements \na silent testament to the passage of time. An ancient armchair \nsits nestled in the corner, its once-plush upholstery now threadbare \nand worn. Dust hangs thick in the air, swirling with each \nhesitant step. A grandfather clock stands sentinel against the wall, \nits hands motionless, yet its eerie tick-tock fills the silence \nwith a haunting rhythm. Portraits of unknown ancestors line the walls, \ntheir eyes following your every move with ghostly intensity. The \nfireplace stands cold and empty, its mantle adorned with relics \nof a bygone era. In this sepulchral space, the whispers of \nthe past linger, their meaning lost to time. Every creak of \nthe floorboards is a reminder of the house's silent watch, \nits secrets hidden in the shadows."
  );
  Room frontDoor = Room('The Front Door', 'It\'s locked, you will have to find a key');
  Room tortureRoom = Room(
    'The Torture Room',
    "You get chills as soon as you open the door.\nThe room is cold, dark and empty except for a strange device in\nthe middle of the room. Under the strange device is a large drain\nand there are blood splatters on the walls. This room gives you the\nheebie-jeebies.",
  );
  Room hallway2 = Room(
    'Hallway',
    "You enter another hallway, this one with a horrible pink carpet\non the floor. The hallway leads in two directions. \nStraight ahead there are five doors, two\non either side and one at the end. To the left there is only\none door at the end of the hallway.",
  );
  Room Laundry = Room(
    'Laundry',
      "The laundry room lies dormant, a forgotten chamber lost in time.\nCold, concrete walls echo the whispers of the past, their silence deafening.\nThe air hangs heavy with the scent of dampness, \na suffocating embrace that clings to every surface.\nCobwebs drape the corners like veils of forgotten dreams, \ntheir delicate threads trembling in the stillness.\nBroken appliances stand as monuments to neglect, \ntheir rusted forms haunting the shadows.\nTattered curtains flutter in the breeze, \ncasting eerie silhouettes upon the floor.\nIn this desolate space, time stands still, trapped in a perpetual cycle of decay."
  );
  Room Bedroom = Room(
    'Bedroom',
"The bedroom lies cloaked in shadow,\nits silent corners a sanctuary for\nthe unknown. The air is thick\nwith the scent of decay, suffocating\nyour senses as you step cautiously\nacross the creaking floorboards. Moonlight\nfilters through tattered curtains, casting\nstrange shapes upon the walls like\ntwisted apparitions from a forgotten\nnightmare. The bed stands like\na tomb in the center of\nthe room, its rotting frame\na stark reminder of the\npassage of time. Cobwebs cling\ntenaciously to every surface, shrouding\nthe room in a veil of\ndarkness that seems to swallow\nthe very essence of light. You\nhesitate, your heart pounding in\nyour chest as you feel\nthe weight of unseen eyes\nwatching your every move. With\na shiver, you realize that\nyou are not alone in\nthis desolate chamber; something lurks\nin the shadows, waiting patiently for\nits next victim. A\nsingle door stands ajar, leading\nto a closet that seems to\nhold secrets darker than the\nnight itself."
  );
  Room Closet = Room(
    'Closet',
    "The closet beckons like a yawning abyss,\nits doors cracked open to reveal\nthe darkness within. Shadows dance\nmalevolently along the walls, twisting and\nwrithing like tendrils of smoke\nin the still air. The scent\nof decay hangs heavy, assaulting\nyour senses with its foul\nstench. You hesitate at the\nthreshold, a sense of foreboding\nclutching at your heart like\nicy fingers. The silence is\noppressive, broken only by the\nsound of your own ragged\nbreathing echoing in the cramped\nspace. You can feel\nthe weight of unseen eyes\nboring into your soul, watching\nand waiting with bated breath.\nTwo doors stand sentinel within\nthe darkness, their surfaces marred\nand scarred as if bearing\nthe marks of countless torments.\nYou know not what lies\nbeyond those doors, but the\nthought of crossing that threshold\nfills you with a primal\nfear. You can sense\nthat something sinister lurks within,\nsomething ancient and hungry, waiting\nto ensnare unwary souls in\nits grasp. With a trembling\nhand, you reach out to\npush open one of the\ndoors, steeling yourself for the\nhorrors that lie beyond.",
  );
  Room Master = Room(
    'Master bedroom',
    "The master room looms in the dim light,\nits grandeur shrouded in shadows that\nseem to dance and whisper secrets\nin the darkness. The air is\nheavy with the scent of\nantiquity, mingling with the faint\nwhisper of something sinister that\nlurks just beyond the threshold.\nYou can feel the weight\nof centuries pressing down upon\nyou, a palpable sense of\nage and history that clings\nto every surface like a\nveil of cobwebs. The room\nis vast and cavernous, its\nwalls adorned with faded tapestries\nand crumbling portraits of long-forgotten\nancestors. A massive canopy bed\nsits in the center of\nthe room, its heavy curtains drawn\nto shield whatever lies within\nfrom prying eyes. To one\nside, a closet looms like\na silent sentinel, its doors\nclosed tight as if guarding\nsome dark and terrible secret.\nOn the other, a single door\nleads out into the hallway,\nbeckoning you with its promise\nof escape. But as you\nstand there, paralyzed by the\nweight of the room's oppressive\natmosphere, you can't shake\nthe feeling that something is\nwatching you from the shadows,\nsomething ancient and malevolent that\nhas haunted this place since\ntime immemorial.",
  );
  Room Office = Room(
    'The Office',
    "The office exudes an aura of oppressive stillness,\nits air thick with the scent of\nold paper and dried ink.\nThe dim light flickers overhead,\ncasting long, shifting shadows that dance\nacross the walls like restless spirits.\nRows of dusty bookshelves line the\nroom, their contents obscured by\nthe gloom, their spines cracked\nand faded with age. A heavy,\nornate desk dominates the center\nof the room, its surface cluttered\nwith yellowed documents and rusting\nimplements, as if the occupant\nabandoned it in haste long\nago. The chairs sit empty,\ntheir cushions worn and threadbare,\ntheir upholstery stained with the\nfaint traces of long-forgotten spills.\nA single window looms in the\nfar corner, its panes grimy\nand opaque, its view obscured\nby the encroaching darkness outside.\nThere is a sense of\nunseen eyes watching from the\nshadows, of whispers echoing in\nthe silence, as if the\nvery walls themselves hold secrets\nthat they are loath to\nreveal. It is a place\nof forgotten dreams and broken\nhopes, a sanctuary for the\nlost and the damned, where\nthe echoes of the past\nlinger like ghosts in the\nshadows, waiting to ensnare the\nunwary in their tangled web\nof deceit and despair."
  );
  Room Basement = Room(
      'Welcome to the Basement',
"The basement is dark and cold. You can't see a thing. \nYou can feel how cold your breath is. \nShiver runs through your spine when a gust comes \nfrom a crack in the ceiling."  );
  Room hallway2_1 = Room(
      'Hallway',
      "The hallway stretches endlessly, its walls\nclosing in like suffocating arms. Faint\nshadows dance along the cracked floor,\nwhispering secrets of forgotten horrors. Cobwebs\ndrape from the ceiling like tattered funeral\nveils, swaying gently in an unseen\nbreeze. The air is thick with\nthe smell of decay, a sickly\nsweetness that clings to your skin\nand fills your lungs with every\nlabored breath. To your right and\nleft, doors loom ominously, their ancient\nwood groaning in protest as you\napproach. Behind you, the staircase\nyawns like a hungry mouth, swallowing\nthe weak light that struggles to\npenetrate the darkness. Each step\nyou take feels like a descent\ndeep into madness, as if the\nhallway itself is alive and plotting\nyour demise"
  );
  Room hallway1_1 = Room(
      'Hallway',
      "In the dim light, the hallway stretches\nendlessly, echoing with the whispers of\nforgotten footsteps. Shadows dance along the\nwalls, twisting and contorting into monstrous\nshapes. The air is heavy with the scent\nof decay, a sickly sweet aroma that\nchokes the senses. Creaking floorboards groan\nunderfoot, protesting the weight of unseen\nburdens. At every turn, doorways yawn open,\nrevealing darkness that seems to swallow the\nlight. To the right and left, solitary\ndoors stand sentinel, their secrets hidden\nbehind ancient wood. In front, a\nstaircase beckons, its steps leading deeper\ninto the abyss.");
  Room hallway1_2 = Room('Hallway', 'Just a plain hallway.');
  Room hallway2_2 = Room('Hallway',
      "The hallway stretches eerily before you,\nits gloomy depths swallowing what little\nlight dares to intrude. The walls\nseem to whisper ancient secrets as\nyou pass, their faded wallpaper peeling\nto reveal the decaying structure beneath.\nTo your right and left, doors\nstand sentinel, their weathered frames\na stark contrast to the desolation\nthat surrounds them. Ahead, a\nmassive window looms like a\ntortured soul trapped in an\nendless nightmare, its glass warped\nand twisted into grotesque shapes.\nThe feeble moonlight filters through,\ncasting eerie shadows that dance across\nthe floor like restless spirits. You\nshudder as a chill creeps\nup your spine, the air\nheavy with the weight of\nunseen eyes watching your every\nmove. With each step forward,\nyou can't shake the feeling\nthat you're being drawn deeper\ninto a realm of darkness from\nwhich there is no escape."
  );
  Room Bathroom_2 = Room('Bathroom', 'The bathroom lies in eerie silence,\nits walls adorned with peeling\nwallpaper, revealing the decaying\nplaster beneath. The air hangs\nheavy with the scent of\nmold and mildew, a damp\nstaleness that seeps into your\nbones. The flickering light casts\nlong, twisted shadows that seem\nto dance and writhe with a\nlife of their own. The tiles\nbeneath your feet are cracked\nand stained with dark, unspeakable\nsubstances, their once-bright colors\nnow faded and worn with\nage. The sink is chipped and\ncracked, its faucet dripping incessantly\ninto a pool of stagnant water\nthat refuses to drain away.\nIn the corner, a shower stands\nshrouded in darkness, its curtain\ndrawn closed as if hiding\nsome terrible secret within. The\nmirror above the sink is\nfogged and streaked with grime,\nits surface warped and distorted,\nreflecting back a twisted, distorted\nimage of yourself. There is\na sense of unease that\nhangs in the air, a feeling\nof being watched by unseen\neyes, of something lurking just\nout of sight, waiting to\npounce when your guard is\ndown. It is a place\nof forgotten nightmares and whispered\nterrors, where the boundary between\nreality and illusion blurs and\nthe darkness within threatens to\nconsume you whole.');

  Room TheExit = Room('The exit', "You have escaped the nightmare, you have defeated\n the ghost of the haunted mansion and are safe again. Your memory\n is slowly coming back and you feel relief");

  Item nothing = Item('Nothing', false, 'Nothing');
  Item key = Item(
    'Key',
    true,
    'An old key that looks like it could be for a large door. \nIt is rusty and heavy in your hand, \nbut the designs on it make you feel like it was \nused for something important.',
  );
  Item knife = Item(
    'Knife',
    true,
    'A strange knife with a wavy blade. \nYou feel a cold chill run down your spine \nas soon as you pick it up',
  );
  Item map = Item(
    'Map',
    true,
    'An old map that seems to be guiding you to a hidden treasure. \nWell, it’s time for an adventure!',
  );
  Item necklace = Item(
    'Necklace',
    true,
    'A pearl necklace. It’s been ages since you’ve seen\nsuch a beautiful piece of jewelry',
  );
  Item flashlight = Item(
    'Flashlight',
    true,
    'A small but powerful flashlight. This might be useful in dark places.',
  );
  bool hasFlashlight(Player player) {
    return player.inventory.contains(flashlight);
  }

  Level() {
    entrance.setExit('forward', hallway1);
    kitchen1.setExit('backward', hallway1_1);
    kitchen1.setExit('right', Laundry);
    Laundry.setExit('left', kitchen1);
    Laundry.setExit('backward', hallway1);
    hallway1.setExit('backward', entrance);
    hallway1.setExit('forward', hallway1_1);
    hallway1.setExit('right', Laundry);
    hallway1.setExit('left', Bar);
    Bar.setExit('right', livingroom);
    Bar.setExit('backward', hallway1);
    livingroom.setExit('right', Bar);
    livingroom.setExit('backward', hallway1_1);
    hallway1_1.setExit('right', kitchen1);
    hallway1_1.setExit('forward', hallway2_1);
    hallway1_1.setExit('left', livingroom);
    hallway2_1.setExit('backward', hallway1_1);
    hallway2_1.setExit('left', Bedroom);
    hallway2_1.setExit('forward', hallway2_2);
    hallway2_1.setExit('right', Bathroom_2);
    Bathroom_2.setExit('forward', hallway2_1);
    Bedroom.setExit('backward', hallway2_1);
    Bedroom.setExit('left', Closet);
    Closet.setExit('left', Master);
    Closet.setExit('right', Bedroom);
    Master.setExit('right', Closet);
    Master.setExit('backward', hallway2_2);
    hallway2_2.setExit('backward', hallway2_1);
    hallway2_2.setExit('right', Master);
    hallway2_2.setExit('left', Office);
    Office.setExit('backward', hallway2_2);
    entrance.setItem(key);
    entrance.setItem(knife);
    entrance.setItem(map);
    entrance.setItem(necklace);
    kitchen1.setItem(flashlight);
    Basement.setExit('forward', TheExit);
  }

  void lookForItems() {
    entrance.setItem(key);
    entrance.setItem(knife);
    entrance.setItem(map);
    entrance.setItem(necklace);
    hallway1.setItem(nothing);
    hallway2.setItem(nothing);
    livingroom.setItem(nothing);
    tortureRoom.setItem(nothing);
    Master.setItem(nothing);
    Bedroom.setItem(nothing);
    Laundry.setItem(nothing);
    Closet.setItem(nothing);
    Office.setItem(nothing);
    hallway2_1.setItem(nothing);
    hallway2_2.setItem(nothing);
    hallway1_1.setItem(nothing);
    hallway1_2.setItem(nothing);
    Bar.setItem(nothing);
    Bathroom_2.setItem(nothing);
    frontDoor.setItem(nothing);
  }
}


