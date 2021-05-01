import Foundation

let cathetus: Double? = 2
let cathetus2: Double? = 3

func findMeasurements(cathetus: Double? = cathetus, cathetus2: Double? = cathetus2) {
    if let cathetus = cathetus, let cathetus2 = cathetus2 {
        let square = findSquare(cathetus, cathetus2)
        print("Площадь прямоугольного треугольника со сторонами \(cathetus) и \(cathetus2) равна \(square)")
        let perimeter = findPerimeter(cathetus, cathetus2)
        print("Периметр прямоугольного треугольника равен \(perimeter)")
        let hypotenuse = findHypotenuse(cathetus, cathetus2)
        print("Гипотенуза треугольника равно \(hypotenuse)")
    } else {
        print("Невозможно произвести вычисления, введите корректные данные")
    }
}

private func findSquare(_ cathetus: Double, _ cathetus2: Double) -> Double {
    cathetus * cathetus2 / 2
}

private func findPerimeter(_ cathetus: Double, _ cathetus2: Double) -> Double {
    sqrt(pow(cathetus, 2) + pow(cathetus2, 2)) + cathetus + cathetus2
}

private func findHypotenuse(_ cathetus: Double, _ cathetus2: Double) -> Double {
    sqrt(pow(cathetus, 2) + pow(cathetus2, 2))
}

findMeasurements()
