import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home:const HomePage() ,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidopController = TextEditingController();
  TextEditingController apellidomController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController edadController = TextEditingController();

  // Llave global
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late bool nameExist = false;
  late bool apellidopExist = false;
  late bool apellidomExist = false;
  late bool telefonoExist = false;
  late bool emailExist = false;
  late bool edadExist = false;

  void _submit(){
    final isValid = _formKey.currentState!.validate();
    if(!isValid){
      return;
    }
    _formKey.currentState!.save();
  }

  saveData() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("nombre", nombreController.text.trim());
    prefs.setString("apellidop", apellidopController.text.trim());
    prefs.setString("apellidom", apellidomController.text.trim());
    prefs.setString("telefono", telefonoController.text.trim());
    prefs.setString("email", emailController.text.trim());
    prefs.setString("edad", edadController.text.trim());


    print("Value: " + nombreController.text.trim());
    print("Value: " + apellidopController.text.trim());
    print("Value: " + apellidomController.text.trim());
    print("Value: " + telefonoController.text.trim());
    print("Value: " + emailController.text.trim());
    print("Value: " + edadController.text.trim());
  }
  readData() async{
    final SharedPreferences prefs = await _prefs;

    final String? nombre = prefs.getString("nombre");
    final String? apellidop = prefs.getString("apellidop");
    final String? apellidom = prefs.getString("apellidom");
    final String? telefono = prefs.getString("telefono");
    final String? email = prefs.getString("email");
    final String? edad = prefs.getString("edad");

    if(email != null && nombre != null && apellidop != null && apellidom != null && telefono != null && edad !=null){
      setState(() {
        nameExist = true;
        apellidopExist = true;
        apellidomExist = true;
        telefonoExist = true;
        emailExist = true;
        edadExist = true;
      });

      // Forma más común de leer
      if(emailExist && nameExist && apellidomExist && apellidopExist && telefonoExist && edadExist) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LandingPage(
                userName: nombre,
                userApellidop: apellidop,
                userApellidom: apellidom,
                userTelefono: telefono,
                userEmail: email,
                userEdad: edad,

              )),
        );
      }
      print(email);
    }
  }

  // Metodo para acceder a las preferencias compartidas
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page",
              style: TextStyle(color: Colors.yellowAccent)),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Center(child: Text("Login Page", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
                )),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onFieldSubmitted: (value){
                      print(value);
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter a correct name";
                      }
                      return null;
                    },
                    controller: nombreController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: "Enter your Name",
                        labelText: "Name"),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onFieldSubmitted: (value){
                      print(value);
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter a correct apellido paterno";
                      }
                      return null;
                    },
                    controller: apellidopController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: "Enter your Apellido Paterno",
                        labelText: "Apellido Paterno"),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onFieldSubmitted: (value){
                      print(value);
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter a correct apellido materno";
                      }
                      return null;
                    },
                    controller: apellidomController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: "Enter your Apellido Materno",
                        labelText: "Apellido Materno"),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onFieldSubmitted: (value){
                      print(value);
                    },
                    validator: (value){
                      if(value!.isEmpty || value.length<10){
                        return "Please enter a correct telefono";
                      }
                      return null;
                    },
                    controller: telefonoController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: "Enter your Telefono",
                        labelText: "Telefono"),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // Método para validar formulario
                    onFieldSubmitted: (value){
                      print(value);
                    },
                    validator: (value){
                      if(value!.isEmpty||
                          !RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)){
                        return "Please enter your email";
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: "Enter a correct email",
                        labelText: "Email"),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onFieldSubmitted: (value){
                      print(value);
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please enter a correct edad";
                      }
                      return null;
                    },
                    controller: edadController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: "Enter your edad",
                        labelText: "Edad"),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: ElevatedButton(
                      onPressed: () {
                        _submit();
                        saveData();

                        final isValid = _formKey.currentState!.validate() ?? false;
                        if(isValid){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingPage(
                                  userName: nombreController.text.trim(),
                                  userApellidop: apellidopController.text.trim(),
                                  userApellidom: apellidomController.text.trim(),
                                  userTelefono: telefonoController.text.trim(),
                                  userEmail: emailController.text.trim(),
                                  userEdad: edadController.text.trim(),

                                )),
                          ).then((res){
                            nombreController.clear();
                            apellidopController.clear();
                            apellidomController.clear();
                            telefonoController.clear();
                            emailController.clear();
                            edadController.clear();
                          }); // Proceso futuro que pasará después de la ejecución de otro
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      )),
                )
              ],
            )
        ));
  }
}