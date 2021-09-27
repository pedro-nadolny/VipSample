import UIKit

protocol ControllerProtocol: AnyObject {
    func displayMenuViewModel(_ menuViewModel: MenuViewModel)
}

final class ViewController: Controller<MenuView, InteractorProcotol> {
    var menu: Menu?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Vip Sample"
        customView.startLoading()
        interactor.loadMenu()
    }
}

extension ViewController: ControllerProtocol {
    func displayMenuViewModel(_ menuViewModel: MenuViewModel) {
        DispatchQueue.main.async {
            self.customView.load(menuViewModel: menuViewModel)
            self.customView.stopLoading()
        }
    }
}
