@implementation UITextInputSessionActionAnalytics

- (void)q_updateAnalyticsFromAccumulators
{
  unint64_t v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableSet *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableOrderedSet count](self->_recentActions, "count");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = self->_accumulators;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v9, "depthRange") <= v3)
          objc_msgSend(v9, "increaseWithActions:", self->_recentActions);
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v6);
  }

  if (v3)
  {
    -[NSMutableOrderedSet firstObject](self->_recentActions, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = self->_efficacyAccumulators;
    v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "increaseWithAction:", v10);
        }
        v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v13);
    }

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = self->_dynamicAccumulators;
  v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * k);
        if (objc_msgSend(v21, "depthRange", (_QWORD)v22) <= v3)
          objc_msgSend(v21, "increaseWithActions:", self->_recentActions);
      }
      v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v18);
  }

}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asInsertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "insertedTextLength");
  else
    v4 = 0;

  return v4;
}

unint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "relativeRangeBefore");
  v5 = v4;
  objc_msgSend(v3, "rangeAfter");
  v7 = v6;
  v8 = objc_msgSend(v3, "relativeRangeBefore");
  v10 = v9;
  v11 = objc_msgSend(v3, "rangeAfter");
  if (v5 != v7)
  {
    if (v10 <= v12)
      v10 = v12;
    objc_msgSend(v3, "relativeRangeBefore");
    v15 = v14;
    objc_msgSend(v3, "rangeAfter");
    if (v15 >= v16)
      v17 = v16;
    else
      v17 = v15;
    goto LABEL_15;
  }
  if (v8 != v11)
  {
    v18 = objc_msgSend(v3, "relativeRangeBefore");
    v19 = objc_msgSend(v3, "rangeAfter");
    if (v18 <= v19)
      v10 = v19;
    else
      v10 = v18;
    v20 = objc_msgSend(v3, "relativeRangeBefore");
    v21 = objc_msgSend(v3, "rangeAfter");
    if (v20 >= v21)
      v17 = v21;
    else
      v17 = v20;
LABEL_15:
    v13 = v10 - v17;
    goto LABEL_16;
  }
  v13 = 0;
LABEL_16:

  return v13;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asDeletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "removedTextLength");
  else
    v4 = 0;

  return v4;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asInsertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "withAlternativesCount");
  else
    v4 = 0;

  return v4;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asInsertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "insertedPunctuationCount");
  else
    v4 = 0;

  return v4;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_69(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v5;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asInsertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v3, "source") == 3 && v3 != 0 && objc_msgSend(v3, "insertedTextLength") != 0;
  return v5;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asInsertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "insertedEmojiCount");
  else
    v4 = 0;

  return v4;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asDictationBegan");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "modelessUsedAtLeastOnceCount");
  else
    v4 = 0;

  return v4;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asDictationBegan");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "multiModalDictationBeganCount");
  else
    v4 = 0;

  return v4;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asDictationBegan");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "dictationBeganCount");
  else
    v4 = 0;

  return v4;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_16(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asReplaceWithCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "replaceWithCandidateType") == 3;
  return v4;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_15(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asReplaceWithCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "replaceWithCandidateType") == 2;
  return v4;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_14(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asReplaceWithCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "replaceWithCandidateType") == 1;
  return v4;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asReplaceWithCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asRedo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asUndo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asBegan");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_19(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (v5 = 1,
        objc_msgSend(v2, "objectAtIndex:", 1),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "asSelection"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v7,
        !v7))
  {
    v5 = 0;
  }

  return v5;
}

- (void)setDelegateSource:(id)a3
{
  objc_storeWeak((id *)&self->_delegateSource, a3);
}

- (UITextInputSessionActionAnalytics)init
{
  UITextInputSessionActionAnalytics *v2;
  UITextInputSessionActionAnalytics *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMutableOrderedSet *recentActions;
  uint64_t v9;
  NSMutableSet *accumulators;
  uint64_t v11;
  NSMutableSet *efficacyAccumulators;
  uint64_t v13;
  NSMutableSet *dynamicAccumulators;
  uint64_t v15;
  UITextInputSessionActionAnalytics *v16;
  NSString *overrideInputModeString;
  void *v18;
  NSObject *v19;
  _QWORD v21[4];
  UITextInputSessionActionAnalytics *v22;
  _QWORD block[4];
  UITextInputSessionActionAnalytics *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)UITextInputSessionActionAnalytics;
  v2 = -[UITextInputSessionActionAnalytics init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_maxDepth = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.UIKit.UITextInputSessionActionAnalytics", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 20);
    recentActions = v3->_recentActions;
    v3->_recentActions = (NSMutableOrderedSet *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 100);
    accumulators = v3->_accumulators;
    v3->_accumulators = (NSMutableSet *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 10);
    efficacyAccumulators = v3->_efficacyAccumulators;
    v3->_efficacyAccumulators = (NSMutableSet *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    dynamicAccumulators = v3->_dynamicAccumulators;
    v3->_dynamicAccumulators = (NSMutableSet *)v13;

    v3->_trackingDuration = 0;
    v3->_allowCursorMovementCounter = 0;
    v3->_overrideSource = 0;
    v3->_useOverrideSourceCounter = 0;
    v15 = MEMORY[0x1E0C809B0];
    if (_MergedGlobals_1088)
    {
      objc_msgSend((id)_MergedGlobals_1088, "setAnalyticsDelegate:", v3);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__UITextInputSessionActionAnalytics_init__block_invoke;
      block[3] = &unk_1E16B1B28;
      v16 = v3;
      v24 = v16;
      if (qword_1ECD7E288 != -1)
      {
        dispatch_once(&qword_1ECD7E288, block);
        v16 = v24;
      }

    }
    overrideInputModeString = v3->_overrideInputModeString;
    v3->_overrideInputModeString = 0;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v3, sel_writeAnalytics, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v3, sel_didBegin, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
    if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP")
      || +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      objc_msgSend(v18, "addObserver:selector:name:object:", v3, sel_didDictationEnd, CFSTR("UIDictationControllerDictationDidFinish"), 0);
    }
    v19 = v3->_queue;
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __41__UITextInputSessionActionAnalytics_init__block_invoke_46;
    v21[3] = &unk_1E16B1B28;
    v22 = v3;
    dispatch_async(v19, v21);

  }
  return v3;
}

void __56__UITextInputSessionActionAnalytics_allAccumulatorNames__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "name", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __63__UITextInputSessionActionAnalytics_q_copyAccumulatorWithName___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __41__UITextInputSessionActionAnalytics_init__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v1 = objc_msgSend(objc_alloc((Class)getIATextInputActionsAnalyticsClass()), "initWithAnalyticsMetadataObserver:", *(_QWORD *)(a1 + 32));
  v2 = (void *)_MergedGlobals_1088;
  _MergedGlobals_1088 = v1;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    UITextInputSessionLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputAnalytics SPI compatible", buf, 2u);
    }
  }
  else
  {
    UITextInputSessionLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_debug_impl(&dword_185066000, v4, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputAnalytics SPI not compatible", v5, 2u);
    }

    v3 = _MergedGlobals_1088;
    _MergedGlobals_1088 = 0;
  }

}

- (void)q_setupDefaultAnalytics
{
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  _QWORD v64[3];
  _QWORD v65[4];

  v65[3] = *MEMORY[0x1E0C80C00];
  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Began"), 1, 1, &__block_literal_global_212);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v3);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("DictationBegan"), 1, 1, &__block_literal_global_213);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v4);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("MultiModalDictationBeganCount"), 1, 1, &__block_literal_global_214);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v5);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("ModelessUsedAtLeastOnce"), 1, 1, &__block_literal_global_215);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v6);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Insertion"), 1, 1, &__block_literal_global_216);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v7);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("EmojiCount"), 1, 1, &__block_literal_global_217);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v8);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("PunctuationCount"), 1, 1, &__block_literal_global_218);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v9);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Insertion with Alternative"), 1, 1, &__block_literal_global_219);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v10);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Deletion"), 1, 1, &__block_literal_global_220);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v11);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Selection Change"), 1, 1, &__block_literal_global_221);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v12);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Undo"), 1, 1, &__block_literal_global_222);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v13);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Redo"), 1, 1, &__block_literal_global_223);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v14);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Replace With Candidate"), 1, 1, &__block_literal_global_224);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v15);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Replace With Candidate (case)"), 1, 1, &__block_literal_global_225);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v16);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Replace With Latin Candidate"), 1, 1, &__block_literal_global_226);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v17);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Replace With Non-Latin Candidate"), 1, 1, &__block_literal_global_227);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v18);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Undo after Insertion"), 1, 2, &__block_literal_global_228);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v19);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Undo after Deletion"), 1, 2, &__block_literal_global_229);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v20);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Consecutive Selection"), 1, 2, &__block_literal_global_230_0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v21);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Consecutive Cursor"), 1, 2, &__block_literal_global_231);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v22);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Consecutive Ranged"), 1, 2, &__block_literal_global_233);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v23);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Triple Selection"), 1, 3, &__block_literal_global_234);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v24);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Triple Cursor"), 1, 3, &__block_literal_global_235);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v25);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Triple Ranged"), 1, 3, &__block_literal_global_236);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v26);

  -[UITextInputSessionActionAnalytics q_copyAccumulatorWithName:](self, "q_copyAccumulatorWithName:", CFSTR("Insertion"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v27;
  -[UITextInputSessionActionAnalytics q_copyAccumulatorWithName:](self, "q_copyAccumulatorWithName:", CFSTR("Selection Change"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v28;
  -[UITextInputSessionActionAnalytics q_copyAccumulatorWithName:](self, "q_copyAccumulatorWithName:", CFSTR("Insertion"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextInputSessionMetaAccumulator accumulatorWithName:accumulators:](_UITextInputSessionMetaAccumulator, "accumulatorWithName:accumulators:", CFSTR("Insertion-Selection-Insertion"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v31);

  -[UITextInputSessionActionAnalytics q_copyAccumulatorWithName:](self, "q_copyAccumulatorWithName:", CFSTR("Insertion"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v32;
  -[UITextInputSessionActionAnalytics q_copyAccumulatorWithName:](self, "q_copyAccumulatorWithName:", CFSTR("Consecutive Selection"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v33;
  -[UITextInputSessionActionAnalytics q_copyAccumulatorWithName:](self, "q_copyAccumulatorWithName:", CFSTR("Insertion"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextInputSessionMetaAccumulator accumulatorWithName:accumulators:](_UITextInputSessionMetaAccumulator, "accumulatorWithName:accumulators:", CFSTR("Insertion-2xSelection-Insertion"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v36);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Dictation to Keyboard"), 0, 2, &__block_literal_global_238);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v37);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Dictation to Emoji"), 0, 2, 2, &__block_literal_global_239);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v38);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Dictation to Punctuation"), 0, 2, 2, &__block_literal_global_240);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v39);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Dictation to Emoji Edit"), 0, 2, 2, &__block_literal_global_241);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v40);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Dictation to Punctuation Edit"), 0, 2, 2, &__block_literal_global_242);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v41);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Dictation-Selection-Deletion"), 0, 3, 1, &__block_literal_global_243);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v42);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Dictation to Whitespace"), 0, 2, 2, &__block_literal_global_244);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v43);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Dictation to Deletion"), 0, 2, 2, &__block_literal_global_245);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v44);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Pencil to Keyboard"), 0, 2, &__block_literal_global_246);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v45);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Pencil to Emoji"), 0, 2, 2, &__block_literal_global_247);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v46);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Pencil to Punctuation"), 0, 2, 2, &__block_literal_global_248);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v47);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Pencil to Whitespace"), 0, 2, 2, &__block_literal_global_249);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v48);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Pencil to Deletion"), 0, 3, &__block_literal_global_250);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v49);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Keyboard to Pencil"), 0, 2, &__block_literal_global_251);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v50);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Keyboard to Dictation"), 0, 2, &__block_literal_global_252_0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v51);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Camera to Other"), 0, 2, &__block_literal_global_253);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v52);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Camera to Deletion"), 0, 2, 2, &__block_literal_global_254);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v53);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Edited Dictation with Keyboard"), 0, 2, 2, &__block_literal_global_255);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v54);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Edited Pencil with Keyboard"), 0, 2, 2, &__block_literal_global_256);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v55);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Edited Keyboard with Pencil"), 0, 2, 2, &__block_literal_global_257_0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v56);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depthRange:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depthRange:block:", CFSTR("Edited Camera with Other"), 0, 2, 2, &__block_literal_global_258);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v57);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("KB Suppression False Positive"), 0, 2, &__block_literal_global_259_0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v58);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("KB Suppression False Negative"), 0, 2, &__block_literal_global_260_0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v59);

  +[_UITextInputSessionAccumulator accumulatorWithName:type:depth:block:](_UITextInputSessionAccumulator, "accumulatorWithName:type:depth:block:", CFSTR("Insertion With Pencil"), 0, 1, &__block_literal_global_261);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics q_addAccumulator:](self, "q_addAccumulator:", v60);

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "userInterfaceIdiom");

  if (!v62)
  {
    +[_UITextInputSessionDynamicAccumulator accumulatorWithName:depthRange:block:](_UITextInputSessionDynamicAccumulator, "accumulatorWithName:depthRange:block:", CFSTR("com.apple.inputAnalytics.accidentalDictation"), 1, 3, &__block_literal_global_265);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputSessionActionAnalytics q_addDynamicAccumulator:](self, "q_addDynamicAccumulator:", v63);

  }
}

