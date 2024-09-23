@implementation UIInlineTextCompletionController

- (unint64_t)currentInlineTextCompletionMode
{
  unint64_t v3;

  v3 = -[UIInlineTextCompletionController _inlineCompletionModeForTraitsWithCurrentPreference:](self, "_inlineCompletionModeForTraitsWithCurrentPreference:", -[UIInlineTextCompletionController _inlineCompletionPreference](self, "_inlineCompletionPreference"));
  if (-[UIInlineTextCompletionController hasForwardProgress](self, "hasForwardProgress"))
    return v3;
  else
    return 0;
}

- (BOOL)hasForwardProgress
{
  return self->_hasForwardProgress;
}

- (BOOL)_inlineCompletionPreference
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE388]))
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferencesActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE2C0]);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)removeTextCompletionPrompt
{
  -[UIInlineTextCompletionController _removeTextCompletionPromptForReason:](self, "_removeTextCompletionPromptForReason:", 1);
}

- (void)updateTextCompletionDisplay
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;

  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UIInlineTextCompletionController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputDelegateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasAsyncCapableInputDelegate");

    if ((v5 & 1) == 0
      && -[UIInlineTextCompletionController hasPrompt](self, "hasPrompt")
      && (-[UIInlineTextCompletionController delegate](self, "delegate"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "autocorrectionController"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "hasAutocorrection"),
          v7,
          v6,
          v8))
    {
      -[UIInlineTextCompletionController updateTextCompletionPrompt](self, "updateTextCompletionPrompt");
    }
    else
    {
      -[UIInlineTextCompletionController _touchTextCompletionPromptTimer](self, "_touchTextCompletionPromptTimer");
    }
  }
}

- (BOOL)hasPrompt
{
  void *v3;
  BOOL v4;

  if (!+[UIKeyboard presentsInlineTextCompletionAsMarkedText](UIKeyboard, "presentsInlineTextCompletionAsMarkedText"))return self->m_textCompletionPrompt != 0;
  -[UIInlineTextCompletionController presentingTextCompletionAsMarkedText](self, "presentingTextCompletionAsMarkedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void)_removeTextCompletionPromptForReason:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *m_textCompletionPrompt;
  void *v12;
  void *v13;
  _UIInlineTextCompletion *textCompletion;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UIInlineTextCompletionController _clearInlineCompletionCoachingTimer](self, "_clearInlineCompletionCoachingTimer");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissEducationTip");

    -[UIInlineTextCompletionController presentingTextCompletionAsMarkedText](self, "presentingTextCompletionAsMarkedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

LABEL_4:
      if (a3 == 5
        && !-[UIInlineTextCompletionController _isCompletion:continuingLastCompletion:](self, "_isCompletion:continuingLastCompletion:", 0, self->_textCompletion))
      {
        _UIKBInlineTextCompletionLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          _shortCompletionDescr(self->_textCompletion);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138412290;
          v17 = v8;
          _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Declining text completion (accepting predictive input): %@", (uint8_t *)&v16, 0xCu);

        }
      }
      -[UIInlineTextCompletionController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateKeyboardConfigurations");

      -[UIInlineTextCompletionController _clearTextCompletionPromptTimer](self, "_clearTextCompletionPromptTimer");
      if (+[UIKeyboard presentsInlineTextCompletionAsMarkedText](UIKeyboard, "presentsInlineTextCompletionAsMarkedText"))
      {
        -[UIInlineTextCompletionController presentingTextCompletionAsMarkedText](self, "presentingTextCompletionAsMarkedText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          -[UIInlineTextCompletionController presentingTextCompletionAsMarkedText](self, "presentingTextCompletionAsMarkedText");
          m_textCompletionPrompt = (void *)objc_claimAutoreleasedReturnValue();
          -[UIInlineTextCompletionController setPresentingTextCompletionAsMarkedText:](self, "setPresentingTextCompletionAsMarkedText:", 0);
          -[UIInlineTextCompletionController delegate](self, "delegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeTextCompletionFromMarkedText:", m_textCompletionPrompt);

LABEL_14:
        }
      }
      else
      {
        -[UIView superview](self->m_textCompletionPrompt, "superview");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[UIView removeFromSuperview](self->m_textCompletionPrompt, "removeFromSuperview");
          -[UIInlineTextCompletionPrompt setDelegate:](self->m_textCompletionPrompt, "setDelegate:", 0);
          m_textCompletionPrompt = self->m_textCompletionPrompt;
          self->m_textCompletionPrompt = 0;
          goto LABEL_14;
        }
      }
      -[UIInlineTextCompletionController setCandidateRemovedOnWillPerformOutput:](self, "setCandidateRemovedOnWillPerformOutput:", 0);
      textCompletion = self->_textCompletion;
      self->_textCompletion = 0;

      return;
    }
    -[UIInlineTextCompletionController acceptingTextCompletion](self, "acceptingTextCompletion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_4;
  }
}

- (unint64_t)_inlineCompletionModeForTraitsWithCurrentPreference:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  unint64_t v10;
  void *v11;
  char v12;
  char v13;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  void *v19;

  v3 = a3;
  -[UIInlineTextCompletionController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isDictationPaused") ^ 1;

  }
  else
  {
    v8 = 0;
  }
  v9 = +[UIScribbleInteraction isPencilInputExpected](UIScribbleInteraction, "isPencilInputExpected");
  v10 = 0;
  if ((v8 & 1) == 0 && !v9)
  {
    if (!+[UIKeyboard isInlineTextCompletionUIEnabled](UIKeyboard, "isInlineTextCompletionUIEnabled"))
    {
LABEL_13:
      v10 = 0;
      goto LABEL_14;
    }
    if (+[UIKeyboard presentsInlineTextCompletionAsMarkedText](UIKeyboard, "presentsInlineTextCompletionAsMarkedText"))
    {
      -[UIInlineTextCompletionController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "delegateSupportsCorrectionUI");

      v13 = v12 ^ 1;
    }
    else
    {
      v13 = 0;
    }
    v10 = 0;
    if ((v13 & 1) == 0 && v3)
    {
      if ((objc_msgSend(v6, "isSecureTextEntry") & 1) != 0)
        goto LABEL_13;
      v15 = objc_msgSend(v6, "keyboardType");
      v10 = 0;
      if ((v15 > 0xB || ((1 << v15) & 0x930) == 0) && v15 != 127)
      {
        v16 = objc_msgSend(v6, "inlinePredictionType");
        if (v16 == 2)
        {
          v10 = 1;
          goto LABEL_14;
        }
        if (v16)
          goto LABEL_13;
        -[UIInlineTextCompletionController delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "inlineTextCompletionAllowedForAutocorrectionType");

        objc_msgSend(v6, "textContentType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          v10 = 0;
        else
          v10 = v18;

      }
    }
  }
LABEL_14:

  return v10;
}

- (UIInlineTextCompletionControllerDelegate)delegate
{
  return (UIInlineTextCompletionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)presentingTextCompletionAsMarkedText
{
  return self->_presentingTextCompletionAsMarkedText;
}

- (void)setTextCompletionPromptTask:(id)a3
{
  objc_storeStrong((id *)&self->_textCompletionPromptTask, a3);
}

- (void)setInlineCompletionCoachingTask:(id)a3
{
  objc_storeStrong((id *)&self->_inlineCompletionCoachingTask, a3);
}

- (void)setCandidateRemovedOnWillPerformOutput:(id)a3
{
  objc_storeStrong((id *)&self->_candidateRemovedOnWillPerformOutput, a3);
}

- (_UIInlineTextCompletion)acceptingTextCompletion
{
  return self->_acceptingTextCompletion;
}

- (void)_clearInlineCompletionCoachingTimer
{
  void *v3;

  -[UIInlineTextCompletionController inlineCompletionCoachingTask](self, "inlineCompletionCoachingTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[UIInlineTextCompletionController setInlineCompletionCoachingTask:](self, "setInlineCompletionCoachingTask:", 0);
}

- (UIKeyboardScheduledTask)inlineCompletionCoachingTask
{
  return self->_inlineCompletionCoachingTask;
}

- (void)_touchTextCompletionPromptTimer
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  -[UIInlineTextCompletionController inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIInlineTextCompletionController textCompletionPromptTask](self, "textCompletionPromptTask");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isValid");

    if (v5)
    {
      -[UIInlineTextCompletionController textCompletionPromptTask](self, "textCompletionPromptTask");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resetTimer");

    }
    else
    {
      -[UIInlineTextCompletionController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "taskQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __67__UIInlineTextCompletionController__touchTextCompletionPromptTimer__block_invoke;
      v10[3] = &unk_1E16BAF98;
      v10[4] = self;
      -[UIInlineTextCompletionController _updatePromptDelay](self, "_updatePromptDelay");
      objc_msgSend(v7, "scheduleTask:timeInterval:repeats:", v10, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInlineTextCompletionController setTextCompletionPromptTask:](self, "setTextCompletionPromptTask:", v8);

    }
  }
}

- (void)_clearTextCompletionPromptTimer
{
  void *v3;

  -[UIInlineTextCompletionController textCompletionPromptTask](self, "textCompletionPromptTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[UIInlineTextCompletionController setTextCompletionPromptTask:](self, "setTextCompletionPromptTask:", 0);
}

- (UIKeyboardScheduledTask)textCompletionPromptTask
{
  return self->_textCompletionPromptTask;
}

- (UITextInput)inputDelegate
{
  void *v2;
  void *v3;
  void *v4;

  -[UIInlineTextCompletionController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInput *)v4;
}

- (double)_updatePromptDelay
{
  return 0.1;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAnalyticsDispatcher:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDispatcher, a3);
}

- (void)selectionDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  -[UIInlineTextCompletionController setHasForwardProgress:](self, "setHasForwardProgress:", 0);
  -[UIInlineTextCompletionController _removeTextCompletionPromptForReason:](self, "_removeTextCompletionPromptForReason:", 9);
  _UIKBInlineTextCompletionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "Selection changed", v4, 2u);
  }

}

