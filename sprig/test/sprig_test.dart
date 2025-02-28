import 'package:flutter_test/flutter_test.dart';
import 'package:sprig/sprig.dart';
import 'package:sprig_platform_interface/sprig_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum SurveryStatus {
  COMPLETED,
  DISMISSED,
  NOT_STARTED,
  STARTED,
  UNKNOWN,
}

class MockSprigPlatform extends MockPlatform implements SprigPlatform {
  @override
  bool get isPluginInitialized => true;

  @override
  Future<bool> configure(String environmentId) async => true;

  @override
  Future<bool> presentDebugSurvey() async => true;

  @override
  Future<bool> setUserIdentifier(String userId) async => true;

  @override
  Future<bool> setEmailAddress(String email) async => true;

  @override
  Future<bool> displaySurveyWithId(int id) async => true;

  @override
  Future<bool> setVisitorAttribute(String key, String value) async => true;

  @override
  Future<bool> logout() async => true;

  @override
  Future<SurveryStatus> track(String event) async => SurveryStatus.COMPLETED;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final mockSprigPlatform = MockSprigPlatform();
  SprigPlatform.instance = mockSprigPlatform;

  test('configure', () async {
    final result = await Sprig.configure('test_environment_id');
    expect(result, isA<bool>());
  });

  test('presentDebugSurvey', () async {
    final result = await Sprig.presentDebugSurvey();
    expect(result, isA<bool>());
  });

  test('setUserIdentifier', () async {
    final result = await Sprig.setUserIdentifier('test_user_id');
    expect(result, isA<bool>());
  });

  test('setEmailAddress', () async {
    final result = await Sprig.setEmailAddress('test@example.com');
    expect(result, isA<bool>());
  });

  test('displaySurveyWithId', () async {
    final result = await Sprig.displaySurveyWithId(123);
    expect(result, isA<bool>());
  });

  test('setVisitorAttribute', () async {
    final result = await Sprig.setVisitorAttribute('key', 'value');
    expect(result, isA<bool>());
  });

  test('logout', () async {
    final result = await Sprig.logout();
    expect(result, isA<bool>());
  });

  test('track', () async {
    final result = await Sprig.track('test_event');
    expect(result, isA<SurveryStatus>());
  });
}
