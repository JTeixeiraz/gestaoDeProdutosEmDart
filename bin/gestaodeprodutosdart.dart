import 'dart:io';

void main(List<String> arguments) {
  print('=========== Gerenciador de estoque ===========');
  print('Informe o nome da empresa:');
  String nomeEmpresa = stdin.readLineSync()??"";
  bool sair = false;
  Empresa empresa = Empresa();
  while (!sair) {
    print('Seja bem vindo(a) $nomeEmpresa');
    print('==============================================');
    print('Oque deseja fazer? \n 1-Listar estoque completo \n 2-Adicionar produtos \n 3-Remover produtos \n 4-Editar produtos \n 5-Calcular valor total de produto \n 6-sair');
    String escolha = stdin.readLineSync()??"";
    switch (escolha) {
      case "1":
        empresa.exibirProdutos();
        break;
      case "2":
        empresa.adicionarProduto();
        break;
      case "3":
        empresa.removerProduto();
        break;
      case "4":
        empresa.atualizarEstoque();
        break;
      case "5":
        empresa.calcularProdutosPreco();
        break;
      case "6":
        sair = true;
        break;
      default:
    }
  }
}


class Empresa {
  List<Map<String, dynamic>> produtos = [];

  void adicionarProduto() {
    Produtos produto = Produtos();
    print('Qual o nome do produto que deve ser adicionado ao estoque?:');
    String nomeProd = stdin.readLineSync() ?? "";
    produto.setNome = nomeProd.toUpperCase();
    print('Informe a quantidade disponivel do produto:');
    String quantiProd = stdin.readLineSync() ?? "";
    produto.setQuantidade = int.parse(quantiProd);
    print('Informe o preço do produto que será adicionado:');
    String precoProd = stdin.readLineSync() ?? "";
    produto.setPreco = double.parse(precoProd);
    produtos.add({"nome":produto.getNome, "quantidade":produto.getQuantidade, "preco":produto.getPreco, "id": produtos.length});
    print('Produto adicionado + id unico implementado');
    print(produtos[produtos.length -1]);
    print('');
    print('Exibir o estoque? \n (y/n)');
    String escolhaexibir = stdin.readLineSync()??"";
    switch (escolhaexibir) {
      case "y":
        exibirProdutos();
        break;
      case "n":
      print('');
        break;
      default:
      print('Digite y para sim ou n para nao');
      break;
    }
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

  void exibirProdutos(){
    print("============== Estoque ==============");
    for (var i = 0; i < produtos.length; i++) {
      print(produtos[i]);
    }
  }

  void calcularProdutosPreco(){
    print('Digite o ID do produto que deseja calcular:');
    String idProdutoCalcular = stdin.readLineSync()??"";
    int? valorIdProdutoCalcular = int.tryParse(idProdutoCalcular)??0;
    print('Nome do produto: \n ${produtos[valorIdProdutoCalcular]["nome"]}');
    print('Quantidade em estoque: \n ${produtos[valorIdProdutoCalcular]["quantidade"]}');
    print('Preco do produto: \n ${produtos[valorIdProdutoCalcular]["preco"]}');
    print('=========================');
    double calculo = produtos[valorIdProdutoCalcular]["preco"]*produtos[valorIdProdutoCalcular]["quantidade"];
    print('Valor total de todos os produtos em estoque somados: \n $calculo');
  }

  void atualizarEstoque(){
    bool sairAtualizarEstoque = false;
    while(!sairAtualizarEstoque){
      print('Oque deseja alterar em um produto?');
      print('1-Quantidade');
      print('2-Preço');
      print('3-Sair');
      String escolha = stdin.readLineSync()??"";
      switch (escolha) {
        case "1":
            mudarQuantidade();
          break;
        case "2":
            mudarPreco();
          break;
        case "3":
        sairAtualizarEstoque = true;
          break;
        default:
      }
    }
  }

  void mudarQuantidade(){
    print('Digite o Id do produto que deseja alterar:');
    String escolhaProduto = stdin.readLineSync()??"";
    int? valEscolhaProduto = int.tryParse(escolhaProduto) ??0;
    print('Qual a quantidade que deseja alterar no estoque?:');
    String txtQuantidade = stdin.readLineSync()??"";
    int? valorQuantidade = int.tryParse(txtQuantidade) ??0;
    produtos[valEscolhaProduto]["quantidade"] = valorQuantidade;
    print('Valor alterado com sucesso');
  }

  void mudarPreco(){
    print('Digite o Id do produto que deseja alterar:');
    String escolhaProduto = stdin.readLineSync()??"";
    int? valEscolhaProduto = int.tryParse(escolhaProduto) ??0;
    print('Qual sera o novo preço do ${produtos[valEscolhaProduto]["nome"]}:');
    String txtPreco = stdin.readLineSync()??"";
    double? valorQuantidade = double.tryParse(txtPreco) ??0;
    produtos[valEscolhaProduto]["preco"] = valorQuantidade;
    print('Valor alterado com sucesso');
  }
}


class Produtos{
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
}