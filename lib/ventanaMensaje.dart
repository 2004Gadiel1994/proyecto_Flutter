import 'package:flutter/material.dart';

class MyAppventanaMensaje extends StatelessWidget {
  const MyAppventanaMensaje({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter prueba',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePageventanaMensaje(title: 'Mensaje'),
    );
  }
}

class MyHomePageventanaMensaje extends StatefulWidget {
  const MyHomePageventanaMensaje({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageventanaMensaje> createState() => _MyHomePageStateventanaMensaje();
}

class _MyHomePageStateventanaMensaje extends State<MyHomePageventanaMensaje> {
  String grupo = "Grupo # 13";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Grupo # 13',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
