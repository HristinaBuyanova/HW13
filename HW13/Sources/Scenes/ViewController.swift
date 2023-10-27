//
//  ViewController.swift
//  HW13
//
//  Created by Христина Буянова on 24.10.2023.
//

import UIKit


class ViewController: UIViewController {

    private var model = Model.array

    // MARK: - Outlets

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(StandartCell.self, forCellReuseIdentifier: StandartCell.identifier)
        tableView.register(CustomSwitchCell.self, forCellReuseIdentifier: CustomSwitchCell.identifier)
        tableView.register(CustomNotificationCell.self, forCellReuseIdentifier: CustomNotificationCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierrarchy()
        setupLayout()
    }

    // MARK: - Setup
    private func setupView() {
        view.backgroundColor = .white
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupHierrarchy () {
        view.addSubview(tableView)
    }

    private func setupLayout () {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        model.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let modelData = model[indexPath.section][indexPath.row]
        switch modelData.typeCell {
        case .standartType:
            let cell = tableView.dequeueReusableCell(withIdentifier: StandartCell.identifier, for: indexPath) as? StandartCell
            cell?.accessoryType = .disclosureIndicator
            cell?.model = modelData
            return cell ?? UITableViewCell()
        case .switchType:
            let switchCell = tableView.dequeueReusableCell(withIdentifier: CustomSwitchCell.identifier, for: indexPath) as? CustomSwitchCell
            switchCell?.model = modelData
            return switchCell ?? UITableViewCell()
        case .notificationType:
            let notificationCell = tableView.dequeueReusableCell(withIdentifier: CustomNotificationCell.identifier, for: indexPath) as? CustomNotificationCell
            notificationCell?.accessoryType = .disclosureIndicator
            notificationCell?.model = modelData
            return notificationCell ?? UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("row at \(indexPath.row)row and \(indexPath.section)section")
        let viewController = DetailView()
        viewController.configureView(model: model[indexPath.section][indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
}

