@implementation _UISmartReplyFeedbackManager

- (_UISmartReplyFeedbackManager)initWithoutBundleIdCheck
{
  _UISmartReplyFeedbackManager *v2;
  _UISmartReplyFeedbackManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISmartReplyFeedbackManager;
  v2 = -[_UISmartReplyFeedbackManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    -[_UISmartReplyFeedbackManager resetWithDebug:](v2, "resetWithDebug:", CFSTR("init"));
  }
  return v3;
}

- (_UISmartReplyFeedbackManager)init
{
  void *v3;
  double v4;
  int v5;
  _UISmartReplyFeedbackManager *v6;

  _UIMainBundleIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
  {
    v4 = 0.3;
  }
  else
  {
    v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilemail"));
    v4 = 0.75;
    if (!v5)
    {
      v6 = 0;
      goto LABEL_6;
    }
  }
  -[_UISmartReplyFeedbackManager setPredictionBarDebounceTimeInterval:](self, "setPredictionBarDebounceTimeInterval:", v4);
  self = -[_UISmartReplyFeedbackManager initWithoutBundleIdCheck](self, "initWithoutBundleIdCheck");
  v6 = self;
LABEL_6:

  return v6;
}

- (_UISmartReplyFeedbackManager)initWithKeyboardStateManagerDelegate:(id)a3
{
  id v4;
  _UISmartReplyFeedbackManager *v5;
  _UISmartReplyFeedbackManager *v6;

  v4 = a3;
  v5 = -[_UISmartReplyFeedbackManager init](self, "init");
  v6 = v5;
  if (v5)
    -[_UISmartReplyFeedbackManager setKeyboardStateManagerDelegate:](v5, "setKeyboardStateManagerDelegate:", v4);

  return v6;
}

- (BOOL)smartReplyWasShownOrSelected
{
  return -[_UISmartReplyFeedbackManager state](self, "state") > 1;
}

- (BOOL)smartReplyWasSelected
{
  return -[_UISmartReplyFeedbackManager state](self, "state") > 2;
}

- (BOOL)feedbackUIWasPresented
{
  return -[_UISmartReplyFeedbackManager state](self, "state") > 6;
}

- (BOOL)shouldShowSmartReplyFeedbackInputDashboardViewController
{
  if (-[_UISmartReplyFeedbackManager state](self, "state") < 3)
    return 0;
  if (-[_UISmartReplyFeedbackManager isLongFormCandidate](self, "isLongFormCandidate"))
    return -[_UISmartReplyFeedbackManager state](self, "state") > 4;
  return 1;
}

- (BOOL)willShowFeedbackUI
{
  return -[_UISmartReplyFeedbackManager state](self, "state") > 2;
}

- (void)resetSmartReplyFeedbackUIIfAlreadyShown
{
  if (-[_UISmartReplyFeedbackManager state](self, "state") >= 7)
    -[_UISmartReplyFeedbackManager resetWithDebug:](self, "resetWithDebug:", CFSTR("resetSmartReplyFeedbackUIIfAlreadyShown"));
}

+ (BOOL)candidateIsSmartReply:(id)a3
{
  return ((unint64_t)objc_msgSend(a3, "candidateProperty") >> 1) & 1;
}

+ (BOOL)candidateIsLongFormSmartReply:(id)a3
{
  return ((unint64_t)objc_msgSend(a3, "candidateProperty") >> 4) & 1;
}

