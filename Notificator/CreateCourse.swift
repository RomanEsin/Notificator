//
//  CreateCourse.swift
//  Notificator
//
//  Created by Роман Есин on 11.07.2021.
//

import SwiftUI

struct CreateCourse: View {

    @Binding var hasGroup: Bool


    @State var courseName = ""
    @State var groupNumber = ""
    @FocusState private var focusedField: Field?

    var createDisabled: Bool {
        courseName.isEmpty || groupNumber.isEmpty
    }

    enum Field: Hashable {
        case name
        case number
    }

    var body: some View {
        VStack {
            Text("Создание Курса")
                .font(.largeTitle.bold())
                .padding(.top, 32)
            Spacer()
            VStack {
                TextField("Название Курса", text: $courseName, onCommit: {
                    focusedField = .number
                })
                    .focused($focusedField, equals: .name)
                    .multilineTextAlignment(.center)
                Divider()
                TextField("Номер Группы", text: $groupNumber)
                    .focused($focusedField, equals: .number)
                    .multilineTextAlignment(.center)
            }
            .font(.title2.bold())
            .padding(.horizontal)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(UIColor.secondarySystemFill), lineWidth: 2)
            )

            Text("После создания курса вы можете пригласить одногруппников/старост вашего курса/группы")
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.vertical)

            Spacer()

            Button {
                hasGroup = true
            } label: {
                HStack {
                    Text("Создать курс")
                        .foregroundColor(.white)
                        .font(.title3.bold())
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 14)
                .background(Color.accentColor)
                .cornerRadius(16)
                .padding(.vertical, 32)
            }
            .animation(.easeInOut, value: createDisabled)
            .disabled(createDisabled)
            .padding(.bottom, 32)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .navigationTitle("Создание Курса")
    }
}

struct CreateCourse_Previews: PreviewProvider {
    static var previews: some View {
        CreateCourse(hasGroup: .constant(false))
    }
}
