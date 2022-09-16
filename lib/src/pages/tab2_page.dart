import 'package:flutter/material.dart';

import 'package:poke_app/src/sharepreferences/preferencias.dart';
import 'package:poke_app/src/widgets/lista_pokemones.dart';


class Tab2Page extends StatefulWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  State<Tab2Page> createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page> {
  @override
  Widget build(BuildContext context) {
    
    final List<String>? lista=SPHelper.sp.getfavoritos("lalista");
    final arreglo =lista![0].substring(1,lista[0].length-1).split(",").map(int.parse).toList(); 

    return   Scaffold(
      appBar: AppBar(title: Center(child: Text("Mis Pokemones Favoritos",style: TextStyle(fontSize: 25,color: Colors.white),))),
      body: Center(
        child: Container(
         
           child: ListView.builder(itemBuilder: (context, index) {
             return FadeInImage(
                placeholder: AssetImage('assets/img/giphy.gif') ,
                image: NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${arreglo[index]}.png"));
              
           },itemCount: arreglo.length,)) 
           
           
           
           
           //Text("${arreglo}"),
            
          
           // Text("${arreglo}"),
            
            
          
        ),
      );
    
  }
}