- (void)composeFieldInFocusWithMailOrMsgThreadId:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v5 = (id *)getIASignalSmartRepliesComposeFieldInFocusSymbolLoc_ptr;
  v14 = getIASignalSmartRepliesComposeFieldInFocusSymbolLoc_ptr;
  if (!getIASignalSmartRepliesComposeFieldInFocusSymbolLoc_ptr)
  {
    v6 = InputAnalyticsLibrary();
    v5 = (id *)dlsym(v6, "IASignalSmartRepliesComposeFieldInFocus");
    v12[3] = (uint64_t)v5;
    getIASignalSmartRepliesComposeFieldInFocusSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    v7 = *v5;
    getIAChannelSmartReplies();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISmartReplyFeedbackManager _sendAnalyticsForSignal:toChannel:withThreadId:payload:](self, "_sendAnalyticsForSignal:toChannel:withThreadId:payload:", v7, v8, v4, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getIASignalSmartRepliesComposeFieldInFocus(void)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("_UISmartReplyFeedbackManager.m"), 31, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)updateCandidates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __objc2_class *v11;
  uint64_t i;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  _UISmartReplyFeedbackManager *v18;
  __objc2_class *v19;
  id v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UISmartReplyFeedbackManager state](self, "state") < 3
    || -[_UISmartReplyFeedbackManager state](self, "state") > 7)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v7)
    {
      v8 = v7;
      v5 = 0;
      v9 = *(_QWORD *)v29;
      v10 = 1;
      v11 = _UIViewInProcessAnimationReasonArray;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(&v11[86], "candidateIsSmartReply:", v13))
          {
            if ((v10 & 1) != 0)
              -[_UISmartReplyFeedbackManager resetWithDebug:](self, "resetWithDebug:", CFSTR("updateCandidates"));
            v14 = objc_msgSend(&v11[86], "candidateIsLongFormSmartReply:", v13);
            self->_isLongFormCandidate |= v14;
            UIFeedbackServiceLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v27 = v5;
              v16 = v8;
              v17 = v9;
              v18 = self;
              v19 = v11;
              v20 = v6;
              if (v14)
                v21 = CFSTR("long form");
              else
                v21 = CFSTR("short form");
              objc_msgSend(v13, "label");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138478083;
              v33 = v21;
              v6 = v20;
              v11 = v19;
              self = v18;
              v9 = v17;
              v8 = v16;
              v5 = v27;
              v34 = 2117;
              v35 = v22;
              _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_INFO, "Adding %{private}@ SR candidate: '%{sensitive}@'", buf, 0x16u);

            }
            if (v5)
            {
              v23 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v13, "label");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "stringWithFormat:", CFSTR("%@|%@"), v5, v24);
              v25 = objc_claimAutoreleasedReturnValue();

              v5 = v25;
            }
            else
            {
              objc_msgSend(v13, "label");
              v5 = objc_claimAutoreleasedReturnValue();
            }
          }
          v10 = 0;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        v10 = 0;
      }
      while (v8);
    }
    else
    {
      v5 = 0;
    }

    if (-[NSObject length](v5, "length"))
      -[_UISmartReplyFeedbackManager smartRepliesPresented:](self, "smartRepliesPresented:", v5);
    else
      -[_UISmartReplyFeedbackManager resetStateIfNoSmartReplySelected](self, "resetStateIfNoSmartReplySelected");
    v4 = v26;
  }
  else
  {
    UIFeedbackServiceLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "updateCandidates called, but awaiting feedback UI still. Ignoring update.", buf, 2u);
    }
  }

}

- (void)smartRepliesPresented:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UISmartReplyFeedbackManager state](self, "state") == 1)
  {
    self->_state = 2;
  }
  else
  {
    UIFeedbackServiceLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 134217984;
      v8 = -[_UISmartReplyFeedbackManager state](self, "state");
      _os_log_error_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Unexpected state %lu in smartRepliesPresented", (uint8_t *)&v7, 0xCu);
    }

  }
  -[_UISmartReplyFeedbackManager setShownCandidatesDescription:](self, "setShownCandidatesDescription:", v4);
  UIFeedbackServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138739971;
    v8 = (unint64_t)v4;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_INFO, "smartRepliesPresented '%{sensitive}@'", (uint8_t *)&v7, 0xCu);
  }

}

