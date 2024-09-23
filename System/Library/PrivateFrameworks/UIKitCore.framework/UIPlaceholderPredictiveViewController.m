@implementation UIPlaceholderPredictiveViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_isVisibleForAutocorrectionType:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autocorrectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasContinuousPathConversions");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "autocorrectionPreferenceForTraits");

  if (a3 == 1)
    v9 = v6;
  else
    v9 = 1;
  return v8 == 2 || v9;
}

- (id)_currentTextSuggestions
{
  void *v2;
  void *v3;
  void *v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autocorrectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textSuggestionList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  if (!-[UIPlaceholderPredictiveViewController showsRemoteInputDashViewController](self, "showsRemoteInputDashViewController"))
  {
    if (!v7)
    {
      +[UIPeripheralHost activeInstance](UIPeripheralHost, "activeInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "loadAwareInputViews");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    if ((objc_msgSend(v7, "isCustomInputView") & 1) != 0)
    {
      LOBYTE(v8) = 0;
      goto LABEL_36;
    }
    -[UIPlaceholderPredictiveViewController _currentTextSuggestions](self, "_currentTextSuggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "predictions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        LOBYTE(v8) = 1;
LABEL_35:

        goto LABEL_36;
      }
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "_showsScribbleIconsInAssistantView");

    if ((v15 & 1) != 0)
    {
      LOBYTE(v8) = 0;
      goto LABEL_35;
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textInputTraits");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "conformsToProtocolCached:", &unk_1EDE24D00))
    {
      objc_msgSend(v6, "textInputTraits");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v19;
    }
    if (!v17)
    {
      if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")|| (objc_msgSend(v6, "conformsToProtocolCached:", &unk_1EE0CE228) & 1) == 0&& !objc_msgSend(v6, "conformsToProtocolCached:", &unk_1EE0CE288)|| (+[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v6), (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (objc_msgSend(v6, "conformsToProtocolCached:", &unk_1EDE22B80))
        {
          +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = 0;
        }
      }
    }
    if (UIKeyboardAlwaysShowCandidateBarForCurrentInputMode())
    {
      if ((objc_msgSend(v17, "disableInputBars") & 1) == 0)
      {
        v8 = objc_msgSend(v17, "hidePrediction") ^ 1;
LABEL_34:

        goto LABEL_35;
      }
    }
    else if ((objc_msgSend(v17, "disablePrediction") & 1) == 0 && (objc_msgSend(v17, "hidePrediction") & 1) == 0)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "disableInputBars") & 1) != 0
        || !-[UIPlaceholderPredictiveViewController _isVisibleForAutocorrectionType:](self, "_isVisibleForAutocorrectionType:", objc_msgSend(v17, "autocorrectionType")))
      {

      }
      else
      {
        v21 = objc_msgSend(v17, "isSecureTextEntry");

        if ((v21 & 1) == 0 && UIKeyboardPredictionEnabledForCurrentInputMode())
        {
          +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "preferencesActions");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v8) = objc_msgSend(v23, "predictionEnabled");

          goto LABEL_34;
        }
      }
    }
    LOBYTE(v8) = 0;
    goto LABEL_34;
  }
  LOBYTE(v8) = 1;
LABEL_36:

  return v8;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  double result;

  +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:](UISystemInputAssistantViewController, "_defaultPreferredHeightForTraitCollection:", a3);
  return result;
}

- (BOOL)hidesExpandableButton
{
  return 0;
}

- (NSArray)displayedCandidates
{
  return 0;
}

- (BOOL)requiresKeyboard
{
  return 1;
}

- (BOOL)showsRemoteInputDashViewController
{
  return self->_showsRemoteInputDashViewController;
}

- (void)setShowsRemoteInputDashViewController:(BOOL)a3
{
  self->_showsRemoteInputDashViewController = a3;
}

@end
