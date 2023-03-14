import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  static const routeName = "/comments";
  const Comments({super.key});

  static TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments Screen"),
      ),
      body: Column(
        children: [
          const Text(
            "Hello World",
            style: TextStyle(
              fontSize: 40,
            ),
            key: Key("hello_world"),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 200,
              child: TextField(
                decoration: const InputDecoration(hintText: "comment"),
                controller: controller,
                key: const Key("comment"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