- (void)userSelectedSmartReply:(id)a3 isLongForm:(BOOL)a4 withMailOrMsgThreadId:(id)a5
{
  _BOOL4 v6;
  __CFString *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  id *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void **v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  NSObject *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  _BYTE buf[24];
  uint64_t v41;
  uint64_t v42;

  v6 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a5;
  if (-[_UISmartReplyFeedbackManager state](self, "state") != 2)
  {
    UIFeedbackServiceLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = -[_UISmartReplyFeedbackManager state](self, "state");
      _os_log_error_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Unexpected state %lu in userSelectedSmartReply", buf, 0xCu);
    }

  }
  if (-[_UISmartReplyFeedbackManager isLongFormCandidate](self, "isLongFormCandidate") != v6)
  {
    UIFeedbackServiceLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v31 = CFSTR("NO");
      if (v6)
        v31 = CFSTR("YES");
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = v31;
      _os_log_error_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Unexpected isLongForm %{private}@ in userSelectedSmartReply", buf, 0xCu);
    }

  }
  v12 = 4;
  if (!v6)
    v12 = 5;
  self->_state = v12;
  -[_UISmartReplyFeedbackManager setSelectedCandidateDescription:](self, "setSelectedCandidateDescription:", v8);
  self->_isLongFormCandidate = v6;
  -[_UISmartReplyFeedbackManager keyboardStateManagerDelegate](self, "keyboardStateManagerDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateAssistantView");

  v14 = objc_msgSend(getIAUtilityClass(), "getSPIVersion");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v15 = (id *)qword_1ECD7F158;
  v41 = qword_1ECD7F158;
  if (!qword_1ECD7F158)
  {
    v16 = InputAnalyticsLibrary();
    v15 = (id *)dlsym(v16, "IASignalSmartRepliesIntentEngaged");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v15;
    qword_1ECD7F158 = (uint64_t)v15;
  }
  _Block_object_dispose(buf, 8);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getIASignalSmartRepliesIntentEngaged(void)");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("_UISmartReplyFeedbackManager.m"), 32, CFSTR("%s"), dlerror());

    goto LABEL_34;
  }
  v17 = v14 < 9;
  v18 = *v15;
  getIAChannelSmartReplies();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v9, "copy");
  if (v17)
  {
    if (v8)
      v21 = v8;
    else
      v21 = CFSTR("None");
    v38 = CFSTR("SelectedIntent");
    v39 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v23 = (void **)qword_1ECD7F160;
  v41 = qword_1ECD7F160;
  if (!qword_1ECD7F160)
  {
    v24 = InputAnalyticsLibrary();
    v23 = (void **)dlsym(v24, "IAPayloadKeySmartRepliesSelectedIntent");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v23;
    qword_1ECD7F160 = (uint64_t)v23;
  }
  _Block_object_dispose(buf, 8);
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getIAPayloadKeySmartRepliesSelectedIntent(void)");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("_UISmartReplyFeedbackManager.m"), 48, CFSTR("%s"), dlerror());

LABEL_34:
    __break(1u);
  }
  v25 = *v23;
  v26 = CFSTR("None");
  if (v8)
    v26 = v8;
  v36 = *v23;
  v37 = v26;
  v27 = (void *)MEMORY[0x1E0C99D80];
  v28 = v25;
  objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
  -[_UISmartReplyFeedbackManager _sendAnalyticsForSignal:toChannel:withThreadId:payload:](self, "_sendAnalyticsForSignal:toChannel:withThreadId:payload:", v18, v19, v20, v22);

  UIFeedbackServiceLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = CFSTR("short form");
    if (v6)
      v30 = CFSTR("long form");
    *(_DWORD *)buf = 138478083;
    *(_QWORD *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2117;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_INFO, "userSelectedSmartReply %{private}@ '%{sensitive}@'", buf, 0x16u);
  }

}

