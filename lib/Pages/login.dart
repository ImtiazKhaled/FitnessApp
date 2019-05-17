import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  State<StatefulWidget> createState() => _LoginState();
}
class _LoginState extends State<Login>  {

    // V A R I A B L E S  T H A T  H E L P  S T R U C T U R E  A P P
    bool expanded = false;
    int counter = 0; 
    double containerHeight = 1000;
    

    // V A R I A B L E S  T H A T  N E E D  T O  B E  D I S P O S E D

    //the text input handlers
    final textControllerUsername = TextEditingController();
    final textControllerPassword = TextEditingController();
    final textControllerEmail = TextEditingController();
    final textControllerName = TextEditingController();
    final textControllerPhone = TextEditingController();


  @override
  Widget build(BuildContext context) {

    // V A R I A B L E S  T H A T  D O  N O T  N E E D  T O  B E  D I S P O S E D

    //used to get height and width of current screen
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    // O N  C L I C K  H A N D L E R S

    //expands the box when signup is pressed for the first time
    void _signUpButtonClickedShort() {
      setState(() {
        containerHeight = height * 0.70;
        expanded = !expanded;
      });
    }

    //creates an account
    void _signUpButtonClickedHigh() {
      //creates account
    }

    //logs into account
    void _loginButtonClickedShort() {
      //logs in
    }

    //shortens the box when singin is pressed and box is expanded
    void _loginButtonClickedHigh() {
      setState(() {
        containerHeight = height * 0.4;
        expanded = !expanded;
      });
    }
    
    // A P P  C O M P O N E N T S 

    //the top bar of the screen containing the logo and the title
    _hookahLogoAppBar(String title, String imageLink) => AppBar(
      backgroundColor: Theme.of(context).buttonColor,
      leading:  Image.asset(imageLink,
        alignment: Alignment.centerLeft, 
      ),
      title: Text("$title"),
    );

    //a styled general text field
    _inputTextField(String hintText, bool _obsecureText, TextEditingController output) => Container(
        height: height * 0.06,
        child: TextField(
        controller: output,
        decoration: InputDecoration(
          //fillColor: Theme.of(context).accentColor,
          hintText: "$hintText",
          enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:Theme.of(context).accentColor,
              width: 2.5,
              ),
          borderRadius: BorderRadius.all(Radius.circular(40.0),),
          ),
          hintStyle: TextStyle(
            color: Theme.of(context).accentColor,
            ),
          border: OutlineInputBorder(),
          ),
          obscureText: _obsecureText,
      ),
    );

    //the styled login button
    _styledButton(String buttonText, var callBack) => ButtonTheme(
      minWidth: width*0.30,
      height: height*0.08,
      child: RaisedButton(
        onPressed:  callBack,
        color: Theme.of(context).accentColor,
        child: new Text(
          '$buttonText',
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontSize: 30,
          ),
        ),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0))
      ),
    );


    //set up of signin
    _signIn() =><Widget>[     
      SizedBox(height: height * 0.03),
      _inputTextField("username", false, textControllerUsername),
      SizedBox(height: height * 0.03),
      _inputTextField("password", true, textControllerPassword),
      SizedBox(height: height * 0.03), 
      Row(
        mainAxisAlignment: MainAxisAlignment.end, 
        children: <Widget>[
            _styledButton("Sign In", _loginButtonClickedShort),
            SizedBox(width: width * 0.03),
            _styledButton("Sign Up", _signUpButtonClickedShort),
          ],
      )
    ];

    //set up of signup
    _signUp() => <Widget>[ 
    SizedBox(height: height * 0.03),
        _inputTextField("username", false, textControllerUsername),
        SizedBox(height: height * 0.03),
        _inputTextField("password", true, textControllerPassword),
        SizedBox(height: height * 0.03), 
        _inputTextField("name", false, textControllerName),
        SizedBox(height: height * 0.03),
        _inputTextField("email", false, textControllerEmail),
        SizedBox(height: height * 0.03),
        _inputTextField("phone", false, textControllerPhone),
        SizedBox(height: height * 0.03),
            Row(
        mainAxisAlignment: MainAxisAlignment.end, 
        children: <Widget>[
          _styledButton("Sign Up", _signUpButtonClickedHigh),
          SizedBox(width: width * 0.03),
          _styledButton("Sign In", _loginButtonClickedHigh),
        ],
      )
    ];

    //setup of the main box
    _insideBox() => Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: expanded ? _signUp() : _signIn(), 
          )
        )
      ],
    );


    //styling of the login box
    _loginBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(40.0),
      ),
      color: Color(0xff123456),
    );


    _animatedContainer() => AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: containerHeight,
      width: width * 0.90,
      padding: EdgeInsets.all(15.0),
      decoration: _loginBoxDecoration(),
      child: _insideBox(),
    );

    @override
    void dispose() {
      super.dispose();
      textControllerUsername.dispose();
      textControllerPassword.dispose();
    }


    return new Scaffold(
        appBar: _hookahLogoAppBar("FitnessApp", "lib/Assets/fitness-app_logo.png"),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _animatedContainer(),
                    ]
                  )
                ]
            ),
        );
    }
}
