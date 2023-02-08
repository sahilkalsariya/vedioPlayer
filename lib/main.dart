import 'package:flutter/material.dart';
import 'package:vedioplayers/Global.dart';
import 'package:vedioplayers/vedioplayer.dart';

void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/' : (context) => MyApp(),
      'vedio' : (context) => vedioPlayer(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vedio Players"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
        physics: BouncingScrollPhysics(),
          children: Global.vedios
              .map(
                (e) => GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed('vedio',arguments: e);
                    Global.link = e['vedio'];
                  },
                  child: Card(
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 300,
                      width: double.infinity,
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Container(
                                decoration: BoxDecoration(
                                  //color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(e['image']),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Text(
                                    "${e['title']}",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${e['subtitle']}",
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.black,fontWeight: FontWeight.bold,),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