- (void)reportWritingToolsPanelDismissed
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[_UISmartReplyFeedbackManager isLongFormCandidate](self, "isLongFormCandidate"))
  {
    if (-[_UISmartReplyFeedbackManager state](self, "state") <= 4)
      self->_state = 5;
    UIFeedbackServiceLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_INFO, "reportWritingToolsPanelDismissed", v4, 2u);
    }

  }
}

- (void)reportFeedbackUIPresented
{
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  if (!-[_UISmartReplyFeedbackManager isLongFormCandidate](self, "isLongFormCandidate")
    || -[_UISmartReplyFeedbackManager state](self, "state") >= 5)
  {
    -[_UISmartReplyFeedbackManager reportFeedbackUIPresentedCalledTime](self, "reportFeedbackUIPresentedCalledTime");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISmartReplyFeedbackManager setReportFeedbackUIPresentedCalledTime:](self, "setReportFeedbackUIPresentedCalledTime:", v4);

      self->_state = 6;
      v5 = (void *)MEMORY[0x1E0C99E88];
      -[_UISmartReplyFeedbackManager predictionBarDebounceTimeInterval](self, "predictionBarDebounceTimeInterval");
      objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_predictionBarDebounceTimeIntervalExpired, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISmartReplyFeedbackManager updateFeedbackInputAndOutputStrings](self, "updateFeedbackInputAndOutputStrings");
      if ((unint64_t)objc_msgSend(getIAUtilityClass(), "getSPIVersion") >= 8)
      {
        *(_QWORD *)buf = 0;
        v23 = buf;
        v24 = 0x2020000000;
        v6 = (id *)getIASignalFeedbackServiceSmartRepliesFeedbackUIPresentedSymbolLoc_ptr;
        v25 = getIASignalFeedbackServiceSmartRepliesFeedbackUIPresentedSymbolLoc_ptr;
        if (!getIASignalFeedbackServiceSmartRepliesFeedbackUIPresentedSymbolLoc_ptr)
        {
          v7 = InputAnalyticsLibrary();
          v6 = (id *)dlsym(v7, "IASignalFeedbackServiceSmartRepliesFeedbackUIPresented");
          *((_QWORD *)v23 + 3) = v6;
          getIASignalFeedbackServiceSmartRepliesFeedbackUIPresentedSymbolLoc_ptr = (uint64_t)v6;
        }
        _Block_object_dispose(buf, 8);
        if (!v6)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getIASignalFeedbackServiceSmartRepliesFeedbackUIPresented(void)");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("_UISmartReplyFeedbackManager.m"), 40, CFSTR("%s"), dlerror());

          __break(1u);
        }
        v20 = (__CFString *)*v6;
      }
      else
      {
        v20 = CFSTR("SmartRepliesFeedbackUIPresented");
      }
      getIAChannelFeedbackService();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISmartReplyFeedbackManager analyticsSessionId](self, "analyticsSessionId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      getIAPayloadKeyFeedbackServiceOriginalContent();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v9;
      -[_UISmartReplyFeedbackManager feedbackFormInputContext](self, "feedbackFormInputContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[_UISmartReplyFeedbackManager feedbackFormInputContext](self, "feedbackFormInputContext");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = CFSTR("None");
      }
      v27[0] = v11;
      getIAPayloadKeyFeedbackServiceGeneratedContent();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v12;
      -[_UISmartReplyFeedbackManager feedbackFormOutputString](self, "feedbackFormOutputString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[_UISmartReplyFeedbackManager feedbackFormOutputString](self, "feedbackFormOutputString");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = CFSTR("None");
      }
      v27[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISmartReplyFeedbackManager _sendAnalyticsForSignal:toChannel:withThreadId:payload:](self, "_sendAnalyticsForSignal:toChannel:withThreadId:payload:", v20, v21, v8, v15);

      if (v13)
      if (v10)

      UIFeedbackServiceLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_INFO, "reportFeedbackUIPresented", buf, 2u);
      }

    }
  }
}

