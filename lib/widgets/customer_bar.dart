
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerBar extends StatelessWidget with PreferredSizeWidget {
  const CustomerBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff24293E),
        elevation: 0,
        title: Row(
          children: [
            Expanded(
                child: Image.asset(
                  'assets/images/cb_logo.png',
                  height: 50,
                )),
            Expanded(
              flex: 2,
              child: Text(
                'Pair Up',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.message), onPressed: () {}),
          IconButton(icon: Icon(Icons.person), onPressed: () {})
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
