import 'package:flutter/material.dart';

class TransforminAnimationView extends StatefulWidget {
  @override
  _TransforminAnimationViewState createState() => _TransforminAnimationViewState();
}

class _TransforminAnimationViewState extends State<TransforminAnimationView> with SingleTickerProviderStateMixin {
  Animation animation, transformingAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 10.0, end: 200.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.ease));

    transformingAnimation = BorderRadiusTween(
        begin: BorderRadius.circular(125.0),
        end: BorderRadius.circular(0.0)
    ).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.ease
    ));

    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {


    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child){
        return Scaffold(
            body: Center(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: animation.value,
                      width: animation.value,
                      decoration: BoxDecoration(
                          borderRadius: transformingAnimation.value,
                          color: Colors.black
                      ),
                    ),
                  )
                ],
              ),
            )

        );
      },
    );
  }
}

