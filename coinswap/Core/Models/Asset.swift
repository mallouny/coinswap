import Foundation

enum AssetKind {
    case fiat
    case crypto
}

struct Asset: Identifiable, Hashable {
    let id: String
    let code: String
    let name: String
    let kind: AssetKind
    let decimals: Int

    init(code: String, name: String, kind: AssetKind, decimals: Int) {
        self.id = code
        self.code = code
        self.name = name
        self.kind = kind
        self.decimals = decimals
    }
}
