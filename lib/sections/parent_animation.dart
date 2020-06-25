import 'package:flutter/material.dart';

class ParentAnimationView extends StatefulWidget {
  @override
  _ParentAnimationViewState createState() => _ParentAnimationViewState();
}

class _ParentAnimationViewState extends State<ParentAnimationView> with SingleTickerProviderStateMixin {
  Animation animation, childAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: -0.10, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeIn));

    childAnimation = Tween(begin: 20.0, end: 125.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Curves.easeIn
        )
    );
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child){
        return Scaffold(
          body:  Transform(
              transform: Matrix4.translationValues(animation.value * width, 0.0,0.0),
              child: Center(
                child: Container(
                  child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
                  ),

                ),
              )
          ),


        );
      },
    );
  }
}

