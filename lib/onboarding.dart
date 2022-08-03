import 'package:flutter/material.dart';
import 'package:library_on/login.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'logo.png',
                    height: 80,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Image.asset('img1.png', width: 500),
                Text(
                  'Haloo, Selamat Datang.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Sudah siap meniikmati keindahan alam\ndi Pulau Bawean?',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 80,
                ),
                Hero(
                  tag: 'button',
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 140,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Mulai',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
