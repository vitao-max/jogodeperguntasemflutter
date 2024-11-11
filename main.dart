import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Oque é java?',
      'respostas': [
        {'texto': 'Linguagem de programação', 'pontuacao': 10},
        {'texto': 'Um jogo de tiro', 'pontuacao': 0},
        {'texto': 'Um app de redes sociais', 'pontuacao': 0},
        {'texto': 'Uma loja', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Oque é valorant?',
      'respostas': [
        {'texto': 'Um restalrante', 'pontuacao': 0},
        {'texto': 'Um jogo de construção', 'pontuacao': 0},
        {'texto': 'Um jogo de tiro', 'pontuacao': 10},
        {'texto': 'Nenhuma das alternativas', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Oque é mainecreft?',
      'respostas': [
        {'texto': 'Um jogo de construção', 'pontuacao': 10},
        {'texto': 'joda de tiro', 'pontuacao': 0},
        {'texto': 'uma loja de ropa', 'pontuacao': 0},
        {'texto': 'nenhuma das alternativas', 'pontuacao': 0},
      ],
    }
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
          backgroundColor: Colors.blue,
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