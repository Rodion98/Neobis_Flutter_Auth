import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';
import './screens/auth/welcome_screen.dart';

import 'simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        //  MultiBlocProvider(
        //   providers: [
        //     BlocProvider<SignInBloc>(
        //       create: (context) => SignInBloc(
        //         userRepository: context.read<AuthenticationBloc>().userRepository,
        //       ),
        //     ),
        //     BlocProvider<PersonBloc>(
        //       create: (context) => PersonBloc()..add(StartedPerson()),
        //     ),
        //   ],
        //   child:
        MaterialApp(
            title: 'Firebase Auth',
            theme: ThemeData(
              colorScheme: const ColorScheme.light(
                  background: Colors.white,
                  onBackground: Colors.black,
                  primary: Color.fromRGBO(206, 147, 216, 1),
                  onPrimary: Colors.black,
                  secondary: Color.fromRGBO(244, 143, 177, 1),
                  onSecondary: Colors.white,
                  tertiary: Color.fromRGBO(255, 204, 128, 1),
                  error: Colors.red,
                  outline: Color(0xFF424242)),
            ),
            home: WelcomeScreen()
            //  BlocBuilder<AuthenticationBloc, AuthenticationState>(
            //   builder: (context, state) {
            //     if (state.status == AuthenticationStatus.authenticated) {
            //       return const HomeScreen();
            //     } else {
            //       return const WelcomeScreen();
            //     }
            //   },
            // ),
            );
    // );
  }
}
