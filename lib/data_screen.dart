import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  LandingPage({super.key, required this.userName,
    required this.userApellidop,
    required this.userApellidom,
    required this.userTelefono,
    required this.userEmail,
    required this.userEdad
  });
  final String userName;
  final String userApellidop;
  final String userApellidom;
  final String userTelefono;
  final String userEmail;
  final String userEdad;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  clearData() async {
    final SharedPreferences prefs = await _prefs;
    //prefs.clear
    prefs.remove("nombre");
    prefs.remove("apellidop");
    prefs.remove("apellidom");
    prefs.remove("telefono");
    prefs.remove("email");
    prefs.remove("edad");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lading Page",
              style: TextStyle(color: Colors.yellowAccent)),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Center(
                child: Text(
                  "Landing Page",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                )),
            const SizedBox(
              height: 50,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Welcome ${widget.userEmail}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                )
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                clearData();
              },
              child: const Text("Logout"),
            ),
          ],
        )
    );
  }
}