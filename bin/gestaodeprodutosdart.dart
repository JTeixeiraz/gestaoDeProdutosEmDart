import 'dart:io';

void main(List<String> arguments) {
  print('Hello world: !');
}


class Produtos {
  List<Map<String, dynamic>> produtos = [];
  late String _nome;
  late int _quantidade;
  late double _preco;

  get getNome => _nome;
  set setNome(String nome){
    _nome = nome;
  }

  get getQuantidade => _quantidade;
  set setQuantidade(int quantidade){
    _quantidade = quantidade;
  }

  get getPreco => _preco;
  set setPreco(double preco){
    _preco = preco;
  }

  void adicionarProduto() {
    print('Qual o nome do produto que deve ser adicionado ao estoque?:');
    String nomeProd = stdin.readLineSync() ?? "";
    setNome = nomeProd;
    print('Informe a quantidade disponivel do produto:');
    String quantiProd = stdin.readLineSync() ?? "";
    setQuantidade = int.parse(quantiProd);
    print('Informe o preço do produto que será adicionado:');
    String precoProd = stdin.readLineSync() ?? "";
    setPreco = double.parse(precoProd);
    produtos.add({"nome":getNome, "quantidade":getQuantidade, "preco":getPreco, "id":produtos.length});
    print('Produto adicionado + id unico implementado');
    print(produtos[produtos.length]);
  }

  void removerProduto(){
    print('Adicione o id do produto que deseja remover(caso não saiba, vá na opção de listar produtos e procure o produto que deseja remover, lá estará o id):');
    String idProduto = stdin.readLineSync()??"";
  }
}