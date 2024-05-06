import 'package:bfix_learning/home.dart';
import 'package:flutter/material.dart';

class intro extends StatelessWidget {
  const intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,20),
                child: Image.asset(
                  "images/logo linear.png",
                  width: 250,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewApp(userType: 'user'),
                        ),
                      );
                    },
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(Size(300, 50)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(185, 32, 37, 1))),
                    child: Text(
                      'User',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewApp(userType: 'driver'),
                        ),
                      );
                    },
                    style: ButtonStyle(
                        minimumSize:
                        MaterialStateProperty.all(Size(300, 50)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(185, 32, 37, 1))),
                    child: Text(
                      'Driver',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewApp(userType: 'hospital'),
                        ),
                      );
                    },
                    style: ButtonStyle(
                        minimumSize:
                        MaterialStateProperty.all(Size(300, 50)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(185, 32, 37, 1))),
                    child: Text(
                      'Hospital',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
