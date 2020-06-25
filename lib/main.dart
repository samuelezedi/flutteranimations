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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child){
        return Scaffold(
          body: Transform(
            transform: Matrix4.translationValues(animation.value * width, 0.0,0.0),
            child: Center(
              child: Container(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
                )
              ),
            )
          ),
        );
      },
    );
  }
}

