import 'package:classroom/pages/home/home_page.dart';
import 'package:classroom/pages/pin_login/widgets/pin_button.dart';
import 'package:flutter/material.dart';

class pinLogInPage extends StatefulWidget {
  const pinLogInPage({super.key});

  static const keypad = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [-2, 0, -1],
  ];

  @override
  State<pinLogInPage> createState() => _pinLogInPageState();
}

class _pinLogInPageState extends State<pinLogInPage> {
  static const inputLength = 4;
  static const password = '0527';
  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(Icons.security, size: 100),
              Text('PIN LOGIN'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < _input.length; i++)
                Icon(Icons.radio_button_checked),
              for (int i = 0; i < inputLength - _input.length; i++)
                Icon(Icons.radio_button_unchecked),
            ],
          ),
          _buildKeypad(),
        ],
      ),
    );
  }

  Column _buildKeypad() {
    return Column(
      children: [
        // _buildRow([1, 2, 3]),
        // _buildRow([4, 5, 6]),
        // _buildRow([7, 8, 9]),

        for (var row in pinLogInPage.keypad) _buildRow(row),
      ],
    );
  }

  void _handleClickButton(int num) {
    setState(
      () {
        if (_input.length >= inputLength) return;

        if (num == -1)
          _input = _input.substring(0, _input.length - 1);
        else if (num == -2)
          _input = '';
        else
          _input += num.toString();

        // _input = num == -1
        //     ? _input.substring(0, _input.length - 1)
        //     : num == -2
        //         ? ''
        //         : _input + num.toString();

        if (_input.length == password.length) {
          if (_input == password) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          } else {
            _showMyDialog();
            _input = '';
          }
        }
      },
    );
  }

  // Widget func(int num) => _buildButton(num);
  Widget _buildRow(List<int> numList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var num in numList)
          PinButton(
            num: num,
            onClick: () {
              _handleClickButton(num);
            },
          ),
      ],
    );

    // List<Widget> widget = numList.map((int num) => _buildButton(num)).toList();

    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    // children: widget,

    // อีกวิธีที่ทำได้ collection for-loop ต้องใช้ภายใน list วงเล็บ [] เท่านั้น
    // children: [
    // ส่วนในวงเล็บคือจำนวน loop ที่ต้องการ ด้านหลังคือค่าที่จะเอามาเก็บ
    //   for (var num in numList) _buildButton(num),
    // ],

    // collection ใช้อีกแบบคู่กับ if else ได้ เช่น
    // List<int> numList = [
    //   for (var i=2 ; i<10 ; i++)
    //     if (i % 2 == 0) i
    // ];
    // จะเก็บค่าที่เป็นคู่ทั้งหมดเป็นลิสต์
    // );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('แจ้งเตือน'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('รหัส PIN ไม่ถูกต้อง'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ตกลง'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
