
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/screens/listscreen.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(      
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 129, 121, 121),
      // appBar: AppBar(actions: [
      //   TextField(
          
      //   ),
      // ]),
      body: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                       Navigator.pop(
                   context,
                     MaterialPageRoute(builder: (context) => const Listscreen()),
                    );
                    });
                  }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                  SizedBox(width: 10,),

                  Column(
                    children: [
                      SizedBox(height: 12,),
                      Text("Home",style: GoogleFonts.poppins(
                        color: Colors.white
                      )),
                    ],
                  )
                ],
              ),
    
    ));
  }
}
