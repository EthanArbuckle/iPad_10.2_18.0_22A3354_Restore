@implementation TIKeyboardTyper

- (TIKeyboardTyper)init
{
  return -[TIKeyboardTyper initWithInputMode:](self, "initWithInputMode:", 0);
}

- (TIKeyboardTyper)initWithInputMode:(id)a3
{
  id v5;
  TIKeyboardTyper *v6;
  TIKeyboardTyper *v7;
  ACTKeyboardController *v8;
  ACTKeyboardController *keyboardController;
  void *v10;
  uint64_t v11;
  NSLocale *locale;
  uint64_t v13;
  ACTUserActionStreaming *userActionStream;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TIKeyboardTyper;
  v6 = -[TIKeyboardTyper init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inputMode, a3);
    v8 = -[ACTKeyboardController initWithInputMode:]([ACTKeyboardController alloc], "initWithInputMode:", v5);
    keyboardController = v7->_keyboardController;
    v7->_keyboardController = v8;

    objc_msgSend(v5, "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v11;

    v7->_maxPredictions = 3;
    v7->_touchPathID = 1;
    +[ACTUserActionStreamFactory userActionStreamWithParameters:delegate:](ACTUserActionStreamFactory, "userActionStreamWithParameters:delegate:", &unk_24FD5FD90, v7);
    v13 = objc_claimAutoreleasedReturnValue();
    userActionStream = v7->_userActionStream;
    v7->_userActionStream = (ACTUserActionStreaming *)v13;

    -[ACTUserActionStreaming setDelegate:](v7->_userActionStream, "setDelegate:", v7);
    -[TIKeyboardTyper setClientIdentifier:](v7, "setClientIdentifier:", CFSTR("testTyper"));
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TIKeyboardTyper inputManager](self, "inputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardTyper;
  -[TIKeyboardTyper dealloc](&v4, sel_dealloc);
}

- (void)tearDown
{
  void *v3;
  ACTKeyboardController *keyboardController;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tearDown");

  keyboardController = self->_keyboardController;
  self->_keyboardController = 0;

}

- (void)linkWithUserActionStream:(id)a3
{
  ACTUserActionStreaming *v5;
  ACTUserActionStreaming *userActionStream;
  ACTKeyboardController *keyboardController;
  void *v8;
  ACTUserActionStreaming *v9;

  v5 = (ACTUserActionStreaming *)a3;
  userActionStream = self->_userActionStream;
  if (userActionStream != v5)
  {
    v9 = v5;
    -[ACTUserActionStreaming setDelegate:](userActionStream, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_userActionStream, a3);
    -[ACTUserActionStreaming setDelegate:](self->_userActionStream, "setDelegate:", self);
    keyboardController = self->_keyboardController;
    -[ACTUserActionStreaming errorGenerator](self->_userActionStream, "errorGenerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setKeyboardInfoDelgate:", keyboardController);

    v5 = v9;
  }

}

- (TIKeyboardTyperUserModel)userModel
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper userActionStream](self, "userActionStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIKeyboardTyperUserModel *)v3;
}

- (void)setUserModel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardTyper userActionStream](self, "userActionStream");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserModel:", v4);

}

- (TIErrorGenerator)errorGenerator
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper userActionStream](self, "userActionStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIErrorGenerator *)v3;
}

- (void)setErrorGenerator:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TIKeyboardTyper userActionStream](self, "userActionStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setErrorGenerator:", v5);

  objc_msgSend(v5, "setKeyboardInfoDelgate:", self->_keyboardController);
}

- (BOOL)lastInputWasSelection
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lastInputWasSelection");

  return v3;
}

- (void)setLastInputWasSelection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastInputWasSelection:", v3);

}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x2348A8D30](self, a2);
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", 0.0);
  -[TIKeyboardTyper userActionStream](self, "userActionStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIntendedText:", &stru_24FD49B78);

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reset");

  -[TIKeyboardTyper userPersona](self, "userPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyplane");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateFromKeyplane:", v8);

  objc_autoreleasePoolPop(v3);
}

- (void)syncToDocumentState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", 0.0);
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncToDocumentState:", v4);

}

- (void)syncToEmptyDocument
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB4D20]), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", &stru_24FD49B78, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
  -[TIKeyboardTyper syncToDocumentState:](self, "syncToDocumentState:", v3);

}

