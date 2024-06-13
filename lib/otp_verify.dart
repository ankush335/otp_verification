import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_verification/phone_verification_controller.dart';

class OTPVerificationScreen extends StatelessWidget {
  final PhoneVerificationController _controller =
  Get.find<PhoneVerificationController>();

  final String phoneNumber;

  OTPVerificationScreen({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Enter OTP'),
                keyboardType: TextInputType.number,
                onChanged: (value) => _controller.otp.value = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _controller.verifyOtp(_controller.otp.value, _controller.verificationId),
                child: Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
