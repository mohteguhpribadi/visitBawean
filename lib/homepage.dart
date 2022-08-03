import 'package:flutter/material.dart';
import 'package:library_on/detail.dart';
import 'webservice_url.dart';
import 'package:library_on/models/tempatwisata.dart';
import 'package:library_on/userdetail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<Tempatwisata>> fetchProduct() async {
  final response = await http.get('http://' + Webservice.ip + '/tempatwisata');
  final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
  return parsed
      .map<Tempatwisata>((json) => Tempatwisata.fromJson(json))
      .toList();
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Tempatwisata>> tmptWisata;

  @override
  void initState() {
    super.initState();
    tmptWisata = fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/logo.png',
          fit: BoxFit.contain,
          height: 45,
        ),
        // title: Text(
        //   'Visit Bawean',
        //   style: TextStyle(color: Colors.black),
        // ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 20),
            icon: Icon(Icons.account_circle_rounded),
            color: Colors.black,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserDetail()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                //
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFe7edeb),
                      hintText: "Mau kemana ?",
                      prefixIcon: Icon(
                        Icons.search_sharp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),

                //Rekomendasi
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20, bottom: 10),
                  child: Text(
                    'Rekomendasi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),

                Container(
                  height: 340,
                  margin: EdgeInsets.only(left: 20),
                  child: FutureBuilder<List<Tempatwisata>>(
                    future: tmptWisata,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var snapshot2 = snapshot;

                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot2.data.length,
                          itemBuilder: (context, index) {
                            Tempatwisata current = snapshot.data[index];
                            // Text(current.id.toString()),
                            // Text(current.name),

                            return Column(
                              // Container(
                              //   height: 340,
                              //   margin: EdgeInsets.only(left: 10),
                              //   child: ListView(
                              //     scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  width: 180.0,
                                  decoration: new BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    color: Colors.blue,
                                    image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: new NetworkImage(current.img),
                                    ),
                                  ),
                                  child: Container(
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage()));
                                      },
                                      child: Container(
                                        height: 65,
                                        margin: EdgeInsets.only(
                                            top: 240, bottom: 15),
                                        padding: EdgeInsets.only(
                                            top: 10, left: 10, right: 45),
                                        decoration: new ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Text(
                                                current.name.toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: (16),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.place,
                                                    size: 10.0,
                                                    color: Colors.red,
                                                  ),
                                                  Text(
                                                    current.address.toString(),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: (10),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return CircularProgressIndicator();
                    },
                  ),
                ),

//
//
//Kategori
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Kategori',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 65,
                        width: 157,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          gradient: LinearGradient(
                              colors: [
                                Colors.lightGreen[400],
                                Colors.lightGreen[600],
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          // color: Colors.lightGreen[400],
                        ),
                        child: Container(
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.only(right: 40, top: 10),
                              child: Text(
                                "Tempat Wisata",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: (18),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 157,
                        margin: EdgeInsets.only(left: 10),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          gradient: LinearGradient(
                              colors: [
                                Colors.blue[400],
                                Colors.blue[600],
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                        child: Container(
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.only(right: 85, top: 10),
                              child: Text(
                                "Info\nKapal",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: (18),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 65,
                        width: 157,
                        padding: EdgeInsets.all(0),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          gradient: LinearGradient(
                              colors: [
                                Colors.orange[300],
                                Colors.orange[500],
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                        child: Container(
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.only(right: 45, top: 10),
                              child: Text(
                                "Hotel - Penginapan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: (18),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 157,
                        margin: EdgeInsets.only(left: 10),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          gradient: LinearGradient(
                              colors: [
                                Colors.amber[300],
                                Colors.amber[500],
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                        child: Container(
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.only(right: 55, top: 10),
                              child: Text(
                                "Pemandu Wisata",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: (18),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //
                //
                // Container(
                //   height: 60,
                //   width: double.infinity,
                //   margin: EdgeInsets.all((20)),
                //   padding: EdgeInsets.symmetric(
                //     horizontal: (20),
                //     vertical: (15),
                //   ),
                //   decoration: BoxDecoration(
                //     color: Colors.blue[500],
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Text.rich(
                //     TextSpan(
                //       style: TextStyle(
                //         color: Colors.white,
                //       ),
                //       children: [
                //         TextSpan(
                //           text: "Butuh Bantuan ?",
                //           style: TextStyle(
                //             fontSize: (18),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
