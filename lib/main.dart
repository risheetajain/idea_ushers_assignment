import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idea_ushers_assignment/themes/decoration.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: GoogleFonts.nunito().fontFamily,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              titleTextStyle: veryLargeTitle,
              centerTitle: false,
              elevation: 0,
              color: Colors.white),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: Colors.black)),
      darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
              titleTextStyle: veryLargeTitle.copyWith(color: Colors.white),
              centerTitle: false,
              elevation: 0,
              color: Colors.black),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(linearTrackColor: Colors.white)),
      title: "Idea Ushers Assignment",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
