@implementation TUAccessibilityAnnouncer

+ (void)speak:(id)a3 style:(unint64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  switch(a4)
  {
    case 0uLL:
      UIAccessibilitySpeak();
      goto LABEL_6;
    case 1uLL:
      UIAccessibilitySpeakOrQueueIfNeeded();
      goto LABEL_6;
    case 2uLL:
      UIAccessibilitySpeakIfNotSpeaking();
      goto LABEL_6;
    case 3uLL:
      UIAccessibilitySpeakAndDoNotBeInterrupted();
LABEL_6:
      v5 = v6;
      break;
    default:
      break;
  }

}

@end
