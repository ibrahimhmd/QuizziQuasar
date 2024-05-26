

import Foundation
import SwiftUI


extension Text {
    
    func eliteTitle() -> some  View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundStyle(Color("AccentColor"))
    }
}
