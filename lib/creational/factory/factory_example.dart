// A classe criadora declara o método fábrica que deve retornar
// um objeto de uma classe produto. As subclasses da criadora
// geralmente fornecem a implementação desse método.
abstract class Dialog {
  // A criadora também pode fornecer alguma implementação
  // padrão do Factory Method.
  Button createButton();

  // Observe que, apesar do seu nome, a principal
  // responsabilidade da criadora não é criar produtos. Ela
  // geralmente contém alguma lógica de negócio central que
  // depende dos objetos produto retornados pelo método
  // fábrica. As subclasses pode mudar indiretamente essa
  // lógica de negócio ao sobrescreverem o método fábrica e
  // retornarem um tipo diferente de produto dele.
  void render() {
    // Chame o método fábrica para criar um objeto produto
    Button okButton = createButton();

    // Agora use o produto.
    okButton.onClick(() {});
    okButton.render();
  }
}

// Criadores concretos sobrescrevem o método fábrica para mudar
// o tipo de produto resultante.
class WindowsDialog extends Dialog {
  @override
  Button createButton() {
    return WindowsButton();
  }
}

class WebDialog extends Dialog {
  @override
  Button createButton() {
    return HTMLButton();
  }
}

// A interface do produto declara as operações que todos os
// produtos concretos devem implementar.
abstract class Button {
  void render();
  void onClick(f);
}

// Produtos concretos fornecem várias implementações da
// interface do produto.
class WindowsButton implements Button {
  @override
  void onClick(f) {
    // Vincula um evento de clique do SO nativo.
  }

  @override
  void render() {
    // Renderiza um botão no estilo Windows.
  }
}

class HTMLButton implements Button {
  @override
  void onClick(f) {
    // Vincula um evento de clique no navegador web.
  }

  @override
  void render() {
    // Retorna uma representação HTML de um botão.
  }
}

// O código cliente continua funcionando da mesma forma.
void main() {
  // A aplicação seleciona um tipo de criador dependendo da
  // configuração atual ou definições de ambiente.

  final os = 'Windows';

  Dialog dialog;

  switch (os) {
    case 'Windows':
      dialog = WindowsDialog();
      break;
    case 'Web':
      dialog = WebDialog();
      break;
    default:
      throw Exception('OS not supported');
  }

  dialog.render();
}
