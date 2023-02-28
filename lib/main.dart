import 'package:appwrite_example/data/auth_repository_impl.dart';
import 'package:appwrite_example/domain/repository/auth_repository.dart';
import 'package:appwrite_example/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:appwrite_example/presentation/route/route.dart' as route;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
            create: (_) => AuthRepositoryImple()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              context.read(),
            ),
          ),
        ],
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthCubitLogoutSuccess) {
              _navigatorKey.currentState?.pushNamedAndRemoveUntil(
                'login',
                (route) => false,
              );
            }
          },
          child: MaterialApp(
            navigatorKey: _navigatorKey,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: 'login',
            onGenerateRoute: route.onGenerateRoute,
          ),
        ),
      ),
    );
  }
}
