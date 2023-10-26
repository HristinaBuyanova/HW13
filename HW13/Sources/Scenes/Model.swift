//
//  Model.swift
//  HW13
//
//  Created by Христина Буянова on 24.10.2023.
//

import Foundation

enum TypeCell {
    case standartType
    case switchType
    case notificationType
}

struct Model {
    var title: String
    var discription: String?
    var image: String
    var typeCell: TypeCell
    var tintColor: String
}

extension Model {
    static var array: [[Model]] {
        return [
            [Model(title: "Авиарежим", image: "airplane", typeCell: .switchType, tintColor: "myOrange"),
             Model(title: "WI-FI", discription: "Не подключено", image: "wifi", typeCell: .standartType, tintColor: "myBlue"),
             Model(title: "Bluetooth", discription: "Вкл.", image: "Bluetooth", typeCell: .standartType, tintColor: "myBlue"),
             Model(title: "Сотовая связь", image: "antenna.radiowaves.left.and.right", typeCell: .standartType, tintColor: "myGreen"),
             Model(title: "Режим модема", image: "personalhotspot", typeCell: .standartType, tintColor: "myGreen"),
             Model(title: "VPN", image: "vpn", typeCell: .switchType, tintColor: "myBlue")],

            [Model(title: "Уведомления", image: "bell.badge.fill", typeCell: .standartType, tintColor: "myRed"),
             Model(title: "Звуки, тактильные сигналы", image: "speaker.wave.3.fill", typeCell: .standartType, tintColor: "myRed"),
             Model(title: "Не беспокоить", image: "moon.fill", typeCell: .standartType, tintColor: "myViolet"),
             Model(title: "Экранное время", image: "hourglass", typeCell: .standartType, tintColor: "myViolet")],

            [Model(title: "Основные", image: "settings", typeCell: .notificationType, tintColor: "myGray"),
             Model(title: "Пункт управления", image: "switch.2", typeCell: .standartType, tintColor: "myGray"),
             Model(title: "Экран и яркость", image: "textformat.size", typeCell: .standartType, tintColor: "myBlue"),
             Model(title: "Экран Домой", image: "square.grid.3x3.topleft.filled", typeCell: .standartType, tintColor: "myBlue"),
             Model(title: "Универсальный доступ", image: "figure.2.circle", typeCell: .standartType, tintColor: "myBlue")]
        ]
    }
}


