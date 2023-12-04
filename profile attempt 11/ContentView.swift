// test

import SwiftUI

struct ContentView: View {
    @State private var circleOffsetX: CGFloat = 0
    @State private var editedFirstName = "Sara"
    @State private var editedLastName = "Ali"
    @State private var isEditing = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.white

                VStack {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 0.39, green: 0.02, blue: 1.00, alpha: 1.00)), Color.black, Color(UIColor(red: 0.70, green: 1.00, blue: 0.32, alpha: 1.00))]), startPoint: .bottomTrailing, endPoint: .topLeading)
                            )
                            .frame(width: 600, height: 480)
                            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                            .offset(y: -UIScreen.main.bounds.height / 2)

                        Text("Pear Body Shape")
                            .font(Font.custom("SF-Pro", size: 25))
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 237.0)

                        HStack {
                            if isEditing {
                                TextField("First Name", text: $editedFirstName)
                                    .font(Font.custom("SF-Pro", size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 130.0)
                                    .multilineTextAlignment(.trailing)
                                    .disableAutocorrection(true)

                                TextField("Last Name", text: $editedLastName)
                                    .font(Font.custom("SF-Pro", size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 130.0)
                                    .multilineTextAlignment(.trailing)
                                    .disableAutocorrection(true)
                            } else {
                                Text(editedFirstName)
                                    .font(Font.custom("SF-Pro", size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 130.0)

                                Text(editedLastName)
                                    .font(Font.custom("SF-Pro", size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 130.0)
                            }
                        }
                        .padding([.bottom, .trailing], 257.0)
                        .navigationBarItems(trailing:
                            Button(action: {
                                isEditing.toggle()
                            }) {
                                Image(systemName: "square.and.pencil")
                                    .foregroundColor(Color((UIColor(red: 0.37, green: 0.00, blue: 0.98, alpha: 1.00))))
                            }
                        )

                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 110, height: 110)
                            .foregroundColor(Color(UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)))
                            .clipShape(RoundedRectangle(cornerRadius: 82, style: .continuous))
                            .overlay(
                                Text("\(String(editedFirstName.prefix(1)))\(String(editedLastName.prefix(1)))")
                                    .font(.system(size: 40, weight: .bold))
                                    .fontWeight(.regular)
                                    .foregroundColor(.white)
                                    .padding()
                            )
                    }

                    VStack {
                        HStack {
                            Image(systemName: "heart")
                              .foregroundColor((Color((UIColor(red: 0.37, green: 0.00, blue: 0.98, alpha: 1.00)))))
                                .padding(.leading, 27.0)

                            Spacer()

                            Button(action: {
                                // Implement action for "See more" button
                            }) {
                                Text("See more>")
                                    .foregroundStyle((Color((UIColor(red: 0.37, green: 0.00, blue: 0.98, alpha: 1.00)))))
                            }
                            .padding(.leading, 27.0)
                        }
                        .padding(.trailing, 24.0)
                        .background(Color.white)

                        ZStack(alignment: .topLeading) {
                            HStack {
                                Image("Body shape")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150.0, height: 200.0)
                                    .cornerRadius(14)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )

                                Image("Body shape")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .frame(width: 150, height: 200)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }

                        }
                        .padding(.bottom, 54.0)
                    }
                    
                }

                Path { path in
                    let radius: CGFloat = 200
                    let center = CGPoint(x: UIScreen.main.bounds.width / 2, y: (UIScreen.main.bounds.height / 90))
                    let controlPoint = CGPoint(x: center.x, y: center.y + radius * 1)

                    path.move(to: CGPoint(x: center.x - radius, y: center.y))
                    path.addQuadCurve(to: CGPoint(x: center.x + radius, y: center.y), control: controlPoint)
                }
                .stroke(Color.gray, lineWidth: 1)
                .offset(y: UIScreen.main.bounds.height * 0.4 - 80)

                HStack {
                    CircleDataView(title: "Shoulder Size", value: "32")
                        .offset(CGSize(width: 2, height: -40))
                    CircleDataView(title: "Bust Size", value: "28").offset(CGSize(width: 2, height: -10))

                    CircleDataView(title: "Waist Size", value: "33")

                    CircleDataView(title: "Hip Size", value: "38").offset(CGSize(width: 2, height: -40))
                }
                .padding(.bottom, 24.0)
            }
        }
    }
}

struct CircleDataView: View {
    let title: String
    let value: String
    let customFont = Font.custom("SF-Pro", size: 12)

    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(customFont)
                .fontWeight(.light)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .cornerRadius(2)
            Text(value)
                .font(customFont)
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(.white)
        }
        .frame(width: 92, height: 98)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(.gray), Color.black]), startPoint: .bottomTrailing, endPoint: .topLeading)
                .clipShape(Circle())
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
