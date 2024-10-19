// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: CounterDown(),
    );
  }
}

class CounterDown extends StatefulWidget {
  const CounterDown({super.key});

  @override
  State<CounterDown> createState() => _CounterDownState();
}

class _CounterDownState extends State<CounterDown> {
  int numOFsecond=3 ;
  Timer ?stop;
  String finsh='';
  
  changeTimer(){
     stop= Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (numOFsecond==0) {
         timer.cancel() ;
         finsh='PERFECT (*_*)'
          ;        
        } else {numOFsecond--;
          
        }
      });
    });

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 42),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              numOFsecond==0? finsh: numOFsecond.toString().padLeft(2,"0"),
              style: TextStyle(fontSize: numOFsecond>0? 80:30 ,color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'seconds',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    
                    changeTimer();
                    if (numOFsecond==0) {
                      setState(() {
                        numOFsecond=3;
                      });
                      
                    };},
                  child: Text('Start timer',style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor:MaterialStatePropertyAll( Colors.blueAccent)),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {stop!.cancel();},
                  child: Text('Stop timer',style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
