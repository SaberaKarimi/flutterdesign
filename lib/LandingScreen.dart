import 'package:flutter/material.dart';
import 'package:flutterdesign/BorderBox.dart';
import 'package:flutterdesign/OptionButton.dart';
import 'package:flutterdesign/constants.dart';
import 'package:flutterdesign/custom_functions.dart';
import 'package:flutterdesign/sample_data.dart';
import 'package:flutterdesign/widget_functions.dart';


class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          // width: size.width,
          // height: size.height,
            child: Stack(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      adverticalSpace(padding),
                      Padding(
                        padding: sidePadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BorderBox(
                              width: 50,
                              height: 50,
                              child: Icon
                                (Icons.menu,
                                color: COLOR_BLACK,
                              ),
                            ),
                            BorderBox(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.settings,
                                color: COLOR_BLACK,
                              ),
                            ),
                          ],
                        ),
                      ),
                      adverticalSpace(padding),
                      Padding(
                        padding: sidePadding,
                        child: Text("City", style: themeData.textTheme.bodyText2,),
                      ),
                      Padding(
                        padding: sidePadding,
                        child: Text(
                          "San francisco", style: themeData.textTheme.headline1,),
                      ),
                      Padding(
                        padding: sidePadding,
                        child: Divider(
                          height: padding,
                          color: COLOR_GREY,
                        ),
                      ),
                      adverticalSpace(10),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            "<\$2200,000", "For Sale", "304 Beds", ">1000 sqft"]
                              .map((filters) => ChoiceOption(text: filters)).toList(),
                        ),
                      ),
                      adverticalSpace(10),
                      Expanded(
                        child: Padding(
                          padding: sidePadding,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: RE_DATE.length,
                              itemBuilder: (context, index) {
                                return RealEstateItem(itemDate: RE_DATE[index]);
                              }),
                        ),
                      )
                    ]
                ),
                Positioned(
                    bottom: 20,
                    width: size.width,
                    child: Center(
                      child: OptionButton(text: "Map View",
                          icon: Icons.map_rounded, width: size.width*0.35),
                    ))
              ],
            )
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 25),
      child: Text(text, style: themeData.textTheme.headline5,),

    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemDate;
  const RealEstateItem({super.key, required this.itemDate});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData=Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius:BorderRadius.circular(25.0),
                  child: Image.asset(itemDate["image"])),
              Positioned(
                  top: 15,
                  right: 15,
                  child: BorderBox(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.favorite_border,color: COLOR_BLACK,),
                  )),

            ],
          ),
          adverticalSpace(15),
          Row(
            children: [
              Text("${formatCurrency(itemDate["amount"])}",
                style: themeData.textTheme.headline1, ),
              Text(
                "${itemDate["address"]}",
                style: themeData.textTheme.bodyText2,
              )
            ],

          ),
          adverticalSpace(10),
          Text("${itemDate["bedroom"]} bedroom/${itemDate["bathroom"]}bathroom/${itemDate["area"]}sqft",
            style: themeData.textTheme.headline5, ),
        ],
      ),
    );
  }
}
//
// class LandingScreen extends StatelessWidget {
//   const LandingScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     final ThemeData themeData = Theme.of(context);
//     double padding = 25;
//     final sidePadding = EdgeInsets.symmetric(horizontal: padding);
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//             width: size.width,
//             height: size.height,
//             child: Stack(
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     addVerticalSpace(padding),
//                     Padding(
//                       padding: sidePadding,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           BorderBox(
//                             padding: sidePadding,
//                             width: 50,
//                             height: 50,
//                             child: Icon(
//                               Icons.menu,
//                               color: COLOR_BLACK,
//                             ),
//                           ),
//                           BorderBox(
//                             padding: sidePadding,
//                             width: 50,
//                             height: 50,
//                             child: Icon(
//                               Icons.settings,
//                               color: COLOR_BLACK,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     addVerticalSpace(20),
//                     Padding(
//                       padding: sidePadding,
//                       child: Text(
//                         'city',
//                         style: themeData.textTheme.bodyText2,
//                       ),
//                     ),
//                     addVerticalSpace(10),
//                     Padding(
//                       padding: sidePadding,
//                       child: Text(
//                         'San Fraccisco',
//                         style: themeData.textTheme.headline1,
//                       ),
//                     ),
//                     Padding(
//                       padding: sidePadding,
//                       child: Divider(
//                         height: padding,
//                         color: COLOR_GREY,
//                       ),
//                     ),
//                     addVerticalSpace(10),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       physics: BouncingScrollPhysics(),
//                       child: Row(
//                         children: [
//                           '<\$220,000',
//                           'For Sale',
//                           '3-4 Beds',
//                           '>1000 sqft'
//                         ].map((filter) => ChoiceOption(text: filter)).toList(),
//                       ),
//                     ),
//                     addVerticalSpace(10),
//                     Expanded(
//                       child: Padding(
//                         padding: sidePadding,
//                         child: ListView.builder(
//                             physics: BouncingScrollPhysics(),
//                             itemCount: RE_DATA.length,
//                             itemBuilder: (context, index) {
//                               return RealEstateItem(itemData: RE_DATA[index]);
//                             }),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Positioned(
//                     bottom: 20,
//                     width: size.width,
//                     child: Center(
//                       child: OptionButton(
//                         icon: Icons.map_rounded,
//                         text: 'Map View',
//                         width: size.width * 0.35,
//                       ),
//                     ))
//               ],
//             )),
//       ),
//     );
//   }
// }
//
// class ChoiceOption extends StatelessWidget {
//   final String text;
//
//   const ChoiceOption({Key? key, required this.text}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData themeData = Theme.of(context);
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.0),
//         color: COLOR_GREY.withAlpha(25),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
//       margin: const EdgeInsets.only(left: 25),
//       child: Text(
//         text,
//         style: themeData.textTheme.headline5,
//       ),
//     );
//   }
// }
//
// class RealEstateItem extends StatelessWidget {
//   final dynamic itemData;
//
//   const RealEstateItem({Key? key, required this.itemData}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData themeData = Theme.of(context);
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(25.0),
//                 child: Image.asset(itemData['image']),
//               ),
//               const Positioned(
//                 top: 15,
//                 right: 15,
//                 child: BorderBox(
//                   width: 50,
//                   height: 50,
//                   child: Icon(
//                     Icons.favorite_border,
//                     color: COLOR_BLACK,
//                   ),
//                 ),
//               ),
//               addVerticalSpace(15),
//               Row(
//                 children: [
//                   Text(
//                     '${formatCurrency(itemData['amount'])}',
//                     style: themeData.textTheme.headline1,
//                   ),
//                   addHorizontalSpace(10),
//                   Text(
//                     '${itemData['address']}',
//                     style: themeData.textTheme.bodyText2,
//                   ),
//                 ],
//               ),
//               addVerticalSpace(10),
//               Text(
//                 '${itemData['bedrooms']}bedrooms/${itemData['bathrooms']}bathrooms/${itemData['area']}sqft',
//                 style: themeData.textTheme.headline5,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
