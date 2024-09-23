@implementation TIInputManagerHandwriting

- (TIInputManagerHandwriting)initWithConfig:(id)a3 keyboardState:(id)a4
{
  id v6;
  TIInputManagerHandwriting *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *candidateRefsDictionary;
  NSMutableArray *v10;
  NSMutableArray *committedCandidates;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TIInputManagerHandwriting;
  v7 = -[TIInputManagerHandwriting initWithConfig:keyboardState:](&v18, sel_initWithConfig_keyboardState_, v6, a4);
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    candidateRefsDictionary = v7->_candidateRefsDictionary;
    v7->_candidateRefsDictionary = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    committedCandidates = v7->_committedCandidates;
    v7->_committedCandidates = v10;

    objc_msgSend(MEMORY[0x24BEB5470], "sharedWordSearchController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wordSearchForInputMode:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v7->_wordSearch, v14);
    v15 = -[TIInputManagerHandwriting recognizer](v7, "recognizer");
    objc_msgSend(MEMORY[0x24BEB5398], "sharedController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addActivityObserver:", v7);

  }
  return v7;
}

- (void)initImplementation
{
  void *result;
  uint64_t v3;

  result = *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (!result)
  {
    v3 = operator new();
    return (void *)MEMORY[0x2495974C4](v3);
  }
  return result;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id dictionaryUpdateObserver;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_contactObserver)
  {
    TIPersonalizationContactOSLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s TIInputManagerHandwriting:delloc - removing observer"), "-[TIInputManagerHandwriting dealloc]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_248040000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BEB5440], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeContactObserver:", self->_contactObserver);

  }
  if (self->_userDictionaryObserver)
  {
    objc_msgSend(MEMORY[0x24BEB5458], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self->_userDictionaryObserver);

  }
  if (self->_dictionaryUpdateObserver)
  {
    objc_msgSend(MEMORY[0x24BEB5400], "removeMobileAssetListener:");
    dictionaryUpdateObserver = self->_dictionaryUpdateObserver;
    self->_dictionaryUpdateObserver = 0;

  }
  -[RecognizerProvider setRecognizerDidLoadBlock:](self->_recognizerProvider, "setRecognizerDidLoadBlock:", 0);
  objc_msgSend(MEMORY[0x24BEB5398], "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeActivityObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)TIInputManagerHandwriting;
  -[TIInputManagerHandwriting dealloc](&v9, sel_dealloc);
}

- (CHRecognizer)recognizer
{
  void *v2;
  void *v3;

  -[TIInputManagerHandwriting recognizerProvider](self, "recognizerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CHRecognizer *)v3;
}

- (RecognizerProvider)recognizerProvider
{
  RecognizerProvider *recognizerProvider;
  RecognizerProvider *v4;
  void *v5;
  RecognizerProvider *v6;
  RecognizerProvider *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id from;
  id location;

  recognizerProvider = self->_recognizerProvider;
  if (!recognizerProvider)
  {
    v4 = [RecognizerProvider alloc];
    -[TIInputManagerHandwriting recognitionLanguage](self, "recognitionLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[RecognizerProvider initWithRecognitionLanguage:mode:](v4, "initWithRecognitionLanguage:mode:", v5, -[TIInputManagerHandwriting recognitionMode](self, "recognitionMode"));
    v7 = self->_recognizerProvider;
    self->_recognizerProvider = v6;

    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_recognizerProvider);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __47__TIInputManagerHandwriting_recognizerProvider__block_invoke;
    v9[3] = &unk_251980380;
    objc_copyWeak(&v10, &location);
    objc_copyWeak(&v11, &from);
    -[RecognizerProvider setRecognizerDidLoadBlock:](self->_recognizerProvider, "setRecognizerDidLoadBlock:", v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    recognizerProvider = self->_recognizerProvider;
  }
  return recognizerProvider;
}

- (void)keyboardActivityDidTransition:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "toState") == 3)
  {
    if (TICanLogMessageAtLevel())
    {
      TIOSLogFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s releasing CHRecognizer due to kbd inactivity"), "-[TIInputManagerHandwriting keyboardActivityDidTransition:]");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v8 = v6;
        _os_log_debug_impl(&dword_248040000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    -[TIInputManagerHandwriting recognizerProvider](self, "recognizerProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unloadRecognizer");

  }
}

- (void)suspend
{
  void *v3;
  objc_super v4;

  -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4.receiver = self;
  v4.super_class = (Class)TIInputManagerHandwriting;
  -[TIKeyboardInputManagerBase suspend](&v4, sel_suspend);
}

- (void)updateAddressBook
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id contactObserver;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x2495977F4](self->_contactObserver, a2);
  -[TIInputManagerHandwriting recognizerProvider](self, "recognizerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TIPersonalizationContactOSLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s TIInputManagerHandwriting:updateAddressBook - adding observer"), "-[TIInputManagerHandwriting updateAddressBook]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_248040000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BEB5440], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __46__TIInputManagerHandwriting_updateAddressBook__block_invoke;
  v17 = &unk_2519803D0;
  v8 = v4;
  v18 = v8;
  objc_msgSend(v7, "addContactObserver:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  contactObserver = self->_contactObserver;
  self->_contactObserver = v9;

  if (v3)
  {
    TIPersonalizationContactOSLogFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s TIInputManagerHandwriting:updateAddressBook - removing observer"), "-[TIInputManagerHandwriting updateAddressBook]", v14, v15, v16, v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_248040000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BEB5440], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeContactObserver:", v3);

  }
}

- (void)updateUserWordEntries
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id userDictionaryObserver;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = self->_userDictionaryObserver;
  -[TIInputManagerHandwriting recognizerProvider](self, "recognizerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB5458], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__TIInputManagerHandwriting_updateUserWordEntries__block_invoke;
  v10[3] = &unk_2519803F8;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "addObserver:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  userDictionaryObserver = self->_userDictionaryObserver;
  self->_userDictionaryObserver = v7;

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEB5458], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:", v3);

  }
}