- (void)setHasForwardProgress:(BOOL)a3
{
  self->_hasForwardProgress = a3;
}

- (id)_markedTextAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *(_QWORD *)off_1E1678D98;
  +[UIColor systemGrayColor](UIColor, "systemGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *(_QWORD *)off_1E1678C50;
  +[UIColor clearColor](UIColor, "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_doesFirstPredictedCharacterEndWord:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  char v19;

  v4 = a3;
  objc_msgSend(v4, "candidate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E16EDF20;
  if (v5)
    v8 = (__CFString *)v5;
  else
    v8 = &stru_1E16EDF20;
  v9 = v8;

  objc_msgSend(v4, "input");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v10;
  else
    v11 = &stru_1E16EDF20;
  v12 = v11;

  v13 = -[__CFString length](v9, "length");
  if (v13 > -[__CFString length](v12, "length"))
  {
    -[__CFString substringFromIndex:](v9, "substringFromIndex:", -[__CFString length](v12, "length"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  if (-[__CFString length](v7, "length")
    && (v14 = -[__CFString _rangeOfLongCharacterAtIndex:](v7, "_rangeOfLongCharacterAtIndex:", 0),
        v14 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[__CFString substringWithRange:](v7, "substringWithRange:", v14, v15);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = &stru_1E16EDF20;
  }

  if (-[__CFString length](v16, "length"))
  {
    -[UIInlineTextCompletionController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inputManagerState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "stringEndsWord:", v16);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_deleteToUndoEnabled
{
  return 0;
}

- (id)_oneWordTextCompletionFromTextCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "input");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__214;
    v23 = __Block_byref_object_dispose__214;
    v24 = 0;
    v7 = objc_msgSend(v6, "length");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__UIInlineTextCompletionController__oneWordTextCompletionFromTextCompletion___block_invoke;
    v15[3] = &unk_1E16E7BC0;
    v8 = v5;
    v16 = v8;
    v18 = &v19;
    v9 = v6;
    v17 = v9;
    objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 3, v15);
    if (objc_msgSend((id)v20[5], "length"))
    {
      objc_msgSend(v4, "completion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "candidateByReplacingWithCandidate:input:", v20[5], v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "completion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIInlineTextCompletion inlineTextCompletion:source:](_UIInlineTextCompletion, "inlineTextCompletion:source:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __77__UIInlineTextCompletionController__oneWordTextCompletionFromTextCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v9 = a3 + a4;
  if (a3 + a4 > (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "substringToIndex:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a7 = 1;
  }
}

- (id)_upToNextWordTextCompletionFromTextCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "input");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__214;
    v23 = __Block_byref_object_dispose__214;
    v24 = 0;
    v7 = objc_msgSend(v6, "length");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__UIInlineTextCompletionController__upToNextWordTextCompletionFromTextCompletion___block_invoke;
    v15[3] = &unk_1E16E7BC0;
    v8 = v5;
    v16 = v8;
    v18 = &v19;
    v9 = v6;
    v17 = v9;
    objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 3, v15);
    if (objc_msgSend((id)v20[5], "length"))
    {
      objc_msgSend(v4, "completion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "candidateByReplacingWithCandidate:input:", v20[5], v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "completion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIInlineTextCompletion inlineTextCompletion:source:](_UIInlineTextCompletion, "inlineTextCompletion:source:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __82__UIInlineTextCompletionController__upToNextWordTextCompletionFromTextCompletion___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if (a3 > objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "substringToIndex:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a7 = 1;
  }
}

- (_UIInlineTextCompletion)oneWordTextCompletion
{
  void *v3;
  void *v4;

  -[UIInlineTextCompletionController textCompletion](self, "textCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInlineTextCompletionController _oneWordTextCompletionFromTextCompletion:](self, "_oneWordTextCompletionFromTextCompletion:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIInlineTextCompletion *)v4;
}

- (id)_textCompletions
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  -[UIInlineTextCompletionController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasAutocorrection");

  v6 = (id)MEMORY[0x1E0C9AA60];
  if (v5)
  {
    -[UIInlineTextCompletionController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "autocorrectionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textCompletions");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v6;
    v6 = v11;

  }
  return v6;
}

- (id)_bestTextCompletion
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  void **p_vtable;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  __int128 v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[UIInlineTextCompletionController _textCompletions](self, "_textCompletions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (!v3)
    goto LABEL_29;
  v5 = v3;
  v6 = *(_QWORD *)v55;
  p_vtable = _UIFocusEnableOnSelectGestureRecognizer.vtable;
  *(_QWORD *)&v4 = 138412546;
  v47 = v4;
  v48 = *(_QWORD *)v55;
  v49 = v2;
  do
  {
    v8 = 0;
    v50 = v5;
    do
    {
      if (*(_QWORD *)v55 != v6)
        objc_enumerationMutation(v2);
      v9 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v8);
      objc_msgSend(v9, "candidate", v47);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "input");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lowercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "input");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "length"))
      {

LABEL_11:
        objc_msgSend(p_vtable + 472, "inlineTextCompletion:source:", v9, v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      v15 = objc_msgSend(v11, "hasPrefix:", v13);

      if ((v15 & 1) != 0)
        goto LABEL_11;
      v53 = v11;
      objc_msgSend(v9, "candidate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");
      objc_msgSend(v9, "input");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "length");

      if (v17 < v19)
      {

        p_vtable = (void **)(_UIFocusEnableOnSelectGestureRecognizer + 24);
        goto LABEL_13;
      }
      v21 = v9;
      objc_msgSend(v21, "input");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(" "));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v21;
      if ((unint64_t)objc_msgSend(v23, "count") >= 2)
      {
        objc_msgSend(v23, "lastObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "candidate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "candidateByReplacingWithCandidate:input:", v26, v25);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v51 = v21;
      v52 = v23;
      objc_msgSend(v24, "candidate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "length");
      objc_msgSend(v24, "input");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v28 - objc_msgSend(v29, "length");

      v31 = 0;
      while (1)
      {
        objc_msgSend(v24, "candidate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "substringFromIndex:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "lowercaseString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "input");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "lowercaseString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v34, "hasPrefix:", v36);

        if (v37)
          break;

        if (++v31 > v30)
          goto LABEL_24;
      }
      objc_msgSend(v24, "input");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "candidateByReplacingWithCandidate:input:", v33, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      +[_UIInlineTextCompletion inlineTextCompletion:source:](_UIInlineTextCompletion, "inlineTextCompletion:source:", v39, v51);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _UIKBInlineTextCompletionLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        _shortCandidateDescr(v51);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        _shortCompletionDescr(v20);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v47;
        v59 = v41;
        v60 = 2112;
        v61 = v42;
        _os_log_impl(&dword_185066000, v40, OS_LOG_TYPE_DEFAULT, "NOTICE: text completion with mismatched input was reconciled with contextBeforeInput\n    original=%@\n    reconciled=%@", buf, 0x16u);

      }
      if (!v20)
      {
LABEL_24:
        _UIKBInlineTextCompletionLog();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          _shortCandidateDescr(v51);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v59 = v44;
          _os_log_impl(&dword_185066000, v43, OS_LOG_TYPE_DEFAULT, "WARNING: text completion with mismatched input could not be reconciled with contextBeforeInput\n    %@", buf, 0xCu);

        }
        v20 = 0;
      }

      v6 = v48;
      v2 = v49;
      v5 = v50;
      p_vtable = (void **)(_UIFocusEnableOnSelectGestureRecognizer + 24);
      v11 = v53;
LABEL_12:

      if (v20)
        goto LABEL_30;
LABEL_13:
      ++v8;
    }
    while (v8 != v5);
    v45 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    v5 = v45;
  }
  while (v45);
LABEL_29:
  v20 = 0;
LABEL_30:

  return v20;
}

- (void)updateTextCompletionWithExternalSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "inputText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      objc_msgSend(v5, "_keyboardCandidate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_keyboardCandidate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIInlineTextCompletion inlineTextCompletion:source:](_UIInlineTextCompletion, "inlineTextCompletion:source:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIInlineTextCompletionController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "taskQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __79__UIInlineTextCompletionController_updateTextCompletionWithExternalSuggestion___block_invoke;
      v14[3] = &unk_1E16BB0D8;
      v14[4] = self;
      v15 = v10;
      v13 = v10;
      objc_msgSend(v12, "performSingleTask:", v14);

    }
  }

}

