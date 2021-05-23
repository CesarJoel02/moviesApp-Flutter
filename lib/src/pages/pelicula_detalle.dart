import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sampleapp/src/models/actores_model.dart';
import 'package:sampleapp/src/models/pelicula_model.dart';
import 'package:sampleapp/src/providers/peliculas_providers.dart';


class PeliculaDetalle extends StatelessWidget {


  const PeliculaDetalle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Pelicula pelicula =ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
           _crearAppBar( pelicula ),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 10.0,),
                  _posterTitulo(pelicula, context),
                  _descripcion(pelicula),
                  _crearCasting(pelicula)
                ]
              )
          )
        ],
      ),
    );
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),),
        background: FadeInImage(
          image: NetworkImage(
              pelicula.getBackGroundImg(),
          ),
          placeholder: NetworkImage("https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg"),
          //fadeInDuration: Duration(microseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitulo(Pelicula pelicula,BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Hero(
            tag: pelicula.uniqueID,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                  image: NetworkImage(pelicula.getPosterImg()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(width: 20.0,),
          Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pelicula.title, style: Theme.of(context).textTheme.headline6, overflow: TextOverflow.ellipsis),
                  SizedBox(width: 20.0,),
                  Text(pelicula.originalTitle, style: Theme.of(context).textTheme.caption, overflow: TextOverflow.ellipsis,),
                  Row(
                    children: [
                      Icon(Icons.star_border),
                      Text(pelicula.voteAverage.toString(),style: Theme.of(context).textTheme.caption, overflow: TextOverflow.ellipsis,),
                    ],
                  )
                ],
              )
          )
        ],
      ),
    );
  }

  Widget _descripcion(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
          pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _crearCasting(Pelicula pelicula) {
    final peliProvider = new PeliculasProvider();
    return FutureBuilder(
      future: peliProvider.getCast(pelicula.id.toString()),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        if (snapshot.hasData) {
          return _crearActoresPageView(snapshot.data);
        } else{
          return Center(child: CircularProgressIndicator(),);
        }
        }

    );
  }

  Widget _crearActoresPageView(List<Actor> actores) {

    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
          controller: PageController(
            viewportFraction: 0.3,
            initialPage: 1,
          ),
        itemCount: actores.length,
        itemBuilder: (context, i){
            return _actorTarjeta(actores[i], context);
        },
      ),
    );

  }

Widget _actorTarjeta(Actor actor, BuildContext context){
    return Container(
      child: Column(
        children: [
          GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                  placeholder: NetworkImage("https://lippianfamilydentistry.net/wp-content/uploads/2015/11/user-default.png"),
                  image: NetworkImage(actor.getFoto()),
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'actor');
            }
          ),
          Text(
              actor.name,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
}


}
