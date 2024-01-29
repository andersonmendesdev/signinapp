import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signinapp/constants/enum_blocs.dart';

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
      listenWhen: (prev, next) => prev.status != next.status,
      listener: (context, state) {
        if (state.status.isError()) {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: SizedBox(
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [Text(state.errorMessage)],
                  ),
                ),
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
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
                MaterialButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: state.status.isLoading()
                        ? const SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 2))
                        : const Text('signin'),
                    onPressed: () {
                      _loginBloc.add(LoginSubmitEvent(
                          email: controllerEmail.text,
                          password: controllerPassword.text));
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
