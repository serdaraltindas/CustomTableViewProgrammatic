//
//  ViewController.swift
//  SpecialTableViewProgrammatic
//
//  Created by Serdar Altındaş on 12.05.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Variables
    private let images: [UIImage] = [
    UIImage(named: "1")!,
    UIImage(named: "2")!,
    UIImage(named: "3")!,
    UIImage(named: "4")!,
    UIImage(named: "5")!,
    UIImage(named: "6")!
    ]
    //MARK: - UI Components
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return tableView
    }()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    //MARK: - SetUp UI
    private func setupUI() {
        self.view.backgroundColor = .systemBlue
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier , for: indexPath) as? CustomCell else {
            fatalError("Error!")
        }
        let image = self.images[indexPath.row]
        cell.configure(with: image, and: indexPath.row.description)
        return cell
    }
    
    
}

