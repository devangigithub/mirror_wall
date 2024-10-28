import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class SearchPage extends StatelessWidget {
@override
Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: Text('Search Engine',style: TextStyle(fontSize: 30),),
    ),
    backgroundColor: Colors.white,

    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          GestureDetector(
            onTap: (){
              String url = "https://www.google.com/";
               Navigator.pushNamed(context, 'detail_screen',arguments: url);

            },
            child: Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/googal.png',
                  ),
                  Text('Googal',style: TextStyle(
                      fontSize: 22
                  ),),
                ],
              )
            ),
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              String url = "https://www.bing.com";
              Navigator.pushNamed(context, 'detail_screen',arguments: url);

            },
            child: Container(
              height: 100,
              width: 300,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/bing.png',
                    width: 100,
                    height: 100,
                  ),
                  Text('Bing',style: TextStyle(
                      fontSize: 22
                  ),)
                ],
              )
            ),
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              String url = 'https://www.yahoo.com';
              Navigator.pushNamed(context, 'detail_screen',arguments: url);

            },
            child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
              padding: EdgeInsets.all(10),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/yahoo.png',
                    width: 100,
                    height: 100,
                  ),
                  Text('Yahoo',style: TextStyle(
                      fontSize: 22
                  ),)
                ],
              )
            ),
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              String url = 'https://www.duckduckgo.com';
              Navigator.pushNamed(context, 'detail_screen',arguments: url);

            },
            child: Container(
              height: 100,
              width: 300,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/duckduckgo.png',
                    width: 100,
                    height: 100,
                  ),
                  Text('Duckduckgo',style: TextStyle(
                    fontSize: 22
                  ),)
                ],
              )
              
            ),
          ),
        ],
      ),
    ),
  );
}
}




