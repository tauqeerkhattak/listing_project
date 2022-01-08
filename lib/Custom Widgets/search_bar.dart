import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listing_project/Data/data.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;

  const SearchBar({Key? key, this.controller, this.hintText, this.prefixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
        bottom: 20,
        left: 25,
        right: 25,
      ),
      height: 55,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Data.secondaryColor.withOpacity(0.4),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.0,
              color: Data.primaryColor,
            ),
            borderRadius: BorderRadius.circular(40,),
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: Data.secondaryColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.0,
              color: Data.primaryColor,
            ),
            borderRadius: BorderRadius.circular(40,),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Data.secondaryColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.0,
              color: Data.primaryColor,
            ),
            borderRadius: BorderRadius.circular(40,),
          ),
        ),
      ),
    );
  }
}