

import SwiftUI

struct ContentView: View {
    @StateObject var quizziManager = QuizziManager()
    
    
    
    var body: some View {
        NavigationView{
            VStack(spacing:40) {
                VStack(spacing: 20){
                    Text("QuizziQuasar")
                        .eliteTitle()
                    
                    Text("Are  you ready to test out your Quizzi skills ?")
                        .foregroundStyle(Color("AccentColor"))
                    
                }
                NavigationLink {
                    QuiziaView()
                        .environmentObject(quizziManager)
                } label: {
                    PrimaryButton(text: "Let's go!")
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(Color(red:0.984313725490196, green:0.9294117647058824, blue: 0.8470588235294118))
            
            
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(QuizziManager())
}