- (void)q_addAccumulator:(id)a3
{
  unint64_t maxDepth;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;

  maxDepth = self->_maxDepth;
  v8 = a3;
  v5 = objc_msgSend(v8, "depthRange");
  v7 = v5 + v6;
  if (maxDepth > v5 + v6)
    v7 = maxDepth;
  self->_maxDepth = v7;
  -[NSMutableSet addObject:](self->_accumulators, "addObject:", v8);

}

- (id)q_copyAccumulatorWithName:(id)a3
{
  id v4;
  NSMutableSet *accumulators;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, _BYTE *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__113;
  v19 = __Block_byref_object_dispose__113;
  v20 = 0;
  accumulators = self->_accumulators;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __63__UITextInputSessionActionAnalytics_q_copyAccumulatorWithName___block_invoke;
  v12 = &unk_1E16CB668;
  v6 = v4;
  v13 = v6;
  v14 = &v15;
  -[NSMutableSet enumerateObjectsWithOptions:usingBlock:](accumulators, "enumerateObjectsWithOptions:usingBlock:", 2, &v9);
  v7 = (void *)objc_msgSend((id)v16[5], "copy", v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (void)q_setSeparateCycleAccumulatorNames:(id)a3
{
  objc_storeStrong((id *)&self->_separateCycleAccumulatorNames, a3);
}

- (void)q_addEfficacyAccumulator:(id)a3
{
  -[NSMutableSet addObject:](self->_efficacyAccumulators, "addObject:", a3);
}

- (void)q_addDynamicAccumulator:(id)a3
{
  -[NSMutableSet addObject:](self->_dynamicAccumulators, "addObject:", a3);
}

uint64_t __45__UITextInputSessionActionAnalytics_didBegin__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend((id)objc_opt_class(), "q_notifyStartingObservers");
}

- (void)q_addActionAndUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSMutableOrderedSet firstObject](self->_recentActions, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mergeActionIfPossible:", v4);
    UITextInputSessionLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134218498;
      v9 = v6;
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v4;
      _os_log_debug_impl(&dword_185066000, v7, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] q_addActionAndUpdate: Merge result %lu lastAction:%@ newAction:%@", (uint8_t *)&v8, 0x20u);
    }

    if (v5)
    {
      if (v6)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[UITextInputSessionActionAnalytics q_updateAnalyticsFromAccumulators](self, "q_updateAnalyticsFromAccumulators");
      if (-[NSMutableOrderedSet count](self->_recentActions, "count") > self->_maxDepth)
        -[NSMutableOrderedSet removeObjectsInRange:](self->_recentActions, "removeObjectsInRange:");
    }
    -[NSMutableOrderedSet insertObject:atIndex:](self->_recentActions, "insertObject:atIndex:", v4, 0);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)didBegin
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[UITextInputSessionActionAnalytics sessionIdentifier](self, "sessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v10;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didBegin: sessionIdentifier=%@", buf, 0xCu);

  }
  -[UITextInputSessionActionAnalytics delegateSource](self, "delegateSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputSessionActionAnalytics setSessionIdentifier:](self, "setSessionIdentifier:", v5);

  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asBegan");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_MergedGlobals_1088, "didSessionBegin");
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__UITextInputSessionActionAnalytics_didBegin__block_invoke;
  v11[3] = &unk_1E16B1B50;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  dispatch_async(queue, v11);

}

- (void)setSessionIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *v6;
  NSUUID *v7;
  NSUUID *sessionIdentifier;
  int v9;
  NSUUID *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    LOWORD(v9) = 0;
    _os_log_fault_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "UITextInputSessionActionAnalytics is nil", (uint8_t *)&v9, 2u);
  }
  if ((-[NSUUID isEqual:](self->_sessionIdentifier, "isEqual:", v4) & 1) == 0)
  {
    UITextInputSessionLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      sessionIdentifier = self->_sessionIdentifier;
      v9 = 138412546;
      v10 = sessionIdentifier;
      v11 = 2112;
      v12 = v4;
      _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] setSessionIdentifier:%@ -> %@", (uint8_t *)&v9, 0x16u);
    }

  }
  v6 = (NSUUID *)objc_msgSend(v4, "copy");
  v7 = self->_sessionIdentifier;
  self->_sessionIdentifier = v6;

}

