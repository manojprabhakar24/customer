import 'package:customer/bottom_nav_screens/fuel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login/login_page.dart';
import 'buy_sell.dart';
import 'finance_insurance.dart';//
import 'loads.dart';
import 'profile.dart';

class MyHomePage extends StatefulWidget {
  final String enteredName;// Add this field
  final String phoneNumber;// Add this field
//ok
  MyHomePage({Key? key, required this.enteredName, required this.phoneNumber, }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      Loads(  enteredName: widget.enteredName,
        phoneNumber: widget.phoneNumber,),
      BuyAndSell(),
      FinanceAndInsurance(),
      fuel(),
      Profile()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leadingWidth: 150,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo_removebg.png',
            fit: BoxFit.fitHeight,
          ),
        ),
        actions: <Widget>[
          Tooltip(
            message: 'Notifications',
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: ImageIcon(AssetImage('assets/icons/bell.png')),
              ),
            ),
          ),
          Tooltip(
            message: 'Help',
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: ImageIcon(AssetImage('assets/icons/question.png')),
              ),
            ),
          ),

        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/loads_icon.png')),
            label: 'Loads',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/buyandsell_icon.png')),
            label: 'Sell & Buy',
          ),

          BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage('assets/icons/financeandinsurance_icon.png')),
            label: 'Finance & Insurance',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/buyandsell_icon.png')),
            label: 'Fuel',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/user_icon.png')),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}