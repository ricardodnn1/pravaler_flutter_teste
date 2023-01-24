

import 'package:flutter/material.dart';
import 'package:pravaler_flutter_teste/app/games/presenter/details/game_details.dart';
import 'package:pravaler_flutter_teste/app/games/presenter/games/list_games_page.dart';

class MainWidgetApp extends StatelessWidget {
  const MainWidgetApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pravaler Flutter Teste',
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,   
      initialRoute: '/',
      routes: {
        '/':(context) => const ListGamesPage(),
        '/games':(context) => const ListGamesPage(),
        '/games/details':(context) { 
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return GameDetailsPage(id: args['id']); 
        },
      },
    );
  }
}