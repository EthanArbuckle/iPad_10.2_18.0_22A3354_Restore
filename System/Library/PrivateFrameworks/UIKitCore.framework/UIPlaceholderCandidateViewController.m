@implementation UIPlaceholderCandidateViewController

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  id v5;
  int v6;
  void *v7;
  char v8;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = a3;
  if (-[UIPlaceholderPredictiveViewController showsRemoteInputDashViewController](self, "showsRemoteInputDashViewController"))
  {
    goto LABEL_2;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_showsScribbleIconsInAssistantView");

  if ((v8 & 1) != 0)
    goto LABEL_4;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "showsCandidateBar");

  if ((v11 & 1) != 0)
  {
LABEL_2:
    LOBYTE(v6) = 1;
    goto LABEL_5;
  }
  if (!UIKeyboardAlwaysShowCandidateBarForCurrentInputMode())
  {
LABEL_4:
    LOBYTE(v6) = 0;
    goto LABEL_5;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textInputTraits");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "conformsToProtocolCached:", &unk_1EDE24D00))
  {
    objc_msgSend(v5, "textInputTraits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  if (!v13)
  {
    if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")|| !objc_msgSend(v5, "conformsToProtocolCached:", &unk_1EE0CE228)|| (+[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v5), (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (objc_msgSend(v5, "conformsToProtocolCached:", &unk_1EDE22B80))
      {
        +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
    }
  }
  if ((objc_msgSend(v13, "disableInputBars") & 1) != 0)
    LOBYTE(v6) = 0;
  else
    v6 = objc_msgSend(v13, "hidePrediction") ^ 1;

LABEL_5:
  return v6;
}

@end