- (void)updateDictionaryPaths
{
  void *v3;
  _QWORD v4[5];

  if (-[TIInputManagerHandwriting shouldUpdateDictionaryPaths](self, "shouldUpdateDictionaryPaths"))
  {
    -[TIInputManagerHandwriting recognizerProvider](self, "recognizerProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __50__TIInputManagerHandwriting_updateDictionaryPaths__block_invoke;
    v4[3] = &unk_251980420;
    v4[4] = self;
    objc_msgSend(v3, "provideRecognizerToBlock:", v4);

  }
}

- (BOOL)shouldUpdateDictionaryPaths
{
  return 0;
}

- (BOOL)shouldCommitInputString
{
  void *v3;
  char v4;

  if (self->_showingCompletionCandidates)
    return 1;
  -[TIInputManagerHandwriting keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hardwareKeyboardMode");

  return v4;
}

- (id)candidateResultSet
{
  void *v3;
  void *v4;

  if ((-[TIInputManagerHandwriting shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection") & 1) == 0)
  {
    -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else if (!-[TIInputManagerHandwriting showingFacemarks](self, "showingFacemarks"))
    {
      if (-[TIInputManagerHandwriting updateCompletionCandidatesIfAppropriate](self, "updateCompletionCandidatesIfAppropriate"))
      {
        goto LABEL_7;
      }
      goto LABEL_9;
    }
    if (-[TIInputManagerHandwriting updateCandidates](self, "updateCandidates"))
    {
LABEL_7:
      -[TIInputManagerHandwriting keyboardCandidateResultSetFromResults](self, "keyboardCandidateResultSetFromResults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
LABEL_9:
    objc_msgSend(MEMORY[0x24BEB4E18], "dummySet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = 0;
  return v3;
}

- (id)keyboardCandidateResultSetFromResults
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[6];
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__782;
  v29 = __Block_byref_object_dispose__783;
  v30 = 0;
  -[TIInputManagerHandwriting proactiveTriggers](self, "proactiveTriggers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB5428], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "usePQT2Flow");

    if (!v5)
      goto LABEL_10;
  }
  -[TIInputManagerHandwriting keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureCandidateRenderTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisableHideMyEmail:", 1);

  -[TIInputManagerHandwriting keyboardState](self, "keyboardState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secureCandidateRenderTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "singleCellWidth");
  if (v10 > 0.0 && (objc_msgSend(v9, "singleCellHeight"), v11 > 0.0)
    || (objc_msgSend(v9, "cellWidthOptions"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    -[TIInputManagerHandwriting candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "asynchronous");

    -[TIInputManagerHandwriting proactiveTriggers](self, "proactiveTriggers");
    v15 = objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __66__TIInputManagerHandwriting_keyboardCandidateResultSetFromResults__block_invoke;
    v23[3] = &unk_251980448;
    v24 = v14;
    v23[4] = self;
    v23[5] = &v25;
    -[TIInputManagerHandwriting generateAndRenderProactiveSuggestionsWithTriggers:withAdditionalPredictions:withInput:async:completionHandler:](self, "generateAndRenderProactiveSuggestionsWithTriggers:withAdditionalPredictions:withInput:async:completionHandler:", v15, 0, &stru_251980880, v14, v23);
  }
  else
  {
    if (!TICanLogMessageAtLevel())
      goto LABEL_9;
    TIOSLogFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: Not generating proactive candidates - invalid secure candidate width or height trait"), "-[TIInputManagerHandwriting keyboardCandidateResultSetFromResults]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v32 = v22;
      _os_log_debug_impl(&dword_248040000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }

LABEL_9:
LABEL_10:
  if (objc_msgSend((id)v26[5], "count"))
  {
    v16 = (void *)MEMORY[0x24BEB4E18];
    v17 = v26[5];
    -[TIInputManagerHandwriting proactiveTriggers](self, "proactiveTriggers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithCandidates:proactiveTriggers:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TIInputManagerHandwriting candidates](self, "candidates");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputManagerHandwriting proactiveTriggers](self, "proactiveTriggers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputManagerHandwriting candidateResultSetFromCandidates:proactiveTriggers:](self, "candidateResultSetFromCandidates:proactiveTriggers:", v18, v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v25, 8);

  return v19;
}

- (id)defaultCandidate
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[TIInputManagerHandwriting candidates](self, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {

    return 0;
  }
  v4 = -[TIInputManagerHandwriting inputCount](self, "inputCount");

  if (!v4)
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TIInputManagerHandwriting candidates](self, "candidates", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
      if (!-[TIInputManagerHandwriting isDummyCandidate:](self, "isDummyCandidate:", v10)
        && !objc_msgSend(v10, "isExtensionCandidate"))
      {
        break;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    v12 = v10;

    if (v12)
      return v12;
  }
  else
  {
LABEL_12:

  }
  -[TIInputManagerHandwriting candidates](self, "candidates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (!-[TIInputManagerHandwriting isDummyCandidate:](self, "isDummyCandidate:", v14))
    v12 = v14;

  return v12;
}

- (unint64_t)initialSelectedIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isDummyCandidate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x24BDBCEF8];
  v4 = a3;
  objc_msgSend(v3, "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (id)markedTextForDefaultCandidate
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[TIInputManagerHandwriting defaultCandidate](self, "defaultCandidate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "candidate");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("　");
  }

  return v4;
}

- (NSArray)facemarkCandidates
{
  NSArray *facemarkCandidates;
  NSArray *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  facemarkCandidates = self->_facemarkCandidates;
  if (!facemarkCandidates)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = objc_alloc(MEMORY[0x24BDBCEA0]);
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languageWithRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithLocaleIdentifier:", v7);

    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = (id)objc_msgSend(MEMORY[0x24BEDC7F8], "copyFacemarkCandidatesForLocale:", v8);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      v13 = *MEMORY[0x24BEB5A98];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v15 = (void *)MEMORY[0x24BEB4E20];
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "string");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "candidateWithCandidate:forInput:", v16, v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v4, "addObject:", v17);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v18 = self->_facemarkCandidates;
    self->_facemarkCandidates = v4;

    facemarkCandidates = self->_facemarkCandidates;
  }
  return facemarkCandidates;
}

- (void)syncMarkedTextForKeyboardState:(id)a3 afterContextChange:(BOOL)a4
{
  void *v5;
  uint64_t v6;

  if (a4)
  {
    objc_msgSend(a3, "inputForMarkedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (!v6)
      -[TIInputManagerHandwriting clearInput](self, "clearInput");
  }
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  _BOOL4 showingCompletionCandidates;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputManagerHandwriting addInputObject:](self, "addInputObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setString:", v10);

  }
  objc_msgSend(v6, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputManagerHandwriting setShowingFacemarks:](self, "setShowingFacemarks:", 0);
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("☻"));
  -[TIInputManagerHandwriting candidates](self, "candidates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v12)
  {
    if (v13 && !self->_showingCompletionCandidates)
    {
      v22 = objc_msgSend(v11, "length");

      if (v22)
      {
        -[TIInputManagerHandwriting acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
        -[TIInputManagerHandwriting setCandidates:](self, "setCandidates:", 0);
        goto LABEL_21;
      }
    }
    else
    {

    }
    -[TIInputManagerHandwriting candidates](self, "candidates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      showingCompletionCandidates = self->_showingCompletionCandidates;

      if (!showingCompletionCandidates)
      {
LABEL_13:
        -[TIInputManagerHandwriting markedTextForDefaultCandidate](self, "markedTextForDefaultCandidate");
        v19 = objc_claimAutoreleasedReturnValue();

        -[TIInputManagerHandwriting setInput:](self, "setInput:", v19);
        -[TIInputManagerHandwriting setMarkedText](self, "setMarkedText");
        v11 = (void *)v19;
        goto LABEL_22;
      }
    }
    else if (!-[TIInputManagerHandwriting inputCount](self, "inputCount"))
    {
      -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "numberOfStrokes"))
      {
        v21 = self->_showingCompletionCandidates;

        if (!v21)
          goto LABEL_13;
      }
      else
      {

      }
    }
LABEL_21:
    objc_msgSend(v7, "insertText:", v11);
    goto LABEL_22;
  }
  if (v13)
  {
    v15 = self->_showingCompletionCandidates;

    if (!v15)
    {
      -[TIInputManagerHandwriting acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
      -[TIInputManagerHandwriting setCandidates:](self, "setCandidates:", 0);
    }
  }
  -[TIInputManagerHandwriting facemarkCandidates](self, "facemarkCandidates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputManagerHandwriting setCandidates:](self, "setCandidates:", v16);

  self->_showingCompletionCandidates = 0;
  -[TIInputManagerHandwriting setShowingFacemarks:](self, "setShowingFacemarks:", 1);
  objc_msgSend(v6, "setString:", *MEMORY[0x24BEB5A98]);
  v23.receiver = self;
  v23.super_class = (Class)TIInputManagerHandwriting;
  -[TIInputManagerHandwriting addInput:withContext:](&v23, sel_addInput_withContext_, v6, v7);
LABEL_22:

}

- (void)cancelRecognition
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x24BEB5460], "sharedOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__TIInputManagerHandwriting_cancelRecognition__block_invoke;
  v5[3] = &unk_251980478;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

- (id)addInputObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[TIInputManagerHandwriting cancelRecognition](self, "cancelRecognition");
  -[TIInputManagerHandwriting setUserDrawing:](self, "setUserDrawing:", v4);

  -[TIInputManagerHandwriting resetCompletionStates](self, "resetCompletionStates");
  -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfStrokes");

  if (!v6)
    -[TIInputManagerHandwriting clearInput](self, "clearInput");
  return &stru_251980880;
}

- (id)historyForRecognition
{
  return (id)-[TIInputManagerHandwriting contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 10);
}

- (BOOL)updateCandidates
{
  BOOL v3;
  void *v4;
  void *v5;
  RecognizeDrawingOperation *v6;
  void *v7;
  void *v8;
  RecognizeDrawingOperation *v9;

  -[TIInputManagerHandwriting cancelRecognition](self, "cancelRecognition");
  v3 = -[TIInputManagerHandwriting showingFacemarks](self, "showingFacemarks");
  if (!v3)
  {
    -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BEB5460], "sharedOperationQueue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = [RecognizeDrawingOperation alloc];
      -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIInputManagerHandwriting historyForRecognition](self, "historyForRecognition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RecognizeDrawingOperation initWithInputManager:strokes:history:](v6, "initWithInputManager:strokes:history:", self, v7, v8);
      objc_msgSend(v5, "addOperation:", v9);

    }
  }
  return v3;
}

- (void)mainThreadUpdateCandidates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  TIInputManagerHandwriting *v15;
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
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isCancelled") & 1) == 0)
  {
    -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v4, "candidates");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = v4;
      objc_msgSend(v4, "candidates");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v31;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v31 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v12), "mecabraHandwritingCandidate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4D38]), "initWithCandidate:forInput:uniqueID:completionUniqueID:", MecabraCandidateGetSurface(), 0, v13, 0);
              -[TIInputManagerHandwriting candidateRefsDictionary](self, "candidateRefsDictionary");
              v15 = self;
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v13);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKey:", v13, v17);

              self = v15;
              objc_msgSend(v29, "addObject:", v14);

            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v10);
      }

      v4 = v28;
      objc_msgSend(v28, "stickers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIInputManagerHandwriting processCandidates:stickers:](self, "processCandidates:stickers:", v29, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIInputManagerHandwriting setCandidates:](self, "setCandidates:", v19);

      -[TIInputManagerHandwriting resetCompletionStates](self, "resetCompletionStates");
      -[TIInputManagerHandwriting candidates](self, "candidates");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[TIInputManagerHandwriting candidates](self, "candidates");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIInputManagerHandwriting proactiveTriggers](self, "proactiveTriggers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIInputManagerHandwriting candidateResultSetFromCandidates:proactiveTriggers:](self, "candidateResultSetFromCandidates:proactiveTriggers:", v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v24 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "arrayWithObject:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIInputManagerHandwriting setCandidates:](self, "setCandidates:", v26);

        objc_msgSend(MEMORY[0x24BEB4E18], "dummySet");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[TIInputManagerHandwriting markedTextForDefaultCandidate](self, "markedTextForDefaultCandidate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIInputManagerHandwriting setInput:](self, "setInput:", v27);

      -[TIInputManagerHandwriting setMarkedText](self, "setMarkedText");
      -[TIInputManagerHandwriting closeCandidateGenerationContextWithResults:](self, "closeCandidateGenerationContextWithResults:", v23);

    }
  }

}

- (id)didAcceptCandidate:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
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
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
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
  unint64_t v46;
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
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  id v67;
  char v69;

  v4 = a3;
  objc_msgSend(v4, "proactiveTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TIInputManagerHandwriting isInCompletionMode](self, "isInCompletionMode"))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();
  if (objc_msgSend(v4, "isResponseKitCandidate"))
  {
    v8 = (void *)MEMORY[0x24BE808F8];
    v9 = *MEMORY[0x24BE80920];
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "normalizedIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetBaseLanguage();
    v69 = isKindOfClass;
    v12 = v7;
    v13 = v5;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "incrementAggdKeyForCategory:forAction:withLanguageID:", 0, v9, v14);

    v15 = (void *)MEMORY[0x24BE808F8];
    objc_msgSend(v4, "responseKitCategory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "normalizedIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetBaseLanguage();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "incrementAggdKeyForCategory:forAction:withLanguageID:", v16, v9, v19);

    v5 = v13;
    v7 = v12;
    isKindOfClass = v69;

  }
  if (!v5)
    goto LABEL_11;
  if (!-[TIInputManagerHandwriting shouldLearnAcceptedCandidate](self, "shouldLearnAcceptedCandidate"))
    goto LABEL_11;
  -[TIInputManagerHandwriting candidateRefsDictionary](self, "candidateRefsDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proactiveTrigger");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "attributes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BEB5260]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v4, "candidate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    MecabraCandidateSetDisplayString();

    -[TIInputManagerHandwriting wordSearch](self, "wordSearch");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "acceptCandidate:", v24);

    -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v24);

    v28 = 1;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:
    v28 = 0;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_15;
  }
  if (-[TIInputManagerHandwriting shouldLearnAcceptedCandidate](self, "shouldLearnAcceptedCandidate"))
  {
    -[TIInputManagerHandwriting candidateRefsDictionary](self, "candidateRefsDictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mecabraCandidatePointerValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[TIInputManagerHandwriting wordSearch](self, "wordSearch");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "acceptCandidate:", v31);

      -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v31);

      v28 = 1;
    }
  }
