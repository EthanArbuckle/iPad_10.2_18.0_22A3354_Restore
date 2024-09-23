@implementation TIFavoniusTypingSessionAnalyzer

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  id v8;
  void *v9;
  NSArray *v10;
  NSArray *activeInputModes;
  void *v12;
  NSDictionary *v13;
  NSDictionary *testingParameters;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;

  v8 = a3;
  if (a5)
  {
    objc_storeStrong((id *)&self->_currentSession, a3);
    objc_msgSend(v8, "sessionParams");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeInputModes");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    activeInputModes = self->_activeInputModes;
    self->_activeInputModes = v10;

    objc_msgSend(v8, "sessionParams");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "testingParameters");
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    testingParameters = self->_testingParameters;
    self->_testingParameters = v13;

    objc_msgSend(v8, "userActionHistory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    v17 = v16;
    if (v16)
    {
      v18 = 0;
      v19 = 0;
      v20 = (int)(v16 - 1);
      do
      {
        v21 = v19;
        objc_msgSend(v8, "userActionHistory");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndex:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 >= v20)
        {
          v24 = 0;
        }
        else
        {
          objc_msgSend(v8, "userActionHistory");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndex:", v18 + 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v25 = objc_msgSend(v19, "actionType");
        switch(v25)
        {
          case 4:
            -[TIFavoniusTypingSessionAnalyzer handlePath:](self, "handlePath:", v19);
            break;
          case 1:
            -[TIFavoniusTypingSessionAnalyzer handleDeleteWord:nextAction:](self, "handleDeleteWord:nextAction:", v21, v24);
            break;
          case 0:
            -[TIFavoniusTypingSessionAnalyzer handleWordEntry:](self, "handleWordEntry:", v19);
            break;
        }
        -[TIFavoniusTypingSessionAnalyzer trackMessagesForAction:](self, "trackMessagesForAction:", v19);

        ++v18;
      }
      while (v17 != v18);

    }
    -[TIFavoniusTypingSessionAnalyzer reportLastMessage](self, "reportLastMessage");
  }

  return a5 != 0;
}

- (void)trackMessagesForAction:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  if (v6)
  {
    objc_msgSend(v18, "documentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "documentIsEmpty"))
      -[TIFavoniusTypingSessionAnalyzer reportLastMessage](self, "reportLastMessage");
    objc_msgSend(v18, "startTime");
    if (v9 > 0.0)
    {
      objc_msgSend(v18, "endTime");
      if (v10 > 0.0)
      {
        objc_msgSend(v8, "contextBeforeInput");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIFavoniusTypingSessionAnalyzer setLastMessage:](self, "setLastMessage:", v11);

        -[TIFavoniusTypingSessionAnalyzer setLastMessageKeyboardState:](self, "setLastMessageKeyboardState:", v4);
        -[TIFavoniusTypingSessionAnalyzer lastMessageStartTime](self, "lastMessageStartTime");
        v12 = v18;
        if (v13 == -1.0)
        {
          objc_msgSend(v18, "startTime");
          -[TIFavoniusTypingSessionAnalyzer setLastMessageStartTime:](self, "setLastMessageStartTime:");
          v12 = v18;
        }
        objc_msgSend(v12, "endTime");
        -[TIFavoniusTypingSessionAnalyzer setLastMessageEndTime:](self, "setLastMessageEndTime:");
        if (!objc_msgSend(v18, "actionType"))
        {
          objc_msgSend(v18, "acceptedCandidate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "candidate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v17, "length"))
            -[TIFavoniusTypingSessionAnalyzer setLastMessageWordsEntered:](self, "setLastMessageWordsEntered:", -[TIFavoniusTypingSessionAnalyzer lastMessageWordsEntered](self, "lastMessageWordsEntered")+ 1);

        }
      }
    }

  }
}

