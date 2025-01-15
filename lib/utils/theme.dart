import 'package:flutter/material.dart';
import 'colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryRed,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryRed,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: AppColors.black),
      bodyText2: TextStyle(color: AppColors.darkGray, fontSize: 10),
      headline6: TextStyle(
          color: AppColors.white, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.white,
        onPrimary: AppColors.black,
        side: const BorderSide(color: AppColors.iconGray),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.darkGray,
    appBarTheme: const AppBarTheme(
      color: AppColors.black,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: AppColors.white),
      bodyText2: TextStyle(color: AppColors.lightGray),
      headline6: TextStyle(
          color: AppColors.white, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.primaryRed,
        onPrimary: AppColors.white,
        side: const BorderSide(color: AppColors.iconGray),
      ),
    ),
  );
}
