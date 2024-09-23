@implementation TITypingSession

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (void)layoutDidChange:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  __int128 *p_buf;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 buf;
  uint64_t v23;
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IXACanLogMessageAtLevel())
  {
    IXASessionEventsLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s LC firstKeyString: '%s'"), "-[TITypingSession layoutDidChange:keyboardState:]", objc_msgSend(v6, "firstKeyString"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

    }
  }
  if ((objc_msgSend(v7, "secureTextEntry") & 1) != 0
    || -[TITypingSession didReceiveSecureFieldEvent](self, "didReceiveSecureFieldEvent"))
  {
    -[TITypingSession setDidReceiveSecureFieldEvent:](self, "setDidReceiveSecureFieldEvent:", 1);
  }
  else if (v6)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v23 = 0x2020000000;
    v24 = 1;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = -1;
    -[TITypingSession layouts](self, "layouts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__TITypingSession_layoutDidChange_keyboardState___block_invoke;
    v14[3] = &unk_1EA106E80;
    v10 = v6;
    v15 = v10;
    p_buf = &buf;
    v17 = &v18;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      -[NSMutableArray addObject:](self->_layouts, "addObject:", v10);
      -[TITypingSession layouts](self, "layouts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      v19[3] = v12 - 1;

    }
    -[TITypingSession setCurrentLayoutID:](self, "setCurrentLayoutID:", v19[3]);
    -[TITypingSession updateCachedStateBeforeFirstInputWithKeyboardState:](self, "updateCachedStateBeforeFirstInputWithKeyboardState:", v7);

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&buf, 8);
  }

}

- (NSMutableArray)layouts
{
  return self->_layouts;
}

- (void)setClientID:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IXACanLogMessageAtLevel())
  {
    IXASessionEventsLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s CI clientID: '%@'"), "-[TITypingSession setClientID:keyboardState:]", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  if ((objc_msgSend(v7, "secureTextEntry") & 1) != 0
    || -[TITypingSession didReceiveSecureFieldEvent](self, "didReceiveSecureFieldEvent"))
  {
    -[TITypingSession setDidReceiveSecureFieldEvent:](self, "setDidReceiveSecureFieldEvent:", 1);
  }
  else
  {
    -[TITypingSession setApplicationID:](self, "setApplicationID:", v6);
    -[TITypingSession updateCachedStateBeforeFirstInputWithKeyboardState:](self, "updateCachedStateBeforeFirstInputWithKeyboardState:", v7);
  }

}

- (BOOL)didReceiveSecureFieldEvent
{
  return self->_didReceiveSecureFieldEvent;
}

- (void)updateCachedStateBeforeFirstInputWithKeyboardState:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableArray *cachedKeyboardStates;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = -[NSMutableArray count](self->_cachedKeyboardStates, "count");
    v4 = v8;
    if (!v5)
    {
      cachedKeyboardStates = self->_cachedKeyboardStates;
      v7 = (void *)objc_msgSend(v8, "copy");
      -[NSMutableArray addObject:](cachedKeyboardStates, "addObject:", v7);

      v4 = v8;
    }
  }

}

- (void)setApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (TITypingSession)initWithLocale:(id)a3 keyboardLayout:(id)a4
{
  id v7;
  id v8;
  TITypingSession *v9;
  uint64_t v10;
  NSMutableArray *userActionHistory;
  uint64_t v12;
  NSMutableArray *layouts;
  uint64_t v14;
  NSDate *startTime;
  uint64_t v16;
  NSUUID *sessionId;
  TIKeyboardTouchEvent *timeCalibrationTouch;
  TIKeyboardState *savedDeleteInputKeyboardState;
  uint64_t v20;
  NSMutableDictionary *touchesHistory;
  uint64_t v22;
  NSMutableArray *cachedKeyboardStates;
  uint64_t v24;
  NSMutableArray *cachedCandidatesOffered;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TITypingSession;
  v9 = -[TITypingSession init](&v27, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    userActionHistory = v9->_userActionHistory;
    v9->_userActionHistory = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    layouts = v9->_layouts;
    v9->_layouts = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v9->_locale, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = objc_claimAutoreleasedReturnValue();
    startTime = v9->_startTime;
    v9->_startTime = (NSDate *)v14;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = objc_claimAutoreleasedReturnValue();
    sessionId = v9->_sessionId;
    v9->_sessionId = (NSUUID *)v16;

    timeCalibrationTouch = v9->_timeCalibrationTouch;
    v9->_timeCalibrationTouch = 0;
    v9->_calibratedTimeBase = 0.0;

    savedDeleteInputKeyboardState = v9->_savedDeleteInputKeyboardState;
    v9->_savedDeleteInputKeyboardState = 0;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    touchesHistory = v9->_touchesHistory;
    v9->_touchesHistory = (NSMutableDictionary *)v20;

    if (v8)
    {
      -[NSMutableArray addObject:](v9->_layouts, "addObject:", v8);
      v9->_currentLayoutID = 0;
    }
    objc_storeStrong((id *)&v9->_contextChangeTrigger, (id)*MEMORY[0x1E0DBDEB8]);
    objc_storeStrong((id *)&v9->_candidateAcceptedTrigger, (id)*MEMORY[0x1E0DBDE38]);
    v9->_candidatesAccepted = 0;
    v9->_candidatesAcceptedWithText = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    cachedKeyboardStates = v9->_cachedKeyboardStates;
    v9->_cachedKeyboardStates = (NSMutableArray *)v22;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = objc_claimAutoreleasedReturnValue();
    cachedCandidatesOffered = v9->_cachedCandidatesOffered;
    v9->_cachedCandidatesOffered = (NSMutableArray *)v24;

  }
  return v9;
}

- (void)setCurrentLayoutID:(unint64_t)a3
{
  self->_currentLayoutID = a3;
}

- (void)changingContextWithTrigger:(id)a3
{
  NSString *v4;
  NSObject *v5;
  NSString *contextChangeTrigger;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  if (IXACanLogMessageAtLevel())
  {
    IXASessionEventsLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TC trigger: %@"), "-[TITypingSession changingContextWithTrigger:]", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v7;
      _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  contextChangeTrigger = self->_contextChangeTrigger;
  self->_contextChangeTrigger = v4;

}

- (TITypingSessionParams)sessionParams
{
  return self->_sessionParams;
}

- (TIFeatureUsageMetricsCache)featureUsageMetricsCache
{
  return self->_featureUsageMetricsCache;
}

- (void)contextDidChange:(id)a3 wordDelete:(BOOL)a4 cursorMoved:(BOOL)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 range:(_NSRange)a8 selectionLocation:(unint64_t)a9 keyboardState:(id)a10
{
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  TIGainFocusEvent *v44;
  void *v45;
  TIGainFocusEvent *v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  _BOOL4 v60;
  _QWORD v61[2];
  _QWORD v62[2];
  uint8_t buf[24];
  uint64_t v64;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v64 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a7;
  v17 = a10;
  if (IXACanLogMessageAtLevel())
  {
    IXASessionEventsLogFacility();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s CC trigger: %@ wordDelete: %d cursorMoved: %d extendsPriorWord: %d"), "-[TITypingSession contextDidChange:wordDelete:cursorMoved:extendsPriorWord:inWord:range:selectionLocation:keyboardState:]", self->_contextChangeTrigger, v13, v12, v11);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v27;
      _os_log_debug_impl(&dword_1DA6F2000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  if ((objc_msgSend(v17, "secureTextEntry") & 1) == 0
    && !-[TITypingSession didReceiveSecureFieldEvent](self, "didReceiveSecureFieldEvent"))
  {
    -[TITypingSession contextChangeTrigger](self, "contextChangeTrigger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)*MEMORY[0x1E0DBDEA8];

    v21 = (id *)MEMORY[0x1E0DBDEB8];
    if (v19 == v20)
    {
      -[TITypingSession lastInput](self, "lastInput");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isBackspace");

      if (v25)
      {
        -[TITypingSession lastInput](self, "lastInput");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setRapidDelete:", 1);

      }
    }
    else if (-[TITypingSession fromLegacyRecording](self, "fromLegacyRecording"))
    {
      -[TITypingSession lastInput](self, "lastInput");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "isBackspace"))
      {
        -[TITypingSession lastInput](self, "lastInput");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "isRapidDelete"))
        {

        }
        else
        {
          v59 = -[TITypingSession testForRapidDeleteContextChange:](self, "testForRapidDeleteContextChange:", v17);

          if (!v59)
          {
LABEL_20:
            if (v13)
              goto LABEL_21;
            -[TITypingSession setContextChangeTrigger:](self, "setContextChangeTrigger:", *MEMORY[0x1E0DBDEB0]);
            goto LABEL_25;
          }
          -[TITypingSession lastInput](self, "lastInput");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setRapidDelete:", 1);
        }
      }

      goto LABEL_20;
    }
    if (v13)
    {
LABEL_21:
      *(_OWORD *)buf = 0uLL;
      v62[0] = 0;
      v62[1] = 0;
      v61[0] = 0;
      v61[1] = 0;
      -[TITypingSession currentWord](self, "currentWord");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "allKeyboardInputs");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypingSession resolveInputs:cancelledTextRange:leadingBackspaceRange:trailingTextRange:](self, "resolveInputs:cancelledTextRange:leadingBackspaceRange:trailingTextRange:", v29, buf, v62, v61);

      if (*(_QWORD *)buf != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[TITypingSession uncommittedWordEntryFromInputsWithRange:documentState:cancelled:](self, "uncommittedWordEntryFromInputsWithRange:documentState:cancelled:", *(_OWORD *)buf, 0, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[TITypingSession insertUncommittedUserAction:](self, "insertUncommittedUserAction:", v30);

        -[TITypingSession removeInputsAndTouchesWithRange:](self, "removeInputsAndTouchesWithRange:", *(_OWORD *)buf);
      }
      -[TITypingSession committedWordDeletionWithDocumentState:keyboardState:](self, "committedWordDeletionWithDocumentState:keyboardState:", v15, v17);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypingSession userActionHistory](self, "userActionHistory");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v31);

      -[TITypingSession setLastDeletion:](self, "setLastDeletion:", v31);
      -[TITypingSession setIncludeInputToLastDeletion:](self, "setIncludeInputToLastDeletion:", 1);
      -[TITypingSession resetCurrentWord](self, "resetCurrentWord");

      goto LABEL_44;
    }
