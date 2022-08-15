import 'package:flutter/material.dart';
import 'package:emergencia190/src/services/utils_services.dart';

class Other1Tab extends StatefulWidget {
  const Other1Tab({Key? key}) : super(key: key);

  @override
  State<Other1Tab> createState() => _Other1TabState();
}

class _Other1TabState extends State<Other1Tab> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Text('Página 1'),
      ),
    );
  }
}
