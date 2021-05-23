import 'package:flutter/material.dart';

class ActorPage extends StatelessWidget {



  @override
  final List fotos = [
  "/sakcXl4DUoVUSjNN9Tis1ZbFy0.jpg",
  "/xu1l9WmNY1XYZyJ3M2gvGqCCDGS.jpg",
  "/tzG9tZhJirA4PdXB3UADPlYpbHA.jpg",
  "/h299BeSGjgjlhmLyRVJ0vrefhK.jpg",
  "/hzt1aV8FzEJlUtiWtrGSHlcdGCx.jpg",
  "/3J1GKkjj5a88D9SSWAtumMOG604.jpg",
  "/fStVui6x1lSVzEo7UncNpAGxHSO.jpg",
  "/tcuzy83rAR6wuP26aRQ58QMpPSE.jpg",
  "/wAINRpTWQTtBpZyEPEQCWi5OjUP.jpg",
  "/plLfB60M5cJrnog8KvAKhI4UJuk.jpg",
  "/aUyLp5QV14bfjtB6c5SDT1IGqyM.jpg",
  "/qkaqXiNIUg3LlBJyqtfxsyT73DW.jpg",
  "/cG8f05QzSrLunXgEIJUEj4F3IVz.jpg",
  "/fysvehTvU6bE3JgxaOTRfvQJzJ4.jpg",
  "/1uFvXHf18NBnlwsJHVaikLXwp9Y.jpg",
  "/cIi5pCTdVpD4Hn0OEcJhJeNKYMw.jpg"
  ];
  Widget build(BuildContext context) {
    return  SafeArea(
      top: false,
      child: Scaffold(

        appBar: AppBar(
          title: Text("Gal Gadot"),
          leading: GestureDetector(
            child: Icon(Icons.chevron_left),
            onTap: (){
              Navigator.pop(context);
              },
          )

            //icon Icon(Icons.chevron_left,) ),

        ),
        body: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Image(
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/cIi5pCTdVpD4Hn0OEcJhJeNKYMw.jpg'),
              width: 300.0,
              height: 300.0,
            ),
            Text('Gal Gadot'),
            Text('Gal Gadot'),
            Text('Gal Gadot'),
            Text('Gal Gadot'),
            Flexible(
              child: GridView.count(
                crossAxisCount: 4,
                children: List.generate(15, (index) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/${fotos[index]}'),),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
