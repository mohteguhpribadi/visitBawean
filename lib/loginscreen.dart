import 'package:flutter/material.dart';
import 'package:library_on/otp.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Image.asset(
                        'logo1.png',
                        height: 80,
                      ),
                    ),
                    // Text(
                    //   'Masuk',
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 46.0,
                    //     fontWeight: FontWeight.w800,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10.0,
                    // ),
                    // Text(
                    //   'Nikmati Keindahan Pulau Bawean',
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 20.0,
                    //     fontWeight: FontWeight.w300,
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Masuk',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xFFe7edeb),
                          hintText: "Masukkan nomor hp kamu",
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 20.0,
                      // ),
                      // TextField(
                      //   obscureText: true, //dot text
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(8.0),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //     filled: true,
                      //     fillColor: Color(0xFFe7edeb),
                      //     hintText: "Masukkan kata sandi kamu",
                      //     prefixIcon: Icon(
                      //       Icons.lock,
                      //       color: Colors.grey[600],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Text(
                      //       "Lupa kata sandi ?",
                      //       style: TextStyle(
                      //         color: Colors.blue,
                      //         decoration: TextDecoration.underline,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 50.0,
                      // ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Otp()));
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
                            'Selanjutnya',
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
          ],
        ),
      )),
      // backgroundColor: Colors.white,
      // body: SafeArea(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 30),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Hero(
      //               tag: 'logo',
      //               child: Image.asset(
      //                 'logo.png',
      //                 height: 50,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
