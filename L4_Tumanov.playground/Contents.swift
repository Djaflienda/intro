import UIKit

class Car {
    
    let brand: Brand
    private(set) var windowState: WindowState
    private(set) var engineState: EngineState
    
    init() {
        self.brand = .other("Безымянная машина")
        self.windowState = .closed
        self.engineState = .off
    }
    
    init(_ brand: Brand) {
        self.brand = brand
        self.windowState = .closed
        self.engineState = .off
    }
    
    init(_ brand: Brand, _ windowState: WindowState, _ engineState: EngineState) {
        self.brand = brand
        self.windowState = windowState
        self.engineState = engineState
    }
    
    func startEngine() {
        self.engineState = .on
    }
    
    func openWindows() {
        self.windowState = .opened
    }
    
    final func fillWithFuel() {
        engineState = .off
        print("Заправляем машину")
    }
}

extension Car {
    
    enum Brand: CustomStringConvertible {
        case audi
        case honda
        case other(String)
        
        //BENEFITS OF USING CustomStringConvertible over String rawValue???
        var description: String {
            switch self {
            case .audi:
                return "Автомобиль марки Ауди"
            case .honda:
                return "Автомобиль марки Хонда"
            case .other(let brand):
                return "Автомобиль марки \(brand)"
            }
        }
    }
    
    enum WindowState: String {
        case opened = "Окна автомобиля открыты"
        case closed = "Окна автомобиля закрыты"
    }
    
    enum EngineState: String {
        case on = "Двигатель запущен"
        case off = "Двигатель не запущен"
    }
}

final class SportCar: Car {
    
    private(set) var stageLevel: StageLevel
    
    override init() {
        self.stageLevel = .none
        super.init()
    }
    
    init(_ brand: Brand, _ stageLevel: StageLevel) {
        self.stageLevel = stageLevel
        super.init(brand)
    }
    
    override func startEngine() {
        prepareForEgnition()
        super.startEngine()
    }
    
    override func openWindows() {
        print("На спортивной машине невозможно открыть окна")
    }
    
    func upgradeTo(_ stageLevel: StageLevel) {
        guard self.stageLevel.rawValue < stageLevel.rawValue else { return }
        self.stageLevel = stageLevel
    }
    
    private func prepareForEgnition() {
        print("Подготовительные работы перед запуском двигателя")
    }
}

extension SportCar {
    
    enum StageLevel: Int {
        case none, stage1, stage2, state2plus
    }
}

final class TrunkCar: Car {
    
    private(set) var trunkState: TrunkState
    
    override init() {
        trunkState = .empty
        super.init()
    }
    
    init(_ trunkState: TrunkState) {
        self.trunkState = trunkState
        super.init()
    }
    
    init(_ brand: Brand, _ trunkState: TrunkState) {
        self.trunkState = trunkState
        super.init(brand)
    }
    
    override func openWindows() {
        print("Покрутили ручку")
        super.openWindows()
    }
    
    func changeTrunkState(to trunkState: TrunkState) {
        self.trunkState = trunkState
    }
}

extension TrunkCar {
    
    enum TrunkState: CustomStringConvertible {
        case filled(Double)
        case empty
        
        var description: String {
            switch self {
            case .empty:
                return "Багажник пуст"
            case .filled(let volume):
                return "Багажник заполнен на \(volume)"
            }
        }
    }
}

//let sportCar = SportCar(.audi, .stage2)
//print(sportCar.stageLevel)
//print(sportCar.brand)
//sportCar.upgradeTo(.stage1)
//print(sportCar.stageLevel)

//let trunkCar = TrunkCar(.other("Dav"), .filled(120))
//print(trunkCar.brand)
//print(trunkCar.trunkState)
//trunkCar.changeTrunkState(to: .empty)
//print(trunkCar.trunkState)

//let car = Car()
//car.startEngine()
//print(car.engineState)

let sportCar = SportCar()
//sportillWithFuel()Car.startEngine()
//print(sportCar.engineState)
//sportCar.f
sportCar.openWindows()
print(sportCar.windowState)
