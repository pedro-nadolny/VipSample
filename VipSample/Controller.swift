import UIKit

class Controller<View: UIView, Interactor>: UIViewController {
    let interactor: Interactor
    let customView: View
    
    init(customView: View, interactor: Interactor) {
        self.interactor = interactor
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = customView
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