LABEL_15:
  if ((v7 & 1) != 0 && -[TIInputManagerHandwriting shouldLearnAcceptedCandidate](self, "shouldLearnAcceptedCandidate"))
  {
    v34 = v4;
    if (objc_msgSend(v34, "uniqueID"))
    {
      -[TIInputManagerHandwriting candidateRefsDictionary](self, "candidateRefsDictionary");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v34, "uniqueID"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        -[TIInputManagerHandwriting wordSearch](self, "wordSearch");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "acceptCandidate:", v37);

        -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v37);

        v28 = 1;
      }
    }
    if (objc_msgSend(v34, "completionUniqueID"))
    {
      if (-[TIInputManagerHandwriting shouldLearnAcceptedCandidate](self, "shouldLearnAcceptedCandidate"))
      {
        -[TIInputManagerHandwriting candidateRefsDictionary](self, "candidateRefsDictionary");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v34, "completionUniqueID"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          -[TIInputManagerHandwriting wordSearch](self, "wordSearch");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "acceptCandidate:", v42);

          -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObject:", v42);

          goto LABEL_27;
        }
      }
    }

  }
  if ((v28 & 1) != 0)
    goto LABEL_28;
  -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "removeAllObjects");
LABEL_27:

LABEL_28:
  -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "count");

  if (v46 >= 0xB)
  {
    -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "removeObjectsInRange:", 0, objc_msgSend(v48, "count") - 10);

  }
  objc_msgSend(v4, "candidate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[TIInputManagerHandwriting usageTrackingKeyForStatistic:](self, "usageTrackingKeyForStatistic:", *MEMORY[0x24BEB51B0]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "totalNumberOfPoints");
    TIStatisticDistributionPushValue();

    -[TIInputManagerHandwriting usageTrackingKeyForStatistic:](self, "usageTrackingKeyForStatistic:", *MEMORY[0x24BEB51B8]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "numberOfStrokes");
    TIStatisticDistributionPushValue();

  }
  if (-[TIInputManagerHandwriting isInCompletionMode](self, "isInCompletionMode"))
  {
    -[TIInputManagerHandwriting usageTrackingKeyForStatistic:](self, "usageTrackingKeyForStatistic:", *MEMORY[0x24BEB51A0]);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();

  }
  v56 = (void *)MEMORY[0x24BDD17C8];
  v57 = *MEMORY[0x24BEB5198];
  -[TIInputManagerHandwriting candidates](self, "candidates");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "stringWithFormat:", CFSTR("%@.%lu"), v57, objc_msgSend(v58, "indexOfObject:", v4));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIInputManagerHandwriting usageTrackingKeyForStatistic:](self, "usageTrackingKeyForStatistic:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement();

  if (objc_msgSend(v4, "isAddress"))
  {
    -[TIInputManagerHandwriting keyboardState](self, "keyboardState");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "documentState");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "contextBeforeInput");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v63, "length"))
    {
      objc_msgSend(v49, "_firstGrapheme");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "_containsCJScripts");

      if ((v65 & 1) != 0)
        goto LABEL_40;
      objc_msgSend(CFSTR(" "), "stringByAppendingString:", v49);
      v61 = v49;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {

    }
  }
