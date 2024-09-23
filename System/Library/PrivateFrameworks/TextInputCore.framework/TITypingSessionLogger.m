@implementation TITypingSessionLogger

- (TITypingSessionLogger)init
{
  TITypingSessionLogger *v2;
  uint64_t v3;
  NSMutableArray *typingEvents;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TITypingSessionLogger;
  v2 = -[TITypingSessionLogger init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    typingEvents = v2->_typingEvents;
    v2->_typingEvents = (NSMutableArray *)v3;

  }
  return v2;
}

- (TITypingSessionLogger)initWithCoder:(id)a3
{
  id v4;
  TITypingSessionLogger *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *typingEvents;
  uint64_t v17;
  TIKeyboardInteractionProtocol *savedSession;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TITypingSessionLogger;
  v5 = -[TITypingSessionLogger init](&v23, sel_init);
  if (v5)
  {
    v22 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v20 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v21, v20, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("typingEvents"));
    v15 = objc_claimAutoreleasedReturnValue();
    typingEvents = v5->_typingEvents;
    v5->_typingEvents = (NSMutableArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typingSession"));
    v17 = objc_claimAutoreleasedReturnValue();
    savedSession = v5->_savedSession;
    v5->_savedSession = (TIKeyboardInteractionProtocol *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_typingEvents, CFSTR("typingEvents"));
}

- (unint64_t)eventCount
{
  return -[NSMutableArray count](self->_typingEvents, "count");
}

- (void)addKeyInput:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableArray *typingEvents;
  TIKeyboardInteractionProtocolEventAddKeyInput *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  IXADefaultLogFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[TITypingSessionLogger logDetailsForKeyboardState:](self, "logDetailsForKeyboardState:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%s Add Key Input: %@, KeyboardState=%@"), "-[TITypingSessionLogger addKeyInput:keyboardState:]", v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v13;
    _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  typingEvents = self->_typingEvents;
  v10 = -[TIKeyboardInteractionProtocolEventAddKeyInput initWithKeyInput:keyboardState:]([TIKeyboardInteractionProtocolEventAddKeyInput alloc], "initWithKeyInput:keyboardState:", v6, v7);
  -[NSMutableArray addObject:](typingEvents, "addObject:", v10);

}

- (void)addTouchEvent:(id)a3
{
  NSMutableArray *typingEvents;
  id v4;
  TIKeyboardInteractionProtocolEventAddTouchEvent *v5;

  typingEvents = self->_typingEvents;
  v4 = a3;
  v5 = -[TIKeyboardInteractionProtocolEventAddTouchEvent initWithTouchEvent:]([TIKeyboardInteractionProtocolEventAddTouchEvent alloc], "initWithTouchEvent:", v4);

  -[NSMutableArray addObject:](typingEvents, "addObject:", v5);
}

- (void)addDrawInputWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4
{
  NSMutableArray *typingEvents;
  id v6;
  TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount *v7;

  typingEvents = self->_typingEvents;
  v6 = a4;
  v7 = -[TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount initWithSyllableCount:keyboardState:]([TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount alloc], "initWithSyllableCount:keyboardState:", a3, v6);

  -[NSMutableArray addObject:](typingEvents, "addObject:", v7);
}

- (void)candidatesOffered:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableArray *typingEvents;
  TIKeyboardInteractionProtocolEventCandidatesOffered *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    IXADefaultLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "corrections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "autocorrection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predictions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypingSessionLogger logDetailsForKeyboardState:](self, "logDetailsForKeyboardState:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%s Candidates offered, AC=%@, Predictions=%@, KeyboardState=%@"), "-[TITypingSessionLogger candidatesOffered:keyboardState:]", v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v16;
      _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  typingEvents = self->_typingEvents;
  v10 = -[TIKeyboardInteractionProtocolEventCandidatesOffered initWithCandidatesOffered:keyboardState:]([TIKeyboardInteractionProtocolEventCandidatesOffered alloc], "initWithCandidatesOffered:keyboardState:", v6, v7);
  -[NSMutableArray addObject:](typingEvents, "addObject:", v10);

}

