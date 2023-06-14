import 'package:flutter/material.dart';
import 'package:home_automation/fan.dart';
import 'package:home_automation/SwitchPage.dart';

class Room extends StatelessWidget {
  final String title;
  final List<String> assetsList = ['Light', 'Fan', 'Air Conditioner', 'Lamp'];
  final List<String> assetsList2 = [
    'assets/images/lights.jpg',
    'assets/images/fan.png',
    'assets/images/ac.png',
    'assets/images/lamp.jpg'
  ];

  Room({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: assetsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FanPage()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SwitchPage()),
                );
              }
            },
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                      child: Image.asset(
                        assetsList2[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          assetsList[index],
                          // style: TextStyle(
                          //   fontWeight: FontWeight.bold,
                          //   fontSize: 18,
                          //   color: Colors.black,
                          // ),
                          style: TextStyle(

                            fontSize:  24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 3,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
