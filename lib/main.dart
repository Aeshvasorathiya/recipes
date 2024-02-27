import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipes/recipes.dart';
import 'package:recipes/second.dart';

void main()
{
  runApp(MaterialApp(
 //   home: first(),
    routes: {
      "second":(context) => second(),
      "first":(context) => first(),
    },
    initialRoute: "first",
    debugShowCheckedModeBanner: false,
  ));
}
class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
 // final dio = Dio();

  /*Future getHttp() async {
    final response = await dio.get('https://dart.dev');
    print(response);
  }*/
 Future getdata()
  async {
  // print("object");
    var url = Uri.https('api.sampleapis.com', 'recipes/recipes');
    var response = await http.get(url);
    List m=jsonDecode(response.body);
    log("${m}");
    return m;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
    title: Text("All Recipes Cook Book"),
    actions: [
      IconButton(onPressed: () {

      }, icon: Icon(Icons.search)),
      IconButton(onPressed: () {

      }, icon: Icon(Icons.settings)),
    ],
    //    backgroundColor: Colors.black,
      ),
      body:
      FutureBuilder(future: getdata(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.done)
          {
            if(snapshot.hasData)
            {
              List m=snapshot.data as List;

              log("${m}");
              return ListView.builder(
                itemCount: m.length,
                itemBuilder: (context, index) {
                  print("${jsonEncode(m[index])})");
                  recipes r=recipes.fromJson(m[index]);
                  print(r);
                  return InkWell(onTap: () {
                   Navigator.pushNamed(context, "second",arguments: r);
                  },

                    child: Container(
                      height: 300,
                      width: 400,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        image: DecorationImage(fit: BoxFit.fill,
                          opacity: 0.60,
                          image: NetworkImage("${r.photoUrl}"),)),
                      child: Wrap(
                        children: [
                          Text("${r.title}",
                            style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold,),),

                        ],
                      ),
                    ),
                  );

                },);
            }
          }
          return Center(child: CircularProgressIndicator());
        },),

    );
  }
}
