import 'package:crypto/crypto.dart';

void main() {
  String secret = "sk_test_Q6bgkpG7iLy44jvDE4oQ0vNy";
  String userId = '12345';

  final hmac = new Hmac(sha256, secret.codeUnits);
  final digest = hmac.convert(userId.codeUnits);
  print(digest);
}
