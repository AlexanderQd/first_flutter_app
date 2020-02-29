abstract class LoginLogic {
  Future<String> login(String email, String password);
  Future<String> logout();
}

class LoginException implements Exception {}

class SimpleLoginLogic extends LoginLogic {
  @override
  Future<String> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));

    if (email != "alex@email.com" || password != "1234") {
      throw LoginException();
    }

    return "soy un token";
  }

  @override
  Future<String> logout() async {
    // TODO: implement logout
    return null;
  }
}