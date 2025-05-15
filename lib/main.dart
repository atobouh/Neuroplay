import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  
  runApp(
    const ProviderScope(
      child: NeuroPlayApp(),
    ),
  );
}

class NeuroPlayApp extends StatelessWidget {
  const NeuroPlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeuroPlay',
      theme: ThemeData(
        primaryColor: const Color(0xFF008080), // Teal
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF008080),
          primary: const Color(0xFF008080),
        ),
        fontFamily: 'Lexend',
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF008080),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).chain(CurveTween(curve: Curves.elasticOut)).animate(_controller);

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).chain(CurveTween(curve: Curves.easeIn)).animate(_controller);

    _controller.forward();
  }

  void toggleForm() {
    setState(() {
      isLogin = !isLogin;
    });
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE0F7F4),
      body: Center(
        child: Container(
          width: size.width * 0.85,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 15),
              ),
            ],
          ),
          child: AnimatedBuilder(
            animation: _controller,
            builder:
                (context, child) => FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child:
                        isLogin
                            ? LoginForm(onSwitch: toggleForm)
                            : SignUpForm(onSwitch: toggleForm),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final VoidCallback onSwitch;
  const LoginForm({super.key, required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Log in",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Welcome back to NeuroPlay!",
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email, color: Colors.teal),
            hintText: "Email",
            filled: true,
            fillColor: Color(0xFFF0FDFC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock, color: Colors.teal),
            hintText: "Password",
            filled: true,
            fillColor: Color(0xFFF0FDFC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainGamePage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            minimumSize: const Size.fromHeight(45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text("Log in"),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.g_mobiledata, color: Colors.teal),
          label: const Text(
            "Continue with Google",
            style: TextStyle(color: Colors.teal),
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: onSwitch,
          child: const Text(
            "Don't have an account? Register here!",
            style: TextStyle(color: Colors.teal),
          ),
        ),
      ],
    );
  }
}

class SignUpForm extends StatelessWidget {
  final VoidCallback onSwitch;
  const SignUpForm({super.key, required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Sign up",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Create your NeuroPlay account",
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email, color: Colors.teal),
            hintText: "Email",
            filled: true,
            fillColor: Color(0xFFF0FDFC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock, color: Colors.teal),
            hintText: "Password",
            filled: true,
            fillColor: Color(0xFFF0FDFC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_outline, color: Colors.teal),
            hintText: "Confirm Password",
            filled: true,
            fillColor: Color(0xFFF0FDFC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainGamePage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            minimumSize: const Size.fromHeight(45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text("Sign up"),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.g_mobiledata, color: Colors.teal),
          label: const Text(
            "Sign up with Google",
            style: TextStyle(color: Colors.teal),
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: onSwitch,
          child: const Text(
            "Already have an account? Log in here!",
            style: TextStyle(color: Colors.teal),
          ),
        ),
      ],
    );
  }
}

class MainGamePage extends StatelessWidget {
  const MainGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainGamePage();
  }
}

class MainGamePage extends StatelessWidget {
  const MainGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NeuroPlay Games')),
      body: const Center(
        child: Text(
          'Welcome to the Main Game Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
