import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login/login_page.dart';
import 'buy_sell.dart';
import 'finance_insurance.dart';
import 'loads.dart';
import 'profile.dart';

class MyHomePage extends StatefulWidget {
<<<<<<< HEAD
  final String enteredName;
  final String phoneNumber;

  const MyHomePage({Key? key, required this.enteredName, required this.phoneNumber}) : super(key: key);
=======
  final String enteredName; // Add this field

  MyHomePage({Key? key, required this.enteredName}) : super(key: key);
>>>>>>> origin/master

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
<<<<<<< HEAD
      Loads(  enteredName: widget.enteredName, phoneNumber: widget.phoneNumber,
        ),
=======
      Loads(  enteredName: widget.enteredName,
        phoneNumber: '',),
>>>>>>> origin/master
      BuyAndSell(),
      FinanceAndInsurance(),
      Profile()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _logout(BuildContext context) async {
    // Clear the authentication state
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    // Navigate back to the login screen
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => LoginScreen(onLogin: () {})),
          (Route<dynamic> route) => false,
    );
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
<<<<<<< HEAD
=======
          Tooltip(
            message: 'Logout',
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () => _logout(context), // Pass the context here
                icon: Icon(Icons.login_outlined),
              ),
            ),
          ),
>>>>>>> origin/master
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
<<<<<<< HEAD
}
=======
}
>>>>>>> origin/master
