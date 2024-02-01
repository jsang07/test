import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({super.key});
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _frontVisible = true;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -180.0), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: 180.0, end: 0.0), weight: 0.5),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flip() {
    setState(() {
      _frontVisible = !_frontVisible;
    });
    _controller.forward().then((_) {
      _controller.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flip,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_animation.value),
            child: IndexedStack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.orange,
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(180),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  ),
                ),
              ],
              index: _frontVisible ? 0 : 1,
            ),
          );
        },
      ),
    );
  }
}
