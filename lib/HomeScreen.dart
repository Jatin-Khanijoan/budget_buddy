import 'package:flutter/material.dart';
import 'json/home_json.dart';
import 'json/day_month.dart';
import 'package:budget_buddy/Analytics.dart';
import 'Add.dart';
import 'HomeTab.dart';



class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;

  final List<Widget> _screens = [
    const HomeTab(),
    const Add(),
    const Analytics(),
  ];

  final List<String> _screenTitles = [
    'Home',
    'Add',
    'Analytics',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BudgetBuddy'),
        leading: Image.asset('assets/icons/bbr.png' ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add notification icon functionality here
            },
          ),
        ],
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Theme.of(context).primaryColor,
      //         ),
      //         child: const Text(
      //           'Dashboard',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Item 1'),
      //         onTap: () {
      //           // Add navigation to item 1 here
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Item 2'),
      //         onTap: () {
      //           // Add navigation to item 2 here
      //         },
      //       ),
      //       // Add more dashboard items as needed
      //     ],
      //   ),
      // ),
      body: _screens[_currentPageIndex],
      bottomNavigationBar: Container(
  decoration: const BoxDecoration(
    color: Colors.black12,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    ),
    backgroundBlendMode: BlendMode.hardLight,
  ),
  child: ClipRRect(
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(20.0),
      bottomRight: Radius.circular(20.0),
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    ),
    child: BottomNavigationBar(
      currentIndex: _currentPageIndex,
      onTap: (int index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      items: _screenTitles.map((title) {
        IconData iconData;
        switch (title) {
          case 'HomeTab':
            iconData = Icons.home;
            break;
          
          case 'Add':
            iconData = Icons.add;
            break;

          case 'Analytics':
            iconData = Icons.analytics;
            break;
            
            default:
            iconData = Icons.home;
        }
        return BottomNavigationBarItem(
          icon: Icon(
            iconData,
            size: 28.0,
            color: _currentPageIndex == _screenTitles.indexOf(title)
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
          label: title,
        );
      }).toList(),
    ),
  ),
),

    );
  }
}


     




















  
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
