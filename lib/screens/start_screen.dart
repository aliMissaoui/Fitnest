import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  TextEditingController usernameInput = TextEditingController();
  TextEditingController userPasswordInput = TextEditingController();
  TextEditingController userConfirmPasswordInput = TextEditingController();

  late String _username;
  late String _password;
  late String _confirmPassword;
  bool _obscureText = true;
  bool _obscureText2 = true;
  bool checkedValue = true;
  bool isLoginOpen = false;

  final _formKeyLogin = GlobalKey<FormState>();
  final _formKeyRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fitnest-img.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/fitnest-logo.png'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'FITNEST',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff024562),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 40.0,
                      ),
                      child: isLoginOpen
                          ? Form(
                              key: _formKeyLogin,
                              child: Column(
                                children: [
                                  buildUsernameInput(),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  buildPasswordInput(),
                                  buildLoginButton(),
                                  buildBottomMessage(),
                                ],
                              ),
                            )
                          : Form(
                              key: _formKeyRegister,
                              child: Column(
                                children: [
                                  buildUsernameInput(),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  buildPasswordInput(),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  buildConfirmPasswordInput(),
                                  buildRegisterButton(),
                                  buildBottomMessagev2(),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildUsernameInput() {
    return TextFormField(
      controller: usernameInput,
      onChanged: (value) {
        setState(() {
          _username = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your username';
        }
        return null;
      },
      style: const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: const InputDecoration(
        focusColor: Colors.white,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        fillColor: Colors.white,
        labelText: 'Username',
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  buildPasswordInput() {
    return TextFormField(
      controller: userPasswordInput,
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
      onSaved: (val) => _password = val!,
      obscureText: _obscureText,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        focusColor: Colors.white,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
        ),
        fillColor: Colors.white,
        labelText: 'Password',
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  buildConfirmPasswordInput() {
    return TextFormField(
      controller: userConfirmPasswordInput,
      onChanged: (value) {
        setState(() {
          _confirmPassword = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
      onSaved: (val) => _password = val!,
      obscureText: _obscureText2,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        focusColor: Colors.white,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText2 = !_obscureText2;
            });
          },
          child: Icon(
            _obscureText2 ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
        ),
        fillColor: Colors.white,
        labelText: 'Confirm password',
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 48.0,
        bottom: 28.0,
      ),
      child: ElevatedButton(
        onPressed: () {
          if (_formKeyLogin.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Loading ...')),
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xff024562)),
          elevation: MaterialStateProperty.all(12.0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
                side: const BorderSide(color: Colors.white)),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 64.0,
          ),
          child: Text(
            'LOGIN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  buildRegisterButton() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 48.0,
        bottom: 28.0,
      ),
      child: ElevatedButton(
        onPressed: () {
          if (_formKeyRegister.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Loading ...')),
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xff024562)),
          elevation: MaterialStateProperty.all(12.0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
                side: const BorderSide(color: Colors.white)),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 64.0,
          ),
          child: Text(
            'REGISTER',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  buildBottomMessage() {
    return RichText(
      text: TextSpan(
        text: 'Don\'t have an account?  ',
        style: const TextStyle(fontFamily: 'Montserrat', color: Colors.white),
        children: <TextSpan>[
          TextSpan(
            text: 'SIGN UP',
            style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: Colors.white),
            recognizer: TapGestureRecognizer()
              ..onTap = () => setState(() {
                    isLoginOpen = !isLoginOpen;
                  }),
          ),
        ],
      ),
    );
  }

  buildBottomMessagev2() {
    return RichText(
      text: TextSpan(
        text: 'Already have an account?  ',
        style: const TextStyle(fontFamily: 'Montserrat', color: Colors.white),
        children: <TextSpan>[
          TextSpan(
            text: 'LOGIN',
            style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: Colors.white),
            recognizer: TapGestureRecognizer()
              ..onTap = () => setState(() {
                    isLoginOpen = !isLoginOpen;
                  }),
          ),
        ],
      ),
    );
  }
}
