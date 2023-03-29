import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller: FlutterViewController = window?.rootViewController as!FlutterViewController
      SumApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api:   MyAPI())
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
}

public class MyAPI: SumApi {
    func sum(request: SumRequest) throws -> SumReply? {
        let num1 = request.a ?? 0
        let num2 = request.b ?? 0
        let result = num1 + num2
        return  SumReply(result: Int64(result))
    }
        public func calculateSum(num1: Int, num2: Int, completion: @escaping (Int32) -> Void) {
                let result = num1 + num2
                completion(Int32(result))
        }
}