LABEL_40:
  if (v5)
    v66 = v49;
  else
    v66 = 0;
  v67 = v66;

  return v67;
}

- (void)clearCandidateRefsDictionary
{
  id v2;

  -[TIInputManagerHandwriting candidateRefsDictionary](self, "candidateRefsDictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (unint64_t)predictionOptions:(BOOL)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  int v7;

  if (a3)
    v4 = 8;
  else
    v4 = 0;
  if (-[TIInputManagerHandwriting shouldLearnAcceptedCandidate](self, "shouldLearnAcceptedCandidate"))
    v5 = v4;
  else
    v5 = v4 | 4;
  -[TIInputManagerHandwriting keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "candidateSelectionPredictionEnabled");

  if (v7)
    return v5;
  else
    return v5 | 0x20;
}

- (BOOL)shouldLookForCompletionCandidates
{
  _BOOL4 v3;
  void *v4;

  if (-[TIInputManagerHandwriting inputCount](self, "inputCount"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      LOBYTE(v3) = 0;
    else
      v3 = !-[TIInputManagerHandwriting showingFacemarks](self, "showingFacemarks");

  }
  return v3;
}

- (void)resetCompletionStates
{
  self->_showingCompletionCandidates = 0;
  -[TIInputManagerHandwriting setIsInCompletionMode:](self, "setIsInCompletionMode:", 0);
}

- (BOOL)updateCompletionCandidatesIfAppropriate
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  GeneratePredictionsOperation *v26;
  uint64_t v27;
  id v28;
  GeneratePredictionsOperation *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  GeneratePredictionsOperation *v35;
  void *v36;
  void *v38;
  void *v39;
  _QWORD v40[4];
  GeneratePredictionsOperation *v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  GeneratePredictionsOperation *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = -[TIInputManagerHandwriting shouldLookForCompletionCandidates](self, "shouldLookForCompletionCandidates");
  if (!v3)
  {
    -[TIInputManagerHandwriting resetCompletionStates](self, "resetCompletionStates");
    -[TIInputManagerHandwriting setCandidates:](self, "setCandidates:", MEMORY[0x24BDBD1A8]);
    return !v3;
  }
  -[TIInputManagerHandwriting setCandidates:](self, "setCandidates:", 0);
  self->_showingCompletionCandidates = 0;
  -[TIInputManagerHandwriting clearCandidateRefsDictionary](self, "clearCandidateRefsDictionary");
  -[TIInputManagerHandwriting contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputManagerHandwriting setIsInCompletionMode:](self, "setIsInCompletionMode:", 1);
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v56;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v56 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "appendString:", MecabraCandidateGetSurface());
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v8);
  }

  -[TIInputManagerHandwriting contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", objc_msgSend(v5, "length") + 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") && objc_msgSend(v5, "length"))
  {
    v13 = objc_msgSend(v11, "hasSuffix:", v5);

    if ((v13 & 1) != 0)
      goto LABEL_14;
    -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");
  }

LABEL_14:
  -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  v39 = v4;
  if (!v15)
  {
    v16 = v4;
    goto LABEL_21;
  }
  if (objc_msgSend(v5, "length") && objc_msgSend(v11, "hasSuffix:", v5))
  {
    objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - objc_msgSend(v5, "length"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
    v17 = v16;
    goto LABEL_22;
  }
  v17 = 0;
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD16A8], "string", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v52;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v52 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v18, "appendString:", MecabraCandidateGetSurface());
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[GeneratePredictionsOperation initWithInputManager:predictionOptions:prefixContext:]([GeneratePredictionsOperation alloc], "initWithInputManager:predictionOptions:prefixContext:", self, -[TIInputManagerHandwriting predictionOptions:](self, "predictionOptions:", 0), v17);
  v27 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke;
  v47[3] = &unk_2519804A0;
  v47[4] = self;
  v28 = v24;
  v48 = v28;
  v29 = v26;
  v49 = v29;
  v30 = v25;
  v50 = v30;
  v43[0] = v27;
  v43[1] = 3221225472;
  v43[2] = __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_2;
  v43[3] = &unk_251980568;
  v43[4] = self;
  v44 = v28;
  v45 = v30;
  v46 = (id)MEMORY[0x2495977F4](v47);
  v31 = v30;
  v32 = v28;
  v33 = v46;
  v40[0] = v27;
  v40[1] = 3221225472;
  v40[2] = __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_7;
  v40[3] = &unk_251980590;
  v41 = v29;
  v42 = (id)MEMORY[0x2495977F4](v43);
  v34 = v42;
  v35 = v29;
  -[GeneratePredictionsOperation setCompletionBlock:](v35, "setCompletionBlock:", v40);
  objc_msgSend(MEMORY[0x24BEB5460], "sharedOperationQueue");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addOperation:", v35);

  return !v3;
}

