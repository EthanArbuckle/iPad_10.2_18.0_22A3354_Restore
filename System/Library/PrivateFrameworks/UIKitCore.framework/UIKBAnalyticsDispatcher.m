@implementation UIKBAnalyticsDispatcher

+ (id)sharedInstance
{
  if (qword_1ECD7CF58 != -1)
    dispatch_once(&qword_1ECD7CF58, &__block_literal_global_101);
  return (id)_MergedGlobals_985;
}

+ (void)setKeyboardTrialParameters:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_textInputSessionAnalytics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardTrialParameters:", v3);

}

void __41__UIKBAnalyticsDispatcher_sharedInstance__block_invoke()
{
  UIKBAnalyticsDispatcher *v0;
  void *v1;

  v0 = objc_alloc_init(UIKBAnalyticsDispatcher);
  v1 = (void *)_MergedGlobals_985;
  _MergedGlobals_985 = (uint64_t)v0;

}

- (UIKBAnalyticsDispatcher)init
{
  UIKBAnalyticsDispatcher *v2;
  UIKBAnalyticsDispatcher *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKBAnalyticsDispatcher;
  v2 = -[UIKBAnalyticsDispatcher init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UIKBAnalyticsDispatcher resetCandidateReplacementVariables](v2, "resetCandidateReplacementVariables");
  return v3;
}

- (void)resetCandidateReplacementVariables
{
  NSString *nextCandidateReplacementRemovedText;
  NSString *nextCandidateReplacementInsertedText;
  NSString *nextCandidateReplacementPostCandidateInsertedText;

  nextCandidateReplacementRemovedText = self->_nextCandidateReplacementRemovedText;
  self->_nextCandidateReplacementRemovedText = 0;

  nextCandidateReplacementInsertedText = self->_nextCandidateReplacementInsertedText;
  self->_nextCandidateReplacementInsertedText = 0;

  nextCandidateReplacementPostCandidateInsertedText = self->_nextCandidateReplacementPostCandidateInsertedText;
  self->_nextCandidateReplacementPostCandidateInsertedText = 0;

  self->_nextCandidateReplacementSource = 0;
}

