import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/single_item.dart';

class ItemWidget extends StatelessWidget {
  List img = [
    'Cappucino',
    'Latte',
    'Matcha',
    'Robusta',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: screenWidth < 600 ? (148 / 195) : (160 / 210),
      mainAxisSpacing: screenHeight * 0.03,
      children: [
        for (int i = 0; i < img.length; i++)
          Container(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.005, horizontal: screenWidth * 0.04),
            margin: EdgeInsets.symmetric(
                vertical: screenHeight * 0.005,
                horizontal: screenWidth * 0.035),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF212325),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingleItem(img[i])));
                  },
                  child: Container(
                    child: Image.asset(
                      "images/${img[i]}.png",
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.2,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.005),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          img[i],
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Wite Chocolate",
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$30",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(screenWidth * 0.025),
                        decoration: BoxDecoration(
                          color: Color(0xFFE57734),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          CupertinoIcons.bag,
                          size: screenWidth * 0.06,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
