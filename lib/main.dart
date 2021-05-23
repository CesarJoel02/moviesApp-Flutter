import 'package:flutter/material.dart';
import 'package:sampleapp/src/pages/actor_page.dart';
import 'package:sampleapp/src/pages/home_page.dart';
import 'package:sampleapp/src/pages/pelicula_detalle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      initialRoute: '/',
      routes: {
        '/' : (BuildContext context ) => HomePage(),
        'detalle' : (BuildContext context ) => PeliculaDetalle(),
        'actor' : (BuildContext context ) => ActorPage(),
      },
    );
  }
}
