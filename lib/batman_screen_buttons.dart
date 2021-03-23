import 'package:flutter/material.dart';

import 'batman_button.dart';

class BatmanScreenButtons extends AnimatedWidget {

  BatmanScreenButtons(Animation animation) : super(listenable: animation);

  Animation get _animationButtonsIn => listenable as Animation;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Opacity(
        opacity: _animationButtonsIn.value,
        child: Transform.translate(
          offset: Offset(
            0.0,
            100 * (1 - _animationButtonsIn.value),
          ),
          child: Column(
            children: [
              BatmanButton(
                text: 'LOGIN',
              ),
              SizedBox(
                height: 15,
              ),
              BatmanButton(
                text: 'SIGNUP',
                left: false,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}