- (id)_instanceOfActionClass:(Class)a3
{
  id v5;
  void *v6;

  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v5 = objc_alloc_init(a3);
    objc_msgSend(v5, "setSource:", -[UITextInputSessionActionAnalytics _getActiveTextInputSource](self, "_getActiveTextInputSource"));
    if (+[UIKeyboard isShowingEmojiSearch](UIKeyboard, "isShowingEmojiSearch"))
      objc_msgSend(v5, "setFlagOptions:", objc_msgSend(v5, "flagOptions") | 1);
    -[UITextInputSessionActionAnalytics getAppBundleId](self, "getAppBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAppBundleId:", v6);

    +[UITextInputSessionActionAnalytics populateActionInputMode:](UITextInputSessionActionAnalytics, "populateActionInputMode:", v5);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (UITextInputSessionActionAnalyticsDelegateSource)delegateSource
{
  return (UITextInputSessionActionAnalyticsDelegateSource *)objc_loadWeakRetained((id *)&self->_delegateSource);
}

- (id)getAppBundleId
{
  void *v2;

  if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP")
    && +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _UIMainBundleIdentifier();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (void)populateActionInputMode:(id)a3 withLanguage:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;

  v18 = a3;
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_4:
    TIInputModeGetLanguage();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLanguage:", v10);

    TIInputModeGetRegion();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRegion:", v11);

    TIInputModeGetVariant();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setKeyboardVariant:", v12);

    if (objc_msgSend(v18, "source") == 4)
    {
      TIInputModeGetComponentsFromIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("hw"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setKeyboardLayout:", v14);

    }
    else
    {
      TIInputModeGetSWLayout();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setKeyboardLayout:", v13);
    }

    goto LABEL_8;
  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentInputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifierWithLayouts");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
LABEL_8:
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "inputDelegateManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasAsyncCapableInputDelegate");

  if (v17)
    objc_msgSend(v18, "setKeyboardType:", CFSTR("Web"));

}

+ (void)populateActionInputMode:(id)a3
{
  +[UITextInputSessionActionAnalytics populateActionInputMode:withLanguage:](UITextInputSessionActionAnalytics, "populateActionInputMode:withLanguage:", a3, 0);
}

id __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_70(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  UITextInputSessionAccidentalDictationCheckForDictationResult(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UITextInputSessionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    _UITextInputSessionAccidentalDictationOutcomeString(objc_msgSend(v4, "result"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = CFSTR("com.apple.inputAnalytics.accidentalDictation");
    v20 = 2112;
    v21 = v13;
    _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionDefaultAnalytics][%@] increaseWithActions received result %@ for dictation key", buf, 0x16u);

  }
  UITextInputSessionAccidentalDictationGetAnalyticsPayloadForResult(v2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v17 = v7;
    AnalyticsSendEventLazy();
    objc_msgSend(v3, "addObject:", v17);

  }
  UITextInputSessionAccidentalDictationCheckForGlobeResult(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UITextInputSessionLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    _UITextInputSessionAccidentalDictationOutcomeString(objc_msgSend(v8, "result"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = CFSTR("com.apple.inputAnalytics.accidentalDictation");
    v20 = 2112;
    v21 = v14;
    _os_log_debug_impl(&dword_185066000, v9, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionDefaultAnalytics][%@] increaseWithActions received result %@ for globe key", buf, 0x16u);

  }
  UITextInputSessionAccidentalDictationGetAnalyticsPayloadForResult(v2, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "count"))
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = v11;
    AnalyticsSendEventLazy();
    objc_msgSend(v3, "addObject:", v16, v15, 3221225472, __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_269, &unk_1E16B6E28);

  }
  return v3;
}

- (void)setKeyboardTrialParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

+ (void)q_notifyStartingObservers
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)__endingObservers;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "didBeginSession", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __77__UITextInputSessionActionAnalytics_Default__allowedValuesForTextInputSource__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];

  v2[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Unspecified");
  v2[1] = CFSTR("KeyboardTap");
  v2[2] = CFSTR("KeyboardHardware");
  v2[3] = CFSTR("KeyboardThirdParty");
  v2[4] = CFSTR("KeyboardPath");
  v2[5] = CFSTR("KeyboardCamera");
  v2[6] = CFSTR("Pencil");
  v2[7] = CFSTR("Dictation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_966;
  _MergedGlobals_966 = v0;

}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_68(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "source") != 3)
    goto LABEL_7;
  objc_msgSend(v2, "objectAtIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "source");
  if ((unint64_t)(v5 - 4) >= 5 && v5 != 1)
  {

    goto LABEL_7;
  }
  objc_msgSend(v4, "asBegan");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v7 = 1;
LABEL_8:

  return v7;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_67(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "source");
  v5 = (unint64_t)(v4 - 4) < 5 || v4 == 1;
  if (!v5 || (objc_msgSend(v3, "changedContent") & 1) != 0)
    goto LABEL_11;
  objc_msgSend(v2, "objectAtIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "source") != 3)
  {

    goto LABEL_11;
  }
  objc_msgSend(v6, "asBegan");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  v8 = 1;
LABEL_12:

  return v8;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_66(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  int v14;
  void *v15;

  v7 = a2;
  v8 = v7;
  if (!a3)
  {
    v15 = v7;
    if (objc_msgSend(v7, "source") != 7 || !objc_msgSend(v15, "changedContent"))
    {
      v10 = (uint64_t *)(a1 + 32);
      goto LABEL_12;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
LABEL_15:
    v8 = v15;
    goto LABEL_16;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v10 = (uint64_t *)(a1 + 32);
  v9 = v11;
  if (*(_QWORD *)(*(_QWORD *)(v11 + 8) + 24))
  {
LABEL_13:
    *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_16;
  }
  v15 = v7;
  v12 = objc_msgSend(v7, "changedContent");
  v9 = *v10;
  v13 = *(_QWORD *)(*v10 + 8);
  if ((v12 & 1) == 0)
  {
    *(_QWORD *)(v13 + 24) = 0;
    goto LABEL_15;
  }
  v8 = v15;
  if (*(_QWORD *)(v13 + 24))
    goto LABEL_13;
  if (objc_msgSend(v15, "source") == 7)
  {
LABEL_12:
    v8 = v15;
    v9 = *v10;
    goto LABEL_13;
  }
  v14 = objc_msgSend(v15, "changedContent");
  v9 = *v10;
  v8 = v15;
  if (!v14)
    goto LABEL_13;
  *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 1;
LABEL_16:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_65(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_66;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_64(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;

  v7 = a2;
  if (!a3)
  {
    v15 = v7;
    if (objc_msgSend(v7, "source") == 3 && objc_msgSend(v15, "changedContent"))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      goto LABEL_17;
    }
    v9 = (uint64_t *)(a1 + 32);
    goto LABEL_13;
  }
  v10 = *(_QWORD *)(a1 + 32);
  v9 = (uint64_t *)(a1 + 32);
  v8 = v10;
  if (!*(_QWORD *)(*(_QWORD *)(v10 + 8) + 24))
  {
    v15 = v7;
    v11 = objc_msgSend(v7, "changedContent");
    v8 = *v9;
    v12 = *(_QWORD *)(*v9 + 8);
    if ((v11 & 1) == 0)
    {
      *(_QWORD *)(v12 + 24) = 0;
      goto LABEL_17;
    }
    v7 = v15;
    if (!*(_QWORD *)(v12 + 24))
    {
      v13 = objc_msgSend(v15, "source");
      if ((unint64_t)(v13 - 4) < 5 || v13 == 1)
      {
        v14 = objc_msgSend(v15, "changedContent");
        v8 = *v9;
        if (v14)
        {
          *(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) = 1;
LABEL_17:
          v7 = v15;
          goto LABEL_18;
        }
        goto LABEL_14;
      }
LABEL_13:
      v8 = *v9;
LABEL_14:
      v7 = v15;
    }
  }
  *(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) = 2;
  *a4 = 1;
LABEL_18:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_63(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_64;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_62(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  BOOL v16;
  void *v17;

  v7 = a2;
  v8 = v7;
  if (!a3)
  {
    v17 = v7;
    v15 = objc_msgSend(v7, "source");
    v16 = (unint64_t)(v15 - 4) < 5 || v15 == 1;
    if (!v16 || !objc_msgSend(v17, "changedContent"))
    {
      v10 = (uint64_t *)(a1 + 32);
      goto LABEL_16;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
LABEL_19:
    v8 = v17;
    goto LABEL_20;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v10 = (uint64_t *)(a1 + 32);
  v9 = v11;
  if (*(_QWORD *)(*(_QWORD *)(v11 + 8) + 24))
  {
LABEL_17:
    *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_20;
  }
  v17 = v7;
  v12 = objc_msgSend(v7, "changedContent");
  v9 = *v10;
  v13 = *(_QWORD *)(*v10 + 8);
  if ((v12 & 1) == 0)
  {
    *(_QWORD *)(v13 + 24) = 0;
    goto LABEL_19;
  }
  v8 = v17;
  if (*(_QWORD *)(v13 + 24))
    goto LABEL_17;
  if (objc_msgSend(v17, "source") != 3)
  {
LABEL_16:
    v8 = v17;
    v9 = *v10;
    goto LABEL_17;
  }
  v14 = objc_msgSend(v17, "changedContent");
  v9 = *v10;
  v8 = v17;
  if (!v14)
    goto LABEL_17;
  *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 1;
LABEL_20:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_61(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_62;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_60(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  BOOL v16;
  void *v17;

  v7 = a2;
  v8 = v7;
  if (!a3)
  {
    v17 = v7;
    v15 = objc_msgSend(v7, "source");
    v16 = (unint64_t)(v15 - 4) < 5 || v15 == 1;
    if (!v16 || !objc_msgSend(v17, "changedContent"))
    {
      v10 = (uint64_t *)(a1 + 32);
      goto LABEL_16;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
LABEL_19:
    v8 = v17;
    goto LABEL_20;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v10 = (uint64_t *)(a1 + 32);
  v9 = v11;
  if (*(_QWORD *)(*(_QWORD *)(v11 + 8) + 24))
  {
LABEL_17:
    *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_20;
  }
  v17 = v7;
  v12 = objc_msgSend(v7, "changedContent");
  v9 = *v10;
  v13 = *(_QWORD *)(*v10 + 8);
  if ((v12 & 1) == 0)
  {
    *(_QWORD *)(v13 + 24) = 0;
    goto LABEL_19;
  }
  v8 = v17;
  if (*(_QWORD *)(v13 + 24))
    goto LABEL_17;
  if (objc_msgSend(v17, "source") != 2)
  {
LABEL_16:
    v8 = v17;
    v9 = *v10;
    goto LABEL_17;
  }
  v14 = objc_msgSend(v17, "changedContent");
  v9 = *v10;
  v8 = v17;
  if (!v14)
    goto LABEL_17;
  *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 1;
LABEL_20:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_59(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_60;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_58(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;

  v7 = a2;
  v8 = v7;
  if (!a3)
  {
    v14 = v7;
    objc_msgSend(v7, "asDeletion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(a1 + 32);
    if (!v13)
    {
LABEL_13:
      v8 = v14;
      goto LABEL_14;
    }
    *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 0;
LABEL_11:
    v8 = v14;
    goto LABEL_15;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(v9 + 8) + 24))
  {
LABEL_14:
    *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_15;
  }
  v14 = v7;
  v10 = objc_msgSend(v7, "changedContent");
  v9 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v9 + 8);
  if ((v10 & 1) == 0)
  {
    *(_QWORD *)(v11 + 24) = 0;
    goto LABEL_11;
  }
  v8 = v14;
  if (*(_QWORD *)(v11 + 24))
    goto LABEL_14;
  if (objc_msgSend(v14, "source") != 7)
  {
    v9 = *(_QWORD *)(a1 + 32);
    goto LABEL_13;
  }
  v12 = objc_msgSend(v14, "changedContent");
  v9 = *(_QWORD *)(a1 + 32);
  v8 = v14;
  if (!v12)
    goto LABEL_14;
  *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 1;
LABEL_15:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_57(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_58;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_56(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "source") != 7
    || (v4 = 1,
        objc_msgSend(v2, "objectAtIndex:", 1),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "source"),
        v5,
        v6 == 7))
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_55(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "source") == 2)
  {
    objc_msgSend(v2, "objectAtIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "source");
    if ((unint64_t)(v5 - 1) > 7)
      v6 = 0;
    else
      v6 = qword_1866794B8[v5 - 1];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_54(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "source") == 3)
  {
    objc_msgSend(v2, "objectAtIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "source");
    if ((unint64_t)(v5 - 1) > 7)
      v6 = 0;
    else
      v6 = qword_1866794B8[v5 - 1];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_51(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  uint64_t v14;
  int v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "asInsertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 || !v7)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24);
    v12 = a3 != 0;
    if (a3 && !v11)
    {
      v13 = objc_msgSend(v16, "changedContent");
      v10 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(v10 + 8);
      if (!v13)
      {
        *(_QWORD *)(v14 + 24) = 0;
        goto LABEL_17;
      }
      v11 = *(_QWORD *)(v14 + 24);
      v12 = 1;
    }
    if (v12 && !v11)
    {
      if (objc_msgSend(v16, "source") == 3)
      {
        v15 = objc_msgSend(v16, "changedContent");
        v10 = *(_QWORD *)(a1 + 32);
        if (v15)
        {
          *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 1;
          goto LABEL_17;
        }
      }
      else
      {
        v10 = *(_QWORD *)(a1 + 32);
      }
    }
LABEL_16:
    *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_17;
  }
  v9 = objc_msgSend(v7, "options");
  v10 = *(_QWORD *)(a1 + 32);
  if ((v9 & 4) == 0)
    goto LABEL_16;
  *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 0;
LABEL_17:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_50(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_51;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_49(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  uint64_t v14;
  int v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "asInsertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 || !v7)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24);
    v12 = a3 != 0;
    if (a3 && !v11)
    {
      v13 = objc_msgSend(v16, "changedContent");
      v10 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(v10 + 8);
      if (!v13)
      {
        *(_QWORD *)(v14 + 24) = 0;
        goto LABEL_17;
      }
      v11 = *(_QWORD *)(v14 + 24);
      v12 = 1;
    }
    if (v12 && !v11)
    {
      if (objc_msgSend(v16, "source") == 3)
      {
        v15 = objc_msgSend(v16, "changedContent");
        v10 = *(_QWORD *)(a1 + 32);
        if (v15)
        {
          *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 1;
          goto LABEL_17;
        }
      }
      else
      {
        v10 = *(_QWORD *)(a1 + 32);
      }
    }
LABEL_16:
    *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_17;
  }
  v9 = objc_msgSend(v7, "options");
  v10 = *(_QWORD *)(a1 + 32);
  if ((v9 & 2) == 0)
    goto LABEL_16;
  *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 0;
LABEL_17:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_48(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_49;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_47(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  uint64_t v14;
  int v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "asInsertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 || !v7)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24);
    v12 = a3 != 0;
    if (a3 && !v11)
    {
      v13 = objc_msgSend(v16, "changedContent");
      v10 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(v10 + 8);
      if (!v13)
      {
        *(_QWORD *)(v14 + 24) = 0;
        goto LABEL_17;
      }
      v11 = *(_QWORD *)(v14 + 24);
      v12 = 1;
    }
    if (v12 && !v11)
    {
      if (objc_msgSend(v16, "source") == 3)
      {
        v15 = objc_msgSend(v16, "changedContent");
        v10 = *(_QWORD *)(a1 + 32);
        if (v15)
        {
          *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 1;
          goto LABEL_17;
        }
      }
      else
      {
        v10 = *(_QWORD *)(a1 + 32);
      }
    }
LABEL_16:
    *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_17;
  }
  v9 = objc_msgSend(v7, "options");
  v10 = *(_QWORD *)(a1 + 32);
  if ((v9 & 1) == 0)
    goto LABEL_16;
  *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 0;
LABEL_17:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_46(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_47;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_45(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "source");
  v5 = (unint64_t)(v4 - 4) < 5 || v4 == 1;
  if (!v5
    || (v6 = 1,
        objc_msgSend(v2, "objectAtIndex:", 1),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "source"),
        v7,
        v8 != 3))
  {
    v6 = 0;
  }

  return v6;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_44(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v7 = a2;
  v8 = v7;
  if (!a3)
  {
    v18 = v7;
    objc_msgSend(v7, "asDeletion");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15 || (v16 = (void *)v15, v17 = objc_msgSend(v18, "source"), v16, v17 == 2))
    {
      v10 = (uint64_t *)(a1 + 32);
      goto LABEL_11;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
LABEL_15:
    v8 = v18;
    goto LABEL_16;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v10 = (uint64_t *)(a1 + 32);
  v9 = v11;
  if (*(_QWORD *)(*(_QWORD *)(v11 + 8) + 24))
  {
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_16;
  }
  v18 = v7;
  v12 = objc_msgSend(v7, "changedContent");
  v9 = *v10;
  v13 = *(_QWORD *)(*v10 + 8);
  if ((v12 & 1) == 0)
  {
    *(_QWORD *)(v13 + 24) = 0;
    goto LABEL_15;
  }
  v8 = v18;
  if (*(_QWORD *)(v13 + 24))
    goto LABEL_12;
  if (objc_msgSend(v18, "source") != 2)
  {
LABEL_11:
    v8 = v18;
    v9 = *v10;
    goto LABEL_12;
  }
  v14 = objc_msgSend(v18, "changedContent");
  v9 = *v10;
  v8 = v18;
  if (!v14)
    goto LABEL_12;
  *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 1;
  *a4 = 1;
LABEL_16:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_43(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_44;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_42(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  uint64_t v16;
  int v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "asInsertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a3 && v7)
  {
    if ((objc_msgSend(v7, "options") & 4) != 0 && objc_msgSend(v18, "source") != 2)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      goto LABEL_18;
    }
    v9 = (uint64_t *)(a1 + 32);
LABEL_16:
    v10 = *v9;
    goto LABEL_17;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v9 = (uint64_t *)(a1 + 32);
  v10 = v11;
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 8) + 24);
  v13 = a3 != 0;
  if (!a3)
    goto LABEL_10;
  v14 = v18;
  if (!v12)
  {
    v15 = objc_msgSend(v18, "changedContent");
    v10 = *v9;
    v16 = *(_QWORD *)(*v9 + 8);
    if (!v15)
    {
      *(_QWORD *)(v16 + 24) = 0;
      goto LABEL_18;
    }
    v12 = *(_QWORD *)(v16 + 24);
    v13 = 1;
LABEL_10:
    v14 = v18;
  }
  if (!v13 || v12)
    goto LABEL_17;
  if (objc_msgSend(v14, "source") != 2)
    goto LABEL_16;
  v17 = objc_msgSend(v18, "changedContent");
  v10 = *v9;
  if (!v17)
  {
LABEL_17:
    *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_18;
  }
  *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 1;
  *a4 = 1;
LABEL_18:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_41(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_42;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_38(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  uint64_t v16;
  int v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "asDeletion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a3 && v7)
  {
    if ((objc_msgSend(v7, "options") & 2) != 0 && objc_msgSend(v18, "source") != 2)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      goto LABEL_18;
    }
    v9 = (uint64_t *)(a1 + 32);
LABEL_16:
    v10 = *v9;
    goto LABEL_17;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v9 = (uint64_t *)(a1 + 32);
  v10 = v11;
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 8) + 24);
  v13 = a3 != 0;
  if (!a3)
    goto LABEL_10;
  v14 = v18;
  if (!v12)
  {
    v15 = objc_msgSend(v18, "changedContent");
    v10 = *v9;
    v16 = *(_QWORD *)(*v9 + 8);
    if (!v15)
    {
      *(_QWORD *)(v16 + 24) = 0;
      goto LABEL_18;
    }
    v12 = *(_QWORD *)(v16 + 24);
    v13 = 1;
LABEL_10:
    v14 = v18;
  }
  if (!v13 || v12)
    goto LABEL_17;
  if (objc_msgSend(v14, "source") != 2)
    goto LABEL_16;
  v17 = objc_msgSend(v18, "changedContent");
  v10 = *v9;
  if (!v17)
  {
LABEL_17:
    *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_18;
  }
  *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 1;
  *a4 = 1;
LABEL_18:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_37(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_38;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_36(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  uint64_t v16;
  int v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "asDeletion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a3 && v7)
  {
    if ((objc_msgSend(v7, "options") & 1) != 0 && objc_msgSend(v18, "source") != 2)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      goto LABEL_18;
    }
    v9 = (uint64_t *)(a1 + 32);
LABEL_16:
    v10 = *v9;
    goto LABEL_17;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v9 = (uint64_t *)(a1 + 32);
  v10 = v11;
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 8) + 24);
  v13 = a3 != 0;
  if (!a3)
    goto LABEL_10;
  v14 = v18;
  if (!v12)
  {
    v15 = objc_msgSend(v18, "changedContent");
    v10 = *v9;
    v16 = *(_QWORD *)(*v9 + 8);
    if (!v15)
    {
      *(_QWORD *)(v16 + 24) = 0;
      goto LABEL_18;
    }
    v12 = *(_QWORD *)(v16 + 24);
    v13 = 1;
LABEL_10:
    v14 = v18;
  }
  if (!v13 || v12)
    goto LABEL_17;
  if (objc_msgSend(v14, "source") != 2)
    goto LABEL_16;
  v17 = objc_msgSend(v18, "changedContent");
  v10 = *v9;
  if (!v17)
  {
LABEL_17:
    *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_18;
  }
  *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 1;
  *a4 = 1;
LABEL_18:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_35(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_36;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_34(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  uint64_t v16;
  int v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "asInsertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a3 && v7)
  {
    if ((objc_msgSend(v7, "options") & 2) != 0 && objc_msgSend(v18, "source") != 2)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      goto LABEL_18;
    }
    v9 = (uint64_t *)(a1 + 32);
LABEL_16:
    v10 = *v9;
    goto LABEL_17;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v9 = (uint64_t *)(a1 + 32);
  v10 = v11;
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 8) + 24);
  v13 = a3 != 0;
  if (!a3)
    goto LABEL_10;
  v14 = v18;
  if (!v12)
  {
    v15 = objc_msgSend(v18, "changedContent");
    v10 = *v9;
    v16 = *(_QWORD *)(*v9 + 8);
    if (!v15)
    {
      *(_QWORD *)(v16 + 24) = 0;
      goto LABEL_18;
    }
    v12 = *(_QWORD *)(v16 + 24);
    v13 = 1;
LABEL_10:
    v14 = v18;
  }
  if (!v13 || v12)
    goto LABEL_17;
  if (objc_msgSend(v14, "source") != 2)
    goto LABEL_16;
  v17 = objc_msgSend(v18, "changedContent");
  v10 = *v9;
  if (!v17)
  {
LABEL_17:
    *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_18;
  }
  *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 1;
  *a4 = 1;
LABEL_18:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_33(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_34;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_32(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  uint64_t v16;
  int v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "asInsertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a3 && v7)
  {
    if ((objc_msgSend(v7, "options") & 1) != 0 && objc_msgSend(v18, "source") != 2)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      goto LABEL_18;
    }
    v9 = (uint64_t *)(a1 + 32);
LABEL_16:
    v10 = *v9;
    goto LABEL_17;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v9 = (uint64_t *)(a1 + 32);
  v10 = v11;
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 8) + 24);
  v13 = a3 != 0;
  if (!a3)
    goto LABEL_10;
  v14 = v18;
  if (!v12)
  {
    v15 = objc_msgSend(v18, "changedContent");
    v10 = *v9;
    v16 = *(_QWORD *)(*v9 + 8);
    if (!v15)
    {
      *(_QWORD *)(v16 + 24) = 0;
      goto LABEL_18;
    }
    v12 = *(_QWORD *)(v16 + 24);
    v13 = 1;
LABEL_10:
    v14 = v18;
  }
  if (!v13 || v12)
    goto LABEL_17;
  if (objc_msgSend(v14, "source") != 2)
    goto LABEL_16;
  v17 = objc_msgSend(v18, "changedContent");
  v10 = *v9;
  if (!v17)
  {
LABEL_17:
    *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_18;
  }
  *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24) = 1;
  *a4 = 1;
LABEL_18:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_31(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_32;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_30(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v2 = a2;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asKeyboardDockItemButtonPress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "buttonType");
  v6 = objc_msgSend(v4, "buttonType") == 2 && objc_msgSend(v4, "buttonPressResult") == 2;
  v7 = objc_msgSend(v3, "source");
  if ((unint64_t)(v7 - 4) >= 5 && v7 != 1
    || (v5 == 1 ? (v8 = 1) : (v8 = v6),
        (v8 & 1) != 0
     || (v9 = 1,
         objc_msgSend(v2, "objectAtIndex:", 1),
         v10 = (void *)objc_claimAutoreleasedReturnValue(),
         v11 = objc_msgSend(v10, "source"),
         v10,
         v11 != 2)))
  {
    v9 = 0;
  }

  return v9;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_23(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a2, "asSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (v9 = v6, objc_msgSend(v6, "relativeRangeBefore"), v6 = v9, v7)
    && (objc_msgSend(v9, "rangeAfter"), v6 = v9, v8))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 2;
    *a4 = 1;
  }

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_23;
  v7[3] = &unk_1E16B6D60;
  v7[4] = &v8;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v7);
  v5 = v9[3] == 1;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_21(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(a2, "asSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v9 = v6, objc_msgSend(v6, "relativeRangeBefore"), v6 = v9, v7)
    || (objc_msgSend(v9, "rangeAfter"), v6 = v9, v8))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_20(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_21;
  v7[3] = &unk_1E16B6D60;
  v7[4] = &v8;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v7);
  v5 = v9[3] == 1;
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asUndo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (v5 = 1,
        objc_msgSend(v2, "objectAtIndex:", 1),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "asDeletion"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v7,
        !v7))
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_17(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asUndo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (v5 = 1,
        objc_msgSend(v2, "objectAtIndex:", 1),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "asInsertion"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v7,
        !v7))
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __50__UITextInputSessionActionAnalytics_didSessionEnd__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "q_flushRecentActions");
}

- (void)writeAnalytics
{
  NSObject *v3;
  NSObject *queue;
  void *v5;
  _QWORD block[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[UITextInputSessionActionAnalytics sessionIdentifier](self, "sessionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] writeAnalytics for sessionIdentifier=%@", buf, 0xCu);

  }
  -[UITextInputSessionActionAnalytics didSessionEnd](self, "didSessionEnd");
  +[UIKBAnalyticsDispatcher sessionAnalyticsEnded:](UIKBAnalyticsDispatcher, "sessionAnalyticsEnded:", self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__UITextInputSessionActionAnalytics_writeAnalytics__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(queue, block);
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)q_flushRecentActions
{
  -[UITextInputSessionActionAnalytics q_updateAnalyticsFromAccumulators](self, "q_updateAnalyticsFromAccumulators");
  -[NSMutableOrderedSet removeAllObjects](self->_recentActions, "removeAllObjects");
}

- (void)enumerateSeparateCycleAnalytics:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__UITextInputSessionActionAnalytics_enumerateSeparateCycleAnalytics___block_invoke;
    v7[3] = &unk_1E16B1D18;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)enumerateAnalytics:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__UITextInputSessionActionAnalytics_enumerateAnalytics___block_invoke;
    v7[3] = &unk_1E16B1D18;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)didSessionEnd
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didSessionEnd - flushing recent actions", buf, 2u);
  }

  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asEnd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_MergedGlobals_1088, "didSessionEnd");
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__UITextInputSessionActionAnalytics_didSessionEnd__block_invoke;
  v8[3] = &unk_1E16B1B50;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (id)allAccumulatorNames
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableSet count](self->_accumulators, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__UITextInputSessionActionAnalytics_allAccumulatorNames__block_invoke;
  v9[3] = &unk_1E16B1B50;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(queue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

+ (id)allowedValuesForTextInputSource
{
  if (qword_1ECD7CDC8 != -1)
    dispatch_once(&qword_1ECD7CDC8, &__block_literal_global_69);
  return (id)_MergedGlobals_966;
}

+ (id)stringValueForSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return CFSTR("Unspecified");
  else
    return off_1E16B6E48[a3 - 1];
}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_24(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_25;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_25(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "asSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v6)
  {
    *(_QWORD *)(v7 + 24) = 1;
  }
  else
  {
    *(_QWORD *)(v7 + 24) = 2;
    *a4 = 1;
  }

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_26(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_27;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_27(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(a2, "asSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v9 = v6, objc_msgSend(v6, "relativeRangeBefore"), v6 = v9, v7)
    || (objc_msgSend(v9, "rangeAfter"), v6 = v9, v8))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_28(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_29;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_29(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a2, "asSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (v9 = v6, objc_msgSend(v6, "relativeRangeBefore"), v6 = v9, v7)
    && (objc_msgSend(v9, "rangeAfter"), v6 = v9, v8))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 2;
    *a4 = 1;
  }

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_39(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_40;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_40(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;

  v7 = a2;
  v8 = v7;
  if (!a3)
  {
    v15 = v7;
    if (objc_msgSend(v7, "source") == 2 && objc_msgSend(v15, "changedContent"))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      goto LABEL_8;
    }
    v10 = (uint64_t *)(a1 + 32);
LABEL_10:
    v8 = v15;
    v9 = *v10;
    goto LABEL_11;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v10 = (uint64_t *)(a1 + 32);
  v9 = v11;
  if (*(_QWORD *)(*(_QWORD *)(v11 + 8) + 24))
  {
LABEL_11:
    *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_12;
  }
  v15 = v7;
  objc_msgSend(v7, "asSelection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *v10;
  v13 = *(_QWORD *)(*v10 + 8);
  if (!v12)
  {
    v8 = v15;
    if (*(_QWORD *)(v13 + 24))
      goto LABEL_11;
    if (objc_msgSend(v15, "source") == 2)
    {
      v14 = objc_msgSend(v15, "changedContent");
      v9 = *v10;
      v8 = v15;
      if (v14)
      {
        *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 1;
        *a4 = 1;
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  *(_QWORD *)(v13 + 24) = 0;
LABEL_8:
  v8 = v15;
LABEL_12:

}

BOOL __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_52(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_53;
  v5[3] = &unk_1E16B6D60;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3] == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_53(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;

  v7 = a2;
  v8 = v7;
  if (!a3)
  {
    v14 = v7;
    objc_msgSend(v7, "asDeletion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(a1 + 32);
    if (!v13)
    {
LABEL_13:
      v8 = v14;
      goto LABEL_14;
    }
    *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 0;
LABEL_11:
    v8 = v14;
    goto LABEL_15;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(v9 + 8) + 24))
  {
LABEL_14:
    *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 2;
    *a4 = 1;
    goto LABEL_15;
  }
  v14 = v7;
  v10 = objc_msgSend(v7, "changedContent");
  v9 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v9 + 8);
  if ((v10 & 1) == 0)
  {
    *(_QWORD *)(v11 + 24) = 0;
    goto LABEL_11;
  }
  v8 = v14;
  if (*(_QWORD *)(v11 + 24))
    goto LABEL_14;
  if (objc_msgSend(v14, "source") != 3)
  {
    v9 = *(_QWORD *)(a1 + 32);
    goto LABEL_13;
  }
  v12 = objc_msgSend(v14, "changedContent");
  v9 = *(_QWORD *)(a1 + 32);
  v8 = v14;
  if (!v12)
    goto LABEL_14;
  *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) = 1;
LABEL_15:

}

id __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_267(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __69__UITextInputSessionActionAnalytics_Default__q_setupDefaultAnalytics__block_invoke_269(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)addEndingObserver:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)__endingObservers;
  v7 = v3;
  if (!__endingObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)__endingObservers;
    __endingObservers = v5;

    v3 = v7;
    v4 = (void *)__endingObservers;
  }
  objc_msgSend(v4, "addObject:", v3);

}

+ (void)removeEndingObserver:(id)a3
{
  objc_msgSend((id)__endingObservers, "removeObject:", a3);
}

+ (void)q_notifyEndingObserversWithSessionAnalytics:(id)a3
{
  _QWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (id)__endingObservers;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "matchingAccumulatorNames");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)v3[3];
        v14[0] = v8;
        v14[1] = 3221225472;
        v14[2] = __81__UITextInputSessionActionAnalytics_q_notifyEndingObserversWithSessionAnalytics___block_invoke;
        v14[3] = &unk_1E16CB590;
        v15 = v11;
        v16 = v10;
        v13 = v11;
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v14);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

void __81__UITextInputSessionActionAnalytics_q_notifyEndingObserversWithSessionAnalytics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__UITextInputSessionActionAnalytics_q_notifyEndingObserversWithSessionAnalytics___block_invoke_2;
    v7[3] = &unk_1E16CB568;
    v7[4] = *(_QWORD *)(a1 + 40);
    v8 = v6;
    objc_msgSend(v8, "enumerateAnalytics:", v7);

  }
}

void __81__UITextInputSessionActionAnalytics_q_notifyEndingObserversWithSessionAnalytics___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  if (a3)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "name");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didEndMatchingAccumulatorName:", v4);

  }
}

+ (id)sharedPunctuationCharacterSet
{
  if (qword_1ECD7E280 != -1)
    dispatch_once(&qword_1ECD7E280, &__block_literal_global_283);
  return (id)qword_1ECD7E278;
}

void __66__UITextInputSessionActionAnalytics_sharedPunctuationCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7E278;
  qword_1ECD7E278 = v0;

}

void __41__UITextInputSessionActionAnalytics_init__block_invoke_46(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v8[11];

  v8[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "q_setupDefaultAnalytics");
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8[0] = CFSTR("DictationBegan");
  v8[1] = CFSTR("Insertion");
  v8[2] = CFSTR("EmojiCount");
  v8[3] = CFSTR("Dictation to Keyboard");
  v8[4] = CFSTR("Dictation to Emoji");
  v8[5] = CFSTR("Dictation to Punctuation");
  v8[6] = CFSTR("Dictation to Whitespace");
  v8[7] = CFSTR("Dictation to Deletion");
  v8[8] = CFSTR("ModelessUsedAtLeastOnce");
  v8[9] = CFSTR("PunctuationCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithArray:", v3);

  objc_msgSend(*(id *)(a1 + 32), "q_setSeparateCycleAccumulatorNames:", v4);
  objc_msgSend(*(id *)(a1 + 32), "delegateSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_didFinishInit");

  }
}

- (UITextInputSessionActionAnalytics)initWithEventHandler:(id)a3
{
  id v4;
  UITextInputSessionActionAnalytics *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = -[UITextInputSessionActionAnalytics init](self, "init");
  v6 = objc_msgSend(objc_alloc((Class)getIATextInputActionsAnalyticsClass()), "initWithAnalyticsMetadataObserver:withEventHandler:", v5, v4);

  v7 = (void *)_MergedGlobals_1088;
  _MergedGlobals_1088 = v6;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    UITextInputSessionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputAnalytics SPI compatible", buf, 2u);
    }
  }
  else
  {
    UITextInputSessionLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_debug_impl(&dword_185066000, v9, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputAnalytics SPI not compatible", v11, 2u);
    }

    v8 = _MergedGlobals_1088;
    _MergedGlobals_1088 = 0;
  }

  return v5;
}

- (void)incrementAllowCursorMovementCount
{
  ++self->_allowCursorMovementCounter;
}

- (void)decrementAllowCursorMovementCount
{
  unint64_t allowCursorMovementCounter;

  allowCursorMovementCounter = self->_allowCursorMovementCounter;
  if (allowCursorMovementCounter)
    self->_allowCursorMovementCounter = allowCursorMovementCounter - 1;
}

void __56__UITextInputSessionActionAnalytics_enumerateAnalytics___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "q_flushRecentActions");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__UITextInputSessionActionAnalytics_enumerateAnalytics___block_invoke_2;
  v9[3] = &unk_1E16CB5B8;
  v10 = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend((id)objc_opt_class(), "q_notifyEndingObserversWithSessionAnalytics:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "delegateSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_didEndEnumeratingAnalytics");

  }
  UITextInputSessionLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_debug_impl(&dword_185066000, v7, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] enumerateAnalytics: Completed queued publishing", v8, 2u);
  }

}

uint64_t __56__UITextInputSessionActionAnalytics_enumerateAnalytics___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateAnalytics:", *(_QWORD *)(a1 + 32));
}

void __69__UITextInputSessionActionAnalytics_enumerateSeparateCycleAnalytics___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];
  _QWORD v6[5];
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 24);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__UITextInputSessionActionAnalytics_enumerateSeparateCycleAnalytics___block_invoke_2;
  v6[3] = &unk_1E16CB5E0;
  v6[4] = v1;
  v7 = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  UITextInputSessionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_185066000, v4, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] enumerateSeparateCycleAnalytics: Completed queued publishing", v5, 2u);
  }

}

