import 'package:auto_route/auto_route.dart';
import 'package:cb/blocs/swipe/swipe_bloc.dart';
import 'package:cb/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'config/app_router.dart';
import 'modals/user_modal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override

Widget build(BuildContext context) {
  return
  MultiBlocProvider(providers:[
    BlocProvider(create:(_) => SwipeBloc()..add(
      LoadUsersEvent(users: User.users))
  ),],
       child:MaterialApp(
  title: 'Flutter Demo',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
  scaffoldBackgroundColor: Color(0xff24293E), //<-- SEE HERE
  ),
         onGenerateRoute: AppRouter.onGenerateRoute,
    initialRoute: home.routeName,
       ),
  );
}
}
