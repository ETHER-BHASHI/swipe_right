
import 'package:cb/widgets/user_image_small.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modals/user_modal.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(user.imageUrls[0]),
                ),
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(200, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0),

                ],
                  begin: Alignment.bottomCenter,
                  end:Alignment.topCenter,),),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name},${user.age}',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    user.branch,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  Row(
                    children: [
                      UserImageSmall(imageUrl: user.imageUrls[0]),
                      UserImageSmall(imageUrl: user.imageUrls[1]),
                      UserImageSmall(imageUrl: user.imageUrls[2]),
                      UserImageSmall(imageUrl: user.imageUrls[3]),
                      SizedBox(width:10),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(Icons.info_outline,
                            size: 25, color: Theme.of(context).primaryColor),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
