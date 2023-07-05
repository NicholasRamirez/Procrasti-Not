// imported packages to provide functional code from other files
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';
import 'package:intl/intl.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  // variables
  int _seconds = 0;
  int _minutes = 30;
  Timer _timer = Timer(Duration(milliseconds: 1), () {});
  var formatNum = NumberFormat("00");

  // Start timer method
  void _startTimer() {
    if(_timer != null) {
      _timer.cancel();
    }
    if (_minutes > 0) {
      _seconds = _minutes * 60;
    }
    if (_seconds > 60) {
      _minutes = (_seconds / 60).floor();
      _seconds = _seconds - (_minutes * 60);
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0 ) {
        _seconds--;
        } else {
          if (_minutes > 0 ) {
            _seconds = 59;
            _minutes--;
          } else {
            _timer.cancel();
            print("Timer has finished");
          }
        }
      });
    });
  }

  // Stop timer method
  void _stopTimer() {
    _timer.cancel();
  }

  // Reset timer method
  void _resetTimer() {
    _seconds = 0;
    _minutes = 30;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top of page information
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,

      // Body of page
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.all(25.0),
            color: Colors.black,
            alignment: Alignment.center,
            width: 300.0,
            height: 100.0,
            child: const Text(
              'Timer',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${formatNum.format(_minutes)} : ${formatNum.format(_seconds)}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 250,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Button stops the timer
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _stopTimer();
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue[300]!),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "stop",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                )
              ),

              // Button starts the timer
              ElevatedButton(
                  onPressed: () {
                    _startTimer();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue[300]!),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "start",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Button resets the timer
              ElevatedButton(
                  onPressed: () {
                    _resetTimer();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue[300]!),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "reset",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}
