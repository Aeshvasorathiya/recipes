import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipes/recipes.dart';


class second extends StatefulWidget {
  //const second(photoUrl, {super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    recipes r=ModalRoute.of(context)!.settings.arguments as recipes;
    Future getdata()
    async {
      // print("object");
      var url = Uri.https('api.sampleapis.com', 'recipes/recipes');
      var response = await http.get(url);
      List m=jsonDecode(response.body);
      log("${m}");
      return m;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("${r.title}"), //    backgroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              height: 300,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.fill,
                    image: NetworkImage("${r.photoUrl}"),)),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SizedBox(height: 10,),

                Expanded(flex: 3,
                    child: Container(child: Text("${r.title}",style: TextStyle(fontSize: 20),))),

               SizedBox(height: 10,),
                Expanded(flex: 1,
                  child: Container(
               //   alignment: Alignment.topRight,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("myasset/1.png"),
                      ),
                    ),
                    child: IconButton(
                     alignment: Alignment.center,
                      onPressed: () {
                      },icon: Icon(Icons.favorite,color: Colors.white,),
                    ),

                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(alignment:Alignment.topLeft,child: Text("${r.cookTime}hur")),
            SizedBox(height: 10,),
            Container(alignment:Alignment.topLeft,child: Text("${r.calories}")),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,borderRadius: BorderRadius.circular(50),),
                  child: IconButton(
                  onPressed: () {},
                    icon:Icon(Icons.favorite_border),

                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,borderRadius: BorderRadius.circular(50),),
                  child: IconButton(
                    onPressed: () {},
                    icon:Icon(Icons.soup_kitchen),

                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,borderRadius: BorderRadius.circular(50),),
                  child: IconButton(
                    onPressed: () {},
                    icon:Icon(Icons.share),

                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,borderRadius: BorderRadius.circular(50),),
                  child: IconButton(
                    onPressed: () {},
                    icon:Icon(Icons.add_chart),

                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,borderRadius: BorderRadius.circular(50),),
                  child: IconButton(
                    onPressed: () {},
                    icon:Icon(Icons.print),

                  ),
                ),

              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                 child: Text("${r.calories}"
                     "\nCalories",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                  child: Text("${r.servings}"
                      "\nServings",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                  child: Text("Share"
                      "\nRecipes",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                  child: Text("Unit"
                      "\nChart",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                  child: Text("print"
                      "\nReciper",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ],
            ),

            Column(
              children: [
                SizedBox(height: 10,),
                Container(
                  height: 45,
                  width:double.infinity,
                  color: Colors.orange,
                  child: Center(child: Text("Ingredients Required",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)),
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.topLeft,
              child: Text("${r.ingredients}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            )
          ],


        ),
      ),
    );
  }
}
