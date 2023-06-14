import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({Key? key}) : super(key: key);

  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('Switch'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              _isSwitched = !_isSwitched;
            });
          },
          child: Container(
            color: Colors.black,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: _isSwitched ? Colors.yellow : Colors.grey,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.power_settings_new,
                    size: 50,
                    color: Colors.white,
                  ),
                  Text(
                    _isSwitched ? 'ON' : 'OFF',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