- (void)suspendAndResume
{
  void *v3;
  id v4;

  -[TIKeyboardTyper inputManager](self, "inputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[TIKeyboardTyper inputManager](self, "inputManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resume");

}

- (void)attemptToTypeText:(id)a3
{
  -[TIKeyboardTyper attemptToTypeText:typingLog:](self, "attemptToTypeText:typingLog:", a3, 0);
}

- (void)attemptToTypeWithLog:(id)a3
{
  TIProgressTracker *v4;
  TIProgressTracker *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FILE **v10;
  void *v11;
  void *v12;
  void *v13;
  FILE *v14;
  id v15;
  void *v16;
  FILE *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  FILE *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  FILE *v32;
  id v33;
  id v34;

  v34 = a3;
  if ((TILogProblemSentencesToStdout() & 1) != 0
    || (-[TIKeyboardTyper badSentenceLogFilePath](self, "badSentenceLogFilePath"),
        v4 = (TIProgressTracker *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = [TIProgressTracker alloc];
    -[TIKeyboardTyper userActionStream](self, "userActionStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intendedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardTyper badSentenceLogFilePath](self, "badSentenceLogFilePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[TIProgressTracker initWithIntendedString:repeatLimit:timeout:badSentencePath:](v5, "initWithIntendedString:repeatLimit:timeout:badSentencePath:", v7, 4, v8, 1500.0);

  }
  v9 = 0;
  v10 = (FILE **)MEMORY[0x24BDAC8E8];
  do
  {
    v11 = v9;
    -[TIKeyboardTyper userActionStream](self, "userActionStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nextUserAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      break;
    v13 = (void *)MEMORY[0x2348A8D30]();
    objc_msgSend(v34, "setTokenIndex:", objc_msgSend(v9, "inputSegment"));
    if (-[TIKeyboardTyper warnIfSelectingPopupVariant](self, "warnIfSelectingPopupVariant"))
    {
      NSClassFromString(CFSTR("ACTSelectPopupVariant"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (FILE *)*MEMORY[0x24BDAC8D8];
        objc_msgSend(v9, "description");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        fprintf(v14, "WARNING! Typer is selecting a pop-up key variant: %s. This may indicate a keyboard layout mis-configuration.\n", (const char *)objc_msgSend(v15, "UTF8String"));

      }
    }
    -[TIKeyboardTyper predictationBarDebugString](self, "predictationBarDebugString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      && ((TIPrintTypingTranscriptToStdout() & 1) != 0
       || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript")))
    {
      fputs((const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"), *v10);
    }
    if ((TIPrintTypingTranscriptToStdout() & 1) != 0
      || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"))
    {
      v17 = *v10;
      objc_msgSend(v9, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length") - 1;

      if (v20 >= 0x2D)
        v21 = 45;
      else
        v21 = v20;
      objc_msgSend(v18, "substringToIndex:", v21);
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v17, "%-45s\t", (const char *)objc_msgSend(v22, "UTF8String"));

    }
    objc_msgSend(v9, "applyWithTyper:log:", self, v34);
    if ((TIPrintTypingTranscriptToStdout() & 1) != 0
      || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"))
    {
      v23 = *v10;
      -[TIKeyboardTyper text](self, "text");
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v23, ">>> %s", (const char *)objc_msgSend(v24, "UTF8String"));

    }
    -[TIKeyboardTyper keyboardController](self, "keyboardController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "justAcceptedAutocorrection");

    if (v26)
    {
      if ((TIPrintTypingTranscriptToStdout() & 1) != 0
        || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"))
      {
        fwrite("\t\t\t<autocorrect>", 0x10uLL, 1uLL, *v10);
      }
      -[TIKeyboardTyper keyboardController](self, "keyboardController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setJustAcceptedAutocorrection:", 0);

      objc_msgSend(v34, "logAutocorrectionInserted");
    }
    if ((TIPrintTypingTranscriptToStdout() & 1) != 0
      || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"))
    {
      fputc(10, *v10);
    }
    v28 = (void *)MEMORY[0x24BDD17C8];
    -[TIKeyboardTyper text](self, "text");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithString:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[TIProgressTracker shouldStopAfterAddingStateString:](v4, "shouldStopAfterAddingStateString:", v30);

    objc_autoreleasePoolPop(v13);
  }
  while (!v31);
  if (-[TIProgressTracker stoppageReason](v4, "stoppageReason") == 3)
    -[TIProgressTracker saveBadSentenceAndTranscript:](v4, "saveBadSentenceAndTranscript:", -[TIProgressTracker stoppageReason](v4, "stoppageReason"));
  if ((TIPrintTypingTranscriptToStdout() & 1) != 0
    || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"))
  {
    v32 = *v10;
    -[TIKeyboardTyper text](self, "text");
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(v32, "%-45s\t>>> %s。\t\t END\n\n", " ", (const char *)objc_msgSend(v33, "UTF8String"));

  }
}

- (void)attemptToTypeText:(id)a3 typingLog:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[TIKeyboardTyper userActionStream](self, "userActionStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIntendedText:", v8);

  if ((TIPrintTypingTranscriptToStdout() & 1) != 0
    || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "----->> %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  }
  -[TIKeyboardTyper attemptToTypeWithLog:](self, "attemptToTypeWithLog:", v6);

}

- (void)attemptToTypeIntended:(id)a3 expected:(id)a4 typingLog:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  FILE **v14;
  void *v15;
  FILE *v16;
  id v17;
  id v18;

  v18 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "componentsJoinedByString:", &stru_24FD49B78);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", &stru_24FD49B78);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("----->> %@ -> %@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = TIPrintTypingTranscriptToStdout();
  v14 = (FILE **)MEMORY[0x24BDAC8E8];
  if ((v13 & 1) != 0 || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"))
    fprintf(*v14, "%s\n", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  -[TIKeyboardTyper userActionStream](self, "userActionStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resetForIntendedSegments:expectedSegments:", v9, v18);

  -[TIKeyboardTyper attemptToTypeWithLog:](self, "attemptToTypeWithLog:", v8);
  if (-[TIKeyboardTyper printTranslitSummaries](self, "printTranslitSummaries"))
  {
    fprintf(*v14, "input   : %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
    fprintf(*v14, "expected: %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
    v16 = *v14;
    -[TIKeyboardTyper text](self, "text");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(v16, "actual  : %s\n\n", (const char *)objc_msgSend(v17, "UTF8String"));

  }
}

- (void)attemptToTapKeys:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[TIKeyboardTyper errorGenerator](self, "errorGenerator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardTyper attemptTapOnKeyWithString:withErrorGenerator:typingLog:](self, "attemptTapOnKeyWithString:withErrorGenerator:typingLog:", v9, v10, 0);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)attemptToStrokeWord:(id)a3
{
  -[TIKeyboardTyper attemptToStrokeWord:typingLog:callback:](self, "attemptToStrokeWord:typingLog:callback:", a3, 0, 0);
}

- (void)attemptToStrokeWord:(id)a3 withStartTime:(double)a4
{
  -[TIKeyboardTyper attemptToStrokeWord:startTime:typingLog:callback:](self, "attemptToStrokeWord:startTime:typingLog:callback:", a3, 0, 0, a4);
}

- (void)attemptToStrokeWord:(id)a3 withStartTime:(double)a4 duration:(double)a5
{
  -[TIKeyboardTyper attemptToStrokeWord:startTime:duration:typingLog:callback:](self, "attemptToStrokeWord:startTime:duration:typingLog:callback:", a3, 0, 0, a4, a5);
}

- (void)attemptToStrokeWord:(id)a3 withCallback:(id)a4
{
  -[TIKeyboardTyper attemptToStrokeWord:typingLog:callback:](self, "attemptToStrokeWord:typingLog:callback:", a3, 0, a4);
}

- (void)attemptToStrokeWord:(id)a3 typingLog:(id)a4
{
  -[TIKeyboardTyper attemptToStrokeWord:typingLog:callback:](self, "attemptToStrokeWord:typingLog:callback:", a3, a4, 0);
}

- (void)attemptToStrokeWord:(id)a3 typingLog:(id)a4 callback:(id)a5
{
  -[TIKeyboardTyper attemptToStrokeWord:startTime:typingLog:callback:](self, "attemptToStrokeWord:startTime:typingLog:callback:", a3, 0, a5, 0.0);
}

- (void)attemptToStrokeWord:(id)a3 startTime:(double)a4 typingLog:(id)a5 callback:(id)a6
{
  -[TIKeyboardTyper attemptToStrokeWord:startTime:duration:typingLog:callback:](self, "attemptToStrokeWord:startTime:duration:typingLog:callback:", a3, a5, a6, a4, -1.0);
}

- (void)attemptToStrokeWord:(id)a3 startTime:(double)a4 duration:(double)a5 typingLog:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v12 = a7;
  v13 = a6;
  v14 = a3;
  objc_msgSend(v14, "substringWithRange:", 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper changeToNearestKeyplaneWithString:](self, "changeToNearestKeyplaneWithString:", v15);

  +[TTKDefaultContinuousPathGenerator pathGeneratorWithAttributes:](TTKDefaultContinuousPathGenerator, "pathGeneratorWithAttributes:", MEMORY[0x24BDBD1B8]);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutUtils");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper keyplane](self, "keyplane");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "createTTKPlane:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "generatePathFromString:timestamp:duration:layout:", v14, v19, a4, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardTyper performStrokeForPath:typingLog:callback:](self, "performStrokeForPath:typingLog:callback:", v20, v13, v12);
}

- (void)attemptTapOnKeyWithString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardTyper errorGenerator](self, "errorGenerator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper attemptTapOnKeyWithString:withErrorGenerator:typingLog:](self, "attemptTapOnKeyWithString:withErrorGenerator:typingLog:", v4, v5, 0);

}

- (void)attemptTapOnKeyWithString:(id)a3 withErrorGenerator:(id)a4 typingLog:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  id v24;

  v24 = a5;
  v7 = a3;
  -[TIKeyboardTyper keyplane](self, "keyplane");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper keyWithString:inKeyplane:](self, "keyWithString:inKeyplane:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
    v11 = v10;
    -[TIKeyboardTyper interTouchTimestampInterval](self, "interTouchTimestampInterval");
    v13 = v11 + v12;
    -[TIKeyboardTyper errorGenerator](self, "errorGenerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "representedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "paddedFrame");
    objc_msgSend(v14, "errorForKeyString:rect:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardTyper pointForAttemptedTapOnKey:withError:](self, "pointForAttemptedTapOnKey:withError:", v9, v16);
    v18 = v17;
    v20 = v19;
    -[TIKeyboardTyper keyplane](self, "keyplane");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardTyper keyContainingPoint:inKeyplane:](self, "keyContainingPoint:inKeyplane:", v21, v18, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      v23 = -[TIKeyboardTyper _performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:](self, "_performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:", v9, v22, 0, v16, v24, v18, v20, v13);
    else
      -[TIKeyboardTyper _skipTapTimestamp:intendedKey:typingLog:](self, "_skipTapTimestamp:intendedKey:typingLog:", v9, v24, v13);
    -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", v13);

  }
}

- (id)performTapAtLocation:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
  v7 = v6;
  -[TIKeyboardTyper interTouchTimestampInterval](self, "interTouchTimestampInterval");
  v9 = v7 + v8;
  -[TIKeyboardTyper _performTapAtLocation:timestamp:fingerID:secondaryString:](self, "_performTapAtLocation:timestamp:fingerID:secondaryString:", 0, 0, x, y, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", v9);
  return v10;
}

- (id)performTapAtKey:(id)a3 biasedTowards:(id)a4 biasWeight:(float)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;

  v8 = a4;
  v9 = a3;
  -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
  v11 = v10;
  -[TIKeyboardTyper interTouchTimestampInterval](self, "interTouchTimestampInterval");
  v13 = v12;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "keyplane");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardTyper keyWithString:inKeyplane:](self, "keyWithString:inKeyplane:", v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardTyper pointForAttemptedTapOnKey:withError:](self, "pointForAttemptedTapOnKey:withError:", v16, 0);
  v18 = v17;
  v20 = v19;
  -[TIKeyboardTyper keyWithString:inKeyplane:](self, "keyWithString:inKeyplane:", v8, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardTyper pointForAttemptedTapOnKey:withError:](self, "pointForAttemptedTapOnKey:withError:", v21, 0);
  v23 = v22;
  v25 = v24;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leftKeys");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "containsObject:", v16);

  if ((v28 & 1) != 0)
  {
    v29 = 3;
  }
  else
  {
    -[TIKeyboardTyper keyboardController](self, "keyboardController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "rightKeys");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "containsObject:", v16);

    if (v32)
      v29 = 9;
    else
      v29 = 0;
  }
  v33 = a5;
  v34 = v20 + a5 * (v25 - v20);
  v35 = v18 + v33 * (v23 - v18);
  v36 = v11 + v13;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v38) = 5.0;
  objc_msgSend(v37, "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:", 0, v29, v35, v34, v38, v36);

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v40) = 5.0;
  objc_msgSend(v39, "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:", 0, v29, 0, v35, v34, v40, v36);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", v36);
  return v41;
}

- (void)attemptToDelete
{
  -[TIKeyboardTyper attemptTapOnKeyWithString:withErrorGenerator:typingLog:](self, "attemptTapOnKeyWithString:withErrorGenerator:typingLog:", CFSTR("Delete"), 0, 0);
}

- (void)attemptToDeleteWithCount:(unsigned int)a3
{
  unsigned int v3;

  if (a3)
  {
    v3 = a3;
    do
    {
      -[TIKeyboardTyper attemptTapOnKeyWithString:withErrorGenerator:typingLog:](self, "attemptTapOnKeyWithString:withErrorGenerator:typingLog:", CFSTR("Delete"), 0, 0);
      --v3;
    }
    while (v3);
  }
}

- (void)attemptToRapidDeleteCharacters:(unsigned int)a3
{
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (a3)
  {
    -[TIKeyboardTyper attemptToDelete](self, "attemptToDelete");
    v5 = a3 - 1;
    if (a3 != 1)
    {
      while (1)
      {
        -[TIKeyboardTyper inputManager](self, "inputManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "keyboardState");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "documentState");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "contextBeforeInput");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "length"))
          break;
        v9 = (void *)MEMORY[0x24BEB4D20];
        objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contextAfterInput");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "documentStateWithContextBefore:selectedText:contextAfter:", v10, &stru_24FD49B78, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[TIKeyboardTyper syncToDocumentState:](self, "syncToDocumentState:", v12);
        if (!--v5)
          return;
      }

    }
  }
}

- (void)attemptToShift
{
  -[TIKeyboardTyper attemptTapOnKeyWithString:withErrorGenerator:typingLog:](self, "attemptTapOnKeyWithString:withErrorGenerator:typingLog:", CFSTR("Shift"), 0, 0);
}

- (void)attemptToTapMoreKey
{
  -[TIKeyboardTyper attemptTapOnKeyWithString:withErrorGenerator:typingLog:](self, "attemptTapOnKeyWithString:withErrorGenerator:typingLog:", CFSTR("More"), 0, 0);
}

- (void)attemptVariantKey:(id)a3
{
  id v3;

  v3 = -[TIKeyboardTyper _performVariantKey:timestamp:typingLog:](self, "_performVariantKey:timestamp:typingLog:", a3, 0, 0.0);
}

- (void)attemptGestureKeyInput:(id)a3
{
  id v3;

  v3 = -[TIKeyboardTyper _performGestureKeyInput:timestamp:typingLog:](self, "_performGestureKeyInput:timestamp:typingLog:", a3, 0, 0.0);
}

- (void)acceptAutocorrection
{
  id v3;

  -[TIKeyboardTyper autocorrection](self, "autocorrection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
  -[TIKeyboardTyper _performAcceptCandidate:timestamp:typingLog:](self, "_performAcceptCandidate:timestamp:typingLog:", v3, 0);

}

- (void)rejectAutocorrection
{
  id v3;

  -[TIKeyboardTyper autocorrection](self, "autocorrection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
  -[TIKeyboardTyper _performRejectCandidate:timestamp:typingLog:](self, "_performRejectCandidate:timestamp:typingLog:", v3, 0);

}

- (void)candidateRejected:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardTyper inputManager](self, "inputManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateRejected:", v4);

}

- (void)registerLearning:(id)a3 fullCandidate:(id)a4 mode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TIKeyboardTyper inputManager](self, "inputManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyboardState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerLearning:fullCandidate:keyboardState:mode:", v10, v9, v12, v8);

}

- (void)acceptPredictiveCandidate:(id)a3
{
  id v4;

  v4 = a3;
  -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
  -[TIKeyboardTyper _performAcceptPredictiveCandidate:timestamp:typingLog:](self, "_performAcceptPredictiveCandidate:timestamp:typingLog:", v4, 0);

}

- (void)acceptCandidate:(id)a3
{
  id v4;

  v4 = a3;
  -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
  -[TIKeyboardTyper _performAcceptCandidate:timestamp:typingLog:](self, "_performAcceptCandidate:timestamp:typingLog:", v4, 0);

}

- (void)acceptCandidateViaKeyboard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
  -[TIKeyboardTyper _performAcceptCandidate:timestamp:typingLog:](self, "_performAcceptCandidate:timestamp:typingLog:", v4, 0);

  v9 = objc_alloc_init(MEMORY[0x24BEB4E28]);
  objc_msgSend(v9, "setString:", CFSTR("\n"));
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "handleKeyboardInput:", v9);

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateAutocorrectionsOrCandidates");

}

- (TIKeyboardCandidate)autocorrection
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autocorrection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIKeyboardCandidate *)v3;
}

- (id)candidateBarCandidates
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper candidateResultSet](self, "candidateResultSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)predictionBarCandidates
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t j;
  void *v47;
  void *v49;
  void *v50;

  -[TIKeyboardTyper candidateBarCandidates](self, "candidateBarCandidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (-[TIKeyboardTyper inPartialCandidateSelection](self, "inPartialCandidateSelection"))
      v4 = objc_msgSend(v3, "count");
    else
      v4 = -[TIKeyboardTyper maxPredictions](self, "maxPredictions");
    v10 = v4;
    v11 = objc_msgSend(v3, "count");
    if (v10 >= v11)
      v12 = v11;
    else
      v12 = v10;
    objc_msgSend(v3, "subarrayWithRange:", 0, v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[TIKeyboardTyper maxPredictions](self, "maxPredictions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardTyper autocorrection](self, "autocorrection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardTyper autocorrection](self, "autocorrection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAutocorrection");

    if ((v8 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v6, "input");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "length") != 0;

    }
    objc_opt_class();
    v50 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[TIKeyboardTyper locale](self, "locale");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "languageCode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ko")) & 1) != 0)
      {
        v16 = 0;
      }
      else
      {
        -[TIKeyboardTyper locale](self, "locale");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "languageCode");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("th")) ^ 1;

        v16 = v19;
      }

    }
    else
    {
      v16 = 0;
    }
    -[TIKeyboardTyper autocorrectionList](self, "autocorrectionList");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "predictions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(v21, "objectAtIndex:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isContinuousPathConversion");
      v9 &= v23 ^ 1;
      v8 &= v23 ^ 1;

    }
    v24 = -[TIKeyboardTyper maxPredictions](self, "maxPredictions", v3);
    if (v24)
      v25 = v9;
    else
      v25 = 0;
    v26 = v24 - v25;
    if (v26)
      v27 = v8;
    else
      v27 = 0;
    v28 = v26 - v27;
    -[TIKeyboardTyper autocorrectionList](self, "autocorrectionList");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "emojiList");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_msgSend(v30, "count");
    if (v28 >= v31)
      v32 = v31;
    else
      v32 = v28;
    v33 = v28 - v32;
    v34 = objc_msgSend(v21, "count");
    if (v33 >= v34)
      v35 = v34;
    else
      v35 = v33;
    if (v9)
    {
      v36 = (void *)MEMORY[0x24BEB4E20];
      objc_msgSend(v50, "input");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "candidateWithUnchangedInput:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v38);
    }
    if ((v8 | v16) == 1)
      objc_msgSend(v5, "addObject:", v50);
    if (v35)
    {
      for (i = 0; i != v35; ++i)
      {
        objc_msgSend(v21, "objectAtIndex:", i);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40;
        if (v40 && objc_msgSend(v40, "slotID"))
        {
          objc_msgSend(MEMORY[0x24BEB5348], "sharedInstance");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "secureCandidateRenderer");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
          {
            objc_msgSend(v43, "cachedCandidateForSecureCandidate:", v41);
            v44 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v44 = v41;
          }
          v45 = v44;
          objc_msgSend(v5, "addObject:", v44);

        }
        else
        {
          objc_msgSend(v5, "addObject:", v41);
        }

      }
    }
    if (v32)
    {
      for (j = 0; j != v32; ++j)
      {
        objc_msgSend(v30, "objectAtIndex:", j);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v47);

      }
    }

    v3 = v49;
  }

  return (NSArray *)v5;
}

