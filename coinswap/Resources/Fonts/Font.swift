import Foundation
import SwiftUI

enum GTmono: String {
    case light = "GTAmericaMonoUprightLCGVVF-Rg_Light"
    case medium = "GTAmericaMonoUprightLCGVVF-Rg_Medium"
    case bold = "GTAmericaMonoUprightLCGVVF-Rg_Bold"
}

extension View {
    func font(type: GTmono, size: CGFloat = 16) -> some View {
        self
            .font(Font.custom(type.rawValue, size: size))
    }
}
