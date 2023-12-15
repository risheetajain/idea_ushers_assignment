import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../widgets/home_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hi!'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              HomeCardWidget(
                  heading: 'Steps',
                  value: controller.stepsCounter.value,
                  goal: '15000',
                  image: 'steps.png'),
              const Gap(20),
              HomeCardWidget(
                  heading: 'Calories Burned',
                  value: controller.caloriesBurned.value,
                  goal: '1000',
                  image: 'cal.png'),
            ],
          ),
        ),
      ),
    );
  }
}