void __69__UITextInputSessionActionAnalytics_enumerateSeparateCycleAnalytics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v6 = v3;
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    objc_msgSend(v6, "enumerateAnalytics:", *(_QWORD *)(a1 + 40));

}

- (id)allEfficacyAccumulatorNames
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableSet count](self->_efficacyAccumulators, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__UITextInputSessionActionAnalytics_allEfficacyAccumulatorNames__block_invoke;
  v9[3] = &unk_1E16B1B50;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(queue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __64__UITextInputSessionActionAnalytics_allEfficacyAccumulatorNames__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "name", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

uint64_t __51__UITextInputSessionActionAnalytics_writeAnalytics__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  UITextInputSessionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_185066000, v2, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] writeAnalytics: queued accumulator reset starting", v4, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "enumerateObjectsUsingBlock:", &__block_literal_global_56_1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_58_1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "enumerateObjectsUsingBlock:", &__block_literal_global_60_0);
}

uint64_t __51__UITextInputSessionActionAnalytics_writeAnalytics__block_invoke_55(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reset");
}

uint64_t __51__UITextInputSessionActionAnalytics_writeAnalytics__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reset");
}

uint64_t __51__UITextInputSessionActionAnalytics_writeAnalytics__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reset");
}

- (void)addAccumulator:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__UITextInputSessionActionAnalytics_addAccumulator___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __52__UITextInputSessionActionAnalytics_addAccumulator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addAccumulator:", *(_QWORD *)(a1 + 40));
}

