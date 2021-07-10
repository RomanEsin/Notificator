//
//  MyCourse.swift
//  Notificator
//
//  Created by Роман Есин on 10.07.2021.
//

import SwiftUI
import UIKit

// Молюсь Есусу Христу чтобы в этом коде не было багов
struct MyCourse: View {
    var body: some View {
        NavigationView {
            List {
                Button {
                    let controller = UIActivityViewController(
                        activityItems: [URL(string: "https://vk.com/esinroman")!],
                        applicationActivities: [])
                    let root = UIApplication.shared.windows.first?.rootViewController
                    root?.present(controller, animated: true)
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.white)
                            .font(.title3)
                        Text("Добавить пользователя")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .listRowBackground(Color.accentColor)

                Section(header: Text("Админы/Старосты")) {
                    ForEach(0..<3) { i in
                        Person(
                            name: "Дени Абакаев",
                            socialNetwork: "VK",
                            url: URL(string: "https://vk.com/denis_mi_mi_mi")!,
                            isAdmin: true
                        )
                    }
                }

                Section(header: Text("Студенты")) {
                    ForEach(0..<20) { i in
                        Person(
                            name: "Дени Абакаев",
                            socialNetwork: "VK",
                            url: URL(string: "https://vk.com/denis_mi_mi_mi")!
                        )
                    }
                }
            }
            .navigationTitle("ПМИ Б8120")
        }
        .tabItem {
            Label("Мой Курс", systemImage: "person.3.sequence.fill")
        }
    }
}

struct MyCourse_Previews: PreviewProvider {
    static var previews: some View {
        MyCourse()
    }
}
