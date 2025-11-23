import SwiftUI

@main
struct coinswapApp: App {
//    private let container = DIContainer()

    var body: some Scene {
        WindowGroup {
//            ConverterView(ratesService: container.ratesService)
            ConverterView()
        }
    }
}
