@implementation UIKeyboardAutocorrectionController

- (BOOL)hasAutofillCandidates
{
  return -[TIAutocorrectionList containsAutofillCandidates](self->_autocorrectionList, "containsAutofillCandidates");
}

- (BOOL)hasProactiveCandidates
{
  return -[TIAutocorrectionList containsProactiveTriggers](self->_autocorrectionList, "containsProactiveTriggers");
}

- (BOOL)hasContinuousPathConversions
{
  return -[TIAutocorrectionList containsContinuousPathConversions](self->_autocorrectionList, "containsContinuousPathConversions");
}

- (TIAutocorrectionList)textSuggestionList
{
  return self->_textSuggestionList;
}

- (void)_notifyObserversOfUpdatedAutocorrectionList:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy", 0);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "autocorrectionController:didUpdateAutocorrectionList:", a1, v3);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)addAutocorrectionObserver:(id)a3
{
  -[NSHashTable addObject:](self->_autocorrectionObservers, "addObject:", a3);
}

- (BOOL)hasAutocorrection
{
  return !self->_needsAutocorrection;
}

- (TIKeyboardCandidate)autocorrection
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;

  -[UIKeyboardAutocorrectionController autocorrectionList](self, "autocorrectionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldAcceptTopCandidate");

  if (v4)
  {
    -[UIKeyboardAutocorrectionController autocorrectionList](self, "autocorrectionList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "candidate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "length"))
    {
      v10 = objc_msgSend(v7, "slotID");

      if (v10)
        return (TIKeyboardCandidate *)v7;
      v8 = v7;
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return (TIKeyboardCandidate *)v7;
}

- (TIAutocorrectionList)autocorrectionList
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  if (self->_needsAutocorrection)
  {
    v3 = -[UIKeyboardAutocorrectionController requestedAutocorrection](self, "requestedAutocorrection");
    -[UIKeyboardAutocorrectionController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "waitUntilAllTasksAreFinished");
    }
    else
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __56__UIKeyboardAutocorrectionController_autocorrectionList__block_invoke;
      v8[3] = &unk_1E16BAF98;
      v8[4] = self;
      objc_msgSend(v5, "performTask:", v8);
    }

  }
  return self->_autocorrectionList;
}

- (void)removeAutocorrectionObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_autocorrectionObservers, "removeObject:", a3);
}

- (void)setAutocorrectionList:(id)a3
{
  -[UIKeyboardAutocorrectionController _setAutocorrectionList:notifyObservers:]((uint64_t)self, a3, 1);
}

- (UIKeyboardAutocorrectionController)init
{
  UIKeyboardAutocorrectionController *v2;
  uint64_t v3;
  NSHashTable *autocorrectionObservers;
  uint64_t v5;
  NSMutableDictionary *recentCandidates;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardAutocorrectionController;
  v2 = -[UIKeyboardAutocorrectionController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    autocorrectionObservers = v2->_autocorrectionObservers;
    v2->_autocorrectionObservers = (NSHashTable *)v3;

    v2->_maximumNumberOfCandidates = 3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    recentCandidates = v2->_recentCandidates;
    v2->_recentCandidates = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)clearAutocorrectionAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (!-[UIKeyboardAutocorrectionController hasAutofillCandidates](self, "hasAutofillCandidates"))
  {
    -[UIKeyboardAutocorrectionController _setAutocorrectionList:notifyObservers:]((uint64_t)self, 0, 0);
    if (v3)
    {
      if (self)
      {
        v12 = 0u;
        v13 = 0u;
        v10 = 0u;
        v11 = 0u;
        v5 = (void *)-[NSHashTable copy](self->_autocorrectionObservers, "copy", 0);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v11;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v11 != v8)
                objc_enumerationMutation(v5);
              objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "autocorrectionControllerDidClearAutocorrections:", self);
            }
            while (v7 != v9);
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          }
          while (v7);
        }

      }
    }
  }
}

