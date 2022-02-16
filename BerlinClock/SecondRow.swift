import SwiftUI

struct SecondRow: View {
    @Binding var secondArray: [Bool]
    
    var body: some View {
        Circle()
            .frame(height: 56)
            .foregroundColor(secondArray[0] ? ColorCustom.yellow_on : ColorCustom.yellow_off)
    }
}
