import 'package:flutter/widgets.dart';
import 'package:pravaler_flutter_teste/app/games/models/game_model.dart';
import 'package:pravaler_flutter_teste/app/games/repository/game_repository.dart';

class GameDetailsController extends ChangeNotifier {

    GameModel gameSingle = GameModel();
    late GameRepository repository;

    GameDetailsController() {
      repository = GameRepository();
    } 

    getGameById(int id) async { 
      gameSingle = await repository.getGameById(id);
      notifyListeners();
    }
}