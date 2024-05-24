import 'package:audioplayers/audioplayers.dart';

class OnGameState {

  late bool isX;
  late String message;
  late List<String> board;
  final player = AudioPlayer();

  bool isSinglePlayer = true;
  String difficulty = 'easy';

}
