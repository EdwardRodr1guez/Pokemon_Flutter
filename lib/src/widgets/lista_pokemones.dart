import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:poke_app/src/models/poke_models.dart';
import 'package:poke_app/src/pages/tabs_page.dart';
import 'package:poke_app/src/services/index_service.dart';
import 'package:poke_app/src/services/poke_service.dart';

import 'package:poke_app/src/sharepreferences/preferencias.dart';
import 'package:poke_app/src/theme/darktheme.dart';
import 'package:provider/provider.dart';

class ListaPokemones extends StatelessWidget {
  
  //List<Article> noticias;
  List<Result> noticias;
  ListaPokemones(this.noticias);
  
  
  
  @override
  Widget build(BuildContext context) {

    final indexService= Provider.of<IndexService>(context); 
    return Card(
      elevation: 40,
      child: ListView.separated(
        controller: indexService.listController,
        separatorBuilder: (_,__)=>Container(height: 5,color: Colors.redAccent,),
        itemCount: this.noticias.length,
        itemBuilder: (BuildContext context, int index){
          return _Noticia(noticia: this.noticias[index], index: index);
        } ),
    );
  }
}




class _Noticia extends StatelessWidget {
  
  final Result noticia;
  final int index;

  const _Noticia({super.key, required this.noticia, required this.index});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          
          _TarjetaTopBar (noticia: noticia,index: index),
          _TarjetaImagen (noticia: noticia,index: index,),
          _TarjetaBotones(index),
          SizedBox(height: 10),
          Divider()

        ],
      ),
    );
  }
}

class _TarjetaBotones extends StatefulWidget {
   _TarjetaBotones(this.index);

  int index;

  @override
  State<_TarjetaBotones> createState() => _TarjetaBotonesState();
}

class _TarjetaBotonesState extends State<_TarjetaBotones> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [


            RawMaterialButton(
              onPressed: (){
              
               final pokeService = Provider.of<PokeService>(context,listen: false);
               print("botón favorito#:${ widget.index+1}");
               
               pokeService.isActive=true;
               SPHelper.sp.mensaje=(widget.index+1);
               SPHelper.sp.savefavorites("lalista",[SPHelper.sp.likes.toSet().toString()] );  //el primer argumento debe existir dentro de la clase? esa es la pregutna a resolver, WTF? yo entiendo que me pedía desde hace medio siglo una fucking list string ... entonces casteé primero a string pero no dejaba meter todo dentro de una lista así que literal puse todo dentro de esas llaves .-.
              setState(() {
                
              });
              },
              fillColor: DarkTheme.colorScheme.secondary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.favorite,size: 25,))

        ],
      ),
    );
  }
}


class _TarjetaTopBar extends StatelessWidget {
  final Result noticia;
  final int index;
  const _TarjetaTopBar({super.key, required this.noticia, required this.index});

  
  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.symmetric(horizontal: 10),
       margin: EdgeInsets.only(bottom: 10,top: 10),
       child: Row(
        children: [
          Text("${index+1}) ", style:TextStyle(fontSize: 20,color: DarkTheme.colorScheme.secondary )),
          SizedBox(width: 110,),
          Container(alignment: Alignment.center,child: Text("${noticia.name!.toUpperCase()}",style: TextStyle(fontSize: 20),))
       
        ],
       ),
    );
  }
}



class _TarjetaImagen extends StatelessWidget {

  final Result noticia;
  final int index;
  const _TarjetaImagen({super.key, required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
           
            child:(noticia.url != null)
              ? FadeInImage(
                placeholder: AssetImage('assets/img/giphy.gif') ,
                image: NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${index+1}.png"))
      
              : Image(image: AssetImage('assets/img/no-image.png'),)
      
            ),
      ),
    );
  }
}

