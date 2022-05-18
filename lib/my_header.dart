import 'package:covid_19/info_screen.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHeader extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;

  const MyHeader({required this.image,required this.textTop,required this.textBottom});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 25, right: 10),
        height: 290,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xff3383cd), Color(0xff11249f)],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/Virus.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context){return InfoScreen();}));
                },
                child: SvgPicture.asset(
                  "assets/icons/menu.svg",
                  color: Colors.white,
                  //width: 60,
                  height: 50,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    image,
                    width: 340,
                    alignment: Alignment.topLeft,
                  ),
                  Positioned(
                      top: 20,
                      left: 130,
                      child: Text(
                        "$textTop\n$textBottom.",
                        style: kHeadingTextStyle.copyWith(
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MyClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}