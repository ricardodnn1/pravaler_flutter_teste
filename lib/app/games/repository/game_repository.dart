import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pravaler_flutter_teste/app/games/models/game_model.dart';

class GameRepository {

    List<GameModel> gamesList = [];

    Future<List<GameModel>> getAllGames() async {
      var client = http.Client(); 
      gamesList = [];
      var url = Uri.parse("https://www.freetogame.com/api/games");

      var response = await client.get(
          url,  
      );  

      if(response.statusCode == 200) {
        var jsonResult = jsonDecode(response.body);
        gamesList = jsonResult.map<GameModel>((json) => GameModel.fromJson(json)).toList();
        return gamesList;
      }

      return gamesList;
    }
    
    Future<List<GameModel>> getSearchGames(String textSearch) async {
      var client = http.Client(); 
      gamesList = [];

      var url = Uri.parse("https://www.freetogame.com/api/filter?tag=${textSearch.replaceAll(" ", ".")}");

      print(url);
      var response = await client.get(
        url,  
      );  

      if(response.statusCode == 200) {
        var jsonResult = jsonDecode(response.body);
        gamesList = jsonResult.map<GameModel>((json) => GameModel.fromJson(json)).toList();
        return gamesList;
      }

      return gamesList;
    }
    
    Future<GameModel> getGameById(int id) async {
      var client = http.Client(); 

      var url = Uri.parse("https://www.freetogame.com/api/game?id=$id"); 

      var response = await client.get(
          url,  
      );  

      if(response.statusCode == 200) {
        var jsonResult = jsonDecode(response.body); 
        return GameModel.fromJson(jsonResult);
      }

      return GameModel();
    }

}