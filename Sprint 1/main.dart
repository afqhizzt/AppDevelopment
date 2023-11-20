import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => HelloFlutter(),
        '/UserRegistration': (context) => UserRegistration(),
        '/ClubRegistration': (context) => ClubRegistration(),
        '/HEPRegistration': (context) => HEPRegistration()
      },
    );
  }
}

class HelloFlutter extends StatefulWidget {
  @override
  _HelloFlutterState createState() => _HelloFlutterState();
}

class _HelloFlutterState extends State<HelloFlutter> {
  Color studentButtonColor = Colors.black;
  Color studentTextColor = Colors.white;

  Color clubButtonColor = Colors.white;
  Color clubTextColor = Colors.black;

  Color hepButtonColor = Colors.white;
  Color hepTextColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 450,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/img_saly_12.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Eventory",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Where Finding and Organizing Events\nHas Never Been Easier!",
                    style: TextStyle(
                      color: Color(0xFF4C4C4C),
                      fontSize: 17,
                      fontFamily: 'NotoSans-Regular',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Choose you role:",
                    style: TextStyle(
                      color: Color.fromARGB(225, 0, 0, 0),
                      fontSize: 17,
                      fontFamily: 'NotoSans-Regular',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: TextButton(
                          child: Text(
                            "Student",
                            style: TextStyle(
                              color: studentTextColor,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(studentButtonColor),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              studentButtonColor = Colors.black;
                              studentTextColor = Colors.white;
                              clubButtonColor = Colors.white;
                              clubTextColor = Colors.black;
                              hepButtonColor = Colors.white;
                              hepTextColor = Colors.black;
                            });
                            Navigator.pushNamed(context, '/UserRegistration');
                          },
                        ),
                      ),
                      SizedBox(width: 12),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: TextButton(
                          child: Text(
                            "Club",
                            style: TextStyle(
                              color: clubTextColor,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(clubButtonColor),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              studentButtonColor = Colors.white;
                              studentTextColor = Colors.black;
                              clubButtonColor = Colors.black;
                              clubTextColor = Colors.white;
                              hepButtonColor = Colors.white;
                              hepTextColor = Colors.black;
                            });
                            Navigator.pushNamed(context, '/ClubRegistration');
                          },
                        ),
                      ),
                      SizedBox(width: 12),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: TextButton(
                          child: Text(
                            "HEP",
                            style: TextStyle(
                              color: hepTextColor,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(hepButtonColor),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              studentButtonColor = Colors.white;
                              studentTextColor = Colors.black;
                              clubButtonColor = Colors.white;
                              clubTextColor = Colors.black;
                              hepButtonColor = Colors.black;
                              hepTextColor = Colors.white;
                            });
                            Navigator.pushNamed(context, '/HEPRegistration');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpFormField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final bool isEmail;
  final double height;
  final double labelFontSize;
  final double textIndent;
  final String? Function(String?)? validator;

  const SignUpFormField({
    Key? key,
    required this.label,
    this.isPassword = false,
    this.isEmail = false,
    this.height = 10,
    this.labelFontSize = 12,
    this.textIndent = 8,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      obscureText: isPassword,
      style: TextStyle(
        color: Colors.grey[800],
        fontFamily: 'NotoSans-Thin',
        fontSize: 13,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey[800],
          fontSize: labelFontSize,
        ),
        contentPadding:
            EdgeInsets.fromLTRB(textIndent, height / 4, 0, height / 4),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      cursorColor: Colors.black,
      validator: validator,
    );
  }
}