- (void)reportLastMessage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  TIKBAnalyticsMetricsContext *v8;
  void *v9;
  TIUserModeling *userModel;
  void *v11;
  TIKBAnalyticsMetricsContext *v12;

  -[TIFavoniusTypingSessionAnalyzer lastMessage](self, "lastMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIFavoniusTypingSessionAnalyzer lastMessageStartTime](self, "lastMessageStartTime");
    v5 = v4;
    -[TIFavoniusTypingSessionAnalyzer lastMessageEndTime](self, "lastMessageEndTime");
    v7 = -[TIFavoniusTypingSessionAnalyzer durationInMillisecondsFromStartTime:endTime:](self, "durationInMillisecondsFromStartTime:endTime:", v5, v6);
    v8 = [TIKBAnalyticsMetricsContext alloc];
    -[TIFavoniusTypingSessionAnalyzer lastMessageKeyboardState](self, "lastMessageKeyboardState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TIKBAnalyticsMetricsContext initWithKeyboardState:activeInputModes:testingParameters:](v8, "initWithKeyboardState:activeInputModes:testingParameters:", v9, self->_activeInputModes, self->_testingParameters);

    -[TIUserModeling addIntegerToTransientCounter:forKey:andCandidateLength:andContext:](self->_userModel, "addIntegerToTransientCounter:forKey:andCandidateLength:andContext:", 1, CFSTR("messageCount"), 0, v12);
    userModel = self->_userModel;
    -[TIFavoniusTypingSessionAnalyzer lastMessage](self, "lastMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIUserModeling addIntegerToTransientCounter:forKey:andCandidateLength:andContext:](userModel, "addIntegerToTransientCounter:forKey:andCandidateLength:andContext:", objc_msgSend(v11, "length"), CFSTR("messageLength"), 0, v12);

    -[TIUserModeling addIntegerToTransientCounter:forKey:andCandidateLength:andContext:](self->_userModel, "addIntegerToTransientCounter:forKey:andCandidateLength:andContext:", -[TIFavoniusTypingSessionAnalyzer lastMessageWordsEntered](self, "lastMessageWordsEntered"), CFSTR("messageWords"), 0, v12);
    -[TIUserModeling addIntegerToTransientCounter:forKey:andCandidateLength:andContext:](self->_userModel, "addIntegerToTransientCounter:forKey:andCandidateLength:andContext:", v7, CFSTR("messageDuration"), 0, v12);
    -[TIFavoniusTypingSessionAnalyzer setLastMessage:](self, "setLastMessage:", 0);
    -[TIFavoniusTypingSessionAnalyzer setLastMessageKeyboardState:](self, "setLastMessageKeyboardState:", 0);
    -[TIFavoniusTypingSessionAnalyzer setLastMessageStartTime:](self, "setLastMessageStartTime:", -1.0);
    -[TIFavoniusTypingSessionAnalyzer setLastMessageEndTime:](self, "setLastMessageEndTime:", -1.0);
    -[TIFavoniusTypingSessionAnalyzer setLastMessageWordsEntered:](self, "setLastMessageWordsEntered:", 0);

  }
}

- (NSString)lastMessage
{
  return self->_lastMessage;
}

- (TIFavoniusTypingSessionAnalyzer)initWithUserModel:(id)a3
{
  id v5;
  TIFavoniusTypingSessionAnalyzer *v6;
  TIFavoniusTypingSessionAnalyzer *v7;
  TITypingSession *currentSession;
  NSString *lastMessage;
  NSArray *activeInputModes;
  NSDictionary *testingParameters;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TIFavoniusTypingSessionAnalyzer;
  v6 = -[TIFavoniusTypingSessionAnalyzer init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    currentSession = v6->_currentSession;
    v6->_currentSession = 0;

    objc_storeStrong((id *)&v7->_userModel, a3);
    lastMessage = v7->_lastMessage;
    v7->_lastMessage = 0;

    objc_storeWeak((id *)&v7->_lastMessageKeyboardState, 0);
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v7->_lastMessageStartTime = _Q0;
    v7->_lastMessageWordsEntered = 0;
    activeInputModes = v7->_activeInputModes;
    v7->_activeInputModes = 0;

    testingParameters = v7->_testingParameters;
    v7->_testingParameters = 0;

  }
  return v7;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:alignedSession:](TIStandardTypingSessionConfidenceEvaluator, "evaluateConfidenceInSession:alignedSession:", a3, a4);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastMessageKeyboardState);
  objc_storeStrong((id *)&self->_lastMessage, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_userModel, 0);
  objc_storeStrong((id *)&self->_testingParameters, 0);
  objc_storeStrong((id *)&self->_activeInputModes, 0);
}

