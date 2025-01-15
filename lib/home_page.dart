import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as myClient;

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  Map<String,dynamic> mQuotes = {};

  @override
  void initState() {
    super.initState();
    getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: mQuotes["todos"]!=null ? ListView.builder(
          itemCount: mQuotes["todos"].length,
          itemBuilder: (_,index){
            return ListTile(
              title: Text(mQuotes["todos"][index]["todo"]),
              subtitle: Text(mQuotes["todos"][index]["completed"] ? "Completed" : "Not Completed"),
              leading: Text(mQuotes["todos"][index]["userId"].toString()),
            );
      }): Container(),
    );
  }

  void getQuotes()async{
    String url = "https://dummyjson.com/todos";
   myClient.Response res = await myClient.get(Uri.parse(url));

   if(res.statusCode==200){
    mQuotes = jsonDecode(res.body);
    setState(() {

    });
   }

  }
}