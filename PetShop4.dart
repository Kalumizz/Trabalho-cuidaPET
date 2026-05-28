import 'dart:io';
import 'dart:math';

void exibirMenuPrincipal(String nome) {
  print("\nOlá $nome, escolha um dos serviços abaixo:");
  print(
    "Opção 1 – Ver promoções \nOpção 2 – Solicitar serviço \nOpção 3 – Listar carrinho de compras \nOpção 4 - Finalizar carrinho de compras \nOpção 0 - Sair",
  );
  print("Digite sua opção desejada: ");
}

void exibirPromocoes() {
  print("\n--- PROMOÇÕES DO DIA ---");
  print(
    "Código 101 - Ração Royal Canin Indoor Para Cães Adultos De Porte Mini De Ambientes Internos 7,5kg na promoção pelo preço de R 290,00",
  );
  print(
    "Código 102 - Ração Royal Canin Sterilised para Gatos Adultos Castrados e com o valor promocional de R 492,00",
  );
  print(
    "Código 103 - Bifinho Keldog para Cães Porte Pequeno Sabor Carne e Cereais por R23,92",
  );
  print(
    "Código 104 - Fraldas Descartáveis Super Secão para Cães Machos com 12 Unidades R 38,61",
  );
  print("8 - Adicionar ao carrinho de compras");
  print("0 - Voltar");
}

void adicionarPromocaoAoCarrinho(List<String> carrinho, double total, int codigo) {
  if (carrinho.length >= 3) {
    print("Seu carrinho de compras já está cheio.");
    return total;
  }

  switch (codigo) {
    case 101:
      carrinho.add("Ração Royal Canin Cães - R 290,00");
      total += 290.00;
      print("Item 101 adicionado!");
      break;
    case 102:
      carrinho.add("Ração Royal Canin Gatos - R 492,00");
      total += 492.00;
      print("Item 102 adicionado!");
      break;
    case 103:
      carrinho.add("Bifinho Keldog - R 23,92");
      total += 23.92;
      print("Item 103 adicionado!");
      break;
    case 104:
      carrinho.add("Fraldas Super Secão - R 38,61");
      total += 38.61;
      print("Item 104 adicionado!");
      break;
    default:
      print("Código inválido.");
  }
  return total;
}

void exibirServicos() {
  print("\n--- SERVIÇOS DISPONÍVEIS ---");
  print("Código 201 - Banho e tosa - R 55,99");
  print("Código 202 - Tosa higiênica - R 12,99");
  print("Código 203 - Hidratação dos pelos - R 20,99");
  print("8 - Adicionar ao carrinho de compras");
  print("0 - Voltar");
}

void adicionarServicoAoCarrinho(List<String> carrinho, double total, int codigo) {
  if (carrinho.length >= 3) {
    print("Seu carrinho de compras já está cheio.");
    return total;
  }

  switch (codigo) {
    case 201:
      carrinho.add("Banho e tosa - R 55,99");
      total += 55.99;
      print("Serviço 201 adicionado com sucesso!");
      break;
    case 202:
      carrinho.add("Tosa higiênica - R 12,99");
      total += 12.99;
      print("Serviço 202 adicionado com sucesso!");
      break;
    case 203:
      carrinho.add("Hidratação dos pelos - R 20,99");
      total += 20.99;
      print("Serviço 203 adicionado com sucesso!");
      break;
    default:
      print("Código de serviço inválido.");
  }
  return total;
}

void listarCarrinho(List<String> carrinho, double total) {
  print("\n--- SEU CARRINHO ---");
  if (carrinho.isEmpty) {
    print("O carrinho está vazio.");
  } else {
    carrinho.forEach((item) => print("- $item"));
    print("Total atual: R ${total.toStringAsFixed(2)}");
  }
}

