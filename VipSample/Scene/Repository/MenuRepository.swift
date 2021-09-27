import Foundation

protocol MenuRepositoryProtocol {
    typealias Completion = (Result<Menu, Error>) -> Void
    func loadMenu(_ completion: @escaping Completion)
}

final class MenuRepository: MenuRepositoryProtocol {
    func loadMenu(_ completion: @escaping Completion) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(2)) {
            completion(
                .success(.init(itens: [
                    .init(name: "Item 0", price: 100),
                    .init(name: "Item 1", price: 200),
                    .init(name: "Item 2", price: 300),
                    .init(name: "Item 3", price: 400),
                    .init(name: "Item 4", price: 500),
                    .init(name: "Item 5", price: 600),
                    .init(name: "Item 6", price: 700),
                    .init(name: "Item 7", price: 800),
                    .init(name: "Item 8", price: 900),
                    .init(name: "Item 9", price: 999),
                    .init(name: "Item 10", price: 1000),
                    .init(name: "Item 11", price: 10),
                ]))
            )
        }
    }
}
