import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          // padding: EdgeInsets.only(left: 10),
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: Text(
            "Profil",
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 10),
            icon: Icon(Icons.logout),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //
                //

                Container(
                  // margin: EdgeInsets.all(20),
                  height: 120.0,
                  width: 120.0,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    // color: Colors.blue,
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: new NetworkImage(
                        'https://cf.shopee.com.my/file/06e94ec88c7a50628128e423603c703c',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nama Kamu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                Card(
                    color: Color(0xFFe7edeb),
                    margin: EdgeInsets.only(top: 5),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.grey[600],
                      ),
                      title: Text(
                        'Nayeon',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nomor Hp Kamu',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                Card(
                    color: Color(0xFFe7edeb),
                    margin: EdgeInsets.only(top: 5),
                    child: ListTile(
                      leading: Icon(
                        Icons.call,
                        color: Colors.grey[600],
                      ),
                      title: Text(
                        '0812 3456 7890',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    )),
                SizedBox(
                  height: 220,
                ),
                Container(
                  // padding: EdgeInsets.only(top: 30),
                  height: 55,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {},
                    // padding: EdgeInsets.symmetric(
                    //   vertical: 15,
                    //   horizontal: 130,
                    // ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Colors.blue,
                    child: Text(
                      'Edit Profil',
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
