//Imports relacionado a terceiros ou do Flutter/dart
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

//Imports do projeto
import '../entities/entities.dart';

abstract class Authtentication {
  Future<AccountEntity> auth({
    @required String email,
    @required String password,
  });
}

class AuthenticationParams {
  final String email;
  final String password;

  AuthenticationParams({
    required this.email,
    required this.password,
  });

  //Map para retornar dados em formato json para os testes na requisição
  Map toJson() => {'email': email, 'password': password};
}


//Estudar o sentido do Future nesse retorno da função;