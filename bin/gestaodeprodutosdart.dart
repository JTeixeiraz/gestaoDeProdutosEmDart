import 'dart:io';

void main(List<String> arguments) {
  //testando a forma de como remover um elemento em uma Map array
  List<Map<String, dynamic>> produto = [{"nome":"joao", "idade":20} ];
  print(produto[0]);
  produto.removeAt(0);
  print(produto);
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
    setNome = nomeProd.toUpperCase();
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
    int produtoRemovido = int.parse(idProduto);
    try {
      print('O produto: ${produtos[produtoRemovido]["nome"]} foi removido com sucesso.');
      produtos.removeAt(produtoRemovido);
    } catch (e) {
      print('Erro: $e');
      print('Provavelmente o produto que tentou remover não existe.');
    }
  }

  void atualizarEstoque(){
    bool sair = false;
    while(!sair){
      print('Oque deseja alterar em um produto?');
      print('1-Quantidade');
      print('2-Preço');
      print('5-Sair');
      String escolha = stdin.readLineSync()??"";
      switch (escolha) {
        case "1":

          break;
        default:
      }
    }
  }

  void mudarQuantidade(){
    print('De qual forma deseja encontrar o produto expecifico para altera-lo? \n 1-ID \n 2-Nome');
    String escolha = stdin.readLineSync()??"";
    switch (escolha) {
      case "1":
        print('Digite o id do produto que deseja alterar');
        String idproduto = stdin.readLineSync()??"";
        int valorDoId = int.parse(idproduto);
        print("Qual a nova quantidade do produto?:");
        String usuarioQuantidade = stdin.readLineSync()??"";
        int valorQuantidade = int.parse(usuarioQuantidade);
        produtos[valorDoId]["quantidade"]=valorQuantidade;
        break;
      case "2":
          print('Digite o nome do produto que deseja alterar');
        break;
      default:
    }
  }
}