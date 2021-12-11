# Sprig

[![pub package](https://img.shields.io/badge/Pub-0.3.0-green.svg)](https://pub.dartlang.org/packages/sprig)

## A fork of UserleapFlutter

A Flutter plugin integrating the official android and ios SDK for Sprig Survey Platform

## Usage

Import `package:sprig/sprig.dart` and use the methods in `Sprig` class.

Example:
```dart
import 'package:sprig/sprig.dart';

void main() async {
    Sprig.configure('ENVIRONMENT_ID');
    runApp(App());
}

class App extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Center(
            child: FlatButton(
                onPressed: () {
                Sprig.presentDebugSurvey()
                .then((value) => print(value));
            },
            child: Text('Present Debug Survey'),
        ));
    }
}

```


See Sprig Android and iOS package documentation for more information.
[`USerleap docs`](https://docs.userleap.com/installation/)


Sprig requires a Fragment Activity for the android implementation to work, im your MainActivity.kt, you can change FlutterActivity to FlutterFragmentActivity.

```
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterFragmentActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }

}

```

Add Java 8 support to your project (if not added already)
``` 
android {
    ...
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
    // For Kotlin projects
    kotlinOptions {
        jvmTarget = "1.8"
    }
}
```

## Web support
Add this script in your index.html. Make sure it is above the main.dart.js import.
```
<script type="text/javascript">
  (function(l,e,a,p) {
    if (window.Sprig) return;
    window.Sprig = function(){S._queue.push(arguments)}
    var S = window.Sprig;S.appId = a;S._queue = [];window.UserLeap=S;
    a=l.createElement('script');
    a.async=1;a.src=e+'?id='+S.appId;
    p=l.getElementsByTagName('script')[0];
    p.parentNode.insertBefore(a, p);
  })(document, 'https://cdn.sprig.com/shim.js', 'ENVIRONMENT_ID');
</script>
```
Remember to replace ENVIRONMENT_ID with your ID.

checkout the example project for full implementation

## Desktop support

The official libraries do not support any desktop platforms.
The iOS library is not supported on macOS.