LABEL_25:
    -[TITypingSession lastInput](self, "lastInput");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isBackspace");

    if ((v34 & 1) != 0)
    {
LABEL_44:
      objc_storeStrong((id *)&self->_contextChangeTrigger, *v21);
      goto LABEL_45;
    }
    -[TITypingSession userActionHistory](self, "userActionHistory");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");
    v37 = (_QWORD *)MEMORY[0x1E0DBDE90];
    v60 = v11;
    if (v36)
    {

LABEL_32:
      -[TITypingSession contextChangeTrigger](self, "contextChangeTrigger");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "isEqualToString:", *v37);

      if (v43)
      {
        v44 = [TIGainFocusEvent alloc];
        -[TITypingSession locale](self, "locale");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[TIGainFocusEvent initWithTIKeyboardState:andLocale:](v44, "initWithTIKeyboardState:andLocale:", v17, v45);

        -[TITypingSession initContextChangeEvent:withDocumentState:keyboardState:extendsPriorWord:inWord:inWordRange:selectionLocation:](self, "initContextChangeEvent:withDocumentState:keyboardState:extendsPriorWord:inWord:inWordRange:selectionLocation:", v46, v15, v17, v60, v16, a8.location, a8.length, a9);
        v21 = (id *)MEMORY[0x1E0DBDEB8];
      }
      else
      {
        -[TITypingSession contextChangeTrigger](self, "contextChangeTrigger");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "isEqualToString:", *MEMORY[0x1E0DBDE98]);

        v21 = (id *)MEMORY[0x1E0DBDEB8];
        if (!v48)
        {
          -[TITypingSession contextChangeTrigger](self, "contextChangeTrigger");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "isEqualToString:", *MEMORY[0x1E0DBDEB0]);

          if (!v50)
          {
            -[TITypingSession contextChangeTrigger](self, "contextChangeTrigger");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "isEqualToString:", *MEMORY[0x1E0DBDE80]);

            if (!v52)
            {
              -[TITypingSession contextChangeTrigger](self, "contextChangeTrigger");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v53, "isEqualToString:", v20);

              if (!v54)
              {
                -[TITypingSession contextChangeTrigger](self, "contextChangeTrigger");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = objc_msgSend(v55, "isEqualToString:", *MEMORY[0x1E0DBDE88]);

                if (!v56)
                {
                  -[TITypingSession contextChangeTrigger](self, "contextChangeTrigger");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "isEqualToString:", *MEMORY[0x1E0DBDEA0]);

                }
              }
            }
          }
        }
        -[TITypingSession createContextChangeEventWithClass:documentState:keyboardState:extendsPriorWord:inWord:inWordRange:selectionLocation:](self, "createContextChangeEventWithClass:documentState:keyboardState:extendsPriorWord:inWord:inWordRange:selectionLocation:", objc_opt_class(), v15, v17, v60, v16, a8.location, a8.length, a9);
        v46 = (TIGainFocusEvent *)objc_claimAutoreleasedReturnValue();
      }
      -[TITypingSession userActionHistory](self, "userActionHistory");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addObject:", v46);

      goto LABEL_44;
    }
    v38 = (_QWORD *)MEMORY[0x1E0DBDE90];
    -[TITypingSession contextChangeTrigger](self, "contextChangeTrigger");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "isEqualToString:", *MEMORY[0x1E0DBDEB8]))
    {

      v37 = v38;
    }
    else
    {
      -[TITypingSession contextChangeTrigger](self, "contextChangeTrigger");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "isEqualToString:", *MEMORY[0x1E0DBDEB0]);

      v37 = v38;
      if (!v41)
        goto LABEL_32;
    }
    -[TITypingSession setContextChangeTrigger:](self, "setContextChangeTrigger:", *v37);
    goto LABEL_32;
  }
  -[TITypingSession setDidReceiveSecureFieldEvent:](self, "setDidReceiveSecureFieldEvent:", 1);
LABEL_45:

}

- (NSMutableArray)userActionHistory
{
  return self->_userActionHistory;
}

