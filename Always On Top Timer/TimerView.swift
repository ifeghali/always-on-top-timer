import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 60 // 1 minute
    @State private var timerRunning = false
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
                    timeRemaining = 60
                    timerRunning = false
                }
            }
        }
        .frame(width: 200, height: 150)
        .background(Color.white.opacity(0.9))
        .cornerRadius(12)
        .shadow(radius: 10)
        .padding()
        .onReceive(timer) { _ in
            if timerRunning && timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
    }

    func timeString(from seconds: Int) -> String {
        String(format: "%02d:%02d", seconds / 60, seconds % 60)
    }
}
