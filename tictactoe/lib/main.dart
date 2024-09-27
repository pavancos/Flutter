import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TicTacToe(),
    );
  }
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<String> board = List.filled(9, '');
  String gameResult = '';
  bool isXTurn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333), // Updated color
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(
            color: Colors.white, // Updated text color for visibility
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: const Color(0xFF6F1A1A), // Updated color
      ),
      body: gamePlan(),
    );
  }

  Widget gamePlan() {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 9,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => _handleTap(index: index),
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFF848484), // Updated color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    board[index],
                    style: const TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            gameResult,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        IconButton.filled(
          splashColor: Colors.redAccent,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(const Color(0xFF6F1A1A)),
          ),
          onPressed: _resetGame, 
          icon: const Icon(
            Icons.refresh,
            color: Colors.white,
          ) 
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     _resetGame();
        //   },
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: const Color(0xFF6F1A1A),
        //   ),
          // child: 
          // const Text(
          //   'Reset',
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 20,
          //   ),
          // ),
      ],
    );
  }

  void _handleTap({required int index}) {
    if (board[index] == '' && gameResult == '') {
      setState(() {
        board[index] = isXTurn ? 'X' : 'O';
        isXTurn = !isXTurn;
        gameResult = _checkWinner();
      });
    }
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, '', growable: false);
      gameResult = '';
      isXTurn = true;
    });
  }

  String _checkWinner() {
    const winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] == board[pattern[1]] &&
          board[pattern[2]] == board[pattern[1]] &&
          board[pattern[0]] != "") {
        return "${board[pattern[0]]} wins!";
      }
    }
    if (!board.contains('')) {
      return 'It\'s a Draw';
    }
    return '';
  }
}