uint64_t __79__UIInlineTextCompletionController_updateTextCompletionWithExternalSuggestion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTextCompletionPrompt:executionContext:", *(_QWORD *)(a1 + 40), a2);
}

- (id)textCompletionPrompt
{
  return self->m_textCompletionPrompt;
}

- (BOOL)_isCompletion:(id)a3 continuingLastCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if ((v6 != 0) == (v7 == 0))
    goto LABEL_6;
  if (v6 != v7)
  {
    objc_msgSend(v7, "candidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "hasSuffix:", v10);

    if (v11)
    {
      objc_msgSend(v6, "input");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "input");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "hasPrefix:", v13);

      if ((v14 & 1) != 0)
        goto LABEL_5;
      -[UIInlineTextCompletionController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "documentState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "contextBeforeInput");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "input");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length"))
        goto LABEL_9;
      v21 = objc_msgSend(v19, "length");
      objc_msgSend(v8, "input");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "length");

      if (v21 < v23)
      {
        v15 = 0;
        goto LABEL_11;
      }
      objc_msgSend(v8, "candidate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsSeparatedByString:", CFSTR(" "));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "firstObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
LABEL_9:
        v15 = 0;
      }
      else
      {
        v26 = (void *)v25;
        objc_msgSend(v8, "input");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "hasPrefix:", v27))
          v15 = objc_msgSend(v19, "hasSuffix:", v26);
        else
          v15 = 0;

      }
LABEL_11:

      goto LABEL_7;
    }
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
LABEL_5:
  v15 = 1;
LABEL_7:

  return v15;
}

+ (id)_documentTextThroughSelection:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(v3, "contextBeforeInput");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E16EDF20;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(v3, "markedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    objc_msgSend(v3, "markedText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v3, "selectedRangeInMarkedText");
    objc_msgSend(v10, "substringWithRange:", 0, v11 + v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v13);
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v15;
    goto LABEL_8;
  }
  objc_msgSend(v3, "selectedText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v3, "selectedText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (void)willPerformKeyboardOutput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  if (!-[UIInlineTextCompletionController _deleteToUndoEnabled](self, "_deleteToUndoEnabled"))
  {
    -[UIInlineTextCompletionController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (_outputIsSimpleDeletion(v19)
      || (objc_msgSend(v5, "selectedText"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "length"),
          v6,
          v7))
    {
      -[UIInlineTextCompletionController setHasForwardProgress:](self, "setHasForwardProgress:", 0);
      -[UIInlineTextCompletionController lastAcceptedTextCompletion](self, "lastAcceptedTextCompletion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend((id)objc_opt_class(), "_documentTextThroughSelection:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInlineTextCompletionController lastAcceptedTextCompletion](self, "lastAcceptedTextCompletion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "candidate");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        v13 = &stru_1E16EDF20;
        if (v11)
          v13 = (__CFString *)v11;
        v14 = v13;

        v15 = objc_msgSend(v9, "hasSuffix:", v14);
        if (v15)
        {
          -[UIInlineTextCompletionController lastAcceptedTextCompletion](self, "lastAcceptedTextCompletion");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIInlineTextCompletionController _registerLearningForInlineCompletion:learningMode:](self, "_registerLearningForInlineCompletion:learningMode:", v16, *MEMORY[0x1E0DBE4C8]);

          -[UIInlineTextCompletionController setLastAcceptedTextCompletion:](self, "setLastAcceptedTextCompletion:", 0);
        }

      }
    }

  }
  if (+[UIKeyboard presentsInlineTextCompletionAsMarkedText](UIKeyboard, "presentsInlineTextCompletionAsMarkedText"))
  {
    -[UIInlineTextCompletionController presentingTextCompletionAsMarkedText](self, "presentingTextCompletionAsMarkedText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[UIInlineTextCompletionController textCompletion](self, "textCompletion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInlineTextCompletionController _removeTextCompletionPromptForReason:](self, "_removeTextCompletionPromptForReason:", 7);
      -[UIInlineTextCompletionController setCandidateRemovedOnWillPerformOutput:](self, "setCandidateRemovedOnWillPerformOutput:", v18);

    }
  }

}

- (void)didPerformKeyboardOutput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIInlineTextCompletionController setDeleting:](self, "setDeleting:", _outputIsSimpleDeletion(v4));
  objc_msgSend(v4, "insertionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
    -[UIInlineTextCompletionController setHasForwardProgress:](self, "setHasForwardProgress:", 1);
  -[UIInlineTextCompletionController candidateRemovedOnWillPerformOutput](self, "candidateRemovedOnWillPerformOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInlineTextCompletionController setCandidateRemovedOnWillPerformOutput:](self, "setCandidateRemovedOnWillPerformOutput:", 0);
  if (v7)
  {
    v8 = v4;
    objc_msgSend(v8, "insertionText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (!v10 || objc_msgSend(v8, "deletionCount") || objc_msgSend(v8, "forwardDeletionCount"))
    {

    }
    else
    {
      objc_msgSend(v8, "acceptedCandidate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(v7, "candidate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");
        objc_msgSend(v7, "input");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        if (v13 > v15)
        {
          objc_msgSend(v7, "candidate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "input");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "substringFromIndex:", objc_msgSend(v17, "length"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = objc_msgSend(v18, "length");
          objc_msgSend(v8, "insertionText");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "length");

          if (v19 > v21)
          {
            objc_msgSend(v8, "insertionText");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v18, "hasPrefix:", v22);

            if ((v23 & 1) != 0)
            {
              objc_msgSend(v7, "input");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "insertionText");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "stringByAppendingString:", v25);
              v26 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "completion");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "candidate");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "candidateByReplacingWithCandidate:input:", v28, v26);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "source");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              +[_UIInlineTextCompletion inlineTextCompletion:source:](_UIInlineTextCompletion, "inlineTextCompletion:source:", v29, v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              _UIKBInlineTextCompletionLog();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                _shortCompletionDescr(v7);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                _shortCompletionDescr(v31);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v42 = v37;
                v43 = 2112;
                v44 = v38;
                _os_log_debug_impl(&dword_185066000, v32, OS_LOG_TYPE_DEBUG, "Last text completion remains valid after output: Last=%@, Updated=%@", buf, 0x16u);

              }
              -[UIInlineTextCompletionController delegate](self, "delegate");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "taskQueue");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v39[0] = MEMORY[0x1E0C809B0];
              v39[1] = 3221225472;
              v39[2] = __61__UIInlineTextCompletionController_didPerformKeyboardOutput___block_invoke;
              v39[3] = &unk_1E16BB0D8;
              v39[4] = self;
              v40 = v31;
              v35 = v31;
              objc_msgSend(v34, "performSingleTask:", v39);

            }
            else
            {
              _UIKBInlineTextCompletionLog();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                _shortCompletionDescr(v7);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v42 = v36;
                _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_DEFAULT, "Declining last text completion (output does not match completion text): %@", buf, 0xCu);

              }
            }

          }
        }
      }
    }
  }

}

uint64_t __61__UIInlineTextCompletionController_didPerformKeyboardOutput___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTextCompletionPrompt:executionContext:", *(_QWORD *)(a1 + 40), a2);
}