- (NSString)contextChangeTrigger
{
  return self->_contextChangeTrigger;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (TIKeyboardInput)lastInput
{
  return self->_lastInput;
}

- (void)initContextChangeEvent:(id)a3 withDocumentState:(id)a4 keyboardState:(id)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 inWordRange:(_NSRange)a8 selectionLocation:(unint64_t)a9
{
  _BOOL8 v9;
  id v13;
  id v14;
  void *v15;
  id v16;

  v9 = a6;
  v13 = a7;
  v14 = a4;
  v16 = a3;
  objc_msgSend(v16, "setDocumentState:", v14);
  objc_msgSend(v14, "selectedText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setIsSelection:", objc_msgSend(v15, "length") != 0);
  objc_msgSend(v16, "setExtendsPriorWord:", v9);
  objc_msgSend(v16, "setInWordRange:", a8.location, a8.length);
  objc_msgSend(v16, "setInWord:", v13);

  objc_msgSend(v16, "setSelectionLocation:", a9);
  -[TITypingSession calibratedCurrentTimestamp](self, "calibratedCurrentTimestamp");
  objc_msgSend(v16, "setOccurenceTime:");

}

- (BOOL)fromLegacyRecording
{
  return self->_fromLegacyRecording;
}

- (double)calibratedCurrentTimestamp
{
  TIKeyboardTouchEvent *timeCalibrationTouch;
  double Current;
  double v5;
  double calibratedTimeBase;
  double v7;
  NSObject *v8;
  double v9;
  void *v11;
  double v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  timeCalibrationTouch = self->_timeCalibrationTouch;
  Current = CFAbsoluteTimeGetCurrent();
  v5 = Current;
  if (!timeCalibrationTouch)
    return -Current;
  calibratedTimeBase = self->_calibratedTimeBase;
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  v7 = v5 - calibratedTimeBase;
  if (TICanLogMessageAtLevel_logLevel)
  {
    TIOSLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[TIKeyboardTouchEvent timestamp](self->_timeCalibrationTouch, "timestamp");
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%s calibrated timestamp %lf"), "-[TITypingSession calibratedCurrentTimestamp]", v7 + v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v13;
      _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  -[TIKeyboardTouchEvent timestamp](self->_timeCalibrationTouch, "timestamp");
  return v7 + v9;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setSessionParams:(id)a3
{
  objc_storeStrong((id *)&self->_sessionParams, a3);
}

- (void)setOriginalWords:(id)a3
{
  objc_storeStrong((id *)&self->_originalWords, a3);
}

- (void)setFeatureUsageMetricsCache:(id)a3
{
  objc_storeStrong((id *)&self->_featureUsageMetricsCache, a3);
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (NSUUID)sessionId
{
  NSUUID *sessionId;
  NSUUID *v4;
  NSUUID *v5;

  sessionId = self->_sessionId;
  if (!sessionId)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sessionId;
    self->_sessionId = v4;

    sessionId = self->_sessionId;
  }
  return sessionId;
}

- (NSArray)originalWords
{
  return self->_originalWords;
}

- (void)handleUncommittedWord
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (self->_currentWord)
  {
    if (-[NSMutableArray count](self->_cachedKeyboardStates, "count"))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_cachedKeyboardStates, "objectAtIndexedSubscript:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "secureTextEntry"))
      {

LABEL_6:
        -[TITypingSession setDidReceiveSecureFieldEvent:](self, "setDidReceiveSecureFieldEvent:", 1);
LABEL_7:
        -[TITypingSession resetCurrentWord](self, "resetCurrentWord");
        return;
      }
      v4 = -[TITypingSession didReceiveSecureFieldEvent](self, "didReceiveSecureFieldEvent");

      if (v4)
        goto LABEL_6;
    }
    else if (-[TITypingSession didReceiveSecureFieldEvent](self, "didReceiveSecureFieldEvent"))
    {
      goto LABEL_6;
    }
    -[TITypingSession currentWord](self, "currentWord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeyboardInputs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
      goto LABEL_7;
    v24 = 0;
    v25 = 0;
    v22 = 0;
    v23 = 0;
    v20 = 0;
    v21 = 0;
    -[TITypingSession currentWord](self, "currentWord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeyboardInputs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingSession resolveInputs:cancelledTextRange:leadingBackspaceRange:trailingTextRange:](self, "resolveInputs:cancelledTextRange:leadingBackspaceRange:trailingTextRange:", v9, &v24, &v22, &v20);

    v10 = v22;
    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[TITypingSession currentWord](self, "currentWord");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allKeyboardInputs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      -[TITypingSession uncommittedWordEntryFromInputsWithRange:documentState:cancelled:](self, "uncommittedWordEntryFromInputsWithRange:documentState:cancelled:", 0, v13, 0, v20 == 0x7FFFFFFFFFFFFFFFLL);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[TITypingSession uncommittedWordEntryFromInputsWithRange:documentState:cancelled:](self, "uncommittedWordEntryFromInputsWithRange:documentState:cancelled:", v24, v25, 0, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TITypingSession insertUncommittedUserAction:](self, "insertUncommittedUserAction:", v15);

        v10 = v22;
      }
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = v21 + v23;
        -[NSMutableArray objectAtIndexedSubscript:](self->_cachedKeyboardStates, "objectAtIndexedSubscript:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "documentState");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[TITypingSession uncommittedWordEntryFromInputsWithRange:documentState:cancelled:](self, "uncommittedWordEntryFromInputsWithRange:documentState:cancelled:", v10, v17, v16, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TITypingSession insertUncommittedUserAction:](self, "insertUncommittedUserAction:", v19);

        goto LABEL_18;
      }
      -[TITypingSession uncommittedWordDeletionFromInputsWithRange:](self, "uncommittedWordDeletionFromInputsWithRange:", v10, v23);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v14;
    -[TITypingSession insertUncommittedUserAction:](self, "insertUncommittedUserAction:", v14);
LABEL_18:

    -[TITypingSession resetCurrentWord](self, "resetCurrentWord");
  }
}

- (void)endSessionWithTimestamp:(id)a3
{
  id v4;

  v4 = a3;
  -[TITypingSession handleUncommittedWord](self, "handleUncommittedWord");
  -[TITypingSession setEndTime:](self, "setEndTime:", v4);

}

- (int)candidatesAccepted
{
  return self->_candidatesAccepted;
}

- (int)candidatesAcceptedWithText
{
  return self->_candidatesAcceptedWithText;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (TITypingSession)init
{
  void *v3;
  TITypingSession *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TITypingSession initWithLocale:keyboardLayout:](self, "initWithLocale:keyboardLayout:", v3, 0);

  return v4;
}

- (TITypingSession)initWithCoder:(id)a3
{
  id v4;
  TITypingSession *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *userActionHistory;
  uint64_t v14;
  NSString *layoutName;
  uint64_t v16;
  NSString *startContext;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSMutableArray *layouts;
  uint64_t v23;
  NSLocale *locale;
  uint64_t v25;
  NSDate *startTime;
  uint64_t v27;
  NSDate *endTime;
  uint64_t v29;
  NSUUID *sessionId;
  uint64_t v31;
  NSString *applicationID;
  uint64_t v33;
  NSMutableDictionary *touchesHistory;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)TITypingSession;
  v5 = -[TITypingSession init](&v36, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("userActionHistory"));
    v12 = objc_claimAutoreleasedReturnValue();
    userActionHistory = v5->_userActionHistory;
    v5->_userActionHistory = (NSMutableArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layoutName"));
    v14 = objc_claimAutoreleasedReturnValue();
    layoutName = v5->_layoutName;
    v5->_layoutName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startContext"));
    v16 = objc_claimAutoreleasedReturnValue();
    startContext = v5->_startContext;
    v5->_startContext = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("layouts"));
    v21 = objc_claimAutoreleasedReturnValue();
    layouts = v5->_layouts;
    v5->_layouts = (NSMutableArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v23 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTime"));
    v25 = objc_claimAutoreleasedReturnValue();
    startTime = v5->_startTime;
    v5->_startTime = (NSDate *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endTime"));
    v27 = objc_claimAutoreleasedReturnValue();
    endTime = v5->_endTime;
    v5->_endTime = (NSDate *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionId"));
    v29 = objc_claimAutoreleasedReturnValue();
    sessionId = v5->_sessionId;
    v5->_sessionId = (NSUUID *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationID"));
    v31 = objc_claimAutoreleasedReturnValue();
    applicationID = v5->_applicationID;
    v5->_applicationID = (NSString *)v31;

    v5->_didReceiveSecureFieldEvent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didReceiveSecureFieldEvent"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v33 = objc_claimAutoreleasedReturnValue();
    touchesHistory = v5->_touchesHistory;
    v5->_touchesHistory = (NSMutableDictionary *)v33;

    v5->_candidatesAccepted = objc_msgSend(v4, "decodeIntForKey:", CFSTR("candidatesAccepted"));
    v5->_candidatesAcceptedWithText = objc_msgSend(v4, "decodeIntForKey:", CFSTR("candidatesAcceptedWithText"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *userActionHistory;
  id v5;

  userActionHistory = self->_userActionHistory;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", userActionHistory, CFSTR("userActionHistory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_layoutName, CFSTR("layoutName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startContext, CFSTR("startContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_layouts, CFSTR("layouts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locale, CFSTR("locale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startTime, CFSTR("startTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endTime, CFSTR("endTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionId, CFSTR("sessionId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationID, CFSTR("applicationID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_didReceiveSecureFieldEvent, CFSTR("didReceiveSecureFieldEvent"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_candidatesAccepted != 0, CFSTR("candidatesAccepted"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_candidatesAcceptedWithText != 0, CFSTR("candidatesAcceptedWithText"));

}

- (NSString)description
{
  void *v2;
  void *v3;

  -[TITypingSession userActionHistory](self, "userActionHistory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("; "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isCurrentWordEmpty
{
  return self->_currentWord == 0;
}

- (TIWordEntry)currentWord
{
  TIWordEntry *currentWord;
  TIWordEntry *v4;
  TIWordEntry *v5;

  currentWord = self->_currentWord;
  if (!currentWord)
  {
    v4 = objc_alloc_init(TIWordEntry);
    v5 = self->_currentWord;
    self->_currentWord = v4;

    currentWord = self->_currentWord;
  }
  return currentWord;
}

- (void)resetCurrentWord
{
  TIWordEntry *currentWord;

  currentWord = self->_currentWord;
  self->_currentWord = 0;

  -[NSMutableArray removeAllObjects](self->_cachedKeyboardStates, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_cachedCandidatesOffered, "removeAllObjects");
}

- (void)updateCachedStateAfterLastInputWithKeyboardState:(id)a3
{
  void *v4;
  NSMutableArray *cachedKeyboardStates;
  void *v6;
  id v7;

  v7 = a3;
  -[TITypingSession updateCachedStateBeforeFirstInputWithKeyboardState:](self, "updateCachedStateBeforeFirstInputWithKeyboardState:", v7);
  v4 = v7;
  if (v7)
  {
    cachedKeyboardStates = self->_cachedKeyboardStates;
    v6 = (void *)objc_msgSend(v7, "copy");
    -[NSMutableArray addObject:](cachedKeyboardStates, "addObject:", v6);

    v4 = v7;
  }

}

- (BOOL)testForRapidDeleteContextChange:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;

  v5 = a3;
  -[TITypingSession savedDeleteInputKeyboardState](self, "savedDeleteInputKeyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "documentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingSession savedDeleteInputKeyboardState](self, "savedDeleteInputKeyboardState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "contextAfterInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v9, "contextAfterInput");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        v13 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    objc_msgSend(v7, "contextAfterInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11 || (objc_msgSend(v9, "contextAfterInput"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v7, "contextAfterInput");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        objc_msgSend(v9, "contextAfterInput");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "contextAfterInput");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v18, "isEqualToString:", v19) ^ 1;

        if (!v11)
          goto LABEL_12;
      }
      else
      {
        v12 = 0;
        if (!v11)
        {
LABEL_12:

          if ((v12 & 1) == 0)
          {
            objc_msgSend(v7, "contextBeforeInput");
            v20 = objc_claimAutoreleasedReturnValue();
            if (!v20
              || (v21 = (void *)v20,
                  objc_msgSend(v7, "contextBeforeInput"),
                  v22 = (void *)objc_claimAutoreleasedReturnValue(),
                  v23 = objc_msgSend(v22, "isEqualToString:", &stru_1EA1081D0),
                  v22,
                  v21,
                  v23))
            {
              objc_msgSend(v9, "contextBeforeInput");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = (unint64_t)objc_msgSend(v15, "length") > 1;
              goto LABEL_17;
            }
            objc_msgSend(v9, "contextBeforeInput");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "contextBeforeInput");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v25, "hasPrefix:", v26);

            if (v27)
            {
              objc_msgSend(v9, "contextBeforeInput");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v15, "length");
              objc_msgSend(v7, "contextBeforeInput");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = (unint64_t)(v28 - objc_msgSend(v29, "length")) > 1;

              goto LABEL_17;
            }
          }
          v13 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
    }
    else
    {
      v12 = 1;
    }

    goto LABEL_12;
  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (void)addKeyInput:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  TITypingSession *v13;
  id v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IXACanLogMessageAtLevel())
  {
    IXASessionEventsLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s KI input: %@"), "-[TITypingSession addKeyInput:keyboardState:]", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v15;
      _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  if ((objc_msgSend(v7, "secureTextEntry") & 1) != 0
    || -[TITypingSession didReceiveSecureFieldEvent](self, "didReceiveSecureFieldEvent"))
  {
    -[TITypingSession setDidReceiveSecureFieldEvent:](self, "setDidReceiveSecureFieldEvent:", 1);
  }
  else
  {
    if (-[TITypingSession includeInputToLastWord](self, "includeInputToLastWord"))
    {
      -[TITypingSession lastWord](self, "lastWord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addKeyInput:", v6);

      -[TITypingSession setLastWord:](self, "setLastWord:", 0);
    }
    else if (-[TITypingSession includeInputToLastDeletion](self, "includeInputToLastDeletion"))
    {
      -[TITypingSession lastDeletion](self, "lastDeletion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addKeyInput:", v6);

      -[TITypingSession setLastDeletion:](self, "setLastDeletion:", 0);
    }
    else
    {
      -[TITypingSession currentWord](self, "currentWord");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addKeyInput:", v6);

      -[TITypingSession currentWord](self, "currentWord");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setKeyboardState:", v7);

      -[TITypingSession updateCachedStateAfterLastInputWithKeyboardState:](self, "updateCachedStateAfterLastInputWithKeyboardState:", v7);
    }
    -[TITypingSession setIncludeInputToLastWord:](self, "setIncludeInputToLastWord:", 0);
    -[TITypingSession setIncludeInputToLastDeletion:](self, "setIncludeInputToLastDeletion:", 0);
    -[TITypingSession setLastInput:](self, "setLastInput:", v6);
    if (objc_msgSend(v6, "isBackspace"))
    {
      v13 = self;
      v14 = v7;
    }
    else
    {
      v13 = self;
      v14 = 0;
    }
    -[TITypingSession setSavedDeleteInputKeyboardState:](v13, "setSavedDeleteInputKeyboardState:", v14);
  }

}

- (void)addDrawInputWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4
{
  TIPathAction *v6;
  void *v7;
  id v8;

  v8 = a4;
  if ((objc_msgSend(v8, "secureTextEntry") & 1) != 0
    || -[TITypingSession didReceiveSecureFieldEvent](self, "didReceiveSecureFieldEvent"))
  {
    -[TITypingSession setDidReceiveSecureFieldEvent:](self, "setDidReceiveSecureFieldEvent:", 1);
  }
  else
  {
    v6 = -[TIPathAction initWithSyllableCount:keyboardState:]([TIPathAction alloc], "initWithSyllableCount:keyboardState:", a3, v8);
    -[TITypingSession calibratedCurrentTimestamp](self, "calibratedCurrentTimestamp");
    -[TIUserAction setOccurenceTime:](v6, "setOccurenceTime:");
    -[TITypingSession userActionHistory](self, "userActionHistory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v6);

  }
}

- (void)addTouchEvent:(id)a3
{
  id v5;
  NSObject *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double calibratedTimeBase;
  double v16;
  NSObject *v17;
  TIKBSessionTouchInfo *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  TIKBSessionTouchInfo *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IXACanLogMessageAtLevel())
  {
    IXASessionEventsLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TO touch: %@"), "-[TITypingSession addTouchEvent:]", v5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v32;
      _os_log_debug_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  if (!-[TITypingSession didReceiveSecureFieldEvent](self, "didReceiveSecureFieldEvent"))
  {
    if (!self->_timeCalibrationTouch)
    {
      objc_storeStrong((id *)&self->_timeCalibrationTouch, a3);
      self->_calibratedTimeBase = CFAbsoluteTimeGetCurrent();
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v7 = self->_userActionHistory;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v42 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v5, "timestamp");
            v14 = v13;
            calibratedTimeBase = self->_calibratedTimeBase;
            objc_msgSend(v12, "occurenceTime");
            objc_msgSend(v12, "setOccurenceTime:", v14 - (calibratedTimeBase + v16));
          }
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v9);
      }

    }
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel)
    {
      TIOSLogFacility();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v33 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "timestamp");
        objc_msgSend(v33, "stringWithFormat:", CFSTR("%s touch %lf"), "-[TITypingSession addTouchEvent:]", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v35;
        _os_log_debug_impl(&dword_1DA6F2000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    v18 = objc_alloc_init(TIKBSessionTouchInfo);
    -[TIKBSessionTouchInfo setTouch:](v18, "setTouch:", v5);
    -[TIKBSessionTouchInfo setLayoutId:](v18, "setLayoutId:", self->_currentLayoutID);
    -[TITypingSession touchesHistory](self, "touchesHistory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "pathIndex"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v5, "stage"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v22 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v22;
    }
    objc_msgSend(v21, "addObject:", v18);
    if (objc_msgSend(v5, "stage") == 2)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v23 = v21;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v24)
      {
        v25 = v24;
        v36 = v18;
        v26 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v38 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
            -[TITypingSession currentWord](self, "currentWord");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "touch");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addTouchEvent:withLayoutId:", v30, objc_msgSend(v28, "layoutId"));

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v25);
        v18 = v36;
      }
    }
    else
    {
      if (!v21)
      {
LABEL_35:

        goto LABEL_36;
      }
      -[TITypingSession touchesHistory](self, "touchesHistory");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "pathIndex"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v21, v31);

    }
    goto LABEL_35;
  }
LABEL_36:

}

- (void)candidatesOffered:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IXACanLogMessageAtLevel())
  {
    IXASessionEventsLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "corrections");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "autocorrection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predictions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%s CO autocorrection: %@ predictions: %@"), "-[TITypingSession candidatesOffered:keyboardState:]", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v17;
      _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  if ((objc_msgSend(v7, "secureTextEntry") & 1) == 0
    && !-[TITypingSession didReceiveSecureFieldEvent](self, "didReceiveSecureFieldEvent"))
  {
    objc_msgSend(v6, "corrections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "autocorrection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else
    {
      objc_msgSend(v6, "predictions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_12;
    }
    -[TITypingSession currentWord](self, "currentWord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addCandidateOffered:", v6);

    -[NSMutableArray addObject:](self->_cachedCandidatesOffered, "addObject:", v6);
    -[TITypingSession updateCachedStateBeforeFirstInputWithKeyboardState:](self, "updateCachedStateBeforeFirstInputWithKeyboardState:", v7);
    goto LABEL_12;
  }
  -[TITypingSession setDidReceiveSecureFieldEvent:](self, "setDidReceiveSecureFieldEvent:", 1);
LABEL_12:

}

- (void)acceptingCandidateWithTrigger:(id)a3
{
  NSString *v4;
  NSObject *v5;
  NSString *candidateAcceptedTrigger;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  if (IXACanLogMessageAtLevel())
  {
    IXASessionEventsLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TA trigger: %@"), "-[TITypingSession acceptingCandidateWithTrigger:]", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v7;
      _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  candidateAcceptedTrigger = self->_candidateAcceptedTrigger;
  self->_candidateAcceptedTrigger = v4;

}

- (void)candidateAccepted:(id)a3 withInput:(id)a4 documentState:(id)a5 inputContext:(id)a6 inputStem:(id)a7 predictionBarHit:(BOOL)a8 useCandidateSelection:(BOOL)a9 candidateIndex:(int64_t)a10 keyboardState:(id)a11
{
  _BOOL4 v11;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  char v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
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
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  char v70;
  _QWORD *v71;
  char v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  char v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  char v105;
  void *v106;
  void *v107;
  uint64_t v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  char v113;
  void *v114;
  NSString *candidateAcceptedTrigger;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  char v122;
  void *v123;
  char v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  double v139;
  double v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  double v145;
  double v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  _BOOL4 v151;
  void *v152;
  void *v153;
  void *v154;
  int v155;
  void *v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  id v162;
  void *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  int v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  int v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t i;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  NSObject *v198;
  void *v199;
  void *v200;
  int v201;
  void *v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  int v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  uint64_t v233;
  void *v234;
  void *v235;
  int v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  BOOL v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  id v254;
  void *v255;
  void *v256;
  int v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  uint64_t v272;
  uint64_t v273;
  id v274;
  void *v275;
  void *v276;
  id v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  int v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  NSObject *v298;
  NSObject *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  id v304;
  id v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  id v315;
  void *v316;
  void *v317;
  uint64_t v318;
  uint64_t v319;
  id v320;
  void *v321;
  void *v322;
  void *v323;
  id v324;
  void *v325;
  id v326;
  id v327;
  void *v328;
  _QWORD v329[4];
  id v330;
  id v331;
  TITypingSession *v332;
  id v333;
  id v334;
  __int128 *p_buf;
  uint64_t v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  _QWORD v341[2];
  _QWORD v342[2];
  __int128 buf;
  uint64_t v344;
  uint64_t (*v345)(uint64_t, uint64_t);
  void (*v346)(uint64_t);
  id v347;
  _BYTE v348[128];
  uint64_t v349;

  v11 = a8;
  v349 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v324 = a4;
  v18 = a5;
  v326 = a6;
  v327 = a7;
  v19 = a11;
  if (self->_currentWord)
  {
    buf = 0uLL;
    v342[0] = 0;
    v342[1] = 0;
    v341[0] = 0;
    v341[1] = 0;
    -[TITypingSession currentWord](self, "currentWord");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allKeyboardInputs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingSession resolveInputs:cancelledTextRange:leadingBackspaceRange:trailingTextRange:](self, "resolveInputs:cancelledTextRange:leadingBackspaceRange:trailingTextRange:", v21, &buf, v342, v341);

    if ((_QWORD)buf != 0x7FFFFFFFFFFFFFFFLL && v342[0] != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[TITypingSession uncommittedWordEntryFromInputsWithRange:documentState:cancelled:](self, "uncommittedWordEntryFromInputsWithRange:documentState:cancelled:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypingSession insertUncommittedUserAction:](self, "insertUncommittedUserAction:", v22);

      -[TITypingSession removeInputsAndTouchesWithRange:](self, "removeInputsAndTouchesWithRange:", buf);
    }
  }
  v328 = v19;
  -[TITypingSession lastWord](self, "lastWord");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[TITypingSession userActionHistory](self, "userActionHistory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lastObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingSession lastWord](self, "lastWord");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 == v27)
    {
      -[TITypingSession lastWord](self, "lastWord");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "wordEntryType") & 0xE0;

      if (v39)
      {
        -[TITypingSession lastWord](self, "lastWord");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "acceptedString");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "candidate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "isEqualToString:", v42);

        if (v43)
        {
          -[TITypingSession setCandidateAcceptedTrigger:](self, "setCandidateAcceptedTrigger:", *MEMORY[0x1E0DBDE38]);
          v28 = v324;
          v35 = v328;
          goto LABEL_20;
        }
      }
    }
  }
  v28 = v324;
  if (IXACanLogMessageAtLevel())
  {
    IXASessionEventsLogFacility();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v114 = (void *)MEMORY[0x1E0CB3940];
      candidateAcceptedTrigger = self->_candidateAcceptedTrigger;
      objc_msgSend(v17, "candidate");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "input");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "stringWithFormat:", CFSTR("%s CA trigger: %@ candidate: %@ input: %@ predictionBarHit: %d"), "-[TITypingSession candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]", candidateAcceptedTrigger, v116, v117, v11);
      v118 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v118;
      _os_log_debug_impl(&dword_1DA6F2000, v29, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

    }
  }
  -[TITypingSession candidateAcceptedTrigger](self, "candidateAcceptedTrigger");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0DBDE48]);

  if ((v31 & 1) != 0)
  {
    v32 = 1;
  }
  else
  {
    -[TITypingSession candidateAcceptedTrigger](self, "candidateAcceptedTrigger");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqualToString:", *MEMORY[0x1E0DBDE40]);

    v32 = v11 & ~v34;
  }
  v35 = v328;
  -[TITypingSession setCandidatesAccepted:](self, "setCandidatesAccepted:", -[TITypingSession candidatesAccepted](self, "candidatesAccepted") + 1);
  v36 = (void *)MEMORY[0x1E0DBDB38];
  objc_msgSend(v17, "candidate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v36) = objc_msgSend(v36, "hasNonWhitespaceNonPunctuationText:", v37);

  if ((_DWORD)v36)
    -[TITypingSession setCandidatesAcceptedWithText:](self, "setCandidatesAcceptedWithText:", -[TITypingSession candidatesAcceptedWithText](self, "candidatesAcceptedWithText") + 1);
  if ((objc_msgSend(v328, "secureTextEntry") & 1) != 0
    || -[TITypingSession didReceiveSecureFieldEvent](self, "didReceiveSecureFieldEvent"))
  {
    -[TITypingSession setDidReceiveSecureFieldEvent:](self, "setDidReceiveSecureFieldEvent:", 1);
    -[TITypingSession resetCurrentWord](self, "resetCurrentWord");
LABEL_19:
    -[TITypingSession setCandidateAcceptedTrigger:](self, "setCandidateAcceptedTrigger:", *MEMORY[0x1E0DBDE38]);
    goto LABEL_20;
  }
  if (v32)
  {
    if (self->_currentWord)
      goto LABEL_28;
    -[TITypingSession lastWord](self, "lastWord");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "acceptedCandidate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingSession lastWord](self, "lastWord");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setOriginalCandidate:", v45);

    -[TITypingSession lastWord](self, "lastWord");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "acceptedString");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingSession lastWord](self, "lastWord");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setOriginalAcceptedString:", v48);

    -[TITypingSession lastWord](self, "lastWord");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setAcceptedCandidate:", v17);

    objc_msgSend(v17, "candidate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "stringByTrimmingCharactersInSet:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingSession lastWord](self, "lastWord");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setAcceptedString:", v53);

    -[TITypingSession lastWord](self, "lastWord");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setWordEntryType:", 4);

    -[TITypingSession lastWord](self, "lastWord");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setWordEntryType:", objc_msgSend(v56, "wordEntryType") | 8);

  }
  if (!self->_currentWord)
    goto LABEL_19;
