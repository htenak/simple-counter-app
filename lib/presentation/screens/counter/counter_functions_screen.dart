import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCunter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Counter Functions")),
          actions: [
            IconButton(
                icon: const Icon(Icons.refresh_rounded),
                onPressed: () {
                  setState(() {
                    clickCunter = 0;
                  });
                }),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCunter',
                  style: const TextStyle(
                      fontSize: 160, fontWeight: FontWeight.w100)),
              Text('Click${clickCunter == 1 ? '' : 's'}',
                  style: const TextStyle(fontSize: 25)),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomBotton(
              icon: Icons.refresh_rounded,
              onPressed: () {
                if (clickCunter == 0) return;
                clickCunter = 0;
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
            CustomBotton(
              icon: Icons.exposure_minus_1,
              onPressed: () {
                if (clickCunter == 0) return;
                clickCunter--;
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
            CustomBotton(
              icon: Icons.exposure_plus_1,
              onPressed: () {
                clickCunter++;
                setState(() {});
              },
            ),
          ],
        ));
  }
}

class CustomBotton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomBotton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // shape: const StadiumBorder(),
      enableFeedback: true,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
