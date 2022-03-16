//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Test on 14/03/22.
//

struct Question {
    var text: String
    var type: ResponsceType
    var answers: [Answer]
    
}

extension Question {
    static func getQuestion() -> [Question] {
        return [
            Question(text: "Kakuyu pishshu vi predprinimayete?",
                     type: .single,
                     answers: [
                        Answer(text: "Стейк", type: .dog),
                        Answer(text: "Рыба", type: .cat),
                        Answer(text: "Морковь", type: .rabbit),
                        Answer(text: "Кукуруза", type: .turtle)
                     ]
            ),
            Question(text: "Chto vam nravitsya bolshe?",
                     type: .multiple,
                     answers: [
                        Answer(text: "Plavat", type: .dog),
                        Answer(text: "Spat", type: .cat),
                        Answer(text: "obnimatsa", type: .rabbit),
                        Answer(text: "yest", type: .turtle)
                     ]
            ),
            Question(text: "Lyubite vi poyezdke na mawine?",
                     type: .ranged,
                     answers: [
                        Answer(text: "Nanaviju", type: .dog),
                        Answer(text: "Nervichiyu", type: .cat),
                        Answer(text: "Ne zamechayu", type: .rabbit),
                        Answer(text: "Obajayu", type: .turtle)
                     ]
            )
        ]
    }
}