- (id)predictationBarDebugString
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[TIKeyboardTyper predictionBarCandidates](self, "predictionBarCandidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") && -[TIKeyboardTyper showsCandidateBar](self, "showsCandidateBar"))
  {
    v4 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v27 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v31;
      v8 = 0x24BEB4000uLL;
      v9 = &stru_24FD49B78;
      do
      {
        v10 = 0;
        v28 = v6;
        do
        {
          if (*(_QWORD *)v31 != v7)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
          objc_opt_class();
          v12 = (void *)v9;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v11;
            objc_msgSend(v13, "lexiconLocale");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              v15 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v13, "lexiconLocale");
              v16 = v7;
              v17 = v4;
              v18 = v9;
              v19 = v8;
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "substringToIndex:", 2);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "stringWithFormat:", CFSTR(" (%@)"), v21);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              v8 = v19;
              v9 = v18;
              v4 = v17;
              v7 = v16;
              v6 = v28;
            }
            else
            {
              v12 = (void *)v9;
            }

          }
          objc_msgSend(v11, "candidate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringByAppendingString:", v12);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v23);

          ++v10;
        }
        while (v6 != v10);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v6);
    }

    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\t"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingString:", CFSTR("\n"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v27;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (NSArray)inlineCompletionCandidates
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper autocorrectionList](self, "autocorrectionList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inlineCompletions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (TIKeyboardCandidateResultSet)candidateResultSet
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidateResultSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIKeyboardCandidateResultSet *)v3;
}

