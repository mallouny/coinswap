import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            HStack {
                Button {
                    //
                } label: {
                    Text("BUY")
                        .font(type: .light, size: 22)
                        .foregroundStyle(.text)
                }
                Button {
                    //
                } label: {
                    Text("SELL")
                        .font(type: .light, size: 22)
                        .foregroundStyle(.text)
                }
            }
            .padding()
            Spacer()
            HStack {
                Text("COINSWAP")
                    .font(type: .medium, size: 22)
                    .foregroundStyle(.button)
            }
        }
        .padding(.top, 10)
        .padding(.horizontal, 35)
    }
}
