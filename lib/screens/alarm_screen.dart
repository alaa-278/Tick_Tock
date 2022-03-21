import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  String? date;
  String? time;
  List listDate=[];
  List listTime=[];
  void addToList(){
     listDate.add(date);
     listTime.add(time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff325cb5),
        onPressed: () async {
          showDateDialouge().then((value) {
            setState(() {
              date = value;
              print(date);

            });
            showTimeDialouge().then((value) {
              setState(() {
                time = value;
                print(time);
              });
              addToList();
            });
          });
        },
        child: const Icon(Icons.add),
      ),
      body:
      listTime.isEmpty? const Center(child: Text(
        'Sorry Dear there is no Alarms, \n              Lets add one !',style: TextStyle(
        fontSize: 25,fontWeight: FontWeight.w700,color: Colors.black54
      ),
      ),): ListView.builder(
        itemBuilder: (context, index) => buildItem(listDate[index],listTime[index]),
        itemCount: listTime.length,
      ),
    );
  }

  Widget buildItem(String date, String time) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.label,
                            color: Colors.deepOrange,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                            child: Text(
                              'Alarm',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                  color: Color(0xff1948ac)
                              ),
                            ),
                          ),
                          Text(
                            time,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      (Text(
                        '\t\t\t\t\t\t\t $date',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Center(
              child: Container(
                child: Switch(
                  onChanged: (value) {},
                  activeColor: Colors.deepOrange,
                  value: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future showDateDialouge() async {
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2050));
    print(date);
    return date.toString().substring(0,10);
  }

  Future showTimeDialouge() async {
    var time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now(),
        );
    var localization = MaterialLocalizations.of(context);
    localization.formatTimeOfDay(time!).toString();
    print(time);
    return localization.formatTimeOfDay(time!).toString();
  }
}
