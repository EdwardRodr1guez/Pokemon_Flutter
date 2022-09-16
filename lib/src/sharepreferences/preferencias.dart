import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  SPHelper._();
  static SPHelper sp    = SPHelper._();
  static  int _mensaje  =1;
  static List _likes    =[];

  SharedPreferences? prefs;
  
  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    
  }

  Future<void> save(String name, String value) async {
    await prefs!.setString(name, value);
  }

  Future<void> savefavorites(String name, List<String> value) async {
    await prefs!.setStringList(name, value);
  }

  String? get(String key) {
    return prefs!.getString(key);
  }

  List<String>? getfavoritos (String key){
    return prefs!.getStringList(key);
  }

  Future<bool> delete(String key) async {
    return await prefs!.remove(key);
  }



  int get mensaje{
  return prefs!.getInt("mensaje") ??_mensaje;
  }

  set mensaje(int value){
   _mensaje=value;
   _likes.add(value.toString());
    prefs!.setInt("mensaje", value);
  }

  

   List get likes{
    return prefs!.getStringList("likes")??_likes;
  }


 



}