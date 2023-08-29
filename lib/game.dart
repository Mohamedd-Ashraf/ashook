import 'dart:core';
import 'dart:math';
import 'player.dart';

class Game {
  static List<Player> game_players = [];
  static List<List<int>> deck_cards = [];
  static List<List<int>> onboard_cards = [
    [1, 2],
    [5,3]
  ];
  static List<List<int>> lastPlayed_cards = [];
  static int current_player_id = 0;
  static int current_playabe_type = 0;
  static bool goodplay = false;
  static bool heIsTrue = true;
  // static Map<int, Player> players = {
  //   0: Player(0, name: "Player 1"),
  //   1: Player(1, name: "Player 2"),
  //   2: Player(2, name: "Player 3"),
  //   3: Player(3, name: "Player 4"),
  // };

  Game(List<Player> players) {
    game_players = players;
    IntiateTheGame();
  }
  // static Player player1 = players[0]!;
  // static Player player2 = players[1]!;
  // static Player player3 = players[2]!;
  // static Player player4 = players[3]!;
  static busting(int PlayerID) {
    // deck_cards = generateAndShuffleDeck();
    // player2.player_cards.add(Card(values: [] /* card details here */));
    // players[PlayerID].player_cards.addAll(onboard_cards);
    // print(PlayerID);

    print(
        "**********************THE ${game_players[PlayerID]!.name} DECK before shook *************************\n ${game_players[PlayerID]!.player_cards}");
    game_players[PlayerID]!.player_cards.addAll(onboard_cards);
    print(
        "**********************THE ${game_players[PlayerID]!.name} DECK after shook *************************\n ${game_players[PlayerID]!.player_cards}");

    onboard_cards = [];
    // game_players.;
    //شيل كل اللي على الأرض حطهوله
  }

  //TODO باصي ايدي اللاعب الل هيشك
  static checkingTheShook(int ShookedPlayerID) {
    print("lastPlayed_cards $lastPlayed_cards");
    for (List<int> card in lastPlayed_cards) {
      if (heIsTrue) {
        for (int val in card) {
          if (val == current_playabe_type) {
            goodplay = true;
            heIsTrue = true;
            break;
          } else {
            heIsTrue = false;

            continue;
          }
        }
      } else {
        break;
      }
    }
    // card.contains(current_playabe_type);
    if (heIsTrue) {
      //TODO
      print("He Was Right");
      busting(ShookedPlayerID);
    } else {
      print("He truly lied");
      busting(ShookedPlayerID-1);
    }
  }

  CallingThePlayer() {
    for (var player in game_players) {
      print(
          "**********************THE ${player.name} DECK *************************\n ${player.player_cards}");

      player.playTurn(false);
    }
  }

  IntiateTheGame() {
    //fill the card dick
    for (int side1 = 0; side1 <= 6; side1++) {
      // Loop through each possible value for the second side of the domino
      for (int side2 = side1; side2 <= 6; side2++) {
        // Create a new domino card as a list with two values
        List<int> card = [side1, side2];

        // Add the domino card to the deck
        deck_cards.add(card);
      }
    }
  }

  // Function to generate and shuffle the deck of domino cards
  generateAndShuffleDeck() {
    // List<List<int>> deckCards = [];

    // Generate the deck of domino cards as shown in the previous answer
    IntiateTheGame();

    // Shuffle the deck using the Fisher-Yates algorithm
    final random = Random();
    for (int i = deck_cards.length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);
      final temp = deck_cards[i];
      deck_cards[i] = deck_cards[j];
      deck_cards[j] = temp;
    }

    // Distribute seven cards to each player
    for (int i = 0; i < 7; i++) {
      for (Player player in game_players) {
        player.player_cards.add(deck_cards.removeLast());
      }
    }
    print(
        "**********************THE GAME DECK *************************\n $deck_cards");
    // deck_cards = deck_cards;
  }
}
