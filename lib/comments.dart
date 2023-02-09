import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  static const routeName = "/comments";
  const Comments({super.key});

  static TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: TextField(
            decoration: const InputDecoration(hintText: "Hoge"),
            controller: controller,
          ),
        ),
      ),
    );
  }
}
