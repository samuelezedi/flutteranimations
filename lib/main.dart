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