- (void)willAcceptPredictiveInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  char v22;
  NSObject *v23;
  UIInlineTextCompletionController *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  _BOOL4 v39;
  _QWORD *v40;
  uint64_t v41;
  uint8_t v42[16];
  uint8_t v43[16];
  uint8_t v44[16];
  uint8_t buf[16];

  v4 = a3;
  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UIInlineTextCompletionController acceptingTextCompletion](self, "acceptingTextCompletion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[UIInlineTextCompletionController textCompletion](self, "textCompletion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[UIInlineTextCompletionController textCompletion](self, "textCompletion");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInlineTextCompletionController _oneWordTextCompletionFromTextCompletion:](self, "_oneWordTextCompletionFromTextCompletion:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "candidate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "candidate");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (const __CFString *)v10;
        else
          v12 = &stru_1E16EDF20;
        if (objc_msgSend(v9, "isEqualToString:", v12))
        {
          objc_msgSend(v8, "input");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "input");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          if (v14)
            v16 = (const __CFString *)v14;
          else
            v16 = &stru_1E16EDF20;
          v17 = objc_msgSend(v13, "isEqualToString:", v16);

        }
        else
        {
          v17 = 0;
        }

        objc_msgSend(v4, "input");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "candidate");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v19)
          v21 = (const __CFString *)v19;
        else
          v21 = &stru_1E16EDF20;
        v22 = objc_msgSend(v18, "isEqualToString:", v21);

        if (v17)
        {
          _UIKBInlineTextCompletionLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_185066000, v23, OS_LOG_TYPE_DEBUG, "Accepted text completion by selecting from prediction bar", buf, 2u);
          }

          -[UIInlineTextCompletionController _registerLearningForInlineCompletion:learningMode:](self, "_registerLearningForInlineCompletion:learningMode:", v8, *MEMORY[0x1E0DBE488]);
          v24 = self;
          v25 = 2;
        }
        else
        {
          if ((v22 & 1) == 0)
          {
            objc_msgSend(v4, "candidate");
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = (void *)v27;
            if (v27)
              v29 = (__CFString *)v27;
            else
              v29 = &stru_1E16EDF20;
            v30 = v29;

            objc_msgSend(v8, "input");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "stringByAppendingString:", v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "componentsSeparatedByCharactersInSet:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "candidate");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v35, "componentsSeparatedByCharactersInSet:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v36) = objc_msgSend(v34, "isEqual:", v37);
            _UIKBInlineTextCompletionLog();
            v38 = objc_claimAutoreleasedReturnValue();
            v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
            if ((_DWORD)v36)
            {
              if (v39)
              {
                *(_WORD *)v44 = 0;
                _os_log_debug_impl(&dword_185066000, v38, OS_LOG_TYPE_DEBUG, "Accepted text completion by selecting from prediction bar", v44, 2u);
              }
              v40 = (_QWORD *)MEMORY[0x1E0DBE488];
              v41 = 5;
            }
            else
            {
              if (v39)
              {
                *(_WORD *)v43 = 0;
                _os_log_debug_impl(&dword_185066000, v38, OS_LOG_TYPE_DEBUG, "Rejected text completion by selecting typed string from prediction bar", v43, 2u);
              }
              v40 = (_QWORD *)MEMORY[0x1E0DBE4D0];
              v41 = 6;
            }

            -[UIInlineTextCompletionController _registerLearningForInlineCompletion:learningMode:](self, "_registerLearningForInlineCompletion:learningMode:", v8, *v40);
            -[UIInlineTextCompletionController _removeTextCompletionPromptForReason:](self, "_removeTextCompletionPromptForReason:", v41);

            goto LABEL_36;
          }
          _UIKBInlineTextCompletionLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v42 = 0;
            _os_log_debug_impl(&dword_185066000, v26, OS_LOG_TYPE_DEBUG, "Rejected text completion by selecting other candidate from prediction bar", v42, 2u);
          }

          -[UIInlineTextCompletionController _registerLearningForInlineCompletion:learningMode:](self, "_registerLearningForInlineCompletion:learningMode:", v8, *MEMORY[0x1E0DBE4D0]);
          v24 = self;
          v25 = 5;
        }
        -[UIInlineTextCompletionController _removeTextCompletionPromptForReason:](v24, "_removeTextCompletionPromptForReason:", v25);
LABEL_36:

      }
    }
  }

}

- (BOOL)_isRejectionWhenRemovingPromptForReason:(int64_t)a3
{
  return a3 == 8 || a3 == 5;
}

void __67__UIInlineTextCompletionController__touchTextCompletionPromptTimer__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hasAutocorrection")
    && (objc_msgSend(v4, "textCompletions"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "_bestTextCompletion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_updateTextCompletionPrompt:executionContext:", v6, v7);

  }
  else
  {
    objc_msgSend(v7, "returnExecutionToParent");
  }

}

- (void)_touchInlineCompletionCoachingTimer
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  -[UIInlineTextCompletionController inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIInlineTextCompletionController inlineCompletionCoachingTask](self, "inlineCompletionCoachingTask");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isValid");

    if (v5)
    {
      -[UIInlineTextCompletionController inlineCompletionCoachingTask](self, "inlineCompletionCoachingTask");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resetTimer");

    }
    else
    {
      -[UIInlineTextCompletionController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "taskQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __71__UIInlineTextCompletionController__touchInlineCompletionCoachingTimer__block_invoke;
      v10[3] = &unk_1E16BAF98;
      v10[4] = self;
      objc_msgSend(v7, "scheduleTask:timeInterval:repeats:", v10, 0, 2.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInlineTextCompletionController setInlineCompletionCoachingTask:](self, "setInlineCompletionCoachingTask:", v8);

    }
  }
}

void __71__UIInlineTextCompletionController__touchInlineCompletionCoachingTimer__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hasAutocorrection")
    && (objc_msgSend(v4, "textCompletions"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentInlineTextCompletionCoachingUIWithExecutionContext:", v6);
  }
  else
  {
    objc_msgSend(v6, "returnExecutionToParent");
  }

}

- (void)updateTextCompletionPrompt
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[UIInlineTextCompletionController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "taskQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__UIInlineTextCompletionController_updateTextCompletionPrompt__block_invoke;
  v5[3] = &unk_1E16BAF98;
  v5[4] = self;
  objc_msgSend(v4, "performSingleTask:", v5);

}

uint64_t __62__UIInlineTextCompletionController_updateTextCompletionPrompt__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateTextCompletionPromptExecutionContext:", a2);
}

- (void)updateTextCompletionPromptExecutionContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    goto LABEL_2;
  -[UIInlineTextCompletionController presentingTextCompletionAsMarkedText](self, "presentingTextCompletionAsMarkedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    goto LABEL_5;
  }
  -[UIInlineTextCompletionController acceptingTextCompletion](self, "acceptingTextCompletion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_5:
    -[UIInlineTextCompletionController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autocorrectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "textCompletions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (-[UIInlineTextCompletionController hasPrompt](self, "hasPrompt"))
      {
        -[UIInlineTextCompletionController _bestTextCompletion](self, "_bestTextCompletion");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInlineTextCompletionController _updateTextCompletionPrompt:executionContext:](self, "_updateTextCompletionPrompt:executionContext:", v8, v10);

LABEL_12:
        goto LABEL_13;
      }
      -[UIInlineTextCompletionController _touchTextCompletionPromptTimer](self, "_touchTextCompletionPromptTimer");
    }
    objc_msgSend(v10, "returnExecutionToParent");
    goto LABEL_12;
  }
LABEL_2:
  objc_msgSend(v10, "returnExecutionToParent");
LABEL_13:

}

