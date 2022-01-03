import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  const AnimatedPage({Key? key}) : super(key: key);

  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  bool isVisible = true;
  int elapsed = 0;
  int s = 0;
  int t = 0;
  int u = 0;

  Widget _container(List<Widget> children) {
    return Container(
      width: 300.0,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      margin: const EdgeInsets.only(bottom: 60.0),
    );
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Column(
        children: [
          _container(
            [
              AnimatedSwitcher(
                child: isVisible
                    ? Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.red,
                      )
                    : Container(
                        key: UniqueKey(),
                        height: 100.0,
                        width: 100.0,
                        color: Colors.blue,
                      ),
                duration: const Duration(seconds: 2),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: const Text('Click'),
              ),
            ],
          ),
          _container(
            [
              AnimatedSwitcher(
                child: Text("Elapsed : $s", key: ValueKey(s)),
                duration: const Duration(seconds: 1),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    s++;
                  });
                },
                child: const Text('Click'),
              ),
            ],
          ),
          _container(
            [
              AnimatedSwitcher(
                child: Text("Elapsed : $elapsed", key: ValueKey(elapsed)),
                duration: const Duration(seconds: 1),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    child: child,
                    scale: animation,
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    elapsed++;
                  });
                },
                child: const Text('Click'),
              ),
            ],
          ),
          // _container(
          //   [
          //     AnimatedSwitcher(
          //       child: Text("Elapsed : $t", key: ValueKey(t)),
          //       duration: const Duration(seconds: 1),
          //       transitionBuilder: (Widget child, Animation<double> animation) {
          //         final offsetAnimation = Tween<Offset>(
          //           begin: const Offset(0.0, -1.0),
          //           end: const Offset(0.0, 0.0),
          //         ).animate(animation);

          //         return SlideTransition(
          //           position: offsetAnimation,
          //           child: child,
          //         );
          //       },
          //     ),
          //     ElevatedButton(
          //       onPressed: () {
          //         setState(() {
          //           t++;
          //         });
          //       },
          //       child: const Text('Click'),
          //     ),
          //   ],
          // ),
          _container(
            [
              AnimatedSwitcher(
                child: Text("Elapsed : $u", key: ValueKey(u)),
                duration: const Duration(milliseconds: 300),
                layoutBuilder:
                    (Widget? currentChild, List<Widget> previousChildren) {
                  List<Widget> children = previousChildren;
                  if (currentChild != null) {
                    children = children.toList()..add(currentChild);
                  }
                  // return Stack(
                  //   children: previousChildren,
                  //   alignment: Alignment.bottomCenter,
                  // );

                  return currentChild!;
                },
                transitionBuilder: (Widget child, Animation<double> animation) {
                  final offsetAnimation = Tween<Offset>(
                    begin: const Offset(0.0, 1.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    u++;
                  });
                },
                child: const Text('Click'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
