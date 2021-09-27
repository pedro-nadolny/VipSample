import Foundation
@testable import VipSample

final class MenuRepositorySpyStub: MenuRepositoryProtocol {
    var result: Result<Menu, Error> = .success(.fixture())
    
    private(set) var didCallLoadMenu = 0
    
    func loadMenu(_ completion: @escaping Completion) {
        didCallLoadMenu += 1
        completion(result)
    }
}
