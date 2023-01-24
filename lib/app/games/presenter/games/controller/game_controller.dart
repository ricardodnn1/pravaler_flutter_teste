import 'package:flutter/widgets.dart';
import 'package:pravaler_flutter_teste/app/games/models/game_model.dart';
import 'package:pravaler_flutter_teste/app/games/repository/game_repository.dart';

class GameController extends ChangeNotifier {

    List<GameModel> gamesList = [];
    late GameRepository repository;
    TextEditingController textSearch = TextEditingController();

    GameController() {
      repository = GameRepository();
      getAllGames();
    }

    getAllGames() async {
      gamesList = await repository.getAllGames();
      notifyListeners();
    }

    getSearchGames() async {
      gamesList = await repository.getSearchGames(textSearch.text);
      notifyListeners();
    }

}