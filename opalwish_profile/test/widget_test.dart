// OpalWish Company Profile - Widget Tests
//
// Basic widget tests for the OpalWish company profile application.

import 'package:flutter_test/flutter_test.dart';
import 'package:profile/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const OpalWishApp());

    // Verify that the app name appears on the home screen
    expect(find.text('OpalWish'), findsWidgets);
  });
}