- (void)_setAutocorrectionList:(int)a3 notifyObservers:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;

  obj = a2;
  if (!a1)
  {
LABEL_14:
    v23 = obj;
    goto LABEL_15;
  }
  *(_BYTE *)(a1 + 17) = 0;
  if (objc_msgSend((id)a1, "_divertSmartReplyPredictionsToTextChoicesAssistant"))
  {
    objc_msgSend(obj, "predictions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _filteredCandidates(v5, &__block_literal_global_78_2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      v7 = obj;
      objc_msgSend(v7, "predictions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        objc_msgSend(v7, "predictions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _filteredCandidates(v10, &__block_literal_global_82_2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v7;
        v12 = objc_msgSend(v11, "count");
        objc_msgSend(obj, "predictions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v12 < v14)
        {
          v15 = (void *)MEMORY[0x1E0DBDB48];
          objc_msgSend(obj, "corrections");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "emojiList");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "inlineCompletions");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "proactiveTriggers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "listWithCorrections:predictions:emojiList:inlineCompletionList:proactiveTriggers:", v16, v11, v17, v18, v19);
          v20 = objc_claimAutoreleasedReturnValue();

          obj = (id)v20;
        }

      }
      else
      {
        obj = v7;
      }

      objc_msgSend((id)a1, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_textChoicesAssistant");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "showChoicesForCandidates:", v6);

    }
  }
  v23 = obj;
  if (*(id *)(a1 + 24) != obj)
  {
    objc_storeStrong((id *)(a1 + 24), obj);
    if (a3)
      -[UIKeyboardAutocorrectionController _notifyObserversOfUpdatedAutocorrectionList:](a1, *(void **)(a1 + 24));
    goto LABEL_14;
  }
LABEL_15:

}

- (void)clearAutocorrection
{
  -[UIKeyboardAutocorrectionController clearAutocorrectionAndNotifyObservers:](self, "clearAutocorrectionAndNotifyObservers:", 0);
}

- (BOOL)hasActiveObservers
{
  if (self)
    self = (UIKeyboardAutocorrectionController *)self->_autocorrectionObservers;
  return -[UIKeyboardAutocorrectionController count](self, "count") != 0;
}

- (void)setTextSuggestionList:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_textSuggestionList, a3);
  if (self->_textSuggestionList)
    -[UIKeyboardAutocorrectionController setAutocorrectionList:](self, "setAutocorrectionList:");
  else
    -[UIKeyboardAutocorrectionController _notifyObserversOfUpdatedAutocorrectionList:]((uint64_t)self, 0);

}

- (void)clearAutofillAndTextSuggestions
{
  -[UIKeyboardAutocorrectionController setTextSuggestionList:](self, "setTextSuggestionList:", 0);
}

uint64_t __80__UIKeyboardAutocorrectionController_requestAutocorrectionWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    *(_BYTE *)(v2 + 16) = 0;
  return objc_msgSend(a2, "returnExecutionToParent");
}

void __60__UIKeyboardAutocorrectionController_setNeedsAutocorrection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = mach_absolute_time();
  kdebug_trace();
  kac_get_log();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, *(const void **)(*(_QWORD *)(a1 + 32) + 8));
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v5, OS_SIGNPOST_INTERVAL_END, v7, "appAutocorrect", " enableTelemetry=YES ", v8, 2u);
    }
  }

  +[_UIKeyboardDiagnosticCollection _requestTailspinWithDescription:startMAT:endMAT:ifExceedsThresholdSec:](_UIKeyboardDiagnosticCollection, "_requestTailspinWithDescription:startMAT:endMAT:ifExceedsThresholdSec:", CFSTR("KeyboardAutocorrectionLatency"), *(_QWORD *)(a1 + 40), v4, 0.25);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_msgSend(v3, "returnExecutionToParent");

}

void __60__UIKeyboardAutocorrectionController_setNeedsAutocorrection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  _BYTE *v5;
  _QWORD v6[6];

  v3 = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__UIKeyboardAutocorrectionController_setNeedsAutocorrection__block_invoke_2;
  v6[3] = &unk_1E16BBA90;
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = v3;
  objc_msgSend(a2, "childWithContinuation:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE **)(a1 + 32);
  if (v5[17] && !v5[16])
    objc_msgSend(v5, "requestAutocorrectionWithExecutionContext:", v4);
  else
    objc_msgSend(v4, "returnExecutionToParent");

}

