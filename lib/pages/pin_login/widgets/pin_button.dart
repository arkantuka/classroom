import 'package:flutter/material.dart';

class PinButton extends StatelessWidget {
  const PinButton({super.key, required this.num, required this.onClick});

  final int num;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
        onTap: onClick,
        child: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            border: num >= 0 && num <= 9
                ? Border.all(color: theme.colorScheme.primary)
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
