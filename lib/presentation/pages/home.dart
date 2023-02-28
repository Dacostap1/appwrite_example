import 'package:appwrite_example/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const String route = 'home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final session = context.read<AuthCubit>().session;

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(session.toMap().toString()),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(55),
                  backgroundColor: Colors.black,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  shape: const StadiumBorder(),
                ),
                onPressed: context.read<AuthCubit>().logout,
                child: const Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
