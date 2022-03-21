import 'package:flutter/material.dart';
import 'package:task3/screens/alarm_screen.dart';
import 'package:task3/screens/clock_screen.dart';
import 'package:task3/screens/stop_watch_screen.dart';
import 'package:task3/screens/timer_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: const Color(0xff325cb5),
          title: const Text('Tick Tock',style: TextStyle(
            fontWeight: FontWeight.w600,fontSize: 25
          ),),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Image.asset('assets/images/alarm_clock.png',height: 25,),
                child: const Text('Alarm',style: TextStyle(fontSize: 12),),
              ),
              Tab(
                icon: Image.asset('assets/images/world_icon.png',height: 25,),
                child: const Text('Clock',style: TextStyle(fontSize: 12),),
              ),
              Tab(
                icon: Image.asset('assets/images/timer_icon.png',height: 25,),
                child: const Text('Timer',style: TextStyle(fontSize: 12),),
              ),
              Tab(
                icon: Image.asset('assets/images/stopwatch_icon.png',height: 25,),
                child: const Text('Stop Watch',style: TextStyle(fontSize: 12),),
              ),
            ],
          ),
        ),
        body: const TabBarView(children:
             [
               AlarmScreen(),
               ClockScreen(),
               TimerScreen(),
               StopWatchScreen(),
             ]
        ),
      ),
    );
  }
}
