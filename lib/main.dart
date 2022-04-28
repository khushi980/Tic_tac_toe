import 'package:flutter/material.dart';
import 'home_page.dart';
void main()
{
  runApp(myapp());
}
class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: new ThemeData(primaryColor: Colors.purpleAccent),
      home: new HomePage(),
    );
  }
}
