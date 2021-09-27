import XCTest
@testable import VipSample

final class InteractorTests: XCTestCase {
    
    private let repositorySpyStub = MenuRepositorySpyStub()
    private let presenterSpy = PresenterSpy()
    
    private lazy var sut = Interactor(
        presenter: presenterSpy,
        menuRepository: repositorySpyStub)
    
    func testLoadMenu_whenCalledWithSuccessFromRepository_ShouldCallPresenterLoadMenu() {
        //Given
        let menu: Menu = .fixture(itens: [
            .fixture(),
            .fixture(),
            .fixture(),
        ])
        
        repositorySpyStub.result = .success(menu)
        
        //Then
        sut.loadMenu()
        
        //When
        XCTAssertEqual(repositorySpyStub.didCallLoadMenu, 1)
        XCTAssertEqual(presenterSpy.didCallPresentLoadMenu, 1)
        XCTAssertEqual(presenterSpy.didCallPresentLoadMenuWithMenu, menu)
    }
}
