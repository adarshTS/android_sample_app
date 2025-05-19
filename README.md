# android_sample_app


A simple Flutter Android app with:

- HomePage (logo, button to view products)
- Products Page (mobile phones, add to cart, cart icon)
- Cart Page (view/remove products, checkout)
- Checkout Page (order confirmation)

## How to build and run

1. Make sure you have [Flutter installed](https://docs.flutter.dev/get-started/install) and an Android device/emulator ready.
2. In the project directory, run:

```sh
flutter pub get
flutter run
```

To build an APK file:

```sh
flutter build apk --release
```

The APK will be generated at:

```
build/app/outputs/flutter-apk/app-release.apk
```

You can then install this APK on your Android device.
