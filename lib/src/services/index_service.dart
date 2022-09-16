import 'dart:io';

import 'package:flutter/material.dart';
import 'package:poke_app/src/models/poke_models.dart';
import 'package:http/http.dart' as http;


class IndexService with ChangeNotifier{


ScrollController _listController = ScrollController();
int _index=0;



//setters;
set index(int valor){
  this._index  =valor;
  this._listController.animateTo((valor+0.0)*480,duration: Duration(milliseconds: 200),curve:Curves.ease );
  notifyListeners();
}



//getters
int get index => this._index;
ScrollController get listController => this._listController;


}





