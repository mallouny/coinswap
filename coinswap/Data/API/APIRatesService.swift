import Foundation

enum RatesServiceError: Error {
    case quoteNotFound
}

final class APIRatesService: RatesService {
    private let client: APIClient

    init(client: APIClient) {
        self.client = client
    }

    func fetchPrice(from: Asset, to: Asset) async throws -> Rate {
        // query
        let queryItems = [
            URLQueryItem(name: "symbol", value: from.code),
            URLQueryItem(name: "convert", value: to.code)
        ]

        // request to API

        let data = try await client.get(
            path: "/v1/cryptocurrency/quotes/latest",
            queryItems: queryItems
        )

        // decoding

        let decoder = JSONDecoder()
        let dto = try decoder.decode(QuotesLatestResponseDTO.self, from: data)

        // search pair
        guard
            let cryptoEntry = dto.data[from.code],
            let quote = cryptoEntry.quote[to.code]
        else {
            throw RatesServiceError.quoteNotFound
        }

        return Rate(
            from: from,
            to: to,
            value: Decimal(quote.price),
            timestamp: Date()
        )
    }
}
