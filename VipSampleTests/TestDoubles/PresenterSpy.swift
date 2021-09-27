import Foundation
@testable import VipSample

final class PresenterSpy: PresenterProtocol {
    
    private(set) var didCallPresentLoadMenu = 0
    private(set) var didCallPresentLoadMenuWithMenu: Menu?
    
    func presentLoadMenu(menu: Menu) {
        didCallPresentLoadMenu += 1
        didCallPresentLoadMenuWithMenu = menu
    }
}
