import UIKit
import Flutter
import Pigeon

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    private lazy var calculation = Calculation()
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "com.example.calculation", binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            switch call.method {
            case "calculate":
                let request = CalculationRequest(dictionary: call.arguments as! [String: Any])
                self?.calculation.calculate(request) { response in
                    result(response.toMap())
                }
            default:
                result(FlutterMethodNotImplemented)
            }
        } 
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
