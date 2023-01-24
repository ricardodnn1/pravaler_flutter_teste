import 'package:flutter/material.dart';
import 'package:pravaler_flutter_teste/app/games/presenter/details/controller/game_details_controller.dart';
import 'package:pravaler_flutter_teste/app/games/presenter/games/controller/game_controller.dart';
import 'package:pravaler_flutter_teste/main_widget.dart';
import 'package:provider/provider.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    MultiProvider(
      providers: [  
        ChangeNotifierProvider(create: (context) => GameController()),
        ChangeNotifierProvider(create: (context) => GameDetailsController()),
      ],
      child: const MainWidgetApp(),
    )
  );
} 