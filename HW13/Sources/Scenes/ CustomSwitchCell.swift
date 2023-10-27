//
//  TableViewCell.swift
//  HW13
//
//  Created by Христина Буянова on 24.10.2023.
//

import UIKit

class  CustomSwitchCell: UITableViewCell {

    static let identifier = "customSwitchCell"

    var model: Model? {
        didSet {
            customImageView.image = UIImage(systemName: model?.image ?? "") ?? UIImage(named: model?.image ?? "")
            customLabel.text = model?.title ?? ""
            customView.backgroundColor = UIColor(named: model?.tintColor ?? "")
        }
    }

//    MARK: - UI

    private lazy var customView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var customLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var customSwitch: UISwitch = {
        let customSwitch = UISwitch(frame: .zero)
        customSwitch.setOn(false, animated: true)
        customSwitch.translatesAutoresizingMaskIntoConstraints = false
        return customSwitch
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {

    }

    private func setupHierarchy() {
        addSubview(customView)
        addSubview(customImageView)
        addSubview(customLabel)
        addSubview(customSwitch)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            customView.centerYAnchor.constraint(equalTo: centerYAnchor),
            customView.heightAnchor.constraint(equalToConstant: 30),
            customView.widthAnchor.constraint(equalToConstant: 30),

            customImageView.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
            customImageView.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            customImageView.heightAnchor.constraint(equalToConstant: 25),
            customImageView.widthAnchor.constraint(equalToConstant: 25),

            customLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            customLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            customSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            customSwitch.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
