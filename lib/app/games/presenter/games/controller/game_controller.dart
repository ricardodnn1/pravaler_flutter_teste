import 'package:flutter/widgets.dart';
import 'package:pravaler_flutter_teste/app/games/models/game_model.dart';
import 'package:pravaler_flutter_teste/app/games/repository/game_repository.dart';

class GameController extends ChangeNotifier {

    List<GameModel> gamesList = [];
    List<GameModel> filteredGame = [];
    late GameRepository repository;
    TextEditingController textSearch = TextEditingController();
    bool orderByAsc = false;

    GameController() {
      repository = GameRepository();
      getAllGames();
    }

    getAllGames() async {
      gamesList = await repository.getAllGames();
      notifyListeners();
    }

    getSearchGames() async {
      if(textSearch.text.isNotEmpty) {
        filteredGame = gamesList.where((element) => element.title!.toLowerCase().contains(textSearch.text.toLowerCase()) || element.shortDescription!.toLowerCase().contains(textSearch.text.toLowerCase()) || element.publisher!.toLowerCase().contains(textSearch.text.toLowerCase())).toList();
        gamesList = filteredGame;
      } else {
        getAllGames();
      }

      notifyListeners();
    }

    changeOrderList() {
      gamesList.sort((a, b) => a.title!.compareTo(b.title!));
      orderByAsc = !orderByAsc;
      notifyListeners();
    }

}