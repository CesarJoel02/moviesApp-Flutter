import 'package:flutter/material.dart';
import 'package:sampleapp/src/models/pelicula_model.dart';
import 'package:sampleapp/src/providers/peliculas_providers.dart';


class DataSearch extends SearchDelegate{
  final peliculas = [
    'Spiderman',
    'aquaman',
    'batman',
    'shazam',
    'iron man',
    'Capitan America',
  ];
  final peliculasRecientes = [
    'spiderman',
    'capitan america'
  ];

  String seleccion = "";
  final peliculasProvider = new PeliculasProvider();



  @override
  List<Widget> buildActions(BuildContext context) {
    //las acciones del appBar
    //throw UnimplementedError();
    return[
      IconButton(
        icon: Icon(
          Icons.clear,
        ),
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    //throw UnimplementedError();
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //Crea los resultaods que se van a mostrar
    //throw UnimplementedError();
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Center(child: Text(seleccion)),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty){
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot){
        if(snapshot.hasData){
          final peliculas = snapshot.data;
          return ListView(
            children:
              peliculas.map((pelicula) {
                return ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(
                        pelicula.getPosterImg(),
                    ),
                    placeholder: NetworkImage("https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fcohenwoodworking.com%2Fwp-content%2Fuploads%2F2016%2F09%2Fimage-placeholder-500x500.jpg&f=1&nofb=1"),
                    width: 50.0,
                    fit: BoxFit.cover,
                  ),
                  title: Text(pelicula.title),
                  subtitle: Text(pelicula.originalTitle),
                  onTap: (){
                    close(context, null);
                    pelicula.uniqueID = '';
                    Navigator.pushNamed(context, 'detalle',arguments: pelicula);
                  },
                );
              }).toList()
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        //return;
      },
    );

  }

/*@override
  Widget buildSuggestions(BuildContext context) {
    // son las sugerencias que aparecen cuando la persona escribe
    //throw UnimplementedError();

    final listaSugerida = ( query.isEmpty )
        ? peliculasRecientes
        : peliculas.where(
            ( p ) => p.toLowerCase().contains(query.toLowerCase())
    ).toList();

    return ListView.builder(
        itemCount: listaSugerida.length,
        itemBuilder: (context, i){
          return ListTile(
            leading: Icon(Icons.movie),
            title: Text(listaSugerida[i]),
            onTap: (){
              seleccion = listaSugerida[i];
              showResults(context);
            },
          );
        },
    );
  }*/


}