+ (id)favoniusTypingSessionAnalyzerForUserModel:(id)a3
{
  id v3;
  TIFavoniusTypingSessionAnalyzer *v4;

  v3 = a3;
  v4 = -[TIFavoniusTypingSessionAnalyzer initWithUserModel:]([TIFavoniusTypingSessionAnalyzer alloc], "initWithUserModel:", v3);

  return v4;
}

- (void)addIntegerToTransientCounter:(int)a3 forKey:(id)a4 andContext:(id)a5 andCandidateString:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;

  v8 = *(_QWORD *)&a3;
  v11 = a4;
  v10 = a5;
  if (objc_msgSend(a6, "length"))
    -[TIUserModeling addIntegerToTransientCounter:forKey:andCandidateLength:andContext:](self->_userModel, "addIntegerToTransientCounter:forKey:andCandidateLength:andContext:", v8, v11);

}

- (void)addDoubleToTransientCounter:(double)a3 forKey:(id)a4 andContext:(id)a5 andCandidateString:(id)a6
{
  id v10;
  id v11;

  v11 = a4;
  v10 = a5;
  if (objc_msgSend(a6, "length"))
    -[TIUserModeling addDoubleToTransientCounter:forKey:andCandidateLength:andContext:](self->_userModel, "addDoubleToTransientCounter:forKey:andCandidateLength:andContext:", v11, a3);

}

- (void)incrementTransientCounterForKey:(id)a3 andContext:(id)a4 andCandidateString:(id)a5
{
  -[TIFavoniusTypingSessionAnalyzer addIntegerToTransientCounter:forKey:andContext:andCandidateString:](self, "addIntegerToTransientCounter:forKey:andContext:andCandidateString:", 1, a3, a4, a5);
}

- (BOOL)isPathable:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  BOOL v20;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3500];
  v7 = a3;
  objc_msgSend(v6, "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "inputLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "isEqualToString:", CFSTR("zh"));

  if (!(_DWORD)v7)
  {
    if ((unint64_t)objc_msgSend(v9, "length") >= 2)
      goto LABEL_7;
LABEL_11:
    v20 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v11);

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0CB3500], "lowercaseLetterCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "rangeOfCharacterFromSet:", v13) != 0x7FFFFFFFFFFFFFFFLL)
  {

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v14);

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_11;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
    goto LABEL_11;
  v19 = objc_msgSend(v5, "keyboardType");
  if ((v19 - 1) >= 2)
  {
    if (v19 == 3)
    {
      v20 = 1;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v20 = objc_msgSend(v5, "userInterfaceIdiom") == 0;
LABEL_12:

  return v20;
}

- (void)updateDurationCounterForWord:(id)a3 forTypingContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  TIFavoniusTypingSessionAnalyzer *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  uint64_t i;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  TIFavoniusTypingSessionAnalyzer *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "acceptedCandidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "candidate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "acceptedCandidate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v12, "isContinuousPathConversion");

  objc_msgSend(v6, "allTouches");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if ((_DWORD)v10)
  {
    if (v14 >= 2)
    {
      objc_msgSend(v6, "allTouches");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timestamp");
      v18 = v17;

      objc_msgSend(v6, "allTouches");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndex:", (v14 - 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timestamp");
      v22 = v21;

      v23 = (int)((v22 - v18) * 1000.0);
      v24 = kFeatureCounterDurationPathedWords;
      v25 = self;
LABEL_24:
      -[TIFavoniusTypingSessionAnalyzer addIntegerToTransientCounter:forKey:andContext:andCandidateString:](v25, "addIntegerToTransientCounter:forKey:andContext:andCandidateString:", v23, v24, v7, v11);
    }
  }
  else if (v14 >= 2)
  {
    v42 = self;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v6, "allTouches");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v27)
    {
      v28 = v27;
      v29 = 0;
      v30 = *(_QWORD *)v44;
      v31 = 0.0;
      v32 = 0.0;
      v33 = 0.0;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v44 != v30)
            objc_enumerationMutation(v26);
          v35 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if (-v29 == (_DWORD)i)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "timestamp");
            v32 = v36;
            objc_msgSend(v35, "timestamp");
            v31 = v37;
          }
          if (!objc_msgSend(v35, "stage"))
          {
            objc_msgSend(v35, "timestamp");
            v32 = v38;
            v39 = v38 - v31;
            if (v39 > 2.5)
              v39 = 2.5;
            v33 = v33 + v39;
          }
          if (objc_msgSend(v35, "stage") == 2 || objc_msgSend(v35, "stage") == 3)
          {
            objc_msgSend(v35, "timestamp");
            v33 = v33 + v40 - v32;
            objc_msgSend(v35, "timestamp");
            v31 = v41;
          }
        }
        v29 += v28;
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v28);
    }
    else
    {
      v33 = 0.0;
    }

    v23 = (int)(v33 * 1000.0);
    v24 = kFeatureCounterDurationTappedWords;
    v25 = v42;
    goto LABEL_24;
  }

}

