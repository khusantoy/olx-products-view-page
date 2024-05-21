import 'package:flutter/material.dart';
import 'package:olx_products_view_page/widgets/gallery_view.dart';
import 'package:olx_products_view_page/widgets/list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> products = [
    {
      'title': 'Cobalt mexanika sotiladi Oqrangda 0 km yurgan',
      'image': 'assets/images/cobalt.png',
      'location': 'Toshkent, Shayhontohur tumani',
      'date': '2023-12-03',
      'price': '160 000 000',
      'isLiked': false
    },
    {
      'title': 'Damas yangi 2024 shot',
      'image': 'assets/images/damas.png',
      'location': 'Toshkent, Olmazor tumani',
      'date': '2024-05-14',
      'price': '104 246 166',
      'isLiked': false
    },
    {
      'title': 'Foto aparat Zenit',
      'image': 'assets/images/camera.png',
      'location': 'Toshkent, Shayhontohur tumani',
      'date': '2024-05-12',
      'price': '150 000',
      'isLiked': false
    },
    {
      'title': 'Yandex Termo Sumka Xolati yengi Narxi 250000 so\'m.',
      'image': 'assets/images/yandex.png',
      'location': 'Toshkent, Yakkasaroy tumani',
      'date': '2024-04-23',
      'price': '250 000',
      'isLiked': false
    },
    {
      'title': 'Lenovo, noutbuk ofis uchun, holati yaxshi, windows 10',
      'image': 'assets/images/noutbuk.png',
      'location': 'Toshkent, Yakkasaroy tumani',
      'date': '2024-04-21',
      'price': '1 290 000',
      'isLiked': false
    },
  ];

  List<Map<String, dynamic>> searched = [];

  String view = 'gallery';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF0F0F5),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            title: SizedBox(
              height: 50,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nima qidiryapsiz?',
                ),
                onChanged: (value) {
                  for (var i in products) {
                    if (value.isEmpty) {
                      searched.clear();
                    } else if (i['title']
                            .toLowerCase()
                            .contains(value.toLowerCase()) &&
                        value != '' &&
                        value != ' ') {
                      searched.clear();
                      searched.add(i);
                    }
                    setState(() {});
                  }
                },
              ),
            ),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {
                  if (view != 'gallery') {
                    view = 'gallery';
                  }
                },
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.swap_vert),
                ),
              ),
              PopupMenuButton(
                icon: view == 'gallery'
                    ? const Icon(Icons.menu)
                    : view == 'list'
                        ? const Icon(Icons.format_list_bulleted)
                        : const Icon(Icons.grid_view),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      onTap: () {
                        setState(() {
                          view = 'gallery';
                        });
                      },
                      child: const Text("Gallery"),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        setState(() {
                          view = 'list';
                        });
                      },
                      child: const Text("List"),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        setState(() {
                          view = 'grid';
                        });
                      },
                      child: const Text("Grid"),
                    ),
                  ];
                },
              )
            ],
          ),
        ),
        body: searched.isEmpty
            ? GridView(
                padding: const EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: view == 'grid' ? 2 : 1,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: view == 'gallery'
                      ? 2 / 3
                      : view == 'list'
                          ? 4 / 2.8
                          : 3 / 11,
                ),
                children: [
                  for (var product in products)
                    view == 'gallery'
                        ? GalleryView(
                            title: product['title'],
                            imageName: product['image'],
                            price: product['price'],
                            location: product['location'],
                            date: product['date'],
                            isLiked: product['isLiked'],
                          )
                        : view == 'list'
                            ? ListViewProduct(
                                title: product['title'],
                                imageName: product['image'],
                                price: product['price'],
                                location: product['location'],
                                date: product['date'],
                                isLiked: product['isLiked'],
                              )
                            : GalleryView(
                                title: product['title'],
                                imageName: product['image'],
                                price: product['price'],
                                location: product['location'],
                                date: product['date'],
                                isLiked: product['isLiked'],
                              )
                ],
              )
            : GridView(
                padding: const EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: view == 'grid' ? 2 : 1,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: view == 'gallery'
                      ? 2 / 3
                      : view == 'list'
                          ? 4 / 2.8
                          : 3 / 11,
                ),
                children: [
                  for (var product in searched)
                    view == 'gallery'
                        ? GalleryView(
                            title: product['title'],
                            imageName: product['image'],
                            price: product['price'],
                            location: product['location'],
                            date: product['date'],
                            isLiked: product['isLiked'],
                          )
                        : view == 'list'
                            ? ListViewProduct(
                                title: product['title'],
                                imageName: product['image'],
                                price: product['price'],
                                location: product['location'],
                                date: product['date'],
                                isLiked: product['isLiked'],
                              )
                            : GalleryView(
                                title: product['title'],
                                imageName: product['image'],
                                price: product['price'],
                                location: product['location'],
                                date: product['date'],
                                isLiked: product['isLiked'],
                              )
                ],
              ),
      ),
    );
  }
}