- (void)predictionBarDebounceTimeIntervalExpired
{
  NSObject *v3;
  const char *v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[_UISmartReplyFeedbackManager state](self, "state") == 6)
  {
    self->_state = 7;
    UIFeedbackServiceLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      v4 = "predictionBarDebounceTimeIntervalExpired";
LABEL_7:
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v7, 2u);
    }
  }
  else
  {
    v5 = -[_UISmartReplyFeedbackManager state](self, "state");
    UIFeedbackServiceLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v3 = v6;
    if (v5 == 1)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v7) = 0;
        v4 = "predictionBarDebounceTimeIntervalExpired, but was previously reset";
        goto LABEL_7;
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 134217984;
      v8 = -[_UISmartReplyFeedbackManager state](self, "state");
      _os_log_error_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Unexpected state %lu in predictionBarDebounceTimeIntervalExpired", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (id)getStringDescribingInputContextHistoryWithBundleID:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  __CFString *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  __CFString *v34;
  id v36;
  uint64_t v37;
  _UISmartReplyFeedbackManager *v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UISmartReplyFeedbackManager inputContextHistory](self, "inputContextHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = CFSTR("None");
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[_UISmartReplyFeedbackManager inputContextHistory](self, "inputContextHistory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __83___UISmartReplyFeedbackManager_getStringDescribingInputContextHistoryWithBundleID___block_invoke;
    v39[3] = &unk_1E16D88D8;
    v9 = v7;
    v40 = v9;
    objc_msgSend(v8, "enumerateAllContextEntryObjects:", v39);

    if (objc_msgSend(CFSTR("com.apple.MobileSMS"), "isEqualToString:", v4))
      v10 = 4;
    else
      v10 = 1;
    UIFeedbackServiceLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218240;
      v42 = v12;
      v43 = 2048;
      v44 = v10;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_INFO, "Original context length %lu, trimmed %lu", buf, 0x16u);
    }
    v36 = v4;

    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = objc_msgSend(v9, "count");
    v15 = (v14 - v10) & ~((v14 - v10) >> 63);
    v16 = objc_msgSend(v9, "count");
    if (v15 >= v16)
    {
      v18 = 0;
    }
    else
    {
      v17 = v16;
      v18 = 0;
      v37 = 1;
      v38 = self;
      v19 = v9;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "senderIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v21);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v23 = 0x1E0CB3000;
        }
        else
        {
          -[_UISmartReplyFeedbackManager inputContextHistory](v38, "inputContextHistory");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "firstPersonIdentifiers");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "senderIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "containsObject:", v26);

          if ((v27 & 1) != 0)
          {
            v22 = CFSTR("Me");
            v23 = 0x1E0CB3000;
          }
          else
          {
            v23 = 0x1E0CB3000uLL;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Person %lu"), v37);
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            ++v37;
          }
          objc_msgSend(v20, "senderIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, v28);

        }
        v29 = *(void **)(v23 + 2368);
        objc_msgSend(v20, "text");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: %@"), v22, v30);
        v31 = v23;
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(*(id *)(v31 + 2368), "stringWithFormat:", CFSTR("%@\n%@"), v18, v32);
          v33 = objc_claimAutoreleasedReturnValue();

          v18 = (__CFString *)v33;
        }
        else
        {
          v18 = v32;
        }
        v9 = v19;

        ++v15;
      }
      while (v17 != v15);
    }
    v34 = CFSTR("None");
    if (v18)
      v34 = v18;
    v6 = v34;

    v4 = v36;
  }

  return v6;
}

- (void)updateFeedbackInputAndOutputStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[_UISmartReplyFeedbackManager keyboardStateManagerDelegate](self, "keyboardStateManagerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputContextHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tiInputContextHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackManager setInputContextHistory:](self, "setInputContextHistory:", v6);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackManager getStringDescribingInputContextHistoryWithBundleID:](self, "getStringDescribingInputContextHistoryWithBundleID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackManager setFeedbackFormInputContext:](self, "setFeedbackFormInputContext:", v9);

  -[_UISmartReplyFeedbackManager shownCandidatesDescription](self, "shownCandidatesDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[_UISmartReplyFeedbackManager shownCandidatesDescription](self, "shownCandidatesDescription");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("None");
  }

  -[_UISmartReplyFeedbackManager selectedCandidateDescription](self, "selectedCandidateDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[_UISmartReplyFeedbackManager selectedCandidateDescription](self, "selectedCandidateDescription");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("None");
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Shown: %@\nSelected: %@"), v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackManager setFeedbackFormOutputString:](self, "setFeedbackFormOutputString:", v14);

  UIFeedbackServiceLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    -[_UISmartReplyFeedbackManager feedbackFormInputContext](self, "feedbackFormInputContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138740483;
    v18 = v16;
    v19 = 2117;
    v20 = v11;
    v21 = 2117;
    v22 = v13;
    _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_INFO, "updateFeedbackInputAndOutputStrings inputContext='%{sensitive}@' shown='%{sensitive}@' selected='%{sensitive}@'", buf, 0x20u);

  }
}

- (void)reportSmartRepliesFeedbackSignal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getIAChannelFeedbackService();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackManager analyticsSessionId](self, "analyticsSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getIAPayloadKeyFeedbackServiceOriginalContent();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  -[_UISmartReplyFeedbackManager feedbackFormInputContext](self, "feedbackFormInputContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UISmartReplyFeedbackManager feedbackFormInputContext](self, "feedbackFormInputContext");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("None");
  }
  v15[0] = v8;
  getIAPayloadKeyFeedbackServiceGeneratedContent();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  -[_UISmartReplyFeedbackManager feedbackFormOutputString](self, "feedbackFormOutputString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[_UISmartReplyFeedbackManager feedbackFormOutputString](self, "feedbackFormOutputString");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("None");
  }
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackManager _sendAnalyticsForSignal:toChannel:withThreadId:payload:](self, "_sendAnalyticsForSignal:toChannel:withThreadId:payload:", v4, v13, v5, v12);

  if (v10)
  if (v7)

  -[_UISmartReplyFeedbackManager resetWithDebug:](self, "resetWithDebug:", CFSTR("reportSmartRepliesFeedbackSignal"));
}

- (void)reportSmartRepliesConcern
{
  id v3;

  getIASignalFeedbackServiceLaunchSmartRepliesThumbsDown();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackManager reportSmartRepliesFeedbackSignal:](self, "reportSmartRepliesFeedbackSignal:", v3);

}

