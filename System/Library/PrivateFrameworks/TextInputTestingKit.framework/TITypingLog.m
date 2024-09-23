@implementation TITypingLog

- (TITypingLog)initWithDebug:(BOOL)a3
{
  _BOOL4 v3;
  TITypingLog *v4;
  NSMutableArray *v5;
  NSMutableArray *keystrokesForTokens;
  NSMutableArray *v7;
  NSMutableArray *correctedTransliterationForTokens;
  NSMutableArray *v9;
  NSMutableArray *intendedTransliterationForTokens;
  uint64_t v11;
  NSMutableDictionary *pathsForTokens;
  uint64_t v13;
  NSMutableDictionary *debugData;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TITypingLog;
  v4 = -[TITypingLog init](&v16, sel_init);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    keystrokesForTokens = v4->_keystrokesForTokens;
    v4->_keystrokesForTokens = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    correctedTransliterationForTokens = v4->_correctedTransliterationForTokens;
    v4->_correctedTransliterationForTokens = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    intendedTransliterationForTokens = v4->_intendedTransliterationForTokens;
    v4->_intendedTransliterationForTokens = v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    pathsForTokens = v4->_pathsForTokens;
    v4->_pathsForTokens = (NSMutableDictionary *)v11;

    v4->_isTransliterating = 0;
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v13 = objc_claimAutoreleasedReturnValue();
      debugData = v4->_debugData;
      v4->_debugData = (NSMutableDictionary *)v13;

    }
  }
  return v4;
}

- (TITypingLog)init
{
  return -[TITypingLog initWithDebug:](self, "initWithDebug:", 0);
}

- (void)beginToken
{
  void *v3;
  NSMutableArray *keystrokesForTokens;
  void *v5;
  NSMutableArray *correctedTransliterationForTokens;
  void *v7;
  NSMutableArray *intendedTransliterationForTokens;
  id v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingLog setCurrentKeystrokeSequence:](self, "setCurrentKeystrokeSequence:", v3);

  keystrokesForTokens = self->_keystrokesForTokens;
  -[TITypingLog currentKeystrokeSequence](self, "currentKeystrokeSequence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](keystrokesForTokens, "addObject:", v5);

  correctedTransliterationForTokens = self->_correctedTransliterationForTokens;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24FD49B78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](correctedTransliterationForTokens, "addObject:", v7);

  intendedTransliterationForTokens = self->_intendedTransliterationForTokens;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24FD49B78);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](intendedTransliterationForTokens, "addObject:", v9);

}

- (void)setTokenIndex:(unint64_t)a3
{
  NSMutableArray *i;
  unint64_t v6;

  for (i = self->_keystrokesForTokens; -[NSMutableArray count](i, "count") <= a3; i = self->_keystrokesForTokens)
    -[TITypingLog beginToken](self, "beginToken");
  v6 = a3 + 1;
  while (v6 < -[NSMutableArray count](self->_keystrokesForTokens, "count"))
    -[TITypingLog revisitPreviousToken](self, "revisitPreviousToken");
}

