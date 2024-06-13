import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneVerificationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var phoneNumber = ''.obs;
  var otp = ''.obs;
  var otpSent = false.obs;
  late String verificationId;

  Future<void> sendOtp() async {
    try {
      await _auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) async {
          //await _auth.signInWithCredential(credential);
        },
        phoneNumber: phoneNumber.value,
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
          otpSent.value = true;
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Verification failed: $e');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('Verification code auto-retrieval timed out');
        },
      );
    } catch (e) {
      print('Error verifying phone number: $e');
    }
  }

  Future<void> verifyOtp(String smsCode, String verificationId) async {
    try {
      PhoneAuthCredential credential =
      PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      await _auth.signInWithCredential(credential);
      // Navigate to the next page or do something else
    } catch (e) {
      print('Error verifying OTP: $e');
    }
  }
}
