import 'package:flutter/material.dart';
import 'package:social_media_ui/view/homeScreen.dart';
import 'package:social_media_ui/widgets/curvedClipper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipPath(
                clipper: CurvedClipper(),
                child: Image(
                  image: const AssetImage('assets/images/login_background.jpg'),
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'Frenzy',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 10.0),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_box,
                      size: 30.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    hintText: 'Your Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 2.0, color: Theme.of(context).primaryColor)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 30.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 5.0),
                    hintText: 'Your Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 2.0, color: Theme.of(context).primaryColor)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                child: TextButton(
                  onPressed: () => Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => HomeScreen())),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 60.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0)),
                height: 45,
                alignment: Alignment.center,
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    child: const Text(
                      'Don\'t have account? Sign Up',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    alignment: Alignment.center,
                    height: 85,
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