- (void)reportSmartRepliesThumbsUp
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v3 = (_QWORD *)getIASignalFeedbackServiceLaunchSmartRepliesThumbsUpSymbolLoc_ptr;
  v10 = getIASignalFeedbackServiceLaunchSmartRepliesThumbsUpSymbolLoc_ptr;
  if (!getIASignalFeedbackServiceLaunchSmartRepliesThumbsUpSymbolLoc_ptr)
  {
    v4 = InputAnalyticsLibrary();
    v3 = dlsym(v4, "IASignalFeedbackServiceLaunchSmartRepliesThumbsUp");
    v8[3] = (uint64_t)v3;
    getIASignalFeedbackServiceLaunchSmartRepliesThumbsUpSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v7, 8);
  if (v3)
  {
    -[_UISmartReplyFeedbackManager reportSmartRepliesFeedbackSignal:](self, "reportSmartRepliesFeedbackSignal:", *v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getIASignalFeedbackServiceLaunchSmartRepliesThumbsUp(void)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UISmartReplyFeedbackManager.m"), 33, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)reportSmartRepliesThumbsDown
{
  id v3;

  getIASignalFeedbackServiceLaunchSmartRepliesThumbsDown();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISmartReplyFeedbackManager reportSmartRepliesFeedbackSignal:](self, "reportSmartRepliesFeedbackSignal:", v3);

}

- (void)resetWithDebug:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 buf;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UISmartReplyFeedbackManager state](self, "state") != 1)
  {
    UIFeedbackServiceLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138477827;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_INFO, "Resetting state (%{private}@)", (uint8_t *)&buf, 0xCu);
    }

    self->_state = 1;
    self->_isLongFormCandidate = 0;
    -[_UISmartReplyFeedbackManager setInputContextHistory:](self, "setInputContextHistory:", 0);
    -[_UISmartReplyFeedbackManager setShownCandidatesDescription:](self, "setShownCandidatesDescription:", 0);
    -[_UISmartReplyFeedbackManager setSelectedCandidateDescription:](self, "setSelectedCandidateDescription:", 0);
    -[_UISmartReplyFeedbackManager setFeedbackFormInputContext:](self, "setFeedbackFormInputContext:", 0);
    -[_UISmartReplyFeedbackManager setFeedbackFormOutputString:](self, "setFeedbackFormOutputString:", 0);
    -[_UISmartReplyFeedbackManager reportFeedbackUIPresentedCalledTime](self, "reportFeedbackUIPresentedCalledTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

    if (!v7)
    {
      UIFeedbackServiceLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_INFO, "Updating assistant view...", (uint8_t *)&buf, 2u);
      }

      -[_UISmartReplyFeedbackManager setReportFeedbackUIPresentedCalledTime:](self, "setReportFeedbackUIPresentedCalledTime:", 0);
      -[_UISmartReplyFeedbackManager keyboardStateManagerDelegate](self, "keyboardStateManagerDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateAssistantView");

    }
    if ((unint64_t)objc_msgSend(getIAUtilityClass(), "getSPIVersion") >= 8)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v18 = 0x2020000000;
      v11 = (id *)getIASignalFeedbackServiceSmartRepliesFeedbackUIResetSymbolLoc_ptr;
      v19 = getIASignalFeedbackServiceSmartRepliesFeedbackUIResetSymbolLoc_ptr;
      if (!getIASignalFeedbackServiceSmartRepliesFeedbackUIResetSymbolLoc_ptr)
      {
        v12 = InputAnalyticsLibrary();
        v11 = (id *)dlsym(v12, "IASignalFeedbackServiceSmartRepliesFeedbackUIReset");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v11;
        getIASignalFeedbackServiceSmartRepliesFeedbackUIResetSymbolLoc_ptr = (uint64_t)v11;
      }
      _Block_object_dispose(&buf, 8);
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getIASignalFeedbackServiceSmartRepliesFeedbackUIReset(void)");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("_UISmartReplyFeedbackManager.m"), 41, CFSTR("%s"), dlerror());

        __break(1u);
      }
      v10 = (__CFString *)*v11;
    }
    else
    {
      v10 = CFSTR("SmartRepliesFeedbackUIReset");
    }
    getIAChannelFeedbackService();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISmartReplyFeedbackManager analyticsSessionId](self, "analyticsSessionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISmartReplyFeedbackManager _sendAnalyticsForSignal:toChannel:withThreadId:payload:](self, "_sendAnalyticsForSignal:toChannel:withThreadId:payload:", v10, v13, v14, 0);

  }
}

- (void)resetOnKeyboardCandidatesCleared
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[_UISmartReplyFeedbackManager isLongFormCandidate](self, "isLongFormCandidate")
    && -[_UISmartReplyFeedbackManager smartReplyWasSelected](self, "smartReplyWasSelected")
    && !-[_UISmartReplyFeedbackManager feedbackUIWasPresented](self, "feedbackUIWasPresented"))
  {
    UIFeedbackServiceLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_INFO, "resetOnKeyboardCandidatesCleared ignored", v4, 2u);
    }

  }
  else
  {
    -[_UISmartReplyFeedbackManager resetWithDebug:](self, "resetWithDebug:", CFSTR("resetOnKeyboardCandidatesCleared"));
  }
}

