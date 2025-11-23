import SwiftUI

struct ConverterView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Header()
                CurrencySelector()
            }
        }
        .frame(maxWidth: .infinity)
        .background(.bg)
    }
}

#Preview {
    ConverterView()
}