- (void)setNeedsAutocorrection
{
  uint64_t v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  uint8_t buf[16];

  if (!self->_needsAutocorrection)
  {
    self->_needsAutocorrection = 1;
    self->_signpostToken = arc4random();
    v3 = mach_absolute_time();
    kdebug_trace();
    kac_get_log();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, (const void *)self->_signpostToken);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_185066000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "appAutocorrect", " enableTelemetry=YES ", buf, 2u);
      }
    }

    if (!self->_hasPendingAutocorrection && !self->_requestedAutocorrection)
    {
      self->_hasPendingAutocorrection = 1;
      -[UIKeyboardAutocorrectionController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "taskQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __60__UIKeyboardAutocorrectionController_setNeedsAutocorrection__block_invoke;
      v9[3] = &unk_1E16BBA90;
      v9[4] = self;
      v9[5] = v3;
      objc_msgSend(v8, "addDeferredTask:", v9);

    }
  }
}

- (void)requestAutocorrectionWithExecutionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  if (self)
    self->_requestedAutocorrection = 1;
  -[UIKeyboardAutocorrectionController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __80__UIKeyboardAutocorrectionController_requestAutocorrectionWithExecutionContext___block_invoke;
    v7[3] = &unk_1E16BAF98;
    v7[4] = self;
    objc_msgSend(v4, "childWithContinuation:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "generateAutocorrectionWithExecutionContext:", v6);

  }
  else
  {
    objc_msgSend(v4, "returnExecutionToParent");
  }

}

- (NSArray)textCompletions
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TIAutocorrectionList inlineCompletions](self->_autocorrectionList, "inlineCompletions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

uint64_t __56__UIKeyboardAutocorrectionController_autocorrectionList__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestAutocorrectionWithExecutionContext:", a2);
}

- (BOOL)_divertSmartReplyPredictionsToTextChoicesAssistant
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  v3 = +[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode");
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemInputAssistantViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assistantBarStyle");

  -[UIKeyboardAutocorrectionController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPredictionViewControllerVisible");

  if (!v3)
    return 0;
  if ((unint64_t)(v6 - 2) < 3)
    return 1;
  return v8 ^ 1;
}

- (void)updateAfterShiftStateChange
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_needsAutocorrection)
  {
    -[TIAutocorrectionList autocorrection](self->_autocorrectionList, "autocorrection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = __65__UIKeyboardAutocorrectionController_updateAfterShiftStateChange__block_invoke(v3);

    if (v4)
    {
      -[UIKeyboardAutocorrectionController setNeedsAutocorrection](self, "setNeedsAutocorrection");
    }
    else
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      -[TIAutocorrectionList candidates](self->_autocorrectionList, "candidates", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            if (__65__UIKeyboardAutocorrectionController_updateAfterShiftStateChange__block_invoke(*(void **)(*((_QWORD *)&v10 + 1) + 8 * i)))
            {
              -[UIKeyboardAutocorrectionController setNeedsAutocorrection](self, "setNeedsAutocorrection");
              goto LABEL_14;
            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_14:

    }
  }
}

uint64_t __65__UIKeyboardAutocorrectionController_updateAfterShiftStateChange__block_invoke(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1 && (objc_msgSend(v1, "isForShortcutConversion") & 1) == 0)
    v3 = objc_msgSend(v2, "isReplacement") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (BOOL)hasTextSuggestionCandidates
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[UIKeyboardAutocorrectionController textSuggestionList](self, "textSuggestionList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "predictions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)storedListForCandidate:(id)a3
{
  id v4;
  TIAutocorrectionList *v5;

  v4 = a3;
  v5 = self->_autocorrectionList;
  if (!v5)
  {
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      objc_msgSend(MEMORY[0x1E0DBDB48], "listWithAutocorrection:", v4);
      v5 = (TIAutocorrectionList *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)requestedAutocorrection
{
  return self->_requestedAutocorrection;
}

- (unint64_t)maximumNumberOfCandidates
{
  return self->_maximumNumberOfCandidates;
}

- (void)setMaximumNumberOfCandidates:(unint64_t)a3
{
  self->_maximumNumberOfCandidates = a3;
}

- (UIKeyboardAutocorrectionControllerDelegate)delegate
{
  return (UIKeyboardAutocorrectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recentCandidates, 0);
  objc_storeStrong((id *)&self->_autocorrectionObservers, 0);
  objc_storeStrong((id *)&self->_textSuggestionList, 0);
  objc_storeStrong((id *)&self->_autocorrectionList, 0);
}

@end
