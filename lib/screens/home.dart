import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/swipe/swipe_bloc.dart';
import '../modals/user_modal.dart';
import '../widgets/choice_button.dart';
import '../widgets/customer_bar.dart';
import '../widgets/user_card.dart';
import '../widgets/user_image_small.dart';

class home extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => home(),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerBar(),
      body: BlocBuilder<SwipeBloc,SwipeState>(
        builder: (context,state){
          if (state is SwipeLoading) {
            return Center(child: CircularProgressIndicator(),
            );
          }
          else if (state is SwipeLoaded){
            return Column(children: [
              Draggable(
                child: UserCard(user: state.users[0]),
                feedback: UserCard(user: state.users[0]),
                childWhenDragging: UserCard(user: state.users[1]),
                onDragEnd: (drag){
                  if (drag.velocity.pixelsPerSecond.dx<0){
                    context.read<SwipeBloc>()
                    ..add(SwipeLeftEvent(user: state.users[0]));
                    print('Swiped Left');
                  } else{
                    context.read<SwipeBloc>()
                      ..add(SwipeRightEvent(user: state.users[0]));
                    print('Swiped right');
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 60,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<SwipeBloc>()
                          ..add(SwipeLeftEvent(user: state.users[0]));
                      },
                      child: ChoiceButton(
                          width: 50,
                          height: 50,
                          size: 55,
                          color:Color(0xff24293E),
                          hasGradient: false,
                          icon: Icons.clear_rounded),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    InkWell(
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeLeftEvent(user: state.users[0]));
                        },
                        child: ChoiceButton(width: 60, height: 60, size: 1000, hasGradient: true, color: Colors.red, icon: Icons.favorite)),
                    SizedBox(
                      width: 40,
                    ),
                    ChoiceButton(width: 50, height: 50, size: 55, hasGradient: false ,color:Color(0xff24293E) ,
    icon: Icons.watch_later,
    )
    ],

                ),
              ),
            ],
            );}
            else {
              return Text('Something went wrong.');
          }
          },
      )
    );
  }
}
