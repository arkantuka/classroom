import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CLASSROOM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const keypad = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [-2, 0, -1],
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              for (int i = 0; i < 6 - _input.length; i++)
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

        for (var row in HomePage.keypad) _buildRow(row),
      ],
    );
  }

  // Widget func(int num) => _buildButton(num);
  Widget _buildRow(List<int> numList) {
    List<Widget> widget = numList.map((int num) => _buildButton(num)).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget,

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
    );
  }

  Widget _buildButton(int num) {
    String? label;

    // num 0-9
    List<String> labelList = [
      'zero',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine'
    ];

    if (num >= 0 && num <= 9) {
      label = labelList[num];
    }

    // เหมือนกับการทำ conditional expression ด้านล่าง
    // BoxBorder? border;
    // if (num >= 0 && num <= 9) {
    //   border = Border.all(color: Colors.deepPurple);
    // }

    // conditional expression operator ?:
    // หน้า ? คือเงื่อนไข หลัง ? คือสิ่งที่จะทำถ้าเป็น true หลัง : คือสิ่งที่จะทำถ้าเป็น false
    // var border = num >= 0 && num <= 9
    // ? Border.all(color: Colors.deepPurple)
    // : null;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(
            () {
              _input = num == -1
                  ? _input.substring(0, _input.length - 1)
                  : num == -2
                      ? ''
                      : _input + num.toString();
            },
          );
        },
        child: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            border: num >= 0 && num <= 9
                ? Border.all(color: Colors.deepPurple)
                : null,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (num >= 0 && num <= 9) Text(num.toString()),
                if (num >= 0 && num <= 9) Text(label ?? ''),
                if (num == -2) Icon(Icons.close),
                if (num == -1) Icon(Icons.backspace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