- (void)clearInput
{
  objc_super v3;

  -[TIInputManagerHandwriting setUserDrawing:](self, "setUserDrawing:", 0);
  -[TIInputManagerHandwriting setCandidates:](self, "setCandidates:", 0);
  -[TIInputManagerHandwriting clearCandidateRefsDictionary](self, "clearCandidateRefsDictionary");
  -[TIInputManagerHandwriting cancelRecognition](self, "cancelRecognition");
  v3.receiver = self;
  v3.super_class = (Class)TIInputManagerHandwriting;
  -[TIInputManagerHandwriting clearInput](&v3, sel_clearInput);
}

- (void)deleteFromInputWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  BOOL v21;
  int v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;

  v31 = a3;
  -[TIInputManagerHandwriting setCandidates:](self, "setCandidates:", 0);
  -[TIInputManagerHandwriting resetCompletionStates](self, "resetCompletionStates");
  -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  if (-[TIInputManagerHandwriting inputIndex](self, "inputIndex"))
  {
    -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TIInputManagerHandwriting usageTrackingKeyForStatistic:](self, "usageTrackingKeyForStatistic:", *MEMORY[0x24BEB51A8]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrement();

    }
    -[TIInputManagerHandwriting setCandidates:](self, "setCandidates:", 0);
    -[TIInputManagerHandwriting cancelRecognition](self, "cancelRecognition");
    -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RecognizeDrawingOperation drawingWithStrokes:](RecognizeDrawingOperation, "drawingWithStrokes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIInputManagerHandwriting recognizer](self, "recognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[TIInputManagerHandwriting recognizer](self, "recognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) != 0)
    {
      -[TIInputManagerHandwriting keyboardState](self, "keyboardState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIInputManagerHandwriting historyForRecognition](self, "historyForRecognition");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[RecognizeDrawingOperation textRecognitionResultsForDrawing:withRecognizer:keyboardState:history:shouldCancel:](RecognizeDrawingOperation, "textRecognitionResultsForDrawing:withRecognizer:keyboardState:history:shouldCancel:", v8, v11, v12, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "lastTokenStrokeIndexes");
    }
    else
    {
      -[TIInputManagerHandwriting historyForRecognition](self, "historyForRecognition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = +[RecognizeDrawingOperation recognitionResultsForDrawing:withRecognizer:history:shouldCancel:](RecognizeDrawingOperation, "recognitionResultsForDrawing:withRecognizer:history:shouldCancel:", v8, v11, v15, 0);

      -[TIInputManagerHandwriting recognizer](self, "recognizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "strokeIndexesForLastCharacter");
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "numberOfStrokes");

    v20 = objc_msgSend(v17, "lastIndex");
    if (objc_msgSend(v17, "count"))
      v21 = 1;
    else
      v21 = v19 == 0;
    v22 = !v21;
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      while (1)
      {
        -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "numberOfStrokes");

        if (v20 >= v24)
          break;
        -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "removeStrokeAtIndex:", v20);

        v20 = objc_msgSend(v17, "indexLessThanIndex:", v20);
        if (v20 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_19;
      }
      v22 = 1;
    }
LABEL_19:
    -[TIInputManagerHandwriting inputString](self, "inputString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "hasSuffix:", *MEMORY[0x24BEB5A98]);

    if (!v27)
    {
      if (v22)
      {
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 0x7FFFFFFFLL);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "deleteHandwritingStrokes:", v28);
        -[TIInputManagerHandwriting clearInput](self, "clearInput");

        goto LABEL_24;
      }
      objc_msgSend(v31, "deleteHandwritingStrokes:", v17);
      -[TIInputManagerHandwriting userDrawing](self, "userDrawing");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "numberOfStrokes");

      if (v30)
        goto LABEL_24;
    }
    -[TIInputManagerHandwriting clearInput](self, "clearInput");
LABEL_24:

    goto LABEL_25;
  }
  objc_msgSend(v31, "deleteBackward:", 1);
LABEL_25:

}

