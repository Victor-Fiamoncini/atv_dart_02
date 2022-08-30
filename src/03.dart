import 'dart:io';

void main(List<String> args) {
  try {
    stdout.write('Informe o nome: ');
    final name = stdin.readLineSync().toString();

    stdout.write('Informe o salário: ');
    final salary = num.parse(stdin.readLineSync().toString());

    stdout.write('Informe o total de vendas do mês passado: ');
    final totalSaleValue = num.parse(stdin.readLineSync().toString());

    stdout.write('Informe o percentual de comissão: ');
    final comission = num.parse(stdin.readLineSync().toString());

    final personalComissionValue = (totalSaleValue * 100) / comission;

    print(
      'O funcionário $name deverá receber este mês o valor ${salary + personalComissionValue}, sendo $salary de salário e $personalComissionValue de comissão.',
    );
  } on FormatException {
    print('Erro ao formatar os valores digitados');
  } catch (e) {
    print('Ocorreu o seguinte erro -> $e');
  }
}
