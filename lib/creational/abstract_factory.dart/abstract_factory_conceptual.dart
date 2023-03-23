abstract class AbstractFactory {
  AbstractProductA createProductA();
  AbstractProductB createProductB();
}

class ConcreteFactory1 implements AbstractFactory {
  @override
  AbstractProductA createProductA() => ConcreteProductA1();

  @override
  AbstractProductB createProductB() => ConcreteProductB1();
}

class ConcreteFactory2 implements AbstractFactory {
  @override
  AbstractProductA createProductA() => ConcreteProductA2();

  @override
  AbstractProductB createProductB() => ConcreteProductB2();
}

abstract class AbstractProductA {
  String usefulFunctionA();
}

abstract class AbstractProductB {
  String usefulFunctionB();
  String anotherUsefulFunctionB(AbstractProductA collaborator);
}

class ConcreteProductA1 implements AbstractProductA {
  @override
  String usefulFunctionA() => 'The result of the product A1.';
}

class ConcreteProductA2 implements AbstractProductA {
  @override
  String usefulFunctionA() => 'The result of the product A2.';
}

class ConcreteProductB1 implements AbstractProductB {
  @override
  String usefulFunctionB() => 'The result of the product B1.';

  @override
  String anotherUsefulFunctionB(AbstractProductA collaborator) =>
      'The result of the B1 collaborating with the (${collaborator.usefulFunctionA()})';
}

class ConcreteProductB2 implements AbstractProductB {
  @override
  String usefulFunctionB() => 'The result of the product B2.';

  @override
  String anotherUsefulFunctionB(AbstractProductA collaborator) =>
      'The result of the B2 collaborating with the (${collaborator.usefulFunctionA()})';
}

void clientCode(AbstractFactory factory) {
  final productA = factory.createProductA();
  final productB = factory.createProductB();

  print(productB.usefulFunctionB());
  print(productB.anotherUsefulFunctionB(productA));
}

void main() {
  print('Client: Testing client code with the first factory type...');
  clientCode(ConcreteFactory1());
  print('');

  print('Client: Testing the same client code with the second factory type...');
  clientCode(ConcreteFactory2());
}

// Client: Testing client code with the first factory type...
// The result of the product B1.
// The result of the B1 collaborating with the (The result of the product A1.)

// Client: Testing the same client code with the second factory type...
// The result of the product B2.
// The result of the B2 collaborating with the (The result of the product A2.)

/// The abstract factory pattern is a factory of factories. The abstract factory pattern is used when you want to create a