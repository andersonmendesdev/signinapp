import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: const HomePageMain(),
    );
  }
}

class HomePageMain extends StatefulWidget {
  const HomePageMain({super.key});

  @override
  State<HomePageMain> createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  late LoginBloc _loginBloc;
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void dispose() {
    controllerEmail.dispose;
    controllerPassword.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: _loginBloc,
      listenWhen: (prev, next) => prev.errorMessage != next.errorMessage,
      listener: (context, state) {
        //TODO: exibir mensagens de erro ou sucesso aqui
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              TextField(
                controller: controllerEmail,
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controllerPassword,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 20),
              MaterialButton(onPressed: () {
                _loginBloc.add(LoginSubmitEvent(
                    email: controllerEmail.text,
                    password: controllerPassword.text));
              })
            ],
          ),
        );
      },
    );
  }
}
