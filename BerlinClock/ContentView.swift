import SwiftUI

struct ContentView: View {
    @State var date: Date = Date()
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    @State var fiveHoursArray: [Bool] = Array(repeating: false, count: 4)
    @State var singleHoursArray: [Bool] = Array(repeating: false, count: 4)
    @State var fiveMinutesArray: [Bool] = Array(repeating: false, count: 11)
    @State var singleMinutesArray: [Bool] = Array(repeating: false, count: 4)
    @State var secondsArray: [Bool] = Array(repeating: false, count: 1)

    func getTime() {
        let calendar = Calendar.current
        self.hours = calendar.component(.hour, from: date)
        self.minutes = calendar.component(.minute, from: date)
        self.seconds = calendar.component(.second, from: date)
        self.fiveHoursArray = TimeConverter.getFiveHours(self.hours)
        self.singleHoursArray = TimeConverter.getSingleHours(self.hours)
        self.fiveMinutesArray = TimeConverter.getFiveMinutes(self.minutes)
        self.singleMinutesArray = TimeConverter.getSingleMinutes(self.minutes)
        self.secondsArray = TimeConverter.getSingleSeconds(self.seconds)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 242/255, green: 242/255, blue: 238/255)
                    .edgesIgnoringSafeArea(.all)
                VStack (spacing: 10) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.white)
                        VStack (spacing:0) {
                            SecondRow(secondArray: $secondsArray)
                                .padding(.top, 32)
                            FiveHourRow(fiveHourArray: $fiveHoursArray)
                            .padding(.top)
                            SingleHourRow(singleHourArray: $singleHoursArray)
                            .padding(.top)
                            FiveMinuteRow(fiveMinuteArray: $fiveMinutesArray)
                            .padding(.top)
                            SingleMinuteRow(singleMinuteArray: $singleMinutesArray)
                            .padding(.top)
                            Spacer()
                            
                        }
                        .padding(.horizontal)
                            
                    }
                    .frame(height: 312)
                    .padding(.top, 10)
                    
                    TimePickerView(date: $date)
                    Spacer()
                }
                .padding(.horizontal)
            }
            .onAppear(perform: {
                getTime()
            })
            
            .onChange(of: self.date, perform: { newValue in
                getTime()
            })
            
            .navigationTitle("Time is \(String(format: "%02d:%02d:%02d", hours, minutes, seconds))")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TimePickerView: View {
    @Binding var date: Date
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
            HStack (spacing: 0) {
                Text("Insert time")
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                DatePicker("", selection: $date, displayedComponents: .hourAndMinute)
                    .environment(\.locale, Locale(identifier: "ru_RU"))
            }
            .padding(.horizontal)
        }
        .frame(height: 54)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
