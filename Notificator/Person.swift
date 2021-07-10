//
//  Person.swift
//  Notificator
//
//  Created by Роман Есин on 10.07.2021.
//

import SwiftUI

struct Person: Codable {
    let name: String
    let socialNetwork: String
    let url: URL
    var isAdmin: Bool = false
}

extension Person: View {
    var body: some View {
        Link(destination: url) {
            HStack {
                Image("deni")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .mask(Circle())
                    .padding(.trailing, 8)

                VStack(alignment: .leading) {
                    Text(name)
                        .foregroundColor(Color(UIColor.label))
                        .font(.body)
                    Text(socialNetwork)
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                }
                Spacer(minLength: 0)
                if isAdmin {
                    Image(systemName: "star.fill")
                        .foregroundColor(.accentColor)
                }
                Image(systemName: "chevron.right")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 4)
    }
}

struct Person_Previews: PreviewProvider {
    static var previews: some View {
        Person(
            name: "Дени Абакаев",
            socialNetwork: "VK",
            url: URL(string: "https://vk.com/denis_mi_mi_mi")!,
            isAdmin: true
        )
    }
}
