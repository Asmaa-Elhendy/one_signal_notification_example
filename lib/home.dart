import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: RaisedButton(
            onPressed: ()async{
              await sendNotification();
            },
            child: Text('Press'),
          ),)
        ],
      )
    );
  }
}

sendNotification()async{
 var res= await http.post(Uri.parse("https://onesignal.com/api/v1/notifications"),
  headers: {
    "Authorization":"Bearer MTY2YmFjZTctMzRmZS00YTJkLTg4YWEtYmVmOTk2MzhiYTQ3",
    "Content-Type":"application/json"
  },
  body: {
    "app_id": "cce077cd-b6e8-4335-b5c4-93fe2cbb818b",
    "included_segments":["Subscribed Users"],
    "name":"asmaa",
    "data": {"foo": "bar"},
    "headings":"title",
    "contents" : { "en": "Welcome phone !" },
  });
  print(json.decode(res.body));
}
