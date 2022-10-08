

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DemoScreen extends StatelessWidget {
  final int indexnumber;
  final String url;
  final String description;
  final String title;

  const DemoScreen(
      {super.key,
      required this.indexnumber,
      required this.title,
      required this.url,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back,color: Colors.white,)),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      children: [
                        SizedBox(height: 10,),
                        Text(title,style: GoogleFonts.poppins(color: Colors.white,),),
                      ],
                    ),
                  ],
                ),
              ),
              // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(url,), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Overview",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: GoogleFonts.poppins(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
