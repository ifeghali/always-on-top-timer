import SwiftUI

@main
struct AlwaysOnTopTimerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            TimerView()
        }.windowStyle(HiddenTitleBarWindowStyle())
    }
}
