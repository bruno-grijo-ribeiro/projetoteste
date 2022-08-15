import 'package:flutter/material.dart';
import 'package:emergencia190/src/services/utils_services.dart';

class Other2Tab extends StatefulWidget {
  const Other2Tab({Key? key}) : super(key: key);

  @override
  State<Other2Tab> createState() => _Other2TabState();
}

class _Other2TabState extends State<Other2Tab> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 2'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Text('Página 2'),
      ),
    );
  }
}
