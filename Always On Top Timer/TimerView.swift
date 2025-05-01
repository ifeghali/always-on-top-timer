import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 60
    @State private var timerRunning = false
    @State private var showSettings = false
    @State private var initialTime = 60

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 10) {
            Text(timeString(from: timeRemaining))
                .font(.largeTitle)
                .padding()

            HStack {
                Button(timerRunning ? "Pause" : "Start") {
                    timerRunning.toggle()
                }
                Button("Reset") {
                    timeRemaining = initialTime
                    timerRunning = false
                }
            }

            Button("Set Time") {
                showSettings = true
            }
        }
        .frame(width: 220, height: 180)
        .background(Color.white.opacity(0.95))
        .cornerRadius(12)
        .shadow(radius: 10)
        .padding()
        .onReceive(timer) { _ in
            if timerRunning && timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .sheet(isPresented: $showSettings) {
            TimerSettingsView(initialTime: $initialTime, applyAction: {
                timeRemaining = initialTime
                showSettings = false
            })
        }
    }

    func timeString(from seconds: Int) -> String {
        String(format: "%02d:%02d", seconds / 60, seconds % 60)
    }
}
