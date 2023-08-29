import 'game.dart';
import 'player.dart';

void main() {
  // Create instances of Player
  List<Player> players = [
    Player(0, name: "Player 1"),
    Player(1, name: "Player 2"),
    Player(2, name: "Player 3"),
    Player(3, name: "Player 4"),
  ];

  // Create an instance of the Game and pass the players
  Game myGame = Game(players);

  // Generate and shuffle the deck
  myGame.generateAndShuffleDeck();

  // Start the game by calling the player's turns
  myGame.CallingThePlayer();
}
