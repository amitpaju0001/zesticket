import 'package:flutter/material.dart';
import 'package:zesticket/src/common/widgets/custom_button.dart';
import 'package:zesticket/src/common/widgets/custom_otp_text_field.dart';



class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> otpControllers = List.generate(6, (_) => TextEditingController());
  bool isOtpFilled = false;

  void _onOtpChanged() {
    setState(() {
      isOtpFilled = otpControllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          toolbarHeight: 70,
          title: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Zesticket",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              Text(
                "Ticket Booking Platform",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Colors.orange,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Login with mobile number",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
             const SizedBox(height: 12,),
             const Align(
                 alignment: Alignment.topLeft,
                 child: Text("Enter OTP sent to your number",style: TextStyle(color: Colors.black26),)),
            const SizedBox(height: 20),
            CustomOtpTextField(
              controllers: otpControllers,
              otpLength: 6,
              onChanged: (value) => _onOtpChanged(),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            CustomButton(
              text: "Continue",
              onPressed: isOtpFilled ? () {} : null, isEnabled: true,
            ),

          ],
        ),
      ),
    );
  }
}
