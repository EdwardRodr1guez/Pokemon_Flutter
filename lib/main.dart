import 'package:flutter/material.dart';
import 'package:poke_app/src/pages/tab2_page.dart';
import 'package:poke_app/src/pages/tabs_page.dart';
import 'package:poke_app/src/services/index_service.dart';
import 'package:poke_app/src/services/poke_service.dart';

import 'package:poke_app/src/sharepreferences/preferencias.dart';
import 'package:poke_app/src/theme/darktheme.dart';
import 'package:poke_app/src/theme/lighttheme.dart';
import 'package:poke_app/src/pages/tabs_page.dart';
import 'package:poke_app/src/theme/darktheme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SPHelper.sp.initSharedPreferences();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (_) => PokeService()),
       ChangeNotifierProvider(create: (_) => IndexService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:  TabsPage(),// Tab2Page(),//TabsPage(), 
        theme: DarkTheme//DarkTheme,
         ),
    );
  }
}



