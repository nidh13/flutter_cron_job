import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterapplocalcronjob/core/data_list.dart';
import 'package:flutterapplocalcronjob/local_notification_api.dart';
import 'package:workmanager/workmanager.dart';

const String TAG = "BackGround_Work";
const firstTast = "firstTask";

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case firstTast:
        senddata();
        break;
    }
    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotifcationApi.init();
  Workmanager().initialize(
    callbackDispatcher, // The top level function, aka callbackDispatcher
    isInDebugMode: false, // This should be false
  );
  Workmanager().registerPeriodicTask(
    TAG,
    firstTast,
    initialDelay: Duration(seconds: 10),
    frequency: Duration(seconds: 10),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BackGround Work Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BackGroundWorkSample(),
    );
  }
}

class BackGroundWorkSample extends StatefulWidget {
  @override
  _BackGroundWorkSampleState createState() => _BackGroundWorkSampleState();
}

class _BackGroundWorkSampleState extends State<BackGroundWorkSample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //This task runs periodically
    //It will wait at least 10 seconds before its first launch
    //Since we have not provided a frequency it will be the default 15 minutes
    /*  loalData();*/
  }

  /*void loalData() async {
    _counterValue =
    await BackGroundWork.instance._getBackGroundCounterValue();
    setState(() {});
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BackGround Work Sample'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Counter Value:"),
              RaisedButton(
                onPressed: () {
                  /* loalData();*/
                },
                child: Text("Fetch Current Counter Value"),
              )
            ],
          ),
        ));
  }
}

senddata() async {
  int rndmIndex = Random().nextInt(StaticVars().smallDo3a2.length - 1);

  await NotifcationApi.showNotification(
      title: 'فَذَكِّرْ',
      body: StaticVars().smallDo3a2[rndmIndex],
      payload: 'nidhal.maz');
}
