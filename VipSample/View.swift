import UIKit

class View: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func extraConfigurations() {
        
    }
    
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        extraConfigurations()
    }
}

//extension ViewConfiguration {
//    func setupView() {
//        buildViewHierarchy()
//        setupConstraints()
//        extraConfigurations()
//    }
//
//    func extraConfigurations() {}
//}
