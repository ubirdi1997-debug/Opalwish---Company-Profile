# Flutter specific rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Keep url_launcher
-keep class androidx.browser.** { *; }

# Suppress warnings for Play Core (not used in this offline app)
-dontwarn com.google.android.play.core.**
