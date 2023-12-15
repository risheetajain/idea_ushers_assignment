import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:idea_ushers_assignment/themes/color.dart';
import 'package:idea_ushers_assignment/themes/decoration.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.heading,
    required this.value,
    required this.goal,
    required this.image,
  });

  final String heading;
  final int value;
  final String goal;
  final String image;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.isDarkMode;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: isDark
              ? DarkModeColor().cardColor
              : LightModeColor().lightGreyColor,
          borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                    TextSpan(text: "$heading: ", style: midTitle, children: [
                  TextSpan(
                      text: value.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w600))
                ])),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(13),
                          minHeight: 16,
                          value: value / 100,
                          valueColor: AlwaysStoppedAnimation<Color>(isDark
                              ? Colors.white
                              : LightModeColor().blackColor),
                          backgroundColor: isDark
                              ? DarkModeColor().progressBar
                              : LightModeColor().darkgreyColor,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '0',
                              style: verysmallTitle,
                            ),
                            Text(
                              'Goal: $goal ',
                              style: verysmallTitle,
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
          const Gap(15),
          ImageIcon(
            AssetImage("assets/$image"),
            size: 48,
          )
        ],
      ),
    );
  }
}
