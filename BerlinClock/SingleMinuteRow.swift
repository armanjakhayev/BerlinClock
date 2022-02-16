import SwiftUI

struct SingleMinuteRow: View {
    @Binding var singleMinuteArray: [Bool]
    var numberOfRectangles = 4
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<numberOfRectangles) { num in
                RoundedRectangle(cornerRadius: 4)
                    .fill(singleMinuteArray[num] ? ColorCustom.yellow_on : ColorCustom.yellow_off)
                    .frame(height: 32)
            }
        }
    }
}