- (int64_t)performTouchDownAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7;
  double y;
  double x;
  void *v14;
  double v15;
  int64_t v16;

  v7 = *(_QWORD *)&a7;
  y = a3.y;
  x = a3.x;
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a5);
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = a4;
  v16 = objc_msgSend(v14, "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v15, a5);

  return v16;
}

- (int64_t)performTouchDragAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7;
  double y;
  double x;
  void *v14;
  double v15;
  int64_t v16;

  v7 = *(_QWORD *)&a7;
  y = a3.y;
  x = a3.x;
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a5);
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = a4;
  v16 = objc_msgSend(v14, "performTouchDragAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v15, a5);

  return v16;
}

- (void)performTouchCancelAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7;
  double y;
  double x;
  double v14;
  id v15;

  v7 = *(_QWORD *)&a7;
  y = a3.y;
  x = a3.x;
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a5);
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = a4;
  objc_msgSend(v15, "performTouchCancelAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v14, a5);

}

- (void)performTouchRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7;
  double y;
  double x;
  double v14;
  id v15;

  v7 = *(_QWORD *)&a7;
  y = a3.y;
  x = a3.x;
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a5);
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = a4;
  objc_msgSend(v15, "performTouchRestAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v14, a5);

}

- (void)performTouchEndRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7;
  double y;
  double x;
  double v14;
  id v15;

  v7 = *(_QWORD *)&a7;
  y = a3.y;
  x = a3.x;
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a5);
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = a4;
  objc_msgSend(v15, "performTouchEndRestAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v14, a5);

}

- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  return -[TIKeyboardTyper performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:](self, "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:", a6, *(_QWORD *)&a7, 0, a3.x, a3.y);
}

- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 secondaryString:(BOOL)a8
{
  _BOOL8 v8;
  uint64_t v9;
  double y;
  double x;
  void *v16;
  double v17;
  void *v18;

  v8 = a8;
  v9 = *(_QWORD *)&a7;
  y = a3.y;
  x = a3.x;
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a5);
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v17 = a4;
  objc_msgSend(v16, "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:", a6, v9, v8, x, y, v17, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (UIKBTree)keyboard
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIKBTree *)v3;
}

- (UIKBTree)keyplane
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyplane");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIKBTree *)v3;
}

- (id)keyWithString:(id)a3 inKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutUtils");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exactKeyForString:keyplane:includeSecondaryStrings:", v7, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)keyWithString:(id)a3 inKeyplane:(id)a4 includeSecondaryStrings:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutUtils");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exactKeyForString:keyplane:includeSecondaryStrings:", v9, v8, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)shiftKeyToAccessKeyplaneCloserToKeyString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[TIKeyboardTyper keyplane](self, "keyplane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isAlphabeticPlane"))
    goto LABEL_6;
  -[TIKeyboardTyper keyplane](self, "keyplane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isShiftKeyplane");

  if ((v7 & 1) == 0)
  {
    -[TIKeyboardTyper keyboardController](self, "keyboardController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutUtils");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardTyper keyplane](self, "keyplane");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exactKeyForString:keyplane:includeSecondaryStrings:", v4, v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TIKeyboardTyper keyboardController](self, "keyboardController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "keyplane");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstCachedKeyWithName:", CFSTR("Shift-Key"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
      goto LABEL_8;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (id)keyToAccessKeyplaneCloserToKeyString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TIKeyboardTyper _keyplaneCloserToKeyWithString:](self, "_keyplaneCloserToKeyWithString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper keyplane](self, "keyplane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyToAccessKeyplane:fromKeyplane:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)changeToNearestKeyplaneWithString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;

  v4 = a3;
  -[TIKeyboardTyper keyplane](self, "keyplane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper keyWithString:inKeyplane:](self, "keyWithString:inKeyplane:", v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
LABEL_7:

  }
  else
  {
    v8 = 0;
    while (1)
    {
      v9 = v8;
      -[TIKeyboardTyper keyToAccessKeyplaneCloserToKeyString:](self, "keyToAccessKeyplaneCloserToKeyString:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        break;
      objc_msgSend(v8, "representedString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardTyper attemptTapOnKeyWithString:withErrorGenerator:typingLog:](self, "attemptTapOnKeyWithString:withErrorGenerator:typingLog:", v10, 0, 0);

      -[TIKeyboardTyper keyplane](self, "keyplane");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardTyper keyWithString:inKeyplane:](self, "keyWithString:inKeyplane:", v4, v5);
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v7 = (void *)v11;

        goto LABEL_7;
      }
    }
  }
  -[TIKeyboardTyper keyplane](self, "keyplane");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper keyWithString:inKeyplane:](self, "keyWithString:inKeyplane:", v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 != 0;

  return v14;
}

- (BOOL)changeToNearestAlphabeticPlane
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[TIKeyboardTyper keyplane](self, "keyplane");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAlphabeticPlane");

  if ((v4 & 1) == 0)
  {
    -[TIKeyboardTyper keyboard](self, "keyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardTyper keyplane](self, "keyplane");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alternateKeyplaneName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subtreeWithName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isAlphabeticPlane"))
      -[TIKeyboardTyper attemptToTapMoreKey](self, "attemptToTapMoreKey");

  }
  -[TIKeyboardTyper keyplane](self, "keyplane");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isAlphabeticPlane");

  return v10;
}

- (id)_keyplaneCloserToKeyWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v4 = a3;
  -[TIKeyboardTyper keyplane](self, "keyplane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v7, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", 0);
    -[TIKeyboardTyper keyboard](self, "keyboard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subtreeWithName:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardTyper keyWithString:inKeyplane:](self, "keyWithString:inKeyplane:", v4, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = v10;
      v15 = v14;
      do
      {
        v16 = v14;
        v14 = v15;

        objc_msgSend(v8, "valueForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while (!objc_msgSend(v15, "isEqualToString:", v7));
      -[TIKeyboardTyper keyboard](self, "keyboard");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "subtreeWithName:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[TIKeyboardTyper keyboardController](self, "keyboardController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __50__TIKeyboardTyper__keyplaneCloserToKeyWithString___block_invoke;
      v21[3] = &unk_24FD48B80;
      v22 = v8;
      v14 = v10;
      v23 = v14;
      v24 = v9;
      objc_msgSend(v19, "enumerateKeyplaneNamesAdjacentToKeyplane:usingBlock:", v12, v21);

      v18 = 0;
      v15 = v22;
    }

    if (v18)
      goto LABEL_11;
  }
  v18 = 0;
LABEL_11:

  return v18;
}

