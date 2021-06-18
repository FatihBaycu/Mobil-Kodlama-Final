import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobil_kodlama_final/model/Gonderi.dart';
import 'package:http/http.dart' as http;

class HttpScreen extends StatefulWidget {

  @override
  _HttpScreenState createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {

  Future<List<Gonderi>> getAll() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));
    if (response.statusCode == 200) {
      var result= (jsonDecode(response.body) as List ).map((e) => Gonderi.fromJsonMap(e)).toList();
      return result;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HTTP İşlemleri"),),
      body: FutureBuilder<List<Gonderi>>(
        future: getAll(),
        builder: (BuildContext context,AsyncSnapshot<List<Gonderi>> snapshot){
          if(snapshot.hasData){
            var posts=snapshot.data;
            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context,index){
                  var post=posts[index];
                  return Card(
                    color: index%2==0?Colors.teal[200]:Colors.orange[200],
                    child: ListTile(
                      leading: CircleAvatar(child: Text(post.id.toString())),
                      title: Text(post.title),
                      subtitle: Text(post.body.toString()),
                    ),
                  );
                }
            );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
