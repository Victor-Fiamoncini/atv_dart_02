import 'dart:io';

class Customer {
  final String name;
  final num accountNumber;
  final num amount;

  Customer({
    required this.name,
    required this.accountNumber,
    required this.amount,
  });

  get hasNegativeAmount {
    return this.amount < 0 ? 'NEGATIVO' : 'POSITIVO';
  }

  @override
  String toString() {
    return 'Nome: $name, Conta: $accountNumber, Saldo: $amount';
  }
}

void main(List<String> args) {
  List<Customer> customers = [];
  num totalAmount = 0;
  int customersTotal = 0;

  try {
    while (customersTotal <= 10000) {
      stdout.write('Informe o número da conta: ');
      final accountNumber = num.parse(stdin.readLineSync().toString());

      if (accountNumber == -999) break;

      stdout.write('Informe o nome do cliente: ');
      final customerName = stdin.readLineSync().toString();

      stdout.write('Informe o saldo do cliente: ');
      final amount = num.parse(stdin.readLineSync().toString());

      final customer = Customer(
        name: customerName,
        accountNumber: accountNumber,
        amount: amount,
      );

      customers.add(customer);
      totalAmount += customer.amount;
      customersTotal++;
    }

    final customerWithNegativeAmount = customers
        .where((element) => element.hasNegativeAmount == 'NEGATIVO')
        .map((e) => e.toString())
        .toList();

    final parsedCustomers = customers.map((e) => e.toString()).toList();

    print('Clientes com saldo negativo: ${customerWithNegativeAmount}');
    print('Todos os clientes: $parsedCustomers');
    print('Saldo da agência: $totalAmount');
  } on FormatException {
    print('Erro ao formatar os valores digitados');
  } catch (e) {
    print('Ocorreu o seguinte erro -> $e');
  }
}