- (CGPoint)pointForAttemptedTapOnKey:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  CGPoint result;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "paddedFrame");
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  MidX = CGRectGetMidX(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  MidY = CGRectGetMidY(v35);
  -[TIKeyboardTyper userPersona](self, "userPersona");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TIKeyboardTyper userPersona](self, "userPersona");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userPointForKey:", v7);
    MidX = v16;
    MidY = v17;

  }
  else
  {
    -[TIKeyboardTyper keyboardController](self, "keyboardController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutUtils");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardTyper keyplane](self, "keyplane");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "representedStringForKey:shifted:", v7, objc_msgSend(v20, "isShiftKeyplane"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && (objc_msgSend(v15, "isEqualToString:", CFSTR("\n")) & 1) == 0)
    {
      objc_msgSend(v6, "applyToPoint:", MidX, MidY);
      MidX = v21;
      MidY = v22;
    }
    if (MidX < 0.0)
      MidX = 0.0;
    if (MidY < 0.0)
      MidY = 0.0;
    -[TIKeyboardTyper keyboard](self, "keyboard");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v25 = v24;

    if (MidX > v25)
    {
      -[TIKeyboardTyper keyboard](self, "keyboard");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frame");
      MidX = CGRectGetMaxX(v36);

    }
    -[TIKeyboardTyper keyboard](self, "keyboard");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    v29 = v28;

    if (MidY > v29)
    {
      -[TIKeyboardTyper keyboard](self, "keyboard");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "frame");
      MidY = CGRectGetMaxY(v37);

    }
  }

  v31 = MidX;
  v32 = MidY;
  result.y = v32;
  result.x = v31;
  return result;
}

- (id)keyContainingPoint:(CGPoint)a3 inKeyplane:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyContainingPoint:inKeyplane:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_finishKeystrokeAndRecordPredictionsInTypingLog:(id)a3 touchedKey:(id)a4 insertedKey:(id)a5 typingLog:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v10 = a4;
  v11 = a5;
  v29 = a6;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[TIKeyboardTyper predictionBarCandidates](self, "predictionBarCandidates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v18), "candidate", v29);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v16);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[TIKeyboardTyper inlineCompletionCandidates](self, "inlineCompletionCandidates");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v32;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v24), "candidate", v29);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v22);
  }

  if (v10)
  {
    -[TIKeyboardTyper _logStringForTouchedKey:](self, "_logStringForTouchedKey:", v10);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = v11;
  }
  v27 = v26;
  v28 = v29;
  objc_msgSend(v29, "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:predictionBarState:inlineCompletionBarState:", v26, v30, v11, v12, v13, v29);

}

- (id)_performTapAtLocation:(CGPoint)a3 timestamp:(double)a4 intendedKey:(id)a5 touchedKey:(id)a6 secondaryString:(BOOL)a7 touchError:(id)a8 typingLog:(id)a9
{
  _BOOL8 v11;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v47;
  void *v48;

  v11 = a7;
  y = a3.y;
  x = a3.x;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  if (v11)
  {
    objc_msgSend(v17, "secondaryRepresentedStrings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v17, "representedString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BEB4E68], "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 0, 0, -1, x, y, 5.0, a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v22, "isEqualToString:", CFSTR("Delete"));
  -[TIKeyboardTyper text](self, "text");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v19;
  objc_msgSend(v20, "beginKeystrokeWithIntendedKey:touchEvent:touchError:documentBefore:", v22, v23, v19, v24);

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leftKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "containsObject:", v17);

  if ((v27 & 1) != 0)
  {
    v28 = 3;
  }
  else
  {
    -[TIKeyboardTyper keyboardController](self, "keyboardController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "rightKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "containsObject:", v17);

    if (v31)
      v28 = 9;
    else
      v28 = 0;
  }
  if (objc_msgSend(v18, "interactionType") == 11)
  {
    -[TIKeyboardTyper keyboardController](self, "keyboardController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardTyper keyplane](self, "keyplane");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "keyCodeWithString:inKeyplane:", CFSTR("More"), v33);

    -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
    v36 = v35;
    -[TIKeyboardTyper interTouchTimestampInterval](self, "interTouchTimestampInterval");
    v38 = v36 + v37;
    -[TIKeyboardTyper keyboardController](self, "keyboardController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = 5.0;
    objc_msgSend(v39, "performSkipTapAtLocation:radius:timestamp:pathIndex:fingerID:forcedKeyCode:", 0, v28, v34, x, y, v40, v38);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardTyper userPersona](self, "userPersona");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardTyper keyboardController](self, "keyboardController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "keyplane");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "updateFromKeyplane:", v44);

  }
  else
  {
    -[TIKeyboardTyper _performTapAtLocation:timestamp:fingerID:secondaryString:](self, "_performTapAtLocation:timestamp:fingerID:secondaryString:", v28, v11, x, y, a4);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (!v41)
    v41 = &stru_24FD49B78;
  if (((-[__CFString isEqualToString:](v41, "isEqualToString:", CFSTR("\\b")) ^ 1 | v47) & 1) == 0)
  {

    v41 = CFSTR("\\B");
  }
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a4);
  objc_msgSend(MEMORY[0x24BEB4E68], "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 2, 0, -1, x, y, 5.0, a4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper _finishKeystrokeAndRecordPredictionsInTypingLog:touchedKey:insertedKey:typingLog:](self, "_finishKeystrokeAndRecordPredictionsInTypingLog:touchedKey:insertedKey:typingLog:", v45, v18, v41, v20);

  return v41;
}

- (id)_performTouchEvent:(id)a3 typingLog:(id)a4
{
  id v6;
  id v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  double v20;
  void *v21;
  double v22;
  __CFString *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  double v28;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "stage");
  objc_msgSend(v6, "location");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v6, "radius");
  v14 = v13;
  objc_msgSend(v6, "timestamp");
  v16 = v15;
  v17 = objc_msgSend(v6, "pathIndex");
  v18 = objc_msgSend(v6, "fingerID");
  if (v8 == 2)
  {
    -[TIKeyboardTyper keyboardController](self, "keyboardController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v22 = v14;
    objc_msgSend(v21, "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:", v17, v18, 0, v10, v12, v22, v16);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[TIKeyboardTyper predictionBarCandidates](self, "predictionBarCandidates");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TIKeyboardTyper maxPredictionsReported](self, "maxPredictionsReported") >= 1)
    {
      v25 = 0;
      do
      {
        if (objc_msgSend(v24, "count") <= v25)
          break;
        objc_msgSend(v24, "objectAtIndexedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "candidate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v27);

        ++v25;
      }
      while ((uint64_t)v25 < -[TIKeyboardTyper maxPredictionsReported](self, "maxPredictionsReported"));
    }
    objc_msgSend(v7, "registerPathStringAsKeyStrokes:path:predictionBarState:", v23, 0, v19);

  }
  else
  {
    if (v8 == 1)
    {
      -[TIKeyboardTyper keyboardController](self, "keyboardController");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      *(float *)&v28 = v14;
      objc_msgSend(v19, "performTouchDragAtLocation:radius:timestamp:pathIndex:fingerID:", v17, v18, v10, v12, v28, v16);
    }
    else
    {
      if (v8)
      {
        v23 = &stru_24FD49B78;
        goto LABEL_14;
      }
      -[TIKeyboardTyper keyboardController](self, "keyboardController");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      *(float *)&v20 = v14;
      objc_msgSend(v19, "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:", v17, v18, v10, v12, v20, v16);
    }
    v23 = &stru_24FD49B78;
  }

LABEL_14:
  objc_msgSend(v6, "timestamp");
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:");

  return v23;
}

- (void)_skipTapTimestamp:(double)a3 intendedKey:(id)a4 typingLog:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  objc_msgSend(MEMORY[0x24BEB4E68], "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 0, 0, -1);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB4E68], "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 2, 0, -1, v11, v13, 5.0, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "representedString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "beginKeystrokeWithIntendedKey:touchEvent:touchError:", v15, v16, 0);
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a3);
  objc_msgSend(v8, "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:", CFSTR("<NoKey>"), v14, &stru_24FD49B78);

}

- (id)_performVariantKey:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "beginKeystrokeWithIntendedKey:touchEvent:touchError:", v7, 0, 0);
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addStringFromVariantKey:", v7);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@>"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:", v10, 0, v7);

  return v7;
}

