import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final stepsCounter = 0.obs;
  final caloriesBurned = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print("on Init");
    getFootSteepAndCalorieBurn();
  }

  Future<List> getFootSteepAndCalorieBurn() async {
    final health = HealthFactory();
    await Permission.activityRecognition.request();
    // await Permission.location.request();
    bool requested = await health.requestAuthorization(
        [HealthDataType.STEPS, HealthDataType.ACTIVE_ENERGY_BURNED],
        permissions: [HealthDataAccess.READ, HealthDataAccess.READ]);
    print(" Request $requested");
    if (requested) {
      var now = DateTime.now();
      DateTime previousDay = DateTime(now.year, now.month, now.day);
      final stepCount = await health.getTotalStepsInInterval(previousDay, now);

      stepsCounter.value = stepCount ?? 0;

      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          previousDay, now, [HealthDataType.WEIGHT, HealthDataType.STEPS]);
      print(stepCount);
      print("Health ${healthData.length}");
      final myHealthData = healthData.map((e) {
        print(e.value);
        var b = e;

        return b.toJson();
      }).toList();
      print(myHealthData);
      // stepsCounter = myHealthData;
      return myHealthData;
    } else {
      print("Authenication Required");
      return [];
    }
  }
}
