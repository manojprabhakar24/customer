import 'dart:async';

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
  String errorMessage = "";
  int _secondsRemaining = 60;
  late Timer _timer;
  bool isResendButtonVisible = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    // Initial OTP sending when the OTP screen is first displayed
    sendOTP(widget.enteredName);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_secondsRemaining == 0) {
        // Timer expired
        timer.cancel();
        setState(() {
          isResendButtonVisible = true;
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,

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
                  showCursor: true,
                  controller: _otpController,
                  onChanged: (value) {
                    // Check if entered OTP is correct
                    if (value.length == 6) {
                      _verifyOTP(value);
                    } else {
                      // Clear the error message if OTP is not 6 digits
                      setState(() {
                        errorMessage = "";
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                // Display error message or Resend OTP button
                isResendButtonVisible
                    ? ElevatedButton(
                  onPressed: () {
                    // Implement logic to resend OTP
                    resendOTP(widget.enteredName);
                  },
                  child: Text('Resend OTP'),
                )
                    : Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: 18,
                ),
                // Display timer
                Text(
                  'Time remaining: $_secondsRemaining seconds',
                  style: TextStyle(color: Colors.black),
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
      // Check if the OTP is expired
      if (isResendButtonVisible) {
        setState(() {
          errorMessage = 'OTP expired. Please request a new OTP.';
        });
        return;
      }

      // Obtain the current timestamp
      DateTime now = DateTime.now();

      // Replace this line with the actual timestamp when the OTP was sent
      // This timestamp should be obtained when the OTP is initially sent
      DateTime otpSentTime = DateTime.now();

      // Calculate the time difference in seconds
      int timeDifference = now
          .difference(otpSentTime)
          .inSeconds;

      // Check if the time difference is within the 60-second window
      if (timeDifference > 60) {
        setState(() {
          errorMessage = 'OTP expired. Please request a new OTP.';
        });
        return;
      }

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
          builder: (_) =>
              FormScreen(
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
            'invalid-verification-id': 'Invalid verification ID. Please restart the process.',
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

  void resendOTP(String phoneNumber) {
    // Replace this function with your actual OTP sending logic
    // For example, you might call an API to send a new OTP to the given phone number
    sendOTP(phoneNumber);

    // Reset timer and UI
    setState(() {
      _secondsRemaining = 60;
      isResendButtonVisible = false;
      errorMessage = "";
    });

    // Start timer again
    startTimer();
  }

  void sendOTP(String phoneNumber) {
    // Replace this function with your actual OTP sending logic
    // For example, you might call an API to send a new OTP to the given phone number
    print('Sending OTP to $phoneNumber');
    // Simulating OTP sending with a delay
    Future.delayed(Duration(seconds: 2), () {
      print('OTP Sent Successfully');
    });
  }

}