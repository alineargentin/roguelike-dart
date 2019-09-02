import 'dart:math';
import 'package:roguelike/jogador.dart';
import 'package:roguelike/mundo.dart';
import 'package:roguelike/personagem.dart';
import 'package:roguelike/ponto_2d.dart';

class Carneiro extends Personagem {
  // Constantes
  static final int FICAR_PARADO = 0;
  static final int MOVER_BAIXO = 1;
  static final int MOVER_CIMA = 2;
  static final int MOVER_DIREITA = 3;
  static final int MOVER_ESQUERDA = 4;
  static final int QUANTIDADE_MOVIMENTOS = 5;
  static final String SIMBOLO_CRIATURA = "C";

  // Variável privada para criar números aleatório
  Random _aleatorio;

  // Construtor padrão + Construtor do pai (super)
  Carneiro(Ponto2D posicao, String simbolo) : super(posicao, simbolo) {
    // Random(SEED)
    // SEED = NULL indica que vai pegar o tempo atual
    _aleatorio = Random(null);
  }

  // Implementação do método abstrato atualizar
  // @mundo: mundo em que o personagem esta no momento
  void atualizar(Mundo mundo, [Jogador jogador]) {
    // criar um número aleatório entre 0 e 100,
    // logo em seguida, calcula o resto da divisão por 5,
    // ou seja, só podemos ter os seguintes valores: 0, 1, 2, 3 e 4
    
    //Decide direção
    int posiy=1,posix=3;
    (jogador.posicao.x > posicao.x) ? (posix = 4) : (posix=3);
    (jogador.posicao.y > posicao.y) ? (posiy = 2) : (posiy=1);
    int distanciaVertical=0, distanciaHorizontal=0;
    (jogador.posicao.x > posicao.x) ? (distanciaHorizontal = jogador.posicao.x-posicao.x) : (distanciaHorizontal=posicao.x-jogador.posicao.x);
    (jogador.posicao.y > posicao.y) ? (distanciaVertical = jogador.posicao.y-posicao.y) : (distanciaVertical=posicao.y-jogador.posicao.y);
    
    var direcao = _aleatorio.nextInt(1000) % QUANTIDADE_MOVIMENTOS;//recebe numero de 0 a 5
    if(distanciaHorizontal<2 && distanciaHorizontal<2){//Se a posição for a mesma do jogador move aleatório
      (distanciaVertical>distanciaHorizontal && direcao>0)? direcao=posix: direcao = posiy;// se está distante foge baseado na distancia de x e y
    }
    

    // desloca a criatura conforme o valor aleatório gerado
    if (direcao == FICAR_PARADO) {
      mover(mundo, 0, 0);
    } else if (direcao == MOVER_BAIXO) {
      mover(mundo, 0, 1);
    } else if (direcao == MOVER_CIMA) {
      mover(mundo, 0, -1);
    } else if (direcao == MOVER_DIREITA) {
      mover(mundo, 1, 0);
    } else if (direcao == MOVER_ESQUERDA) mover(mundo, -1, 0);
  }
}