void __49__UIKBAnalyticsDispatcher_sessionAnalyticsEnded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", CFSTR("Identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DBDB20];
  objc_msgSend(*(id *)(a1 + 32), "allAccumulatorNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFieldSpecWithName:allowedValues:", CFSTR("SessionAction"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DBDB20];
  +[UITextInputSessionActionAnalytics allowedValuesForTextInputSource](UITextInputSessionActionAnalytics, "allowedValuesForTextInputSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFieldSpecWithName:allowedValues:", CFSTR("InputSource"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("Value"), &unk_1E1A97290, 0, &unk_1E1A972A8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DBDB18];
  v11 = *(_QWORD *)(a1 + 40);
  v21[0] = v2;
  v21[1] = v5;
  v21[2] = v8;
  v21[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "eventSpecWithName:inputModeRequired:fieldSpecs:", v11, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerEventSpec:", v13);

  v15 = (void *)MEMORY[0x1E0DBDB18];
  v16 = *(_QWORD *)(a1 + 48);
  v20[0] = v2;
  v20[1] = v5;
  v20[2] = v8;
  v20[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventSpecWithName:inputModeRequired:fieldSpecs:", v16, 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerEventSpec:", v18);

}

+ (void)sessionAnalyticsEnded:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  id v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  id v21;
  id v22;
  __CFString *v23;
  id v24;
  _QWORD v25[4];
  __CFString *v26;
  __CFString *v27;
  id v28;
  _QWORD v29[4];
  __CFString *v30;
  __CFString *v31;
  id v32;
  _QWORD block[4];
  id v34;
  __CFString *v35;
  __CFString *v36;

  v3 = a3;
  v4 = CFSTR("TextInputSession");
  v5 = CFSTR("TextInputSessionUpdate");
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__UIKBAnalyticsDispatcher_sessionAnalyticsEnded___block_invoke;
  block[3] = &unk_1E16B47A8;
  v34 = v3;
  v7 = v4;
  v35 = v7;
  v8 = v5;
  v36 = v8;
  v9 = sessionAnalyticsEnded__onceToken;
  v10 = v3;
  v24 = v10;
  if (v9 == -1)
  {
    v11 = v10;
    v12 = v7;
    v13 = v8;
  }
  else
  {
    dispatch_once(&sessionAnalyticsEnded__onceToken, block);
    v12 = v35;
    v13 = v36;
    v11 = v34;
  }
  objc_msgSend((id)objc_opt_class(), "currentInputMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sessionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = CFSTR("<nil>");
  if (v16)
    v18 = (__CFString *)v16;
  v19 = v18;

  v29[0] = v6;
  v29[1] = 3221225472;
  v29[2] = __49__UIKBAnalyticsDispatcher_sessionAnalyticsEnded___block_invoke_51;
  v29[3] = &unk_1E16B94B0;
  v30 = v7;
  v20 = v19;
  v31 = v20;
  v21 = v14;
  v32 = v21;
  objc_msgSend(v24, "enumerateAnalytics:", v29);
  v25[0] = v6;
  v25[1] = 3221225472;
  v25[2] = __49__UIKBAnalyticsDispatcher_sessionAnalyticsEnded___block_invoke_2;
  v25[3] = &unk_1E16B94B0;
  v26 = v8;
  v27 = v20;
  v28 = v21;
  v22 = v21;
  v23 = v20;
  objc_msgSend(v24, "enumerateSeparateCycleAnalytics:", v25);

}

+ (id)currentInputMode
{
  void *v2;
  void *v3;
  void *v4;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifierWithLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)preferredEventName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("UIKBAnalytics"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)allowedValuesForTextEditingPreferredFieldName:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[10];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Operation")))
  {
    v10[0] = CFSTR("Undo");
    v10[1] = CFSTR("UndoCancel");
    v10[2] = CFSTR("Redo");
    v10[3] = CFSTR("Cut");
    v10[4] = CFSTR("Copy");
    v10[5] = CFSTR("Paste");
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v10;
    v6 = 6;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("TriggerType")))
    {
      v7 = 0;
      goto LABEL_7;
    }
    v9[0] = CFSTR("UndoHUDGesturePan");
    v9[1] = CFSTR("UndoHUDGestureDoubleTap");
    v9[2] = CFSTR("UndoHUDGestureDoubleTapShortHand");
    v9[3] = CFSTR("UndoHUDControl");
    v9[4] = CFSTR("UCB");
    v9[5] = CFSTR("CalloutBar");
    v9[6] = CFSTR("Shake");
    v9[7] = CFSTR("SWKeyboard");
    v9[8] = CFSTR("HWKeyboard");
    v9[9] = CFSTR("EditMenu");
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v9;
    v6 = 10;
  }
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v7;
}

+ (void)incrementAllowCursorMovementCount
{
  void *v2;
  id v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_textInputSessionAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incrementAllowCursorMovementCount");

}

+ (void)decrementAllowCursorMovementCount
{
  void *v2;
  id v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_textInputSessionAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decrementAllowCursorMovementCount");

}

+ (void)analyticsDispatchEventTextEditingOperation:(id)a3 trigger:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  __CFString *v20;
  id v21;
  _QWORD block[5];
  _QWORD v23[2];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  UITextInputSessionLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "[UIKBAnalyticsDispatcher] analyticsDispatchEventTextEditingOperation:%@ trigger:%@", buf, 0x16u);
  }

  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__UIKBAnalyticsDispatcher_analyticsDispatchEventTextEditingOperation_trigger___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (analyticsDispatchEventTextEditingOperation_trigger__onceToken != -1)
    dispatch_once(&analyticsDispatchEventTextEditingOperation_trigger__onceToken, block);
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "preferredEventName:", CFSTR("TextEditing"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  v23[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "currentInputMode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dispatchEventWithName:values:inputMode:", v11, v12, v13);

  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __78__UIKBAnalyticsDispatcher_analyticsDispatchEventTextEditingOperation_trigger___block_invoke_2;
  v19[3] = &unk_1E16B9460;
  v15 = (__CFString *)v6;
  v20 = v15;
  v16 = v7;
  v21 = v16;
  objc_msgSend(v14, "logBlock:domain:", v19, CFSTR("com.apple.keyboard.UIKit"));

  if (CFSTR("Copy") == v15)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_textInputSessionAnalytics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "didCopy");
    goto LABEL_15;
  }
  if (CFSTR("Cut") == v15)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_textInputSessionAnalytics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "didCut");
    goto LABEL_15;
  }
  if (CFSTR("Paste") == v15)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_textInputSessionAnalytics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "didPaste");
    goto LABEL_15;
  }
  if (CFSTR("Undo") == v15)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_textInputSessionAnalytics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "didUndo");
    goto LABEL_15;
  }
  if (CFSTR("Redo") == v15)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_textInputSessionAnalytics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "didRedo");
