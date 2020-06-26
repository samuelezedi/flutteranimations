import 'package:flutter/material.dart';

class ValueChange extends StatefulWidget {
  @override
  _ValueChangeState createState() => _ValueChangeState();
}

class _ValueChangeState extends State<ValueChange> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 4), vsync: this);
    animation = Tween(begin: 0, end: 10).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeOut));

    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {


    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child){
        return Scaffold(
            body: Center(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text('Loading...'),
                      Text(animation.value.toString(), style: TextStyle(fontSize: 52,),)
                    ],
                  ),
                )
            )

        );
      },
    );
  }
}