- (void)logPathedCandidate:(id)a3 forKey:(id)a4 isCompletion:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  id v12;

  v5 = a5;
  v8 = a4;
  objc_msgSend(a3, "candidate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenPathedWordInsertions, v8, v12);
  v11 = &kFeatureValueWithWordLenWordCompletionsPathed;
  if (!v5)
    v11 = &kFeatureValueWithWordLenWholeWordsPathed;
  -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", *v11, v8, v12);

}

- (void)handleWordEntry:(id)a3
{
  TIKBAnalyticsMetricsContext *v4;
  void *v5;
  TIKBAnalyticsMetricsContext *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  v4 = [TIKBAnalyticsMetricsContext alloc];
  objc_msgSend(v24, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TIKBAnalyticsMetricsContext initWithKeyboardState:activeInputModes:testingParameters:](v4, "initWithKeyboardState:activeInputModes:testingParameters:", v5, self->_activeInputModes, self->_testingParameters);

  objc_msgSend(v24, "acceptedCandidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "candidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    -[TIUserModeling addToDurableCounter:forKey:](self->_userModel, "addToDurableCounter:forKey:", 1, kFeatureCounterTotalWordsTyped);
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureCounterWithWordLenWordsTyped, v6, v10);
    objc_msgSend(v24, "acceptedCandidate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TIFavoniusTypingSessionAnalyzer updatePQTCountersForCandidate:withText:andContext:](self, "updatePQTCountersForCandidate:withText:andContext:", v11, v10, v6);

    objc_msgSend(v24, "acceptedCandidate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIFavoniusTypingSessionAnalyzer updateSourceCountersForCandidate:withText:andContext:hasPQTSource:](self, "updateSourceCountersForCandidate:withText:andContext:hasPQTSource:", v13, v10, v6, v12);

    if ((objc_msgSend(v24, "wordEntryType") & 1) != 0)
    {
      -[TIUserModeling addToDurableCounter:forKey:](self->_userModel, "addToDurableCounter:forKey:", 1, kFeatureCounterTotalWordsAutocorrected);
      -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenWordsAutocorrected, v6, v10);
    }
    if ((objc_msgSend(v24, "wordEntryType") & 4) != 0)
    {
      -[TIUserModeling addToDurableCounter:forKey:](self->_userModel, "addToDurableCounter:forKey:", 1, kFeatureCounterTotalWordsFromCandidateBar);
      -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenWordsFromCandidateBar, v6, v10);
    }
    objc_msgSend(v24, "acceptedCandidate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isContinuousPathConversion");

    if (v15)
    {
      -[TIUserModeling addToDurableCounter:forKey:](self->_userModel, "addToDurableCounter:forKey:", 1, kFeatureCounterTotalWordsPathed);
      objc_msgSend(v24, "originalCandidate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v24, "originalCandidate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIFavoniusTypingSessionAnalyzer logPathedCandidate:forKey:isCompletion:](self, "logPathedCandidate:forKey:isCompletion:", v17, v6, objc_msgSend(v24, "isContinuousPathCompletion"));

        objc_msgSend(v24, "originalCandidate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "candidate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenPathedWordsCorrectedFromCandidateBar, v6, v21);
      }
      else
      {
        objc_msgSend(v24, "acceptedCandidate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIFavoniusTypingSessionAnalyzer logPathedCandidate:forKey:isCompletion:](self, "logPathedCandidate:forKey:isCompletion:", v23, v6, objc_msgSend(v24, "isContinuousPathCompletion"));

      }
    }
    else if ((objc_msgSend(v24, "wordEntryType") & 4) == 0)
    {
      if (-[TIFavoniusTypingSessionAnalyzer isPathable:context:](self, "isPathable:context:", v10, v6)
        && (objc_msgSend(v24, "isOOV") & 1) == 0)
      {
        v22 = kFeatureValueWithWordLenPathEligibleWordsTapped;
      }
      else
      {
        v22 = kFeatureValueWithWordLenPathIneligibleWordsTapped;
      }
      -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", v22, v6, v10);
    }
    if (objc_msgSend(v24, "isMultilingual"))
    {
      -[TIUserModeling addToDurableCounter:forKey:](self->_userModel, "addToDurableCounter:forKey:", 1, kFeatureCounterTotalWordsTypedInSecondaryLanguage);
      -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureCounterWordsTypedInSecondaryLanguage, v6, v10);
    }
    if (-[TIKBAnalyticsMetricsContext keyboardType](v6, "keyboardType") == 3)
    {
      -[TIUserModeling addToDurableCounter:forKey:](self->_userModel, "addToDurableCounter:forKey:", 1, kFeatureCounterTotalWordsTypedOnFloatingKeyboard);
      -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureCounterWithWordLenWordsTypedOnFloatingKeyboard, v6, v10);
    }
    -[TIFavoniusTypingSessionAnalyzer updateDurationCounterForWord:forTypingContext:](self, "updateDurationCounterForWord:forTypingContext:", v24, v6);
  }

}

