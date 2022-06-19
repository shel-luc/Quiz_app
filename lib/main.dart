import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  List<Map<String, dynamic>> atik = [
    {
      "id": 1,
      "tit": "Aprann pwograme ak Python",
      "kontni": "Mwen se Python",
      "koule": const Color(0xffb74093),
    },
    {
      "id": 2,
      "tit": "Aprann pwograme ak JavaScript",
      "kontni": "Mwen se JavaScript",
      "koule": const Color(0xffb74093),
    },
    {
      "id": 3,
      "tit": "Aprann kreye pwòp aplikasyon w",
      "kontni": "Mwen se pwogramè",
      "koule": const Color(0xffb74093),
    },
  ];

  void efase(id) {
    // i got error with this code
    atik.removeWhere((element) => element["id"] == id);

    print(atik);

    atik.add(
      {
        "id": 3,
        "tit": "Aprann kreye pwòp aplikasyon w",
        "kontni": "Mwen se pwogramè",
        "koule": const Color(0xffb74093),
      },
    );
    print(atik);
  }

  @override
  Widget build(BuildContext context) {
    int selected = 0;
    void _changeIndex(int index) {
      selected = index;
      print(selected);
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('First Quiz'),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ],
            leading: GestureDetector(
              child: const Icon(Icons.menu),
              onDoubleTap: () {},
              onTap: () {},
              onLongPress: () {},
            ),
            actionsIconTheme:
                const IconThemeData(color: Colors.yellow, opacity: 3, size: 20),
          ),
          body: Column(
              children: atik
                  .map((e) => Column(children: [
                        Text(e["tit"],
                            style: const TextStyle(
                                fontSize: 19, color: Color(0xffb74093))),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(e["kontni"],
                            style: const TextStyle(
                                fontSize: 12, color: Color(0xffb74093))),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            efase(e["id"]);
                          },
                          child: const Text("efase"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ]))
                  .toList()),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selected,
              onTap: _changeIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.yellow,
                  ),
                  label: "Play",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.playlist_play,
                      color: Colors.yellow,
                    ),
                    label: "List"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.chat,
                      color: Colors.yellow,
                    ),
                    label: "Chat"),
              ]),
        ));
  }
}
