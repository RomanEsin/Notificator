//
//  Auth.swift
//  Notificator
//
//  Created by Роман Есин on 11.07.2021.
//

import SwiftUI

struct Auth: View {
    var body: some View {
        VStack {
            Text("Привяжите свой аккаунт Вконтакте или Telegram для синхронизации сообщений группы")
                .foregroundColor(.secondary)
        }
    }
}

struct Auth_Previews: PreviewProvider {
    static var previews: some View {
        Auth()
    }
}
