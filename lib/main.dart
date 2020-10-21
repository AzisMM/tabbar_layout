import 'package:flutter/material.dart';
import 'screen/tab_one.dart' as email;
import 'screen/tab_two.dart' as music;
import 'screen/tab_three.dart' as shop;

void main() {
  runApp(new MaterialApp(
    title: 'Tab Bar',
    debugShowCheckedModeBanner: false,
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('TabBar'),
        centerTitle: true,
        bottom: new TabBar(controller: controller, tabs: <Widget>[
          new Tab(text: 'Email',),
          new Tab(text: 'Music',),
          new Tab(text: 'Shop',),
        ],),
      ),

      body: new TabBarView(
        controller: controller,

        children: <Widget>[
          email.TabOne(),
          music.TabTwo(),
          shop.TabThree()
        ],
      ),
    );
  }
}
