//
//  FullCourseNotification.swift
//  Notificator
//
//  Created by Роман Есин on 10.07.2021.
//

import SwiftUI

struct VoteButton: View {

    @Binding var didVote: Bool
    let percentage: CGFloat

    var body: some View {
        Button {
            UIImpactFeedbackGenerator().impactOccurred()
            didVote = true
        } label: {
            HStack {
                Text("Дени")
                    .foregroundColor(Color(UIColor.label))
                Spacer(minLength: 0)
                if didVote {
                    HStack {
                        Text("5")
                            .foregroundColor(.accentColor)
                            .font(.body.bold())
                            .padding(.trailing, 4)

                        ZStack {
                            Circle()
                                .stroke(lineWidth: 5)
                                .foregroundColor(Color(UIColor.systemFill))

                            Circle()
                                .trim(from: 0, to: percentage)
                                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                .foregroundColor(.accentColor)
                                .rotationEffect(.degrees(-90))
                        }
                        .frame(width: 25, height: 25)
                    }
                    .transition(.opacity.combined(with: .offset(x: 20, y: 0)).animation(.spring()))
                    .animation(.spring())
                }
            }
            .frame(height: 25)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.vertical, 12)
            .background(
                ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color(UIColor.secondarySystemFill))
            }
            )
        }
    }
}

struct FullCourseNotification: View {

    let notification: CourseNotification
    @State var didVote = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                let content = notification.content

                Text(notification.title)
                    .font(.largeTitle.bold())
                    .lineLimit(2)

                HStack {
                    Image("deni")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .mask(Circle())
                        .padding(.trailing, 4)
                    Text(notification.from)
                        .font(.title3)
                }

                Text(content)
                    .foregroundColor(.secondary)

                VStack(spacing: 4) {
                    Text("Опрос: У кого больше хуй")
                        .font(.title2.bold())
                        .padding(.bottom, 8)

                    VoteButton(didVote: $didVote, percentage: 0.3)
                    VoteButton(didVote: $didVote, percentage: 0.6)
                    VoteButton(didVote: $didVote, percentage: 0.1)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(UIColor.secondarySystemFill), lineWidth: 2)
                )
                .padding(.top)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FullCourseNotification_Previews: PreviewProvider {
    static var previews: some View {
        FullCourseNotification(notification: CourseNotification(from: "Дени Абакаев", title: "Перевод нахуй", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."))
    }
}
