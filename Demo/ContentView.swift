import SwiftUI

struct AppView: View {
    @StateObject
    var viewModel: ViewModel = .init()

    var body: some View {
        NavigationView {
            ContentView(level: 0)
                .environmentObject(viewModel)
        }
        .navigationViewStyle(.stack)
    }
}


struct ContentView: View {
    @EnvironmentObject
    var viewModel: ViewModel

    var level: Int

    var body: some View {
        List {
            NavigationLink(
                destination: ContentView(level: level + 1)
                    .environmentObject(viewModel),
                isActive: $viewModel.state.isActives[level],
                label: {
                    Text("Navigate")
                }
            )
        }
    }
}

/// Behaves as Single-Source-of-Truth, passed as `EnvironmentObject`.
class ViewModel: ObservableObject {
    @Published
    var state: State = .init()

    struct State {
        /// Array of `isActive` flags for each navigation stack (centralized management as single-source-of-truth).
        var isActives: [Bool] = [Bool](repeating: false, count: 5) {
            didSet {
                print("===>", isActives)
            }
        }
    }
}
