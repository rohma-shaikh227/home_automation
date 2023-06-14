import 'package:flutter/material.dart';
import 'package:home_automation/Room.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          "Home Automation App",
          style: TextStyle(fontSize: 20),
        ),
        leading: InkWell(
          child: Icon(Icons.home_outlined),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashBoard()),
            );
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
          final isLargeScreen = screenWidth > 600;

          return Container(
            color: Colors.black,
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: isLargeScreen ? 22 : 11, vertical: isLargeScreen ? 22 : 11),
              children: [
                SizedBox(height: 10),
                _buildRoomItem(
                  context,
                  'assets/images/lvroom2.jpeg',
                  'Living Room',
                  'Living Room',
                  isLargeScreen,
                ),
                SizedBox(height: 10),
                _buildRoomItem(
                  context,
                  'assets/images/droom2.jpg',
                  'Drawing Room',
                  'Drawing Room',
                  isLargeScreen,
                ),
                SizedBox(height: 10),
                _buildRoomItem(
                  context,
                  'assets/images/kitchen.jpeg',
                  'Kitchen Room',
                  'Kitchen Room',
                  isLargeScreen,
                ),
                SizedBox(height: 10),
                _buildRoomItem(
                  context,
                  'assets/images/broom.jpg',
                  'Bedroom',
                  'Bedroom',
                  isLargeScreen,
                ),
                SizedBox(height: 10),
                _buildRoomItem(
                  context,
                  'assets/images/bedroom.jpg',
                  'Master Bedroom',
                  'Master Bedroom',
                  isLargeScreen,
                ),
                SizedBox(height: 10),
                _buildRoomItem(
                  context,
                  'assets/images/office.jpg',
                  'Office',
                  'Office',
                  isLargeScreen,
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellowAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _addRoom(context);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        shape: CircularNotchedRectangle(),
        child: Container(
          color: Colors.black54,
          height: 50,
        ),
      ),
    );
  }

  Widget _buildRoomItem(
      BuildContext context,
      String imageAsset,
      String roomName,
      String pageTitle,
      bool isLargeScreen,
      ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Room(title: pageTitle),
          ),
        );
      },
      child: Container(
        height: isLargeScreen ? 200 : 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(isLargeScreen ? 24.0 : 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                roomName,
                style: TextStyle(
                  fontSize: isLargeScreen ? 36 : 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 3,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addRoom(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String roomName = '';

        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.black54,
            // Add any other customizations for the dialog theme
          ),
          child: AlertDialog(
            title: Text('Add Room', style: TextStyle(color: Colors.white)),
            content: TextField(
              onChanged: (value) {
                roomName = value;
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Room Name',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (roomName.isNotEmpty) {
                    Navigator.of(context).pop();
                    _showRoomAddedPrompt(context, roomName);
                  }
                },
                child: Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showRoomAddedPrompt(BuildContext context, String roomName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text('Room Added',style: TextStyle(
            color: Colors.white,
          ),),
          content: Text('The room "$roomName" has been added.', style:TextStyle(
            color: Colors.white
          ),),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },

              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
