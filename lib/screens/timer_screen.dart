import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomTimerController _controller = CustomTimerController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTimer(
                controller: _controller,
                begin: Duration(days: 1),
                end: Duration(),
                builder: (time) {
                  return Text(
                      "${time.hours}:${time.minutes}:${time.seconds}.${time.milliseconds}",
                      style: TextStyle(fontSize: 30));
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    onPressed: () {
                      _controller.start();
                    },
                    child: const Text(
                      'Start',
                      style: TextStyle(fontSize: 20),
                    ),
                    color: Colors.amber,
                ),

                const SizedBox(
                  width: 15,
                ),
                RaisedButton(onPressed: () {
                  _controller.pause();
                },
                  child: const Text(
                  'Pause',
                  style: TextStyle(fontSize: 20),
                ),
                  color: Colors.indigo,
                ),
                const SizedBox(
                  width: 15,
                ),
                RaisedButton(onPressed: () {
                  _controller.reset();
                },
                  child: const Text(
                  'Reset',
                  style: TextStyle(fontSize: 20),
                ),
                  color: Colors.deepOrange,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