- (void)addEfficacyAccumulator:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__UITextInputSessionActionAnalytics_addEfficacyAccumulator___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __60__UITextInputSessionActionAnalytics_addEfficacyAccumulator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addEfficacyAccumulator:", *(_QWORD *)(a1 + 40));
}

- (void)addDynamicAccumulator:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__UITextInputSessionActionAnalytics_addDynamicAccumulator___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __59__UITextInputSessionActionAnalytics_addDynamicAccumulator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addDynamicAccumulator:", *(_QWORD *)(a1 + 40));
}

- (id)getDynamicAccumulatorWithName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.name == %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet filteredSetUsingPredicate:](self->_dynamicAccumulators, "filteredSetUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getEfficacyAccumulatorWithName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.name == %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet filteredSetUsingPredicate:](self->_efficacyAccumulators, "filteredSetUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)_getActiveTextInputSource
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;

  -[UITextInputSessionActionAnalytics delegateSource](self, "delegateSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  -[UITextInputSessionActionAnalytics delegateSource](self, "delegateSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    v7 = objc_msgSend(v5, "_overrideTextInputSource");
  }
  else
  {
    objc_msgSend(v5, "_delegateAsResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(v8, "_textInputSource");
    else
      v7 = 0;
    v6 = v8;
  }

  return v7;
}

- (void)_performWithTextInputActionsSource:(int64_t)a3 block:(id)a4
{
  int64_t overrideSource;
  int64_t v6;
  int64_t v7;

  overrideSource = self->_overrideSource;
  v6 = self->_useOverrideSourceCounter + 1;
  self->_overrideSource = a3;
  self->_useOverrideSourceCounter = v6;
  (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  v7 = self->_useOverrideSourceCounter - 1;
  self->_overrideSource = overrideSource;
  self->_useOverrideSourceCounter = v7;
}

- (void)_performWithInputModeOverride:(id)a3 block:(id)a4
{
  NSString *v6;
  NSString *v7;
  NSString *overrideInputModeString;
  void (**v9)(_QWORD);
  NSString *v10;
  NSString *v11;

  v6 = (NSString *)a3;
  v7 = self->_overrideInputModeString;
  overrideInputModeString = self->_overrideInputModeString;
  self->_overrideInputModeString = v6;
  v11 = v6;
  v9 = (void (**)(_QWORD))a4;

  v9[2](v9);
  v10 = self->_overrideInputModeString;
  self->_overrideInputModeString = v7;

}

- (void)didKeyboardDockItemButtonPress:(unint64_t)a3 buttonType:(unint64_t)a4 buttonSize:(CGSize)a5 touchDown:(CGPoint)a6 touchUp:(CGPoint)a7 touchDuration:(double)a8 inputSource:(int64_t)a9
{
  double y;
  double x;
  double v13;
  double v14;
  double height;
  double width;
  NSObject *v20;
  void *v21;
  void *v22;
  int64_t v23;
  uint64_t v24;
  id v25;
  NSObject *queue;
  id v27;
  void *v28;
  void *v29;
  _QWORD block[5];
  id v31;
  _QWORD v32[4];
  id v33;
  unint64_t v34;
  unint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  int64_t v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  uint64_t v62;

  y = a7.y;
  x = a7.x;
  v13 = a6.y;
  v14 = a6.x;
  height = a5.height;
  width = a5.width;
  v62 = *MEMORY[0x1E0C80C00];
  UITextInputSessionLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    +[UITextInputSessionActionAnalytics stringForKeyboardDockItemButtonPressResult:](UITextInputSessionActionAnalytics, "stringForKeyboardDockItemButtonPressResult:", a3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextInputSessionActionAnalytics stringForKeyboardDockItemButtonType:](UITextInputSessionActionAnalytics, "stringForKeyboardDockItemButtonType:", a4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414338;
    v45 = v28;
    v46 = 2112;
    v47 = v29;
    v48 = 2048;
    v49 = width;
    v50 = 2048;
    v51 = height;
    v52 = 2048;
    v53 = v14;
    v54 = 2048;
    v55 = v13;
    v56 = 2048;
    v57 = x;
    v58 = 2048;
    v59 = y;
    v60 = 2048;
    v61 = a8;
    _os_log_debug_impl(&dword_185066000, v20, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didKeyboardDockItemButtonPress:%@ buttonType:%@ buttonSize:(%fw %fh) touchDown:(%f,%f) touchUp:(%f,%f) touchDuration:%f", buf, 0x5Cu);

  }
  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "asKeyboardDockItemButtonPress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setSource:", a9);
  +[UITextInputSessionActionAnalytics populateActionInputMode:](UITextInputSessionActionAnalytics, "populateActionInputMode:", v22);
  objc_msgSend(v22, "setButtonPressResult:", a3);
  objc_msgSend(v22, "setButtonType:", a4);
  objc_msgSend(v22, "setUiOrientation:", objc_msgSend((id)UIApp, "activeInterfaceOrientation"));
  objc_msgSend(v22, "setButtonSize:", width, height);
  objc_msgSend(v22, "setTouchDownPoint:", v14, v13);
  objc_msgSend(v22, "setTouchUpPoint:", x, y);
  objc_msgSend(v22, "setTouchDuration:", a8);
  v23 = +[UIInputAnalyticsTranslator iaTextInputActionsSourceFor:](UIInputAnalyticsTranslator, "iaTextInputActionsSourceFor:", objc_msgSend(v22, "textInputActionsSource"));
  v24 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __134__UITextInputSessionActionAnalytics_didKeyboardDockItemButtonPress_buttonType_buttonSize_touchDown_touchUp_touchDuration_inputSource___block_invoke;
  v32[3] = &unk_1E16CB690;
  v34 = a3;
  v35 = a4;
  v36 = width;
  v37 = height;
  v38 = v14;
  v39 = v13;
  v40 = x;
  v41 = y;
  v42 = a8;
  v43 = v23;
  v25 = v22;
  v33 = v25;
  -[UITextInputSessionActionAnalytics _performWithTextInputActionsSource:block:](self, "_performWithTextInputActionsSource:block:", v23, v32);
  queue = self->_queue;
  block[0] = v24;
  block[1] = 3221225472;
  block[2] = __134__UITextInputSessionActionAnalytics_didKeyboardDockItemButtonPress_buttonType_buttonSize_touchDown_touchUp_touchDuration_inputSource___block_invoke_2;
  block[3] = &unk_1E16B1B50;
  block[4] = self;
  v31 = v25;
  v27 = v25;
  dispatch_async(queue, block);

}

uint64_t __134__UITextInputSessionActionAnalytics_didKeyboardDockItemButtonPress_buttonType_buttonSize_touchDown_touchUp_touchDuration_inputSource___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)_MergedGlobals_1088, "didKeyboardDockItemButtonPress:buttonType:buttonSize:touchDown:touchUp:touchDuration:inputSource:inputType:uiInterfaceOrientation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 112), +[UIInputAnalyticsTranslator iaTextInputActionsTypeFor:](UIInputAnalyticsTranslator, "iaTextInputActionsTypeFor:", objc_msgSend(*(id *)(a1 + 32), "textInputActionsType")), +[UIInputAnalyticsTranslator iaInterfaceOrientationFor:](UIInputAnalyticsTranslator, "iaInterfaceOrientationFor:", objc_msgSend(*(id *)(a1 + 32), "uiOrientation")), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88),
           *(double *)(a1 + 96),
           *(double *)(a1 + 104));
}

uint64_t __134__UITextInputSessionActionAnalytics_didKeyboardDockItemButtonPress_buttonType_buttonSize_touchDown_touchUp_touchDuration_inputSource___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend((id)objc_opt_class(), "q_notifyStartingObservers");
}

- (void)didDictationBegin:(BOOL)a3 usesMultiModalDictation:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *queue;
  id v11;
  _QWORD block[4];
  id v13;
  UITextInputSessionActionAnalytics *v14;
  BOOL v15;
  BOOL v16;
  uint8_t buf[16];

  v4 = a4;
  v5 = a3;
  UITextInputSessionLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_185066000, v7, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didDictationBegin", buf, 2u);
  }

  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asDictationBegan");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSource:", 2);
  objc_msgSend((id)_MergedGlobals_1088, "didDictationBegin:usesMultiModalDictation:", v5, v4);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__UITextInputSessionActionAnalytics_didDictationBegin_usesMultiModalDictation___block_invoke;
  block[3] = &unk_1E16B4E20;
  v15 = v5;
  v16 = v4;
  v13 = v9;
  v14 = self;
  v11 = v9;
  dispatch_async(queue, block);

}

uint64_t __79__UITextInputSessionActionAnalytics_didDictationBegin_usesMultiModalDictation___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "setDictationBeganCount:", 1);
    if (*(_BYTE *)(a1 + 49))
      objc_msgSend(*(id *)(a1 + 32), "setMultiModalDictationBeganCount:", 1);
  }
  else
  {
    objc_msgSend(v3, "setModelessUsedAtLeastOnceCount:", 1);
  }
  return objc_msgSend(*(id *)(a1 + 40), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 32));
}

- (void)didDictationEnd
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didDictationEnd", buf, 2u);
  }

  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asDictationEnded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_MergedGlobals_1088, "didDictationEnd");
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__UITextInputSessionActionAnalytics_didDictationEnd__block_invoke;
  v8[3] = &unk_1E16B1B50;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __52__UITextInputSessionActionAnalytics_didDictationEnd__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend((id)objc_opt_class(), "q_notifyStartingObservers");
}