- (BOOL)updatePQTCountersForCandidate:(id)a3 withText:(id)a4 andContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __CFString *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "proactiveTrigger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "triggerSourceType");
      if (v13 >= 3)
      {
        v21 = 0;
      }
      else
      {
        v14 = off_1EA0FBC68[v13];
        if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("LanguageModeling")))
          -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveSourceLanguageModeling, v10, v9);
        if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("ResponseKit")))
          -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveSourceResponseKit, v10, v9);
        v21 = v14;
        if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("TaggedTextField")))
          -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveSourceTaggedTextField, v10, v9, v14);
      }
      v22 = v12;
      TIStatisticsCategoriesForProactiveTrigger(v12);
      obj = (id)objc_claimAutoreleasedReturnValue();
      if (obj)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v25 != v17)
                objc_enumerationMutation(obj);
              v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("1stPerson"), v21, v22))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryFirstPerson, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("3rdPerson")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryThirdPerson, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("contactAnyPhone")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryContactAnyPhone, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("contactSpecificPhone")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryContactSpecificPhone, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("contactFax")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryContactFax, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("contactAnyAddress")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryContactAnyAddress, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("contactAddressHome")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryContactAddressHome, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("contactAddressWork")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryContactAddressWork, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("contactEmail")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryContactEmail, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("contactFaceTime")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryContactFaceTime, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("contactBio")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryContactBio, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("socialMedia")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategorySocialMedia, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("locationAutocompleteSendCurrentButton")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryLocationAutocompleteSendCurrentButton, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("recentGenericAddress")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryRecentGenericAddress, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("recentPhone")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryRecentPhone, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("recentAddress")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryRecentAddress, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("eventAvailability")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryEventAvailability, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("eventNext")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryEventNext, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("money")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryMoney, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("health")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryHealth, v10, v9);
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("navigation")))
                -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenProactiveCategoryNavigation, v10, v9);
            }
            v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v16);
        }
      }

      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return (char)v12;
}