LABEL_28:
  -[TITypingSession calibratedCurrentTimestamp](self, "calibratedCurrentTimestamp");
  -[TIUserAction setOccurenceTime:](self->_currentWord, "setOccurenceTime:");
  -[TIUserAction setKeyboardState:](self->_currentWord, "setKeyboardState:", v328);
  objc_msgSend(v18, "contextBeforeInput");
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordEntry candidatesOffered](self->_currentWord, "candidatesOffered");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "count");

  v321 = v18;
  if (v58 < 1)
  {
    v62 = 0;
  }
  else
  {
    -[TIWordEntry candidatesOffered](self->_currentWord, "candidatesOffered");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "objectAtIndex:", (v58 - 1));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "corrections");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "autocorrection");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v17, "sourceMask"))
    {
      objc_msgSend(v62, "candidate");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "candidate");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v64, "isEqualToString:", v63))
      {
        v65 = v62;

        v17 = v65;
      }

    }
  }
  objc_msgSend(v17, "candidate");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v316 = v62;
  objc_msgSend(v62, "candidate");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingSession locale](self, "locale");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v66, "smartQuoteInsensitiveStringEquivalent:forLocale:", v67, v68);

  v70 = objc_msgSend(v17, "isAutocorrection");
  v71 = (_QWORD *)MEMORY[0x1E0DBDE20];
  if ((v70 & 1) == 0)
  {
    -[TITypingSession candidateAcceptedTrigger](self, "candidateAcceptedTrigger");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v66, "isEqualToString:", *v71))
      goto LABEL_44;
  }
  if (((v69 ^ 1 | v32) & 1) != 0 || (objc_msgSend(v17, "isContinuousPathConversion") & 1) != 0)
  {
    if ((v70 & 1) != 0)
      goto LABEL_45;
LABEL_44:

    goto LABEL_45;
  }
  v72 = objc_msgSend(v17, "isToucanInlineCompletionCandidate");
  if ((v70 & 1) == 0)

  if ((v72 & 1) == 0)
  {
    -[TITypingSession currentWord](self, "currentWord");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setWordEntryType:", objc_msgSend(v66, "wordEntryType") | 1);
    goto LABEL_44;
  }
LABEL_45:
  if (objc_msgSend(v17, "isCompletionCandidate"))
  {
    -[TITypingSession currentWord](self, "currentWord");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setWordEntryType:", objc_msgSend(v73, "wordEntryType") | 2);

  }
  if (v32)
  {
    -[TITypingSession currentWord](self, "currentWord");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setWordEntryType:", objc_msgSend(v74, "wordEntryType") | 4);

    -[TITypingSession currentWord](self, "currentWord");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setWordEntryType:", objc_msgSend(v75, "wordEntryType") | 0x10);

  }
  -[TITypingSession candidateAcceptedTrigger](self, "candidateAcceptedTrigger");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "isEqualToString:", *v71);

  if (v77)
  {
    -[TITypingSession currentWord](self, "currentWord");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setWordEntryType:", objc_msgSend(v78, "wordEntryType") | 0x20);

  }
  -[TITypingSession candidateAcceptedTrigger](self, "candidateAcceptedTrigger");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "isEqualToString:", *MEMORY[0x1E0DBDE28]);

  if (v80)
  {
    -[TITypingSession currentWord](self, "currentWord");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setWordEntryType:", objc_msgSend(v81, "wordEntryType") | 0x40);

  }
  -[TITypingSession candidateAcceptedTrigger](self, "candidateAcceptedTrigger");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "isEqualToString:", *MEMORY[0x1E0DBDE30]);

  if (v83)
  {
    -[TITypingSession currentWord](self, "currentWord");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setWordEntryType:", objc_msgSend(v84, "wordEntryType") | 0x80);

  }
  if (objc_msgSend(v17, "isToucanInlineCompletionCandidate"))
  {
    -[TITypingSession currentWord](self, "currentWord");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setWordEntryType:", objc_msgSend(v85, "wordEntryType") | 0x100);

  }
  v86 = (objc_msgSend(v17, "usageTrackingMask") >> 18) & 1;
  -[TITypingSession currentWord](self, "currentWord");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setIsMultilingual:", v86);

  v88 = (objc_msgSend(v17, "sourceMask") >> 5) & 1;
  -[TITypingSession currentWord](self, "currentWord");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setIsOOV:", v88);

  if ((objc_msgSend(v17, "sourceMask") & 0x8000) != 0)
    v90 = 1;
  else
    v90 = (objc_msgSend(v17, "sourceMask") >> 17) & 1;
  -[TITypingSession currentWord](self, "currentWord");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setIsFromStaticLexicon:", v90);

  v92 = (objc_msgSend(v17, "usageTrackingMask") >> 17) & 1;
  -[TITypingSession currentWord](self, "currentWord");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setIsContinuousPathCompletion:", v92);

  v17 = v17;
  objc_msgSend(v324, "string");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v93) = objc_msgSend(v94, "endsInPunctuation");

  if ((_DWORD)v93 && !a9)
  {
    -[TITypingSession lastWord](self, "lastWord");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "acceptedCandidate");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v96, "isContinuousPathConversion") & 1) != 0)
    {
      objc_msgSend(v324, "string");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v97, "isEqualToString:", CFSTR(" "));

      if ((v98 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v322, "componentsSeparatedByCharactersInSet:", v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "lastObject");
        v101 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "candidate");
        v102 = objc_claimAutoreleasedReturnValue();
        if (v102)
        {
          v103 = (void *)v102;
          objc_msgSend(v17, "candidate");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = objc_msgSend(v101, "isEqualToString:", v104);

          if ((v105 & 1) == 0)
          {
            objc_msgSend(v321, "contextBeforeInput");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "candidate");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "stringByAppendingString:", v107);
            v108 = objc_claimAutoreleasedReturnValue();

            v322 = (void *)v108;
          }
        }
        v109 = objc_alloc(MEMORY[0x1E0DBDBE8]);
        objc_msgSend(v324, "string");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v324, "string");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v323 = (void *)objc_msgSend(v109, "initWithCandidate:forInput:", v110, v111);

        -[TITypingSession currentWord](self, "currentWord");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "setIsPunctuationEntryFollowingAWord:", 1);

        goto LABEL_74;
      }
    }
    else
    {

    }
    objc_msgSend(v324, "string");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v101, "isEqual:", CFSTR(" ")) & 1) != 0)
    {
      v323 = v17;
LABEL_74:

      goto LABEL_75;
    }
    v113 = objc_msgSend(v17, "isToucanInlineCompletionCandidate");

    if ((v113 & 1) == 0)
    {
      objc_msgSend(v17, "candidate");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v324, "string");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "stringByAppendingString:", v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "candidateByReplacingWithCandidate:", v121);
      v323 = (void *)objc_claimAutoreleasedReturnValue();

      -[TITypingSession currentWord](self, "currentWord");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setIsPunctuationEntryFollowingAWord:", 1);
      goto LABEL_74;
    }
  }
  v323 = v17;