- (void)revisitPreviousToken
{
  void *v3;
  id v4;

  -[NSMutableArray lastObject](self->_keystrokesForTokens, "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->_keystrokesForTokens, "removeLastObject");
  -[NSMutableArray lastObject](self->_keystrokesForTokens, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);
  -[TITypingLog setCurrentKeystrokeSequence:](self, "setCurrentKeystrokeSequence:", v3);

}

- (void)beginKeystrokeWithIntendedKey:(id)a3 touchEvent:(id)a4 touchError:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = (__CFString *)a3;
  +[TIKeystrokeRecord keystrokeRecord](TIKeystrokeRecord, "keystrokeRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingLog setCurrentKeystroke:](self, "setCurrentKeystroke:", v11);

  -[TITypingLog currentKeystrokeSequence](self, "currentKeystrokeSequence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingLog currentKeystroke](self, "currentKeystroke");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  if (v10)
    v14 = v10;
  else
    v14 = &stru_24FD49B78;
  -[TITypingLog currentKeystroke](self, "currentKeystroke");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIntendedKey:", v14);

  v16 = v9;
  if (!v9)
  {
    +[TITypingLog emptyTouchEventForLogging](TITypingLog, "emptyTouchEventForLogging");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TITypingLog currentKeystroke](self, "currentKeystroke");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTouch:", v16);

  if (!v9)
  v19 = v8;
  if (!v8)
  {
    +[TIPointError errorWithErrorVector:](TIPointError, "errorWithErrorVector:", 0.0, 0.0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[TITypingLog currentKeystroke](self, "currentKeystroke");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTouchError:", v19);

  if (!v8)
}

- (void)beginKeystrokeWithIntendedKey:(id)a3 touchEvent:(id)a4 touchError:(id)a5 documentBefore:(id)a6
{
  __CFString *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[TIKeystrokeRecord keystrokeRecord](TIKeystrokeRecord, "keystrokeRecord");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingLog setCurrentKeystroke:](self, "setCurrentKeystroke:", v14);

  -[TITypingLog currentKeystrokeSequence](self, "currentKeystrokeSequence");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingLog currentKeystroke](self, "currentKeystroke");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  if (v10)
    v17 = v10;
  else
    v17 = &stru_24FD49B78;
  -[TITypingLog currentKeystroke](self, "currentKeystroke");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIntendedKey:", v17);

  v19 = v11;
  if (!v11)
  {
    +[TITypingLog emptyTouchEventForLogging](TITypingLog, "emptyTouchEventForLogging");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TITypingLog currentKeystroke](self, "currentKeystroke");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTouch:", v19);

  if (!v11)
  v21 = v12;
  if (!v12)
  {
    +[TIPointError errorWithErrorVector:](TIPointError, "errorWithErrorVector:", 0.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TITypingLog currentKeystroke](self, "currentKeystroke");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTouchError:", v21);

  if (!v12)
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v23 = v13;
  v38 = v23;
  if ((unint64_t)objc_msgSend(v23, "length") >= 0x21)
  {
    v24 = objc_msgSend(v23, "length");
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __82__TITypingLog_beginKeystrokeWithIntendedKey_touchEvent_touchError_documentBefore___block_invoke;
    v30 = &unk_24FD48400;
    v31 = v23;
    v32 = &v33;
    objc_msgSend(v31, "enumerateSubstringsInRange:options:usingBlock:", 0, v24, 259, &v27);

  }
  v25 = v34[5];
  -[TITypingLog currentKeystroke](self, "currentKeystroke", v27, v28, v29, v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDocumentState:", v25);

  _Block_object_dispose(&v33, 8);
}

- (void)finishKeystrokeWithTouchedKey:(id)a3 touchEvent:(id)a4 insertedKey:(id)a5 predictionBarState:(id)a6 inlineCompletionBarState:(id)a7
{
  const __CFString *v12;
  id v13;
  id v14;
  __CFString *v15;
  id v16;
  id v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  if (a3)
    v12 = (const __CFString *)a3;
  else
    v12 = CFSTR("<NoKey>");
  v13 = a7;
  v14 = a6;
  v15 = (__CFString *)a5;
  v16 = a4;
  v17 = a3;
  -[TITypingLog currentKeystroke](self, "currentKeystroke");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTouchedKey:", v12);

  if (v15)
    v19 = v15;
  else
    v19 = &stru_24FD49B78;
  -[TITypingLog currentKeystroke](self, "currentKeystroke");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setInsertedKey:", v19);

  v21 = v16;
  if (!v16)
  {
    +[TITypingLog emptyTouchEventForLogging](TITypingLog, "emptyTouchEventForLogging");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TITypingLog currentKeystroke](self, "currentKeystroke");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTouch:", v21);

  if (!v16)
  v23 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TITypingLog currentKeystroke](self, "currentKeystroke");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPredictionBarState:", v23);

  if (!v14)
  v26 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[TITypingLog currentKeystroke](self, "currentKeystroke");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setInlineCompletionBarState:", v26);

  if (!v13)
}

- (void)finishKeystrokeWithTouchedKey:(id)a3 touchEvent:(id)a4 insertedKey:(id)a5
{
  -[TITypingLog finishKeystrokeWithTouchedKey:touchEvent:insertedKey:predictionBarState:inlineCompletionBarState:](self, "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:predictionBarState:inlineCompletionBarState:", a3, a4, a5, 0, 0);
}

- (void)registerPathStringAsKeyStrokes:(id)a3 path:(id)a4 predictionBarState:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v15, "length"))
  {
    v10 = 0;
    v11 = 1;
    do
    {
      objc_msgSend(v15, "substringWithRange:", v10, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypingLog beginKeystrokeWithIntendedKey:touchEvent:touchError:](self, "beginKeystrokeWithIntendedKey:touchEvent:touchError:", 0, 0, 0);
      -[TITypingLog finishKeystrokeWithTouchedKey:touchEvent:insertedKey:predictionBarState:inlineCompletionBarState:](self, "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:predictionBarState:inlineCompletionBarState:", v12, 0, v12, v9, 0);

      v10 = v11;
    }
    while (objc_msgSend(v15, "length") != v11++);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_keystrokesForTokens, "count") - 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pathsForTokens, "setObject:forKeyedSubscript:", v8, v14);

}

- (void)logAcceptedCandidate:(id)a3
{
  -[TITypingLog logAcceptedCandidate:intendedTransliterationCandidate:](self, "logAcceptedCandidate:intendedTransliterationCandidate:", a3, 0);
}

- (void)logAcceptedCandidate:(id)a3 intendedTransliterationCandidate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%@}"), v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingLog beginKeystrokeWithIntendedKey:touchEvent:touchError:](self, "beginKeystrokeWithIntendedKey:touchEvent:touchError:", v7, 0, 0);
  -[TITypingLog finishKeystrokeWithTouchedKey:touchEvent:insertedKey:](self, "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:", v7, 0, &stru_24FD49B78);
  if (v6)
  {
    self->_isTransliterating = 1;
    -[NSMutableArray lastObject](self->_correctedTransliterationForTokens, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v10);

    -[NSMutableArray lastObject](self->_intendedTransliterationForTokens, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:", v6);

  }
}