- (void)acceptingCandidateWithTrigger:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *typingEvents;
  TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  IXADefaultLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Accepting candidate, trigger=%@"), "-[TITypingSessionLogger acceptingCandidateWithTrigger:]", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v8;
    _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  typingEvents = self->_typingEvents;
  v7 = -[TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger initWithCandidateAcceptedTrigger:]([TIKeyboardInteractionProtocolEventAcceptingCandidateWithTrigger alloc], "initWithCandidateAcceptedTrigger:", v4);
  -[NSMutableArray addObject:](typingEvents, "addObject:", v7);

}

- (void)candidateAccepted:(id)a3 withInput:(id)a4 documentState:(id)a5 inputContext:(id)a6 inputStem:(id)a7 predictionBarHit:(BOOL)a8 useCandidateSelection:(BOOL)a9 candidateIndex:(int64_t)a10 keyboardState:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  NSMutableArray *typingEvents;
  TIKeyboardInteractionProtocolEventCandidateAccepted *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v29 = a8;
  v32 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a11;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  IXADefaultLogFacility();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    -[TITypingSessionLogger logDetailsForKeyboardState:](self, "logDetailsForKeyboardState:", v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%s Candidate accepted, Cand=%@, KeyboardState=%@"), "-[TITypingSessionLogger candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]", v16, v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v27;
    _os_log_debug_impl(&dword_1DA6F2000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  typingEvents = self->_typingEvents;
  LOBYTE(v25) = a9;
  v24 = -[TIKeyboardInteractionProtocolEventCandidateAccepted initWithCandidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:]([TIKeyboardInteractionProtocolEventCandidateAccepted alloc], "initWithCandidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:", v16, v21, v20, v19, v18, v29, v25, a10, v17);

  -[NSMutableArray addObject:](typingEvents, "addObject:", v24);
}

- (void)changingContextWithTrigger:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *typingEvents;
  TIKeyboardInteractionProtocolEventChangingContextWithTrigger *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  IXADefaultLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Changing context, trigger=%@"), "-[TITypingSessionLogger changingContextWithTrigger:]", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v8;
    _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  typingEvents = self->_typingEvents;
  v7 = -[TIKeyboardInteractionProtocolEventChangingContextWithTrigger initWithContextChangeTrigger:]([TIKeyboardInteractionProtocolEventChangingContextWithTrigger alloc], "initWithContextChangeTrigger:", v4);
  -[NSMutableArray addObject:](typingEvents, "addObject:", v7);

}

- (void)contextDidChange:(id)a3 wordDelete:(BOOL)a4 cursorMoved:(BOOL)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 range:(_NSRange)a8 selectionLocation:(unint64_t)a9 keyboardState:(id)a10
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSMutableArray *typingEvents;
  TIKeyboardInteractionProtocolEventContextDidChange *v20;
  const char *v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v26 = a6;
  v11 = a5;
  v12 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v15 = a10;
  v16 = a7;
  v17 = a3;
  IXADefaultLogFacility();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v21 = "NO";
    if (v12)
      v21 = "YES";
    v22 = v21;
    v23 = (void *)MEMORY[0x1E0CB3940];
    -[TITypingSessionLogger logDetailsForKeyboardState:](self, "logDetailsForKeyboardState:", v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%s Context Did Change: wordDelete=%s, KeyboardState=%@"), "-[TITypingSessionLogger contextDidChange:wordDelete:cursorMoved:extendsPriorWord:inWord:range:selectionLocation:keyboardState:]", v22, v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v24;
    _os_log_debug_impl(&dword_1DA6F2000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  typingEvents = self->_typingEvents;
  v20 = -[TIKeyboardInteractionProtocolEventContextDidChange initWithContext:wordDelete:cursorMoved:extendsPriorWord:inWord:range:selectionLocation:keyboardState:]([TIKeyboardInteractionProtocolEventContextDidChange alloc], "initWithContext:wordDelete:cursorMoved:extendsPriorWord:inWord:range:selectionLocation:keyboardState:", v17, v12, v11, v26, v16, a8.location, a8.length, a9, v15);

  -[NSMutableArray addObject:](typingEvents, "addObject:", v20);
}

- (void)layoutDidChange:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableArray *typingEvents;
  TIKeyboardInteractionProtocolEventLayoutDidChange *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  IXADefaultLogFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = objc_msgSend(v6, "firstKeyString");
    -[TITypingSessionLogger logDetailsForKeyboardState:](self, "logDetailsForKeyboardState:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%s Layout Did Change: firstKeyString=%s, KeyboardState=%@"), "-[TITypingSessionLogger layoutDidChange:keyboardState:]", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v14;
    _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  typingEvents = self->_typingEvents;
  v10 = -[TIKeyboardInteractionProtocolEventLayoutDidChange initWithLayout:keyboardState:]([TIKeyboardInteractionProtocolEventLayoutDidChange alloc], "initWithLayout:keyboardState:", v6, v7);
  -[NSMutableArray addObject:](typingEvents, "addObject:", v10);

}

