@JS("Sprig")
library userleap;

import 'package:js/js.dart';

@JS('configure')
external void configure(String enviromentID);

@JS('track')
external void track(String event);

@JS('setUserId')
external void setUserId(String userId);

@JS('setEmail')
external void setEmail(String userId);

@JS('setAttribute')
external void setAttribute([dynamic? key, dynamic? value]);

@JS('removeAttributes')
external void removeAttributes([dynamic? key, dynamic? value]);

@JS('setAttributes')
external void setAttributes(Object attributes);

@JS('logoutUser')
external void logoutUser();

@JS('displaySurvey')
external void displaySurvey(String id);
