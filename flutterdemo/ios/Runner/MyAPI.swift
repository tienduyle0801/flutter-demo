//
//  MyAPI.swift
//  Runner
//
//  Created by vfa on 3/29/23.
//

import Foundation
import SystemConfiguration.CaptiveNetwork

public class MyAPI: MemoryApi {
    
    func getMemoryInfo() -> MemoryResult {
        return MemoryResult(1.76)
    }
    

    private func getWiFiList() -> Array<String> {
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
}
