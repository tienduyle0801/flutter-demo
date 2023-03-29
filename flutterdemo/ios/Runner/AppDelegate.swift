import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller: FlutterViewController = wind
    GeneratedPluginRegistrant.register(with: self)
      
    MemoryApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: MyAPI())
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
