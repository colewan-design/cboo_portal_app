import 'package:cboo_portal_app/widgets/rounded_circular_button.dart';
import 'package:cboo_portal_app/widgets/rounded_text_form_field.dart';
import 'package:flutter/material.dart';

class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return RecoveryScreenState();
  }
}

class RecoveryScreenState extends State<RecoveryScreen> {
  RecoveryScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(
        255,
        255,
        255,
        1.0,
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        _header(),
        _newAccountForm(),
      ],
    );
  }

  Widget _header() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      color: const Color.fromRGBO(230, 253, 253, 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "images/home1.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }

  Widget _newAccountForm() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.75,
      child: Container(
        color: const Color.fromRGBO(
          255,
          255,
          255,
          1.0,
        ),
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 25,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _formFields(),
                _bottomButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _formFields() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const RoundedTextFormField(
            hintText: "Reset Code",
            prefixIcon: Icons.account_circle,
          ),
          const RoundedTextFormField(
            hintText: "New Password",
            prefixIcon: Icons.lock,
            obscureText: true,
          ),
          const RoundedTextFormField(
            hintText: "Confirm Password",
            prefixIcon: Icons.lock,
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Widget _bottomButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.80,
          height: MediaQuery.of(context).size.height * 0.06,
          child: const RoundedCircularButton(
            text: "Reset Password",
          ),
        ),
      ],
    );
  }
}
