import Foundation

protocol ConversionService {
    func convert(amount: Decimal, using rate: Rate) -> Decimal
}

final class DefaultConversionService: ConversionService {
    func convert(amount: Decimal, using rate: Rate) -> Decimal {
        return amount * rate.value
    }
}
