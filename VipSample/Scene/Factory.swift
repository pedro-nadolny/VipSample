import UIKit

enum Factory {
    static func make() -> ViewController {
        let view = MenuView()
        let presenter = Presenter()
        let repository = MenuRepository()
        let interactor = Interactor(presenter: presenter, menuRepository: repository)
        let controller = ViewController(customView: view, interactor: interactor)
        
        presenter.controller = controller
        return controller
    }
}
