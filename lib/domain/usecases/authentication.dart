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

//Estudar o sentido do Future nesse retorno da função;