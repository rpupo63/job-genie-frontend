import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_landing_page/env/env.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:seo/seo.dart';
import 'package:dart_fusion/dart_fusion.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setPathUrlStrategy();
  if (kIsWeb) {
    MetaSEO().config();
  }
  runApp(
    Builder(
      builder: (context) {
        return SeoController(
          tree: WidgetTree(context: context),
          child: MaterialApp.router(
            title: 'Job-Genie',
            routerConfig: Env.routes,
            theme: Constants.lightTheme,
            debugShowCheckedModeBanner: false,
            scrollBehavior: const DBehavior(),
          ),
        );
      },
    ),
  );
}
