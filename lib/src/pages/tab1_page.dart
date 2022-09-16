import 'package:flutter/material.dart';
import 'package:poke_app/src/services/index_service.dart';
import 'package:poke_app/src/services/poke_service.dart';

import 'package:poke_app/src/widgets/lista_pokemones.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
   
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    
    final pokeService = Provider.of<PokeService>(context); 

    

    return  Scaffold(
      appBar: AppBar(title: CustomTextfield(),),
      body: (pokeService.pokenames==0)
          ? Center(child: CircularProgressIndicator())
          : ListaPokemones(pokeService.pokenames)
      
      );
      
    
  }
  
  @override
  
  bool get wantKeepAlive => true;
}






class CustomTextfield extends StatefulWidget {
   

  
  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    final pokeService = Provider.of<PokeService>(context); 
    final indexService= Provider.of<IndexService>(context);

    return  Container(
      //width: 450 ,
      //height:50,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: 400,
                    height: 60,
                    //decoration: ,
                    child: TextFormField(
                      
                      onFieldSubmitted: (value){
                          
                          if (pokeService.pokenames.map((e) =>e.name ).toList().indexOf(value)!=-1){
                            print("Ok");
                            print("El índice es: ${pokeService.pokenames.map((e) =>e.name ).toList().indexOf(value)+1}");
                            indexService.index=pokeService.pokenames.map((e) =>e.name ).toList().indexOf(value);
                          
                            setState(() {
                              
                            });
                          }else{
                            print("Nel, no existe ese pokemon, POKEtanpendejo?");
                          }
                      }, 
                      autofocus: false,
                      initialValue: "",
                      //onChanged: (value){
                      //  print("$value");
                        
                      //},
                      style: TextStyle(color: Colors.white ),
                      //validator: (value){
                      //  if (value==null) return "Este campo es requerido";
                      //},
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: "Buscar Pokemon",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                        suffixIcon: Icon(Icons.search, color: Colors.white ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          
                        )
                      ),
                    ),
                  ),
      ),
    );

}
}