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
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)


  }
}

import SystemConfiguration.CaptiveNetwork

func getWiFiList() -> Array<String> {
    var wifiList = Array<String>()
    if let interfaceNames = CNCopySupportedInterfaces() as NSArray? {
        for interfaceName in interfaceNames {
            if let interfaceInfo = CNCopyCurrentNetworkInfo(interfaceName as! CFString) as NSDictionary? {
                let ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String ?? ""
                wifiList.append(ssid)
            }
        }
    }
    return wifiList
}

