import 'package:flutter/material.dart';
// import 'package:http/http.dart' as https;
void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<MyApp> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: const Text(
            'Welcome to XYZ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Email Id",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your Email ID",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (email) {
                  print("Email Entered is $email");
                },
              ),
              const SizedBox(
                height: 20.0,
                width: 20.0,
              ),
              const Text(
                "Password",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textAlign: TextAlign.left,
              ),
              TextField(
                obscureText: passwordVisible,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                  hintText: "Enter your Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (password) {
                  print("Password Entered is $password");
                },
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        print("Forgot Password");
                      },
                      child: const Text(
                        "Forgot Password?",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 16),
                      ))),
              const SizedBox(
                height: 13.0,
                width: 20.0,
              ),
              SizedBox(
                width: double.infinity, // Set the width to fill the parent
                child: ElevatedButton(
                  onPressed: () {
                    print("Signed In");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(7, 127, 249, 1),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: Colors.white38,
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "or sign in with",
                      style: TextStyle(
                          color: Colors.white38, fontWeight: FontWeight.w500,fontSize: 18),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.white38,
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.mail_rounded,color: Color.fromARGB(255, 194, 194, 194), ),
                      iconSize: 36,
                      onPressed: () {
                        print("Mail is Selected for Sign in");
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.apple_rounded,color: Color.fromARGB(255, 194, 194, 194), ),
                      iconSize: 36,
                      onPressed: () {
                        print("Apple is Selected for Sign in");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Future<void>fetchPopularMovies() async{
//   final url='https://'
// }