
import 'package:asistencia_app/apis/usuario_api.dart';
import 'package:asistencia_app/comp/Button.dart';
import 'package:asistencia_app/drawer/navigation_home_screen.dart';

import 'package:asistencia_app/login/sign_in.dart';
import 'package:asistencia_app/modelo/UsuarioModelo.dart';
import 'package:asistencia_app/util/TokenUtil.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainLogin extends StatelessWidget{
  const MainLogin({super.key});


  @override
  Widget build(BuildContext context) {
    return Provider<UsuarioApi>(create: (_)=>UsuarioApi.create(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: const LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bool _isLoggedIn = false;
  bool modLocal = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  var tokenx;
  bool passwordVisible=false;
  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(
                    image: AssetImage("assets/imagen/logo_upeu.png"),
                    height: 180.0),
                const SizedBox(height: 20),
                _buildForm(),
                const SizedBox(height: 20),
                /*checkbox(
                    title: "Fire:",
                    initValue: modLocal,
                    onChanged: (sts) => setState(() => modLocal = sts)) ,
                SizedBox(height: 20),*/
                _signInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget checkbox({required String title, required bool initValue, required Function(bool boolValue) onChanged}) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         Row(

           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(title),
             Checkbox(value: initValue, onChanged: (b) => onChanged(b!))
           ],
         )
        ]);
  }

  Form _buildForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Usuario",
                labelText: "Usuario",
                helperText:"Coloque un correo",
                helperStyle:TextStyle(color:Colors.green),

                alignLabelWithHint: false,
                filled: true,
              ),
              controller: _controllerUser,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: passwordVisible,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: "Password",
                labelText: "Password",
                helperText:"La contraseña debe contener un carácter especial",
                helperStyle:const TextStyle(color:Colors.green),
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(
                          () {
                        passwordVisible = !passwordVisible;
                      },
                    );
                  },
                ),
                alignLabelWithHint: false,
                filled: true,
              ),
              controller: _controllerPass,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            ),

            const SizedBox(
              height: 24,
            ),
            Button  (
              label: 'Ingresar',
              onTap: () async{
                print("Holassss");
                //fireInitial();
                if (_formKey.currentState!.validate() && _controllerUser.text!="") {
                  print("Usuario: ${_controllerUser.text}  clave:${_controllerPass.text}");

                  final prefs= await SharedPreferences.getInstance();

                  final api=Provider.of<UsuarioApi>(context,listen: false);
                  final user=UsuarioModelo.login(_controllerUser.text, _controllerPass.text);
                  bool ingreso=false;
                  api.login(user).then((value){
                    tokenx="Bearer ${value.token}";
                    prefs.setString("token", tokenx);
                    TokenUtil.TOKEN=tokenx;
                    ingreso=true;
                    if(ingreso==true){
                      prefs.setString("usernameLogin", _controllerUser.text);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const NavigationHomeScreen();
                          },
                        ),
                      );
                    }
                  }

                  ).catchError((onError){
                    print(onError.toString());
                  });

                }
              },
            ),
          ],
        ),
      )
    );
  }

  Widget _signInButton(){
    return OutlinedButton(
      //splashColor: Colors.grey,
      onPressed: () async {
        final prefs= await SharedPreferences.getInstance();

        signInWithGoogle().then((result) async{
          print("Entro Google");
          print("Entro Google: $modLocal");
          TokenUtil.localx=modLocal;
          if(!TokenUtil.localx){
          final api=Provider.of<UsuarioApi>(context,listen: false);
          final user=UsuarioModelo.login("davidmp@upeu.edu.pe", "Da12345*");
          api.login(user).then((value){
            tokenx="Bearer ${value.token}";
            prefs.setString("token", tokenx);
            TokenUtil.TOKEN=tokenx;
            prefs.setString("usernameLogin", email ?? "");
          }).catchError((onError){
            print(onError.toString());
          });
          }
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const NavigationHomeScreen();
              },
            ),
          );
                });


      },

      child: const Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/imagen/man-icon.png"), height: 35.0),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Ingresar Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
