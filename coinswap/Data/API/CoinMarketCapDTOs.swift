import Foundation

struct QuotesLatestResponseDTO: Decodable {
    let data: [String: CryptoEntryDTO]
}

struct CryptoEntryDTO: Decodable {
    let symbol: String
    let quote: [String: QuoteCurrencyDTO]
}

struct QuoteCurrencyDTO: Decodable {
    let price: Double
}
