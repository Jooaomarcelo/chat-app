import 'package:chat_app/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;

  const AuthForm({
    required this.onSubmit,
    super.key,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formData = AuthFormData();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_formData.isSignup)
                TextFormField(
                  key: ValueKey('name'),
                  initialValue: _formData.name,
                  onChanged: (name) => _formData.name = name,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  validator: (textField) {
                    final name = textField ?? '';

                    if (name.trim().length < 4) {
                      return 'O nome deve possuir no mínimo 4 caracteres.';
                    }

                    return null;
                  },
                ),
              TextFormField(
                key: ValueKey('email'),
                initialValue: _formData.email,
                onChanged: (email) => _formData.email = email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                validator: (textField) {
                  final email = textField ?? '';

                  if (!email.contains('@')) {
                    return 'Insira um email válido.';
                  }

                  return null;
                },
              ),
              TextFormField(
                key: ValueKey('password'),
                initialValue: _formData.password,
                onChanged: (password) => _formData.password = password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                validator: (textField) {
                  final senha = textField ?? '';

                  if (senha.trim().length < 5) {
                    return 'A senha deve possuir no mínimo 6 caracteres.';
                  }

                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _submit,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.primary),
                ),
                child: Text(
                  _formData.isLogin ? 'Entrar' : 'Cadastrar',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _formData.toogleAuthMode();
                  });
                },
                child: Text(
                  _formData.isLogin
                      ? 'Criar uma nova conta?'
                      : 'Já possui conta?',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
