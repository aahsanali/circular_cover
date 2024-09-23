import 'package:cv/circle_custom_painter.dart';
import 'package:cv/menu_item.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Circular Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final menuList = [
    MenuItem(title: "Menu", iconName: "documents_icon.png"),
    MenuItem(title: "Documents", iconName: "documents_icon.png"),
    MenuItem(title: "About", iconName: "documents_icon.png"),
    MenuItem(title: "Share", iconName: "documents_icon.png"),
    MenuItem(title: "Settings", iconName: "documents_icon.png"),
    MenuItem(title: "Medications", iconName: "documents_icon.png"),
  ];
  final centerImageWidthHeight = 100.0;

  final double menuSize = 320.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: 100,
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: menuSize,
                        height: menuSize,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomPaint(
                              size: Size(menuSize, menuSize),
                              painter: CircleCustomPainer(
                                  count: menuList.length,
                                  backgroundColor: Colors.blue),
                            ),
                            Center(
                              child: getWidgetsForCirculrMenu(
                                context,
                                menuList,
                                const Size(320, 320),
                              ),
                            ),
                            Container(
                              width: centerImageWidthHeight,
                              height: centerImageWidthHeight,
                              clipBehavior: Clip.hardEdge,
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Container(
                                child: Image.asset(
                                  "assets/icons/dp.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getWidgetsForCirculrMenu(
      BuildContext context, List<MenuItem> menuList, Size size) {
    List<Widget> list = [];

    if (menuList.isEmpty) {
      return Container();
    }
    for (var i = 0; i < menuList.length; i++) {
      var o = (2 * i * pi) / menuList.length;
      o = o + ((360 / menuList.length) / 57.2958) / 2;
      var x = (size.width / 3) * cos(o) + (size.width / 2);
      var y = (size.width / 3) * sin(o) + (size.height / 2);

      list.add(Positioned.fromRect(
        rect: Rect.fromCenter(center: Offset(x, y), height: 100, width: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                        "assets/icons/${menuList.elementAt(i).iconName}",
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      menuList.elementAt(i).title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
    }

    return Container(
      width: 300,
      height: 300,
      alignment: Alignment.center,
      child: Stack(
        children: list,
      ),
    );
  }
}
