import 'package:flutter/material.dart';
import 'package:proyecto/ventanaDashboard.dart';
import 'ventanaFormulario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Proyecto'),
      routes: {
        '/ventanafromulario': (context) =>
            const MyHomePageventanaFormulario(title: 'Registrarse'),
        '/ventanaDashboard': (context) => const MyHomePageventanaDashboard(title: 'Inicio'),
      },
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


  final String usuarioValido = "villon";
  final String claveValida = "12345";

  String usuario = "";
  String clave = "";

  _validarUsuario() {
    print("Usted ha presionado sobre el botón Ingresar");
    print(usuario);
    print(clave);
    if (usuario.isEmpty || clave.isEmpty) {
      print("Todos los campos son obligatorios.");
    }
    else if (usuario == usuarioValido && clave == claveValida) {
      print("Acceso concedido.");
      Navigator.pushNamed(context, '/ventanaDashboard');
    } else {
      print("Acceso negado. Usuario o clave incorrectos.");
    }
    
  }
  _nuevoUsuario() {
    print("Va a registrar un nuevo usuario");
    Navigator.pushNamed(context, '/ventanafromulario');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Imagen
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo_inicio.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Grupo # 13',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                //escribir usuario
                SizedBox(
                  width: 250,
                  child: TextField(
                    onChanged: (value) => usuario = value,
                    
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuario',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                //Escribir clave
                SizedBox(
                  width: 250,
                  child: TextField(
                    onChanged: (value) => clave = value,
                    
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Clave',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //boton iniciar sesion
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      _validarUsuario();
                    },
                    child: const Text('Iniciar Sesión'),
                  ),
                ),
                const SizedBox(height: 10),

                //boton registrase
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      _nuevoUsuario();
                    },
                    child: const Text('Registarse'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


