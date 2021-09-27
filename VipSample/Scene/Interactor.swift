import Foundation

protocol InteractorProcotol {
    func loadMenu()
}

final class Interactor {
    private let presenter: PresenterProtocol
    private let menuRepository: MenuRepositoryProtocol
    private(set) var menu: Menu?
    
    init(presenter: PresenterProtocol, menuRepository: MenuRepositoryProtocol) {
        self.presenter = presenter
        self.menuRepository = menuRepository
    }
}

extension Interactor: InteractorProcotol {
    func loadMenu() {
        menuRepository.loadMenu { result in
            switch result {
            case let .success(menu):
                self.presenter.presentLoadMenu(menu: menu)
            case .failure(_):
                break
            }
        }
    }
}