- (void)updateSourceCountersForCandidate:(id)a3 withText:(id)a4 andContext:(id)a5 hasPQTSource:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  __CFString **v12;
  int v13;
  id v14;

  v6 = a6;
  v14 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v14, "isResponseKitCandidate"))
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenCandidateSourceResponseKitRaw, v11, v10);
  if (objc_msgSend(v14, "isEmojiCandidate"))
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenCandidateSourceEmojiRaw, v11, v10);
  if (v6)
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenCandidateSourcePQTRaw, v11, v10);
  if ((objc_msgSend(v14, "sourceMask") & 0x8000) != 0 || (objc_msgSend(v14, "sourceMask") & 0x20000) != 0)
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenCandidateSourceStaticDictionaryRaw, v11, v10);
  if ((objc_msgSend(v14, "sourceMask") & 0x10000) != 0 || (objc_msgSend(v14, "sourceMask") & 0x40000) != 0)
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenCandidateSourceDynamicDictionaryRaw, v11, v10);
  if ((objc_msgSend(v14, "sourceMask") & 4) != 0)
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenCandidateSourceTextReplacementsRaw, v11, v10);
  if ((objc_msgSend(v14, "sourceMask") & 8) != 0)
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenCandidateSourceAddressBookRaw, v11, v10);
  if ((objc_msgSend(v14, "sourceMask") & 0x10) != 0)
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenCandidateSourceNamedEntitiesRaw, v11, v10);
  if ((objc_msgSend(v14, "sourceMask") & 0x20) != 0)
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenCandidateSourceOOVRaw, v11, v10);
  if ((objc_msgSend(v14, "sourceMask") & 0x400) != 0)
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenCandidateSourceSupplementalLexiconRaw, v11, v10);
  if ((objc_msgSend(v14, "sourceMask") & 0x80) != 0)
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenCandidateSourceOffensive, v11, v10);
  if ((objc_msgSend(v14, "sourceMask") & 0x100) != 0)
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenCandidateSourceVulgar, v11, v10);
  if ((objc_msgSend(v14, "sourceMask") & 0x200) != 0)
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenCandidateSourceSensitive, v11, v10);
  if ((objc_msgSend(v14, "isResponseKitCandidate") & 1) != 0)
  {
    v12 = &kFeatureValueWithWordLenCandidateSourceResponseKitOrdered;
LABEL_51:
    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", *v12, v11, v10);
    goto LABEL_52;
  }
  v13 = objc_msgSend(v14, "isEmojiCandidate");
  v12 = &kFeatureValueWithWordLenCandidateSourcePQTOrdered;
  if (v13)
    v12 = &kFeatureValueWithWordLenCandidateSourceEmojiOrdered;
  if ((v13 & 1) != 0 || v6)
    goto LABEL_51;
  if ((objc_msgSend(v14, "sourceMask") & 0x400) != 0)
  {
    v12 = &kFeatureValueWithWordLenCandidateSourceSupplementalLexiconOrdered;
    goto LABEL_51;
  }
  if ((objc_msgSend(v14, "sourceMask") & 0x10) != 0)
  {
    v12 = &kFeatureValueWithWordLenCandidateSourceNamedEntitiesOrdered;
    goto LABEL_51;
  }
  if ((objc_msgSend(v14, "sourceMask") & 8) != 0)
  {
    v12 = &kFeatureValueWithWordLenCandidateSourceAddressBookOrdered;
    goto LABEL_51;
  }
  if ((objc_msgSend(v14, "sourceMask") & 4) != 0)
  {
    v12 = &kFeatureValueWithWordLenCandidateSourceTextReplacementsOrdered;
    goto LABEL_51;
  }
  if ((objc_msgSend(v14, "sourceMask") & 0x20) != 0)
  {
    v12 = &kFeatureValueWithWordLenCandidateSourceOOVOrdered;
    goto LABEL_51;
  }
  if ((objc_msgSend(v14, "sourceMask") & 0x10000) != 0 || (objc_msgSend(v14, "sourceMask") & 0x40000) != 0)
  {
    v12 = &kFeatureValueWithWordLenCandidateSourceDynamicDictionaryOrdered;
    goto LABEL_51;
  }
  if ((objc_msgSend(v14, "sourceMask") & 0x8000) != 0 || (objc_msgSend(v14, "sourceMask") & 0x20000) != 0)
  {
    v12 = &kFeatureValueWithWordLenCandidateSourceStaticDictionaryOrdered;
    goto LABEL_51;
  }
