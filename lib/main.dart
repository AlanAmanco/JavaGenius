import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = [
    {
      'texto': 'Qual é a forma mais comum de declarar uma variável em Java?',
      'respostas': [
        {'texto': 'var', 'pontuacao': 0},
        {'texto': 'let', 'pontuacao': 0},
        {'texto': 'const', 'pontuacao': 0},
        {'texto': 'int', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'O que é um loop em Java?',
      'respostas': [
        {
          'texto': 'Uma variável que armazena um conjunto de valores',
          'pontuacao': 0
        },
        {
          'texto': 'Uma instrução que realiza uma operação matemática',
          'pontuacao': 0
        },
        {
          'texto':
              'Um conjunto de instruções que se repetem até que uma condição seja satisfeita',
          'pontuacao': 1
        },
        {
          'texto': 'Uma instrução que retorna um valor booleano',
          'pontuacao': 0
        },
      ],
    },
    {
      'texto': 'O que é uma classe em Java?',
      'respostas': [
        {
          'texto': 'Um conjunto de variáveis que armazenam valores',
          'pontuacao': 0
        },
        {
          'texto':
              'Uma coleção de instruções que realizam uma tarefa específica',
          'pontuacao': 0
        },
        {
          'texto': 'Uma estrutura de dados que representa um objeto',
          'pontuacao': 1
        },
        {
          'texto': 'Uma variável que armazena um conjunto de valores',
          'pontuacao': 0
        },
      ],
    },
    {
      'texto': 'O que é polimorfismo em Java?',
      'respostas': [
        {
          'texto':
              'Um conjunto de instruções que se repetem até que uma condição seja satisfeita',
          'pontuacao': 0
        },
        {
          'texto': 'A capacidade de um objeto ter muitas formas',
          'pontuacao': 1
        },
        {
          'texto': 'A técnica de ocultar a implementação de um método',
          'pontuacao': 0
        },
        {
          'texto':
              'A técnica de dividir um programa em pequenos blocos de código',
          'pontuacao': 0
        },
      ],
    },
    {
      'texto': 'O que é herança em Java?',
      'respostas': [
        {
          'texto': 'A capacidade de um objeto ter muitas formas',
          'pontuacao': 0
        },
        {
          'texto': 'A técnica de ocultar a implementação de um método',
          'pontuacao': 0
        },
        {
          'texto':
              'A técnica de dividir um programa em pequenos blocos de código',
          'pontuacao': 0
        },
        {
          'texto':
              'A capacidade de uma classe herdar propriedades e métodos de outra classe',
          'pontuacao': 1
        },
      ],
    },
    {
      'texto': 'Qual é a forma mais comum de declarar uma variável em Java?',
      'respostas': [
        {'texto': 'var', 'pontuacao': 0},
        {'texto': 'let', 'pontuacao': 0},
        {'texto': 'const', 'pontuacao': 0},
        {'texto': 'int', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'O que é uma classe abstrata em Java?',
      'respostas': [
        {'texto': 'Uma classe que não pode ser herdada', 'pontuacao': 1},
        {
          'texto': 'Uma classe que só pode ser instanciada uma vez',
          'pontuacao': 0
        },
        {'texto': 'Uma classe que não pode ser instanciada', 'pontuacao': 2},
        {'texto': 'Uma classe que não pode ser modificada', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'O que é o operador "==" em Java?',
      'respostas': [
        {'texto': 'Um operador de atribuição', 'pontuacao': 0},
        {'texto': 'Um operador lógico', 'pontuacao': 0},
        {'texto': 'Um operador de comparação', 'pontuacao': 2},
        {'texto': 'Um operador aritmético', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'O que é o Java Virtual Machine (JVM)?',
      'respostas': [
        {'texto': 'Um compilador de Java', 'pontuacao': 0},
        {'texto': 'Uma plataforma de desenvolvimento Java', 'pontuacao': 0},
        {
          'texto': 'Um ambiente de execução para programas Java',
          'pontuacao': 2
        },
        {'texto': 'Um conjunto de bibliotecas Java', 'pontuacao': 0},
      ],
    },
    {
      'texto':
          'Qual é a diferença entre uma interface e uma classe abstrata em Java?',
      'respostas': [
        {'texto': 'Interfaces não podem ter métodos', 'pontuacao': 0},
        {'texto': 'Classes abstratas não podem ser herdadas', 'pontuacao': 0},
        {
          'texto': 'Interfaces podem ter apenas métodos abstratos',
          'pontuacao': 2
        },
        {'texto': 'Classes abstratas podem ser instanciadas', 'pontuacao': 0},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
