import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  var currentDiceRoll = 2;
  var pnts=0;

  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 450),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 6).animate(_controller);
  }
  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
      pnts=pnts+currentDiceRoll;
      _controller.forward(from: 0.0);
    });
  }
  void restart() {
    setState(() {
      pnts=0;
    });
  }


  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Dice App ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
        SizedBox(height: 150,),
        Text('Total Points : $pnts',style: TextStyle(fontSize: 25),),
        SizedBox(height: 20),
        RotationTransition(
          turns: _animation,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateX(0),
            child: Image.asset(
              'images/dice-$currentDiceRoll.png',
              width: 200,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: rollDice,
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Ink(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(211, 222, 181, 51),
                              Colors.yellow]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                        width: 120,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          'Roll Dice',
                        )))
            ),
            SizedBox(width: 20),
            FloatingActionButton(
                onPressed:restart ,
                backgroundColor: Color.fromARGB(179, 238, 110, 143),
                child: Icon(Icons.restart_alt)
            )
          ],
        )
      ],
    );
  }
}
