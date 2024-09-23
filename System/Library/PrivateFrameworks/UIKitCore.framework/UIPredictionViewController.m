@implementation UIPredictionViewController

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  int v46;
  void *v47;
  unsigned int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  int v52;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputViews");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_msgSend(v7, "isCustomInputView") & 1) == 0)
  {
    -[UIPredictionViewController _currentTextSuggestions](self, "_currentTextSuggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "predictions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
        goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v6;
      v15 = +[UIKeyboardCameraSession shouldShowTextSuggestionForResponder:](UIKeyboardCameraSession, "shouldShowTextSuggestionForResponder:", v14)? objc_msgSend(v14, "hasText"): 1;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "_showsScribbleIconsInAssistantView");

      v9 = v17 ^ 1;
      if ((v17 & 1) != 0 || !v15)
        goto LABEL_45;
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "autocorrectionController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "hasAutofillCandidates");

    if ((v20 & 1) != 0)
    {
LABEL_14:
      v9 = 1;
LABEL_45:

      goto LABEL_46;
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "textInputTraitsNeedAutofill"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v22, "textInputTraitsNeedOneTimeCode"))
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "textInputTraitsNeedContactAutoFill");

        if ((v29 & 1) == 0)
        {
          v9 = 0;
          goto LABEL_45;
        }
LABEL_19:
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "textInputTraits");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v6, "conformsToProtocolCached:", &unk_1EDE24D00))
        {
          objc_msgSend(v6, "textInputTraits");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v25);
          v26 = objc_claimAutoreleasedReturnValue();

          v24 = (void *)v26;
        }
        if (!v24
          && +[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")&& (objc_msgSend(v6, "conformsToProtocolCached:", &unk_1EE0CE228) & 1) != 0|| objc_msgSend(v6, "conformsToProtocolCached:", &unk_1EE0CE288))
        {
          +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v6);
          v27 = objc_claimAutoreleasedReturnValue();

          v24 = (void *)v27;
        }
        if (!v24)
        {
          if (objc_msgSend(v6, "conformsToProtocolCached:", &unk_1EDE22B80))
          {
            +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v6);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v24 = 0;
          }
        }
        if ((objc_msgSend(v24, "hidePrediction") & 1) != 0)
        {
          v9 = 0;
LABEL_44:

          goto LABEL_45;
        }
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "autocorrectionController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "hasProactiveCandidates");

        if ((v32 & 1) != 0)
        {
          v9 = 1;
          goto LABEL_44;
        }
        -[UIViewController view](self, "view");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_rootInputWindowController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
        {
          +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "keyboardWindow");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "rootViewController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v34, "placement");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v37, "isFloatingAssistantView") & 1) == 0
          && +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
        {
          goto LABEL_40;
        }
        v38 = objc_msgSend(v24, "keyboardType");
        v9 = 0;
        if (v38 <= 0xB && ((1 << v38) & 0x930) != 0 || v38 == 127)
          goto LABEL_43;
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "visualModeManager");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v41, "windowingModeEnabled") & 1) != 0)
        {
          -[UIViewController traitCollection](self, "traitCollection");
          v51 = v40;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v42, "userInterfaceIdiom");

          if (v50 != 6)
          {
            +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "visualModeManager");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v44, "useVisualModeWindowed");

            if (v52)
            {
              v45 = objc_msgSend(v37, "isFloatingAssistantView");
              v46 = 0;
              if (!v37 || (v45 & 1) != 0)
              {
LABEL_57:
                if ((objc_msgSend(v24, "disablePrediction", v50) & 1) == 0
                  && (objc_msgSend(v24, "hidePrediction") & 1) == 0)
                {
                  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v47, "disableInputBars") & 1) != 0
                    || !-[UIPredictionViewController _isVisibleForAutocorrectionType:](self, "_isVisibleForAutocorrectionType:", objc_msgSend(v24, "autocorrectionType")))
                  {
                    v9 = 0;
LABEL_65:

                    goto LABEL_43;
                  }
                  v48 = v46 & ~objc_msgSend(v24, "isSecureTextEntry");

                  if (v48 == 1)
                  {
                    if ((objc_msgSend((id)objc_opt_class(), "_currentInputModeShowsMultiscriptOrTransliterationCandidates") & 1) != 0)
                    {
                      v9 = 1;
                      goto LABEL_43;
                    }
                    if (UIKeyboardPredictionEnabledForCurrentInputMode())
                    {
                      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v47, "preferencesActions");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      v9 = objc_msgSend(v49, "predictionEnabled");

                      goto LABEL_65;
                    }
                  }
                }