LABEL_15:

  }
}

void __78__UIKBAnalyticsDispatcher_analyticsDispatchEventTextEditingOperation_trigger___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DBDB20];
  objc_msgSend((id)objc_opt_class(), "allowedValuesForTextEditingPreferredFieldName:", CFSTR("Operation"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringFieldSpecWithName:allowedValues:", CFSTR("Operation"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x1E0DBDB20];
  objc_msgSend((id)objc_opt_class(), "allowedValuesForTextEditingPreferredFieldName:", CFSTR("TriggerType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFieldSpecWithName:allowedValues:", CFSTR("TriggerType"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DBDB18];
  objc_msgSend((id)objc_opt_class(), "preferredEventName:", CFSTR("TextEditing"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventSpecWithName:inputModeRequired:fieldSpecs:", v7, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerEventSpec:", v9);

}

id __78__UIKBAnalyticsDispatcher_analyticsDispatchEventTextEditingOperation_trigger___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("KeyboardEventType");
  v4[1] = CFSTR("Operation");
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = CFSTR("TextEditing");
  v5[1] = v1;
  v4[2] = CFSTR("TriggerType");
  v5[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)keyboardAnalyticsDispatchWithSelector:(SEL)a3 withTrigger:(id)a4
{
  void *v5;
  __CFString **v6;
  id v7;

  v7 = a4;
  NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsString:", CFSTR("cut")) & 1) != 0)
  {
    v6 = UIKBAnalyticsTextEditingOperationCut;
LABEL_7:
    +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:trigger:](UIKBAnalyticsDispatcher, "analyticsDispatchEventTextEditingOperation:trigger:", *v6, v7);
    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "containsString:", CFSTR("copy")) & 1) != 0)
  {
    v6 = UIKBAnalyticsTextEditingOperationCopy;
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "containsString:", CFSTR("paste")))
  {
    v6 = UIKBAnalyticsTextEditingOperationPaste;
    goto LABEL_7;
  }
LABEL_8:

}

+ (id)allowedValuesForType:(id)a3
{
  id v3;
  void *v4;
  const __CFString **v5;
  uint64_t v6;
  void *v7;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("eventType")))
  {
    v19 = CFSTR("Untether");
    v20 = CFSTR("Tether");
    v21 = CFSTR("Move");
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v19;
    v6 = 3;
  }
  else
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("triggerType")))
    {
      v14 = CFSTR("Interactive");
      v15 = CFSTR("NonInteractive");
      v16 = CFSTR("DockedToBottom");
      v17 = CFSTR("PositionedAwayFromEdge");
      v18 = CFSTR("PositionedOnEdge");
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = &v14;
    }
    else
    {
      if (!objc_msgSend(v3, "isEqualToString:", CFSTR("screenEdge")))
      {
        v7 = 0;
        goto LABEL_9;
      }
      v9 = CFSTR("NotOnEdge");
      v10 = CFSTR("LeftEdge");
      v11 = CFSTR("BottomEdge");
      v12 = CFSTR("RightEdge");
      v13 = CFSTR("TopEdge");
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = &v9;
    }
    v6 = 5;
  }
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v7;
}

+ (void)floatingKeyboardSummonedEvent:(id)a3 trigger:(id)a4 finalPosition:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  id v9;

  y = a5.y;
  x = a5.x;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "dispatchFloatingKeyboardEventOfType:trigger:pinnedToEdge:position:touchUpPosition:", v9, v8, CFSTR("NotOnEdge"), x, y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

+ (void)floatingKeyboardMoved:(id)a3 toPosition:(CGPoint)a4 touchPosition:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  void *v9;
  const __CFString *v10;
  __CFString **v11;
  int v12;
  id v13;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v13 = a3;
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("BottomEdge")))
  {
    v9 = (void *)objc_opt_class();
    v10 = CFSTR("Tether");
    v11 = UIKBAnalyticsFloatingKeyboardTriggerTypeDocked;
  }
  else
  {
    v12 = objc_msgSend(v13, "isEqualToString:", CFSTR("NotOnEdge"));
    v9 = (void *)objc_opt_class();
    v10 = CFSTR("Move");
    v11 = UIKBAnalyticsFloatingKeyboardTriggerTypePositioned;
    if (!v12)
      v11 = UIKBAnalyticsFloatingKeyboardTriggerTypeSnappedToEdge;
  }
  objc_msgSend(v9, "dispatchFloatingKeyboardEventOfType:trigger:pinnedToEdge:position:touchUpPosition:", v10, *v11, v13, v8, v7, x, y);

}

