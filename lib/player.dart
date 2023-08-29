import 'dart:io';
import 'game.dart';

class Player {
  final String name;
  final int id;
  int Score = 0;
  List<List<int>> player_cards = []; // Specify the type as List<int>

  Player(this.id, {required this.name});

  playTurn(bool starting) {
    print("Tshook fe elle 2ablk ? : 0 means laa 1 means aah 2 means SKIP");
    int isShooking = int.parse(stdin.readLineSync()!);
    if (isShooking == 0) {
    Game.lastPlayed_cards = [];
      print("$name Bynzl be el wara2 \n ");
      print(
          "Enter a list of integers by the values of your cards to play separated by spaces:");

      String? input = stdin.readLineSync();

      List<String> stringList = input!.split(' ');

      for (String str in stringList) {
        try {
          int number = int.parse(str);

          int n1 = number ~/ 10; // Get the first digit
          int n2 = number % 10; // Get the second digit

          // Check if the player has the card they're trying to play
          bool truePlay = false;

          for (List<int> card in player_cards) {
            if ((card[0] == n1 && card[1] == n2) ||
                (card[0] == n2 && card[1] == n1)) {
              truePlay = true;
              break;
            }
          }

          if (truePlay) {
            Game.onboard_cards.add([n1, n2]);
            // Game.lastPlayed_cards = [];
            Game.lastPlayed_cards.add([n1, n2]);

            // Remove the played card from the player's hand
            player_cards.removeWhere((card) =>
                (card[0] == n1 && card[1] == n2) ||
                (card[0] == n2 && card[1] == n1));

            print(
                "**********************THE ${name} DECK after turn *************************\n ${player_cards}");
          } else {
            print("Invalid input: $str مش معاك اصلا يسطا");
            return;
          }
        } catch (e) {
          print("Invalid input: $str is not a valid integer.");
          return;
        }
      }
      //Todo check if played
      print(
          "********************** WHAT IS THE MOST VALUE IN YOUR CARDS  *************************\n ");
      Game.current_playabe_type = int.parse(stdin.readLineSync()!);
    } else if (isShooking == 1) {
      ashook();
    } else if (isShooking == 2) {
      print("$name SKIPPED");
    }
  }

  ashook() {
    print("$name byshook");
    Game.checkingTheShook(id);
  }
}