LABEL_75:
  v122 = objc_msgSend(v17, "isContinuousPathConversion");
  if (v324)
  {
    if ((v122 & 1) == 0)
    {
      objc_msgSend(v324, "string");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = objc_msgSend(v123, "_containsEmoji");

      if ((v124 & 1) == 0)
      {
        -[TITypingSession setIncludeInputToLastWord:](self, "setIncludeInputToLastWord:", 1);
        -[TITypingSession currentWord](self, "currentWord");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "setInputTriggeredTextAccepted:", v324);

      }
    }
  }
  objc_msgSend(v323, "candidate");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingSession currentWord](self, "currentWord");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setAcceptedString:", v126);

  if (objc_msgSend(v17, "isContinuousPathConversion") && !a9)
  {
    -[TITypingSession currentWord](self, "currentWord");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "acceptedString");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "stringByTrimmingCharactersInSet:", v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingSession currentWord](self, "currentWord");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setAcceptedString:", v131);

    v35 = v328;
  }
  -[TITypingSession currentWord](self, "currentWord");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "setAcceptedCandidate:", v323);

  -[TITypingSession currentWord](self, "currentWord");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "setInputContext:", v326);

  -[TITypingSession currentWord](self, "currentWord");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setInputStem:", v327);

  -[TITypingSession currentWord](self, "currentWord");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "allTouches");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "lastObject");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "timestamp");
  v140 = v139;
  -[TITypingSession currentWord](self, "currentWord");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "setEndTime:", v140);

  -[TITypingSession currentWord](self, "currentWord");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "allTouches");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "firstObject");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "timestamp");
  v146 = v145;
  -[TITypingSession currentWord](self, "currentWord");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setStartTime:", v146);

  -[TITypingSession currentWord](self, "currentWord");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "setKeyboardState:", v35);

  objc_msgSend(v323, "candidate");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = objc_msgSend(v149, "length");

  if (!v150)
  {
    v151 = a9;
    goto LABEL_90;
  }
  v151 = a9;
  if (a9)
    goto LABEL_90;
  objc_msgSend(v321, "contextBeforeInput");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v152, "hasSuffix:", v327))
  {

  }
  else
  {
    objc_msgSend(v321, "contextBeforeInput");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v323, "candidate");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = objc_msgSend(v153, "hasSuffix:", v154);

    if (!v155)
      goto LABEL_90;
  }
  objc_msgSend(v321, "contextBeforeInput");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = objc_msgSend(v156, "length");
  objc_msgSend(v323, "candidate");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = v157 - objc_msgSend(v158, "length");

  if ((v159 & 0x8000000000000000) == 0)
  {
    objc_msgSend(v321, "contextBeforeInput");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "substringToIndex:", v159);
    v161 = objc_claimAutoreleasedReturnValue();

    v322 = (void *)v161;
  }
LABEL_90:
  if (v321)
  {
    v162 = objc_alloc(MEMORY[0x1E0DBDB78]);
    objc_msgSend(v321, "markedText");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v321, "selectedText");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v321, "contextAfterInput");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = objc_msgSend(v321, "selectedRangeInMarkedText");
    v168 = (void *)objc_msgSend(v162, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v322, v163, v164, v165, v166, v167);
    -[TITypingSession currentWord](self, "currentWord");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "setDocumentState:", v168);

    v35 = v328;
  }
  if (v151)
  {
    -[TITypingSession currentWord](self, "currentWord");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "setCandidateIndex:", a10);

  }
  -[TITypingSession currentWord](self, "currentWord");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "acceptedCandidate");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = objc_msgSend(v172, "isContinuousPathConversion");

  if (v173)
  {
    -[TITypingSession currentWord](self, "currentWord");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "allTouchesM");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v175, "count"))
    {
      -[TITypingSession currentWord](self, "currentWord");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "allTouchesM");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "objectAtIndexedSubscript:", 0);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v179 = objc_msgSend(v178, "stage");

      v35 = v328;
      if (v179 != 1)
        goto LABEL_109;
    }
    else
    {

    }
    -[TITypingSession touchesHistory](self, "touchesHistory");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v324, "touchEvent");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "numberWithInteger:", objc_msgSend(v182, "pathIndex"));
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "objectForKey:", v183);
    v184 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v184, "count"))
    {
      -[TITypingSession currentWord](self, "currentWord");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "allTouchesM");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "removeAllObjects");

      v340 = 0u;
      v338 = 0u;
      v339 = 0u;
      v337 = 0u;
      v187 = v184;
      v188 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v337, v348, 16);
      if (v188)
      {
        v189 = v188;
        v190 = *(_QWORD *)v338;
        do
        {
          for (i = 0; i != v189; ++i)
          {
            if (*(_QWORD *)v338 != v190)
              objc_enumerationMutation(v187);
            v192 = *(void **)(*((_QWORD *)&v337 + 1) + 8 * i);
            -[TITypingSession currentWord](self, "currentWord");
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v192, "touch");
            v194 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v193, "addTouchEvent:withLayoutId:", v194, objc_msgSend(v192, "layoutId"));

            -[TITypingSession lastWord](self, "lastWord");
            v195 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v195, "allTouchesM");
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v192, "touch");
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v196, "removeObject:", v197);

          }
          v189 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v337, v348, 16);
        }
        while (v189);
      }

      v28 = v324;
      v35 = v328;
    }

  }
LABEL_109:
  if (IXACanLogMessageAtLevel())
  {
    IXASessionDetailsLogFacility();
    v198 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v198, OS_LOG_TYPE_DEBUG))
    {
      v251 = (void *)MEMORY[0x1E0CB3940];
      -[TITypingSession currentWord](self, "currentWord");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      wordEntryDetailForLog(v252, 0);
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v251, "stringWithFormat:", CFSTR("%s %@"), "-[TITypingSession candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]", v253);
      v254 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v254;
      _os_log_debug_impl(&dword_1DA6F2000, v198, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

    }
  }
  -[TITypingSession currentWord](self, "currentWord");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "acceptedCandidate");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = objc_msgSend(v200, "isToucanInlineCompletionCandidate");

  if (!v201)
    goto LABEL_174;
  -[TITypingSession currentWord](self, "currentWord");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "allKeyboardInputs");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = objc_msgSend(v203, "count");

  if (!v204)
  {
    -[TITypingSession currentWord](self, "currentWord");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "acceptedCandidate");
    v206 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v206, "input");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v207, "endsInWhitespace"))
    {
      objc_msgSend(v206, "candidate");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "input");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v210 = objc_msgSend(v208, "hasPrefix:", v209);

      if (!v210)
      {
LABEL_119:

        goto LABEL_120;
      }
      -[TITypingSession currentWord](self, "currentWord");
      v317 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v317, "documentState");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "candidate");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "input");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v212, "substringToIndex:", objc_msgSend(v213, "length"));
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v211, "documentStateAfterInsertingText:", v214);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypingSession currentWord](self, "currentWord");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "setDocumentState:", v215);

      v35 = v328;
      objc_msgSend(v206, "candidate");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "input");
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "substringFromIndex:", objc_msgSend(v218, "length"));
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypingSession currentWord](self, "currentWord");
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v220, "setAcceptedString:", v219);

      -[TITypingSession currentWord](self, "currentWord");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v207, "acceptedString");
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "candidateByReplacingWithCandidate:input:rawInput:", v221, &stru_1EA1081D0, &stru_1EA1081D0);
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypingSession currentWord](self, "currentWord");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v223, "setAcceptedCandidate:", v222);

    }
    goto LABEL_119;
  }
LABEL_120:
  -[TITypingSession currentWord](self, "currentWord");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "acceptedString");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "componentsSeparatedByString:", CFSTR(" "));
  v226 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v226, "count") >= 2)
  {
    v314 = v226;
    if (!v28)
    {
      v250 = 0;
      v325 = 0;
      goto LABEL_167;
    }
    -[TITypingSession currentWord](self, "currentWord");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v227, "allTouchesM");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v228, "count") < 3)
    {
      v250 = 0;
      v325 = 0;
    }
    else
    {
      -[TITypingSession currentWord](self, "currentWord");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v229, "touchLayoutsM");
      v311 = v227;
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      v318 = objc_msgSend(v230, "count");
      -[TITypingSession currentWord](self, "currentWord");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v231, "allTouchesM");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      v233 = objc_msgSend(v232, "count");

      if (v318 != v233)
      {
        v250 = 0;
        v325 = 0;
        v35 = v328;
        goto LABEL_167;
      }
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v307 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypingSession currentWord](self, "currentWord");
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v234, "allTouchesM");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      v236 = objc_msgSend(v235, "count");

      v237 = (v236 - 1);
      if (v236 - 1 >= 0)
      {
        v306 = 0;
        v309 = 0;
        v319 = -1;
        v238 = -1;
        while (1)
        {
          -[TITypingSession currentWord](self, "currentWord");
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v239, "allTouchesM");
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v240, "objectAtIndexedSubscript:", v237);
          v241 = (void *)objc_claimAutoreleasedReturnValue();

          -[TITypingSession currentWord](self, "currentWord");
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v242, "touchLayoutsM");
          v243 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v243, "objectAtIndexedSubscript:", v237);
          v244 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v241, "pathIndex") == v238)
          {
            objc_msgSend(v312, "addIndex:", v237);
            if (!objc_msgSend(v241, "stage"))
            {
              if (!v309)
              {
                -[TITypingSession keyStringWithCode:fromLayoutIndex:](self, "keyStringWithCode:fromLayoutIndex:", objc_msgSend(v241, "forcedKeyCode"), v244);
                v309 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v238 = -2;
            }
          }
          else
          {
            if (objc_msgSend(v241, "pathIndex") == v319)
            {
              objc_msgSend(v307, "addIndex:", v237);
              if (objc_msgSend(v241, "stage"))
                goto LABEL_145;
              if (!v306)
              {
                -[TITypingSession keyStringWithCode:fromLayoutIndex:](self, "keyStringWithCode:fromLayoutIndex:", objc_msgSend(v241, "forcedKeyCode"), v244);
                v306 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v245 = -2;
LABEL_144:
              v319 = v245;
              goto LABEL_145;
            }
            if (v238 == -1)
            {
              if (objc_msgSend(v241, "stage") == 2)
              {
                objc_msgSend(v312, "addIndex:", v237);
                v238 = objc_msgSend(v241, "pathIndex");
                -[TITypingSession keyStringWithCode:fromLayoutIndex:](self, "keyStringWithCode:fromLayoutIndex:", objc_msgSend(v241, "forcedKeyCode"), v244);
                v247 = objc_claimAutoreleasedReturnValue();

                v309 = (void *)v247;
              }
              else
              {
                v238 = -3;
              }
              goto LABEL_145;
            }
            if (v319 == -1)
            {
              if (objc_msgSend(v241, "stage") == 2)
              {
                objc_msgSend(v307, "addIndex:", v237);
                v319 = objc_msgSend(v241, "pathIndex");
                -[TITypingSession keyStringWithCode:fromLayoutIndex:](self, "keyStringWithCode:fromLayoutIndex:", objc_msgSend(v241, "forcedKeyCode"), v244);
                v246 = objc_claimAutoreleasedReturnValue();

                v306 = (void *)v246;
                goto LABEL_145;
              }
              v245 = -3;
              goto LABEL_144;
            }
          }
LABEL_145:

          if ((unint64_t)(v319 + 1) >= 0xFFFFFFFFFFFFFFFELL
            && (unint64_t)(v238 + 1) >= 0xFFFFFFFFFFFFFFFELL)
          {
            v28 = v324;
            goto LABEL_157;
          }
          v249 = v237-- <= 0;
          v28 = v324;
          if (v249)
            goto LABEL_157;
        }
      }
      v309 = 0;
      v306 = 0;
      v238 = -1;
      v319 = -1;
