import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeadV = ProfileHeaderView()
    
    fileprivate let post = Post.make()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .grouped
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private enum CellReuseID: String{
        case base = "BaseTableViewCell_ReuseID"
        case custom = "CustomTableViewCell_ReuseID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubviews()
        setupUI()
        setupTableView()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    private func setupTableView() {
        //        значение по умолчанию:
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
//        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "Post")
        
        //                Указываем основные делегаты таблицы
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupUI() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
extension ProfileViewController: UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        post.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else {
//            при ошибке возвращаем пустую ячейку
            return UITableViewCell()
            }
        let post = post[indexPath.row]
        cell.configure(with: post)
            return cell
        }
    }
    extension ProfileViewController: UITableViewDelegate {
       
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            200.0
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            
            guard section == 0 else { return nil }
            
            return profileHeadV
        }
    }

