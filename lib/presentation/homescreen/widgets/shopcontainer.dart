// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ShopContainer extends StatelessWidget {
  const ShopContainer({
    super.key,
    required this.img,
    required this.title,
    required this.category,
    required this.price,
    required this.rating,
  });
  final String img;
  final String title;
  final String rating;

  final String price;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        border: Border.symmetric(),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Icon(Icons.favorite_border)],
            ),
          ),
          Container(
            height: 160,
            decoration:
                BoxDecoration(image: DecorationImage(image: NetworkImage(img))),
          ),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  category,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(
                    rating,
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          // Container(
          //   child: Row(
          //     children: [
          //       SizedBox(
          //         width: 25,
          //       ),
          //       Text(
          //         price,
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          //       ),
          //     ],
          //   ),
          // )
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
