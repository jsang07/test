import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Q2 extends StatefulWidget {
  const Q2({super.key});

  @override
  State<Q2> createState() => _Q2State();
}

class _Q2State extends State<Q2> {
  List<bool> select = [false, false];
  Color basicColor = const Color.fromARGB(255, 250, 230, 213);

  void selected(int idx, int myNum) {
    if (select[idx] == false) {
      setState(() {
        select[myNum] = true;
      });
    }
  }

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool canFlip = false;

  void checkCanFlip() {
    if (select[0] == true || select[1] == true) {
      Future.delayed(const Duration(seconds: 1), () {
        cardKey.currentState?.toggleCard();
      });
    }
  }

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
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Q2.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Text(
                '성별을 알려주세요',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      selected(1, 0);
                      checkCanFlip();
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          select[0] == true ? Colors.black : basicColor,
                      child: Text(
                        '여',
                        style: TextStyle(
                            fontSize: 19,
                            color: select[0] == true
                                ? Colors.white
                                : Colors.grey.shade600),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      selected(0, 1);
                      checkCanFlip();
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          select[1] == true ? Colors.black : basicColor,
                      child: Text(
                        '남',
                        style: TextStyle(
                            fontSize: 19,
                            color: select[1] == true
                                ? Colors.white
                                : Colors.grey.shade600),
                      ),
                    ),
                  ),
                ],
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
                select[0] = false;
                select[1] = false;
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