LABEL_157:
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      if (v238 == -2)
      {
        objc_msgSend(v28, "string");
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        v257 = objc_msgSend(v309, "isEqualToString:", v256);

        if (v257)
        {
          objc_msgSend(v255, "addIndexes:", v312);
          if (v319 == -2)
          {
            if (objc_msgSend(v306, "isEqualToString:", CFSTR("more")))
              objc_msgSend(v255, "addIndexes:", v307);
          }
        }
      }
      v35 = v328;
      if (objc_msgSend(v255, "count"))
      {
        -[TITypingSession currentWord](self, "currentWord");
        v258 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v258, "allTouchesM");
        v259 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v259, "objectsAtIndexes:", v255);
        v250 = (void *)objc_claimAutoreleasedReturnValue();

        -[TITypingSession currentWord](self, "currentWord");
        v260 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v260, "touchLayoutsM");
        v261 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v261, "objectsAtIndexes:", v255);
        v325 = (void *)objc_claimAutoreleasedReturnValue();

        -[TITypingSession currentWord](self, "currentWord");
        v262 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v262, "allTouchesM");
        v263 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v263, "removeObjectsAtIndexes:", v255);

        -[TITypingSession currentWord](self, "currentWord");
        v264 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v264, "touchLayoutsM");
        v265 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v265, "removeObjectsAtIndexes:", v255);

      }
      else
      {
        v250 = 0;
        v325 = 0;
      }

      v227 = v312;
      v228 = v307;
    }

LABEL_167:
    -[TITypingSession currentWord](self, "currentWord");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v266, "acceptedCandidate");
    v267 = (void *)objc_claimAutoreleasedReturnValue();

    -[TITypingSession currentWord](self, "currentWord");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v268, "keyboardState");
    v269 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v344 = 0x3032000000;
    v345 = __Block_byref_object_copy__20544;
    v346 = __Block_byref_object_dispose__20545;
    -[TITypingSession currentWord](self, "currentWord");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v270, "documentState");
    v347 = (id)objc_claimAutoreleasedReturnValue();

    -[TITypingSession currentWord](self, "currentWord");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v271, "endTime");
    v273 = v272;

    v329[0] = MEMORY[0x1E0C809B0];
    v329[1] = 3221225472;
    v329[2] = __152__TITypingSession_candidateAccepted_withInput_documentState_inputContext_inputStem_predictionBarHit_useCandidateSelection_candidateIndex_keyboardState___block_invoke;
    v329[3] = &unk_1EA106EA8;
    v320 = v267;
    v330 = v320;
    p_buf = &buf;
    v274 = v269;
    v331 = v274;
    v332 = self;
    v333 = v226;
    v334 = v35;
    v336 = v273;
    objc_msgSend(v333, "enumerateObjectsUsingBlock:", v329);
    v275 = v325;
    if (v250 && v325)
    {
      v276 = (void *)objc_msgSend(v250, "mutableCopy");
      -[TITypingSession currentWord](self, "currentWord");
      v277 = v274;
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v278, "setAllTouchesM:", v276);

      v279 = (void *)objc_msgSend(v325, "mutableCopy");
      -[TITypingSession currentWord](self, "currentWord");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v280, "setTouchLayoutsM:", v279);

      v274 = v277;
    }
    objc_msgSend(v28, "string");
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    v282 = objc_msgSend(v281, "endsInPunctuation") & !a9;

    if (v282 == 1)
    {
      -[TITypingSession currentWord](self, "currentWord");
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v313, "acceptedCandidate");
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypingSession currentWord](self, "currentWord");
      v310 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v310, "acceptedCandidate");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v283, "candidate");
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "string");
      v285 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v284, "stringByAppendingString:", v285);
      v315 = v274;
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v308, "candidateByReplacingWithCandidate:", v286);
      v287 = v250;
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypingSession currentWord](self, "currentWord");
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v289, "setAcceptedCandidate:", v288);

      v250 = v287;
      v35 = v328;

      -[TITypingSession currentWord](self, "currentWord");
      v290 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v290, "acceptedCandidate");
      v291 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v291, "candidate");
      v292 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypingSession currentWord](self, "currentWord");
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v293, "setAcceptedString:", v292);

      v274 = v315;
      v275 = v325;

      -[TITypingSession currentWord](self, "currentWord");
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v294, "setIsPunctuationEntryFollowingAWord:", 1);

    }
    _Block_object_dispose(&buf, 8);

    v226 = v314;
  }

LABEL_174:
  -[TITypingSession currentWord](self, "currentWord");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v295, "setOrigin:", 4);

  -[TITypingSession userActionHistory](self, "userActionHistory");
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingSession currentWord](self, "currentWord");
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v296, "addObject:", v297);

  v18 = v321;
  if (IXACanLogMessageAtLevel())
  {
    IXASessionDetailsLogFacility();
    v298 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v298, OS_LOG_TYPE_DEBUG))
    {
      v301 = (void *)MEMORY[0x1E0CB3940];
      -[TITypingSession currentWord](self, "currentWord");
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      wordEntryDetailForLog(v302, 3);
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v301, "stringWithFormat:", CFSTR("%s %@"), "-[TITypingSession candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]", v303);
      v304 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v304;
      _os_log_debug_impl(&dword_1DA6F2000, v298, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

      v18 = v321;
    }

  }
  if (IXACanLogMessageAtLevel())
  {
    IXASessionDetailsLogFacility();
    v299 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v299, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s CA detail ----------------"), "-[TITypingSession candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]");
      v305 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v305;
      _os_log_debug_impl(&dword_1DA6F2000, v299, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

    }
  }
  -[TITypingSession currentWord](self, "currentWord");
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingSession setLastWord:](self, "setLastWord:", v300);

  -[TITypingSession resetCurrentWord](self, "resetCurrentWord");
  -[TITypingSession setCandidateAcceptedTrigger:](self, "setCandidateAcceptedTrigger:", *MEMORY[0x1E0DBDE38]);

LABEL_20:
}

- (id)keyStringWithCode:(int64_t)a3 fromLayoutIndex:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  -[TITypingSession layouts](self, "layouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__TITypingSession_keyStringWithCode_fromLayoutIndex___block_invoke;
  v12[3] = &unk_1EA106ED0;
  v12[4] = &v13;
  v12[5] = a3;
  objc_msgSend(v9, "enumerateKeysUsingBlock:", v12);
  if (v14[3])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (id)createContextChangeEventWithClass:(Class)a3 documentState:(id)a4 keyboardState:(id)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 inWordRange:(_NSRange)a8 selectionLocation:(unint64_t)a9
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  void *v17;

  v9 = a6;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = (void *)objc_msgSend([a3 alloc], "initWithTIKeyboardState:", v15);
  -[TITypingSession initContextChangeEvent:withDocumentState:keyboardState:extendsPriorWord:inWord:inWordRange:selectionLocation:](self, "initContextChangeEvent:withDocumentState:keyboardState:extendsPriorWord:inWord:inWordRange:selectionLocation:", v17, v16, v15, v9, v14, a8.location, a8.length, a9);

  return v17;
}

- (id)uncommittedWordEntryFromInputsWithRange:(_NSRange)a3 documentState:(id)a4 cancelled:(BOOL)a5
{
  _BOOL8 v5;
  NSUInteger length;
  NSUInteger location;
  id v9;
  TIWordEntry *v10;
  TIWordEntry *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v5 = a5;
  length = a3.length;
  location = a3.location;
  v9 = a4;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    v11 = objc_alloc_init(TIWordEntry);
    v10 = v11;
    if (v9)
    {
      -[TIUserAction setDocumentState:](v11, "setDocumentState:", v9);
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_cachedKeyboardStates, "objectAtIndexedSubscript:", location);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "documentState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIUserAction setDocumentState:](v10, "setDocumentState:", v13);

    }
    v14 = location + length;
    -[NSMutableArray objectAtIndexedSubscript:](self->_cachedKeyboardStates, "objectAtIndexedSubscript:", location + length);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIUserAction setKeyboardState:](v10, "setKeyboardState:", v15);

    v16 = 2 * length;
    -[TITypingSession currentInputsInRange:](self, "currentInputsInRange:", location, length);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setAllKeyboardInputsM:](v10, "setAllKeyboardInputsM:", v17);

    -[TITypingSession currentTouchesInRange:](self, "currentTouchesInRange:", 2 * location, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setAllTouchesM:](v10, "setAllTouchesM:", v18);

    -[TITypingSession currentLayoutsInRange:](self, "currentLayoutsInRange:", 2 * location, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setTouchLayoutsM:](v10, "setTouchLayoutsM:", v19);

    v20 = v14 - 1;
    if (v20 < -[NSMutableArray count](self->_cachedCandidatesOffered, "count"))
    {
      v21 = (void *)MEMORY[0x1E0C99DE8];
      -[NSMutableArray objectAtIndexedSubscript:](self->_cachedCandidatesOffered, "objectAtIndexedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "arrayWithObject:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIWordEntry setCandidatesOfferedM:](v10, "setCandidatesOfferedM:", v23);

    }
    objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithCandidate:forInput:", &stru_1EA1081D0, &stru_1EA1081D0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setAcceptedCandidate:](v10, "setAcceptedCandidate:", v24);

    -[TIWordEntry setAcceptedString:](v10, "setAcceptedString:", &stru_1EA1081D0);
    -[TIWordEntry allTouches](v10, "allTouches");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timestamp");
    -[TIUserAction setStartTime:](v10, "setStartTime:");

    -[TIWordEntry allTouches](v10, "allTouches");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timestamp");
    -[TIUserAction setEndTime:](v10, "setEndTime:");

    -[TITypingSession calibratedCurrentTimestamp](self, "calibratedCurrentTimestamp");
    -[TIUserAction setOccurenceTime:](v10, "setOccurenceTime:");
    -[TIWordEntry setCancelled:](v10, "setCancelled:", v5);
    -[TIWordEntry setOrigin:](v10, "setOrigin:", 4);
  }

  return v10;
}