- (unint64_t)autoquoteType
{
  return 1;
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (BOOL)usesAutoDeleteWord
{
  return 0;
}

- (BOOL)suppliesCompletions
{
  return 1;
}

- (BOOL)suppressPlaceholderCandidate
{
  void *v2;
  char v3;

  -[TIInputManagerHandwriting inputString](self, "inputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("　"));

  return v3;
}

- (BOOL)shouldEnableHalfWidthPunctuationForCurrentInputContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[TIInputManagerHandwriting keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextBeforeInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BEB5490]))
  {
    -[TIInputManagerHandwriting externalStringToInternal:](self, "externalStringToInternal:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = +[TIKeyboardInputManagerChinese shouldEnableHalfWidthPunctuationForDocumentContext:composedText:](TIKeyboardInputManagerChinese, "shouldEnableHalfWidthPunctuationForDocumentContext:composedText:", v5, v6);

  return v7;
}

- (id)keyboardConfigurationLayoutTag
{
  if (-[TIInputManagerHandwriting shouldEnableHalfWidthPunctuationForCurrentInputContext](self, "shouldEnableHalfWidthPunctuationForCurrentInputContext"))
  {
    return CFSTR("HalfWidthPunctuation");
  }
  else
  {
    return CFSTR("Default");
  }
}

- (int)mecabraLanguage
{
  void *v2;
  int v3;

  -[TIInputManagerHandwriting wordSearch](self, "wordSearch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mecabraLanguage");

  return v3;
}

- (id)processCandidates:(id)a3 stickers:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  int v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  uint64_t v64;
  int v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t m;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  char v94;
  const __CFString *v95;
  char v96;
  uint64_t v97;
  void *v99;
  unint64_t v100;
  id v101;
  void *v102;
  __CFString *v103;
  unint64_t v104;
  unint64_t v105;
  void *v106;
  TIInputManagerHandwriting *v107;
  uint64_t v108;
  int v109;
  unint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  unint64_t v115;
  void *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _BYTE v137[128];
  _BYTE v138[128];
  uint64_t v139;
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v101 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v133, v142, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v134;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v134 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v133 + 1) + 8 * i);
        if ((objc_msgSend(v116, "containsObject:", v12) & 1) == 0)
          objc_msgSend(v116, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v133, v142, 16);
    }
    while (v9);
  }

  v13 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v116, "valueForKey:", CFSTR("candidate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TIInputManagerHandwriting shouldOmitEmojiCandidates](self, "shouldOmitEmojiCandidates"))
    v15 = 0;
  else
    v15 = 2;
  -[TIInputManagerHandwriting contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 10, v7);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = &stru_251980880;
  if (v16)
    v18 = (__CFString *)v16;
  v103 = v18;

  v100 = -[TIInputManagerHandwriting predictionOptions:](self, "predictionOptions:", 1);
  -[TIInputManagerHandwriting mecabraLanguage](self, "mecabraLanguage");
  v115 = v15;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2 * v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v116, "count");
  if (v20)
  {
    v21 = v20;
    v104 = 0;
    v105 = 0;
    v22 = 0;
    v107 = self;
    v114 = v19;
    while (1)
    {
      objc_msgSend(v116, "objectAtIndex:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "isExtensionCandidate") & 1) != 0)
        goto LABEL_92;
      objc_msgSend(v23, "candidate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "length");

      if (!v25)
        goto LABEL_92;
      objc_opt_class();
      v26 = (objc_opt_isKindOfClass() & 1) != 0 ? v23 : 0;
      v27 = v26;
      v28 = v27;
      v29 = 0;
      v111 = v27;
      v113 = v23;
      if (!v22)
      {
        if (v27)
          break;
      }
LABEL_38:
      if ((v29 & 1) == 0 && v105 < v115)
      {
        v44 = v21;
        v109 = v29;
        if (v22)
          v45 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        else
          v45 = (id)objc_msgSend(v101, "mutableCopy");
        v46 = v45;
        objc_msgSend(v113, "candidate");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)MecabraCopyEmojiCharacterArrayForString();

        v131 = 0u;
        v132 = 0u;
        v129 = 0u;
        v130 = 0u;
        v49 = v48;
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v129, v141, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v130;
          do
          {
            for (j = 0; j != v51; ++j)
            {
              if (*(_QWORD *)v130 != v52)
                objc_enumerationMutation(v49);
              v54 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * j);
              if ((objc_msgSend(v19, "containsObject:", v54) & 1) == 0)
              {
                v55 = objc_alloc(MEMORY[0x24BEB4E20]);
                objc_msgSend(v113, "input");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = (void *)objc_msgSend(v55, "initWithCandidate:forInput:", v54, v56);

                v19 = v114;
                objc_msgSend(v46, "addObject:", v57);
                objc_msgSend(v114, "addObject:", v54);

              }
            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v129, v141, 16);
          }
          while (v51);
        }

        v127 = 0u;
        v128 = 0u;
        v125 = 0u;
        v126 = 0u;
        v58 = v46;
        v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v125, v140, 16);
        if (v59)
        {
          v60 = v59;
          v61 = 0;
          v62 = *(_QWORD *)v126;
          do
          {
            for (k = 0; k != v60; ++k)
            {
              if (*(_QWORD *)v126 != v62)
                objc_enumerationMutation(v58);
              v64 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * k);
              if (v61 + 1 + k <= v115)
              {
                objc_msgSend(v116, "insertObject:atIndex:", v64, ++v22);
                ++v44;
              }
              else
              {
                objc_msgSend(v112, "addObject:", v64);
              }
            }
            v61 += v60;
            v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v125, v140, 16);
          }
          while (v60);

          if (v61)
            ++v105;
          self = v107;
          v19 = v114;
        }
        else
        {

          self = v107;
        }
        v29 = v109;

        v21 = v44;
        v23 = v113;
        v28 = v111;
      }
      v65 = v29 ^ 1;
      if (!v28)
        v65 = 0;
      if (v65 == 1)
      {
        -[TIInputManagerHandwriting candidateRefsDictionary](self, "candidateRefsDictionary");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v28, "uniqueID"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectForKey:", v67);
        v68 = objc_claimAutoreleasedReturnValue();

        v102 = (void *)v68;
        if (v68)
        {
          -[TIInputManagerHandwriting wordSearch](self, "wordSearch");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v139 = v68;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v139, 1);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "generatePredictionsWithCandidateContext:stringContext:option:", v70, v103, v100);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v71 = 0;
        }
        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        v72 = v71;
        v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v121, v138, 16);
        v19 = v114;
        if (v73)
        {
          v74 = v73;
          v108 = 0;
          v110 = v21;
          v75 = *(_QWORD *)v122;
          v28 = v111;
          while (2)
          {
            for (m = 0; m != v74; ++m)
            {
              if (*(_QWORD *)v122 != v75)
                objc_enumerationMutation(v72);
              v77 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * m);
              MecabraCandidateGetSurface();
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              if (v78 && MecabraCandidateGetType() != 6)
              {
                v79 = v75;
                objc_msgSend(v28, "candidate");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "stringByAppendingString:", v78);
                v81 = (void *)objc_claimAutoreleasedReturnValue();

                -[TIInputManagerHandwriting candidateRefsDictionary](v107, "candidateRefsDictionary");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v77);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "setObject:forKeyedSubscript:", v77, v83);

                v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4D38]), "initWithCandidate:forInput:uniqueID:completionUniqueID:", v81, 0, objc_msgSend(v111, "uniqueID"), v77);
                objc_msgSend(v116, "insertObject:atIndex:", v84, ++v22);
                ++v110;

                if (v108)
                {

                  ++v104;
                  self = v107;
                  v21 = v110;
                  v28 = v111;
                  v23 = v113;
                  v19 = v114;
                  goto LABEL_89;
                }
                v108 = 1;
                v19 = v114;
                v28 = v111;
                v75 = v79;
              }

            }
            v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v121, v138, 16);
            if (v74)
              continue;
            break;
          }

          if (v108)
            ++v104;
          self = v107;
          v21 = v110;
          v23 = v113;
        }
        else
        {

          v28 = v111;
        }
LABEL_89:

      }
      if (v105 >= v115 || v104 > 1)
      {

        goto LABEL_95;
      }
LABEL_92:

      if (++v22 >= v21)
        goto LABEL_95;
    }
    v30 = v21;
    -[TIInputManagerHandwriting wordSearch](self, "wordSearch");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputManagerHandwriting committedCandidates](self, "committedCandidates");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "generateConversionsForCandidate:candidateContext:stringContext:", v28, v32, v103);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v33, "count"))
    {
      v34 = 0;
      v22 = 0;
      v35 = 0;
      do
      {
        objc_msgSend(v33, "objectAtIndexedSubscript:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4E80]), "initWithMecabraCandidate:", v36);
        objc_msgSend(v37, "candidate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v106, "containsObject:", v38);

        if ((v39 & 1) == 0)
        {
          -[TIInputManagerHandwriting candidateRefsDictionary](v107, "candidateRefsDictionary");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v36);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v36, v41);

          objc_msgSend(v116, "insertObject:atIndex:", v37, ++v22);
          ++v30;
          v35 = 1;
        }

        ++v34;
      }
      while (objc_msgSend(v33, "count") > v34);
      if ((v35 & 1) == 0)
      {
        v42 = v33;
        v29 = 0;
        self = v107;
        v21 = v30;
        v23 = v113;
        v19 = v114;
        v28 = v111;
LABEL_37:

        goto LABEL_38;
      }
      v42 = v33;
      self = v107;
      v21 = v30;
      v28 = v111;
      if (objc_msgSend(v33, "count"))
      {
        v29 = 1;
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 1, objc_msgSend(v101, "count"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "insertObjects:atIndexes:", v101, v43);

      }
      else
      {
        v29 = 1;
      }
      v19 = v114;
    }
    else
    {
      v42 = v33;
      v29 = 0;
      v22 = 0;
      v21 = v30;
    }
    v23 = v113;
    goto LABEL_37;
  }
