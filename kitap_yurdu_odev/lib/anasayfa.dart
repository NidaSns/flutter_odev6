import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tasarim_odev/card.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int secilenIndex = 0;
  final CarouselController _controller = CarouselController();

  List yazarlar = [
    "resimler/ayin_yazarlari/ahmet_ümit.jpg",
    "resimler/ayin_yazarlari/ilber_ortayli.jpg",
    "resimler/ayin_yazarlari/jk_rowling.jpg",
    "resimler/ayin_yazarlari/stefan_zweig.jpg",
    "resimler/ayin_yazarlari/yasar_kemal.jpg",
  ];

  List kategoriler = [
    "resimler/kategoriler/cocuk_kitaplari.png",
    "resimler/kategoriler/edebiyat.png",
    "resimler/kategoriler/egitim.png",
    "resimler/kategoriler/siyaset.png",
    "resimler/kategoriler/tarih.png",
  ];

  List cocukKitaplari = [
    "resimler/cocuk_kitaplari/benim_zurafam_ucabilir.jpg",
    "resimler/cocuk_kitaplari/pera_agaci.png",
    "resimler/cocuk_kitaplari/seker_portakali.jpg",
    "resimler/cocuk_kitaplari/uzaya_giden_tren.jpg",
  ];

  List ilgiGorenler = [
    "resimler/ilgi_gorenler/franz_kafka.jpg",
    "resimler/ilgi_gorenler/kpss.jpg",
  ];
  List kitaplar = [
    "resimler/kitaplar/handan.jpg",
  ];
  List neOkusam = [
    "resimler/ne_okusam/dunya_klasikleri.png",
    "resimler/ne_okusam/en_cok_begenilen.png",
    "resimler/ne_okusam/en_cok_hediye.png",
    "resimler/ne_okusam/en_cok_yorum.png",
    "resimler/ne_okusam/hep_okunanlar.png",
    "resimler/ne_okusam/turk_klasikleri.png",
  ];
  List slaytResim = [
    "resimler/slayt/resim1.png",
    "resimler/slayt/resim2.png",
    "resimler/slayt/resim3.png",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int _current = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Text(
          "kitapyurdu",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        leading: Image.asset("resimler/logo.png"),
        actions: const [
          Icon(Icons.person, color: Colors.black45, size: 30),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              carouselController: _controller,
              items: slaytResim.map((e) {
                return SizedBox(
                  child: Image.asset(
                    e,
                    fit: BoxFit.cover,
                    width: width,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: height * 0.2,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: true,
                autoPlay: true,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: slaytResim.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.orange
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width,
              child: Image.asset("resimler/resim4.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            CardWidget(
              height: height * 0.15,
              baslik: "Yazarlar",
              secilenListe: yazarlar,
            ),
            CardWidget(
              height: height * 0.15,
              baslik: "Kategoriler",
              secilenListe: kategoriler,
            ),
            CardWidget(
              height: height * 0.15,
              baslik: "Ne Okusam?",
              secilenListe: neOkusam,
            ),
            CardWidget(
              height: height * 0.15,
              baslik: "İlgi Görenler",
              secilenListe: ilgiGorenler,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Anasayfa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount),
            label: "Kampanyalar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Kategoriler",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Ara",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_sharp),
            label: "Sepetim",
          ),
        ],
        backgroundColor: Colors.white38,
        currentIndex: secilenIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          setState(() {
            secilenIndex = index;
          });
        },
      ),
    );
  }
}
