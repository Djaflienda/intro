import Foundation

let depositAmount: Double? = 1_400_000
let depositRate: Double? = 7.2
let capitalization = true

func findInvestmentAmount(for deposit: Double? = depositAmount,
                          with rate: Double? = depositRate,
                          capitalization: Bool = capitalization) {
    guard let deposit = deposit, let rate = rate else {
        print("Невозможно произвести расчет доходности. Введите корректные данные")
        return
    }
    var result: Double
    switch capitalization {
    case true:
        result = Double(round(100 * (deposit * pow((1 + (rate / 100)), 5))) / 100)
    case false:
        result = deposit * (1 + 5 * rate / 100)
    }
    print("После 5 лет депозит увеличится на \(result - deposit)\nСумма составит: \(result)")
}

findInvestmentAmount()