LABEL_95:
  objc_msgSend(v116, "addObjectsFromArray:", v112);

  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v86 = v116;
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v117, v137, 16);
  if (!v87)
    goto LABEL_112;
  v88 = v87;
  v89 = *(_QWORD *)v118;
  do
  {
    v90 = 0;
    do
    {
      if (*(_QWORD *)v118 != v89)
        objc_enumerationMutation(v86);
      v91 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v90);
      objc_msgSend(v91, "candidate");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v92, "_graphemeCount") == 1)
      {
        if (objc_msgSend(v92, "rangeOfCharacterFromSet:", v85) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v92, "_stringByConvertingFromHalfWidthToFullWidth");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = objc_msgSend(v92, "isEqualToString:", v93);
          v95 = CFSTR("UI-Halfwidth");
          if ((v94 & 1) == 0)
            goto LABEL_103;
          goto LABEL_104;
        }
        if (objc_msgSend(v92, "_containsFullwidthLettersAndNumbersOnly")
          && (objc_msgSend(v92, "_containsHiraganaOrKatakana") & 1) == 0)
        {
          objc_msgSend(v92, "_stringByConvertingFromFullWidthToHalfWidth");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = objc_msgSend(v92, "isEqualToString:", v93);
          v95 = CFSTR("UI-Fullwidth");
          if ((v96 & 1) != 0)
            goto LABEL_104;
LABEL_103:
          objc_msgSend(v91, "setAnnotationText:", v95);
LABEL_104:

        }
      }

      ++v90;
    }
    while (v88 != v90);
    v97 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v117, v137, 16);
    v88 = v97;
  }
  while (v97);
LABEL_112:

  return v86;
}

- (void)setLearnsCorrection:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TIInputManagerHandwriting;
  -[TIInputManagerHandwriting setLearnsCorrection:](&v5, sel_setLearnsCorrection_);
  -[TIInputManagerHandwriting setShouldLearnAcceptedCandidate:](self, "setShouldLearnAcceptedCandidate:", v3);
}

- (CIMCandidateData)candidateData
{
  CIMCandidateData *candidateData;
  CIMCandidateData *v4;
  void *v5;
  CIMCandidateData *v6;
  CIMCandidateData *v7;

  candidateData = self->_candidateData;
  if (!candidateData)
  {
    v4 = [CIMCandidateData alloc];
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CIMCandidateData initWithInputMode:](v4, "initWithInputMode:", v5);
    v7 = self->_candidateData;
    self->_candidateData = v6;

    candidateData = self->_candidateData;
  }
  return candidateData;
}

- (NSLocale)recognitionLanguage
{
  return 0;
}

- (int)recognitionMode
{
  return 2;
}

- (BOOL)isInCompletionMode
{
  return self->_isInCompletionMode;
}

- (void)setIsInCompletionMode:(BOOL)a3
{
  self->_isInCompletionMode = a3;
}

- (BOOL)shouldLearnAcceptedCandidate
{
  return self->_shouldLearnAcceptedCandidate;
}

- (void)setShouldLearnAcceptedCandidate:(BOOL)a3
{
  self->_shouldLearnAcceptedCandidate = a3;
}

- (TIHandwritingStrokes)userDrawing
{
  return self->_userDrawing;
}

- (void)setUserDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_userDrawing, a3);
}

- (BOOL)showingFacemarks
{
  return self->_showingFacemarks;
}

- (void)setShowingFacemarks:(BOOL)a3
{
  self->_showingFacemarks = a3;
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_candidates, a3);
}

- (TIWordSearchHandwriting)wordSearch
{
  return self->_wordSearch;
}

- (NSMutableDictionary)candidateRefsDictionary
{
  return self->_candidateRefsDictionary;
}

- (void)setCandidateRefsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_candidateRefsDictionary, a3);
}

- (NSMutableArray)committedCandidates
{
  return self->_committedCandidates;
}

- (void)setCommittedCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_committedCandidates, a3);
}

- (NSArray)proactiveTriggers
{
  return self->_proactiveTriggers;
}

- (void)setProactiveTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveTriggers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveTriggers, 0);
  objc_storeStrong((id *)&self->_committedCandidates, 0);
  objc_storeStrong((id *)&self->_candidateRefsDictionary, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
  objc_storeStrong((id *)&self->_recognizerProvider, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_candidateData, 0);
  objc_storeStrong((id *)&self->_facemarkCandidates, 0);
  objc_storeStrong((id *)&self->_userDrawing, 0);
  objc_storeStrong(&self->_dictionaryUpdateObserver, 0);
  objc_storeStrong(&self->_userDictionaryObserver, 0);
  objc_storeStrong(&self->_contactObserver, 0);
}

void __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  char v4;
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
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;

  objc_msgSend(a1[4], "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "documentIsEmpty") & 1) != 0)
  {

  }
  else
  {
    v4 = _os_feature_enabled_impl();

    if ((v4 & 1) == 0)
      goto LABEL_7;
  }
  v5 = (void *)MEMORY[0x24BEB5428];
  objc_msgSend(a1[4], "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "keyboardState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "documentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contextBeforeInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "keyboardState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proactiveTriggerForTextContentType:withContextBeforeInput:autofillMode:", v8, v11, objc_msgSend(v12, "autofillMode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(a1[5], "addObject:", v13);

LABEL_7:
  objc_msgSend(a1[4], "candidateRefsDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "candidateRefsDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addEntriesFromDictionary:", v15);

  objc_msgSend(a1[6], "proactiveTriggers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = a1[5];
    objc_msgSend(a1[6], "proactiveTriggers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v18);

  }
  objc_msgSend(a1[4], "setProactiveTriggers:", a1[5]);
  objc_msgSend(a1[6], "candidates");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = a1[7];
    objc_msgSend(a1[6], "candidates");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObjectsFromArray:", v21);

  }
  objc_msgSend(a1[6], "stickers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = a1[7];
    objc_msgSend(a1[6], "stickers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObjectsFromArray:", v24);

  }
  objc_msgSend(a1[4], "setCandidates:", a1[7]);
  if (objc_msgSend(a1[7], "count"))
    *((_BYTE *)a1[4] + 576) = 1;
  v25 = a1[4];
  objc_msgSend(v25, "keyboardCandidateResultSetFromResults");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "closeCandidateGenerationContextWithResults:", v26);

}

void __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
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
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;

  objc_msgSend(a1[4], "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "documentIsEmpty"))
    goto LABEL_6;
  objc_msgSend(a1[4], "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseContext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

LABEL_6:
    goto LABEL_7;
  }
  v6 = (void *)v5;
  objc_msgSend(MEMORY[0x24BEB5428], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "usePQT2Flow");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(a1[4], "keyboardState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "keyboardState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recipientIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "keyboardState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shiftState");

    objc_msgSend(a1[4], "inputMode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "languageWithRegion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "keyboardState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "responseContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    handwritingResponseKitBackgroundQueue();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = a1[7];
    v23 = v10;
    v24 = v12;
    v25 = v15;
    v26 = a1[5];
    v27 = a1[6];
    v19 = v15;
    v20 = v17;
    v21 = v12;
    v22 = v10;
    TIDispatchAsync();

    return;
  }
LABEL_7:
  (*((void (**)(void))a1[7] + 2))();
}

void __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_7(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_8;
  v3[3] = &unk_251980590;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "addOperationWithBlock:", v3);

}

