//
//  Struct.swift
//  Navigation
//
//  Created by Viktoria Dolínskaya on 10.12.2023.
//

import UIKit

struct Post {
    var title: String
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}
extension Post {
    static func make() -> [Post] {
        [
            Post(
                title: "Новые факты о горах",
                author: "Scientific Researcher",
                description: " Новое исследование немецких ученых показывает, что высота крупнейших горных хребтов, таких как Анды или Гималаи, определяется не соотношением скоростей подъема и эрозии, как считалось ранее, а тектоническими силами, удерживающими горы на определенном уровне. Результаты опубликованы в журнале Nature.",
                image: "Image1",
                likes: 10,
                views: 15
            ),
            Post(
                title: "Снова мастер-класс в прямом эфире",
                author: "Chef Сake PRO",
                description: "Приготовим вкуснейшие пирожные на моем мастер-классе вместе",
                image: "Image2",
                likes: 20,
                views: 25
            ),
            Post(
                title: "Современное искусство",
                author: "Modern Art",
                description: "В чем смысл современного искусства и стоит ли на него тратить время?",
                image: "Image3",
                likes: 30,
                views: 35
            ),
            Post( 
                title: "Жизненно...",
                author: "Mother Teresa",
                description: "Людям не хватает любви гораздо больше, чем хлеба... и этот голод самый сильный",
                image: "Image4",
                likes: 40,
                views: 45
            )
        ]
    }
}
