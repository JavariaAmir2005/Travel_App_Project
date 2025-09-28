import 'package:flutter/material.dart';
import 'signup_screen.dart';
import '../main.dart'; // For MainPage

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    // Define your primary color for consistency
    const Color primaryColor = Color(0xFFA36C88);

    return Scaffold(
      // The resizeToAvoidBottomInset: false is added to prevent the background 
      // from resizing when the keyboard appears, which is good for fixed backgrounds.
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          // Background Image (Ensure 'images/loginImage.png' includes your background)
          image: const DecorationImage(
            image: AssetImage("images/loginImage.png"),
            fit: BoxFit.cover,
          ),
          
          // Gradient Overlay
          gradient: LinearGradient(
            colors: [
              // Lighter color at the top
              const Color.fromARGB(204, 251, 252, 255), // ~80% White/Light
              // Slightly darker/pinker color at the bottom
              const Color.fromARGB(230, 240, 213, 220), // ~90% Light Pink
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          // Use SingleChildScrollView to prevent overflow when the keyboard is up
          child: SingleChildScrollView(
            // Apply a padding to lift the content a bit from the very bottom
            padding: EdgeInsets.only(
              top: 100, // Top padding for the title
              bottom: MediaQuery.of(context).viewInsets.bottom + 50, // Keyboard space
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                // 1. **"LOGIN" Title**
                const Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w300, // Lighter weight for that look
                    color: primaryColor,
                    letterSpacing: 3,
                  ),
                ),
                
                // 2. **"Access Your Journey" Subtitle**
                const Text(
                  "Access Your Journey",
                  style: TextStyle(
                    fontSize: 18,
                    color: primaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                
                const SizedBox(height: 50), // Spacing before the input fields

                // Email Input Field
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email", // Use hintText instead of labelText for the visual style
                    prefixIcon: const Icon(
                      Icons.email,
                      color: primaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none, // Remove border for a cleaner look
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    filled: true,
                    // Use a slightly transparent white color
                    fillColor: Colors.white.withOpacity(0.95), 
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                
                const SizedBox(height: 16),

                // Password Input Field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: primaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none, // Remove border for a cleaner look
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.95),
                  ),
                ),
                
                const SizedBox(height: 24),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to MainPage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5, 
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 200), 
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignupScreen()),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}