- (void)_updateTextCompletionPrompt:(id)a3 executionContext:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  NSObject *v17;
  UIInlineTextCompletionController *v18;
  uint64_t v19;
  _UIInlineTextCompletion *textCompletion;
  _UIInlineTextCompletion **p_textCompletion;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  NSObject *v31;
  id *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  NSObject *v48;
  const char *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  UIInlineTextCompletionController *v53;
  uint64_t v54;
  void *v55;
  int v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  __CFString *v74;
  _QWORD aBlock[4];
  id v76;
  __CFString *v77;
  UIInlineTextCompletionController *v78;
  id v79;
  uint8_t buf[4];
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "candidate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (__CFString *)v9;
  else
    v11 = &stru_1E16EDF20;
  v12 = v11;

  objc_msgSend(v7, "input");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (__CFString *)v13;
  else
    v15 = &stru_1E16EDF20;
  v16 = v15;

  -[UIInlineTextCompletionController setCandidateRemovedOnWillPerformOutput:](self, "setCandidateRemovedOnWillPerformOutput:", 0);
  -[UIInlineTextCompletionController _clearTextCompletionPromptTimer](self, "_clearTextCompletionPromptTimer");
  if (-[__CFString length](v12, "length")
    && !-[__CFString isEqualToString:](v12, "isEqualToString:", v16))
  {
    p_textCompletion = &self->_textCompletion;
    textCompletion = self->_textCompletion;
    if (textCompletion)
    {
      -[_UIInlineTextCompletion candidate](textCompletion, "candidate");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
        v24 = (__CFString *)v22;
      else
        v24 = &stru_1E16EDF20;
      v25 = v24;

      -[_UIInlineTextCompletion input](*p_textCompletion, "input");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v16;
      v28 = (void *)v26;
      if (v26)
        v29 = (__CFString *)v26;
      else
        v29 = &stru_1E16EDF20;
      v30 = v29;

      v16 = v27;
      if (-[__CFString isEqualToString:](v25, "isEqualToString:", v12)
        && -[__CFString isEqualToString:](v30, "isEqualToString:", v27))
      {
        objc_msgSend(v8, "returnExecutionToParent");

        goto LABEL_15;
      }

      p_textCompletion = &self->_textCompletion;
    }
    _UIKBInlineTextCompletionLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      _shortCompletionDescr(v7);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v81 = v50;
      _os_log_debug_impl(&dword_185066000, v31, OS_LOG_TYPE_DEBUG, "Trying to present inline text completion: %@", buf, 0xCu);

    }
    if (!-[UIInlineTextCompletionController hasForwardProgress](self, "hasForwardProgress"))
    {
      _UIKBInlineTextCompletionLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_DEFAULT, "Will not present text completion (no forward progress)", buf, 2u);
      }

      v18 = self;
      v19 = 9;
      goto LABEL_14;
    }
    v32 = (id *)p_textCompletion;
    -[UIInlineTextCompletionController delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "documentState");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "markedText");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "length"))
    {

LABEL_36:
      _UIKBInlineTextCompletionLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_DEFAULT, "Will not present text completion (selected or marked text is not empty)", buf, 2u);
      }

      -[UIInlineTextCompletionController _removeTextCompletionPromptForReason:](self, "_removeTextCompletionPromptForReason:", 10);
      objc_msgSend(v8, "returnExecutionToParent");
      goto LABEL_39;
    }
    objc_msgSend(v34, "selectedText");
    v74 = v16;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "length");

    v16 = v74;
    if (v38)
      goto LABEL_36;
    objc_msgSend(v34, "contextAfterInput");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringByTrimmingCharactersInSet:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v42, "length"))
    {
      v43 = objc_msgSend(v42, "_firstLongCharacter");
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v43) = objc_msgSend(v44, "longCharacterIsMember:", v43);

      if ((v43 & 1) == 0)
      {
        _UIKBInlineTextCompletionLog();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v51, OS_LOG_TYPE_DEFAULT, "Will not present text completion: contextAfterInput is not empty and has non-whitespace characters before the first newline", buf, 2u);
        }

        -[UIInlineTextCompletionController _removeTextCompletionPromptForReason:](self, "_removeTextCompletionPromptForReason:", 10);
        goto LABEL_62;
      }
    }
    -[UIInlineTextCompletionController inputDelegate](self, "inputDelegate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v45)
    {
      _UIKBInlineTextCompletionLog();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v52, OS_LOG_TYPE_DEFAULT, "Will not present text completion: no input delegate", buf, 2u);
      }

      v53 = self;
      v54 = 13;
      goto LABEL_61;
    }
    -[UIInlineTextCompletionController delegate](self, "delegate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "isSelecting");

    if (v47)
    {
      _UIKBInlineTextCompletionLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v49 = "Will not present text completion: user is selecting text";
LABEL_56:
        _os_log_impl(&dword_185066000, v48, OS_LOG_TYPE_DEFAULT, v49, buf, 2u);
      }
    }
    else
    {
      if (!-[UIInlineTextCompletionController currentInlineTextCompletionMode](self, "currentInlineTextCompletionMode"))
      {
        _UIKBInlineTextCompletionLog();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v57, OS_LOG_TYPE_DEFAULT, "Will not present text completion: inline completion text completion mode for traits is NO", buf, 2u);
        }

        v53 = self;
        v54 = 12;
        goto LABEL_61;
      }
      -[UIInlineTextCompletionController delegate](self, "delegate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "showingEmojiSearch");

      if (!v56)
      {
        if (!+[UIKeyboard presentsInlineTextCompletionAsMarkedText](UIKeyboard, "presentsInlineTextCompletionAsMarkedText"))
        {
          -[UIInlineTextCompletionController delegate](self, "delegate");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "inputDelegateManager");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "asyncCapableInputDelegate");
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = v74;
          if (v67)
          {
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke;
            aBlock[3] = &unk_1E16BB1C0;
            v76 = v67;
            v77 = v74;
            v78 = self;
            v79 = v7;
            v68 = _Block_copy(aBlock);
            -[UIInlineTextCompletionController delegate](self, "delegate");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "taskQueue");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "addTask:", v68);

            objc_msgSend(v8, "returnExecutionToParent");
            v71 = v76;
          }
          else
          {
            -[UIInlineTextCompletionController _textCompletionPromptRectsForInput:](self, "_textCompletionPromptRectsForInput:", v74);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIInlineTextCompletionController _updateTextCompletionPrompt:inputRects:](self, "_updateTextCompletionPrompt:inputRects:", v7, v71);
            objc_msgSend(v8, "returnExecutionToParent");
          }

          goto LABEL_64;
        }
        -[__CFString substringFromIndex:](v12, "substringFromIndex:", -[__CFString length](v74, "length"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        _UIKBInlineTextCompletionLog();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          _shortCompletionDescr(v7);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v81 = v59;
          _os_log_impl(&dword_185066000, v58, OS_LOG_TYPE_DEFAULT, "Presenting inline text completion now: %@", buf, 0xCu);

        }
        v60 = objc_alloc(MEMORY[0x1E0CB3498]);
        -[UIInlineTextCompletionController _markedTextAttributes](self, "_markedTextAttributes");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = (void *)objc_msgSend(v60, "initWithString:attributes:", v73, v61);

        objc_msgSend(MEMORY[0x1E0D871C8], "intermediateTextWithInputString:displayString:selectionLocation:", v73, v72, 0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInlineTextCompletionController setPresentingTextCompletionAsMarkedText:](self, "setPresentingTextCompletionAsMarkedText:", v73);
        objc_storeStrong(v32, a3);
        -[UIInlineTextCompletionController delegate](self, "delegate");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "presentTextCompletionAsMarkedText:", v62);

        -[UIInlineTextCompletionController delegate](self, "delegate");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "removeAutocorrectPrompt");

        -[UIInlineTextCompletionController _touchInlineCompletionCoachingTimer](self, "_touchInlineCompletionCoachingTimer");
        objc_msgSend(v8, "returnExecutionToParent");

LABEL_63:
        v16 = v74;
LABEL_64:

LABEL_39:
        goto LABEL_15;
      }
      _UIKBInlineTextCompletionLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v49 = "Will not present text completion: showing emoji search";
        goto LABEL_56;
      }
    }

    v53 = self;
    v54 = 11;
LABEL_61:
    -[UIInlineTextCompletionController _removeTextCompletionPromptForReason:](v53, "_removeTextCompletionPromptForReason:", v54);
LABEL_62:
    objc_msgSend(v8, "returnExecutionToParent");
    goto LABEL_63;
  }
  if (self->_textCompletion)
  {
    _UIKBInlineTextCompletionLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "Removing text completion prompt (text completion is nil/empty)", buf, 2u);
    }

  }
  v18 = self;
  v19 = 4;
LABEL_14:
  -[UIInlineTextCompletionController _removeTextCompletionPromptForReason:](v18, "_removeTextCompletionPromptForReason:", v19);
  objc_msgSend(v8, "returnExecutionToParent");
LABEL_15:

}

void __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke_2;
  v9[3] = &unk_1E16E7BE8;
  v6 = a1[6];
  v7 = (void *)a1[7];
  v10 = v3;
  v11 = v6;
  v12 = v7;
  v8 = v3;
  objc_msgSend(v4, "requestAutocorrectionRectsForString:withCompletionHandler:", v5, v9);

}

void __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke_3;
  v7[3] = &unk_1E16BB128;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v5, "transferExecutionToMainThreadWithTask:", v7);

}

