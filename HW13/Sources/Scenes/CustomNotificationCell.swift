//
//  CustomNotificationCell.swift
//  HW13
//
//  Created by Христина Буянова on 26.10.2023.
//

import UIKit

class  CustomNotificationCell: UITableViewCell {

    static let identifier = "customNotificationCell"

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
        imageView.tintColor = .brown
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var customLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var customImageCircle: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .red
        imageView.image = UIImage(systemName: "circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var customLabelCircle: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
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
        addSubview(customImageCircle)
        addSubview(customLabelCircle)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            customView.centerYAnchor.constraint(equalTo: centerYAnchor),
            customView.heightAnchor.constraint(equalToConstant: 30),
            customView.widthAnchor.constraint(equalToConstant: 30),

            customImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            customImageView.centerYAnchor.constraint(equalTo: centerYAnchor),

            customLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            customLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            customImageCircle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            customImageCircle.centerYAnchor.constraint(equalTo: centerYAnchor),
            customImageCircle.heightAnchor.constraint(equalToConstant: 30),
            customImageCircle.widthAnchor.constraint(equalToConstant: 30),

            customLabelCircle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -53),
            customLabelCircle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