- (unint64_t)_optionsForText:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = v4;
    if (qword_1ECD7E298 != -1)
      dispatch_once(&qword_1ECD7E298, &__block_literal_global_75_1);
    v6 = objc_msgSend(v3, "rangeOfCharacterFromSet:", qword_1ECD7E290);
    v7 = 4 * (v6 != 0x7FFFFFFFFFFFFFFFLL);
    if (v5 > 1 || v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend((id)objc_opt_class(), "sharedPunctuationCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v8);

      if (v9 == 0x7FFFFFFFFFFFFFFFLL || (v7 |= 2uLL, v5 >= 2))
        v7 |= objc_msgSend(v3, "_containsEmoji");
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __53__UITextInputSessionActionAnalytics__optionsForText___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7E290;
  qword_1ECD7E290 = v0;

}

- (unint64_t)_emojiCountForText:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (objc_msgSend(v3, "length") && objc_msgSend(v3, "_containsEmoji"))
  {
    v4 = objc_msgSend(v3, "length");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__UITextInputSessionActionAnalytics__emojiCountForText___block_invoke;
    v7[3] = &unk_1E16CB6B8;
    v7[4] = &v8;
    objc_msgSend(v3, "_enumerateEmojiTokensInRange:block:", 0, v4, v7);
  }
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __56__UITextInputSessionActionAnalytics__emojiCountForText___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (unint64_t)_normalizedTextLength:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (objc_msgSend(v3, "length") && objc_msgSend(v3, "_containsEmoji"))
  {
    v4 = objc_msgSend(v3, "length");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__UITextInputSessionActionAnalytics__normalizedTextLength___block_invoke;
    v8[3] = &unk_1E16CB6E0;
    v8[4] = &v13;
    v8[5] = &v9;
    objc_msgSend(v3, "_enumerateEmojiTokensInRange:block:", 0, v4, v8);
    v5 = objc_msgSend(v3, "length");
    v6 = v5 - v10[3] + v14[3];
  }
  else
  {
    v6 = objc_msgSend(v3, "length");
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

uint64_t __59__UITextInputSessionActionAnalytics__normalizedTextLength___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) += a4;
  return result;
}

- (unint64_t)_punctuationCountForText:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(v3, "length");
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_removeCharactersFromSet:", objc_msgSend((id)objc_opt_class(), "sharedPunctuationCharacterSet"));
    v6 = v4 - objc_msgSend(v5, "length");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_textInsertionActionForText:(id)a3 relativeRangeBefore:(_NSRange)a4 withLanguage:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "asInsertion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setRelativeRangeBefore:", location, length);
  if (v9)
  {
    objc_msgSend(v12, "setInsertedTextLength:", -[UITextInputSessionActionAnalytics _normalizedTextLength:](self, "_normalizedTextLength:", v9));
    objc_msgSend(v12, "setOptions:", -[UITextInputSessionActionAnalytics _optionsForText:](self, "_optionsForText:", v9));
    objc_msgSend(v12, "setInsertedEmojiCount:", -[UITextInputSessionActionAnalytics _emojiCountForText:](self, "_emojiCountForText:", v9));
    objc_msgSend(v12, "setInsertedPunctuationCount:", -[UITextInputSessionActionAnalytics _punctuationCountForText:](self, "_punctuationCountForText:", v9));
  }
  if (v10)
    +[UITextInputSessionActionAnalytics populateActionInputMode:withLanguage:](UITextInputSessionActionAnalytics, "populateActionInputMode:withLanguage:", v12, v10);

  return v12;
}

- (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4 withLanguage:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  NSUInteger v20;
  NSUInteger v21;
  uint8_t buf[4];
  NSUInteger v23;
  __int16 v24;
  NSUInteger v25;
  __int16 v26;
  NSUInteger v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  length = a4.length;
  location = a4.location;
  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  UITextInputSessionLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v23 = (NSUInteger)v9;
      v24 = 2048;
      v25 = location;
      v26 = 2048;
      v27 = length;
      v28 = 2112;
      v29 = v10;
      _os_log_debug_impl(&dword_185066000, v12, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didInsertText:\"%@\" relativeRangeBefore:(%lu, %lu) withLanguage:%@", buf, 0x2Au);
    }

    -[UITextInputSessionActionAnalytics _textInsertionActionForText:relativeRangeBefore:withLanguage:](self, "_textInsertionActionForText:relativeRangeBefore:withLanguage:", v9, location, length, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __84__UITextInputSessionActionAnalytics_didInsertText_relativeRangeBefore_withLanguage___block_invoke;
    v17 = &unk_1E16B80A8;
    v18 = v9;
    v19 = v13;
    v20 = location;
    v21 = length;
    v12 = v13;
    -[UITextInputSessionActionAnalytics _performWithInputModeOverride:block:](self, "_performWithInputModeOverride:block:", v10, &v14);
    -[UITextInputSessionActionAnalytics _didInsertTextAction:numCharsDeleted:withLanguage:](self, "_didInsertTextAction:numCharsDeleted:withLanguage:", v12, length, v10, v14, v15, v16, v17);

  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    v23 = location;
    v24 = 2048;
    v25 = length;
    v26 = 2112;
    v27 = (NSUInteger)v10;
    _os_log_error_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "[UITextInputSessionActionAnalytics] didInsertText: relativeRangeBefore:(%lu, %lu) withLanguage:%@ called with nil text", buf, 0x20u);
  }

}

uint64_t __84__UITextInputSessionActionAnalytics_didInsertText_relativeRangeBefore_withLanguage___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)_MergedGlobals_1088, "didInsertText:withType:relativeRangeBefore:withNumAlternatives:selectedTextBefore:withInputMode:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "textInputActionsType"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, 0, 0);
}

- (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4 selectedTextBefore:(id)a5 withLanguage:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  UITextInputSessionActionAnalytics *v22;
  id v23;
  id v24;
  NSUInteger v25;
  NSUInteger v26;
  uint8_t buf[4];
  NSUInteger v28;
  __int16 v29;
  NSUInteger v30;
  __int16 v31;
  NSUInteger v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  length = a4.length;
  location = a4.location;
  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  UITextInputSessionLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413314;
      v28 = (NSUInteger)v11;
      v29 = 2048;
      v30 = location;
      v31 = 2048;
      v32 = length;
      v33 = 2112;
      v34 = v12;
      v35 = 2112;
      v36 = v13;
      _os_log_debug_impl(&dword_185066000, v15, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didInsertText:\"%@\" relativeRangeBefore:(%lu, %lu) selectedTextBefore:'%@' withLanguage:%@", buf, 0x34u);
    }

    if (objc_msgSend(v12, "length"))
      -[UITextInputSessionActionAnalytics _didDeleteBackwardText:shouldOverrideInputActionCountToZero:withLanguage:](self, "_didDeleteBackwardText:shouldOverrideInputActionCountToZero:withLanguage:", v12, 1, v13);
    -[UITextInputSessionActionAnalytics _textInsertionActionForText:relativeRangeBefore:withLanguage:](self, "_textInsertionActionForText:relativeRangeBefore:withLanguage:", v11, location, length, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __103__UITextInputSessionActionAnalytics_didInsertText_relativeRangeBefore_selectedTextBefore_withLanguage___block_invoke;
    v20 = &unk_1E16CB708;
    v21 = v16;
    v22 = self;
    v23 = v11;
    v25 = location;
    v26 = length;
    v24 = v12;
    v15 = v16;
    -[UITextInputSessionActionAnalytics _performWithInputModeOverride:block:](self, "_performWithInputModeOverride:block:", v13, &v17);
    -[UITextInputSessionActionAnalytics _didInsertTextAction:numCharsDeleted:withLanguage:](self, "_didInsertTextAction:numCharsDeleted:withLanguage:", v15, 0, v13, v17, v18, v19, v20);

  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218754;
    v28 = location;
    v29 = 2048;
    v30 = length;
    v31 = 2112;
    v32 = (NSUInteger)v12;
    v33 = 2112;
    v34 = v13;
    _os_log_error_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "[UITextInputSessionActionAnalytics] didInsertText: relativeRangeBefore:(%lu, %lu) selectedTextBefore:'%@' withLanguage:%@ called with nil text", buf, 0x2Au);
  }

}

void __103__UITextInputSessionActionAnalytics_didInsertText_relativeRangeBefore_selectedTextBefore_withLanguage___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  __int128 v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "flagOptions") & 1) != 0 && objc_msgSend(*(id *)(a1 + 32), "source") == 5)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __103__UITextInputSessionActionAnalytics_didInsertText_relativeRangeBefore_selectedTextBefore_withLanguage___block_invoke_2;
    v3[3] = &unk_1E16B80A8;
    v2 = *(void **)(a1 + 40);
    v4 = *(id *)(a1 + 48);
    v6 = *(_OWORD *)(a1 + 64);
    v5 = *(id *)(a1 + 56);
    objc_msgSend(v2, "_performWithTextInputActionsSource:block:", 4, v3);

  }
  else
  {
    objc_msgSend((id)_MergedGlobals_1088, "didInsertText:withType:relativeRangeBefore:withNumAlternatives:selectedTextBefore:withInputMode:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "textInputActionsType"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 0, *(_QWORD *)(a1 + 56), 0);
  }
}

uint64_t __103__UITextInputSessionActionAnalytics_didInsertText_relativeRangeBefore_selectedTextBefore_withLanguage___block_invoke_2(_QWORD *a1)
{
  objc_msgSend((id)_MergedGlobals_1088, "didInsertText:withType:relativeRangeBefore:withNumAlternatives:selectedTextBefore:withInputMode:", a1[4], 1, a1[6], a1[7], 0, a1[5], 0);
  return objc_msgSend((id)_MergedGlobals_1088, "didInsertionKeyPressOfKey:withType:", 0, 1);
}

- (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4
{
  -[UITextInputSessionActionAnalytics didInsertText:relativeRangeBefore:withLanguage:](self, "didInsertText:relativeRangeBefore:withLanguage:", a3, a4.location, a4.length, 0);
}

- (void)didInsertText:(id)a3 relativeRangeBefore:(_NSRange)a4 withNumAlternatives:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  NSUInteger v13;
  __int16 v14;
  NSUInteger v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  length = a4.length;
  location = a4.location;
  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  UITextInputSessionLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v13 = (NSUInteger)v9;
      v14 = 2048;
      v15 = location;
      v16 = 2048;
      v17 = length;
      v18 = 2048;
      v19 = a5;
      _os_log_debug_impl(&dword_185066000, v11, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didInsertText:\"%@\" relativeRangeBefore:(%lu, %lu) withNumAlternatives:%ld", buf, 0x2Au);
    }

    -[UITextInputSessionActionAnalytics _textInsertionActionForText:relativeRangeBefore:withLanguage:](self, "_textInsertionActionForText:relativeRangeBefore:withLanguage:", v9, location, length, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject setWithAlternativesCount:](v11, "setWithAlternativesCount:", a5 > 0);
    objc_msgSend((id)_MergedGlobals_1088, "didInsertText:withType:relativeRangeBefore:withNumAlternatives:selectedTextBefore:withInputMode:", v9, -[NSObject textInputActionsType](v11, "textInputActionsType"), location, length, 0, 0, 0);
    -[UITextInputSessionActionAnalytics _didInsertTextAction:numCharsDeleted:withLanguage:](self, "_didInsertTextAction:numCharsDeleted:withLanguage:", v11, length, 0);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218496;
    v13 = location;
    v14 = 2048;
    v15 = length;
    v16 = 2048;
    v17 = a5;
    _os_log_error_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "[UITextInputSessionActionAnalytics] didInsertText: relativeRangeBefore:(%lu, %lu) withNumAlternatives:%ld called with nil text", buf, 0x20u);
  }

}

- (void)_didInsertTextAction:(id)a3 numCharsDeleted:(unint64_t)a4 withLanguage:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  UITextInputSessionActionAnalytics *v16;
  id v17;

  v8 = a3;
  v9 = a5;
  if (a4)
    -[UITextInputSessionActionAnalytics _didDeleteBackwardCount:shouldOverrideInputActionCountToZero:withLanguage:](self, "_didDeleteBackwardCount:shouldOverrideInputActionCountToZero:withLanguage:", a4, 1, v9);
  if ((objc_msgSend(v8, "flagOptions") & 1) != 0 && objc_msgSend(v8, "source") == 5)
  {
    objc_msgSend(v8, "setSource:", 1);
    +[UITextInputSessionActionAnalytics populateActionInputMode:](UITextInputSessionActionAnalytics, "populateActionInputMode:", v8);
    if (objc_msgSend(v8, "insertedEmojiCount") == 1 && objc_msgSend(v8, "insertedTextLength") == 1)
      objc_msgSend(v8, "setInputActionCountFromMergedActions:", 1);
  }
  queue = self->_queue;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __87__UITextInputSessionActionAnalytics__didInsertTextAction_numCharsDeleted_withLanguage___block_invoke;
  v15 = &unk_1E16B1B50;
  v16 = self;
  v17 = v8;
  v11 = v8;
  dispatch_async(queue, &v12);
  -[UITextInputSessionActionAnalytics beginTrackingSessionDurationIfNecessary](self, "beginTrackingSessionDurationIfNecessary", v12, v13, v14, v15, v16);

}

uint64_t __87__UITextInputSessionActionAnalytics__didInsertTextAction_numCharsDeleted_withLanguage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)_didDeleteBackwardCount:(unint64_t)a3 shouldOverrideInputActionCountToZero:(BOOL)a4 withLanguage:(id)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  uint64_t v14;

  v5 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  UITextInputSessionLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = a3;
    _os_log_debug_impl(&dword_185066000, v9, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didDeleteBackwardCount:%lu", (uint8_t *)&v12, 0xCu);
  }

  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "asDeletion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setRemovedTextLength:", a3);
  if (v5)
    objc_msgSend(v11, "setInputActionCountFromMergedActions:", -objc_msgSend(v11, "inputActionCount"));
  if (v8)
    +[UITextInputSessionActionAnalytics populateActionInputMode:withLanguage:](UITextInputSessionActionAnalytics, "populateActionInputMode:withLanguage:", v11, v8);
  -[UITextInputSessionActionAnalytics _didDeleteBackwardAction:](self, "_didDeleteBackwardAction:", v11);

}

