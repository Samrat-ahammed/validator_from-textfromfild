import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class fromValidation extends StatefulWidget {
  fromValidation({super.key});

  @override
  State<fromValidation> createState() => _fromValidationState();
}

class _fromValidationState extends State<fromValidation> {
  final formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: formkey,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    validator: (String? value) {
                      if (!value!.contains("@")) {
                        return "Please Enter a vaild email";
                      }
                    },
                    onSaved: (newValue) {
                      email = newValue!;
                    },
                    decoration: InputDecoration(
                        hintText: "Email", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: isVisible ? true : false,
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'Password must be more then 6 charactors';
                      }
                    },
                    onSaved: (newValue) {
                      password = newValue!;
                    },
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: isVisible
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        print("Your $email and $password ");
                      }
                    },
                    child: Text('Submet'),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
