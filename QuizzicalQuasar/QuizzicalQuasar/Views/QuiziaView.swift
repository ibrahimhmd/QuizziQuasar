

import SwiftUI

struct QuiziaView: View {
    @EnvironmentObject var quizziManager: QuizziManager
    
    var body: some View {
        if quizziManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Quizzi Game")
                    .eliteTitle()
                Text("Congratulations , you completed the game!")
                Text("Your scored \(quizziManager.score) out of \(quizziManager.lenght)")
                
                Button{
                    Task.init  {
                        await quizziManager.fetchQuizzi()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
                
                
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(Color(red:0.984313725490196, green:0.9294117647058824, blue: 0.8470588235294118))
        } else {
            QuestionView()
                .environmentObject(quizziManager)
        }
        
        
        
    }
}

#Preview {
    QuiziaView()
        .environmentObject(QuizziManager())
}
