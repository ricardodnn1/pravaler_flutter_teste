import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pravaler_flutter_teste/app/games/presenter/details/controller/game_details_controller.dart';
import 'package:provider/provider.dart';

class GameDetailsPage extends StatefulWidget {

  final int id;
  const GameDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<GameDetailsPage> createState() => _GameDetailsPageState();
}

class _GameDetailsPageState extends State<GameDetailsPage> {
  
  @override
  Widget build(BuildContext context) {
    var controller = context.watch<GameDetailsController>();
    controller.getGameById(widget.id);
    var size = MediaQuery.of(context).size;

    return controller.gameSingle.title == null ? const Center(child: CircularProgressIndicator()) :  Scaffold(
      appBar: AppBar(
        title: Text(controller.gameSingle.title!),
        backgroundColor: const Color(0xFF272b30),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(controller.gameSingle.thumbnail!),
                const SizedBox(height: 20),
                Text(controller.gameSingle.title!, style: GoogleFonts.poppins(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600)),
                const SizedBox(height: 5),
                Text("Plataforma: ${controller.gameSingle.platform!}", style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400)),
                const SizedBox(height: 5),
                Text("Breve descrição:", style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600)),
                Text(controller.gameSingle.shortDescription!, softWrap: true, maxLines: 30, style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400)),
                const SizedBox(height: 15),
                Text("Descrição:", style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600)),
                const SizedBox(height: 5),
                Text(controller.gameSingle.description!, softWrap: true, maxLines: 30, style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400)),
                const SizedBox(height: 5),
                Text("Genero: ${controller.gameSingle.genre!}", softWrap: true, maxLines: 30, style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400)),
                const SizedBox(height: 15),
                Text("Publicado: ${controller.gameSingle.publisher}", softWrap: true, maxLines: 30, style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400)),
                const SizedBox(height: 15),
                Text("Desenvolvido: ${controller.gameSingle.developer}", softWrap: true, maxLines: 30, style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400)),
                const SizedBox(height: 15),
                Text("Lançamento: ${controller.gameSingle.releaseDate!}", style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400)),
                const SizedBox(height: 15),
                Text("Requisitos minimus:", style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600)),
                const SizedBox(height: 15),
                Text("Sistema Operacional: ${controller.gameSingle.minimumSystemRequirements!.os}", style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400)),
                const SizedBox(height: 5),
                Text("Processador: ${controller.gameSingle.minimumSystemRequirements!.processor}", style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400)),
                const SizedBox(height: 5),
                Text("Memoria RAM: ${controller.gameSingle.minimumSystemRequirements!.memory}", style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400)),
                const SizedBox(height: 5),
                Text("Grafico: ${controller.gameSingle.minimumSystemRequirements!.graphics}", style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400)),
                const SizedBox(height: 5),
                Text("Espaço em disco: ${controller.gameSingle.minimumSystemRequirements!.storage}", style: GoogleFonts.poppins(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400)),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   ...controller.gameSingle.screenshots!.map((e) => Image.network(e.image!, width: size.width / 3.2))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}