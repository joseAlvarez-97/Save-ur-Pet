import 'package:flutter/material.dart';

import 'admin/adopcion_screen.dart';
import 'admin/denuncias_screen.dart';
import 'admin/home_screen.dart';
import 'admin/rescate_screen.dart';
import 'admin/rip_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _cIndex = 0;

  List<Widget> _children = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen()
//    CinemasScreen(),
//    TicketScreen(),
//    TicketScreen(),
//    TicketScreen(),
  ];

  incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _appBar(),
      body: _bodyMain(),
    );
  }

  Widget _appBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          "Menú",
          style: TextStyle(color: Color.fromRGBO(224,236,240, 1), fontSize: 14),
        )),
      ),
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        Text("Save (ur) Pet"  , style: TextStyle(color: Color.fromRGBO(224,236,240, 1), fontSize: 26),
        ),
      ),
      backgroundColor: Color.fromRGBO(35,97,131, 1),
      elevation: 2,
      centerTitle: false,
//      actions: <Widget>[
//        Image.asset(
//          "images/ico_noti_top_home.png",
//          width: 32,
//          height: 32,
//          fit: BoxFit.contain,
//        )
//      ],
    );
  }

  Widget _bodyMain() {
    return Scaffold(
      body: Center(child: _children[_cIndex]),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
          onTap: incrementTab,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(239,245,251, 1),
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "images/casa-de-perro.png",
                  height: 36,
                  width: 36,
                  color: Color.fromRGBO(35,97,131, 1),
                ),

                title: Text(
                  "Home",
                  style: TextStyle(
                      color: Color.fromRGBO(153, 164, 170, 1), fontSize: 16),
                )),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "images/ic_adopcion.png",
                  height: 36,
                  width: 36,
                  color: Color.fromRGBO(35,97,131, 1),

                ),
                title: Text(
                  "Adopción",
                  style: TextStyle(
                      color: Color.fromRGBO(153, 164, 170, 1), fontSize: 16),
                )),
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/ic_rescatar.png",
                height: 36,
                width: 36,
                color: Color.fromRGBO(35,97,131, 1),

              ),
              title: Text(
                "Rescate",
                style: TextStyle(
                    color: Color.fromRGBO(153, 164, 170, 1), fontSize: 16),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/riesgo.png",
                height: 36,
                width: 36,
                color: Color.fromRGBO(35,97,131, 1),


              ),
              title: Text(
                "Denuncias",
                style: TextStyle(
                    color: Color.fromRGBO(153, 164, 170, 1), fontSize: 16),
              ),
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "images/ic_rip.png",
                  height: 36,
                  width: 36,
                  color: Colors.black87,

                ),
                title: Text(
                  "RIP",
                  style: TextStyle(
                      color: Color.fromRGBO(153, 164, 170, 1), fontSize: 16),
                )),
          ]),
    );
  }
}