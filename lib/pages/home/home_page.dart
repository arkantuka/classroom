import 'package:classroom/pages/home/widgets/attendance.dart';
import 'package:classroom/pages/home/widgets/notifications.dart';
import 'package:classroom/pages/home/widgets/time_table.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget _buildPageBody() {
      switch (_selectedIndex) {
        case 0:
          return const TimeTable();
        case 1:
          return const Attendance();
        case 2:
          return const AppNotifications();
        default:
          return Text('Home Page');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              BottomNavigationBar(
                onTap: (int index) {
                  setState(
                    () {
                      _selectedIndex = index;
                    },
                  );
                },
                currentIndex: _selectedIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: 'ตารางเรียน/สอน',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox.shrink(),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: 'แจ้งเตือน',
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Center(
              child: InkWell(
                splashColor: Colors.pink[300],
                onTap: () {
                  setState(
                    () {
                      _selectedIndex = 1;
                    },
                  );
                },
                borderRadius: BorderRadius.circular(50.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check,
                        color: _selectedIndex == 1
                            ? Theme.of(context).primaryColor
                            : null, //_selectedIndex == 1 ? Colors.deepPurple : null) : null,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'เช็คชื่อ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _selectedIndex == 1
                              ? Theme.of(context).primaryColor
                              : null, //_selectedIndex == 1 ? Colors.deepPurple : null) : null,
                          fontSize: _selectedIndex == 1 ? 16.0 : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: _buildPageBody(),
      ),
    );
  }
}
