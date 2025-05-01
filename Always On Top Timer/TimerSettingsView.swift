import SwiftUI

struct TimerSettingsView: View {
    @Binding var initialTime: Int
    @State private var inputMinutes: String = ""
    var applyAction: () -> Void

    var body: some View {
        VStack(spacing: 15) {
            Text("Set Timer (minutes)")
                .font(.headline)

            TextField("Minutes", text: $inputMinutes)
                .frame(width: 100)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
// error!
//                .keyboardType(.numberPad)

            Button("Apply") {
                if let minutes = Int(inputMinutes), minutes > 0 {
                    initialTime = minutes * 60
                    applyAction()
                }
            }

            Button("Cancel") {
                applyAction() // close without applying
            }
        }
        .padding()
        .frame(width: 200)
    }
}
