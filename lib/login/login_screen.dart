import 'package:flexibleea/signup/signup_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isRememberMe = false;
  final TextEditingController _emailTextController =
      TextEditingController(text: '');
  final TextEditingController _passTextController =
      TextEditingController(text: '');
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();

  final _loginFormKey = GlobalKey<FormState>();

  Widget buildEmail() {
    return Form(
        key: _loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Email',
              style: TextStyle(
                  color: Color.fromARGB(255, 31, 28, 28),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ]),
              height: 60,
              child: TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(_emailFocusNode),
                keyboardType: TextInputType.emailAddress,
                controller: _emailTextController,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'enter valid email address';
                  } else {
                    return null;
                  }
                },
                style: const TextStyle(color: Colors.black87),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14),
                    prefixIcon: Icon(Icons.email,
                        color: Color.fromARGB(255, 15, 126, 126)),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black38)),
              ),
            )
          ],
        ));
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: TextStyle(
              color: Color.fromARGB(255, 31, 28, 28),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            textInputAction: TextInputAction.next,
            focusNode: _passFocusNode,
            keyboardType: TextInputType.visiblePassword,
            controller: _passTextController,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty || value.length < 8) {
                return 'password must be at least 8 characters';
              } else {
                return null;
              }
            },
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon:
                    Icon(Icons.lock, color: Color.fromARGB(255, 15, 126, 126)),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildForgotPassButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        style: TextButton.styleFrom(padding: const EdgeInsets.only(right: 0)),
        onPressed: () => print("Forgot Password"),
        child: const Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildRemember() {
    return SizedBox(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              },
            ),
          ),
          const Text(
            'Remember me',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: ButtonTheme(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Color.fromARGB(255, 255, 206, 28),
              ),
              onPressed: () => print('Login'),
              child: const Text(
                'Log In',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )));
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignUp())),
      child: RichText(
          text: const TextSpan(children: [
        TextSpan(
            text: 'Don\'t have an Account?',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        TextSpan(
            text: 'Sign Up',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
      ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(102, 29, 226, 226),
                    Color.fromARGB(153, 102, 199, 199),
                    Color.fromARGB(204, 64, 145, 145),
                    Color.fromARGB(255, 22, 110, 110),
                  ])),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 80, right: 80),
                      child: Image.asset('assets/icons/logo.png'),
                    ),
                    const SizedBox(height: 50),
                    buildEmail(),
                    const SizedBox(height: 20),
                    buildPassword(),
                    buildForgotPassButton(),
                    buildRemember(),
                    buildLoginBtn(),
                    buildSignUpBtn(),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
