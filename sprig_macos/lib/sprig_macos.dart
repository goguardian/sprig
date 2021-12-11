

import 'package:sprig_platform_interface/sprig_platform_interface.dart';

class SprigMacosPlugin {
    static bool get isPluginInitialized =>
      SprigPlatform.instance.isPluginInitialized;

// initialize SDK with your environment id, this must be done befor calling any other methods
// Note: configure will only accept 1 environment id, calling it multiple times
// with different IDs will have no effect.
  static Future configure(String environmentId) =>
      SprigPlatform.instance.configure(environmentId);

  ///  verify you’ve set up the installation and environment ID
  static Future presentDebugSurvey() =>
      SprigPlatform.instance.presentDebugSurvey();

  /// Set the userId after configuring if they are already logged in or after the user logs in to your app:
  /// This user identifier is stored locally and this method can be called multiple times safely.
  /// We recommend you set the user identifier every time you configure UserLeap and anytime your
  /// customers login to be safe
  /// UserLeap allows you to identify visitors by supplying a userId.
  ///  While tracking userIds is optional,  it helps to provide a consistent
  ///  experience across platforms and prevents users from seeing the same
  /// survey multiple times
  static Future setUserIdentifier(String userId) =>
      SprigPlatform.instance.setUserIdentifier(userId);

  /// Set the user email after configuring if they are already logged in or after the user logs in to your app
  static Future setEmailAddress(String email) =>
      SprigPlatform.instance.setEmailAddress(email);

  /// display a survey using the survey id, this method is currently only available on IOS
  static Future displaySurveyWithId(int id) =>
      SprigPlatform.instance.displaySurveyWithId(id);

  /// There are various other properties you may want to set.
  /// These properties are surfaced as survey targeting options
  ///  in the UserLeap dashboard and allow you to send surveys to
  /// the right user segments.
  static Future setVisitorAttribute(String key, String value) =>
      SprigPlatform.instance.setVisitorAttribute(key, value);

  /// When a user logs out of your app, make sure to log out of Userleap. This will prevent new activity
  /// being associated with the wrong user.
  static Future logout() => SprigPlatform.instance.logout();

  /// track a specific event defined on your dashboard
  static Future<SurveryStatus> track(String event) =>
      SprigPlatform.instance.track(event);
}