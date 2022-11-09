import 'package:flutter/cupertino.dart';
import 'package:cb/modals/user_modal.dart';
import 'package:flutter/material.dart';

import '../screens/home.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){
    print('The Route is: ${settings.name}');

    switch(settings.name){
      case :
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => home(),
        );
      //case home.routeName():
       // return home.routeName ;
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text('hello')
          ),
        ),
    );
  }
}
