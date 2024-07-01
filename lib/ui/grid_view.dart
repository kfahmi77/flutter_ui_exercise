import 'package:flutter/material.dart';

class GridViewUI extends StatelessWidget {
  const GridViewUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('GridView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GridView.builder(
                padding: const EdgeInsets.all(6),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.0,
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                ),
                itemCount: 100,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final Color color = index.isEven ? Colors.green : Colors.blue;
                  return Container(
                    color: color,
                    child: const Column(
                      children: [],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