+ (void)dispatchFloatingKeyboardEventOfType:(id)a3 trigger:(id)a4 pinnedToEdge:(id)a5 position:(CGPoint)a6 touchUpPosition:(CGPoint)a7
{
  double y;
  double x;
  double v9;
  double v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  double v39;
  double v40;
  _QWORD block[4];
  void *v42;
  id v43;
  _QWORD v44[9];

  y = a7.y;
  x = a7.x;
  v9 = a6.y;
  v10 = a6.x;
  v44[7] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  objc_msgSend((id)objc_opt_class(), "preferredEventName:", CFSTR("floatingKeyboardUsageEvent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__UIKBAnalyticsDispatcher_dispatchFloatingKeyboardEventOfType_trigger_pinnedToEdge_position_touchUpPosition___block_invoke;
  block[3] = &unk_1E16B1888;
  v42 = v17;
  v43 = a1;
  v18 = dispatchFloatingKeyboardEventOfType_trigger_pinnedToEdge_position_touchUpPosition__onceToken;
  v19 = v17;
  if (v18 == -1)
  {
    v32 = v19;
    v20 = v19;
  }
  else
  {
    v20 = v19;
    dispatch_once(&dispatchFloatingKeyboardEventOfType_trigger_pinnedToEdge_position_touchUpPosition__onceToken, block);
    v32 = v42;
  }
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v14;
  v44[1] = v15;
  v44[2] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v33 = v14;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", x);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "currentInputMode");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v20;
  objc_msgSend(v21, "dispatchEventWithName:values:inputMode:", v20, v26, v27);

  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __109__UIKBAnalyticsDispatcher_dispatchFloatingKeyboardEventOfType_trigger_pinnedToEdge_position_touchUpPosition___block_invoke_2;
  v35[3] = &unk_1E16B9488;
  v36 = v33;
  v37 = v15;
  v38 = v16;
  v39 = v10;
  v40 = v9;
  v29 = v16;
  v30 = v15;
  v31 = v33;
  objc_msgSend(v28, "logBlock:domain:", v35, CFSTR("com.apple.keyboard.UIKit"));

}

void __109__UIKBAnalyticsDispatcher_dispatchFloatingKeyboardEventOfType_trigger_pinnedToEdge_position_touchUpPosition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[8];

  v20[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DBDB20];
  objc_msgSend((id)objc_opt_class(), "allowedValuesForType:", CFSTR("eventType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFieldSpecWithName:allowedValues:", CFSTR("eventType"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DBDB20];
  objc_msgSend((id)objc_opt_class(), "allowedValuesForType:", CFSTR("triggerType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFieldSpecWithName:allowedValues:", CFSTR("triggerType"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DBDB20];
  objc_msgSend((id)objc_opt_class(), "allowedValuesForType:", CFSTR("screenEdge"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFieldSpecWithName:allowedValues:", CFSTR("screenEdge"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB20], "floatFieldSpecWithName:", CFSTR("originXCoord"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB20], "floatFieldSpecWithName:", CFSTR("originYCoord"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB20], "floatFieldSpecWithName:", CFSTR("touchXCoord"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB20], "floatFieldSpecWithName:", CFSTR("touchYCoord"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DBDB18];
  v16 = *(_QWORD *)(a1 + 32);
  v20[0] = v4;
  v20[1] = v7;
  v20[2] = v10;
  v20[3] = v11;
  v20[4] = v12;
  v20[5] = v13;
  v20[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventSpecWithName:inputModeRequired:fieldSpecs:", v16, 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerEventSpec:", v18);

}

id __109__UIKBAnalyticsDispatcher_dispatchFloatingKeyboardEventOfType_trigger_pinnedToEdge_position_touchUpPosition___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[5];
  const __CFString *v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("FloatingKeyboardUsageEvent");
  v4[0] = CFSTR("KeyboardEventType");
  v4[1] = CFSTR("eventType");
  v6 = *(_OWORD *)(a1 + 32);
  v4[2] = CFSTR("triggerType");
  v4[3] = CFSTR("screenEdge");
  v7 = *(_QWORD *)(a1 + 48);
  v4[4] = CFSTR("TouchCoordinates");
  NSStringFromCGPoint(*(CGPoint *)(a1 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v5, v4, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (void)candidateViewExtended:(id)a3 direction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "preferredEventName:", CFSTR("candidateViewExtended"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __59__UIKBAnalyticsDispatcher_candidateViewExtended_direction___block_invoke;
  v18 = &unk_1E16B1B28;
  v19 = v7;
  v8 = candidateViewExtended_direction__onceToken;
  v9 = v7;
  v10 = v9;
  if (v8 == -1)
  {
    v11 = v9;
  }
  else
  {
    dispatch_once(&candidateViewExtended_direction__onceToken, &v15);
    v11 = v19;
  }
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance", v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  v20[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "currentInputMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dispatchEventWithName:values:inputMode:", v10, v13, v14);

}

void __59__UIKBAnalyticsDispatcher_candidateViewExtended_direction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DBDB20];
  v15[0] = CFSTR("Button");
  v15[1] = CFSTR("Gesture");
  v15[2] = CFSTR("Automatic");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFieldSpecWithName:allowedValues:", CFSTR("EventType"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DBDB20];
  v14[0] = CFSTR("Close");
  v14[1] = CFSTR("Open");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFieldSpecWithName:allowedValues:", CFSTR("Direction"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DBDB18];
  v9 = *(_QWORD *)(a1 + 32);
  v13[0] = v4;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventSpecWithName:inputModeRequired:fieldSpecs:", v9, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerEventSpec:", v11);

}

+ (void)didRevisionBubbleTap
{
  void *v2;
  id v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_textInputSessionAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didRevisionBubbleTap");

}

+ (void)didCandidateReplacement
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;

  +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextCandidateReplacementRemovedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextCandidateReplacementInsertedText");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextCandidateReplacementPostCandidateInsertedText");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = v3;
  else
    v5 = &stru_1E16EDF20;
  if (v4)
    v6 = v4;
  else
    v6 = &stru_1E16EDF20;
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v8 = v2 == 0;
  else
    v8 = 1;
  if (!v8 && (objc_msgSend(v2, "isEqualToString:", v3) & 1) == 0)
  {
    switch(objc_msgSend(v11, "nextCandidateReplacementSource"))
    {
      case 3:
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_textInputSessionAnalytics");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didAutocorrectReplacementForText:withText:", v2, v7);
        goto LABEL_19;
      case 4:
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_textInputSessionAnalytics");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didAutocorrectTapOnCompletionReplacementForText:withText:", v2, v7);
        goto LABEL_19;
      case 5:
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_textInputSessionAnalytics");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didCandidateBarReplacementForText:withText:", v2, v7);
        goto LABEL_19;
      case 6:
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_textInputSessionAnalytics");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didInlineCompletionReplacementForText:withText:", v2, v7);
        goto LABEL_19;
      case 7:
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_textInputSessionAnalytics");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didInlineCompletionTapOnCompletionReplacementForText:withText:", v2, v7);
        goto LABEL_19;
      case 8:
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_textInputSessionAnalytics");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didRevisionBubbleReplacementForText:withText:", v2, v7);
LABEL_19:

        break;
      default:
        break;
    }
  }
  objc_msgSend(v11, "resetCandidateReplacementVariables");

}