class UserRegistration extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "All events on",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "your fingertips!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 27,
                            fontFamily: 'NotoSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        SignUpFormField(
                          label: "Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        SignUpFormField(
                          label: "Username",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        SignUpFormField(
                          label: "Matric No.",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your matric number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        SignUpFormField(
                          label: "Email",
                          isEmail: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!value.contains('@')) {
                              return 'Invalid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        SignUpFormField(
                          label: "Password",
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, perform submission.
                              // Handle submit logic here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            overlayColor: MaterialStateProperty.all(
                              Color.fromARGB(119, 53, 53, 53),
                            ),
                            elevation: MaterialStateProperty.all(10),
                          ),
                          child: Text(
                            "Create account",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSans-Regular',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "or",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Handle Google sign up logic here
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            overlayColor: MaterialStateProperty.all(
                              Color.fromARGB(119, 53, 53, 53),
                            ),
                            elevation: MaterialStateProperty.all(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/img_google.png',
                                width: 24,
                                height: 24,
                              ),
                              Text(
                                "  Sign Up with Google",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'NotoSans-Regular',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'NotoSans-Regular',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                " Sign in",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'NotoSans-Regular',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClubRegistration extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "All events on",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "your fingertips!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 27,
                            fontFamily: 'NotoSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        SignUpFormField(
                          label: "Club Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your club name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        SignUpFormField(
                          label: "Club Username",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        SignUpFormField(
                          label: "Club Register Date",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter club register date';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        SignUpFormField(
                          label: "Club Email",
                          isEmail: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your club email';
                            } else if (!value.contains('@')) {
                              return 'Invalid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        SignUpFormField(
                          label: "Password",
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, perform submission.
                              // Handle submit logic here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            overlayColor: MaterialStateProperty.all(
                              Color.fromARGB(119, 53, 53, 53),
                            ),
                            elevation: MaterialStateProperty.all(10),
                          ),
                          child: Text(
                            "Create account",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSans-Regular',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "or",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Handle Google sign up logic here
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            overlayColor: MaterialStateProperty.all(
                              Color.fromARGB(119, 53, 53, 53),
                            ),
                            elevation: MaterialStateProperty.all(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/img_google.png',
                                width: 24,
                                height: 24,
                              ),
                              Text(
                                "  Sign Up with Google",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'NotoSans-Regular',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'NotoSans-Regular',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                " Sign in",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'NotoSans-Regular',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HEPRegistration extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "All events on",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "your fingertips!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 27,
                            fontFamily: 'NotoSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        SignUpFormField(
                          label: "Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        SignUpFormField(
                          label: "Username",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        SignUpFormField(
                          label: "Staff No.",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your staff number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        SignUpFormField(
                          label: "Email",
                          isEmail: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!value.contains('@')) {
                              return 'Invalid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        SignUpFormField(
                          label: "Password",
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, perform submission.
                              // Handle submit logic here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            overlayColor: MaterialStateProperty.all(
                              Color.fromARGB(119, 53, 53, 53),
                            ),
                            elevation: MaterialStateProperty.all(10),
                          ),
                          child: Text(
                            "Create account",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSans-Regular',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "or",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Handle Google sign up logic here
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            overlayColor: MaterialStateProperty.all(
                              Color.fromARGB(119, 53, 53, 53),
                            ),
                            elevation: MaterialStateProperty.all(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/img_google.png',
                                width: 24,
                                height: 24,
                              ),
                              Text(
                                "  Sign Up with Google",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'NotoSans-Regular',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'NotoSans-Regular',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                " Sign in",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'NotoSans-Regular',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\nWelcome back!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 0),
              Center(
                child: Image.asset(
                  'images/img_saly_42.png',
                  width: 400,
                  height: 350,
                ),
              ),
              SizedBox(height: 5),
              Center(
                // Wrap the white box with Center widget
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'NotoSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        SignInFormField(label: "Username"),
                        SizedBox(height: 5),
                        SignInFormField(label: "Password", isPassword: true),
                        SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            // Handle submit logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            overlayColor: MaterialStateProperty.all(
                                Color.fromARGB(119, 53, 53,
                                    53)), // Change this color as needed
                            elevation: MaterialStateProperty.all(
                                10), // Set the elevation to 0 to remove the shadow
                          ),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSans-Regular',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "or",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Handle Google sign up logic here
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            overlayColor: MaterialStateProperty.all(
                                Color.fromARGB(119, 53, 53,
                                    53)), // Change this color as needed
                            elevation: MaterialStateProperty.all(
                                10), // Set the elevation to 0 to remove the shadow
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/img_google.png', // Replace with your Google logo asset
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Sign In with Google",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'NotoSans-Regular',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'NotoSans-Regular',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HelloFlutter(),
                                  ),
                                );
                              },
                              child: Text(
                                " Register",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'NotoSans-Regular',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
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
}

class SignInFormField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final double height;
  final double labelFontSize;
  final double textIndent;

  const SignInFormField({
    Key? key,
    required this.label,
    this.isPassword = false,
    this.height = 10,
    this.labelFontSize = 12,
    this.textIndent = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      obscureText: isPassword,
      style: TextStyle(
        color: Colors.grey[800],
        fontFamily: 'NotoSans-Thin',
        fontSize: 13,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey[800],
          fontSize: labelFontSize,
        ),
        contentPadding:
            EdgeInsets.fromLTRB(textIndent, height / 4, 0, height / 4),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      cursorColor: Colors.black,
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Profile'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/profile_picture.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your Username',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Your Bio Here',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Posts',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('100'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('100K'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Following',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('50'),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
              ),
              itemCount: 9, // Number of photos
              itemBuilder: (context, index) {
                return Image.asset(
                  'images/post_$index.jpg',
                  fit: BoxFit.cover,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
