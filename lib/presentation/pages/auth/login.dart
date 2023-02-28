import 'package:appwrite_example/presentation/cubit/auth/auth_cubit.dart';
import 'package:appwrite_example/presentation/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  static const String route = 'login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _nameController.text = "Daniel";
    _emailController.text = "d4ni3L_15@hotmail.com";
    _passwordController.text = "12345678";

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthCubitLoginSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            'home',
            (route) => false,
          );
        }

        if (state is AuthCubitLoginFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(milliseconds: 800),
              content: Text(state.message),
            ),
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(width: 20),
                    Text(
                      'Step 1 of 3',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.cancel, color: Colors.grey),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    children: const [
                      Icon(
                        Icons.person,
                        color: Color(0xfff0957e),
                        size: 80,
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Icon(
                          Icons.add_circle_outlined,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Crea \ntu cuenta',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 30),
                InputWidget(
                  controller: _nameController,
                  label: 'Nombre completo',
                  placeholderText: 'Escribe tu nombre completo',
                ),
                const SizedBox(height: 15),
                InputWidget(
                  controller: _emailController,
                  label: 'Correo electrónico',
                  placeholderText: 'E-mail@hola.com',
                ),
                const SizedBox(height: 15),
                InputWidget(
                  controller: _passwordController,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                  label: 'Contraseña',
                  placeholderText: 'Mínimo 8 caracteres',
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(55),
                    backgroundColor: Colors.black,
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    context.read<AuthCubit>().register(
                          name: "test",
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                  },
                  child: const Text('Crear cuenta'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
