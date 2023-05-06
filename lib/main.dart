import 'package:exam_6_5_2023/screen/home/provider/home_provider.dart';
import 'package:exam_6_5_2023/screen/home/view/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => home(),
        },
      ),
    )
  );
}