import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));
    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));
    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
            body: Center(
                child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                width: 350,
                height: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                      elevation: 7.0,
                      textColor: Colors.white,
                      child: Text('Ok'),
                      color: Colors.green,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      elevation: 7.0,
                      textColor: Colors.white,
                      child: Text('Cancel'),
                      color: Colors.green,
                    )
                  ],
                ),
              ),
            ),
            Center(
                child: GestureDetector(
                  onTap: (){
                    animationController.forward();
                  },
                  onDoubleTap: (){
                    animationController.reverse();
                  },
              child: Container(
                alignment: Alignment.bottomCenter,
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    borderRadius: BorderRadius.circular(15)),
                transform: Matrix4.translationValues(
                    0.0, animation.value * width, 0.0),
              ),
            ))
          ],
        )));
      },
    );
  }
}
