import Foundation
@testable import VipSample

extension Menu {
    static func fixture(itens: [Item] = [.fixture()]) -> Menu {
        .init(itens: itens)
    }
}

extension Item {
    static func fixture(
        name: String = .init(),
        price: Int = .init()) -> Item {
        .init(name: name, price: price)
    }
}