LABEL_52:

}

- (id)deleteLengthMetrics:(id)a3 nextWordEntryCandText:(id)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  __CFString **v14;
  __CFString *v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  v8 = objc_msgSend(v6, "length");
  if (v8 >= v7)
    v9 = v7;
  else
    v9 = v8;
  if ((_DWORD)v9)
  {
    v10 = 0;
    while (1)
    {
      v11 = objc_msgSend(v6, "characterAtIndex:", v10);
      if (v11 != objc_msgSend(v5, "characterAtIndex:", v10))
        break;
      if (v9 == ++v10)
        goto LABEL_8;
    }
    LODWORD(v9) = v10;
    if (!(_DWORD)v10)
      goto LABEL_15;
LABEL_8:
    if (v7 >= 0)
      v12 = v7;
    else
      v12 = v7 + 1;
    v13 = v12 >> 1;
    if ((v7 & 1) != 0 || (_DWORD)v9 != v13)
    {
      if ((int)v9 <= v13)
        v14 = &kFeatureValueWithWordLenMoreThanHalfOfWordDeleted;
      else
        v14 = &kFeatureValueWithWordLenLessThanHalfOfWordDeleted;
    }
    else
    {
      v14 = &kFeatureValueWithWordLenHalfOfWordDeleted;
    }
  }
  else
  {
LABEL_15:
    v14 = &kFeatureValueWithWordLenWholeWordDeleted;
  }
  v15 = *v14;

  return v15;
}

- (void)handleDeleteWord:(id)a3 nextAction:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  TIKBAnalyticsMetricsContext *v15;
  void *v16;
  TIKBAnalyticsMetricsContext *v17;
  id v18;
  void *v19;
  int v20;
  __CFString **v21;
  void *v22;
  TIKBAnalyticsMetricsContext *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  TIKBAnalyticsMetricsContext *v41;
  void *v42;
  id obj;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && !objc_msgSend(v6, "actionType"))
  {
    v8 = v6;
    objc_msgSend(v8, "acceptedCandidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(v8, "acceptedCandidate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isContinuousPathConversion");

      if (v14)
      {
        v15 = [TIKBAnalyticsMetricsContext alloc];
        objc_msgSend(v8, "keyboardState");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[TIKBAnalyticsMetricsContext initWithKeyboardState:activeInputModes:testingParameters:](v15, "initWithKeyboardState:activeInputModes:testingParameters:", v16, self->_activeInputModes, self->_testingParameters);

        if (v7 && !objc_msgSend(v7, "actionType"))
        {
          v18 = v7;
          objc_msgSend(v18, "acceptedCandidate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isContinuousPathConversion");

          v21 = &kFeatureValueWithWordLenPathedWordsCorrectedByDeleteRepath;
          if (!v20)
            v21 = &kFeatureValueWithWordLenPathedWordsCorrectedByDeleteTapped;
          -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", *v21, v17, v12);
          v42 = v18;
          objc_msgSend(v18, "acceptedCandidate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "candidate");
          v23 = v17;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringByTrimmingCharactersInSet:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = v26;
          if (objc_msgSend(v26, "length"))
          {
            v41 = v23;
            objc_msgSend(v8, "candidatesOffered");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "lastObject");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v40 = v29;
            objc_msgSend(v29, "predictions");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
            v31 = 0x1E0CB3000uLL;
            if (v30)
            {
              v32 = v30;
              v44 = *(_QWORD *)v46;
              v39 = v12;
              while (2)
              {
                for (i = 0; i != v32; ++i)
                {
                  v34 = v27;
                  if (*(_QWORD *)v46 != v44)
                    objc_enumerationMutation(obj);
                  objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "candidate", v39);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(v31 + 1280), "whitespaceCharacterSet");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "stringByTrimmingCharactersInSet:", v36);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();

                  v27 = v34;
                  if (objc_msgSend(v34, "isEqualToString:", v37))
                  {
                    v12 = v39;
                    -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenPathedWordsShownInCandidateBar, v41, v39);

                    goto LABEL_21;
                  }

                  v31 = 0x1E0CB3000;
                }
                v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
                v12 = v39;
                if (v32)
                  continue;
                break;
              }
            }
LABEL_21:

            -[TIFavoniusTypingSessionAnalyzer deleteLengthMetrics:nextWordEntryCandText:](self, "deleteLengthMetrics:nextWordEntryCandText:", v12, v27);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v41;
            -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", v38, v41, v12);

          }
          else
          {
            -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenPathedWordsCorrectedByOther, v23, v12);
            v17 = v23;
          }

        }
        else
        {
          -[TIFavoniusTypingSessionAnalyzer incrementTransientCounterForKey:andContext:andCandidateString:](self, "incrementTransientCounterForKey:andContext:andCandidateString:", kFeatureValueWithWordLenPathedWordsCorrectedByOther, v17, v12);
        }

      }
    }

  }
}