- (void)setClientID:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableArray *typingEvents;
  TIKeyboardInteractionProtocolEventSetClientID *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  IXADefaultLogFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[TITypingSessionLogger logDetailsForKeyboardState:](self, "logDetailsForKeyboardState:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%s Set Client ID: %@, KeyboardState=%@"), "-[TITypingSessionLogger setClientID:keyboardState:]", v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v13;
    _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  typingEvents = self->_typingEvents;
  v10 = -[TIKeyboardInteractionProtocolEventSetClientID initWithClientID:keyboardState:]([TIKeyboardInteractionProtocolEventSetClientID alloc], "initWithClientID:keyboardState:", v6, v7);
  -[NSMutableArray addObject:](typingEvents, "addObject:", v10);

}

- (BOOL)shouldPrintEvent:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            objc_opt_isKindOfClass();
          }
        }
      }
    }
    v4 = 0;
  }

  return v4;
}

- (void)sendTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
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

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_typingEvents;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "sendTo:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)logDetailsForKeyboardState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetLanguage();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "inputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetRegion();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "layoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "softwareLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(v3, "hardwareKeyboardMode");
  v10 = objc_msgSend(v3, "floatingKeyboardMode");
  v11 = objc_msgSend(v3, "splitKeyboardMode");
  v12 = objc_msgSend(v3, "landscapeOrientation");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@|%d|%d|%d|%d|%@"), v5, v7, v8, v10, v11, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)saveRecording
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (TI_IS_INTERNAL_INSTALL::once_token != -1)
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
  if (TI_IS_INTERNAL_INSTALL::is_internal_install)
  {
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v21);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v21;
    if (v4)
    {
      IXADefaultLogFacility();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "description");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("%s failed to store session in file: %@"), "-[TITypingSessionLogger saveRecording]", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v8;
        _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    else
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
      -[NSObject stringForKey:](v5, "stringForKey:", CFSTR("typingSessionRecordingName"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = &stru_1EA1081D0;
      if (v9)
        v11 = (__CFString *)v9;
      v12 = v11;

      if (!-[__CFString length](v12, "length"))
      {
        v13 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v13, "setDateFormat:", CFSTR("MM-dd-HH-mm"));
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringFromDate:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v12 = (__CFString *)v15;
      }
      -[TITypingSessionLogger temporaryKeyboardsDirectory](self, "temporaryKeyboardsDirectory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("typingSessionLog-%@.data"), v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingPathComponent:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "writeToFile:atomically:", v18, 1);
    }

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
    if (objc_msgSend(v19, "BOOLForKey:", CFSTR("typingSessionNotificationsEnabled")))
    {
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.keyboard.inputAnalytics.sessionRecordingDidComplete"), 0, 0, 1);

    }
  }
}

- (id)temporaryKeyboardsDirectory
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/Keyboard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v6);

  return v3;
}

- (id)savedSession
{
  return self->_savedSession;
}

- (NSArray)typingEvents
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingEvents, 0);
  objc_storeStrong((id *)&self->_savedSession, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
