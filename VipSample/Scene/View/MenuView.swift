import UIKit

protocol MenuViewProtocol: UIView {
    func load(menuViewModel: MenuViewModel)
    func startLoading()
    func stopLoading()
}

final class MenuView: View {
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self.dataSource
        return tableView
    }()
    
    private let dataSource = MenuViewDataSource()
    
    let loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.hidesWhenStopped = true
        loader.startAnimating()
        return loader
    }()
    
    override func buildViewHierarchy() {
        addSubview(tableView)
        addSubview(loader)
    }
    
    override func setupConstraints() {
        tableView.edges.equalTo(safeAreaLayoutGuide)
        loader.centerXY.equalToSuperview()
    }
    
    override func extraConfigurations() {
        backgroundColor = .white
    }
}

extension MenuView: MenuViewProtocol {
    func load(menuViewModel: MenuViewModel) {
        dataSource.menuViewModel = menuViewModel
        tableView.reloadData()
    }
    
    func startLoading() {
        loader.startAnimating()
    }
    
    func stopLoading() {
        loader.stopAnimating()
    }
}

final class MenuViewDataSource: NSObject, UITableViewDataSource {
    
    var menuViewModel: MenuViewModel?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuViewModel?.itens.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        cell.textLabel?.text = menuViewModel?.itens[indexPath.row].title
        cell.contentView.backgroundColor = .clear
        cell.backgroundColor = .clear
        return cell
    }
}
