import 'package:flutter/material.dart';
import 'package:library_on/homepage.dart';

class Otp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25, top: 90),
              child: Column(children: [
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'logo.png',
                    height: 80,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Verifikasi ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Kode verifikasi sedang dikirim ke nomor hp kamu',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFe7edeb),
                      hintText: "Masukkan kode verifikasi",
                      prefixIcon: Icon(
                        Icons.security,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // padding: EdgeInsets.only(top: 30),
                  height: 55,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    // padding: EdgeInsets.symmetric(
                    //   vertical: 15,
                    //   horizontal: 130,
                    // ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Colors.blue,
                    child: Text(
                      'Verifikasi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