+ (void)didCandidateReplacementWithRemovedText:(id)a3 insertedText:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNextCandidateReplacementRemovedText:", v6);

  +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNextCandidateReplacementInsertedText:", v5);

  +[UIKBAnalyticsDispatcher didCandidateReplacement](UIKBAnalyticsDispatcher, "didCandidateReplacement");
}

+ (void)globeKeyEducationShown:(double)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECD7CF60;
  qword_1ECD7CF60 = v4;

  objc_msgSend((id)objc_opt_class(), "preferredEventName:", CFSTR("globeKeyEducationShown"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__UIKBAnalyticsDispatcher_globeKeyEducationShown___block_invoke;
  block[3] = &unk_1E16B1B28;
  v16 = v6;
  v7 = qword_1ECD7CF68;
  v8 = v6;
  v9 = v8;
  if (v7 == -1)
  {
    v10 = v8;
  }
  else
  {
    dispatch_once(&qword_1ECD7CF68, block);
    v10 = v16;
  }
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "currentInputMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatchEventWithName:values:inputMode:", v9, v13, v14);

}

void __50__UIKBAnalyticsDispatcher_globeKeyEducationShown___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBDB20], "floatFieldSpecWithName:", CFSTR("Duration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DBDB18];
  v4 = *(_QWORD *)(a1 + 32);
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventSpecWithName:inputModeRequired:fieldSpecs:", v4, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerEventSpec:", v6);

}

