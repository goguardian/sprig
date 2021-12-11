import Cocoa
import FlutterMacOS

public class SprigMacosPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugins.flutter.io/userleap_flutter", binaryMessenger: registrar.messenger)
    let instance = SprigMacosPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    let method = call.method
        let arguments = call.arguments as? NSDictionary

        switch method {
           case "configure":
               if let env = arguments?["env"] as? String {
                   Sprig.shared.configure(withEnvironment: env)
                  result("Environment ID configured successfully")
               }
            case "setEmailAddress":
                if let email = arguments?["email"] as? String {
                          Sprig.shared.setEmailAddress(email)
                     result("Email sent to Userleap")
                }
            case "setVisitorAttribute":
            if let key = arguments?["key"] as? String {
                  if let value = arguments?["value"] as? String {
                   Sprig.shared.setVisitorAttribute(key: key, value: value)
                     result("Visitor attribute sent to Userleap")
                }

            }
            case "setUserIdentifier":
            if let userId = arguments?["userId"] as? String {
                      Sprig.shared.setUserIdentifier(userId)
                 result("User ID sent to Userleap")
            }
            case "track":
                if let event = arguments?["event"] as? String {
                Sprig.shared.track(eventName: event) { state in
                        switch state {
                            case .ready:
                                 result("READY")
                                let viewController: UIViewController =
                                (UIApplication.shared.delegate?.window??.rootViewController)!;
                                Sprig.shared.presentSurvey(from: viewController)
                        case .noSurvey:
                            result("NO_SURVEY")
                        case .disabled:
                            result("DISABLED")
                                break
                        @unknown default:
                           result("UNKNOWN")
                        }
                }
            }
             case "displaySurveyWithId":
                if let id = arguments?["id"] as? Int {
                      let viewController: UIViewController =
                                (UIApplication.shared.delegate?.window??.rootViewController)!;
                Sprig.shared.presentSurvey(withId: id, from: viewController)
            }
            case "presentDebugSurvey":
                let viewController: UIViewController =
                                          (UIApplication.shared.delegate?.window??.rootViewController)!;
                Sprig.shared.presentDebugSurvey(from: viewController)
            case "logout":
            Sprig.shared.logout()
             result("Logged out of Userleap")
            default:
            result(FlutterMethodNotImplemented)
        }

  }
}
