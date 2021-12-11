import 'dart:async';

// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:sprig_platform_interface/sprig_platform_interface.dart';

import 'sprig_js_bindings.dart' as sprig;

/// A web implementation of the UserleapFlutterWeb plugin.
class SprigWeb extends SprigPlatform {
  static void registerWith(Registrar registrar) {
    SprigPlatform.instance = SprigWeb();
  }

  bool _isPluginInitialized = false;

  @override
  Future configure(String environmentId) async {
    _isPluginInitialized = true;
    return "configure";
  }

  @override
  Future displaySurveyWithId(int id) async {
    sprig.displaySurvey("$id");
    return "displaySurvey";
  }

  @override
  bool get isPluginInitialized => _isPluginInitialized;

  @override
  Future logout() async {
    sprig.logoutUser();
    return "logoutUser";
  }

  @override
  Future presentDebugSurvey() async {
    track("1");
    return "presentDebugSurvey";
  }

  @override
  Future setEmailAddress(String email) async {
    sprig.setEmail(email);
    return "Set email";
  }

  @override
  Future setUserIdentifier(String userId) async {
    sprig.setUserId(userId);
    return "setUserId";
  }

  @override
  Future setVisitorAttribute(String key, String value) async {
    sprig.setAttribute(key, value);
    return "setAttribute";
  }

  @override
  Future<SurveryStatus> track(String event) async {
    sprig.track(event);
    return SurveryStatus.ready;
  }
}
