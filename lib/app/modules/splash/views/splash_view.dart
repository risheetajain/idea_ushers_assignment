import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../themes/decoration.dart';
import '../../../routes/app_pages.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isEnd = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAndToNamed(Routes.HOME);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.isDarkMode;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              if (isEnd)
                AnimatedOpacity(
                  opacity: isEnd ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  child: Image.asset(
                    isDark
                        ? 'assets/logo_dark.png'
                        : 'assets/logo_light.png',
                    width: size.width * 0.6,
                  ),
                ),
              Center(
                  child: TweenAnimationBuilder(
                onEnd: () {
                  setState(() {
                    isEnd = true;
                  });
                },
                tween: Tween<double>(begin: 0, end: 70),
                duration: const Duration(seconds: 2),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(value, 0),
                    child: Image.asset(
                      'assets/icon.png',
                      height: 100,
                    ),
                  );
                },
              )),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          if (isEnd)
            Text(
              "Fitness",
              style: midTitle,
            )
        ],
      ),
    );
  }
}