void finalizarCompra(List<String> carrinho, double total, String nome) {
  if (carrinho.isEmpty) {
    print("\nSeu carrinho está vazio! Adicione itens antes de finalizar.");
    return;
  }

  print("\n--- FINALIZAÇÃO DE PEDIDO ---");
  print("Valor total dos itens: R ${total.toStringAsFixed(2)}");
  print("Escolha a forma de pagamento:");
  print("1 - Dinheiro (10% de desconto)");
  print("2 - Cartão (Valor integral)");

  print("Digite sua opção: ");
  int formaPagamento = int.parse(stdin.readLineSync()!);

  if (formaPagamento == 1) {
    double valorFinal = total * 0.90;
    double economia = total - valorFinal;

    print("\n--- RECIBO ---");
    print("Desconto aplicado: R ${economia.toStringAsFixed(2)}");
    print("VALOR A PAGAR: R ${valorFinal.toStringAsFixed(2)}");
    print("Obrigado pela preferência, $nome!");
    carrinho.clear();
    total = 0.0;
  } else if (formaPagamento == 2) {
    print("\n--- RECIBO ---");
    print("VALOR A PAGAR: R ${total.toStringAsFixed(2)}");
    print("Pagamento processado no cartão.");
    print("Obrigado pela preferência, $nome!");
    carrinho.clear();
    total = 0.0;
  } else {
    print("Opção de pagamento inválida. Retornando ao menu.");
  }
}

void areaRestrita() {
  print("Área restrita dos funcionários.");
  print("Digite o nome do cliente: ");
  String nomeCliente = stdin.readLineSync()!;
  print("Digite o valor gasto na loja: ");
  double valorGasto = double.parse(stdin.readLineSync()!);
  print("Digite a forma de pagamento (D - dinheiro ou C - cartão): ");
  String formaPagamento = stdin.readLineSync()!.toUpperCase();
  double valorFinal;
  if (formaPagamento == "D") {
    valorFinal = valorGasto * 0.9;
    print("Desconto de 10% aplicado.");
  } else if (formaPagamento == "C") {
    valorFinal = valorGasto;
  } else {
    print("Forma de pagamento inválida.");
    return;
  }
  print("Valor final a ser pago: R ${valorFinal.toStringAsFixed(2)}");
  print("Obrigado!");
}

main() {
  List<String> carrinho = [];
  double total = 0.0;
  int opcaoPrincipal;

  print("Bem vindo ao autoatendimento do Cuidapet");
  print("Por gentileza, digite seu nome: ");
  String nome = stdin.readLineSync()!;

  if (nome == "cuidapetrestrito") {
    areaRestrita();
    return;
  }

  do {
    exibirMenuPrincipal(nome);
    opcaoPrincipal = int.parse(stdin.readLineSync()!);
    switch (opcaoPrincipal) {
      case 1:
        int opcaoPromocao;
        do {
          exibirPromocoes();
          print("Escolha uma opção: ");
          opcaoPromocao = int.parse(stdin.readLineSync()!);

          if (opcaoPromocao == 8) {
            print("Digite o CÓDIGO do item que deseja: ");
            int codigo = int.parse(stdin.readLineSync()!);
            total = adicionarPromocaoAoCarrinho(carrinho, total, codigo);
          }
        } while (opcaoPromocao != 0);
        break;

      case 2:
        int opcaoServico;
        do {
          exibirServicos();
          print("Digite sua opção desejada: ");
          opcaoServico = int.parse(stdin.readLineSync()!);

          if (opcaoServico == 8) {
            print("Digite o CÓDIGO do serviço que deseja adicionar: ");
            int codigoS = int.parse(stdin.readLineSync()!);
            total = adicionarServicoAoCarrinho(carrinho, total, codigoS);
          }
        } while (opcaoServico != 0);
        break;

      case 3:
        listarCarrinho(carrinho, total);
        break;

      case 4:
        finalizarCompra(carrinho, total, nome);
        break;

      case 0:
        print("Saindo... Obrigado por usar o CuidaPet!");
        break;

      default:
        print("Opção em desenvolvimento ou inválida.");
    }
  } while (opcaoPrincipal != 0);
}
