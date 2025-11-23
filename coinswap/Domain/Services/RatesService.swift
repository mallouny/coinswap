import Foundation

protocol RatesService {
    func fetchPrice(
        from: Asset,
        to: Asset
    ) async throws -> Rate
}
