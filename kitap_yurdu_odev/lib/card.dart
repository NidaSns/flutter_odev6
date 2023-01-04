import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String baslik;
  final List secilenListe;
  final double height;

  const CardWidget(
      {required this.baslik,
      required this.secilenListe,
      required this.height,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10),
            child: Row(
              children: [
                Text(baslik,
                    style: const TextStyle(
                      color: Colors.orange,
                    ),
                    textAlign: TextAlign.left),
                const Spacer(),
                const Text("Tümü",
                    style: TextStyle(color: Colors.orange),
                    textAlign: TextAlign.left),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.orange,
                )
              ],
            ),
          ),
          SizedBox(
            height: height,
            child: ListView.builder(
              itemCount: secilenListe.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(secilenListe[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
