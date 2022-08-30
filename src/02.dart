import 'dart:io';

class Person {
  final int age;

  Person({required this.age});

  get isYoung {
    return this.age < 21;
  }

  get isOld {
    return this.age > 50;
  }

  @override
  String toString() {
    return 'Idade: ${this.age}';
  }
}

void main(List<String> args) {
  List<Person> persons = [];

  try {
    while (true) {
      stdout.write('Informe a idade: ');
      final age = int.parse(stdin.readLineSync().toString());

      if (age < 0 || age > 140) {
        print('Idade inválida');
        continue;
      }

      final person = Person(age: age);
      persons.add(person);

      stdout.write('Deseja sair (s/n): ');
      final exit = stdin.readLineSync().toString();

      if (exit == 's') {
        break;
      }
    }

    final youngPersons = persons
        .where((element) => element.isYoung)
        .map((e) => e.toString())
        .toList();

    final oldPersons = persons
        .where((element) => element.isOld)
        .map((e) => e.toString())
        .toList();

    print('Pessoas com menos de 21 anos: $youngPersons');
    print('Pessoas com mais de 50 anos: $oldPersons');
  } on FormatException {
    print('Erro ao formatar os valores digitados');
  } catch (e) {
    print('Ocorreu o seguinte erro -> $e');
  }
}