+ (void)globeKeyLongPress
{
  void *v2;
  double v3;
  double v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (qword_1ECD7CF60)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceDate:", qword_1ECD7CF60);
    v4 = v3;

    v5 = v4 < 5.0;
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend((id)objc_opt_class(), "preferredEventName:", CFSTR("globeKeyLongPress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__UIKBAnalyticsDispatcher_globeKeyLongPress__block_invoke;
  block[3] = &unk_1E16B1B28;
  v16 = v6;
  v7 = qword_1ECD7CF70;
  v8 = v6;
  v9 = v8;
  if (v7 == -1)
  {
    v10 = v8;
  }
  else
  {
    dispatch_once(&qword_1ECD7CF70, block);
    v10 = v16;
  }
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "currentInputMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatchEventWithName:values:inputMode:", v9, v13, v14);

}

void __44__UIKBAnalyticsDispatcher_globeKeyLongPress__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("AfterEducation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DBDB18];
  v4 = *(_QWORD *)(a1 + 32);
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventSpecWithName:inputModeRequired:fieldSpecs:", v4, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerEventSpec:", v6);

}

+ (void)handwritingResized:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "preferredEventName:", CFSTR("handwritingResized"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__UIKBAnalyticsDispatcher_handwritingResized___block_invoke;
  block[3] = &unk_1E16B1B28;
  v13 = v4;
  v5 = handwritingResized__onceToken;
  v6 = v4;
  v7 = v6;
  if (v5 == -1)
  {
    v8 = v6;
  }
  else
  {
    dispatch_once(&handwritingResized__onceToken, block);
    v8 = v13;
  }
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "currentInputMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dispatchEventWithName:values:inputMode:", v7, v10, v11);

}

void __46__UIKBAnalyticsDispatcher_handwritingResized___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DBDB20];
  v11[0] = CFSTR("Close");
  v11[1] = CFSTR("Open");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFieldSpecWithName:allowedValues:", CFSTR("Direction"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DBDB18];
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventSpecWithName:inputModeRequired:fieldSpecs:", v6, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerEventSpec:", v8);

}

void __49__UIKBAnalyticsDispatcher_sessionAnalyticsEnded___block_invoke_51(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SessionAction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("InputSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DBDB38];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "roundNumber:toSignificantDigits:", v9, &unk_1E1A972A8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a1[4];
  v14[0] = a1[5];
  v14[1] = v6;
  v14[2] = v7;
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatchEventWithName:values:inputMode:", v12, v13, a1[6]);

}

void __49__UIKBAnalyticsDispatcher_sessionAnalyticsEnded___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SessionAction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("InputSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Dictation")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("Insertion")) & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "roundNumber:toSignificantDigits:", v9, &unk_1E1A972A8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1[4];
    v14[0] = a1[5];
    v14[1] = v6;
    v14[2] = v7;
    v14[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dispatchEventWithName:values:inputMode:", v12, v13, a1[6]);

  }
}

+ (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4 selectedTextBefore:(id)a5 withLanguage:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  length = a4.length;
  location = a4.location;
  v14 = a3;
  v10 = a5;
  v11 = a6;
  if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP")
    || +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_textInputSessionAnalytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "didInsertText:relativeRangeBefore:selectedTextBefore:withLanguage:", v14, location, length, v10, v11);

  }
}

+ (void)didDeleteBackwardText:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP")
    || +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_textInputSessionAnalytics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didDeleteBackwardText:", v5);

  }
}

+ (void)emojiPopoverSummoned:(id)a3 appendsEmoji:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  void *v19;
  _QWORD v20[3];

  v4 = a4;
  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "preferredEventName:", CFSTR("emojiPopoverSummoned"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __61__UIKBAnalyticsDispatcher_emojiPopoverSummoned_appendsEmoji___block_invoke;
  v18 = &unk_1E16B1B28;
  v19 = v6;
  v7 = emojiPopoverSummoned_appendsEmoji__onceToken;
  v8 = v6;
  v9 = v8;
  if (v7 == -1)
  {
    v10 = v8;
  }
  else
  {
    dispatch_once(&emojiPopoverSummoned_appendsEmoji__onceToken, &v15);
    v10 = v19;
  }
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance", v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "currentInputMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatchEventWithName:values:inputMode:", v9, v13, v14);

}