- (void)handlePath:(id)a3
{
  id v4;
  TIKBAnalyticsMetricsContext *v5;
  void *v6;
  TIUserModeling *userModel;
  uint64_t v8;
  uint64_t v9;
  TIKBAnalyticsMetricsContext *v10;

  v4 = a3;
  v5 = [TIKBAnalyticsMetricsContext alloc];
  objc_msgSend(v4, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TIKBAnalyticsMetricsContext initWithKeyboardState:activeInputModes:testingParameters:](v5, "initWithKeyboardState:activeInputModes:testingParameters:", v6, self->_activeInputModes, self->_testingParameters);

  userModel = self->_userModel;
  v8 = kFeatureValueWithWordLenCandidatesPathed;
  v9 = objc_msgSend(v4, "syllableCount");

  -[TIUserModeling addIntegerToTransientCounter:forKey:andCandidateLength:andContext:](userModel, "addIntegerToTransientCounter:forKey:andCandidateLength:andContext:", 1, v8, v9, v10);
}

- (int)durationInMillisecondsFromStartTime:(double)a3 endTime:(double)a4
{
  return (int)((a4 - a3) * 1000.0 + 0.5);
}

- (TIUserModeling)userModel
{
  return self->_userModel;
}

- (void)setUserModel:(id)a3
{
  objc_storeStrong((id *)&self->_userModel, a3);
}

- (TITypingSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentSession, a3);
}

- (void)setLastMessage:(id)a3
{
  objc_storeStrong((id *)&self->_lastMessage, a3);
}

- (TIKeyboardState)lastMessageKeyboardState
{
  return (TIKeyboardState *)objc_loadWeakRetained((id *)&self->_lastMessageKeyboardState);
}

- (void)setLastMessageKeyboardState:(id)a3
{
  objc_storeWeak((id *)&self->_lastMessageKeyboardState, a3);
}

- (double)lastMessageStartTime
{
  return self->_lastMessageStartTime;
}

- (void)setLastMessageStartTime:(double)a3
{
  self->_lastMessageStartTime = a3;
}

- (double)lastMessageEndTime
{
  return self->_lastMessageEndTime;
}

- (void)setLastMessageEndTime:(double)a3
{
  self->_lastMessageEndTime = a3;
}

- (int)lastMessageWordsEntered
{
  return self->_lastMessageWordsEntered;
}

- (void)setLastMessageWordsEntered:(int)a3
{
  self->_lastMessageWordsEntered = a3;
}

@end