LABEL_40:
                v9 = 0;
LABEL_43:

                goto LABEL_44;
              }
              if ((objc_msgSend(v37, "isFloating") & 1) == 0)
              {
                v46 = objc_msgSend(v37, "showsInputOrAssistantViews");
                goto LABEL_57;
              }
            }
          }
        }
        else
        {

        }
        v46 = 1;
        goto LABEL_57;
      }

    }
    goto LABEL_19;
  }
  v9 = 0;
LABEL_46:

  return v9;
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

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_isVisibleForAutocorrectionType:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  uint64_t v9;
  char v10;
  char v11;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autocorrectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasContinuousPathConversions");

  v7 = objc_msgSend((id)objc_opt_class(), "_currentInputModeShowsMultiscriptOrTransliterationCandidates");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "autocorrectionPreferenceForTraits");

  if (a3 == 1)
    v10 = v7;
  else
    v10 = 1;
  v11 = v6 | v10;
  if (v9 == 2)
    return 1;
  else
    return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  -[UIPredictionViewController _registerAsAutocorrectionObserver](self, "_registerAsAutocorrectionObserver", a3);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autocorrectionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v11, "hasAutocorrection");
  v6 = v11;
  if (v5)
  {
    objc_msgSend(v11, "autocorrectionList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = objc_alloc_init(MEMORY[0x1E0DBDB48]);
    v10 = v9;

    -[UIPredictionViewController _updateAutocorrectionList:](self, "_updateAutocorrectionList:", v10);
    v6 = v11;
  }

}

- (void)_registerAsAutocorrectionObserver
{
  void *v3;
  id v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autocorrectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAutocorrectionObserver:", self);

}

- (void)_updateAutocorrectionList:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id obj;

  obj = a3;
  -[UIPredictionViewController _currentTextSuggestions](self, "_currentTextSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "predictions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      if (objc_msgSend(v5, "isShowingSuggestionForKeyboardCamera"))
      {
        -[UIPredictionViewController _clearTextSuggestions](self, "_clearTextSuggestions");
      }
      else
      {
        v8 = v5;

        obj = v8;
      }
    }
  }
  v9 = -[UIPredictionViewController _autocorrectionListMayCausePredictionViewToReappear:](self, "_autocorrectionListMayCausePredictionViewToReappear:", obj);
  -[UIPredictionViewController _throttledUpdateUIWithAutocorrectionList:](self, "_throttledUpdateUIWithAutocorrectionList:", obj);
  objc_storeStrong((id *)&self->_cachedAutocorrectionList, obj);
  if (v9)
  {
    +[UIKBKeyplaneChangeContext keyplaneChangeContext](UIKBKeyplaneChangeContext, "keyplaneChangeContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUpdateAssistantView:", 1);
    -[UIPredictionViewController predictionView](self, "predictionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_didChangeKeyplaneWithContext:", v10);

    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &__block_literal_global_830_0);
  }

}

- (void)_throttledUpdateUIWithAutocorrectionList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  NSTimer *v10;
  NSTimer *updateUITimer;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v4 = a3;
  if ((objc_msgSend(v4, "containsAutofillCandidates") & 1) == 0
    && (objc_msgSend(v4, "containsProactiveTriggers") & 1) == 0
    && objc_msgSend(v4, "notEmpty")
    && -[TIAutocorrectionList notEmpty](self->_cachedAutocorrectionList, "notEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_lastUIUpdateTime)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:");
      v8 = v7;
    }
    else
    {
      v8 = 1.79769313e308;
    }
    if (-[UIPredictionViewController _autocorrectionListContainsContinuousPathConversions:](self, "_autocorrectionListContainsContinuousPathConversions:", v4))
    {
      v9 = 0.05 - v8;

LABEL_10:
      -[NSTimer invalidate](self->_updateUITimer, "invalidate");
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __71__UIPredictionViewController__throttledUpdateUIWithAutocorrectionList___block_invoke;
      v21[3] = &unk_1E16C4358;
      v21[4] = self;
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v21, v9);
      v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      updateUITimer = self->_updateUITimer;
      self->_updateUITimer = v10;

      goto LABEL_16;
    }
    objc_msgSend(v4, "predictions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    v9 = 0.22;
    if (!v13 || v8 < 0.22)
      goto LABEL_10;
  }
  -[UIPredictionViewController _performThrottledUpdateUIWithAutocorrectionList:](self, "_performThrottledUpdateUIWithAutocorrectionList:", v4);
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (!v15)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isMinimized");

    if (v17)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_textChoicesAssistant");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "predictions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "showChoicesForCandidates:", v20);

    }
  }
