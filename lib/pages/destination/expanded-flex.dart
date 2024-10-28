import 'package:flutter/material.dart';

class Rainbow extends StatelessWidget {
  const Rainbow({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the colors list with flex values
    final List<Map<Color, int>> colors = [
      {Colors.red: 1},
      {Colors.orange: 1},
      {Colors.yellow: 1},
      {Colors.green: 1},
      {Colors.blue: 2},  // Blue gets twice the space
      {Colors.indigo: 1},
      {Colors.purple: 1},
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              },
                  child: const Text('Kembali')),
              // Bagian warna pelangi, memenuhi satu layar penuh
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: colors.map((colorMap) {
                    Color color = colorMap.keys.first;
                    int flex = colorMap.values.first;

                    return Expanded(
                      flex: flex,
                      child: Container(color: color),
                    );
                  }).toList(),
                ),
              ),

              // Bagian bawah, bisa di-scroll
              const Column(
                children: [
                  Row(
                    children: [
                      ExpandedWidget(),
                      FlexibleWidget(),
                    ],
                  ),
                  Row(
                    children: [
                      ExpandedWidget(),
                      ExpandedWidget(),
                    ],
                  ),
                  Row(
                    children: [
                      FlexibleWidget(),
                      FlexibleWidget(),
                    ],
                  ),
                  Row(
                    children: [
                      FlexibleWidget(),
                      ExpandedWidget(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          border: Border.all(color: Colors.white),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Expanded',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent,
          border: Border.all(color: Colors.white),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Flexible',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}