- (void)didDeleteBackwardCount:(unint64_t)a3
{
  void *v5;
  int64_t v6;
  uint64_t v7;

  -[UITextInputSessionActionAnalytics _didDeleteBackwardCount:shouldOverrideInputActionCountToZero:withLanguage:](self, "_didDeleteBackwardCount:shouldOverrideInputActionCountToZero:withLanguage:", a3, 0, 0);
  v5 = (void *)_MergedGlobals_1088;
  v6 = -[UITextInputSessionActionAnalytics _getActiveTextInputSource](self, "_getActiveTextInputSource");
  v7 = 0;
  if ((unint64_t)(v6 - 1) <= 7)
    v7 = qword_18667DF88[v6 - 1];
  objc_msgSend(v5, "didDeleteBackwardCount:withType:", a3, +[UIInputAnalyticsTranslator iaTextInputActionsTypeFor:](UIInputAnalyticsTranslator, "iaTextInputActionsTypeFor:", v7));
}

- (void)_didDeleteBackwardText:(id)a3 shouldOverrideInputActionCountToZero:(BOOL)a4 withLanguage:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v6 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  UITextInputSessionLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_debug_impl(&dword_185066000, v11, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didDeleteBackwardText:'%@'", (uint8_t *)&v13, 0xCu);
    }

    -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "asDeletion");
    v11 = objc_claimAutoreleasedReturnValue();

    -[NSObject setRemovedTextLength:](v11, "setRemovedTextLength:", -[UITextInputSessionActionAnalytics _normalizedTextLength:](self, "_normalizedTextLength:", v8));
    -[NSObject setRemovedEmojiCount:](v11, "setRemovedEmojiCount:", -[UITextInputSessionActionAnalytics _emojiCountForText:](self, "_emojiCountForText:", v8));
    -[NSObject setOptions:](v11, "setOptions:", -[UITextInputSessionActionAnalytics _optionsForText:](self, "_optionsForText:", v8));
    if (v9)
      +[UITextInputSessionActionAnalytics populateActionInputMode:withLanguage:](UITextInputSessionActionAnalytics, "populateActionInputMode:withLanguage:", v11, v9);
    if (v6)
      -[NSObject setInputActionCountFromMergedActions:](v11, "setInputActionCountFromMergedActions:", --[NSObject inputActionCount](v11, "inputActionCount"));
    -[UITextInputSessionActionAnalytics _didDeleteBackwardAction:](self, "_didDeleteBackwardAction:", v11);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v13) = 0;
    _os_log_error_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "[UITextInputSessionActionAnalytics] didDeleteBackwardText: called with nil text", (uint8_t *)&v13, 2u);
  }

}

- (void)didDeleteBackwardText:(id)a3
{
  void *v4;
  int64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[UITextInputSessionActionAnalytics _didDeleteBackwardText:shouldOverrideInputActionCountToZero:withLanguage:](self, "_didDeleteBackwardText:shouldOverrideInputActionCountToZero:withLanguage:");
  v4 = (void *)_MergedGlobals_1088;
  v5 = -[UITextInputSessionActionAnalytics _getActiveTextInputSource](self, "_getActiveTextInputSource");
  v6 = 0;
  if ((unint64_t)(v5 - 1) <= 7)
    v6 = qword_18667DF88[v5 - 1];
  objc_msgSend(v4, "didDeleteBackwardText:withType:", v7, +[UIInputAnalyticsTranslator iaTextInputActionsTypeFor:](UIInputAnalyticsTranslator, "iaTextInputActionsTypeFor:", v6));

}

- (void)_didDeleteBackwardAction:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  UITextInputSessionActionAnalytics *v11;
  id v12;

  v4 = a3;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __62__UITextInputSessionActionAnalytics__didDeleteBackwardAction___block_invoke;
  v10 = &unk_1E16B1B50;
  v11 = self;
  v12 = v4;
  v6 = v4;
  dispatch_async(queue, &v7);
  -[UITextInputSessionActionAnalytics beginTrackingSessionDurationIfNecessary](self, "beginTrackingSessionDurationIfNecessary", v7, v8, v9, v10, v11);

}

uint64_t __62__UITextInputSessionActionAnalytics__didDeleteBackwardAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)didChangeToSelection:(_NSRange)a3 relativeRangeBefore:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *queue;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  UITextInputSessionActionAnalytics *v20;
  id v21;
  _QWORD v22[8];
  uint8_t buf[4];
  NSUInteger v24;
  __int16 v25;
  NSUInteger v26;
  __int16 v27;
  NSUInteger v28;
  __int16 v29;
  NSUInteger v30;
  uint64_t v31;

  length = a4.length;
  location = a4.location;
  v6 = a3.length;
  v7 = a3.location;
  v31 = *MEMORY[0x1E0C80C00];
  if (a3.length != a4.length || a3.location != a4.location)
  {
    v9 = -[UITextInputSessionActionAnalytics allowCursorMovementCounter](self, "allowCursorMovementCounter");
    UITextInputSessionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 134218752;
        v24 = v7;
        v25 = 2048;
        v26 = v6;
        v27 = 2048;
        v28 = location;
        v29 = 2048;
        v30 = length;
        _os_log_debug_impl(&dword_185066000, v10, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didChangeToSelection:(%lu, %lu) rangeBefore:(%lu, %lu)", buf, 0x2Au);
      }

      -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "asSelection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setSource:", 0);
      objc_msgSend(v13, "setRelativeRangeBefore:", location, length);
      objc_msgSend(v13, "setRangeAfter:", v7, v6);
      v14 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __78__UITextInputSessionActionAnalytics_didChangeToSelection_relativeRangeBefore___block_invoke;
      v22[3] = &__block_descriptor_64_e5_v8__0l;
      v22[4] = v7;
      v22[5] = v6;
      v22[6] = location;
      v22[7] = length;
      -[UITextInputSessionActionAnalytics _performWithTextInputActionsSource:block:](self, "_performWithTextInputActionsSource:block:", 0, v22);
      queue = self->_queue;
      v16 = v14;
      v17 = 3221225472;
      v18 = __78__UITextInputSessionActionAnalytics_didChangeToSelection_relativeRangeBefore___block_invoke_2;
      v19 = &unk_1E16B1B50;
      v20 = self;
      v21 = v13;
      v10 = v13;
      dispatch_async(queue, &v16);
      -[UITextInputSessionActionAnalytics beginTrackingSessionDurationIfNecessary](self, "beginTrackingSessionDurationIfNecessary", v16, v17, v18, v19, v20);

    }
    else if (v11)
    {
      *(_DWORD *)buf = 134218752;
      v24 = v7;
      v25 = 2048;
      v26 = v6;
      v27 = 2048;
      v28 = location;
      v29 = 2048;
      v30 = length;
      _os_log_debug_impl(&dword_185066000, v10, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics][Skipped - ignoreCursorMovements] didChangeToSelection:(%lu, %lu) rangeBefore:(%lu, %lu)", buf, 0x2Au);
    }

  }
}

uint64_t __78__UITextInputSessionActionAnalytics_didChangeToSelection_relativeRangeBefore___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)_MergedGlobals_1088, "didChangeToSelection:relativeRangeBefore:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __78__UITextInputSessionActionAnalytics_didChangeToSelection_relativeRangeBefore___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)didCopy
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didCopy", buf, 2u);
  }

  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSource:", 0);
  objc_msgSend(v5, "setTextInputActionsType:", 11);
  -[UITextInputSessionActionAnalytics _performWithTextInputActionsSource:block:](self, "_performWithTextInputActionsSource:block:", 0, &__block_literal_global_88_0);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__UITextInputSessionActionAnalytics_didCopy__block_invoke_2;
  v8[3] = &unk_1E16B1B50;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __44__UITextInputSessionActionAnalytics_didCopy__block_invoke()
{
  return objc_msgSend((id)_MergedGlobals_1088, "didCopy:", 0);
}

uint64_t __44__UITextInputSessionActionAnalytics_didCopy__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)didCut
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didCut", buf, 2u);
  }

  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asCut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSource:", 0);
  objc_msgSend(v5, "setTextInputActionsType:", 10);
  -[UITextInputSessionActionAnalytics _performWithTextInputActionsSource:block:](self, "_performWithTextInputActionsSource:block:", 0, &__block_literal_global_90_0);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__UITextInputSessionActionAnalytics_didCut__block_invoke_2;
  v8[3] = &unk_1E16B1B50;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __43__UITextInputSessionActionAnalytics_didCut__block_invoke()
{
  return objc_msgSend((id)_MergedGlobals_1088, "didCut:", 0);
}

uint64_t __43__UITextInputSessionActionAnalytics_didCut__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)didPaste
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didPaste", buf, 2u);
  }

  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asPaste");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSource:", 0);
  objc_msgSend(v5, "setTextInputActionsType:", 12);
  -[UITextInputSessionActionAnalytics _performWithTextInputActionsSource:block:](self, "_performWithTextInputActionsSource:block:", 0, &__block_literal_global_92);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__UITextInputSessionActionAnalytics_didPaste__block_invoke_2;
  v8[3] = &unk_1E16B1B50;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __45__UITextInputSessionActionAnalytics_didPaste__block_invoke()
{
  return objc_msgSend((id)_MergedGlobals_1088, "didPaste:", 0);
}

uint64_t __45__UITextInputSessionActionAnalytics_didPaste__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)didUndo
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didUndo", buf, 2u);
  }

  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asUndo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSource:", 0);
  objc_msgSend(v5, "setTextInputActionsType:", 13);
  -[UITextInputSessionActionAnalytics _performWithTextInputActionsSource:block:](self, "_performWithTextInputActionsSource:block:", 0, &__block_literal_global_94_0);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__UITextInputSessionActionAnalytics_didUndo__block_invoke_2;
  v8[3] = &unk_1E16B1B50;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __44__UITextInputSessionActionAnalytics_didUndo__block_invoke()
{
  return objc_msgSend((id)_MergedGlobals_1088, "didUndo");
}

uint64_t __44__UITextInputSessionActionAnalytics_didUndo__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)didRedo
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didRedo", buf, 2u);
  }

  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asRedo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSource:", 0);
  objc_msgSend(v5, "setTextInputActionsType:", 14);
  -[UITextInputSessionActionAnalytics _performWithTextInputActionsSource:block:](self, "_performWithTextInputActionsSource:block:", 0, &__block_literal_global_96_0);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__UITextInputSessionActionAnalytics_didRedo__block_invoke_2;
  v8[3] = &unk_1E16B1B50;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __44__UITextInputSessionActionAnalytics_didRedo__block_invoke()
{
  return objc_msgSend((id)_MergedGlobals_1088, "didRedo");
}

uint64_t __44__UITextInputSessionActionAnalytics_didRedo__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)didReplaceWithCandidate:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  UITextInputSessionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    +[UITextInputSessionActionAnalytics stringForReplaceWithCandidateType:](UITextInputSessionActionAnalytics, "stringForReplaceWithCandidateType:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v10;
    _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didReplaceWithCandidate:'%@'", buf, 0xCu);

  }
  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asReplaceWithCandidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setReplaceWithCandidateType:", a3);
  objc_msgSend(v7, "setInputActionCountFromMergedActions:", -objc_msgSend(v7, "inputActionCount"));
  objc_msgSend((id)_MergedGlobals_1088, "didReplaceWithCandidate:", a3);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__UITextInputSessionActionAnalytics_didReplaceWithCandidate___block_invoke;
  v11[3] = &unk_1E16B1B50;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  dispatch_async(queue, v11);

}

uint64_t __61__UITextInputSessionActionAnalytics_didReplaceWithCandidate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)didCandidateBarReplacementForText:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  UITextInputSessionLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didCandidateBarReplacementForText:'%@' withText:'%@'", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend((id)_MergedGlobals_1088, "didCandidateBarReplacementForText:withText:", v6, v7);
  -[UITextInputSessionActionAnalytics didReplacementForText:withText:withSource:withType:withInputActionCount:](self, "didReplacementForText:withText:withSource:withType:withInputActionCount:", v6, v7, 7, 1, 1);

}

- (void)didCalloutBarReplacementForText:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  UITextInputSessionLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didCalloutBarReplacementForText:'%@' withText:'%@'", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend((id)_MergedGlobals_1088, "didCalloutBarReplacementForText:withText:", v6, v7);
  -[UITextInputSessionActionAnalytics didReplacementForText:withText:withSource:withType:withInputActionCount:](self, "didReplacementForText:withText:withSource:withType:withInputActionCount:", v6, v7, 8, 1, 1);

}

