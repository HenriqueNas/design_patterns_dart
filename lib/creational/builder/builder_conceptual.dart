abstract class Builder {
  void buildPartA();
  void buildPartB();
  void buildPartC();
}

class ConcreteBuilder implements Builder {
  final Product _product = Product.empty();

  @override
  void buildPartA() {
    _product.name = 'Part A';
    _product.value = 'Value A';
  }

  @override
  void buildPartB() {
    _product.name = 'Part B';
    _product.value = 'Value B';
  }

  @override
  void buildPartC() {
    _product.name = 'Part C';
    _product.value = 'Value C';
  }

  Product getProduct() => _product;
}

class Product {
  String _name = '';
  String _value = '';

  String get name => _name;
  set name(String name) => _name = name;

  String get value => _value;
  set value(String value) => _value = value;

  Product.empty();
}
