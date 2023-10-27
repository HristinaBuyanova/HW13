//
//  StandartCell.swift
//  HW13
//
//  Created by Христина Буянова on 26.10.2023.
//

import UIKit

class  StandartCell: UITableViewCell {

    static let identifier = "standartCell"

    var model: Model? {
        didSet {
            customImageView.image = UIImage(systemName: model?.image ?? "") ?? UIImage(named: model?.image ?? "")
            customLabel.text = model?.title ?? ""
            customView.backgroundColor = UIColor(named: model?.tintColor ?? "")
            customLabelDiscription.text = model?.discription ?? ""
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

    private lazy var customLabelDiscription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(customLabelDiscription)
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

            customLabelDiscription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            customLabelDiscription.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
