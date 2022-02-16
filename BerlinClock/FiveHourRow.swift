import SwiftUI

struct FiveHourRow: View {
    @Binding var fiveHourArray: [Bool]
    var numberOfRectangles = 4
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<numberOfRectangles) { num in
                RoundedRectangle(cornerRadius: 4)
                    .fill(fiveHourArray[num] ? ColorCustom.red_on : ColorCustom.red_off)
                    .frame(height: 32)
            }
        }
    }
}