- (id)_performGestureKeyInput:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "beginKeystrokeWithIntendedKey:touchEvent:touchError:", v7, 0, 0);
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addStringFromGestureKeyInput:", v7);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@>"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:", v10, 0, v7);

  return v7;
}

- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5 predictiveCandidate:(BOOL)a6 intendedTransliteration:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  objc_msgSend(v14, "candidate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logAcceptedCandidate:intendedTransliterationCandidate:", v15, v12);

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "acceptCandidate:predictiveCandidate:", v14, v7);

  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a4);
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "generateAutocorrectionsOrCandidates");

}

- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5 predictiveCandidate:(BOOL)a6
{
  -[TIKeyboardTyper _performAcceptCandidate:timestamp:typingLog:predictiveCandidate:intendedTransliteration:](self, "_performAcceptCandidate:timestamp:typingLog:predictiveCandidate:intendedTransliteration:", a3, a5, a6, 0, a4);
}

- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
  -[TIKeyboardTyper _performAcceptCandidate:timestamp:typingLog:predictiveCandidate:](self, "_performAcceptCandidate:timestamp:typingLog:predictiveCandidate:", a3, a5, 0, a4);
}

- (void)_performAcceptPredictiveCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
  -[TIKeyboardTyper _performAcceptCandidate:timestamp:typingLog:predictiveCandidate:](self, "_performAcceptCandidate:timestamp:typingLog:predictiveCandidate:", a3, a5, 1, a4);
}

- (void)_performRejectCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a5, "logRejectedAutocorrection");
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rejectCandidate:", v8);

  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a4);
}

- (void)performStrokeForPath:(id)a3 typingLog:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _BYTE *);
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  unsigned __int8 v39;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _BYTE *))a5;
  v39 = 0;
  objc_msgSend(v8, "samples");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 < 2)
  {
    v25 = 0;
  }
  else
  {
    v13 = 0;
    while (1)
    {
      objc_msgSend(v8, "samples");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIKeyboardTyper keyboardController](self, "keyboardController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "point");
      v18 = v17;
      v20 = v19;
      objc_msgSend(v15, "timeStamp");
      LODWORD(v22) = 5.0;
      if (v13)
        objc_msgSend(v16, "performTouchDragAtLocation:radius:timestamp:pathIndex:fingerID:", 0, 0, v18, v20, v22, v21);
      else
        objc_msgSend(v16, "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:", 0, 0, v18, v20, v22, v21);

      if (v10)
      {
        v10[2](v10, v15, &v39);
        if (v39)
          break;
      }

      objc_msgSend(v8, "samples");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      v25 = v13 + 1;
      v26 = v13 + 2;
      ++v13;
      if (v26 >= v24)
        goto LABEL_12;
    }

    v25 = v13;
  }
LABEL_12:
  v27 = v39;
  objc_msgSend(v8, "samples");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v27)
    objc_msgSend(v28, "objectAtIndexedSubscript:", v25);
  else
    objc_msgSend(v28, "lastObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "point");
  v33 = v32;
  v35 = v34;
  objc_msgSend(v30, "timeStamp");
  LODWORD(v36) = 5.0;
  objc_msgSend(v31, "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:", 0, 0, 0, v33, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "registerPathStringAsKeyStrokes:path:predictionBarState:", v38, v8, 0);
}

- (void)_bumpTouchPathID
{
  unint64_t touchPathID;
  unint64_t v3;

  touchPathID = self->_touchPathID;
  if (touchPathID + 1 <= 0x14)
    v3 = touchPathID + 1;
  else
    v3 = 1;
  self->_touchPathID = v3;
}

- (id)_performTapAtLocation:(CGPoint)a3 timestamp:(double)a4 fingerID:(int)a5 secondaryString:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  double y;
  double x;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  y = a3.y;
  x = a3.x;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 5.0;
  objc_msgSend(v12, "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:", self->_touchPathID, v7, x, y, v13, a4);

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 5.0;
  objc_msgSend(v14, "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:", self->_touchPathID, v7, v6, x, y, v15, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardTyper _bumpTouchPathID](self, "_bumpTouchPathID");
  -[TIKeyboardTyper userPersona](self, "userPersona");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "keyplane");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateFromKeyplane:", v19);

  return v16;
}

- (id)_logStringForTouchedKey:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "interactionType");
    if (v6 <= 0x10 && ((1 << v6) & 0x1A006) != 0)
    {
      -[TIKeyboardTyper keyboardController](self, "keyboardController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layoutUtils");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardTyper keyplane](self, "keyplane");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "representedStringForKey:shifted:", v5, objc_msgSend(v9, "isShiftKeyplane"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "representedString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@>"), v7);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = CFSTR("<NoKey>");
  }

  return v10;
}

- (id)tokensForString:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TIKeyboardTyper userModel](self, "userModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prefersTransliteration");

  if (v6)
  {
    v12[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TIKeyboardTyper userModel](self, "userModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "prefersContinuousPath");

    if (v9)
      -[TIKeyboardTyper inputSegmentsForContinuousPathString:](self, "inputSegmentsForContinuousPathString:", v4);
    else
      -[TIKeyboardTyper inputSegmentsForString:](self, "inputSegmentsForString:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;

  return v10;
}

- (id)inputSegmentsForString:(id)a3
{
  return TITestTyperTokensForString(a3, 0);
}

- (BOOL)priorTokenisString:(id)a3 i:(unint64_t)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  void *v8;

  if (a4)
  {
    objc_msgSend(a3, "objectAtIndex:", a4 - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1);
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "characterIsMember:", v5) & 1) != 0)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = ((_DWORD)v5 != 32) & ~objc_msgSend(v8, "characterIsMember:", v5);

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)postTokenisString:(id)a3 i:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;

  v5 = a3;
  if (objc_msgSend(v5, "count") - 1 <= a4)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", a4 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "characterAtIndex:", 0);
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "characterIsMember:", v7) & 1) != 0)
    {
      LOBYTE(v9) = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = ((_DWORD)v7 != 32) & ~objc_msgSend(v10, "characterIsMember:", v7);

    }
  }

  return v9;
}

- (id)mergeHyphenatedWord:(id)a3 string:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeLastObject");
    objc_msgSend(v7, "stringByAppendingString:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (id)inputSegmentsForContinuousPathString:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  TITestTyperTokensForString(a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 & 1) != 0)
      {
        -[TIKeyboardTyper mergeHyphenatedWord:string:](self, "mergeHyphenatedWord:string:", v5, v8);
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("-"))
        && -[TIKeyboardTyper priorTokenisString:i:](self, "priorTokenisString:i:", v4, v6)
        && -[TIKeyboardTyper postTokenisString:i:](self, "postTokenisString:i:", v4, v6))
      {
        -[TIKeyboardTyper mergeHyphenatedWord:string:](self, "mergeHyphenatedWord:string:", v5, v8);
        v10 = objc_claimAutoreleasedReturnValue();

        v7 = 1;
        v8 = (void *)v10;
      }
      else
      {
        v7 = 0;
      }
      objc_msgSend(v5, "addObject:", v8);

      ++v6;
    }
    while (v6 < objc_msgSend(v4, "count"));
  }

  return v5;
}

- (id)transliteratedTokensForString:(id)a3
{
  return TITestTyperTokensForString(a3, 0);
}

