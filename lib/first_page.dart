import 'package:flutter/material.dart';

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  bool _enabled = false;
  String _msg1 = '';
  String _msg2 = '';
  int _numPressed = 0;

  @override
  Widget build(BuildContext context) {
    Object onPressed1() {
      if (_enabled) {
        return () {
          setState(() {
            _numPressed++;
            _msg1 = 'Clicked $_numPressed'; //Incrament by 1
          });
        };
      } else {
        setState(() {
          _msg1 = '';
          _msg2 = '';
        });
        //print('onPressed1 returning NULL');
        return null;
      }
    }

    Object onPressed2() {
      if (_enabled) {
        return () {
          setState(() {
            _numPressed = 0;
            _msg1 = 'Click Me'; //Reset to 0
          });
        }; //if brackets before the semicolon, it will run and return null, causing button 2 to dissapear
      } else {
        setState(() {
          _msg1 = '';
          _msg2 = '';
        });
        //print(
        //'onPressed2 returning NULL'); //This is always run, the setState() is what changes on button press as long as it's inside return
        return null;
      }
    }

    //print('The build is being RUN');

    return Scaffold(
      appBar: AppBar(
        title: Text('Button Functionality Demo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('enable functionality'),
                Switch(
                    value: _enabled,
                    onChanged: (bool onChangedValue) {
                      _enabled = onChangedValue;
                      setState(() {
                        if (_enabled) {
                          if (_numPressed > 0) {
                            //If the button has already been pressed, enabling it will set it to the previous value
                            _msg1 = 'Clicked $_numPressed';
                          } else {
                            _msg1 = 'Click Me';
                          }
                          _msg2 = 'Reset';
                        } else {
                          _msg1 = '';
                          _msg2 = '';
                        }
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation:
                        8, //The doc example doesn't have the shadow, but I like it
                    textColor: Colors.red.shade100,
                    color: Colors.redAccent,
                    highlightColor: Colors.blue,
                    splashColor: Colors.green.shade300,
                    padding: EdgeInsets.all(20.0),
                    onPressed: onPressed1(),
                    child: Text(_msg1),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation:
                        8, //The doc example doesn't have the shadow, but I like it
                    textColor: Colors.red.shade100,
                    color: Colors.blue,
                    highlightColor: Colors.redAccent,
                    splashColor: Colors.green.shade300,
                    padding: EdgeInsets.all(20.0),
                    onPressed: onPressed2(),
                    child: Text(_msg2),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
