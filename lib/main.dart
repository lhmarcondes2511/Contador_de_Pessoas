import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "COntador de pessoas",
    home: Home()
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode Entrar!";

  void _changePeople(int delta){
    setState(() {
      _people += delta;

      if(_people >= 10){
        _infoText = "Estamos lotado!";
        _people = 10;
      }else if(_people < 0){
        _infoText = "Mundo invertido?";
      }else {
        _infoText = "Pode Entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoas: $_people",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: (){
                      _changePeople(1);
                    },
                    child: Text(
                      "+1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: (){
                      _changePeople(-1);
                    },
                    child: Text(
                      "-1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0
              ),
            ),
          ],
        )
      ],
    );
  }
}
