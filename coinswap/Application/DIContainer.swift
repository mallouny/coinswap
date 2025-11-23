final class DIContainer {
    let ratesService: RatesService

    init(ratesService: RatesService) {
        let apiClient = APIClient(apiKey: "COINMARKETCAP_API_KEY")
        self.ratesService = APIRatesService(client: apiClient)
    }
}