- (void)logRejectedAutocorrection
{
  -[TITypingLog beginKeystrokeWithIntendedKey:touchEvent:touchError:](self, "beginKeystrokeWithIntendedKey:touchEvent:touchError:", CFSTR("<Reject>"), 0, 0);
  -[TITypingLog finishKeystrokeWithTouchedKey:touchEvent:insertedKey:](self, "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:", CFSTR("<Reject>"), 0, &stru_24FD49B78);
}

- (void)logAutocorrectionInserted
{
  -[TITypingLog beginKeystrokeWithIntendedKey:touchEvent:touchError:](self, "beginKeystrokeWithIntendedKey:touchEvent:touchError:", CFSTR("<Autocorrect>"), 0, 0);
  -[TITypingLog finishKeystrokeWithTouchedKey:touchEvent:insertedKey:](self, "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:", CFSTR("<Autocorrect>"), 0, &stru_24FD49B78);
}

- (void)enumerateKeystrokesAndPathsForTokensWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TITypingLog keystrokesForTokens](self, "keystrokesForTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__TITypingLog_enumerateKeystrokesAndPathsForTokensWithBlock___block_invoke;
  v7[3] = &unk_24FD48428;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (id)getDebugData
{
  return self->_debugData;
}

- (void)addDebugObject:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *debugData;

  debugData = self->_debugData;
  if (debugData)
    -[NSMutableDictionary setObject:forKey:](debugData, "setObject:forKey:", a3, a4);
}

- (id)getDebugObject:(id)a3
{
  void *debugData;

  debugData = self->_debugData;
  if (debugData)
  {
    objc_msgSend(debugData, "objectForKey:", a3);
    debugData = (void *)objc_claimAutoreleasedReturnValue();
  }
  return debugData;
}

- (BOOL)isDebugEnabled
{
  return self->_debugData != 0;
}

- (BOOL)adjustForContinuousPath
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = -[NSMutableArray count](self->_currentKeystrokeSequence, "count");
  if (v3 < 2)
    return 0;
  -[NSMutableArray objectAtIndex:](self->_currentKeystrokeSequence, "objectAtIndex:", (v3 - 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "touchedKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray objectAtIndex:](self->_currentKeystrokeSequence, "objectAtIndex:", (v3 - 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "touchedKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length") == 1
    && objc_msgSend(v7, "length") == 1
    && (objc_msgSend(v5, "characterAtIndex:", 0), TICharIsSpace())
    && (objc_msgSend(v7, "characterAtIndex:", 0), TICharIsAlphaNumeric()))
  {
    -[NSMutableArray removeLastObject](self->_currentKeystrokeSequence, "removeLastObject");
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)correctedTransliterationSequence
{
  if (self->_isTransliterating)
    return self->_correctedTransliterationForTokens;
  else
    return 0;
}

- (id)intendedTransliterationSequence
{
  if (self->_isTransliterating)
    return self->_intendedTransliterationForTokens;
  else
    return 0;
}

- (NSArray)keystrokesForTokens
{
  return &self->_keystrokesForTokens->super;
}

- (NSMutableArray)currentKeystrokeSequence
{
  return self->_currentKeystrokeSequence;
}

- (void)setCurrentKeystrokeSequence:(id)a3
{
  objc_storeStrong((id *)&self->_currentKeystrokeSequence, a3);
}

- (TIKeystrokeRecord)currentKeystroke
{
  return self->_currentKeystroke;
}

- (void)setCurrentKeystroke:(id)a3
{
  objc_storeStrong((id *)&self->_currentKeystroke, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentKeystroke, 0);
  objc_storeStrong((id *)&self->_currentKeystrokeSequence, 0);
  objc_storeStrong((id *)&self->_debugData, 0);
  objc_storeStrong((id *)&self->_intendedTransliterationForTokens, 0);
  objc_storeStrong((id *)&self->_correctedTransliterationForTokens, 0);
  objc_storeStrong((id *)&self->_pathsForTokens, 0);
  objc_storeStrong((id *)&self->_keystrokesForTokens, 0);
}

void __61__TITypingLog_enumerateKeystrokesAndPathsForTokensWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __82__TITypingLog_beginKeystrokeWithIntendedKey_touchEvent_touchError_documentBefore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v10 = objc_msgSend(*(id *)(a1 + 32), "length");
  if (a3)
  {
    if ((unint64_t)(v10 - a3) >= 0x21)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 32), "substringFromIndex:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("...%@"), v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      *a7 = 1;
    }
  }
}

+ (id)typingLog
{
  return +[TITypingLog typingLogWithDebug:](TITypingLog, "typingLogWithDebug:", 0);
}

+ (id)typingLogWithDebug:(BOOL)a3
{
  return -[TITypingLog initWithDebug:]([TITypingLog alloc], "initWithDebug:", a3);
}

+ (id)emptyTouchEventForLogging
{
  return (id)objc_msgSend(MEMORY[0x24BEB4E68], "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 7, 0, -1, -1.0, -1.0, 0.0, 0.0);
}

@end