void __61__UIKBAnalyticsDispatcher_emojiPopoverSummoned_appendsEmoji___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DBDB20];
  v12[0] = CFSTR("ucb");
  v12[1] = CFSTR("keyboardShortcut");
  v12[2] = CFSTR("globeKey");
  v12[3] = CFSTR("other");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFieldSpecWithName:allowedValues:", CFSTR("triggerType"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("appendsEmoji"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DBDB18];
  v7 = *(_QWORD *)(a1 + 32);
  v11[0] = v4;
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventSpecWithName:inputModeRequired:fieldSpecs:", v7, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerEventSpec:", v9);

}

+ (void)emojiInsertedByMethod:(id)a3 inputType:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__UIKBAnalyticsDispatcher_emojiInsertedByMethod_inputType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v5 = emojiInsertedByMethod_inputType__onceToken;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&emojiInsertedByMethod_inputType__onceToken, block);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hardwareKeyboardAttached");

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "preferredEventName:", CFSTR("emojiInserted"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "currentInputMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dispatchEventWithName:values:inputMode:", v11, v13, v14);

}

void __59__UIKBAnalyticsDispatcher_emojiInsertedByMethod_inputType___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[6];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DBDB20];
  v14[0] = CFSTR("ReturnKey");
  v14[1] = CFSTR("SearchResult");
  v14[2] = CFSTR("SpaceBar");
  v14[3] = CFSTR("Touch");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringFieldSpecWithName:allowedValues:", CFSTR("selectionMethod"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x1E0DBDB20];
  v13[0] = CFSTR("Keyboard");
  v13[1] = CFSTR("Popover");
  v13[2] = CFSTR("PopoverSearch");
  v13[3] = CFSTR("PredictionBar");
  v13[4] = CFSTR("Search");
  v13[5] = CFSTR("SearchFavorites");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFieldSpecWithName:allowedValues:", CFSTR("inputType"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("hardwareKeyboardAttached"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DBDB18];
  objc_msgSend((id)objc_opt_class(), "preferredEventName:", CFSTR("emojiInserted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v12[1] = v5;
  v12[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventSpecWithName:inputModeRequired:fieldSpecs:", v8, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerEventSpec:", v10);

}

+ (void)keyboardShortcutInvokedWithKeyCommand:(id)a3 keyEvent:(id)a4 keyboardProperties:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  id v30;
  __CFString *v31;
  id v32;
  id v33;
  __CFString *v34;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "language");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "_readableStringForModifierFlagsUsingWords:forHUD:", 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:", v12);

    objc_msgSend(v7, "_readableStringForInputUsingWords:forHUD:outIsSingleCharacterOrKeySymbol:", 0, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:", v13);

  }
  v14 = (id)objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E16EDF20);
  v15 = (void *)objc_msgSend(v11, "copy");
  v16 = v15;
  if (v15 && objc_msgSend(v15, "length"))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentSystemInputMode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v19 && -[__CFString length](v19, "length"))
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "currentSystemInputMode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isExtensionInputMode");

      if (v22)
      {

        v19 = CFSTR("Other");
      }
      _UIMainBundleIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23 && objc_msgSend(v23, "length"))
      {
        objc_msgSend(v8, "_keyCode");
        objc_msgSend(v8, "_modifierFlags");
        objc_msgSend(v9, "subinterfaceID");
        objc_msgSend(v9, "standardType");
        NSStringFromSelector((SEL)objc_msgSend(v7, "action"));
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        v27 = CFSTR("unknown");
        if (v25)
          v27 = (__CFString *)v25;
        v28 = v27;

        v30 = v10;
        v31 = v19;
        v32 = v24;
        v33 = v16;
        v34 = v28;
        v29 = v28;
        AnalyticsSendEventLazy();

      }
    }

  }
}

