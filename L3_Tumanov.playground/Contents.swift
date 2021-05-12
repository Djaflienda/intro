import UIKit

enum WindowState: String {
    case opened = "Windows are opened"
    case closed = "Windows are closed"
    
    func printDescription() {
        print(rawValue)
    }
}

protocol WindowEquippable {
    var windowState: WindowState { get set }
    
    mutating func changeWindow(state: WindowState)
}

extension WindowEquippable {
    mutating func changeWindow(state: WindowState) {
        self.windowState = state
    }
}

enum EgnitionState: String {
    case on = "Engine is turned on"
    case off = "Engine is turned off"
    
    func printDescriptin() {
        print(rawValue)
    }
}

protocol Egnitionable {
    var egnitionState: EgnitionState { get set }
    
    mutating func turn(egnitionState: EgnitionState)
}

extension Egnitionable {
    mutating func turn(egnitionState: EgnitionState) {
        self.egnitionState = egnitionState
    }
}

enum FilledVolume {
    case filled(_ volume: Double)
    case empty
    
    func printDescription() {
        switch self {
        case .empty:
            print("Trunk is not filled. It's empty")
        case .filled(let volume):
            print("Trunk is filled with \(volume) kilos")
        }
    }
}

protocol TrunkFillable {
    var trunkVolume: Double { get }
    var trunkFilledVolume: FilledVolume { get set }
    
    mutating func fillTrunk(with kilos: Double)
}

extension TrunkFillable {
    mutating func fillTrunk(with kilos: Double) {
        guard kilos <= trunkVolume else { return }
        switch kilos {
        case ...0:
            self.trunkFilledVolume = .empty
        default:
            self.trunkFilledVolume = .filled(kilos)
        }
    }
}

protocol Branded {
    var brand: String { get }
    var productionYear: Int { get }
}

protocol SportCarProtocol: Branded, Egnitionable, WindowEquippable { }

struct SportCar: SportCarProtocol {
    let brand: String
    let productionYear: Int
    var egnitionState: EgnitionState {
        didSet { egnitionState.printDescriptin() }
    }
    var windowState: WindowState {
        didSet { windowState.printDescription() }
    }
    
    init(brand: String, productionYear: Int) {
        self.brand = brand
        self.productionYear = productionYear
        self.egnitionState = .off
        self.windowState = .closed
    }
}

var audi = SportCar(brand: "Audi", productionYear: 2019)
audi.turn(egnitionState: .on)
audi.changeWindow(state: .opened)
print(audi)

protocol TruckCarProtocol: Branded, Egnitionable, TrunkFillable, WindowEquippable { }

struct TruсkCar: TruckCarProtocol {
    let brand: String
    let productionYear: Int
    let trunkVolume: Double
    var trunkFilledVolume: FilledVolume {
        didSet { trunkFilledVolume.printDescription() }
    }
    var egnitionState: EgnitionState {
        didSet { egnitionState.printDescriptin() }
    }
    var windowState: WindowState {
        didSet { windowState.printDescription() }
    }
    
    init(brand: String, productionYear: Int, trunkVolume: Double) {
        self.brand = brand
        self.productionYear = productionYear
        self.trunkVolume = trunkVolume
        self.trunkFilledVolume = .empty
        self.egnitionState = .off
        self.windowState = .closed
    }
}

var truck: TruсkCar = .init(brand: "Mercedes-Benz", productionYear: 2008, trunkVolume: 548)
truck.fillTrunk(with: 120)
truck.changeWindow(state: .opened)
truck.turn(egnitionState: .on)
print(truck)