void __81__UIInlineTextCompletionController__updateTextCompletionPrompt_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v17 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "firstRect");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 32), "lastRect");
    objc_msgSend(v3, "textCompletionInputRectsFromFirstRect:lastRect:", v5, v7, v9, v11, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateTextCompletionPrompt:inputRects:", *(_QWORD *)(a1 + 48), v16);
  objc_msgSend(v17, "returnExecutionToParent");

}

- (id)_textCompletionPromptRectsForInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;

  v4 = a3;
  -[UIInlineTextCompletionController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rangeForTextCompletionInput:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((objc_msgSend(v6, "isEmpty") & 1) == 0)
    {
      -[UIInlineTextCompletionController inputDelegate](self, "inputDelegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstRectForRange:", v6);
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;

      -[UIInlineTextCompletionController inputDelegate](self, "inputDelegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_lastRectForRange:", v6);
      v39 = v38;
      v41 = v40;
      v43 = v42;
      v45 = v44;

      -[UIInlineTextCompletionController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = v30;
      v20 = v32;
      v21 = v34;
      v22 = v36;
      v23 = v39;
      v24 = v41;
      v25 = v43;
      v26 = v45;
      goto LABEL_7;
    }
    if (objc_msgSend(v6, "isEmpty"))
    {
      -[UIInlineTextCompletionController inputDelegate](self, "inputDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "start");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "caretRectForPosition:", v8);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      -[UIInlineTextCompletionController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = v10;
      v20 = v12;
      v21 = v14;
      v22 = v16;
      v23 = v10;
      v24 = v12;
      v25 = v14;
      v26 = v16;
LABEL_7:
      objc_msgSend(v17, "textCompletionInputRectsFromFirstRect:lastRect:", v19, v20, v21, v22, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }
  v27 = 0;
LABEL_8:

  return v27;
}

- (void)_updateTextCompletionPrompt:(id)a3 inputRects:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  NSObject *v19;
  const char *v20;
  uint8_t *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint8_t v26[16];
  __int16 v27;
  uint8_t buf[2];
  CGRect v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "candidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "input");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    _UIKBInlineTextCompletionLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v20 = "Will not present text completion: missing rects for input text";
      v21 = buf;
      goto LABEL_7;
    }
LABEL_8:

    -[UIInlineTextCompletionController _removeTextCompletionPromptForReason:](self, "_removeTextCompletionPromptForReason:", 13);
    goto LABEL_15;
  }
  objc_msgSend(v7, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v29.origin.x = v12;
  v29.origin.y = v14;
  v29.size.width = v16;
  v29.size.height = v18;
  if (CGRectIsEmpty(v29))
  {
    _UIKBInlineTextCompletionLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 0;
      v20 = "Will not present text completion: input rect is empty";
      v21 = (uint8_t *)&v27;
LABEL_7:
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_DEFAULT, v20, v21, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  -[UIInlineTextCompletionController delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "inputOverlayContainer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[UIInlineTextCompletionController delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "updateKeyboardConfigurations");

    -[UIInlineTextCompletionController _updateTextCompletionPromptWithTextCompletion:parentView:inputRects:](self, "_updateTextCompletionPromptWithTextCompletion:parentView:inputRects:", v6, v23, v7);
  }
  else
  {
    _UIKBInlineTextCompletionLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_DEFAULT, "Will not present text completion: no input overlay container", v26, 2u);
    }

    -[UIInlineTextCompletionController _removeTextCompletionPromptForReason:](self, "_removeTextCompletionPromptForReason:", 13);
  }

LABEL_15:
}

- (void)_updateTextCompletionPromptWithTextCompletion:(id)a3 parentView:(id)a4 inputRects:(id)a5
{
  _UIInlineTextCompletion *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  void *v17;
  UIInlineTextCompletionPrompt *m_textCompletionPrompt;
  id v19;
  UIInlineTextCompletionPrompt *v20;
  UIInlineTextCompletionPrompt *v21;
  UIInlineTextCompletionPrompt *v22;
  UIInlineTextCompletionPrompt *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UIInlineTextCompletionPrompt *v35;
  void *v36;
  _UIInlineTextCompletion *textCompletion;
  uint8_t v38[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = (_UIInlineTextCompletion *)a3;
  v9 = a4;
  v10 = a5;
  -[_UIInlineTextCompletion candidate](v8, "candidate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInlineTextCompletion input](v8, "input");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIInlineTextCompletionController _isCompletion:continuingLastCompletion:](self, "_isCompletion:continuingLastCompletion:", v8, self->_textCompletion))
  {
    _UIKBInlineTextCompletionLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    _shortCompletionDescr(v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v38 = 138412290;
    *(_QWORD *)&v38[4] = v14;
    v15 = "Continuing presentation of text completion: %@";
    goto LABEL_10;
  }
  if (self->_textCompletion)
  {
    _UIKBInlineTextCompletionLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      _shortCompletionDescr(self->_textCompletion);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v38 = 138412290;
      *(_QWORD *)&v38[4] = v17;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "User ignored discontinued text completion: %@", v38, 0xCu);

    }
  }
  _UIKBInlineTextCompletionLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    _shortCompletionDescr(v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v38 = 138412290;
    *(_QWORD *)&v38[4] = v14;
    v15 = "Presenting user with new text completion: %@";
LABEL_10:
    _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, v15, v38, 0xCu);

  }
LABEL_11:

  m_textCompletionPrompt = self->m_textCompletionPrompt;
  if (m_textCompletionPrompt)
  {
    -[UIView superview](m_textCompletionPrompt, "superview");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19 == v9)
      goto LABEL_16;
  }
  else
  {
    v20 = [UIInlineTextCompletionPrompt alloc];
    v21 = -[UIInlineTextCompletionPrompt initWithFrame:](v20, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v22 = self->m_textCompletionPrompt;
    self->m_textCompletionPrompt = v21;

    -[UIInlineTextCompletionPrompt setDelegate:](self->m_textCompletionPrompt, "setDelegate:", self);
  }
  objc_msgSend(v9, "addSubview:", self->m_textCompletionPrompt, *(_OWORD *)v38);
LABEL_16:
  v23 = self->m_textCompletionPrompt;
  -[UIInlineTextCompletionController inputDelegate](self, "inputDelegate", *(_OWORD *)v38);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "textInputView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_convertVisualAltitude:toView:", self->m_textCompletionPrompt, 0.0);
  -[UIView _setVisualAltitude:](v23, "_setVisualAltitude:");

  objc_msgSend(v10, "lastObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "rect");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v35 = self->m_textCompletionPrompt;
  -[_UIInlineTextCompletion completion](v8, "completion");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInlineTextCompletionPrompt setTextCompletion:inRect:](v35, "setTextCompletion:inRect:", v36, v28, v30, v32, v34);

  -[UIView setSize:](self->m_textCompletionPrompt, "setSize:", v32, v34);
  textCompletion = self->_textCompletion;
  self->_textCompletion = v8;

}

- (void)_presentInlineTextCompletionCoachingUIWithExecutionContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[UIInlineTextCompletionController _clearInlineCompletionCoachingTimer](self, "_clearInlineCompletionCoachingTimer");
  if (-[UIInlineTextCompletionController _shouldShowInlineTextCompletionCoachingUI](self, "_shouldShowInlineTextCompletionCoachingUI"))
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("Inline Predictions"), CFSTR("Inline Predictions"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UINSLocalizedStringWithDefaultValue(CFSTR("Press space to input predictive text."), CFSTR("Press space to input predictive text."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentEducationTipWithTitle:description:", v4, v5);

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferencesActions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didTriggerOneTimeAction:", CFSTR("DidShowInlineCompletionEducationTip"));

  }
  objc_msgSend(v9, "returnExecutionToParent");

}

- (BOOL)_shouldShowInlineTextCompletionCoachingUI
{
  void *v2;
  void *v3;
  char v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "oneTimeActionCompleted:", CFSTR("DidShowInlineCompletionEducationTip"));

  if ((v4 & 1) != 0)
    return 0;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferencesActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForPreferenceKey:", CFSTR("InlineCompletionAcceptedBySpaceEventCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  return v9 < 3;
}

