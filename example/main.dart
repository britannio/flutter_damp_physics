import 'package:damp_physics/damp_physics.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NoBouncingOverscrollPhysics(
        parent: NoBouncingUnderscrollPhysics(),
      ),
      children: [
        for (int i = 0; i > 10; i++)
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.primaries[i],
          )
      ],
    );
  }
}