LABEL_16:

}

- (void)_performThrottledUpdateUIWithAutocorrectionList:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *lastUIUpdateTime;
  NSTimer *updateUITimer;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUIUpdateTime = self->_lastUIUpdateTime;
  self->_lastUIUpdateTime = v5;

  -[NSTimer invalidate](self->_updateUITimer, "invalidate");
  updateUITimer = self->_updateUITimer;
  self->_updateUITimer = 0;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "autocorrectionPreferenceForTraits");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetSmartReplyFeedbackUIIfAlreadyShown");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegateAsResponder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_trailingPredictiveCandidateForWritingTools");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "predictions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v4, "predictions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayByAddingObject:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v35[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v17 = (void *)MEMORY[0x1E0DBDB48];
    objc_msgSend(v4, "corrections");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emojiList");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "listWithCorrections:predictions:emojiList:", v18, v16, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v20;
  }
  objc_msgSend(MEMORY[0x1E0DBDBD0], "textEffectsButtonCandidate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v4, "predictions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v4, "predictions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "arrayByAddingObject:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v34 = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v25 = (void *)MEMORY[0x1E0DBDB48];
    objc_msgSend(v4, "corrections");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emojiList");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "listWithCorrections:predictions:emojiList:", v26, v24, v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v28;
  }
  if (v9 == 2)
  {
    objc_msgSend(v4, "autocorrection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v29, "isContinuousPathConversion") & 1) != 0)
    {
      v30 = 0;
    }
    else
    {
      objc_msgSend(v4, "autocorrection");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v31, "isForShortcutConversion") ^ 1;

    }
  }
  else
  {
    v30 = 0;
  }
  -[UIPredictionViewController predictionView](self, "predictionView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDisablesHighlight:", v30);

  -[UIPredictionViewController predictionView](self, "predictionView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAutocorrectionList:animated:", v4, 1);

}

- (TUIPredictionView)predictionView
{
  return self->_predictionView;
}

- (BOOL)_autocorrectionListMayCausePredictionViewToReappear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  int v8;
  void *v9;

  v4 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "containsAutofillCandidates") & 1) != 0)
    goto LABEL_2;
  if (objc_msgSend(v6, "autocorrectionType") != 1)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v8 = -[TIAutocorrectionList containsContinuousPathConversions](self->_cachedAutocorrectionList, "containsContinuousPathConversions");
  if (v8 == objc_msgSend(v4, "containsContinuousPathConversions"))
  {
    if (objc_msgSend(v4, "containsContinuousPathConversions"))
    {
      -[UIPredictionViewController predictionView](self, "predictionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "isHidden");

      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_2:
  v7 = 1;
LABEL_8:

  return v7;
}

- (void)autocorrectionController:(id)a3 didUpdateAutocorrectionList:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(v7, "corrections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    -[UIPredictionViewController _updateAutocorrectionList:](self, "_updateAutocorrectionList:", v7);
    goto LABEL_5;
  }
  objc_msgSend(v7, "predictions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
LABEL_5:

}

- (BOOL)requiresKeyboard
{
  return 1;
}

- (BOOL)hidesExpandableButton
{
  return 0;
}

- (void)autocorrectionControllerDidClearAutocorrections:(id)a3
{
  -[UIPredictionViewController _updateAutocorrectionList:](self, "_updateAutocorrectionList:", 0);
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  double result;

  +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:](UISystemInputAssistantViewController, "_defaultPreferredHeightForTraitCollection:", a3);
  return result;
}

- (UIPredictionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIPredictionViewController *v4;
  UIPredictionViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPredictionViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[UIPredictionViewController _registerForNotifications](v4, "_registerForNotifications");
  return v5;
}

- (void)_registerForNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__inputModeDidChange, CFSTR("UITextInputCurrentInputModeDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__inputResponderDidChangeNotification_, CFSTR("UITextInputResponderDidChangeNotification"), 0);

}

- (void)loadView
{
  void *v3;
  objc_class *v4;
  id v5;
  TUIPredictionView *v6;
  TUIPredictionView *predictionView;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)_MergedGlobals_9_12;
  v12 = _MergedGlobals_9_12;
  if (!_MergedGlobals_9_12)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getTUIPredictionViewClass_block_invoke_0;
    v8[3] = &unk_1E16B14C0;
    v8[4] = &v9;
    __getTUIPredictionViewClass_block_invoke_0((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  v5 = [v4 alloc];
  v6 = (TUIPredictionView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  predictionView = self->_predictionView;
  self->_predictionView = v6;

  -[TUIPredictionView setDelegate:](self->_predictionView, "setDelegate:", self);
  -[UIPredictionViewController _inputModeDidChange](self, "_inputModeDidChange");
  -[UIViewController setView:](self, "setView:", self->_predictionView);
}

- (void)_inputModeDidChange
{
  void *v3;
  void *v4;
  id v5;

  UIKeyboardGetCurrentInputMode();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionView setCurrentLocale:](self->_predictionView, "setCurrentLocale:", v4);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("UITextInputCurrentInputModeDidChangeNotification");
  v8[1] = CFSTR("UITextInputResponderDidChangeNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "autocorrectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAutocorrectionObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)UIPredictionViewController;
  -[UIViewController dealloc](&v7, sel_dealloc);
}

+ (BOOL)_currentInputModeShowsMultiscriptOrTransliterationCandidates
{
  void *v2;
  void *v3;
  char v5;

  if (_os_feature_enabled_impl())
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentInputMode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isMultiscript"))
    {

      return 1;
    }
    v5 = UIKeyboardShowsTransliterationCandidatesForCurrentInputMode();

    if ((v5 & 1) != 0)
      return 1;
  }
  else if ((UIKeyboardShowsTransliterationCandidatesForCurrentInputMode() & 1) != 0)
  {
    return 1;
  }
  return UIKeyboardCurrentInputModeIsKoreanEnglishBilingual();
}

- (void)_clearTextSuggestions
{
  void *v2;
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextSuggestionList:", 0);

}

- (NSArray)displayedCandidates
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUIPredictionView displayedCandidates](self->_predictionView, "displayedCandidates");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (BOOL)_autocorrectionListContainsContinuousPathConversions:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "autocorrection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isContinuousPathConversion") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "predictions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexesOfObjectsPassingTest:", &__block_literal_global_676);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "count") != 0;

  }
  return v5;
}

