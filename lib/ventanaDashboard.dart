import 'package:flutter/material.dart';
import 'package:proyecto/ventanaHttp.dart';
import 'package:proyecto/ventanaInicio.dart';

class MyAppventanaDashboard extends StatelessWidget {
  const MyAppventanaDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter prueba',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePageventanaDashboard(title: 'Dashboard'),
       routes: {
       '/ventanafromulario': (context) => const MyHomePageventanaHttp(title: 'Registrarse'),
        '/ventanaDashboard': (context) => const MyHomePageventanaDashboard(title: 'Iniciar Sesión'),
      }
    );
  }
}

class MyHomePageventanaDashboard extends StatefulWidget {
  const MyHomePageventanaDashboard({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageventanaDashboard> createState() => _MyHomePageStateventanaDashboard();
}

class _MyHomePageStateventanaDashboard extends State<MyHomePageventanaDashboard> {
  String grupo = "Grupo # 13";

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Dashboard'),
        
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 7, 210, 255),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.auto_graph),
            icon: Icon(Icons.graphic_eq),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(label: Text('1'), child: Icon(Icons.messenger_sharp)),
            label: 'Messages',
          ),
            NavigationDestination(
            selectedIcon: Icon(Icons.http),
            icon: Icon(Icons.http_outlined),
            label: 'Http',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const MyAppInicio(),

        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                 
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',
                 
                ),
              ),
            );
          },
        ),
        const MyAppventanaHttp(),
      ][currentPageIndex],
    );
  }
}

