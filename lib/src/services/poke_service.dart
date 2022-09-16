import 'dart:io';

import 'package:flutter/material.dart';
import 'package:poke_app/src/models/poke_models.dart';
import 'package:http/http.dart' as http;


class PokeService with ChangeNotifier{

List<Result> pokenames=[];
bool _isActive=false;

PokeService(){
  this.getPokeNames();
  
}

bool get isActive=>this._isActive;

 set isActive(bool flag){
   _isActive=flag;
} 





getPokeNames() async{
  final url         ="https://pokeapi.co/api/v2/pokemon/?limit=1154";
  final resp        = await http.get(Uri.parse(url)); 

  final pokeResponse=pokemonFromJson(resp.body);
  this.pokenames.addAll(pokeResponse.results);
  
  notifyListeners();
}




}





