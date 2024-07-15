import 'package:flutter/material.dart';
import 'package:lapak_tech/bloc/login_bloc.dart';
import 'package:lapak_tech/helpers/user_info.dart';
import 'package:lapak_tech/ui/produk_page.dart';
import 'package:lapak_tech/ui/registrasi_page.dart';
import 'package:lapak_tech/widget/warning_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _emailTextField(),
                _passwordTextField(),
                _buttonLogin(),
                const SizedBox(
                  height: 30,
                ),
                _menuRegist()
              ],
            ),
          ),
          ),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Email"),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Email harus diisi";
        } return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Password"),
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: _passwordTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Password harus diisi";
        } return null;
      },
    );
  }

  Widget _buttonLogin() {
    return ElevatedButton(
      child: const Text("Login"),
      onPressed: (){
        var validate = _formKey.currentState!.validate();
      },
    );
  }

void _submit() {
  _formKey.currentState!.save();
  setState(() {
    _isLoading = true;
  });

  LoginBloc.login(
    email: _emailTextboxController.text,
    password: _passwordTextboxController.text
  ).then((value) async {
    await UserInfo().setToken(value.token.toString());
    await UserInfo().setUserID(value.userID.toString());
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProdukPage()));
  }, onError: (e) {
    print(e);
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) => const WarningDialog(desc: "Login gagal, silahkan coba lagi"));
  });
  setState(() {
    _isLoading = false;
  });
}
  
  Widget _menuRegist() {
    return Center(
      child: InkWell(
        child: const Text('Registrasi', style: TextStyle(color: Colors.blue),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrasiPage()));
        },
      ),
    );
  }
}