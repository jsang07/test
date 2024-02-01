import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Q1 extends StatefulWidget {
  const Q1({super.key});

  @override
  State<Q1> createState() => _Q1State();
}

class _Q1State extends State<Q1> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool canFlip = false;

  void checkCanFlip() {
    if (true) {
      Future.delayed(const Duration(seconds: 1), () {
        cardKey.currentState?.toggleCard();
      });
    }
  }

  final textEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: cardKey,
      flipOnTouch: false,
      fill: Fill.fillBack,
      direction: FlipDirection.VERTICAL,
      side: CardSide.FRONT,
      front: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(13)),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                'Q1.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Text(
                '어떻게 불러드릴까요?',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Text(
                '(성함/닉네임 모두 좋아요!)',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textEditController,
                  decoration: const InputDecoration(
                    hintText: '이름 (닉네임) 입력',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      back: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                textEditController.clear();
              });
              cardKey.currentState?.toggleCard();
            },
            child: const Icon(
              Icons.restart_alt,
              size: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