uint64_t __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_8(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD block[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v2 = dispatch_time(0, 100000000);
  v3 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_4;
  block[3] = &unk_2519804C8;
  v21 = v22;
  v20 = *(id *)(a1 + 88);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], block);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB53D8]), "initWithClientIdentifier:andRecipientContactInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (*(_DWORD *)(a1 + 96) == 2)
    v5 = 512;
  else
    v5 = 640;
  objc_msgSend(MEMORY[0x24BE80910], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "identifierForResponseKit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_5;
  v13[3] = &unk_251980518;
  v18 = v22;
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(void **)(a1 + 80);
  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = *(id *)(a1 + 88);
  objc_msgSend(v6, "responsesForMessage:maximumResponses:forContext:withLanguage:options:completionBlock:", v7, 10, v8, v9, v5, v13);

  _Block_object_dispose(v22, 8);
}

uint64_t __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_4(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

void __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_5(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v3 = a2;
  v5 = a1[4];
  v6 = a1[6];
  v7 = a1[7];
  v4 = v3;
  TIDispatchAsync();

}

uint64_t __68__TIInputManagerHandwriting_updateCompletionCandidatesIfAppropriate__block_invoke_6(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(*(_QWORD *)(result + 72) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = *(id *)(result + 32);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (!v3)
      goto LABEL_16;
    v4 = v3;
    v5 = *(_QWORD *)v36;
    v34 = *MEMORY[0x24BE80930];
    v31 = *MEMORY[0x24BE80928];
    v6 = (_QWORD *)MEMORY[0x24BE5EE58];
    v7 = 0x24BEB5000uLL;
    v30 = *(_QWORD *)v36;
    while (1)
    {
      v8 = 0;
      v32 = v4;
      do
      {
        if (*(_QWORD *)v36 != v5)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v8);
        objc_msgSend(v9, "attributes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "attributes");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", *v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "attributes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqualToString:", v34))
          {
            objc_msgSend(MEMORY[0x24BEB5438], "rewriteMoneyAttributes:", v13);
            v14 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v14;
          }
          v15 = (void *)objc_msgSend(objc_alloc(*(Class *)(v7 + 1072)), "initWithSourceType:attributes:", 1, v13);
          objc_msgSend(*(id *)(v2 + 40), "addObject:", v15);

        }
        else
        {
          objc_msgSend(v9, "string");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
            goto LABEL_14;
          v17 = objc_alloc(MEMORY[0x24BEB4E80]);
          objc_msgSend(v9, "string");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "category");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v17, "initWithResponseKitString:responseKitCategory:mecabraCandidatePointerValue:", v18, v19, 0);

          objc_msgSend(v12, "setTypingEngine:", 6);
          v20 = (void *)MEMORY[0x24BE808F8];
          objc_msgSend(*(id *)(v2 + 48), "inputMode");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "normalizedIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          TIInputModeGetBaseLanguage();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "incrementAggdKeyForCategory:forAction:withLanguageID:", 0, v31, v23);

          v24 = (void *)MEMORY[0x24BE808F8];
          objc_msgSend(v9, "category");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v2 + 48), "inputMode");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "normalizedIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          TIInputModeGetBaseLanguage();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v24;
          v5 = v30;
          v7 = 0x24BEB5000;
          objc_msgSend(v29, "incrementAggdKeyForCategory:forAction:withLanguageID:", v25, v31, v28);

          v4 = v32;
          objc_msgSend(*(id *)(v2 + 56), "addObject:", v12);
        }

LABEL_14:
        ++v8;
      }
      while (v4 != v8);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (!v4)
      {
LABEL_16:

        return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 64) + 16))();
      }
    }
  }
  return result;
}

void __46__TIInputManagerHandwriting_cancelRecognition__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v9;
    objc_msgSend(v3, "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);

    if (v4 == v5)
      objc_msgSend(v3, "cancel");

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v9;
    objc_msgSend(v6, "inputManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);

    if (v7 == v8)
      objc_msgSend(v6, "cancel");

  }
}

void __66__TIInputManagerHandwriting_keyboardCandidateResultSetFromResults__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (*(_BYTE *)(a1 + 48) && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
  {
    v5 = (void *)MEMORY[0x24BEB4E18];
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "proactiveTriggers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithCandidates:proactiveTriggers:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "pushCandidateGenerationContextWithResults:", v8);
  }
  if (TICanLogMessageAtLevel())
  {
    TIOSLogFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: Generated proactive candidates: %@"), "-[TIInputManagerHandwriting keyboardCandidateResultSetFromResults]_block_invoke", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v10;
      _os_log_debug_impl(&dword_248040000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }

}

void __50__TIInputManagerHandwriting_updateDictionaryPaths__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BEB5400];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "inputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB5460], "sharedOperationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadMobileAssetContentsWhenMobileAssetChangesForCHRecognizer:inputModes:onQueue:oldMobileAssetChangeListener:", v5, v7, v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 600));
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 600);
  *(_QWORD *)(v10 + 600) = v9;

}

void __50__TIInputManagerHandwriting_updateUserWordEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__TIInputManagerHandwriting_updateUserWordEntries__block_invoke_2;
  v6[3] = &unk_2519803A8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "provideRecognizerToBlock:", v6);

}

void __50__TIInputManagerHandwriting_updateUserWordEntries__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "updateUserDictionaryLexicon:", *(_QWORD *)(a1 + 32));

}

void __46__TIInputManagerHandwriting_updateAddressBook__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  TIPersonalizationContactOSLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s TIInputManagerHandwriting:updateAddressBook - processing %ld contacts"), "-[TIInputManagerHandwriting updateAddressBook]_block_invoke", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_248040000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  TICreateNameReadingPairsFromContactCollection();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__TIInputManagerHandwriting_updateAddressBook__block_invoke_185;
  v9[3] = &unk_2519803A8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "provideRecognizerToBlock:", v9);

}

void __46__TIInputManagerHandwriting_updateAddressBook__block_invoke_185(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "updateAddressBookLexicon:", *(_QWORD *)(a1 + 32));

}

void __47__TIInputManagerHandwriting_recognizerProvider__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v2 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "updateAddressBook");

    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "updateUserWordEntries");

    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "updateDictionaryPaths");

  }
  else
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __47__TIInputManagerHandwriting_recognizerProvider__block_invoke_2;
    v9[3] = &unk_251980358;
    v10 = v5;
    v7 = v5;
    objc_copyWeak(&v11, (id *)(a1 + 32));
    objc_msgSend(v6, "addOperationWithBlock:", v9);

    objc_destroyWeak(&v11);
  }
}

void __47__TIInputManagerHandwriting_recognizerProvider__block_invoke_2(uint64_t a1)
{
  void *v2;
  id *v3;
  id WeakRetained;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "recognizerDidLoadBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "updateAddressBook");

    v5 = objc_loadWeakRetained(v3);
    objc_msgSend(v5, "updateUserWordEntries");

    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "updateDictionaryPaths");

  }
}

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (void)clearObservers
{
  NSObject *v3;
  void *v4;
  void *v5;
  id contactObserver;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_contactObserver)
  {
    TIPersonalizationContactOSLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s TIInputManagerHandwriting:clearObservers - removing observer"), "-[TIInputManagerHandwriting(TestingSupport) clearObservers]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_248040000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BEB5440], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeContactObserver:", self->_contactObserver);

    contactObserver = self->_contactObserver;
    self->_contactObserver = 0;

  }
}

@end
