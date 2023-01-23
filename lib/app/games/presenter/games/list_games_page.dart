import 'package:flutter/material.dart';

class ListGamesPage extends StatelessWidget {
  const ListGamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
                
            ],
          ),
        ),
      ),
    );
  }
}