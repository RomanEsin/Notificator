//
//  NotificationsView.swift
//  Notificator
//
//  Created by Роман Есин on 10.07.2021.
//

import SwiftUI

struct CourseNotification: Codable, Identifiable, Equatable {
    var id = UUID().uuidString
    let from: String
    let title: String
    let content: String
}

struct CourseNotificationView: View {

    let notification: CourseNotification

    var body: some View {
        NavigationLink(destination: FullCourseNotification(notification: notification)) {
            VStack(alignment: .leading, spacing: 6) {
                let content = notification.content

                Text(notification.title)
                    .font(.title2.bold())
                    .lineLimit(2)

                HStack {
                    Image("deni")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .mask(Circle())
                        .padding(.trailing, 4)
                    Text(notification.from)
                }

                if content.count > 120 {
                    let index = content.index(content.startIndex, offsetBy: 120)
                    Text(content[...index].trimmingCharacters(in: .whitespacesAndNewlines) + "...")
                        .foregroundColor(.secondary)
                } else {
                    Text(content)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 4)
        }
    }
}

struct NotificationsView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CreateNotification()) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.white)
                            .font(.title3)
                        Text("Создать Уведомление")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                .listRowBackground(Color.accentColor)
                
                Section(header: Text("Все Уведомления")) {
                    ForEach([
                        CourseNotification(from: "Дени Абакаев", title: "Перевод нахуй", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                        CourseNotification(from: "Дени Абакаев", title: "Перевод нахуй", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod")
                    ]) { notification in
                        CourseNotificationView(notification: notification)
                    }
                }
            }
            .navigationTitle("Уведомления")
        }
        .tabItem {
            Label("Уведомления", systemImage: "bell.fill")
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
