import 'package:flutter/material.dart';

class MyAppventanaFormulario extends StatelessWidget {
  const MyAppventanaFormulario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter prueba',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePageventanaFormulario(title: 'Registrarse'),
    );
  }
}

class MyHomePageventanaFormulario extends StatefulWidget {
  const MyHomePageventanaFormulario({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageventanaFormulario> createState() =>
      _MyHomePageStateventanaFormulario();
}

class _MyHomePageStateventanaFormulario
    extends State<MyHomePageventanaFormulario> {
  final _cedulaController = TextEditingController();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _direccionController = TextEditingController();

  bool esEstudianteUG = false;
  bool usuarioActivo = false;
  DateTime? fechaNacimiento;
  String? carreraSeleccionada;

  final List<String> carreras = [
    'Ingeniería',
    'Medicina',
    'Derecho',
    'Arquitectura',
  ];

  void _mostrarFecha() async {
    DateTime? fecha = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (fecha != null) {
      setState(() {
        fechaNacimiento = fecha;
      });
    }
  }

  void _guardarRegistro() {
    String cedula = _cedulaController.text;
    String nombres = _nombreController.text;
    String apellidos = _apellidoController.text;
    String direccion = _direccionController.text;
    String estudiante = esEstudianteUG ? "Sí" : "No";
    String activo = usuarioActivo ? "Sí" : "No";
    String fecha = fechaNacimiento != null
        ? "${fechaNacimiento!.day}/${fechaNacimiento!.month}/${fechaNacimiento!.year}"
        : "No seleccionada";
    String carrera = carreraSeleccionada ?? "No seleccionada";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Datos del Registro"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Cédula: $cedula"),
                Text("Nombres: $nombres"),
                Text("Apellidos: $apellidos"),
                Text("Dirección: $direccion"),
                Text("Estudiante UG: $estudiante"),
                Text("Usuario Activo: $activo"),
                Text("Fecha Nacimiento: $fecha"),
                Text("Carrera: $carrera"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cerrar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _borrarCampos() {
    setState(() {
      _cedulaController.clear();
      _nombreController.clear();
      _apellidoController.clear();
      _direccionController.clear();
      esEstudianteUG = false;
      usuarioActivo = false;
      fechaNacimiento = null;
      carreraSeleccionada = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildTextField(_cedulaController, 'Cédula'),
              const SizedBox(height: 10),
              _buildTextField(_nombreController, 'Nombres'),
              const SizedBox(height: 10),
              _buildTextField(_apellidoController, 'Apellidos'),
              const SizedBox(height: 10),
              _buildTextField(_direccionController, 'Dirección'),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('¿Estudiante UG?'),
                  Checkbox(
                    value: esEstudianteUG,
                    onChanged: (bool? value) {
                      setState(() {
                        esEstudianteUG = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                width: 300,
                child: CheckboxListTile(
                  title: Text('Estudiante UG'),
                  value: esEstudianteUG,
                  onChanged: (bool? value) {
                    setState(() {
                      esEstudianteUG = value!;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  const Text('Usuario Activado'),
                  Switch(
                    value: usuarioActivo,
                    onChanged: (value) {
                      setState(() {
                        usuarioActivo = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: carreraSeleccionada,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Carrera",
                ),
                items: carreras
                    .map(
                      (carrera) => DropdownMenuItem(
                        value: carrera,
                        child: Text(carrera),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    carreraSeleccionada = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                readOnly: true,
                controller: TextEditingController(
                  text: fechaNacimiento != null
                      ? "${fechaNacimiento!.day}/${fechaNacimiento!.month}/${fechaNacimiento!.year}"
                      : '',
                ),
                decoration: const InputDecoration(
                  labelText: 'Fecha de Nacimiento',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _mostrarFecha,
                child: const Text('Calendario'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _guardarRegistro,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('Guardar Nuevo Registro'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _borrarCampos,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text('Borrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
