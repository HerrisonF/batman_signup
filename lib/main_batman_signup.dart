import 'package:flutter/material.dart';
import 'package:flutter_batman/batman_button.dart';
import 'package:flutter_batman/batman_screen_buttons.dart';
import 'package:flutter_batman/batman_screen_title.dart';
import 'package:google_fonts/google_fonts.dart';

class MainBatmanSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        textTheme: GoogleFonts.vidalokaTextTheme(),
      ),
      child: BatmanSignUp(),
    );
  }
}

class BatmanSignUp extends StatefulWidget {
  @override
  _BatmanSignUpState createState() => _BatmanSignUpState();
}

class _BatmanSignUpState extends State<BatmanSignUp>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationLogoIn;
  Animation<double> _animationLogoMovementUp;
  Animation<double> _animationBatmanIn;
  Animation<double> _animationButtonsIn;

  AnimationController _animationControllerSignUp;

  void _setupFirstAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animationLogoIn = Tween(
      begin: 30.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.25),
      ),
    );
    _animationLogoMovementUp = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.35, 0.60),
    );
    _animationBatmanIn = Tween(
      begin: 5.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.65, 1.0, curve: Curves.decelerate),
      ),
    );
    _animationButtonsIn = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.7, 1.0),
    );
    _animationController.forward();
  }

  void _setupSecondAnimations() {
    _animationControllerSignUp = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
  }

  @override
  void initState() {
    _setupFirstAnimations();
    _setupSecondAnimations();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerSignUp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Scaffold(
            backgroundColor: Colors.black54,
            body: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/batman_background.png',
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Transform.scale(
                    scale: _animationBatmanIn.value,
                    child: Image.asset(
                      'assets/batman_alone.png',
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      BatmanScreenTitle(_animationLogoMovementUp),
                      const SizedBox(height: 35),
                      BatmanScreenButtons(_animationButtonsIn),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2.2 -
                      60 * _animationLogoMovementUp.value,
                  left: 0,
                  right: 0,
                  child: Transform.scale(
                    scale: _animationLogoIn.value,
                    child: Image.asset(
                      'assets/batman_logo.png',
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
