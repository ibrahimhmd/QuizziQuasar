

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizziManager: QuizziManager
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("QuizziQuasar")
                    .eliteTitle()
                
                Spacer()
                
                Text("\(quizziManager.index + 1) out of \(quizziManager.lenght)")
                    .foregroundStyle(Color("AccentColor"))
                    .fontWeight(.heavy)
                    
            }
            
            
            
            ProgressBar(progress: quizziManager.progress)
            
            VStack(alignment: .leading,spacing: 20) {
                
                Text(quizziManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundStyle(.gray)
                
                ForEach(quizziManager.answerChoices, id: \.id) {
                    answer in
                    AnswerRaw(answer: answer)
                        .environmentObject(quizziManager)
                }
                
            }
            Button {
              
                quizziManager.goToNextQuestion()
            
            } label: {
                PrimaryButton(text: "Next", background: quizziManager.answerSelected ?
                              Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
               
                
            }
            .disabled(!quizziManager.answerSelected)
            
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               maxHeight: .infinity)
        .background(Color(red:0.984313725490196, green:0.9294117647058824, blue: 0.8470588235294118))
        .navigationBarHidden(true)

    }
}

#Preview {
    QuestionView()
        .environmentObject(QuizziManager())
}

