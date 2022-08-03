import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginwithrive/src/controller/insert_controller.dart';
import 'package:loginwithrive/src/widget/comman_widget/button_view.dart';
import 'package:loginwithrive/src/widget/comman_widget/textview.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var frmkey1 = GlobalKey<FormState>();
  final InsertController _controller = Get.put(InsertController());

  String pass = "admin";

  String animationType = "idle";
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.passwordFocus.addListener((){
      if(_controller.passwordFocus.hasFocus){
        setState(() {
          animationType="test";
        });
      }else{
        setState(() {
          animationType="idle";
        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.emailFocus.value.unfocus();
        _controller.passwordFocus.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Container(
                height: Get.size.height-40,
                width: Get.size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Center(
                    child: Container(
                      height: 300,
                      width: 300,

                      child: CircleAvatar(
                        child: ClipOval(
                          child: FlareActor("assets/teddy_test.flr", alignment: Alignment.center, fit: BoxFit.contain, animation: animationType,),
                        ),
                        backgroundColor: Colors.white,
                      )

                    ),
                  ),

                  SizedBox(
                    height: Get.size.height * 0.02,
                  ),
                    
                    Column(
                      children: [

                        // SizedBox(
                        //   height: Get.size.height * 0.2,
                        // ),

                        Container(
                          child: textView(
                            context: context,
                            labelText: "Email",
                            hintText: "Enter Email Id",
                            controller: _controller.emailController.value,
                            focusNode: _controller.emailFocus.value,
                          ),
                        ),

                        SizedBox(
                          height: Get.size.height * 0.02,
                        ),

                        Container(
                          child: textView(
                            context: context,
                            obscureText: true,
                            labelText: "Password",
                            hintText: "Enter Password",
                            controller: _controller.passwordController.value,
                            focusNode: _controller.passwordFocus,
                          ),
                        ),

                        SizedBox(
                          height: Get.size.height * 0.02,
                        ),

                        buttonView(
                            title: "Submit",
                            width: Get.size.width,
                            onPressed: () {
                              if(_controller.passwordController.value.text.compareTo(pass) == 0){
                                setState(() {
                                  animationType = "success";
                                });

                              }else{
                                setState(() {
                                  animationType = "fail";
                                });

                              }
                            },  
                          )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