- (id)externalStringToInternal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "externalStringToInternal:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)internalStringToExternal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internalStringToExternal:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)splitDigraphsInString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;

  v4 = a3;
  -[TIKeyboardTyper inputMode](self, "inputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageWithRegion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("de_"));

  if (v7)
  {
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ß"), CFSTR("ss"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardTyper keyboard](self, "keyboard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subtrees");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isShiftKeyplane"))
    {
      -[TIKeyboardTyper keyboard](self, "keyboard");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shiftAlternateKeyplaneName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subtreeWithName:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
    }
    -[TIKeyboardTyper keyboardController](self, "keyboardController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "keyCodeWithString:inKeyplane:", CFSTR("ü"), v11);

    if (v16 == -1)
    {
      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Ä"), CFSTR("Ae"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Ö"), CFSTR("Oe"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Ü"), CFSTR("Ue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ä"), CFSTR("ae"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ö"), CFSTR("oe"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ü"), CFSTR("ue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_8;
  }
  -[TIKeyboardTyper inputMode](self, "inputMode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "languageWithRegion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "hasPrefix:", CFSTR("fr_"));

  if (v24)
  {
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("æ"), CFSTR("ae"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "stringByReplacingOccurrencesOfString:withString:", CFSTR("œ"), CFSTR("oe"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Æ"), CFSTR("AE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Œ"), CFSTR("OE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    v4 = v8;
  }
  return v4;
}

- (void)learnWord:(id)a3 withCount:(unint64_t)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__TIKeyboardTyper_learnWord_withCount___block_invoke;
  v10[3] = &unk_24FD48BA8;
  v10[4] = self;
  v11 = &unk_24FD5FCD8;
  v7 = (void (**)(_QWORD))MEMORY[0x2348A8EA4](v10);
  -[TIKeyboardTyper syncToEmptyDocument](self, "syncToEmptyDocument");
  -[TIKeyboardTyper attemptToTypeText:](self, "attemptToTypeText:", CFSTR("- -  - - . "));
  -[TIKeyboardTyper syncToEmptyDocument](self, "syncToEmptyDocument");
  for (; a4; --a4)
  {
    v7[2](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardTyper attemptToTypeText:](self, "attemptToTypeText:", v8);

    -[TIKeyboardTyper attemptToTypeText:](self, "attemptToTypeText:", CFSTR(" "));
    -[TIKeyboardTyper attemptToTypeText:](self, "attemptToTypeText:", v6);
    -[TIKeyboardTyper rejectAutocorrection](self, "rejectAutocorrection");
    -[TIKeyboardTyper attemptToTypeText:](self, "attemptToTypeText:", CFSTR(" "));
    v7[2](v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardTyper attemptToTypeText:](self, "attemptToTypeText:", v9);

    -[TIKeyboardTyper attemptToTypeText:](self, "attemptToTypeText:", CFSTR(". "));
    -[TIKeyboardTyper syncToEmptyDocument](self, "syncToEmptyDocument");
  }

}

- (BOOL)usePartialCandidates
{
  void *v2;
  char v3;

  -[TIKeyboardTyper userModel](self, "userModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usePartialCandidates");

  return v3;
}

- (BOOL)inPartialCandidateSelection
{
  void *v2;
  char v3;

  -[TIKeyboardTyper userActionStream](self, "userActionStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inPartialCandidateSelection");

  return v3;
}

- (ACTUserActionStreaming)userActionStream
{
  return self->_userActionStream;
}

- (TITestUserPersona)userPersona
{
  return self->_userPersona;
}

- (void)setUserPersona:(id)a3
{
  objc_storeStrong((id *)&self->_userPersona, a3);
}

- (ACTKeyboardController)keyboardController
{
  return self->_keyboardController;
}

- (double)interTouchTimestampInterval
{
  return self->_interTouchTimestampInterval;
}

- (void)setInterTouchTimestampInterval:(double)a3
{
  self->_interTouchTimestampInterval = a3;
}

- (BOOL)shouldDecomposeInputString
{
  return self->_shouldDecomposeInputString;
}

- (void)setShouldDecomposeInputString:(BOOL)a3
{
  self->_shouldDecomposeInputString = a3;
}

- (int)maxPredictionsReported
{
  return self->_maxPredictionsReported;
}

- (void)setMaxPredictionsReported:(int)a3
{
  self->_maxPredictionsReported = a3;
}

- (int64_t)maxPredictions
{
  return self->_maxPredictions;
}

- (void)setMaxPredictions:(int64_t)a3
{
  self->_maxPredictions = a3;
}

- (BOOL)logDocumentContext
{
  return self->_logDocumentContext;
}

- (void)setLogDocumentContext:(BOOL)a3
{
  self->_logDocumentContext = a3;
}

- (BOOL)warnIfSelectingPopupVariant
{
  return self->_warnIfSelectingPopupVariant;
}

- (void)setWarnIfSelectingPopupVariant:(BOOL)a3
{
  self->_warnIfSelectingPopupVariant = a3;
}

- (NSString)badSentenceLogFilePath
{
  return self->_badSentenceLogFilePath;
}

- (void)setBadSentenceLogFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_badSentenceLogFilePath, a3);
}

- (BOOL)printTypingTranscript
{
  return self->_printTypingTranscript;
}

- (void)setPrintTypingTranscript:(BOOL)a3
{
  self->_printTypingTranscript = a3;
}

- (BOOL)showsCandidateBar
{
  return self->_showsCandidateBar;
}

- (void)setShowsCandidateBar:(BOOL)a3
{
  self->_showsCandidateBar = a3;
}

- (BOOL)printTranslitSummaries
{
  return self->_printTranslitSummaries;
}

- (void)setPrintTranslitSummaries:(BOOL)a3
{
  self->_printTranslitSummaries = a3;
}

- (NSDictionary)shiftedKeyToUnShiftedKeyExcludeCapitalizationMap
{
  return self->_shiftedKeyToUnShiftedKeyExcludeCapitalizationMap;
}

- (void)setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap:(id)a3
{
  objc_storeStrong((id *)&self->_shiftedKeyToUnShiftedKeyExcludeCapitalizationMap, a3);
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_inputMode, a3);
}

- (double)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setLastTimestamp:(double)a3
{
  self->_lastTimestamp = a3;
}

- (unint64_t)learnWordContextIndex
{
  return self->_learnWordContextIndex;
}

- (void)setLearnWordContextIndex:(unint64_t)a3
{
  self->_learnWordContextIndex = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_shiftedKeyToUnShiftedKeyExcludeCapitalizationMap, 0);
  objc_storeStrong((id *)&self->_badSentenceLogFilePath, 0);
  objc_storeStrong((id *)&self->_keyboardController, 0);
  objc_storeStrong((id *)&self->_userPersona, 0);
  objc_storeStrong((id *)&self->_userActionStream, 0);
}

id __39__TIKeyboardTyper_learnWord_withCount___block_invoke(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "learnWordContextIndex");
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 + 1;
  if (objc_msgSend(*(id *)(a1 + 40), "count") <= v4)
    v5 = 0;
  else
    v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "setLearnWordContextIndex:", v5);
  return v3;
}

void __50__TIKeyboardTyper__keyplaneCloserToKeyWithString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", *(_QWORD *)(a1 + 40), v4);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
  }

}

- (TIKeyboardInputManagerFactory)keyboardInputManagerFactory
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardInputManagerFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIKeyboardInputManagerFactory *)v3;
}

- (void)setKeyboardInputManagerFactory:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyboardInputManagerFactory:", v4);

}

- (NSString)inputModeIdentifier
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputModeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setInputModeIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputModeIdentifier:", v4);

}

- (BOOL)asyncPredictions
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "asyncPredictions");

  return v3;
}

- (void)setAsyncPredictions:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAsyncPredictions:", v3);

}

- (void)setKeyboard:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyboard:", v4);

  -[TIKeyboardTyper setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap](self, "setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap");
}

- (void)setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  void *v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  char v37;
  void *v38;
  void *v39;
  id v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  -[TIKeyboardTyper inputMode](self, "inputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageWithRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("th_TH"));

  if ((v5 & 1) == 0)
  {
    -[TIKeyboardTyper keyboard](self, "keyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardTyper keyplane](self, "keyplane");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shiftAlternateKeyplaneName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subtreeWithName:", v8);
    v40 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardTyper keyplane](self, "keyplane");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      v36 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v40, "keys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        v14 = 0;
        while (1)
        {
          objc_msgSend(v13, "objectAtIndex:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "paddedFrame");
          x = v41.origin.x;
          y = v41.origin.y;
          width = v41.size.width;
          height = v41.size.height;
          MidX = CGRectGetMidX(v41);
          v42.origin.x = x;
          v42.origin.y = y;
          v42.size.width = width;
          v42.size.height = height;
          MidY = CGRectGetMidY(v42);
          -[TIKeyboardTyper keyplane](self, "keyplane");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardTyper keyContainingPoint:inKeyplane:](self, "keyContainingPoint:inKeyplane:", v22, MidX, MidY);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
            goto LABEL_16;
          objc_msgSend(v23, "paddedFrame");
          v24 = v43.origin.x;
          v25 = v43.origin.y;
          v26 = v43.size.width;
          v27 = v43.size.height;
          v28 = CGRectGetMidX(v43);
          v44.origin.x = v24;
          v44.origin.y = v25;
          v44.size.width = v26;
          v44.size.height = v27;
          v29 = CGRectGetMidY(v44);
          if (v28 != MidX || v29 != MidY)
            goto LABEL_16;
          objc_msgSend(v23, "representedString", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "representedString");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v31, "isEqualToString:", v32))
            break;
          objc_msgSend(v23, "representedString");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardTyper inputMode](self, "inputMode");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "locale");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "uppercaseStringWithLocale:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "representedString");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v34, "isEqualToString:", v35);

          if ((v37 & 1) == 0)
          {
            objc_msgSend(v15, "representedString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setValue:forKey:", v23, v31);
            goto LABEL_15;
          }
