import Foundation
import Flutter

class Calculation: NSObject, CalculationApi {
    
    func calculate(_ request: CalculationRequest, completion: @escaping (CalculationResult) -> Void) {
        let sum = request.a + request.b
        let result = CalculationResult(sum: sum)
        completion(result)
    }
    
}