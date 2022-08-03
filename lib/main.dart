import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:library_on/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAdMob.instance
      .initialize(appId: "ca-app-pub-3938598058070079~9662677920");
  runApp(MyApp());

  // myBanner
  //   // typically this happens well before the ad is shown
  //   ..load()
  //   ..show(
  //     // Positions the banner ad 60 pixels from the bottom of the screen
  //     anchorOffset: 0.0,
  //     // Positions the banner ad 10 pixels from the center of the screen to the right
  //     horizontalCenterOffset: 0.0,
  //     // Banner Position
  //     anchorType: AnchorType.bottom,
  //   );
  // myInterstitial
  //   ..load()
  //   ..show(
  //     anchorType: AnchorType.bottom,
  //     anchorOffset: 0.0,
  //     horizontalCenterOffset: 0.0,
  //   );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['flutterio', 'beautiful apps'],
  contentUrl: 'https://flutter.io',

  childDirected: false,
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: BannerAd.testAdUnitId,
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

InterstitialAd myInterstitial = InterstitialAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: InterstitialAd.testAdUnitId,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("InterstitialAd event is $event");
  },
);
