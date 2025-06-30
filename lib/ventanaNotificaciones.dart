import 'package:flutter/material.dart';

class MyAppNotificaciones extends StatelessWidget {
  const MyAppNotificaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter prueba',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePageNotificaciones(title: 'Notificaciones'),
    );
  }
}

class MyHomePageNotificaciones extends StatefulWidget {
  const MyHomePageNotificaciones({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageNotificaciones> createState() => _MyHomePageStateNotificaciones();
}

class _MyHomePageStateNotificaciones extends State<MyHomePageNotificaciones> {
  String grupo = "Grupo # 13";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