- (id)uncommittedWordDeletionFromInputsWithRange:(_NSRange)a3
{
  TIDeleteWordEvent *v3;
  NSUInteger length;
  NSUInteger location;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    length = a3.length;
    location = a3.location;
    v7 = LODWORD(a3.location) + LODWORD(a3.length);
    -[NSMutableArray objectAtIndexedSubscript:](self->_cachedKeyboardStates, "objectAtIndexedSubscript:", a3.location + a3.length);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[TIDeleteWordEvent initWithTIKeyboardState:]([TIDeleteWordEvent alloc], "initWithTIKeyboardState:", v8);
    -[TIUserAction setDocumentState:](v3, "setDocumentState:", v9);
    v10 = 2 * length;
    -[TITypingSession currentInputsInRange:](self, "currentInputsInRange:", location, length);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDeleteWordEvent setAllKeyboardInputsM:](v3, "setAllKeyboardInputsM:", v11);

    -[TITypingSession currentTouchesInRange:](self, "currentTouchesInRange:", 2 * location, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDeleteWordEvent setAllTouchesM:](v3, "setAllTouchesM:", v12);

    -[TITypingSession currentLayoutsInRange:](self, "currentLayoutsInRange:", 2 * location, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDeleteWordEvent setTouchLayoutsM:](v3, "setTouchLayoutsM:", v13);

    v14 = v7 - 1;
    if (v14 < -[NSMutableArray count](self->_cachedCandidatesOffered, "count"))
    {
      v15 = (void *)MEMORY[0x1E0C99DE8];
      -[NSMutableArray objectAtIndexedSubscript:](self->_cachedCandidatesOffered, "objectAtIndexedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayWithObject:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIDeleteWordEvent setCandidatesOfferedM:](v3, "setCandidatesOfferedM:", v17);

    }
    -[TIDeleteWordEvent allTouches](v3, "allTouches");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timestamp");
    -[TIUserAction setEndTime:](v3, "setEndTime:");

    -[TIDeleteWordEvent allTouches](v3, "allTouches");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timestamp");
    -[TIUserAction setStartTime:](v3, "setStartTime:");

    -[TITypingSession calibratedCurrentTimestamp](self, "calibratedCurrentTimestamp");
    -[TIUserAction setOccurenceTime:](v3, "setOccurenceTime:");

  }
  return v3;
}

- (id)committedWordDeletionWithDocumentState:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  TIDeleteWordEvent *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  v8 = -[TIDeleteWordEvent initWithTIKeyboardState:]([TIDeleteWordEvent alloc], "initWithTIKeyboardState:", v6);

  -[TIUserAction setDocumentState:](v8, "setDocumentState:", v7);
  -[TIWordEntry allKeyboardInputs](self->_currentWord, "allKeyboardInputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDeleteWordEvent addKeyInputs:](v8, "addKeyInputs:", v9);

  -[TIWordEntry allTouches](self->_currentWord, "allTouches");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordEntry touchLayouts](self->_currentWord, "touchLayouts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDeleteWordEvent addTouches:withLayoutIDs:](v8, "addTouches:withLayoutIDs:", v10, v11);

  -[TIWordEntry candidatesOffered](self->_currentWord, "candidatesOffered");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDeleteWordEvent addCandidatesOffered:](v8, "addCandidatesOffered:", v12);

  -[TIDeleteWordEvent allTouches](v8, "allTouches");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timestamp");
  -[TIUserAction setEndTime:](v8, "setEndTime:");

  -[TIDeleteWordEvent allTouches](v8, "allTouches");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timestamp");
  -[TIUserAction setStartTime:](v8, "setStartTime:");

  -[TITypingSession calibratedCurrentTimestamp](self, "calibratedCurrentTimestamp");
  -[TIUserAction setOccurenceTime:](v8, "setOccurenceTime:");
  return v8;
}

- (void)removeInputsAndTouchesWithRange:(_NSRange)a3
{
  NSUInteger v4;
  NSUInteger v5;

  v4 = 2 * a3.location;
  v5 = 2 * a3.length;
  -[TITypingSession removeInputsInRange:](self, "removeInputsInRange:");
  -[TITypingSession removeTouchesInRange:](self, "removeTouchesInRange:", v4, v5);
  -[TITypingSession removeLayoutsInRange:](self, "removeLayoutsInRange:", v4, v5);
}

- (void)insertUncommittedUserAction:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    v15 = v4;
    -[TITypingSession userActionHistory](self, "userActionHistory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 >= 2)
    {
      -[TITypingSession userActionHistory](self, "userActionHistory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "actionType");
      if (v9 != 2 && v9 != 12)
      {
        if (v9 == 11)
        {

LABEL_7:
          -[TITypingSession userActionHistory](self, "userActionHistory");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[TITypingSession userActionHistory](self, "userActionHistory");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "insertObject:atIndex:", v15, objc_msgSend(v11, "count") - 1);

LABEL_13:
          v4 = v15;
          goto LABEL_14;
        }
        goto LABEL_11;
      }
      objc_msgSend(v8, "documentState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contextBeforeInput");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 || (objc_msgSend(v12, "selectedText"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

LABEL_11:
        goto LABEL_12;
      }
      objc_msgSend(v12, "contextAfterInput");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_7;
    }
LABEL_12:
    -[TITypingSession userActionHistory](self, "userActionHistory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v15);
    goto LABEL_13;
  }
LABEL_14:

}

- (void)resolveInputs:(id)a3 cancelledTextRange:(_NSRange *)a4 leadingBackspaceRange:(_NSRange *)a5 trailingTextRange:(_NSRange *)a6
{
  id v8;
  NSUInteger v9;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _QWORD v15[10];
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v8 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v35 = 0x7FFFFFFFFFFFFFFFLL;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0x7FFFFFFFFFFFFFFFLL;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__20544;
  v18[4] = __Block_byref_object_dispose__20545;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__20544;
  v16[4] = __Block_byref_object_dispose__20545;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__TITypingSession_resolveInputs_cancelledTextRange_leadingBackspaceRange_trailingTextRange___block_invoke;
  v15[3] = &unk_1EA106EF8;
  v15[4] = v18;
  v15[5] = v16;
  v15[6] = &v24;
  v15[7] = &v20;
  v15[8] = &v32;
  v15[9] = &v28;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v15);
  v10 = v21[3] + v29[3];
  if (v10 >= objc_msgSend(v8, "count"))
  {
    v11 = 0;
  }
  else
  {
    v11 = objc_msgSend(v8, "count") - v10;
    v9 = v10;
  }
  v12 = v29[3];
  a4->location = v33[3];
  a4->length = v12;
  v13 = v21[3];
  a5->location = v25[3];
  a5->length = v13;
  a6->location = v9;
  a6->length = v11;
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

}

- (id)currentInputsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  length = a3.length;
  location = a3.location;
  -[TITypingSession currentWord](self, "currentWord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeyboardInputsM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TITypingSession safeRangeFromRange:fromArray:](self, "safeRangeFromRange:fromArray:", location, length, v7);
  v10 = v9;

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TITypingSession currentWord](self, "currentWord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeyboardInputsM");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subarrayWithRange:", v8, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v14, "mutableCopy");

  }
  return v11;
}

- (id)currentTouchesInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  length = a3.length;
  location = a3.location;
  -[TITypingSession currentWord](self, "currentWord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allTouchesM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TITypingSession safeRangeFromRange:fromArray:](self, "safeRangeFromRange:fromArray:", location, length, v7);
  v10 = v9;

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TITypingSession currentWord](self, "currentWord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allTouchesM");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subarrayWithRange:", v8, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v14, "mutableCopy");

  }
  return v11;
}

- (id)currentLayoutsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  length = a3.length;
  location = a3.location;
  -[TITypingSession currentWord](self, "currentWord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "touchLayoutsM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TITypingSession safeRangeFromRange:fromArray:](self, "safeRangeFromRange:fromArray:", location, length, v7);
  v10 = v9;

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TITypingSession currentWord](self, "currentWord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "touchLayoutsM");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subarrayWithRange:", v8, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v14, "mutableCopy");

  }
  return v11;
}

- (void)removeInputsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  length = a3.length;
  location = a3.location;
  -[TITypingSession currentWord](self, "currentWord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeyboardInputsM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TITypingSession safeRangeFromRange:fromArray:](self, "safeRangeFromRange:fromArray:", location, length, v7);
  v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TITypingSession currentWord](self, "currentWord");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeyboardInputsM");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectsInRange:", v8, v10);

  }
}

- (void)removeTouchesInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  length = a3.length;
  location = a3.location;
  -[TITypingSession currentWord](self, "currentWord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allTouchesM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TITypingSession safeRangeFromRange:fromArray:](self, "safeRangeFromRange:fromArray:", location, length, v7);
  v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TITypingSession currentWord](self, "currentWord");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allTouchesM");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectsInRange:", v8, v10);

  }
}

- (void)removeLayoutsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  length = a3.length;
  location = a3.location;
  -[TITypingSession currentWord](self, "currentWord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "touchLayoutsM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TITypingSession safeRangeFromRange:fromArray:](self, "safeRangeFromRange:fromArray:", location, length, v7);
  v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TITypingSession currentWord](self, "currentWord");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "touchLayoutsM");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectsInRange:", v8, v10);

  }
}

- (_NSRange)safeRangeFromRange:(_NSRange)a3 fromArray:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  if (location >= objc_msgSend(v6, "count"))
  {
    length = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (location + length > objc_msgSend(v6, "count"))
  {
    length = objc_msgSend(v6, "count") - location;
  }

  v7 = location;
  v8 = length;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)setFromLegacyRecording:(BOOL)a3
{
  self->_fromLegacyRecording = a3;
}

- (NSString)layoutName
{
  return self->_layoutName;
}

- (void)setLayoutName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)startContext
{
  return self->_startContext;
}

- (void)setStartContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_layouts, a3);
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (void)setDidReceiveSecureFieldEvent:(BOOL)a3
{
  self->_didReceiveSecureFieldEvent = a3;
}

- (void)setCandidatesAccepted:(int)a3
{
  self->_candidatesAccepted = a3;
}

- (void)setCandidatesAcceptedWithText:(int)a3
{
  self->_candidatesAcceptedWithText = a3;
}

- (void)setUserActionHistory:(id)a3
{
  objc_storeStrong((id *)&self->_userActionHistory, a3);
}

- (void)setCurrentWord:(id)a3
{
  objc_storeStrong((id *)&self->_currentWord, a3);
}

- (void)setLastInput:(id)a3
{
  objc_storeStrong((id *)&self->_lastInput, a3);
}

- (TIKeyboardState)savedDeleteInputKeyboardState
{
  return self->_savedDeleteInputKeyboardState;
}

- (void)setSavedDeleteInputKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_savedDeleteInputKeyboardState, a3);
}

- (unint64_t)currentLayoutID
{
  return self->_currentLayoutID;
}

- (TIWordEntry)lastWord
{
  return self->_lastWord;
}

- (void)setLastWord:(id)a3
{
  objc_storeStrong((id *)&self->_lastWord, a3);
}

- (TIDeleteWordEvent)lastDeletion
{
  return self->_lastDeletion;
}

- (void)setLastDeletion:(id)a3
{
  objc_storeStrong((id *)&self->_lastDeletion, a3);
}

- (BOOL)includeInputToLastWord
{
  return self->_includeInputToLastWord;
}

- (void)setIncludeInputToLastWord:(BOOL)a3
{
  self->_includeInputToLastWord = a3;
}

