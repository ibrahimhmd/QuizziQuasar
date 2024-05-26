import Foundation

struct Quiza: Decodable {
    var results: [Result]
    
    
    struct Result : Decodable , Identifiable {

        var id: UUID {
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers:  [String]
        
        
        var formattedQuestion: AttributedString {
            do {
                return try AttributedString(markdown: question)
            } catch {
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        
        
        
        var answers: [Answer] {
            do {
                let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrects = try incorrectAnswers.map {
                    answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                
                
                let Allanswers = correct + incorrects
                return Allanswers.shuffled()
                
                
            } catch {
                print("Error setting answers: \(error)")
                return[]
            }
            
            
            
        }
        
        
        
    }
    
    
}
    
    
    
    

    
    

