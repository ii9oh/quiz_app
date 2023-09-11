class Question {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;

  Question({
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
  });
}

final List<Question> list = [
  Question(
    question: "What is the best programming Language?",
    answers: ['C#', 'Python', 'C++', 'Java'],
    correctAnswerIndex: 0,
  ),
  Question(
    question: "What is the best football team in the world?",
    answers: ['RealMadred', 'Barcelona', 'Arcenal', 'Roma'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: "Who is the best player in the world?",
    answers: ['Cristiano', 'Ronaldo', 'Naymar', 'Messi'],
    correctAnswerIndex: 3,
  ),
  Question(
    question: "Where is the best city in the world?",
    answers: ['Mukkala', 'Riyadh', 'Jeddah', 'Dammam'],
    correctAnswerIndex: 0,
  ),
  Question(
    question: "What is the second best football team in the world?",
    answers: ['RealMadred', 'Barcelona', 'Arcenal', 'Roma'],
    correctAnswerIndex: 2,
  ),
];
