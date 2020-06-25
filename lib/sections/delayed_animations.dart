import 'package:flutter/material.dart';

class DelayedAnimationTest extends StatefulWidget {
  @override
  _DelayedAnimationTestState createState() => _DelayedAnimationTestState();
}

class _DelayedAnimationTestState extends State<DelayedAnimationTest> with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)
        )
    );

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)
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
          body: Column(
            children: <Widget>[
              Transform(
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
              SizedBox(
                height: 10,
              ),
              Transform(
                  transform: Matrix4.translationValues(delayedAnimation.value * width, 0.0,0.0),
                  child: Center(
                    child: Container(
                      child:Text(
                          'Register',
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
                      ),
                    ),
                  )
              ),
              SizedBox(
                height: 10,
              ),
              Transform(
                  transform: Matrix4.translationValues(muchDelayedAnimation.value * width, 0.0,0.0),
                  child: Center(
                    child: Container(
                      child:Text(
                          'Button',
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
                      ),
                    ),
                  )
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}