- (void)_acceptTextCompletion:(id)a3 learningMode:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    _UIKBInlineTextCompletionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      _shortCompletionDescr(v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "User accepted text completion: %@", (uint8_t *)&v13, 0xCu);

    }
    -[UIInlineTextCompletionController setAcceptingTextCompletion:](self, "setAcceptingTextCompletion:", v6);
    if ((id)*MEMORY[0x1E0DBE490] == v7)
    {
      -[UIInlineTextCompletionController analyticsDispatcher](self, "analyticsDispatcher");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNextCandidateReplacementSource:", 7);

    }
    -[UIInlineTextCompletionController _registerLearningForInlineCompletion:learningMode:](self, "_registerLearningForInlineCompletion:learningMode:", v6, v7);
    -[UIInlineTextCompletionController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "completion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "acceptPredictiveInput:", v12);

    -[UIInlineTextCompletionController setAcceptingTextCompletion:](self, "setAcceptingTextCompletion:", 0);
    -[UIInlineTextCompletionController setLastAcceptedTextCompletion:](self, "setLastAcceptedTextCompletion:", v6);
    -[UIInlineTextCompletionController _removeTextCompletionPromptForReason:](self, "_removeTextCompletionPromptForReason:", 2);
  }

}

- (BOOL)_shouldAcceptFirstWordOfCandidateForWordTerminator:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (qword_1ECD81D58 != -1)
    dispatch_once(&qword_1ECD81D58, &__block_literal_global_585);
  if (+[UIKeyboard doesSpacebarAcceptFullInlineTextCompletion](UIKeyboard, "doesSpacebarAcceptFullInlineTextCompletion"))
  {
    return 0;
  }
  else
  {
    return objc_msgSend((id)_MergedGlobals_1271, "longCharacterIsMember:", v3);
  }
}

void __87__UIInlineTextCompletionController__shouldAcceptFirstWordOfCandidateForWordTerminator___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" "));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1271;
  _MergedGlobals_1271 = v0;

}

- (BOOL)_shouldAcceptUpToNextWordOfCandidateOnWordBoundaryForInteraction:(int64_t)a3
{
  return a3 == 1 || a3 == 4;
}

- (int64_t)_acceptTypeForTypeWordTerminator:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_msgSend(v4, "_rangeOfLongCharacterAtIndex:", 0);
    v7 = v6;
    v8 = objc_msgSend(v4, "length");
    v9 = 0;
    if (!v5 && v7 == v8)
    {
      if (-[UIInlineTextCompletionController _shouldAcceptFirstWordOfCandidateForWordTerminator:](self, "_shouldAcceptFirstWordOfCandidateForWordTerminator:", objc_msgSend(v4, "_firstLongCharacter")))
      {
        v9 = 2;
      }
      else
      {
        -[UIInlineTextCompletionController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "inputManagerState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "stringEndsWord:", v4);

        v9 = v12;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_acceptTypeForInteraction:(int64_t)a3 wordTerminator:(id)a4
{
  id v6;
  int64_t v7;

  v6 = a4;
  v7 = 1;
  if ((unint64_t)(a3 - 1) >= 2 && a3 != 4)
  {
    if (a3)
      v7 = 0;
    else
      v7 = -[UIInlineTextCompletionController _acceptTypeForTypeWordTerminator:](self, "_acceptTypeForTypeWordTerminator:", v6);
  }

  return v7;
}

- (void)acceptTextCompletion:(id)a3
{
  -[UIInlineTextCompletionController _acceptTypeForInteraction:wordTerminator:](self, "_acceptTypeForInteraction:wordTerminator:", 2, 0);
}

- (void)acceptTextCompletionWithInteraction:(int64_t)a3 wordTerminator:(id)a4
{
  id v4;

  v4 = -[UIInlineTextCompletionController _acceptTextCompletionWithInteraction:wordTerminator:](self, "_acceptTextCompletionWithInteraction:wordTerminator:", a3, a4);
}

- (id)_acceptTextCompletionWithInteraction:(int64_t)a3 wordTerminator:(id)a4
{
  int64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v20[16];

  v6 = -[UIInlineTextCompletionController _acceptTypeForInteraction:wordTerminator:](self, "_acceptTypeForInteraction:wordTerminator:", a3, a4);
  if (v6 == 2)
  {
    -[UIInlineTextCompletionController oneWordTextCompletion](self, "oneWordTextCompletion");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6 != 1)
    {
      v8 = 0;
      goto LABEL_11;
    }
    -[UIInlineTextCompletionController textCompletion](self, "textCompletion");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (id)v7;
  if (!v7)
  {
LABEL_11:
    v11 = 0;
    goto LABEL_17;
  }
  if (!-[UIInlineTextCompletionController _doesFirstPredictedCharacterEndWord:](self, "_doesFirstPredictedCharacterEndWord:", v7))
  {
LABEL_13:
    v8 = v8;
    goto LABEL_14;
  }
  if (!-[UIInlineTextCompletionController _shouldAcceptUpToNextWordOfCandidateOnWordBoundaryForInteraction:](self, "_shouldAcceptUpToNextWordOfCandidateOnWordBoundaryForInteraction:", a3))
  {
    if (a3 != 2)
    {
      objc_msgSend(v8, "completion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "input");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "candidateByReplacingWithCandidate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "source");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIInlineTextCompletion inlineTextCompletion:source:](_UIInlineTextCompletion, "inlineTextCompletion:source:", v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIInlineTextCompletionController _registerLearningForInlineCompletion:learningMode:](self, "_registerLearningForInlineCompletion:learningMode:", v18, *MEMORY[0x1E0DBE4A0]);
      _UIKBInlineTextCompletionLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_DEFAULT, "Will not accept proposed text completion: first predicted character ends words", v20, 2u);
      }

      goto LABEL_11;
    }
    goto LABEL_13;
  }
  -[UIInlineTextCompletionController textCompletion](self, "textCompletion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInlineTextCompletionController _upToNextWordTextCompletionFromTextCompletion:](self, "_upToNextWordTextCompletionFromTextCompletion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (!v8)
    goto LABEL_11;
LABEL_14:
  v12 = (_QWORD *)MEMORY[0x1E0DBE490];
  if (a3 != 2)
    v12 = (_QWORD *)MEMORY[0x1E0DBE498];
  -[UIInlineTextCompletionController _acceptTextCompletion:learningMode:](self, "_acceptTextCompletion:learningMode:", v8, *v12);
  v11 = v8;
LABEL_17:

  return v11;
}

- (id)acceptTextCompletionWithInteraction:(int64_t)a3 wordTerminator:(id)a4 outputHandledByCaller:(BOOL)a5
{
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  const char *v18;
  uint8_t *v19;
  _QWORD *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  __int16 v29;
  uint8_t buf[16];
  uint8_t v31[16];

  if (a5)
  {
    v7 = -[UIInlineTextCompletionController _acceptTypeForInteraction:wordTerminator:](self, "_acceptTypeForInteraction:wordTerminator:", a3, a4);
    v8 = v7;
    if (v7 == 2)
    {
      -[UIInlineTextCompletionController oneWordTextCompletion](self, "oneWordTextCompletion");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7 != 1)
      {
        v10 = 0;
        goto LABEL_15;
      }
      -[UIInlineTextCompletionController textCompletion](self, "textCompletion");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (id)v9;
    if (v9)
    {
      if (-[UIInlineTextCompletionController _doesFirstPredictedCharacterEndWord:](self, "_doesFirstPredictedCharacterEndWord:", v9))
      {
        if (-[UIInlineTextCompletionController _shouldAcceptUpToNextWordOfCandidateOnWordBoundaryForInteraction:](self, "_shouldAcceptUpToNextWordOfCandidateOnWordBoundaryForInteraction:", a3))
        {
          -[UIInlineTextCompletionController textCompletion](self, "textCompletion");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIInlineTextCompletionController _upToNextWordTextCompletionFromTextCompletion:](self, "_upToNextWordTextCompletionFromTextCompletion:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          _UIKBInlineTextCompletionLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "Accepting up to next word of the full text completion", buf, 2u);
          }

          v10 = v13;
          if (!v10)
            goto LABEL_15;
LABEL_24:
          v20 = (_QWORD *)MEMORY[0x1E0DBE490];
          if (a3 != 2)
            v20 = (_QWORD *)MEMORY[0x1E0DBE498];
          -[UIInlineTextCompletionController _registerLearningForInlineCompletion:learningMode:](self, "_registerLearningForInlineCompletion:learningMode:", v10, *v20, v28);
          -[UIInlineTextCompletionController setLastAcceptedTextCompletion:](self, "setLastAcceptedTextCompletion:", v10);
          -[UIInlineTextCompletionController _removeTextCompletionPromptForReason:](self, "_removeTextCompletionPromptForReason:", 2);
          v15 = v10;
          goto LABEL_27;
        }
        if (a3 != 2)
        {
          objc_msgSend(v10, "completion");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "input");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "candidateByReplacingWithCandidate:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "source");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[_UIInlineTextCompletion inlineTextCompletion:source:](_UIInlineTextCompletion, "inlineTextCompletion:source:", v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIInlineTextCompletionController _registerLearningForInlineCompletion:learningMode:](self, "_registerLearningForInlineCompletion:learningMode:", v26, *MEMORY[0x1E0DBE4A0]);
          _UIKBInlineTextCompletionLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v31 = 0;
            _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_DEFAULT, "Will not accept proposed text completion: first predicted character ends words", v31, 2u);
          }

          goto LABEL_15;
        }
      }
      _UIKBInlineTextCompletionLog();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v8 == 2)
      {
        if (v17)
        {
          v29 = 0;
          v18 = "Accepting one word of the text completion";
          v19 = (uint8_t *)&v29;
LABEL_22:
          _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
        }
      }
      else if (v17)
      {
        LOWORD(v28) = 0;
        v18 = "Accepting full text completion";
        v19 = (uint8_t *)&v28;
        goto LABEL_22;
      }

      v10 = v10;
      goto LABEL_24;
    }
