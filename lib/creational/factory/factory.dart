abstract class ProductContract {
  String get name;
  String get value;

  ProductContract.empty();

  @override
  String toString() {
    return 'name: $name, value: $value';
  }
}

class Product implements ProductContract {
  final String _name;
  final String _value;

  Product({
    required String name,
    required String value,
  })  : _name = name,
        _value = value;

  @override
  String get name => _name;

  @override
  String get value => _value;

  factory Product.empty() {
    return Product(
      name: '',
      value: '',
    );
  }
}

class ProductDTO implements ProductContract {
  final String _name;
  final String _value;
  final Map<String, dynamic>? _json;

  ProductDTO({
    required String name,
    required String value,
    Map<String, dynamic>? json,
  })  : _name = name,
        _value = value,
        _json = json;

  @override
  String get name => _name;

  @override
  String get value => _value;

  Map<String, dynamic>? get json => _json;

  factory ProductDTO.fromJSON(Map<String, dynamic> json) {
    return ProductDTO(
      name: json['name'],
      value: json['value'],
      json: json,
    );
  }

  @override
  String toString() {
    String string = super.toString();
    final json = this.json;

    if (json != null) string += ', json: $json';

    return string;
  }
}
