import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:pravaler_flutter_teste/app/games/presenter/games/controller/game_controller.dart';
import 'package:provider/provider.dart';

class ListGamesPage extends StatelessWidget {
  const ListGamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = context.watch<GameController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Free To Game List"),
        backgroundColor: const Color(0xFF272b30),
        actions: [
          IconButton(
            onPressed: () {
              controller.changeOrderList();
            },
            icon: const Icon(Icons.sort_by_alpha),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 40,
              width: size.width, 
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(width: .5, color: const Color(0xFFAAAAAA)) 
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * .15,
                    child: IconButton(
                      onPressed: () async { 
                        controller.getSearchGames();
                      }, icon: const Icon(Icons.search))),
                  Container(
                    color: Colors.transparent,
                    width: size.width * .75,
                    child: TextField(    
                      controller: controller.textSearch,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none, 
                        hintText: 'Buscar por titulo, descrição, publicação..',
                        hintStyle: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFAAAAAA)),
                        contentPadding: const EdgeInsets.only(bottom: 5, top: 0)
                      ), 
                      onEditingComplete: () {
                        controller.getSearchGames();
                      }, 
                    ),
                  ),
                ],
              ),
            ), 
            controller.gamesList.isEmpty ? const Center(child: CircularProgressIndicator()) : Expanded(
              child: ListView(
              shrinkWrap: true,
              children: [
                ...controller.gamesList.map((e) => 
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/games/details', arguments: { 'id': e.id  }),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(e.thumbnail!, width: 120),
                          Container(
                            height: 75,
                            padding: const EdgeInsets.only(left: 8), 
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.title!, style: GoogleFonts.poppins(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                                const SizedBox(height: 5),
                                Text(e.platform!, style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400)),
                                const SizedBox(height: 5),
                                Text("Lançamento: ${e.releaseDate}", style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
                ]),
              ),
          ]),
        ),
    );
  } 
}