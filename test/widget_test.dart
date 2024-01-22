
import 'package:dice/dice_roller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';



void main() {
  testWidgets('Roll Dice updates state', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DiceRoller(),
        ),
      ),
    );

    // Store the initial state
    final initialPoints = find.text('Total Points : 0');
    expect(initialPoints, findsOneWidget);

    // Tap the "Roll Dice" button
    await tester.tap(find.text('Roll Dice'));
    await tester.pump();

    // Verify that the state is updated after rolling the dice
    final updatedPoints = find.text('Total Points : 0');
    expect(updatedPoints, findsNothing);


    // Verify that the state is updated after the animation completes
    await tester.pumpAndSettle();
    expect(find.text('Total Points : 0'), findsNothing);
  });
}