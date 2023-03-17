import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniarQuestionario);

  String get fraseResultado {
    if (pontuacao < 5) {
      return 'Trainee';
    } else if (pontuacao < 10) {
      return 'Júnior';
    } else if (pontuacao < 13) {
      return 'Pleno';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        ElevatedButton(
          child: const Text('Reiniciar'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          onPressed: quandoReiniarQuestionario,
        )
      ],
    );
  }
}
