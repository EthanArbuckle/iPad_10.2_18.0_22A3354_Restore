@implementation UIAutofillExtrasSuggestion

+ (id)autofillExtrasSuggestion
{
  return (id)objc_msgSend(a1, "textSuggestionWithInputText:", 0);
}

- (id)_keyboardCandidate
{
  return +[TIKeyboardCandidateSuggestion candidateWithSuggestion:customInfoType:](TIKeyboardCandidateSuggestion, "candidateWithSuggestion:customInfoType:", self, 32);
}

@end
