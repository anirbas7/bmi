import 'package:bmi/screens/navbar_screen.dart';
import 'package:bmi/widgets/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//erstellt den LoginScreen um sich mit der Emailadresse und dem Passwort einzulogen.
//Idee wür die Zukunft: Auth.Prüfung(email korrekt, PW korrekt) oder auch SingIn Screen für neue Mitglieder
//desshalb bereits im Authentifizierungsordner vorbereitet.
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api -->wurde von Visual Studio kommentiert
  _LoginScreenState createState() => _LoginScreenState();
}

//generiert den loginscreen inkl. design
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      body: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 60,
                width: 200,
              ),

              Center(
                child: Container(
                  height: 200,
                  width: 400,
                  alignment: Alignment.center,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 60,
                width: 10,
              ),

              // erstellt die Textfelder für die Emailadresse und das Passwort
              Container(
                height: 140,
                width: 530,
                // ignore: prefer_const_constructors -->wurde von Visual Studio kommentiert
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      // ignore: prefer_const_constructors -->wurde von Visual Studio kommentiert
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "max-muster@gmail.com",
                          contentPadding: const EdgeInsets.all(20)),
                    ),
                    const Divider(
                      thickness: 3,
                    ),
                    TextFormField(
                      // ignore: prefer_const_constructors -->wurde von Visual Studio kommentiert
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "********",
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                  ],
                ),
              ),

              // Submit Button
              Container(
                width: 570,
                height: 70,
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kbottomContainerColor,
                    ),
                    child: const Text("Speichern",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavbarScreen()),
                        (Route<dynamic> route) => false,
                      );
                    }),
              ),

              // Neue Registrierung vorgesehen jedoch momentan ohne richtiger funktion --> weiterleitung zum BMI-Rechner
              Container(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Center(
                      child: RichText(
                    text: TextSpan(
                      text: "Du hast noch kein Account? ",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                            text: "Registriere dich hier",
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NavbarScreen()),
                                    )
                                  }),
                      ],
                    ),
                  )))
            ],
          )),
    );
  }
}
