import 'package:flutter/material.dart';

import '../res/all_res.dart';
class AppViwe extends StatefulWidget {
  const AppViwe({super.key});

  @override
  State<AppViwe> createState() => _AppViweState();
}

class _AppViweState extends State<AppViwe> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: allData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(7),
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'detail_screen', arguments: allData[index]['url']);
            },
            child: Card(
              child: Container(
                child: Column(
                  children: [
                    Text(allData[index]['title'],
                      style: TextStyle(
                        fontSize: 22,
                      ),

                      textAlign: TextAlign.center,),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