- (BOOL)includeInputToLastDeletion
{
  return self->_includeInputToLastDeletion;
}

- (void)setIncludeInputToLastDeletion:(BOOL)a3
{
  self->_includeInputToLastDeletion = a3;
}

- (NSString)candidateAcceptedTrigger
{
  return self->_candidateAcceptedTrigger;
}

- (void)setCandidateAcceptedTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_candidateAcceptedTrigger, a3);
}

- (void)setContextChangeTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_contextChangeTrigger, a3);
}

- (TIKeyboardTouchEvent)timeCalibrationTouch
{
  return (TIKeyboardTouchEvent *)objc_getProperty(self, a2, 200, 1);
}

- (void)setTimeCalibrationTouch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (double)calibratedTimeBase
{
  return self->_calibratedTimeBase;
}

- (void)setCalibratedTimeBase:(double)a3
{
  self->_calibratedTimeBase = a3;
}

- (NSMutableDictionary)touchesHistory
{
  return self->_touchesHistory;
}

- (void)setTouchesHistory:(id)a3
{
  objc_storeStrong((id *)&self->_touchesHistory, a3);
}

- (int64_t)lastActivePathIndex
{
  return self->_lastActivePathIndex;
}

- (void)setLastActivePathIndex:(int64_t)a3
{
  self->_lastActivePathIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchesHistory, 0);
  objc_storeStrong((id *)&self->_timeCalibrationTouch, 0);
  objc_storeStrong((id *)&self->_contextChangeTrigger, 0);
  objc_storeStrong((id *)&self->_candidateAcceptedTrigger, 0);
  objc_storeStrong((id *)&self->_lastDeletion, 0);
  objc_storeStrong((id *)&self->_lastWord, 0);
  objc_storeStrong((id *)&self->_savedDeleteInputKeyboardState, 0);
  objc_storeStrong((id *)&self->_lastInput, 0);
  objc_storeStrong((id *)&self->_currentWord, 0);
  objc_storeStrong((id *)&self->_originalWords, 0);
  objc_storeStrong((id *)&self->_userActionHistory, 0);
  objc_storeStrong((id *)&self->_featureUsageMetricsCache, 0);
  objc_storeStrong((id *)&self->_sessionParams, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_startContext, 0);
  objc_storeStrong((id *)&self->_layoutName, 0);
  objc_storeStrong((id *)&self->_cachedCandidatesOffered, 0);
  objc_storeStrong((id *)&self->_cachedKeyboardStates, 0);
}

void __92__TITypingSession_resolveInputs_cancelledTextRange_leadingBackspaceRange_trailingTextRange___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "addObject:", v11);
  v5 = objc_msgSend(v11, "isBackspace");
  v6 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v5)
  {
    if (!objc_msgSend(v6, "count"))
    {
      v10 = *(_QWORD *)(a1[6] + 8);
      if (*(_QWORD *)(v10 + 24) == 0x7FFFFFFFFFFFFFFFLL)
        *(_QWORD *)(v10 + 24) = a3;
      v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "count");
      v9 = a1[7];
      goto LABEL_12;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "removeLastObject");
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "count")
      && *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = *(_QWORD *)(a1[8] + 8);
      if (*(_QWORD *)(v7 + 24) == 0x7FFFFFFFFFFFFFFFLL)
        *(_QWORD *)(v7 + 24) = 0;
      v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "count");
      v9 = a1[9];
LABEL_12:
      *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24) += v8;
      objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "removeAllObjects");
    }
  }
  else
  {
    objc_msgSend(v6, "addObject:", v11);
  }

}

uint64_t __53__TITypingSession_keyStringWithCode_fromLayoutIndex___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(result + 40) == a3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

void __152__TITypingSession_candidateAccepted_withInput_documentState_inputContext_inputStem_predictionBarHit_useCandidateSelection_candidateIndex_keyboardState___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  TIWordEntry *v6;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
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
  uint64_t v40;
  uint64_t v41;
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
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  void *v84;
  double v85;
  void *v86;
  double v87;
  void *v88;
  void *v89;
  uint8_t buf[4];
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    if (objc_msgSend(*(id *)(a1 + 56), "count") - 1 <= a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "candidateByReplacingWithCandidate:input:rawInput:", v5, &stru_1EA1081D0, &stru_1EA1081D0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setAcceptedCandidate:", v60);

      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setAcceptedString:", v5);

      v63 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "copy");
      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setDocumentState:", v63);

      v65 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setKeyboardState:", v65);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "documentStateAfterInsertingText:", v5);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "keyboardState");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setDocumentState:", v67);

      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setInputStem:", &stru_1EA1081D0);

      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "documentState");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "contextBeforeInput");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setInputContext:", v73);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setCandidatesOfferedM:", v75);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setAllKeyboardInputsM:", v77);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setAllTouchesM:", v79);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setTouchLayoutsM:", v81);

      v83 = *(double *)(a1 + 80);
      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setOccurenceTime:", v83);

      v85 = *(double *)(a1 + 80);
      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setStartTime:", v85);

      v87 = *(double *)(a1 + 80);
      objc_msgSend(*(id *)(a1 + 48), "currentWord");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "setEndTime:", v87);

      goto LABEL_11;
    }
    v6 = objc_alloc_init(TIWordEntry);
    objc_msgSend(*(id *)(a1 + 32), "candidateByReplacingWithCandidate:input:rawInput:", v5, &stru_1EA1081D0, &stru_1EA1081D0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setAcceptedCandidate:](v6, "setAcceptedCandidate:", v7);

    -[TIWordEntry acceptedCandidate](v6, "acceptedCandidate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setAcceptedString:](v6, "setAcceptedString:", v9);

    v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "copy");
    -[TIUserAction setDocumentState:](v6, "setDocumentState:", v10);

    v11 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
    -[TIUserAction setKeyboardState:](v6, "setKeyboardState:", v11);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "documentStateAfterInsertingText:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIUserAction keyboardState](v6, "keyboardState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDocumentState:", v12);

    -[TIUserAction keyboardState](v6, "keyboardState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "documentState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "documentStateAfterInsertingText:", CFSTR(" "));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    objc_msgSend(*(id *)(a1 + 48), "currentWord");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setWordEntryType:](v6, "setWordEntryType:", objc_msgSend(v19, "wordEntryType"));

    -[TIWordEntry setInputStem:](v6, "setInputStem:", &stru_1EA1081D0);
    -[TIUserAction documentState](v6, "documentState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contextBeforeInput");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setInputContext:](v6, "setInputContext:", v21);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setCandidatesOfferedM:](v6, "setCandidatesOfferedM:", v22);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setAllKeyboardInputsM:](v6, "setAllKeyboardInputsM:", v23);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setAllTouchesM:](v6, "setAllTouchesM:", v24);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setTouchLayoutsM:](v6, "setTouchLayoutsM:", v25);

    -[TIUserAction setOccurenceTime:](v6, "setOccurenceTime:", *(double *)(a1 + 80));
    -[TIUserAction setStartTime:](v6, "setStartTime:", *(double *)(a1 + 80));
    -[TIUserAction setEndTime:](v6, "setEndTime:", *(double *)(a1 + 80));
    -[TIWordEntry setOrigin:](v6, "setOrigin:", 4);
    objc_msgSend(*(id *)(a1 + 48), "setCandidatesAccepted:", objc_msgSend(*(id *)(a1 + 48), "candidatesAccepted") + 1);
    objc_msgSend(*(id *)(a1 + 48), "setCandidatesAcceptedWithText:", objc_msgSend(*(id *)(a1 + 48), "candidatesAcceptedWithText") + 1);
    objc_msgSend(*(id *)(a1 + 48), "userActionHistory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v6);

    if (IXACanLogMessageAtLevel())
    {
      IXASessionDetailsLogFacility();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        wordEntryDetailForLog(v6, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("%s %@"), "-[TITypingSession candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]_block_invoke", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v91 = v30;
LABEL_13:
        _os_log_debug_impl(&dword_1DA6F2000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        goto LABEL_8;
      }
      goto LABEL_8;
    }
  }
  else
  {
    v6 = objc_alloc_init(TIWordEntry);
    objc_msgSend(*(id *)(a1 + 32), "candidateByReplacingWithCandidate:", v5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setAcceptedCandidate:](v6, "setAcceptedCandidate:", v31);

    -[TIWordEntry acceptedCandidate](v6, "acceptedCandidate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "candidate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setAcceptedString:](v6, "setAcceptedString:", v33);

    v34 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "copy");
    -[TIUserAction setDocumentState:](v6, "setDocumentState:", v34);

    v35 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    -[TIUserAction setKeyboardState:](v6, "setKeyboardState:", v35);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "documentStateAfterInsertingText:", v5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIUserAction keyboardState](v6, "keyboardState");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setDocumentState:", v36);

    -[TIUserAction keyboardState](v6, "keyboardState");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "documentState");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "documentStateAfterInsertingText:", CFSTR(" "));
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v42 = *(void **)(v41 + 40);
    *(_QWORD *)(v41 + 40) = v40;

    objc_msgSend(*(id *)(a1 + 48), "currentWord");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setWordEntryType:](v6, "setWordEntryType:", objc_msgSend(v43, "wordEntryType"));

    objc_msgSend(*(id *)(a1 + 48), "currentWord");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "inputStem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setInputStem:](v6, "setInputStem:", v45);

    objc_msgSend(*(id *)(a1 + 48), "currentWord");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "inputContext");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setInputContext:](v6, "setInputContext:", v47);

    objc_msgSend(*(id *)(a1 + 48), "currentWord");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "candidatesOfferedM");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setCandidatesOfferedM:](v6, "setCandidatesOfferedM:", v49);

    objc_msgSend(*(id *)(a1 + 48), "currentWord");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "allKeyboardInputsM");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setAllKeyboardInputsM:](v6, "setAllKeyboardInputsM:", v51);

    objc_msgSend(*(id *)(a1 + 48), "currentWord");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "allTouchesM");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setAllTouchesM:](v6, "setAllTouchesM:", v53);

    objc_msgSend(*(id *)(a1 + 48), "currentWord");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "touchLayoutsM");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordEntry setTouchLayoutsM:](v6, "setTouchLayoutsM:", v55);

    objc_msgSend(*(id *)(a1 + 48), "currentWord");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "occurenceTime");
    -[TIUserAction setOccurenceTime:](v6, "setOccurenceTime:");

    objc_msgSend(*(id *)(a1 + 48), "currentWord");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "startTime");
    -[TIUserAction setStartTime:](v6, "setStartTime:");

    objc_msgSend(*(id *)(a1 + 48), "currentWord");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "endTime");
    -[TIUserAction setEndTime:](v6, "setEndTime:");

    -[TIWordEntry setOrigin:](v6, "setOrigin:", 4);
    objc_msgSend(*(id *)(a1 + 48), "setCandidatesAccepted:", objc_msgSend(*(id *)(a1 + 48), "candidatesAccepted") + 1);
    objc_msgSend(*(id *)(a1 + 48), "setCandidatesAcceptedWithText:", objc_msgSend(*(id *)(a1 + 48), "candidatesAcceptedWithText") + 1);
    objc_msgSend(*(id *)(a1 + 48), "userActionHistory");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addObject:", v6);

    if (IXACanLogMessageAtLevel())
    {
      IXASessionDetailsLogFacility();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v89 = (void *)MEMORY[0x1E0CB3940];
        wordEntryDetailForLog(v6, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "stringWithFormat:", CFSTR("%s %@"), "-[TITypingSession candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]_block_invoke", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v91 = v30;
        goto LABEL_13;
      }
LABEL_8:

    }
  }

LABEL_11:
}

uint64_t __49__TITypingSession_layoutDidChange_keyboardState___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
