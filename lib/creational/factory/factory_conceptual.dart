abstract class Creator {
  Product factoryMethod();

  String someOperation() {
    final product = factoryMethod();
    return 'Creator: The same creator\'s code has just worked with ${product.operation()}';
  }
}

class ConcreteCreator1 extends Creator {
  @override
  Product factoryMethod() {
    return ConcreteProduct1();
  }
}

class ConcreteCreator2 extends Creator {
  @override
  Product factoryMethod() {
    return ConcreteProduct2();
  }
}

abstract class Product {
  String operation();
}

class ConcreteProduct1 implements Product {
  @override
  String operation() {
    return '{Result of the ConcreteProduct1}';
  }
}

class ConcreteProduct2 implements Product {
  @override
  String operation() {
    return '{Result of the ConcreteProduct2}';
  }
}

void clientCode(Creator creator) {
  print('Client: I\'m not aware of the creator\'s class, but it still works.');
  print(creator.someOperation());
}

void main() {
  print('App: Launched with the ConcreteCreator1.');
  clientCode(ConcreteCreator1());
  print('');

  print('App: Launched with the ConcreteCreator2.');
  clientCode(ConcreteCreator2());
}
