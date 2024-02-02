import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../form.dart';
import 'login_page.dart';

class OTP extends StatefulWidget {
  final String enteredName;

  const OTP({Key? key, required this.enteredName}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final TextEditingController _otpController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          backgroundColor: Color(0xffffded0),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/1.png',
                width: 200,
                height: 100,
              ),
              Text(
                'Welcome',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.grey, Color(0xffBBDABB)]),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Verify your Phone Number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 50,
                ),
                Pinput(
                  length: 6,
                  defaultPinTheme:defaultPinTheme,
                  showCursor: true,
                  controller: _otpController,
                  onChanged: (value) {
                    // Check if entered OTP is correct
                    if (value.length == 6) {
                      _verifyOTP(value);
                    } else {
                      // Clear the error message if OTP is not 6 digits
                      setState(() {
                        errorMessage = '';
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                // Display error message
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _verifyOTP(String enteredOTP) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: LoginScreen.verify,
        smsCode: enteredOTP,
      );

      // Show loading indicator here if needed
      // setState(() {});

      await APIs.auth.signInWithCredential(credential);

      // Navigate to the next screen on successful verification
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => FormScreen(
            enteredName: widget.enteredName,
          ),
        ),
      );
    } catch (e) {
      // Handle errors more gracefully, show custom user-friendly messages
      print("Error verifying OTP: $e");

      setState(() {
        if (e is FirebaseAuthException) {
          // Map error codes to custom messages
          const errorMessages = {
            'invalid-verification-code': 'Incorrect OTP. Please try again.',
            'invalid-verification-id':
            'Invalid verification ID. Please restart the process.',
            // Add more error codes and messages as needed
          };

          // Use custom message if available, otherwise use a generic message
          errorMessage = errorMessages[e.code] ??
              'An unexpected error occurred. Please try again.';
        } else {
          errorMessage = 'An unexpected error occurred. Please try again.';
        }
      });
    }
  }
}
