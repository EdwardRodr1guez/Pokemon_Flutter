import 'package:flutter/material.dart';
import 'package:poke_app/src/pages/tab1_page.dart';
import 'package:poke_app/src/pages/tab2_page.dart';
import 'package:poke_app/src/services/poke_service.dart';
import 'package:poke_app/src/sharepreferences/preferencias.dart';
import 'package:provider/provider.dart';



class TabsPage extends StatelessWidget {
   
  const TabsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NavegacionModel(),
      child: Scaffold(
        body: Center(
           child: _Pageview(),
        ),
        bottomNavigationBar: _bottomnav(),
      ),
    );
  }
}

class _bottomnav extends StatelessWidget {
  const _bottomnav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navegacionModel= Provider.of<_NavegacionModel>(context);  //Traemos el provider de la clase privada _NavegacionModel y lo convertirmos en singleton
    //final List<String>? lista=SPHelper.sp.getfavoritos("lalista");
    //try {
    //  final List<String>? lista=SPHelper.sp.getfavoritos("lalista");
    //  lista.length;
    //} catch (e) {
      
    //}

    final List<String>? lista=SPHelper.sp.getfavoritos("lalista");
    


    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) {
        if(lista==null){
        i=0;
        navegacionModel.paginaActual=i;}
        else{
        navegacionModel.paginaActual=i;
        }
        },
     
      items: [
         BottomNavigationBarItem(icon: Icon(Icons.catching_pokemon_outlined),label: "Pokemones" ),
         BottomNavigationBarItem(icon: Icon(Icons.favorite_outline)         ,label: "Ver favoritos" )
       
        
        
        
      ],
    );
  }
}

class _Pageview extends StatelessWidget {
  const _Pageview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final navegacionModel= Provider.of<_NavegacionModel>(context);  //Traemos el provider de la clase privada _NavegacionModel y lo convertirmos en singleton

    
    return PageView(
     controller: navegacionModel.pageController,                           //Es de tipo PageController, como este dependerá directamente de la ventana seleccionada pues se modifica un objeto del tipo pagecontroller dentro del mismo provider de navegación
     physics: NeverScrollableScrollPhysics(),//BouncingScrollPhysics(),
     children: [
       Tab1Page(),
       Tab2Page(),
     ],
    );
  }
}



class _NavegacionModel with ChangeNotifier{

  //propiedades
  int _paginaActual             =0;                 //cambiar de página
  PageController _pageController=PageController();  //propiedad privada del pagecontroller que depende de "cambiar página"

  //Getter 
  int            get paginaActual   => this._paginaActual;
  PageController get pageController => this._pageController;

  //Setter
  set paginaActual(int valor){
  this._paginaActual  =valor;
  this._pageController.animateToPage(valor, duration: Duration(milliseconds: 250),curve: Curves.easeOutCirc);

  notifyListeners();
 }
}