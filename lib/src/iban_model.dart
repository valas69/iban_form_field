import 'package:iban/iban.dart' as iban;

class Iban {
  Iban({this.countryCode, this.checkDigits, this.basicBankAccountNumber});

  String countryCode;
  String checkDigits;
  String basicBankAccountNumber;

  String get countryCodeHintText => _example.substring(0, 2);
  String get checkDigitsHintText => _example.substring(2, 4);

  String get basicBankAccountNumberHintText {
    var every4Chars = RegExp(r'(.{4})(?!$)');
    return _example
        .substring(4, _example.length)
        .replaceAllMapped(every4Chars, (match) => '${match.group(0)} ');
  }

  int get maxBasicBankAccountNumberLength =>
      basicBankAccountNumberHintText.length;

  String get electronicFormat => iban.electronicFormat(_concat);

  String get toPrintFormat => iban.toPrintFormat(_concat);

  bool get isValid => iban.isValid(electronicFormat);

  String get _concat => '$countryCode$checkDigits$basicBankAccountNumber';

  String get _example {
    var particularSpecification = iban.specifications['CH'];
    if (iban.specifications.containsKey(countryCode)) {
      particularSpecification = iban.specifications[countryCode];
    }
    return particularSpecification.example;
  }

  factory Iban.fromString(String ibanString) {
    return Iban(
        countryCode: ibanString.substring(0, 2),
        checkDigits: ibanString.substring(2, 4),
        basicBankAccountNumber: ibanString.substring(4));
  }

  @override
  String toString() =>
      'IBAN($countryCode $checkDigits $basicBankAccountNumber)';
}
