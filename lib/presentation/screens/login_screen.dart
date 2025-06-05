import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_musica/entities/datosUsuario.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _loginState();
}
datosUsuario user1 = datosUsuario(email: 'micacolodner@gmail.com', password: '1234', nombre: 'Mica', direccion: 'Belgrano');
datosUsuario user2 = datosUsuario(email: 'tomicolodner@gmail.com', password: '5678', nombre: 'Tomas', direccion: 'Almagro');
datosUsuario user3 = datosUsuario(email: 'lola@gmail.com', password: 'ORT', nombre: 'Lola', direccion: 'Caballito');
datosUsuario user4 = datosUsuario(email: 'sebcol@gmail.com', password: 'ABCD', nombre: 'Sebastian', direccion: 'Villa Crespo');
datosUsuario user5 = datosUsuario(email: 'noesaid@gmail.com', password: 'EFGH', nombre: 'Noelia', direccion: 'Palermo');


class _loginState extends State<Login> {
  final TextEditingController inputEmail = TextEditingController();
  final TextEditingController inputPassword = TextEditingController();
  bool _obscureText = true;

  void confirmacion () { 
    List<datosUsuario> users = [user1, user2, user3, user4, user5];
    for (var user in users) {
      if (inputEmail.text == user.email && inputPassword.text == user.password) {
        context.push('/home', extra: user);
        return; // importante: salir de la función si encontró coincidencia
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contraseña y/o usuario incorrectos.')),
    );
}

  @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  TextField( //creo la cajita del usuario
                    controller: inputEmail,
                    decoration: InputDecoration(
                      hintText: 'Ingrese su usuario',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox( //dejo un espacio entre cajitas
                    height: 20
                  ),

                  TextField( //creo la cajita de la contraseña
                    controller: inputPassword,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Ingrese su contraseña',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon (
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: (){
                          setState((){
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    ),
                  ),

                  SizedBox( //vuelvo a dejar espacio
                    height: 20
                  ),

                  ElevatedButton( //creo el boton de confirmar los datos ingresados
                    onPressed: confirmacion, //aplico la función que hice antes para confirmar que los datos sean los correctos
                    child: const Text('INGRESAR'),
                  )
                ],
              ),
            ),
          ),
        );
      }
    }
