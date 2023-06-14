import 'package:flutter/material.dart';
import 'package:home_automation/Dashboard.dart';
import 'package:home_automation/Room.dart';
import 'fan.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var username = TextEditingController();
    var pass = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("Home Automation App"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
          final isLargeScreen = screenWidth > 600;

          return Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Home Automation",
                  style: TextStyle(
                    fontSize: isLargeScreen ? 48 : 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellowAccent,
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    controller: username,
                    style: TextStyle(color: Colors.white), // Set text color to white
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    controller: pass,
                    style: TextStyle(color: Colors.white), // Set text color to white
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    var uname = username.text;
                    var password = pass.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashBoard()),
                    );
                  },
                  child: Text("Login"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        horizontal: isLargeScreen ? 48 : 24,
                        vertical: isLargeScreen ? 24 : 16,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
