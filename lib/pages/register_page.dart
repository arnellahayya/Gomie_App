import 'package:flutter/material.dart';
import 'package:gomie/services/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // register method
  void register() async {
    // get auth service
    final authService = AuthService();

    // check if password matches
    if (passwordController.text == confirmPasswordController.text) {
      try {
        // try creating user
        await authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );

        if (!mounted) return;

        // Success dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Registrasi Berhasil"),
            content: const Text("Akun Anda telah berhasil dibuat."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } catch (e) {
        if (!mounted) return;

        String message = e.toString();

        if (message.contains('Email sudah digunakan')) {
          message = 'Email ini sudah terdaftar. Gunakan email lain.';
        } else if (message.contains('Password terlalu lemah')) {
          message = 'Password yang Anda masukkan terlalu lemah.';
        } else if (message.contains('Email tidak valid')) {
          message = 'Format email tidak valid. Silakan coba lagi.';
        } else {
          message = 'Terjadi kesalahan. Ulangi proses registrasi.';
        }

        // Error dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Registrasi Gagal"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    } else {
      // Passwords do not match
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Kesalahan"),
          content: Text("Password dan konfirmasi password tidak cocok."),
          actions: [
            TextButton(
              onPressed: null,
              child: Text("OK"),
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
              // logo
              Icon(
                Icons.restaurant_menu_rounded,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(height: 25),

              // messages, app slogan
              Text(
                "Silakan buat akunmu terlebih dahulu",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(height: 25),

              // email
              MyTextfield(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),

              const SizedBox(height: 25),

              // password
              MyTextfield(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),

              const SizedBox(height: 25),

              // confirm password
              MyTextfield(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                obscureText: true,
              ),

              const SizedBox(height: 25),

              // sign up button
              MyButton(
                text: "Sign Up",
                onTap: () {
                  register();
                },
              ),

              const SizedBox(height: 25),

              // already have an account? Login here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah memiliki akun?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login Sekarang",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
