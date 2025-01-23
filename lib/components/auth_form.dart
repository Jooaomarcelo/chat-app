import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.primary),
                ),
                child: Text(
                  'Entrar',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Criar uma nova conta?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
