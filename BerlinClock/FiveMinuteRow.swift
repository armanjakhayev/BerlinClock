import SwiftUI

struct FiveMinuteRow: View {
    @Binding var fiveMinuteArray: [Bool]
    var numberOfRectangles = 11
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach (0..<numberOfRectangles) { num in
                if num % 3 == 2 {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(fiveMinuteArray[num] ? ColorCustom.red_on : ColorCustom.red_off)
                        .frame(height: 32)
                } else {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(fiveMinuteArray[num] ? ColorCustom.yellow_on : ColorCustom.yellow_off)
                        .frame(height: 32)
                }
            }
        }
    }
}
