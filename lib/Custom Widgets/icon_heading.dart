import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listing_project/Data/data.dart';

class IconHeading extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final double? topMargin;

  const IconHeading({Key? key, this.icon, this.text, this.topMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: topMargin!,
        left: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Data.primaryColor,
            size: 25,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              text.toString(),
              style: GoogleFonts.nunito(
                color: Data.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}