LABEL_16:

          if (++v14 >= (unint64_t)objc_msgSend(v13, "count"))
            goto LABEL_17;
        }

LABEL_15:
        goto LABEL_16;
      }
LABEL_17:
      if (objc_msgSend(v36, "count"))
        -[TIKeyboardTyper setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap:](self, "setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap:", v36);

    }
  }
}

- (BOOL)isShifted
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShifted");

  return v3;
}

- (BOOL)isAutoshifted
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAutoshifted");

  return v3;
}

- (NSString)clientIdentifier
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setClientIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientIdentifier:", v4);

}

- (NSString)recipientIdentifier
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setRecipientIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecipientIdentifier:", v4);

}

- (TIInputContextHistory)inputContextHistory
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputContextHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIInputContextHistory *)v3;
}

- (void)setInputContextHistory:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputContextHistory:", v4);

}

- (BOOL)nextKeyIsMultitap
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "nextKeyIsMultitap");

  return v3;
}

- (void)setNextKeyIsMultitap:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNextKeyIsMultitap:", v3);

}

- (TIKeyboardInputManager)inputManager
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIKeyboardInputManager *)v3;
}

- (BOOL)usesAutocorrection
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesAutocorrection");

  return v3;
}

- (void)setUsesAutocorrection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesAutocorrection:", v3);

}

- (unint64_t)autocorrectionType
{
  void *v2;
  unint64_t v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "autocorrectionType");

  return v3;
}

- (void)setAutocorrectionType:(unint64_t)a3
{
  id v4;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutocorrectionType:", a3);

}

- (BOOL)usesPrediction
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesPrediction");

  return v3;
}

- (void)setUsesPrediction:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesPrediction:", v3);

}

- (BOOL)usesAutocapitalization
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesAutocapitalization");

  return v3;
}

- (void)setUsesAutocapitalization:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesAutocapitalization:", v3);

}

- (unint64_t)autocapitalizationType
{
  void *v2;
  unint64_t v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "autocapitalizationType");

  return v3;
}

- (void)setAutocapitalizationType:(unint64_t)a3
{
  id v4;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutocapitalizationType:", a3);

}

- (BOOL)wordLearningEnabled
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wordLearningEnabled");

  return v3;
}

- (void)setWordLearningEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWordLearningEnabled:", v3);

}

- (BOOL)inlineCompletionEnabled
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inlineCompletionEnabled");

  return v3;
}

- (void)setInlineCompletionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInlineCompletionEnabled:", v3);

}

- (BOOL)hardwareKeyboardMode
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hardwareKeyboardMode");

  return v3;
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHardwareKeyboardMode:", v3);

}

- (BOOL)shouldSkipCandidateSelection
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldSkipCandidateSelection");

  return v3;
}

- (void)setShouldSkipCandidateSelection:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (a3)
    -[TIKeyboardTyper acceptAutocorrection](self, "acceptAutocorrection");
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldSkipCandidateSelection:", v3);

}

- (BOOL)longPredictionListEnabled
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longPredictionListEnabled");

  return v3;
}

- (void)setLongPredictionListEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLongPredictionListEnabled:", v3);

}

- (BOOL)usesTransliteration
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesTransliteration");

  return v3;
}

- (void)setUsesTransliteration:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesTransliteration:", v3);

}

- (BOOL)insertsSpaceAfterPredictiveInput
{
  void *v2;
  char v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "insertsSpaceAfterPredictiveInput");

  return v3;
}

- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInsertsSpaceAfterPredictiveInput:", v3);

}

- (id)mapShiftedKeyToUnShiftedKeyExcludeCapitalization:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TIKeyboardTyper shiftedKeyToUnShiftedKeyExcludeCapitalizationMap](self, "shiftedKeyToUnShiftedKeyExcludeCapitalizationMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TIKeyboardTyper shiftedKeyToUnShiftedKeyExcludeCapitalizationMap](self, "shiftedKeyToUnShiftedKeyExcludeCapitalizationMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (_NSRange)selectedRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)setSelectedRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  id v7;

  length = a3.length;
  location = a3.location;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedRange:", location, length);

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generateAutocorrectionsOrCandidates");

}

- (NSString)markedText
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)insertText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertText:", v4);

}

- (void)commitText
{
  id v2;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commitText");

}

- (void)adjustCursorByOffset:(int64_t)a3
{
  void *v5;
  id v6;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustCursorByOffset:", a3);

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generateAutocorrectionsOrCandidates");

}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjustPhraseBoundaryInForwardDirection:granularity:", v5, v4);

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateAutocorrectionsOrCandidates");

}

- (void)adjustPhraseBoundaryByOffset:(int64_t)a3 granularity:(int)a4
{
  uint64_t v4;
  int v6;
  _BOOL8 v7;

  if ((_DWORD)a3)
  {
    v4 = *(_QWORD *)&a4;
    if ((int)a3 >= 0)
      v6 = a3;
    else
      v6 = -(int)a3;
    v7 = a3 >= 0;
    do
    {
      -[TIKeyboardTyper adjustPhraseBoundaryInForwardDirection:granularity:](self, "adjustPhraseBoundaryInForwardDirection:granularity:", v7, v4);
      --v6;
    }
    while (v6);
  }
}

- (unint64_t)cursorLocationInMarkedText
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedRangeInMarkedText");

  return v5;
}

- (id)displayStringOverrideForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayStringOverrideForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)predictions
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (TIAutocorrectionList)autocorrectionList
{
  void *v2;
  void *v3;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autocorrectionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIAutocorrectionList *)v3;
}

- (void)setAutocorrectionList:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutocorrectionList:", v4);

}

- (void)generateCandidates
{
  id v2;

  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generateAutocorrectionsOrCandidates");

}

- (void)generateAutocorrectionsWithShiftState:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generateAutocorrectionsWithShiftState:", v3);

}

- (id)candidatesForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidatesForString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasPrediction:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPrediction:", v4);

  return v6;
}

- (void)acceptCandidateInputEvent:(id)a3 fromCandidateBar:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[TIKeyboardTyper keyboardController](self, "keyboardController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "acceptCandidateInputEvent:fromCandidateBar:", v6, v4);

}

- (void)acceptCandidateFromPredictionBar:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BEB4E28];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setString:", CFSTR(" "));
  objc_msgSend(v6, "setAcceptedCandidate:", v5);

  objc_msgSend(v6, "setSynthesizedByAcceptingCandidate:", 1);
  -[TIKeyboardTyper acceptCandidateInputEvent:fromCandidateBar:](self, "acceptCandidateInputEvent:fromCandidateBar:", v6, 1);

}

- (BOOL)attemptToTapPredictionWithString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[TIKeyboardTyper predictions](self, "predictions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "candidate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          -[TIKeyboardTyper acceptCandidateFromPredictionBar:](self, "acceptCandidateFromPredictionBar:", v10);
          v13 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)attemptToTapPredictionBarCandidateWithString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[TIKeyboardTyper predictionBarCandidates](self, "predictionBarCandidates", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "candidate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          -[TIKeyboardTyper acceptCandidateFromPredictionBar:](self, "acceptCandidateFromPredictionBar:", v10);
          v13 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)attemptToTapAutocorrectionWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  BOOL v10;

  v4 = a3;
  -[TIKeyboardTyper autocorrection](self, "autocorrection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper autocorrection](self, "autocorrection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAutocorrection");

  if (v7
    && (objc_msgSend(v5, "candidate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", v4),
        v8,
        v9))
  {
    -[TIKeyboardTyper acceptCandidateFromPredictionBar:](self, "acceptCandidateFromPredictionBar:", v5);
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)attemptToTapPredictionWithLiteral:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BEB4E20], "candidateWithUnchangedInput:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper acceptCandidateFromPredictionBar:](self, "acceptCandidateFromPredictionBar:", v4);

}

@end
