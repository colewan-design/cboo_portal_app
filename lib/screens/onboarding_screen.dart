import 'package:cboo_portal_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();
  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: TextStyle(fontSize: 19),
      bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "View Your Payslips",
          body:
              "Access and review your payslips with ease. Stay informed about your earnings and deductions.",
          image: Image.asset(
            "images/splash1.png",
            width: 200,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Track Compensations & Benefits",
          body:
              "Keep track of all your compensations and benefits in one place. Ensure you’re getting everything you’re entitled to.",
          image: Image.asset(
            "images/splash2.png",
            width: 200,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Monitor Salary Deductions",
          body:
              "Stay updated on your salary deductions. Understand where your money is going.",
          image: Image.asset(
            "images/splash3.png",
            width: 200,
          ),
          decoration: pageDecoration,
          footer: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Text(
                "Let's Go",
                style: TextStyle(
                  color: Colors.white, // Set text color to white
                  fontSize: 18, // Optional: adjust font size if needed
                ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(55),
                  backgroundColor: Color.fromARGB(255, 10, 105, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
        ),
      ],
      showSkipButton: false,
      showDoneButton: false,
      showBackButton: true,
      back: Text(
        "Back",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 10, 105, 50)),
      ),
      next: Text(
        "Next",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 10, 105, 50)),
      ),
      onDone: () {},
      onSkip: () {},
      dotsDecorator: DotsDecorator(
          size: Size.square(10),
          activeSize: Size(20, 10),
          activeColor: Color.fromARGB(255, 10, 105, 50),
          color: Colors.black26,
          spacing: EdgeInsets.symmetric(horizontal: 3),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
    );
  }
}
