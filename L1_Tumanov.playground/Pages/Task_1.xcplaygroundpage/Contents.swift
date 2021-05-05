import Foundation

/*
private enum Result {
    case noValues
    case values(Double, Double?)
}

private func printDescription(_ result: Result) {
    switch result {
    case .noValues:
        print("Уравнение не имеет корней")
    case .values(let x1, let x2?):
        print("Уравнение имеет два корня -> x1 = \(x1), x2 = \(x2)")
    case .values(let x1, nil):
        print("Уравнение имеет единственный корень -> x1 = x2 = \(x1)")

    }
}

private func findSolution(_ a: Double, _ b: Double, _ c: Double) -> Result {
    let discriminant = findDiscriminant(a, b, c)

    if discriminant < .zero {
        return .noValues
    } else if discriminant == .zero {
        let result = -(b / (2 * a))
        return .values(result, nil)
    } else {
        let x1 = (-b + sqrt(discriminant)) / (2 * a)
        let x2 = (-b - sqrt(discriminant)) / (2 * a)
        return .values(x1, x2)
    }
}

private func findDiscriminant(_ a: Double, _ b: Double, _ c: Double) -> Double {
    pow(b, 2) - 4 * a * c
}

func quadraticEquationSolver(a: Double?, b: Double?, c: Double?) {
    guard let aUnwrapped = a, aUnwrapped != 0 else {
        printDescription(.noValues)
        return
    }
    let bUnwrapped = b ?? 0
    let cUnwrapped = c ?? 0

    let result = findSolution(aUnwrapped, bUnwrapped, cUnwrapped)

    printDescription(result)

}
*/
 
///////////////////////////////////////////////////////////
// MARK: - Вариант только с тем, что было пройдено на уроке
///////////////////////////////////////////////////////////

let a: Double? = nil
let b: Double? = nil
let c: Double? = nil

func quadraticEquationSolver(a: Double? = a, b: Double? = b, c: Double? = c) {
    if let aUnwrapped = a, aUnwrapped != 0 {
        let bUnwrapped = b ?? 0
        let cUnwrappedd = c ?? 0
        
        let discriminant = pow(bUnwrapped, 2) - 4 * aUnwrapped * cUnwrappedd
        
        if discriminant < 0 {
            print("Уравнение не имеет корней")
        } else if discriminant == 0 {
            let x1 = -(bUnwrapped / (2 * aUnwrapped))
            print("Уравнение имеет единственный корень -> x1 = x2 = \(x1)")
        } else {
            let x1 = (-bUnwrapped + sqrt(discriminant)) / (2 * aUnwrapped)
            let x2 = (-bUnwrapped - sqrt(discriminant)) / (2 * aUnwrapped)
            print("Уравнение имеет два корня -> x1 = \(x1), x2 = \(x2)")
        }
    } else {
        print("Уравнение не имеет корней")
    }
}

quadraticEquationSolver(a: 1, b: 3, c: 1)
quadraticEquationSolver()
