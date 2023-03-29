import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        centerTitle: true,
        title: Text(
          'Groups',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          Icon(
            Icons.account_circle,
            size: 150,
            color: Colors.green,
          ),
          Text(username)
        ],
      )),
    );
  }
}
