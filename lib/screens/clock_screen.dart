import 'package:flutter/material.dart';


class ClockScreen extends StatelessWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
               DateTime.now().hour > 12 ? 'Good Evening':'Good Morning',style: const TextStyle(
              fontSize: 40,fontWeight: FontWeight.w700,color: Color(0xff1948ac)
            ),),
            const SizedBox(height: 25,),
            Text(DateTime.now().hour >12 ? '${DateTime.now().hour-12} : ${DateTime.now().minute} PM ':
             '0${DateTime.now().hour} : ${DateTime.now().minute} AM',style: const TextStyle(
                fontSize: 40,fontWeight: FontWeight.w700,color: Color(0xff1948ac))),
          ],
        ),
      ),
    );
  }
}
