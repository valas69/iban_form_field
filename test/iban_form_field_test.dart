import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iban_form_field/iban_form_field.dart';

void main() {
  testWidgets('it has a country code', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: IbanFormField(
            initialValue: Iban('NL'),
            inputDecoration: InputDecoration(),
          ),
        ),
      ),
    );
    final countryCodeFinder = find.text('NL');
    expect(countryCodeFinder, findsWidgets);
  });

  // TODO: test focus shifting
}
