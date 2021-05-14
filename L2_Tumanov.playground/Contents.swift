import Foundation

//extension Optional where Wrapped == Int {
extension Int {
    
    // 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
    func isFullyDevided(by number: Int = 2) -> Bool {
//        guard let self = self else { return false }
        self % number == .zero
    }
    
    func isFullyDevided<T: BinaryFloatingPoint>(by number: T) -> Bool {
        guard let devider = Int(exactly: number) else { return false }
        return self % devider == .zero
    }
    
    // 1. Написать функцию, которая определяет, четное число или нет.
    func isEven() -> Bool {
        isFullyDevided()
    }
}

// 3. Создать возрастающий массив из 100 чисел.
var array = [Int]()
for i in 0..<100 {
    array.append(i)
}

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
array.removeAll(where: { $0.isEven() || $0.isFullyDevided(by: 3) })

// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
extension Array where Element == Int {
    
    func element(at index: Int) -> Element? {
        guard 0..<count ~= index else { return nil }
        return self[index]
    }
    
    mutating func appendNextFibonachi(till: Int) {
        guard till > .zero,
              let last = last,
              let beforeLast = element(at: index(before: count - 1))
        else { return }
        let additionResult = last.addingReportingOverflow(beforeLast)
        guard !additionResult.overflow else { return }
        append(additionResult.partialValue)
        appendNextFibonachi(till: till - 1)
    }
    
    func isFibonachiPossible() -> Bool {
        /*
        //FIXME: add negative numbers handle
        does not operate with negative numbers
         */
        guard !isEmpty, count != 1 else { return false }
        for index in 0..<count where index != count - 1 {
            guard let firstElement = element(at: index),
                  let secondElement = element(at: index + 1),
                  firstElement <= secondElement,
                  secondElement != 0
                  else { return false }
            let sum = firstElement + secondElement
            if sum != element(at: index + 2) ?? sum { return false }
        }
        return true
    }
}
/*
//невалидные массивы
[0,0].isFibonachiPossible()
[12,2].isFibonachiPossible()
[0,1,3].isFibonachiPossible()
[10,20,30,50,70].isFibonachiPossible()
//валидные массивы
[0,1].isFibonachiPossible()
[12, 30, 42].isFibonachiPossible()
*/

var arrayFibo = [0, 1, 1]
if arrayFibo.isFibonachiPossible() {
    arrayFibo.appendNextFibonachi(till: 5000)
}

print(arrayFibo)
print(arrayFibo.count)

// 6. * Заполнить массив из 100 элементов различными простыми числами.
extension Int {
    /*
    Решение без учета эффективности алгоритма
    Проблема: слишком много операций(на 100 элементов 1232 операции проверки)
     */
    func isPrime() -> Bool {
        return self > 1 && !(2..<self).contains { self % $0 == 0 }
    }
}

array.removeAll(where: {!$0.isPrime()})
print(array)

extension Int {

    /*
    Существенно более эффективный алгоритм
    Но надо делать допущение:
    Пройтись по всем числам от 2 до 9 включительно, и определить какие из них простые
    Все числа, кратные 2 - не простые
    Все числа, кратные 3 - не простые
    Все числа, кратные 5 - не простые
    Все числа, кратные 7 - не простые
    Тем самым мы опрееделили базу для дальнейшего расчета, теперь чтобы отпределить простое число или нет,
     достаточно максимум 4 операций проверки на деление без остатка
     */
    func isSimple() -> Bool {
        let oneSingDigits = [2, 3, 5, 7]
        let number = Int(self / 10)
        if number == 0 {
            return oneSingDigits.contains(self)
        } else {
            for i in oneSingDigits.enumerated() {
                if !isFullyDevided(by: i.element) { return true }
            }
            return false
        }
    }
}

//array.removeAll(where: { !$0.isSimple() })
array.allSatisfy { $0.isSimple() }
print(array)

