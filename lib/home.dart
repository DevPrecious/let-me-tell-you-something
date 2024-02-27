import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _speed = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = Tween<double>(begin: 0.0, end: -1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Transform.translate(
              offset: Offset(
                  0.0, _animation.value * MediaQuery.of(context).size.height),
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _animation.value < -0.5 ? 0.0 : 1.0,
                child: Container(
                  color: Colors.red,
                  width: 300,
                  height: 200,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Transform.translate(
            offset: Offset(
              0.0,
              _animation.value * MediaQuery.of(context).size.height * 0.220,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.search),
                      Column(
                        children: [
                          Text('location'),
                          Text('Nigeria'),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Popular food',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Chip(
                        label: Text('Jollof'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Chip(
                          label: Text('Jollof'),
                        ),
                      ),
                      Chip(
                        label: Text('Jollof'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Chip(
                          label: Text('Jollof'),
                        ),
                      ),
                      Chip(
                        label: Text('Jollof'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
