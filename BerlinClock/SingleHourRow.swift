import SwiftUI

struct SingleHourRow: View {
    @Binding var singleHourArray: [Bool]
    var numberOfRectangles = 4

    var body: some View {
        HStack(spacing: 10) {
            ForEach (0..<numberOfRectangles) { num in
                RoundedRectangle(cornerRadius: 4)
                    .fill(singleHourArray[num] ? ColorCustom.red_on : ColorCustom.red_off)
                    .frame(height: 32)
            }
        }
    }
}