- (void)resetStateIfNoSmartReplySelected
{
  if (-[_UISmartReplyFeedbackManager state](self, "state") == 2)
    -[_UISmartReplyFeedbackManager resetWithDebug:](self, "resetWithDebug:", CFSTR("resetStateIfNoSmartReplySelected"));
}

- (void)_sendAnalyticsForSignal:(id)a3 toChannel:(id)a4 withThreadId:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 buf;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v14 = (void *)qword_1ECD7F168;
  v21 = qword_1ECD7F168;
  if (!qword_1ECD7F168)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v23 = __getIASignalAnalyticsClass_block_invoke;
    v24 = &unk_1E16B14C0;
    v25 = &v18;
    __getIASignalAnalyticsClass_block_invoke((uint64_t)&buf);
    v14 = (void *)v19[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v18, 8);
  -[_UISmartReplyFeedbackManager setAnalyticsSessionId:](self, "setAnalyticsSessionId:", v12, v18);
  if (v15)
  {
    if (v12)
    {
      objc_msgSend(v15, "sendSignal:toChannel:withUniqueStringID:withPayload:", v10, v11, v12, v13);
    }
    else
    {
      UIFeedbackServiceLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138477827;
        *(_QWORD *)((char *)&buf + 4) = v10;
        _os_log_error_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "msgOrMailThreadId is nil for signal %{private}@", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend(v15, "sendSignal:toChannel:withPayload:", v10, v11, v13);
    }
  }
  else
  {
    UIFeedbackServiceLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Could not soft link InputAnalytics", (uint8_t *)&buf, 2u);
    }

  }
}

- (TIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (void)setInputContextHistory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)state
{
  return self->_state;
}

- (_UIKeyboardStateManager)keyboardStateManagerDelegate
{
  return (_UIKeyboardStateManager *)objc_loadWeakRetained((id *)&self->_keyboardStateManagerDelegate);
}

- (void)setKeyboardStateManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_keyboardStateManagerDelegate, a3);
}

- (BOOL)isLongFormCandidate
{
  return self->_isLongFormCandidate;
}

- (NSString)analyticsSessionId
{
  return self->_analyticsSessionId;
}

- (void)setAnalyticsSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsSessionId, a3);
}

- (NSString)shownCandidatesDescription
{
  return self->_shownCandidatesDescription;
}

- (void)setShownCandidatesDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)selectedCandidateDescription
{
  return self->_selectedCandidateDescription;
}

- (void)setSelectedCandidateDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)feedbackFormInputContext
{
  return self->_feedbackFormInputContext;
}

- (void)setFeedbackFormInputContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)feedbackFormOutputString
{
  return self->_feedbackFormOutputString;
}

- (void)setFeedbackFormOutputString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)reportFeedbackUIPresentedCalledTime
{
  return self->_reportFeedbackUIPresentedCalledTime;
}

- (void)setReportFeedbackUIPresentedCalledTime:(id)a3
{
  objc_storeStrong((id *)&self->_reportFeedbackUIPresentedCalledTime, a3);
}

- (double)predictionBarDebounceTimeInterval
{
  return self->_predictionBarDebounceTimeInterval;
}

- (void)setPredictionBarDebounceTimeInterval:(double)a3
{
  self->_predictionBarDebounceTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportFeedbackUIPresentedCalledTime, 0);
  objc_storeStrong((id *)&self->_feedbackFormOutputString, 0);
  objc_storeStrong((id *)&self->_feedbackFormInputContext, 0);
  objc_storeStrong((id *)&self->_selectedCandidateDescription, 0);
  objc_storeStrong((id *)&self->_shownCandidatesDescription, 0);
  objc_storeStrong((id *)&self->_analyticsSessionId, 0);
  objc_destroyWeak((id *)&self->_keyboardStateManagerDelegate);
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
}

@end