id __93__UIKBAnalyticsDispatcher_keyboardShortcutInvokedWithKeyCommand_keyEvent_keyboardProperties___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[9];
  _QWORD v16[6];
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("keyCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)(a1 + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = CFSTR("modifierFlags");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 80));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v5;
  v15[2] = CFSTR("keyboardType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 88));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  v15[3] = CFSTR("keyboardStandardType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 96));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("unknown");
  v12 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
    v11 = *(const __CFString **)(a1 + 32);
  v16[3] = v9;
  v16[4] = v11;
  v15[4] = CFSTR("keyboardLanguage");
  v15[5] = CFSTR("inputSource");
  v16[5] = v12;
  v17 = *(_OWORD *)(a1 + 48);
  v15[6] = CFSTR("bundleId");
  v15[7] = CFSTR("shortcut");
  v15[8] = CFSTR("title");
  v18 = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (void)keyboardCameraSessionEndedForTextContentType:(id)a3 didFindText:(BOOL)a4 didInsertText:(BOOL)a5 sender:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  __CFString *v9;
  id v10;
  __CFString *v11;
  __CFString **v12;
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v7 = a5;
  v8 = a4;
  v19[4] = *MEMORY[0x1E0C80C00];
  v9 = (__CFString *)a3;
  v10 = a6;
  if (keyboardCameraSessionEndedForTextContentType_didFindText_didInsertText_sender__onceToken != -1)
    dispatch_once(&keyboardCameraSessionEndedForTextContentType_didFindText_didInsertText_sender__onceToken, &__block_literal_global_82);
  if (!-[__CFString length](v9, "length"))
  {

    v9 = CFSTR("None");
  }
  v11 = CFSTR("custom");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = UIKBAnalyticsKeyboardCameraInvocationSourceTextSuggestion;
LABEL_9:
    v14 = *v12;

    v11 = v14;
    goto LABEL_10;
  }
  +[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v10)
  {
    v12 = UIKBAnalyticsKeyboardCameraInvocationSourceCalloutBar;
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v17;
  v19[2] = v9;
  v19[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dispatchEventWithName:values:", CFSTR("keyboardCameraSessionEnded"), v18);

}

void __105__UIKBAnalyticsDispatcher_keyboardCameraSessionEndedForTextContentType_didFindText_didInsertText_sender___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("didInsert"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("didFindText"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", CFSTR("textContentType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DBDB20];
  v11[0] = CFSTR("calloutBar");
  v11[1] = CFSTR("textSuggestion");
  v11[2] = CFSTR("custom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFieldSpecWithName:allowedValues:", CFSTR("invocationSource"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DBDB18];
  v10[0] = v0;
  v10[1] = v1;
  v10[2] = v2;
  v10[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("keyboardCameraSessionEnded"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerEventSpec:", v8);

}

+ (void)hapticEventEngineDuration:(double)a3 startCount:(unint64_t)a4 actionCount:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  if (hapticEventEngineDuration_startCount_actionCount__onceToken != -1)
    dispatch_once(&hapticEventEngineDuration_startCount_actionCount__onceToken, &__block_literal_global_87);
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", llround(a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchEventWithName:values:", CFSTR("HapticFeedback.Daily"), v12);

}

void __76__UIKBAnalyticsDispatcher_hapticEventEngineDuration_startCount_actionCount___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:", CFSTR("EngineActiveTime"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:", CFSTR("EngineStartCount"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:", CFSTR("ActionCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DBDB18];
  v7[0] = v0;
  v7[1] = v1;
  v7[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("HapticFeedback.Daily"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerEventSpec:", v5);

}

- (unint64_t)nextCandidateReplacementSource
{
  return self->_nextCandidateReplacementSource;
}

- (void)setNextCandidateReplacementSource:(unint64_t)a3
{
  self->_nextCandidateReplacementSource = a3;
}

- (NSString)nextCandidateReplacementRemovedText
{
  return self->_nextCandidateReplacementRemovedText;
}

- (void)setNextCandidateReplacementRemovedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)nextCandidateReplacementInsertedText
{
  return self->_nextCandidateReplacementInsertedText;
}

- (void)setNextCandidateReplacementInsertedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)nextCandidateReplacementPostCandidateInsertedText
{
  return self->_nextCandidateReplacementPostCandidateInsertedText;
}

- (void)setNextCandidateReplacementPostCandidateInsertedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)analyticsSkipDidKeyPress
{
  return self->_analyticsSkipDidKeyPress;
}

- (void)setAnalyticsSkipDidKeyPress:(BOOL)a3
{
  self->_analyticsSkipDidKeyPress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextCandidateReplacementPostCandidateInsertedText, 0);
  objc_storeStrong((id *)&self->_nextCandidateReplacementInsertedText, 0);
  objc_storeStrong((id *)&self->_nextCandidateReplacementRemovedText, 0);
}

@end
