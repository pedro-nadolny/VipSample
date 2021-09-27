import Foundation

protocol PresenterProtocol {
    func presentLoadMenu(menu: Menu)
}

final class Presenter {
    weak var controller: ControllerProtocol?
}

extension Presenter: PresenterProtocol {
    func presentLoadMenu(menu: Menu) {
        let menuItens: [MenuViewModel.Item] = menu.itens.map { item in
            let title = "\(item.name) - \(String(format: "R$ %.2f", Double(item.price)/100))"
            return MenuViewModel.Item(title: title)
        }
        controller?.displayMenuViewModel(.init(itens: menuItens))
    }
}
