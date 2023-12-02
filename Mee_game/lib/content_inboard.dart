class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: 'Profile Name',
      image: 'images/mimi1.svg',
      description: "Full Name: Maryam Umar \n"
          "Course: Information Technology"),
  OnboardingContent(
      title: 'Game Rule 1',
      image: 'images/game1.svg',
      description:
          "1. Each quiz question will be presented with multiple-choice options.\n"
          "2. Read the question carefully and consider all possible answers.\n"
          "3. Tap or select the option that you believe is the correct answer."),
  OnboardingContent(
      title: 'Game Rule 2',
      image: 'images/game2.svg',
      description: "The Game alternates between yourn turn and the Computer\n"
          "During your turn, answer the question presented on the screen\n"
          "After your turn, the computer will take its turn and answer a question."),
  OnboardingContent(
      title: 'Game Rule 3',
      image: 'images/game3.svg',
      description: "You have 5 Seconds to answer each question\n"
          "The timer adds an element of challenge, so be quick and decisive in your responses\n"
          "Incorrect answers reset your bonus streak but do not reduce your total score"),
];