uint64_t __83__UIPredictionViewController__autocorrectionListContainsContinuousPathConversions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isContinuousPathConversion");
  *a4 = result;
  return result;
}

uint64_t __71__UIPredictionViewController__throttledUpdateUIWithAutocorrectionList___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performThrottledUpdateUIWithAutocorrectionList:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
}

uint64_t __56__UIPredictionViewController__updateAutocorrectionList___block_invoke()
{
  return +[UIAssistantBarButtonItemProvider updateFloatingAssistantBarIfNeeded](UIAssistantBarButtonItemProvider, "updateFloatingAssistantBarIfNeeded");
}

- (void)predictionView:(id)a3 didSelectCandidate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _BOOL8 v19;
  void *v20;
  id v21;

  v21 = a3;
  v5 = a4;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateIdleDetection:", 0);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feedbackGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allVisibleCells");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v21, "selectedIndex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "center");
  objc_msgSend(v8, "actionOccurred:atLocation:", 10);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "replacement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_10:

      goto LABEL_11;
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateAsResponder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_responderForEditing");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "targetForAction:withSender:", sel_replace_, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "performSelector:withObject:", sel_replace_, v11);
LABEL_9:

    goto LABEL_10;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "acceptPredictiveInput:", v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v21, "autocorrectionList");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "autocorrection");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v18 == v5;

    +[_UIKeyboardUsageTracking selectedPredictiveInputCandidate:isAutocorrection:index:](_UIKeyboardUsageTracking, "selectedPredictiveInputCandidate:isAutocorrection:index:", v5, v19, objc_msgSend(v21, "selectedIndex"));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v5, "candidateProperty") & 0x20) != 0)
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "input");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "displayedCandidates");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logEuclidSelection:suggestedTokens:correctedToken:selectedIndex:", v15, v20, v5, objc_msgSend(v21, "selectedIndex"));

    goto LABEL_9;
  }
LABEL_11:

}

- (TIAutocorrectionList)cachedAutocorrectionList
{
  return self->_cachedAutocorrectionList;
}

- (void)setCachedAutocorrectionList:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAutocorrectionList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAutocorrectionList, 0);
  objc_storeStrong((id *)&self->_predictionView, 0);
  objc_storeStrong((id *)&self->_lastUIUpdateTime, 0);
  objc_storeStrong((id *)&self->_updateUITimer, 0);
}

@end
