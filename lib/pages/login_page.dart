import 'package:flutter/material.dart';
import 'package:gomie/components/my_button.dart';
import 'package:gomie/components/my_textfield.dart';
import 'package:gomie/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );

      if (!mounted) return;
    } catch (e) {
      if (!mounted) return;

      String message = e.toString();

      if (message.contains('Password tidak cocok')) {
        message = 'Password salah. Silakan coba lagi.';
      } else if (message.contains('Pengguna tidak ditemukan')) {
        message = 'Pengguna tidak ditemukan. Silakan periksa email Anda.';
      } else if (message.contains('Email tidak valid')) {
        message = 'Format email tidak valid. Silakan coba lagi.';
      } else if (message.contains('Email sudah digunakan')) {
        message = 'Email sudah terdaftar. Silakan gunakan email lain.';
      } else {
        message = 'Terjadi kesalahan. Username/Password Salah.';
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Gagal'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.restaurant_menu_rounded,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 25),
              Text(
                "GOMIE",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Aplikasi Delivery Makanan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 25),
              MyTextfield(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 25),
              MyTextfield(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 25),
              MyButton(
                onTap: login,
                text: "Login",
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Belum terdaftar?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register Sekarang",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
