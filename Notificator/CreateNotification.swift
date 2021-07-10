//
//  CreateNotification.swift
//  Notificator
//
//  Created by Роман Есин on 10.07.2021.
//

import SwiftUI

struct CreateNotification: View {

    @State var notificationText = "asdf asdf asdf asdf asdf"
    @State private var textFieldId: String = UUID().uuidString

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color(UIColor.secondarySystemFill))
                    TextEditor(text: $notificationText)
                        .frame(height: 300)
                        .id(textFieldId)
                        .padding(8)
                }

                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Опубликовать Уведомление")
                            .foregroundColor(.white)
                            .font(.title3.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 14)
                    .background(Color.accentColor)
                    .cornerRadius(16)
                    .padding(.vertical, 32)
                }

            }
            .padding(.horizontal)
        }
        .navigationTitle("Создать Уведомление")
        .navigationBarItems(trailing: Button(action: {
            textFieldId = UUID().uuidString
        }, label: {
            Image(systemName: "keyboard.chevron.compact.down")
        }))
    }
}

struct CreateNotification_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateNotification()
        }
    }
}