- (void)didAutocorrectReplacementForText:(id)a3 withText:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  objc_msgSend((id)_MergedGlobals_1088, "didAutocorrectReplacementForText:withText:", v6, v7);
  if (v6 && objc_msgSend(v6, "length"))
  {
    if (!v7)
      v7 = &stru_1E16EDF20;
    UITextInputSessionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didAutocorrectReplacementForText:'%@' withText:'%@'", (uint8_t *)&v9, 0x16u);
    }

    -[UITextInputSessionActionAnalytics didReplacementForText:withText:withSource:withType:withInputActionCount:](self, "didReplacementForText:withText:withSource:withType:withInputActionCount:", v6, v7, 0, 6, 1);
  }

}

- (void)didAutocorrectTapOnCompletionReplacementForText:(id)a3 withText:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  objc_msgSend((id)_MergedGlobals_1088, "didAutocorrectTapOnCompletionReplacementForText:withText:", v6, v7);
  if (v6 && objc_msgSend(v6, "length"))
  {
    if (!v7)
      v7 = &stru_1E16EDF20;
    UITextInputSessionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didAutocorrectTapOnCompletionReplacementForText:'%@' withText:'%@'", (uint8_t *)&v9, 0x16u);
    }

    -[UITextInputSessionActionAnalytics didReplacementForText:withText:withSource:withType:withInputActionCount:](self, "didReplacementForText:withText:withSource:withType:withInputActionCount:", v6, v7, 12, 6, 1);
  }

}

- (void)didInlineCompletionReplacementForText:(id)a3 withText:(id)a4
{
  unint64_t v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = (__CFString *)a4;
  objc_msgSend((id)_MergedGlobals_1088, "didInlineCompletionReplacementForText:withText:", v6, v7);
  if (v6 | (unint64_t)v7)
  {
    if (!v7)
      v7 = &stru_1E16EDF20;
    UITextInputSessionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didInlineCompletionReplacementForText:'%@' withText:'%@'", (uint8_t *)&v9, 0x16u);
    }

    -[UITextInputSessionActionAnalytics didReplacementForText:withText:withSource:withType:withInputActionCount:](self, "didReplacementForText:withText:withSource:withType:withInputActionCount:", v6, v7, 0, 15, 1);
  }

}

- (void)didInlineCompletionTapOnCompletionReplacementForText:(id)a3 withText:(id)a4
{
  unint64_t v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = (__CFString *)a4;
  objc_msgSend((id)_MergedGlobals_1088, "didInlineCompletionTapOnCompletionReplacementForText:withText:", v6, v7);
  if (v6 | (unint64_t)v7)
  {
    if (!v7)
      v7 = &stru_1E16EDF20;
    UITextInputSessionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didInlineCompletionTapOnCompletionReplacementForText:'%@' withText:'%@'", (uint8_t *)&v9, 0x16u);
    }

    -[UITextInputSessionActionAnalytics didReplacementForText:withText:withSource:withType:withInputActionCount:](self, "didReplacementForText:withText:withSource:withType:withInputActionCount:", v6, v7, 12, 15, 1);
  }

}

- (void)didRevisionBubbleTap
{
  NSObject *v3;
  uint8_t v4[16];

  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didRevisionBubbleTap", v4, 2u);
  }

  objc_msgSend((id)_MergedGlobals_1088, "didRevisionBubbleTap");
  -[UITextInputSessionActionAnalytics didReplacementForText:withText:withSource:withType:withInputActionCount:](self, "didReplacementForText:withText:withSource:withType:withInputActionCount:", &stru_1E16EDF20, &stru_1E16EDF20, 11, 1, 1);
}

- (void)didRevisionBubbleReplacementForText:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)_MergedGlobals_1088, "didRevisionBubbleReplacementForText:withText:", v6, v7);
  if (v6)
  {
    UITextInputSessionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didRevisionBubbleReplacementForText:'%@' withText:'%@'", (uint8_t *)&v9, 0x16u);
    }

    -[UITextInputSessionActionAnalytics didReplacementForText:withText:withSource:withType:withInputActionCount:](self, "didReplacementForText:withText:withSource:withType:withInputActionCount:", v6, v7, 11, 1, 0);
  }

}

- (void)didReplacementForText:(id)a3 withText:(id)a4 withSource:(int64_t)a5 withType:(int64_t)a6 withInputActionCount:(int64_t)a7
{
  __CFString *v12;
  __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NSObject *queue;
  id v19;
  _QWORD v20[5];
  id v21;

  v12 = (__CFString *)a3;
  v13 = v12;
  if (a4)
  {
    if (!v12)
      v13 = &stru_1E16EDF20;
    v14 = a4;
    -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "asReplaceText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
      objc_msgSend(v16, "setTextInputActionsSource:", a5);
    objc_msgSend(v16, "setTextInputActionsType:", a6);
    objc_msgSend(v16, "setRemovedTextLength:", -[__CFString length](v13, "length"));
    objc_msgSend(v16, "setInsertedTextLength:", objc_msgSend(v14, "length"));
    objc_msgSend(v16, "setOptions:", -[UITextInputSessionActionAnalytics _optionsForText:](self, "_optionsForText:", v13));
    objc_msgSend(v16, "setRemovedEmojiCount:", -[UITextInputSessionActionAnalytics _emojiCountForText:](self, "_emojiCountForText:", v13));
    objc_msgSend(v16, "setInsertedEmojiCount:", -[UITextInputSessionActionAnalytics _emojiCountForText:](self, "_emojiCountForText:", v14));
    objc_msgSend(v16, "setRemovedPunctuationCount:", -[UITextInputSessionActionAnalytics _punctuationCountForText:](self, "_punctuationCountForText:", v13));
    v17 = -[UITextInputSessionActionAnalytics _punctuationCountForText:](self, "_punctuationCountForText:", v14);

    objc_msgSend(v16, "setInsertedPunctuationCount:", v17);
    objc_msgSend(v16, "setInputActionCountFromMergedActions:", a7 - objc_msgSend(v16, "inputActionCount"));
    queue = self->_queue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __109__UITextInputSessionActionAnalytics_didReplacementForText_withText_withSource_withType_withInputActionCount___block_invoke;
    v20[3] = &unk_1E16B1B50;
    v20[4] = self;
    v21 = v16;
    v19 = v16;
    dispatch_async(queue, v20);

  }
}

uint64_t __109__UITextInputSessionActionAnalytics_didReplacementForText_withText_withSource_withType_withInputActionCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_addActionAndUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)didOther
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didOther - flushing recent actions", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__UITextInputSessionActionAnalytics_didOther__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __45__UITextInputSessionActionAnalytics_didOther__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_flushRecentActions");
}

- (void)didInsertKeyPressWithInputSource:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  _QWORD v10[5];
  uint8_t buf[4];
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  UITextInputSessionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v12 = a3;
    _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didInsertKeyPressWithInputSource:%lu", buf, 0xCu);
  }

  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asInsertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setInsertedTextLength:", 0);
  objc_msgSend(v7, "setSource:", a3);
  +[UITextInputSessionActionAnalytics populateActionInputMode:](UITextInputSessionActionAnalytics, "populateActionInputMode:", v7);
  objc_msgSend(v7, "setInputActionCountFromMergedActions:", 1);
  v8 = 0;
  if ((unint64_t)(a3 - 1) <= 7)
    v8 = qword_18667DFC8[a3 - 1];
  v9 = +[UIInputAnalyticsTranslator iaTextInputActionsSourceFor:](UIInputAnalyticsTranslator, "iaTextInputActionsSourceFor:", v8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__UITextInputSessionActionAnalytics_didInsertKeyPressWithInputSource___block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0l;
  v10[4] = a3;
  -[UITextInputSessionActionAnalytics _performWithTextInputActionsSource:block:](self, "_performWithTextInputActionsSource:block:", v9, v10);
  -[UITextInputSessionActionAnalytics _didInsertTextAction:numCharsDeleted:withLanguage:](self, "_didInsertTextAction:numCharsDeleted:withLanguage:", v7, 0, 0);

}

uint64_t __70__UITextInputSessionActionAnalytics_didInsertKeyPressWithInputSource___block_invoke(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 7)
    v2 = 0;
  else
    v2 = qword_18667DF88[v1];
  return objc_msgSend((id)_MergedGlobals_1088, "didInsertionKeyPressOfKey:withType:", 0, v2);
}

- (void)didDeleteKeyPressWithInputSource:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  _QWORD v10[5];
  uint8_t buf[4];
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  UITextInputSessionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v12 = a3;
    _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] didDeleteKeyPressWithInputSource:%lu", buf, 0xCu);
  }

  -[UITextInputSessionActionAnalytics _instanceOfActionClass:](self, "_instanceOfActionClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asDeletion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setRemovedTextLength:", 0);
  objc_msgSend(v7, "setSource:", a3);
  +[UITextInputSessionActionAnalytics populateActionInputMode:](UITextInputSessionActionAnalytics, "populateActionInputMode:", v7);
  objc_msgSend(v7, "setInputActionCountFromMergedActions:", 1);
  v8 = 0;
  if ((unint64_t)(a3 - 1) <= 7)
    v8 = qword_18667DFC8[a3 - 1];
  v9 = +[UIInputAnalyticsTranslator iaTextInputActionsSourceFor:](UIInputAnalyticsTranslator, "iaTextInputActionsSourceFor:", v8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__UITextInputSessionActionAnalytics_didDeleteKeyPressWithInputSource___block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0l;
  v10[4] = a3;
  -[UITextInputSessionActionAnalytics _performWithTextInputActionsSource:block:](self, "_performWithTextInputActionsSource:block:", v9, v10);
  -[UITextInputSessionActionAnalytics _didDeleteBackwardAction:](self, "_didDeleteBackwardAction:", v7);

}

uint64_t __70__UITextInputSessionActionAnalytics_didDeleteKeyPressWithInputSource___block_invoke(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 7)
    v2 = 0;
  else
    v2 = qword_18667DF88[v1];
  return objc_msgSend((id)_MergedGlobals_1088, "didDeletionKeyPressOfKey:withType:", 0, v2);
}

- (void)didKeyPress:(id)a3 inputSource:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint8_t v11[16];

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", CFSTR("Delete-Key"));

    if (v9)
      -[UITextInputSessionActionAnalytics didDeleteKeyPressWithInputSource:](self, "didDeleteKeyPressWithInputSource:", a4);
    else
      -[UITextInputSessionActionAnalytics didInsertKeyPressWithInputSource:](self, "didInsertKeyPressWithInputSource:", a4);
  }
  else
  {
    UITextInputSessionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "[UITextInputSessionActionAnalytics] didKeyPress: called with nil key!", v11, 2u);
    }

  }
}

+ (id)stringForReplaceWithCandidateType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("?");
  else
    return off_1E16CB778[a3];
}

+ (id)stringForKeyboardDockItemButtonPressResult:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("?");
  else
    return off_1E16CB798[a3];
}

+ (id)stringForKeyboardDockItemButtonType:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("?");
  else
    return off_1E16CB7B8[a3];
}

- (NSDictionary)keyboardTrialParameters
{
  return self->_keyboardTrialParameters;
}

- (IATextInputActionsInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_inputMode, a3);
}

- (unint64_t)allowCursorMovementCounter
{
  return self->_allowCursorMovementCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_keyboardTrialParameters, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegateSource);
  objc_storeStrong((id *)&self->_overrideInputModeString, 0);
  objc_storeStrong((id *)&self->_separateCycleAccumulatorNames, 0);
  objc_storeStrong((id *)&self->_dynamicAccumulators, 0);
  objc_storeStrong((id *)&self->_efficacyAccumulators, 0);
  objc_storeStrong((id *)&self->_accumulators, 0);
  objc_storeStrong((id *)&self->_recentActions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (int64_t)flagOptions
{
  int64_t v2;
  void *v3;
  void *v4;
  int v5;

  v2 = +[UIKeyboard isShowingEmojiSearch](UIKeyboard, "isShowingEmojiSearch");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputDelegateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasAsyncCapableInputDelegate");

  if (v5)
    return v2 | 4;
  else
    return v2;
}

- (id)appBundleId
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[UITextInputSessionActionAnalytics getAppBundleId](self, "getAppBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138477827;
    v6 = v2;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] appBundleId - returning '%{private}@'", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (id)processBundleId
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIMainBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138477827;
    v6 = v2;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] processBundleId - returning '%{private}@'", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (int64_t)source
{
  NSObject *v3;
  int64_t v4;
  int64_t v5;
  NSObject *v6;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_useOverrideSourceCounter < 1)
  {
    v5 = -[UITextInputSessionActionAnalytics _getActiveTextInputSource](self, "_getActiveTextInputSource");
    if ((unint64_t)(v5 - 1) > 7)
      v4 = 0;
    else
      v4 = qword_18667DFC8[v5 - 1];
    UITextInputSessionLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      +[UITextInputSessionActionAnalytics stringValueForSource:](UITextInputSessionActionAnalytics, "stringValueForSource:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138478083;
      v11 = v9;
      v12 = 2048;
      v13 = v4;
      _os_log_debug_impl(&dword_185066000, v6, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] source - returning source '%{private}@' -> %lu", (uint8_t *)&v10, 0x16u);

    }
  }
  else
  {
    UITextInputSessionLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      _UITextInputActionsSourceString(self->_overrideSource);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138477827;
      v11 = v8;
      _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] source - returning override '%{private}@'", (uint8_t *)&v10, 0xCu);

    }
    return self->_overrideSource;
  }
  return v4;
}

@end
