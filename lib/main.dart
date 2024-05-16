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
  String view = 'gallery';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF0F0F5),
        appBar: AppBar(
          title: const Text('10 dan ortiq e\'lonlar'),
          actions: [
            IconButton(
              onPressed: () {
                if (view != 'gallery') {
                  view = 'gallery';
                }
              },
              icon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.swap_vert)),
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
        body: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: view == 'grid' ? 2 : 1,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: view == 'gallery'
                ? 3 / 4
                : view == 'list'
                    ? 4 / 2.3
                    : 3 / 7.2,
          ),
          children: [
            ...List.generate(10, (index) {
              return view == 'gallery'
                  ? const GalleryView()
                  : view == 'list'
                      ? const ListViewProduct()
                      : const GalleryView();
            })
          ],
        ),
      ),
    );
  }
}
