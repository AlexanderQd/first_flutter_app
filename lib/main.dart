import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/screens/welcome_screen.dart';
import 'bloc/login_bloc/bloc.dart';
import 'services/auth_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (_) => LoginBloc(authService: AuthService()),
          child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoggedInErrorBlocState) {
                  _showError(context, state.message);
                } else if (state is LoggedInBlocState){
//                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => WelcomeScreen()));
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Email'),
                              controller: emailController,
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: "Password"),
                              obscureText: true,
                              controller: passwordController,
                            ),
                            if (state is LogginInBlocState)
                              Padding(padding: const EdgeInsets.all(20), child: CircularProgressIndicator())
                            else
                              RaisedButton(child: Text('Login'), onPressed: _doLogin)
                          ],
                        )
                    );

                  })
            )

        )
    );
  }

  void _doLogin() {
    BlocProvider.of<LoginBloc>(context).add(DoLoginEvent(emailController.text, passwordController.text));
  }

  void _showError(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
