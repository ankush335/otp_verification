import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_verification/otp_verify.dart';
import 'package:otp_verification/phone_verification_controller.dart';

class PhoneVerificationScreen extends StatelessWidget {
  final PhoneVerificationController _controller =
  Get.put(PhoneVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Enter Phone Number'),
                keyboardType: TextInputType.phone,
                onChanged: (value) => _controller.phoneNumber.value = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _controller.sendOtp();
                  Get.to(OTPVerificationScreen(phoneNumber: _controller.phoneNumber.value));
                },
                child: Text('Receive OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