LABEL_15:
    v15 = 0;
LABEL_27:
    objc_msgSend(v15, "completion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_28;
  }
  -[UIInlineTextCompletionController _acceptTextCompletionWithInteraction:wordTerminator:](self, "_acceptTextCompletionWithInteraction:wordTerminator:", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "completion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v11;
}

- (id)_candidateToUndoAcceptedTextCompletion
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  -[UIInlineTextCompletionController lastAcceptedTextCompletion](self, "lastAcceptedTextCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIInlineTextCompletionController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "contextBeforeInput");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1E16EDF20;
    v9 = v8;

    -[UIInlineTextCompletionController lastAcceptedTextCompletion](self, "lastAcceptedTextCompletion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "candidate");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (__CFString *)v11;
    else
      v13 = &stru_1E16EDF20;
    v14 = v13;

    objc_msgSend(v10, "input");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (__CFString *)v15;
    else
      v17 = &stru_1E16EDF20;
    v18 = v17;

    v19 = v14;
    if (-[__CFString length](v9, "length"))
    {
      v20 = -[__CFString _rangeOfLongCharacterAtIndex:](v9, "_rangeOfLongCharacterAtIndex:", -[__CFString length](v9, "length") - 1);
      -[__CFString substringWithRange:](v9, "substringWithRange:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInlineTextCompletionController delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "inputManagerState");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "stringEndsWord:", v22);

      v26 = v19;
      if (v25)
      {
        -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (-[__CFString hasSuffix:](v9, "hasSuffix:", v26))
      {
        objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithCandidate:forInput:", v18, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "source");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIInlineTextCompletion inlineTextCompletion:source:](_UIInlineTextCompletion, "inlineTextCompletion:source:", v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v29 = 0;
      }

    }
    else
    {
      v29 = 0;
      v26 = v19;
    }

  }
  else
  {
    v29 = 0;
  }
  return v29;
}

- (BOOL)canUndoAcceptedTextCompletion
{
  void *v3;
  BOOL v4;

  if (!-[UIInlineTextCompletionController _deleteToUndoEnabled](self, "_deleteToUndoEnabled"))
    return 0;
  -[UIInlineTextCompletionController _candidateToUndoAcceptedTextCompletion](self, "_candidateToUndoAcceptedTextCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)undoAcceptedTextCompletionExecutionContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UIInlineTextCompletion *lastAcceptedTextCompletion;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIInlineTextCompletionController _candidateToUndoAcceptedTextCompletion](self, "_candidateToUndoAcceptedTextCompletion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _UIKBInlineTextCompletionLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[UIInlineTextCompletionController lastAcceptedTextCompletion](self, "lastAcceptedTextCompletion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _shortCompletionDescr(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _shortCompletionDescr(v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Undo accepted text completion: (Accepted: %@, Undo: %@)", buf, 0x16u);

    }
    -[UIInlineTextCompletionController lastAcceptedTextCompletion](self, "lastAcceptedTextCompletion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[UIInlineTextCompletionController _registerLearningForInlineCompletion:learningMode:](self, "_registerLearningForInlineCompletion:learningMode:", v10, *MEMORY[0x1E0DBE4C8]);
    lastAcceptedTextCompletion = self->_lastAcceptedTextCompletion;
    self->_lastAcceptedTextCompletion = 0;

    -[UIInlineTextCompletionController _removeTextCompletionPromptForReason:](self, "_removeTextCompletionPromptForReason:", 3);
    -[UIInlineTextCompletionController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "completion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__UIInlineTextCompletionController_undoAcceptedTextCompletionExecutionContext___block_invoke;
    v15[3] = &unk_1E16BAF98;
    v15[4] = self;
    objc_msgSend(v4, "childWithContinuation:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "acceptPredictiveInput:appendSeparator:executionContext:", v13, 0, v14);

  }
  else
  {
    objc_msgSend(v4, "returnExecutionToParent");
  }

}

void __79__UIInlineTextCompletionController_undoAcceptedTextCompletionExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "setDeleting:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generateCandidates");

  objc_msgSend(v5, "returnExecutionToParent");
}

- (void)_registerLearningForInlineCompletion:(id)a3 learningMode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((id)*MEMORY[0x1E0DBE498] == v7)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferencesActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForPreferenceKey:", CFSTR("InlineCompletionAcceptedBySpaceEventCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferencesActions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11 + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forPreferenceKey:", v14, CFSTR("InlineCompletionAcceptedBySpaceEventCount"));

  }
  -[UIInlineTextCompletionController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "refreshKeyboardState");

  -[UIInlineTextCompletionController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "keyboardState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  _UIKBInlineTextCompletionLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    _shortCompletionDescr(v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _shortCandidateDescr(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412802;
    v27 = v23;
    v28 = 2112;
    v29 = v25;
    v30 = 2112;
    v31 = v7;
    _os_log_debug_impl(&dword_185066000, v18, OS_LOG_TYPE_DEBUG, "Register learning for completion:%@ sourceCandidate:%@ mode:%@", (uint8_t *)&v26, 0x20u);

  }
  -[UIInlineTextCompletionController delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "inlineTextCompletionLearner");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v6, "completion");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "registerLearning:fullCandidate:keyboardState:mode:", v21, v22, v17, v7);

  }
  else
  {
    _UIKBInlineTextCompletionLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "NOTE: inlineTextCompletionLearner not found", (uint8_t *)&v26, 2u);
    }
  }

}

- (void)setPresentingTextCompletionAsMarkedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)currentlyAcceptingInlineCompletionByDirectTap
{
  return self->_currentlyAcceptingInlineCompletionByDirectTap;
}

- (void)setCurrentlyAcceptingInlineCompletionByDirectTap:(BOOL)a3
{
  self->_currentlyAcceptingInlineCompletionByDirectTap = a3;
}

- (UIKBAnalyticsDispatcher)analyticsDispatcher
{
  return (UIKBAnalyticsDispatcher *)objc_loadWeakRetained((id *)&self->_analyticsDispatcher);
}

- (_UIInlineTextCompletion)textCompletion
{
  return self->_textCompletion;
}

- (_UIInlineTextCompletion)candidateRemovedOnWillPerformOutput
{
  return self->_candidateRemovedOnWillPerformOutput;
}

- (void)setAcceptingTextCompletion:(id)a3
{
  objc_storeStrong((id *)&self->_acceptingTextCompletion, a3);
}

- (_UIInlineTextCompletion)lastAcceptedTextCompletion
{
  return self->_lastAcceptedTextCompletion;
}

- (void)setLastAcceptedTextCompletion:(id)a3
{
  objc_storeStrong((id *)&self->_lastAcceptedTextCompletion, a3);
}

- (BOOL)isDeleting
{
  return self->_deleting;
}

- (void)setDeleting:(BOOL)a3
{
  self->_deleting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAcceptedTextCompletion, 0);
  objc_storeStrong((id *)&self->_acceptingTextCompletion, 0);
  objc_storeStrong((id *)&self->_candidateRemovedOnWillPerformOutput, 0);
  objc_storeStrong((id *)&self->_inlineCompletionCoachingTask, 0);
  objc_storeStrong((id *)&self->_textCompletionPromptTask, 0);
  objc_storeStrong((id *)&self->_textCompletion, 0);
  objc_destroyWeak((id *)&self->_analyticsDispatcher);
  objc_storeStrong((id *)&self->_presentingTextCompletionAsMarkedText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->m_textCompletionPrompt, 0);
}

@end
