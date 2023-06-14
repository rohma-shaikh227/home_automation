import 'package:flutter/material.dart';

class FanPage extends StatefulWidget {
  const FanPage({Key? key}) : super(key: key);

  @override
  _FanPageState createState() => _FanPageState();
}

class _FanPageState extends State<FanPage> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('Fan Speed'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackShape: CircleSliderTrackShape(),
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 10,
              ),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius: 20,
              ),
              activeTrackColor: Colors.yellowAccent,
              inactiveTrackColor: Colors.grey,
              thumbColor: Colors.white,
              overlayColor: Colors.yellowAccent.withOpacity(0.3),
            ),
            child: Slider(
              min: 0,
              max: 5,
              value: _value,
              onChanged: (double value) {
                setState(() {
                  _value = value;
                });
              },
              divisions: 5,
              label: _value == 0 ? 'Off' : 'Speed ${_value.toInt()}',
            ),
          ),
        ),
      ),
    );
  }
}

class CircleSliderTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect(
      {required RenderBox parentBox,
        Offset offset = Offset.zero,
        required SliderThemeData sliderTheme,
        bool isEnabled = false,
        bool isDiscrete = false}) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx + 24;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - 48;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
