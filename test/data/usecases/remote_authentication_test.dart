import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:flutter_tdd/data/usecases/usecases.dart';
import 'package:flutter_tdd/domain/usecases/authentication.dart';
import 'package:flutter_tdd/data/http/http.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  /** Dart 2.12 ou maior foi implementado uma função null safety 
   *  para identificar com mais facilidade variaveis nullas e nao deixar o compilador com essa tarefa pesada que 
   * ao correr uma exceção ele lança-la logo apos ao erro
   * Com a null safet: vc pode declarar uma variavel null basicamente ou com atraso na leitura/criação dela para 
   * garantir que ela so seja visivel com valor na primeira leitura e nao quando ela é criada
   * */
  late RemoteAuthentication sut;
  late HttpClient httpClient;
  late String url;
  //
  //method setUP -> permite rodar codigos de todos os testes que estiver dentro dele
  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    //sut = system unit test
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });
  test('Should call HttpClient with correct values', () async {
    //Params do arquivo AuthenticationParams
    final params = AuthenticationParams(
        email: faker.internet.email(), password: faker.internet.password());

    await sut.auth(params);

    verify(httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.password}));
  });
}
