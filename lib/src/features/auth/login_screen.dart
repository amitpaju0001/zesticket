import 'package:flutter/material.dart';
import 'package:zesticket/src/common/widgets/custom_button.dart';
import 'package:zesticket/src/common/widgets/custom_text_field.dart';
import 'package:zesticket/src/features/auth/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  bool isInputFilled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        isInputFilled = _controller.text.length >= 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                isInputFilled
                    ? "Verify your mobile number"
                    : "Login with mobile number",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _controller,
              hintText: "Enter your mobile number",
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                setState(() {
                  isInputFilled = value.length >= 10;
                });
              },
            ),
            const SizedBox(height: 20),
            Spacer(),
            CustomButton(
              text: "Verify",
              onPressed: isInputFilled
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OtpScreen()),
                      );
                    }
                  : null,
              isEnabled: isInputFilled,
            ),
          ],
        ),
      ),
    );
  }
}
