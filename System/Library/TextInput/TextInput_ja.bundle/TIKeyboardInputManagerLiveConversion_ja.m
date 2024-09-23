@implementation TIKeyboardInputManagerLiveConversion_ja

- (TIKeyboardInputManagerLiveConversion_ja)initWithConfig:(id)a3 keyboardState:(id)a4
{
  TIKeyboardInputManagerLiveConversion_ja *v4;
  TIKeyboardInputManagerLiveConversion_ja *v5;
  void *v6;
  TISmartPunctuationController *v7;
  TISmartPunctuationController *smartPunctuationController;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  v4 = -[TIKeyboardInputManagerMecabra initWithConfig:keyboardState:](&v16, sel_initWithConfig_keyboardState_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[TIKeyboardInputManagerLiveConversion_ja setSegmentIndex:](v4, "setSegmentIndex:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja setCommittedSegments:](v5, "setCommittedSegments:", v6);

    v7 = (TISmartPunctuationController *)objc_alloc_init(MEMORY[0x24BEB4EB0]);
    smartPunctuationController = v5->_smartPunctuationController;
    v5->_smartPunctuationController = v7;

    -[TIKeyboardInputManagerLiveConversion_ja smartPunctuationController](v5, "smartPunctuationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAutoQuoteType:", 1);

    -[TIKeyboardInputManagerLiveConversion_ja smartPunctuationController](v5, "smartPunctuationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSmartDashesEnabled:", 0);

    objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForPreferenceKey:", *MEMORY[0x24BEB50F0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v5->_predictionThreshold = v13;

    -[TIKeyboardInputManagerLiveConversion_ja setCandidateBehavior:](v5, "setCandidateBehavior:", -[TIKeyboardInputManagerLiveConversion_ja preferCandidateBehavior](v5, "preferCandidateBehavior"));
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, sel_preferencesDidChange_, *MEMORY[0x24BEB50F8], 0);

    -[TIKeyboardInputManagerLiveConversion_ja preferencesDidChange:](v5, "preferencesDidChange:", 0);
    TIInputManager::sync_with_input_from_UI(*(TIInputManager **)((char *)&v5->super.super.super.super.super.isa
                                                               + (int)*MEMORY[0x24BEB5498]));
  }
  return v5;
}

- (void)initImplementation
{
  void *result;
  uint64_t v3;

  result = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (!result)
  {
    v3 = operator new();
    return (void *)MEMORY[0x234902528](v3);
  }
  return result;
}

- (id)keyEventMap
{
  return objc_alloc_init(MEMORY[0x24BEB4D60]);
}

- (void)loadDictionaries
{
  void *v3;
  void *v4;
  TIWordSearch *v5;
  TIWordSearch *wordSearch;
  id v7;

  objc_msgSend(MEMORY[0x24BEB5470], "sharedWordSearchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wordSearchForInputMode:", v4);
  v5 = (TIWordSearch *)objc_claimAutoreleasedReturnValue();
  wordSearch = self->_wordSearch;
  self->_wordSearch = v5;

  -[TIKeyboardInputManagerLiveConversion_ja wordSearch](self, "wordSearch");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInsertKatakanaAtIndex:", 4);

}

- (void)loadFavoniusTypingModel
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  v6 = 0;
  v7 = 0;
  std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100]((_QWORD *)(v2 + 232), &v6);
  v3 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

- (BOOL)usesCandidateSelection
{
  void *v2;
  char v3;

  -[TIKeyboardInputManagerLiveConversion_ja keyboardState](self, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suppressingCandidateSelection") ^ 1;

  return v3;
}

- (void)preferencesDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5118]);
  -[TIKeyboardInputManagerLiveConversion_ja smartPunctuationController](self, "smartPunctuationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSmartQuotesEnabled:", v5);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5108]);
  -[TIKeyboardInputManagerLiveConversion_ja smartPunctuationController](self, "smartPunctuationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSmartDashesEnabled:", v7);

}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (id)wordCharacters
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D00], "romajiWordCharacters");
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4DC8]);
}

- (BOOL)supportsSetPhraseBoundary
{
  return 1;
}

- (BOOL)usesLiveConversion
{
  return 1;
}

- (BOOL)delayedCandidateList
{
  return 1;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
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
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  objc_super v43;

  v4 = a3;
  if (TICanLogMessageAtLevel())
  {
    TIOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[TIKeyboardInputManagerLiveConversion_ja handleKeyboardInput:].cold.1(v5);

  }
  objc_msgSend(v4, "acceptedCandidate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isExpandSegment") & 1) != 0 || objc_msgSend(v4, "isShrinkSegment"))
  {
    v9 = objc_msgSend(v4, "isExpandSegment");
    if ((v9 & 1) != 0 || objc_msgSend(v4, "isShrinkSegment"))
      -[TIKeyboardInputManagerLiveConversion_ja _adjustPhraseBoundaryInForwardDirection:granularity:](self, "_adjustPhraseBoundaryInForwardDirection:granularity:", v9, 1);
LABEL_12:
    v10 = objc_alloc_init(MEMORY[0x24BEB4E58]);
    goto LABEL_13;
  }
  objc_msgSend(v4, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("\n")))
  {

LABEL_17:
    -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    v17 = objc_alloc_init(MEMORY[0x24BEB4E58]);
    -[TIKeyboardInputManagerLiveConversion_ja committedSurface](self, "committedSurface");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[TIKeyboardInputManagerLiveConversion_ja committedSurface](self, "committedSurface");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertText:", v19);

    }
    -[TIKeyboardInputManagerLiveConversion_ja topCandidate](self, "topCandidate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "candidate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[TIKeyboardInputManagerLiveConversion_ja topCandidate](self, "topCandidate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "candidate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertText:", v23);

    }
    -[TIKeyboardInputManagerLiveConversion_ja clearInput](self, "clearInput");
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
    if (v16)
      v24 = v17;
    else
      v24 = 0;
    v10 = v24;
    goto LABEL_25;
  }
  objc_msgSend(v4, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("\r"));

  if (v14)
    goto LABEL_17;
  objc_msgSend(v4, "string");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "isEqualToString:", CFSTR(" ")))
  {

LABEL_29:
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleKeyboardInput:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_13;
    -[TIKeyboardInputManagerLiveConversion_ja setCandidateBehavior:](self, "setCandidateBehavior:", 2);
    -[TIKeyboardInputManagerLiveConversion_ja setAutoSelectFirstCandidate:](self, "setAutoSelectFirstCandidate:", 1);
    goto LABEL_12;
  }
  objc_msgSend(v4, "string");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("　"));

  if (v27)
    goto LABEL_29;
  -[TIKeyboardInputManagerLiveConversion_ja setCandidateBehavior:](self, "setCandidateBehavior:", -[TIKeyboardInputManagerLiveConversion_ja preferCandidateBehavior](self, "preferCandidateBehavior"));
  -[TIKeyboardInputManagerLiveConversion_ja setAutoSelectFirstCandidate:](self, "setAutoSelectFirstCandidate:", 0);
  objc_msgSend(v4, "string");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("\x1B"));

  if ((objc_msgSend(v4, "isBackspace") & 1) != 0 || v30)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleKeyboardInput:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      if ((v30 & 1) != 0)
      {
        -[TIKeyboardInputManagerLiveConversion_ja currentCandidate](self, "currentCandidate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerLiveConversion_ja commitCurrentCandidate:](self, "commitCurrentCandidate:", v37 != 0);

      }
      else
      {
        -[TIKeyboardInputManagerLiveConversion_ja commitCurrentCandidate:](self, "commitCurrentCandidate:", 0);
      }
      if (!objc_msgSend(v4, "isBackspace")
        || -[TIKeyboardInputManagerLiveConversion_ja shouldCancelLiveConversionOnBackspace](self, "shouldCancelLiveConversionOnBackspace"))
      {
        -[TIKeyboardInputManagerLiveConversion_ja segmentsForPicker](self, "segmentsForPicker");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "count");

        if (v39)
        {
          -[TIKeyboardInputManagerLiveConversion_ja invokeEditMode](self, "invokeEditMode");
          -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "handleKeyboardInput:", v4);
          v41 = objc_claimAutoreleasedReturnValue();

          v10 = (id)v41;
        }
      }
    }
    if (v10)
    {
      v42 = v10;
    }
    else
    {
      if (-[TIKeyboardInputManagerLiveConversion_ja inputCount](self, "inputCount"))
        goto LABEL_33;
      -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
    }

    goto LABEL_13;
  }
LABEL_33:
  -[TIKeyboardInputManagerLiveConversion_ja setTransliterationType:](self, "setTransliterationType:", objc_msgSend(v4, "transliterationType"));
  if (!objc_msgSend(v4, "transliterationType"))
  {
    -[TIKeyboardInputManagerLiveConversion_ja commitCurrentCandidate](self, "commitCurrentCandidate");
    -[TIKeyboardInputManagerLiveConversion_ja setTopCandidate:](self, "setTopCandidate:", 0);
    v43.receiver = self;
    v43.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
    -[TIKeyboardInputManagerMecabra handleKeyboardInput:](&v43, sel_handleKeyboardInput_, v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja makeCandidatesWithWordSearch:](self, "makeCandidatesWithWordSearch:", v17);
LABEL_25:

    goto LABEL_13;
  }
  -[TIKeyboardInputManagerLiveConversion_ja setCandidateBehavior:](self, "setCandidateBehavior:", 2);
  -[TIKeyboardInputManagerLiveConversion_ja setAutoSelectFirstCandidate:](self, "setAutoSelectFirstCandidate:", 1);
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleKeyboardInput:", v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
    v34 = v32;
  else
    v34 = objc_alloc_init(MEMORY[0x24BEB4E58]);
  v10 = v34;

LABEL_13:
  return v10;
}

- (unsigned)inputCount
{
  void *v2;
  unsigned int v3;

  -[TIKeyboardInputManagerLiveConversion_ja inputString](self, "inputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (id)inputString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  if (-[TIKeyboardInputManagerLiveConversion_ja candidateBehavior](self, "candidateBehavior") == 1
    && !-[TIKeyboardInputManagerLiveConversion_ja conversionEnabled](self, "conversionEnabled"))
  {
    -[TIKeyboardInputManagerLiveConversion_ja displayStringForSearch](self, "displayStringForSearch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    return v12;
  }
  -[TIKeyboardInputManagerLiveConversion_ja currentCandidate](self, "currentCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[TIKeyboardInputManagerLiveConversion_ja currentCandidate](self, "currentCandidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja remainingCandidate](self, "remainingCandidate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidate");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_250122EC0;
    if (v9)
      v11 = (const __CFString *)v9;
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
    return v12;
  }
  -[TIKeyboardInputManagerLiveConversion_ja committedSurface](self, "committedSurface");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[TIKeyboardInputManagerLiveConversion_ja topCandidate](self, "topCandidate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      -[TIKeyboardInputManagerLiveConversion_ja committedSurface](self, "committedSurface");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerLiveConversion_ja topCandidate](self, "topCandidate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "candidate");
      v17 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v17;
      v18 = &stru_250122EC0;
      if (v17)
        v18 = (const __CFString *)v17;
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@%@"), v6, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  -[TIKeyboardInputManagerLiveConversion_ja committedSegments](self, "committedSegments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    -[TIKeyboardInputManagerLiveConversion_ja committedSegments](self, "committedSegments");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja committedSegments](self, "committedSegments");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_surfaceStringWithin:", 0, objc_msgSend(v22, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (NSString)inputStringForHiraganaMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;

  -[TIKeyboardInputManagerLiveConversion_ja currentDictionaryReading](self, "currentDictionaryReading");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIKeyboardInputManagerLiveConversion_ja rawInputStringForAutoCommit](self, "rawInputStringForAutoCommit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja currentDictionaryReading](self, "currentDictionaryReading");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TIKeyboardInputManagerLiveConversion_ja committedSegments](self, "committedSegments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja committedSegments](self, "committedSegments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_readingStringWithin:", 0, objc_msgSend(v8, "count"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_250122EC0;
  -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)displayStringForSearch
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TIKeyboardInputManagerLiveConversion_ja.mm"), 294, CFSTR("%s must be overridden in subclass"), "-[TIKeyboardInputManagerLiveConversion_ja displayStringForSearch]");

  return 0;
}

- (unint64_t)candidateOffset
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v10;

  v3 = (void *)MEMORY[0x24BEB5410];
  -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "splitSegments:at:forPrefix:forSuffix:", v4, 2, &v10, 0);
  v5 = v10;

  -[TIKeyboardInputManagerLiveConversion_ja committedSurface](self, "committedSurface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v8 = objc_msgSend(v5, "length");

  if (v8 + v7)
    return v8 + v7;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setInput:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[TIKeyboardInputManagerLiveConversion_ja _cancelCandidatesThread](self, "_cancelCandidatesThread");
  -[TIKeyboardInputManagerLiveConversion_ja setSegments:](self, "setSegments:", MEMORY[0x24BDBD1A8]);
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  -[TIKeyboardInputManagerLiveConversion_ja setInput:](&v5, sel_setInput_, v4);

}

- (id)markedText
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja inputString](self, "inputString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TIKeyboardInputManagerLiveConversion_ja inputIndex](self, "inputIndex");
  -[TIKeyboardInputManagerLiveConversion_ja searchStringForMarkedText](self, "searchStringForMarkedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TIKeyboardInputManagerLiveConversion_ja candidateOffset](self, "candidateOffset");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja lastInputString](self, "lastInputString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja currentCandidate](self, "currentCandidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", 0, objc_msgSend(v4, "length"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:
    objc_msgSend(v8, "addObject:", v16);

    goto LABEL_11;
  }
  -[TIKeyboardInputManagerLiveConversion_ja remainingCandidate](self, "remainingCandidate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "candidate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", 0, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v14);

  }
  if (v13 < 1)
    v15 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v15 = objc_msgSend(v8, "count");
  v17 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v4, "length");
  objc_msgSend(v17, "valueWithRange:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v18);

  if (v13 >= 1)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", objc_msgSend(v4, "length") - v13, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:
  v19 = (void *)MEMORY[0x24BEB4E38];
  v20 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v19, "intermediateTextWithInputString:displayString:selectionLocation:searchString:candidateOffset:liveConversionSegments:highlightSegmentIndex:lastInputString:", v3, v4, v5, v6, v7, v20, v15, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)rawInputString
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  -[TIKeyboardInputManagerLiveConversion_ja inputString](&v3, sel_inputString);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)rawInputStringForAutoCommit
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;

  -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 3)
  {
    -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_readingStringWithin:", 0, objc_msgSend(v7, "count") - 2);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_250122EC0;
  }
  return v5;
}

- (NSString)rawInputStringForPrediction
{
  void *v2;
  void *v3;
  id v4;
  id v6;

  v2 = (void *)MEMORY[0x24BEB5410];
  -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v2, "splitSegments:at:forPrefix:forSuffix:", v3, 2, 0, &v6);
  v4 = v6;

  return (NSString *)v4;
}

- (void)clearInput
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[TIKeyboardInputManagerLiveConversion_ja _cancelCandidatesThread](self, "_cancelCandidatesThread");
  -[TIKeyboardInputManagerLiveConversion_ja setCurrentCandidate:](self, "setCurrentCandidate:", 0);
  -[TIKeyboardInputManagerLiveConversion_ja setCurrentDictionaryReading:](self, "setCurrentDictionaryReading:", 0);
  -[TIKeyboardInputManagerLiveConversion_ja setTopCandidate:](self, "setTopCandidate:", 0);
  -[TIKeyboardInputManagerLiveConversion_ja setSegmentIndex:](self, "setSegmentIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[TIKeyboardInputManagerLiveConversion_ja setRemainingCandidate:](self, "setRemainingCandidate:", 0);
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja setSegments:](self, "setSegments:", v3);

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja setCommittedSegments:](self, "setCommittedSegments:", v4);

  -[TIKeyboardInputManagerLiveConversion_ja timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[TIKeyboardInputManagerLiveConversion_ja setTimer:](self, "setTimer:", 0);
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  -[TIKeyboardInputManagerMecabra clearInput](&v6, sel_clearInput);
}

- (BOOL)shouldClearInputOnMarkedTextOutOfSync
{
  void *v3;
  char isKindOfClass;
  void *v5;

  +[TIWordSearch sharedOperationQueue](TIWordSearchKana, "sharedOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "operationCount"))
  {
    isKindOfClass = 0;
  }
  else
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (BOOL)inSearchField
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[TIKeyboardInputManagerLiveConversion_ja keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "returnKeyType") == 6)
  {
    v5 = 1;
  }
  else
  {
    -[TIKeyboardInputManagerLiveConversion_ja keyboardState](self, "keyboardState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "keyboardType") == 10)
    {
      v5 = 1;
    }
    else
    {
      -[TIKeyboardInputManagerLiveConversion_ja keyboardState](self, "keyboardState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textInputTraits");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "keyboardType") == 18;

    }
  }

  return v5;
}

- (BOOL)conversionEnabled
{
  void *v2;
  char v3;

  if (!-[TIKeyboardInputManagerLiveConversion_ja inSearchField](self, "inSearchField"))
    return 1;
  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForPreferenceKey:", *MEMORY[0x24BEB4F20]);

  return v3;
}

- (BOOL)shouldCommitHeadSegment
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  -[TIKeyboardInputManagerLiveConversion_ja committedSegments](self, "committedSegments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)(objc_msgSend(v5, "count") + v4) >= 5
    && -[TIKeyboardInputManagerLiveConversion_ja conversionEnabled](self, "conversionEnabled");

  return v6;
}

- (BOOL)shouldCancelLiveConversionOnBackspace
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 2)
    return 1;
  -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", v4 - 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "surface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length") != 1;

  return v8;
}

- (unint64_t)preferCandidateBehavior
{
  return -[TIKeyboardInputManagerLiveConversion_ja inSearchField](self, "inSearchField");
}

- (void)invokeEditMode
{
  TIKeyboardInputManager_ja_Edit *v3;
  void *v4;
  void *v5;
  void *v6;
  TIKeyboardInputManager_ja_Edit *v7;
  id v8;

  v3 = [TIKeyboardInputManager_ja_Edit alloc];
  -[TIKeyboardInputManagerLiveConversion_ja config](self, "config");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja keyboardState](self, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja segmentsForPicker](self, "segmentsForPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja wordSearch](self, "wordSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = -[TIKeyboardInputManager_ja_Edit initWithConfig:keyboardState:segments:wordSearch:romajiMode:conversionEnabled:](v3, "initWithConfig:keyboardState:segments:wordSearch:romajiMode:conversionEnabled:", v8, v4, v5, v6, objc_opt_isKindOfClass() & 1, -[TIKeyboardInputManagerLiveConversion_ja conversionEnabled](self, "conversionEnabled"));
  -[TIKeyboardInputManagerMecabra composeTextWith:](self, "composeTextWith:", v7);

}

- (id)stringByConvertingPunctuationForInput:(id)a3 isLockedInput:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  -[TIKeyboardInputManagerLiveConversion_ja smartPunctuationController](self, "smartPunctuationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "smartPunctuationOutputForInput:isLockedInput:documentState:", v6, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "insertionText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "insertionText");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v6;
  }
  v11 = v10;

  return v11;
}

- (_NSRange)analysisStringRange
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  objc_super v8;
  _NSRange result;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  v3 = -[TIKeyboardInputManagerLiveConversion_ja inputIndex](&v8, sel_inputIndex);
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length");

  }
  v6 = 0;
  v7 = v4;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)validCharacterSetForAutocorrection
{
  if (-[TIKeyboardInputManagerLiveConversion_ja validCharacterSetForAutocorrection]::__onceToken != -1)
    dispatch_once(&-[TIKeyboardInputManagerLiveConversion_ja validCharacterSetForAutocorrection]::__onceToken, &__block_literal_global_2);
  return (id)-[TIKeyboardInputManagerLiveConversion_ja validCharacterSetForAutocorrection]::__validCharSet;
}

- (void)inputLocationChanged
{
  objc_super v3;

  -[TIKeyboardInputManagerLiveConversion_ja _cancelCandidatesThread](self, "_cancelCandidatesThread");
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  -[TIKeyboardInputManagerLiveConversion_ja inputLocationChanged](&v3, sel_inputLocationChanged);
}

- (void)_deleteFromInput
{
  id v3;
  objc_super v4;

  -[TIKeyboardInputManagerLiveConversion_ja _cancelCandidatesThread](self, "_cancelCandidatesThread");
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  v3 = -[TIKeyboardInputManagerLiveConversion_ja deleteFromInput:](&v4, sel_deleteFromInput_, 0);
}

- (void)deleteFromInputWithContext:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  -[TIKeyboardInputManagerMecabra deleteFromInputWithContext:](&v3, sel_deleteFromInputWithContext_, a3);
}

- (void)selectPartialCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TIWordSearchJapaneseOperationGetCandidates *v7;
  void *v8;
  void *v9;
  void *v10;
  TIWordSearchJapaneseOperationGetCandidates *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  -[TIKeyboardInputManagerLiveConversion_ja rawInputStringForPrediction](self, "rawInputStringForPrediction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v7 = [TIWordSearchJapaneseOperationGetCandidates alloc];
  -[TIKeyboardInputManagerLiveConversion_ja wordSearch](self, "wordSearch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra geometryModelData](self, "geometryModelData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v15) = 1;
  LOWORD(v15) = 0;
  LOBYTE(v14) = 1;
  v11 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v7, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", v8, v16, 0, v9, 0x7FFFFFFFFFFFFFFFLL, 1, v14, 0, self, sel__selectPartialCandidate_forOperation_, v10, v15, 0);

  -[TIWordSearchJapaneseOperationGetCandidates setReferenceMode:](v11, "setReferenceMode:", 1);
  -[TIWordSearchJapaneseOperationGetCandidates setSinglePhrase:](v11, "setSinglePhrase:", 1);
  -[TIWordSearchJapaneseOperationGetCandidates results](v11, "results");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TIWordSearchJapaneseOperationGetCandidates results](v11, "results");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja _selectPartialCandidate:forOperation:](self, "_selectPartialCandidate:forOperation:", v13, v11);
  }
  else
  {
    -[TIKeyboardInputManagerLiveConversion_ja wordSearch](self, "wordSearch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performOperationAsync:", v11);
  }

}

- (void)_selectPartialCandidate:(id)a3 forOperation:(id)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *segments;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  id syncKeyboardStateHandler;
  id obj;

  objc_msgSend(a3, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  obj = (id)objc_claimAutoreleasedReturnValue();

  if (obj)
  {
    -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 < 3)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subarrayWithRange:", 0, objc_msgSend(v9, "count") - 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

    }
    v12 = objc_alloc_init(MEMORY[0x24BEB5410]);
    -[TIKeyboardInputManagerLiveConversion_ja currentCandidate](self, "currentCandidate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "input");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setReading:", v14);

    -[TIKeyboardInputManagerLiveConversion_ja currentCandidate](self, "currentCandidate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSurface:", v16);

    objc_msgSend(v11, "addObject:", v12);
    v17 = objc_alloc_init(MEMORY[0x24BEB5410]);
    objc_msgSend(obj, "input");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setReading:", v18);

    objc_msgSend(obj, "candidate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSurface:", v19);

    objc_msgSend(v11, "addObject:", v17);
    v20 = (NSArray *)objc_msgSend(v11, "copy");
    segments = self->_segments;
    self->_segments = v20;

    objc_storeStrong((id *)&self->_remainingCandidate, obj);
    if (self->_syncKeyboardStateHandler)
    {
      -[TIKeyboardInputManagerLiveConversion_ja syncKeyboardStateHandler](self, "syncKeyboardStateHandler");
      v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerMecabra keyboardConfiguration](self, "keyboardConfiguration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v22)[2](v22, v23);

      syncKeyboardStateHandler = self->_syncKeyboardStateHandler;
      self->_syncKeyboardStateHandler = 0;

    }
  }

}

- (id)candidateResultSet
{
  void *v3;
  void *v4;

  if ((-[TIKeyboardInputManagerLiveConversion_ja shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x24BEB4E18], "dummySet");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  v4 = a3;
  -[TIKeyboardInputManagerLiveConversion_ja timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  -[TIKeyboardInputManagerLiveConversion_ja openCandidateGenerationContextWithCandidateHandler:](&v10, sel_openCandidateGenerationContextWithCandidateHandler_, v4);

  if (-[TIKeyboardInputManagerLiveConversion_ja candidateBehavior](self, "candidateBehavior") != 1)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __94__TIKeyboardInputManagerLiveConversion_ja_openCandidateGenerationContextWithCandidateHandler___block_invoke;
    v9[3] = &unk_250122878;
    v9[4] = self;
    v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x2349027B0](v9);
    if (-[TIKeyboardInputManagerLiveConversion_ja candidateBehavior](self, "candidateBehavior") == 2
      || -[TIKeyboardInputManagerLiveConversion_ja transliterationType](self, "transliterationType")
      || -[TIKeyboardInputManagerLiveConversion_ja autoSelectFirstCandidate](self, "autoSelectFirstCandidate"))
    {
      v6[2](v6, 0);
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDBCF40];
      -[TIKeyboardInputManagerLiveConversion_ja predictionThreshold](self, "predictionThreshold");
      objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerLiveConversion_ja setTimer:](self, "setTimer:", v8);

    }
  }
}

- (void)pushCandidateGenerationContextWithResults:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra candidateResultSetFromWordSearchCandidateResultSet:](self, "candidateResultSetFromWordSearchCandidateResultSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerLiveConversion_ja markedText](self, "markedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUncommittedText:", v6);

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  -[TIKeyboardInputManagerLiveConversion_ja pushCandidateGenerationContextWithResults:](&v7, sel_pushCandidateGenerationContextWithResults_, v5);

}

- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  -[TIKeyboardInputManagerLiveConversion_ja candidateResultSetFromCandidates:proactiveTriggers:](&v5, sel_candidateResultSetFromCandidates_proactiveTriggers_, MEMORY[0x24BDBD1A8], a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)makeCandidatesWithWordSearch:(id)a3
{
  id v4;
  TIWordSearchJapaneseOperationGetCandidates *v5;
  void *v6;
  void *v7;
  void *v8;
  TIWordSearchJapaneseOperationGetCandidates *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = [TIWordSearchJapaneseOperationGetCandidates alloc];
  -[TIKeyboardInputManagerLiveConversion_ja wordSearch](self, "wordSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra geometryModelData](self, "geometryModelData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v15) = 1;
  LOWORD(v15) = 0;
  LOBYTE(v14) = 1;
  v9 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v5, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", v6, v4, 0, v7, 0x7FFFFFFFFFFFFFFFLL, 1, v14, 0, 0, 0, v8, v15, 0);

  -[TIWordSearchJapaneseOperationGetCandidates setAllowIncompleteRomaji:](v9, "setAllowIncompleteRomaji:", 1);
  -[TIWordSearchJapaneseOperationGetCandidates setReferenceMode:](v9, "setReferenceMode:", 1);
  -[TIWordSearchJapaneseOperationGetCandidates results](v9, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[TIKeyboardInputManagerLiveConversion_ja wordSearch](self, "wordSearch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performOperationAsync:", v9);

    -[TIWordSearchJapaneseOperationGetCandidates waitUntilFinished](v9, "waitUntilFinished");
  }
  -[TIWordSearchJapaneseOperationGetCandidates results](v9, "results");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja _notifyUpdateCandidates:forOperation:](self, "_notifyUpdateCandidates:forOperation:", v12, v9);

  return 0;
}

- (void)_cancelCandidatesThread
{
  id v2;

  -[TIKeyboardInputManagerLiveConversion_ja wordSearch](self, "wordSearch");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[TIKeyboardInputManagerLiveConversion_ja shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection")|| (objc_msgSend(v10, "candidates"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "count"), v5, !v6))
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelComposition");
  }
  else
  {
    -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v10);
    objc_msgSend(v10, "candidates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerLiveConversion_ja setTopCandidate:](self, "setTopCandidate:", v8);
    -[TIKeyboardInputManagerMecabra segmentsFromCandidate:phraseBoundary:](self, "segmentsFromCandidate:phraseBoundary:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja setSegments:](self, "setSegments:", v9);

    -[TIKeyboardInputManagerLiveConversion_ja setMarkedText](self, "setMarkedText");
  }

}

- (void)startPrediction
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  -[TIKeyboardInputManagerLiveConversion_ja inputString](self, "inputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BEB5410];
    -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = 0;
    objc_msgSend(v5, "splitSegments:at:forPrefix:forSuffix:", v6, 2, &v19, &v18);
    v7 = (__CFString *)v19;
    v8 = v18;

    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAutoSelectFirstCandidate:", -[TIKeyboardInputManagerLiveConversion_ja autoSelectFirstCandidate](self, "autoSelectFirstCandidate"));
      objc_msgSend(v11, "setAutoSelectTransliterateCandidate:", -[TIKeyboardInputManagerLiveConversion_ja transliterationType](self, "transliterationType"));
      objc_msgSend(v11, "setShowsPartialCandidate:", -[TIKeyboardInputManagerLiveConversion_ja inSearchField](self, "inSearchField"));
      -[TIKeyboardInputManagerLiveConversion_ja committedSurface](self, "committedSurface");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v7)
        v14 = v7;
      else
        v14 = &stru_250122EC0;
      objc_msgSend(v12, "stringByAppendingString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerLiveConversion_ja contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "makeCandidatesWithInputString:autoCommitString:contextString:predictionEnabled:reanalysisMode:singlePhrase:geometoryModelData:", v8, v15, v16, 1, 0, 0, v17);

    }
  }
}

- (id)didAcceptCandidate:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TIKeyboardInputManagerLiveConversion_ja rawInputStringForPrediction](self, "rawInputStringForPrediction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  objc_msgSend(v4, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 <= objc_msgSend(v7, "length"))
  {
    v8 = 0;
  }
  else
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass() ^ 1;
  }

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v25 = 136315394;
    v26 = "-[TIKeyboardInputManagerLiveConversion_ja didAcceptCandidate:]";
    v27 = 1024;
    v28 = v8 & 1;
    _os_log_impl(&dword_232303000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s  candidate is partial: %d", (uint8_t *)&v25, 0x12u);
  }
  objc_msgSend(v4, "candidate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v10 = -[TIKeyboardInputManagerLiveConversion_ja isTypologyEnabled](self, "isTypologyEnabled");

    if (v10)
      -[TIKeyboardInputManagerMecabra logCommittedCandidate:partial:](self, "logCommittedCandidate:partial:", v4, v8 & 1);
  }
  else
  {

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[TIKeyboardInputManagerMecabra updateUsageStatisticsForCandidate:isPartial:](self, "updateUsageStatisticsForCandidate:isPartial:", v4, v8 & 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TIKeyboardInputManagerLiveConversion_ja topCandidate](self, "topCandidate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[TIKeyboardInputManagerLiveConversion_ja topCandidate](self, "topCandidate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v13);

      -[TIKeyboardInputManagerLiveConversion_ja wordSearch](self, "wordSearch");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "performAccept:isPartial:", v14, 0);

    }
  }
  if ((v8 & 1) != 0
    || (-[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v16))
  {
    -[TIKeyboardInputManagerMecabra savePartialGeometryData](self, "savePartialGeometryData");
    objc_msgSend(v4, "input");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");
    v19 = objc_msgSend(v5, "length");

    if (v18 < v19)
    {
      objc_msgSend(v4, "input");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v20, "length"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerMecabra setRemainingInput:](self, "setRemainingInput:", v21);

    }
    v22 = &stru_250122EC0;
  }
  else
  {
    -[TIKeyboardInputManagerLiveConversion_ja clearInput](self, "clearInput");
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja setCommittedSegments:](self, "setCommittedSegments:", v24);

    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
    v22 = 0;
  }

  return (id)v22;
}

- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  id syncKeyboardStateHandler;
  objc_super v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  if (-[TIKeyboardInputManagerMecabra syncToKeyboardState:completionHandler:](&v20, sel_syncToKeyboardState_completionHandler_, v6, v7))
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v6, "currentCandidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_7;
    -[TIKeyboardInputManagerLiveConversion_ja rawInputStringForPrediction](self, "rawInputStringForPrediction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    objc_msgSend(v9, "input");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v11 <= v13)
      goto LABEL_7;
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v16 = (void *)MEMORY[0x2349027B0](v7);
      syncKeyboardStateHandler = self->_syncKeyboardStateHandler;
      self->_syncKeyboardStateHandler = v16;

      v19.receiver = self;
      v19.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
      -[TIKeyboardInputManagerBase syncToKeyboardState:](&v19, sel_syncToKeyboardState_, v6);
      v8 = 1;
    }
    else
    {
LABEL_7:
      v8 = 0;
    }

  }
  return v8;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  char v14;
  void (**syncKeyboardStateHandler)(id, void *);
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  objc_super v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  -[TIKeyboardInputManagerMecabra syncToKeyboardState:from:afterContextChange:](&v26, sel_syncToKeyboardState_from_afterContextChange_, v8, v9, v5);
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "currentCandidate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      && (-[TIKeyboardInputManagerLiveConversion_ja currentCandidate](self, "currentCandidate"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v12, "isEqual:", v13),
          v13,
          (v14 & 1) == 0))
    {
      -[TIKeyboardInputManagerLiveConversion_ja setTransliterationType:](self, "setTransliterationType:", 0);
      -[TIKeyboardInputManagerLiveConversion_ja setAutoSelectFirstCandidate:](self, "setAutoSelectFirstCandidate:", 0);
      -[TIKeyboardInputManagerLiveConversion_ja rawInputStringForPrediction](self, "rawInputStringForPrediction");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");
      objc_msgSend(v12, "input");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "length");

      objc_msgSend(v8, "currentCandidate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerLiveConversion_ja setCurrentCandidate:](self, "setCurrentCandidate:", v24);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[TIKeyboardInputManagerLiveConversion_ja rawInputStringFrom:](self, "rawInputStringFrom:", v12);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerLiveConversion_ja setCurrentDictionaryReading:](self, "setCurrentDictionaryReading:", v25);

      }
      else
      {
        -[TIKeyboardInputManagerLiveConversion_ja setCurrentDictionaryReading:](self, "setCurrentDictionaryReading:", 0);
      }
      -[TIKeyboardInputManagerLiveConversion_ja setRemainingCandidate:](self, "setRemainingCandidate:", 0);
      if (v21 > v23)
        -[TIKeyboardInputManagerLiveConversion_ja selectPartialCandidate:](self, "selectPartialCandidate:", v12);
    }
    else
    {
      syncKeyboardStateHandler = (void (**)(id, void *))self->_syncKeyboardStateHandler;
      if (syncKeyboardStateHandler)
      {
        -[TIKeyboardInputManagerMecabra keyboardConfiguration](self, "keyboardConfiguration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        syncKeyboardStateHandler[2](syncKeyboardStateHandler, v16);

        v17 = self->_syncKeyboardStateHandler;
        self->_syncKeyboardStateHandler = 0;

      }
    }
  }
  else
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "syncToKeyboardState:from:afterContextChange:", v8, v9, v5);
  }

  objc_msgSend(v8, "inputForMarkedText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (!v19)
  {
    -[TIKeyboardInputManagerLiveConversion_ja clearInput](self, "clearInput");
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  }

}

- (NSString)committedSurface
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  NSString *v7;

  -[TIKeyboardInputManagerLiveConversion_ja committedSegments](self, "committedSegments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja committedSegments](self, "committedSegments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_surfaceStringWithin:", 0, objc_msgSend(v4, "count"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_250122EC0;
  v7 = v5;

  return v7;
}

- (void)commitCurrentCandidate
{
  -[TIKeyboardInputManagerLiveConversion_ja commitCurrentCandidate:](self, "commitCurrentCandidate:", 0);
}

- (void)commitCurrentCandidate:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  -[TIKeyboardInputManagerLiveConversion_ja currentCandidate](self, "currentCandidate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v33 = (id)v5;
    -[TIKeyboardInputManagerLiveConversion_ja topCandidate](self, "topCandidate");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[TIKeyboardInputManagerLiveConversion_ja currentCandidate](self, "currentCandidate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerLiveConversion_ja topCandidate](self, "topCandidate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) != 0)
        return;
      -[TIKeyboardInputManagerLiveConversion_ja committedSegments](self, "committedSegments");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (id)objc_msgSend(v11, "mutableCopy");

      -[TIKeyboardInputManagerLiveConversion_ja currentCandidate](self, "currentCandidate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "candidate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerLiveConversion_ja committedSurface](self, "committedSurface");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", 0, objc_msgSend(v14, "length"), &stru_250122EC0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIKeyboardInputManagerLiveConversion_ja remainingCandidate](self, "remainingCandidate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc_init(MEMORY[0x24BEB5410]);
      objc_msgSend(v17, "setSurface:", v15);
      if (v16)
      {
        -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");
        -[TIKeyboardInputManagerLiveConversion_ja remainingCandidate](self, "remainingCandidate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "input");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "substringToIndex:", v20 - objc_msgSend(v22, "length"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setReading:", v23);

        objc_msgSend(v33, "addObject:", v17);
        v24 = objc_alloc_init(MEMORY[0x24BEB5410]);
        -[TIKeyboardInputManagerLiveConversion_ja remainingCandidate](self, "remainingCandidate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "candidate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setSurface:", v26);

        -[TIKeyboardInputManagerLiveConversion_ja remainingCandidate](self, "remainingCandidate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "input");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setReading:", v28);

        objc_msgSend(v33, "addObject:", v24);
      }
      else
      {
        -[TIKeyboardInputManagerLiveConversion_ja currentDictionaryReading](self, "currentDictionaryReading");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29 || a3)
        {
          -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setReading:", v30);
        }
        else
        {
          -[TIKeyboardInputManagerLiveConversion_ja rawInputStringForAutoCommit](self, "rawInputStringForAutoCommit");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManagerLiveConversion_ja currentDictionaryReading](self, "currentDictionaryReading");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringByAppendingString:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setReading:", v32);

        }
        objc_msgSend(v33, "addObject:", v17);
      }

      -[TIKeyboardInputManagerLiveConversion_ja clearInput](self, "clearInput");
      -[TIKeyboardInputManagerLiveConversion_ja setCommittedSegments:](self, "setCommittedSegments:", v33);

    }
  }
}

- (void)addInlineCandidateIfNeeded:(id)a3
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
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEB4E20];
  -[TIKeyboardInputManagerLiveConversion_ja inputString](self, "inputString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateWithCandidate:forInput:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultCandidate:", v8);

  -[TIKeyboardInputManagerLiveConversion_ja inputString](self, "inputString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortMethodGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("UI-Sort-Common"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0x7FFFFFFFFFFFFFFFLL;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v12, "candidates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __70__TIKeyboardInputManagerLiveConversion_ja_addInlineCandidateIfNeeded___block_invoke;
    v20[3] = &unk_2501228A0;
    v21 = v9;
    v22 = &v24;
    v23 = &v28;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v20);

    if (v25[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "candidates");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v25[3]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setInlineCandidate:", 1);
      v16 = v25[3];
      if (v16 != 0x7FFFFFFFFFFFFFFFLL && v16 > v29[3])
      {
        objc_msgSend(v12, "candidates");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "mutableCopy");

        objc_msgSend(v18, "exchangeObjectAtIndex:withObjectAtIndex:", v25[3], v29[3]);
        v19 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(v12, "setCandidates:", v19);

      }
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);
  }

}

- (BOOL)shouldShowPredictionCandidate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[TIKeyboardInputManagerLiveConversion_ja candidateBehavior](self, "candidateBehavior") == 2)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    -[TIKeyboardInputManagerLiveConversion_ja inputString](self, "inputString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "candidates", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v7);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v10, "isTransliterationCandidate") & 1) == 0)
          {
            v11 = objc_msgSend(v10, "isPartialCandidate");
            if ((v11 & 1) != 0
              || (objc_msgSend(v10, "candidate"),
                  v12 = (void *)objc_claimAutoreleasedReturnValue(),
                  v13 = objc_msgSend(v12, "isEqual:", v6),
                  v12,
                  !v13))
            {
              LOBYTE(v5) = v11 ^ 1;
              goto LABEL_15;
            }
          }
        }
        v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_15:

  }
  return v5;
}

- (double)predictionThreshold
{
  double predictionThreshold;
  void *v4;
  void *v5;

  predictionThreshold = self->_predictionThreshold;
  -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja hiraganaStringFor:](self, "hiraganaStringFor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "length") < 4)
    predictionThreshold = predictionThreshold + predictionThreshold;

  return predictionThreshold;
}

- (NSArray)segmentsForPicker
{
  void *v3;
  void *v4;
  void *v5;

  -[TIKeyboardInputManagerLiveConversion_ja committedSegments](self, "committedSegments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  TIKeyboardInputManager_ja_SegmentPicker *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  TIKeyboardInputManager_ja_SegmentPicker *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v31 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[TIKeyboardInputManagerLiveConversion_ja _adjustPhraseBoundaryInForwardDirection:granularity:]";
    v27 = 1024;
    v28 = v5;
    v29 = 1024;
    v30 = v4;
    _os_log_impl(&dword_232303000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s  adjust phrase: %d %d", buf, 0x18u);
  }
  v24.receiver = self;
  v24.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  if (-[TIKeyboardInputManagerMecabra _adjustPhraseBoundaryInForwardDirection:granularity:](&v24, sel__adjustPhraseBoundaryInForwardDirection_granularity_, v5, v4))
  {
    return 1;
  }
  if (!-[TIKeyboardInputManagerLiveConversion_ja conversionEnabled](self, "conversionEnabled")
    && -[TIKeyboardInputManagerLiveConversion_ja candidateBehavior](self, "candidateBehavior") != 2)
  {
    -[TIKeyboardInputManagerLiveConversion_ja invokeEditMode](self, "invokeEditMode");
LABEL_23:
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v22, "_adjustPhraseBoundaryInForwardDirection:granularity:", v5, v4);

    return v20;
  }
  if ((_DWORD)v4 == 4)
  {
    if (v5)
      -[TIKeyboardInputManagerLiveConversion_ja setAutoSelectFirstCandidate:](self, "setAutoSelectFirstCandidate:", 1);
    else
      -[TIKeyboardInputManagerLiveConversion_ja setTransliterationType:](self, "setTransliterationType:", 4);
    -[TIKeyboardInputManagerLiveConversion_ja setCandidateBehavior:](self, "setCandidateBehavior:", 2);
    return 1;
  }
  if ((_DWORD)v4)
  {
    v15 = -[TIKeyboardInputManagerLiveConversion_ja segmentIndex](self, "segmentIndex");
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[TIKeyboardInputManagerLiveConversion_ja currentCandidate](self, "currentCandidate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");
      if (v16)
      {
        if (v18 < 2)
        {
          v15 = 0;
        }
        else
        {
          -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v19, "count") - 2;

        }
      }
      else
      {
        v15 = v18 - 1;
      }

    }
    -[TIKeyboardInputManagerLiveConversion_ja segmentAdjustInputManager:](self, "segmentAdjustInputManager:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra composeTextWith:](self, "composeTextWith:", v21);

    goto LABEL_23;
  }
  v7 = [TIKeyboardInputManager_ja_SegmentPicker alloc];
  -[TIKeyboardInputManagerLiveConversion_ja config](self, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja keyboardState](self, "keyboardState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja segmentsForPicker](self, "segmentsForPicker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja segmentsForPicker](self, "segmentsForPicker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") - 1;
  -[TIKeyboardInputManagerLiveConversion_ja wordSearch](self, "wordSearch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[TIKeyboardInputManager_ja_SegmentPicker initWithConfig:keyboardState:segments:at:wordSearch:](v7, "initWithConfig:keyboardState:segments:at:wordSearch:", v8, v9, v10, v12, v13);
  -[TIKeyboardInputManagerMecabra composeTextWith:](self, "composeTextWith:", v14);

  return 1;
}

- (id)segmentAdjustInputManager:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TIKeyboardInputManagerLiveConversion_ja.mm"), 983, CFSTR("%s must be overridden in subclass"), "-[TIKeyboardInputManagerLiveConversion_ja segmentAdjustInputManager:]");

  return 0;
}

- (id)rawInputStringFrom:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TIKeyboardInputManagerLiveConversion_ja.mm"), 988, CFSTR("%s must be overridden in subclass"), "-[TIKeyboardInputManagerLiveConversion_ja rawInputStringFrom:]");

  return 0;
}

- (id)hiraganaStringFor:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TIKeyboardInputManagerLiveConversion_ja.mm"), 994, CFSTR("%s must be overridden in subclass"), "-[TIKeyboardInputManagerLiveConversion_ja hiraganaStringFor:]");

  return 0;
}

- (void)commitComposition
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  NSArray *segments;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  NSArray *v23;
  objc_super v24;
  objc_super v25;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja clearInput](self, "clearInput");
    -[TIKeyboardInputManagerLiveConversion_ja setSegmentIndex:](self, "setSegmentIndex:", objc_msgSend(v5, "index"));
    objc_msgSend(v5, "segments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    -[TIKeyboardInputManagerLiveConversion_ja setCommittedSegments:](self, "setCommittedSegments:", v7);

    segments = self->_segments;
    self->_segments = 0;

  }
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();

  if ((v10 & 1) != 0)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja clearInput](self, "clearInput");
    -[TIKeyboardInputManagerLiveConversion_ja setSegmentIndex:](self, "setSegmentIndex:", objc_msgSend(v11, "index"));
    objc_msgSend(v11, "segments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    -[TIKeyboardInputManagerLiveConversion_ja setCommittedSegments:](self, "setCommittedSegments:", v13);

    v14 = self->_segments;
    self->_segments = 0;

  }
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = objc_opt_isKindOfClass();

  if ((v16 & 1) != 0)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja clearInput](self, "clearInput");
    objc_msgSend(v17, "rawInputString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25.receiver = self;
    v25.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
    -[TIKeyboardInputManagerLiveConversion_ja setInput:](&v25, sel_setInput_, v18);

    objc_msgSend(v17, "segments");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja setCommittedSegments:](self, "setCommittedSegments:", v19);

    objc_msgSend(v17, "inlineCandidate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_ja setTopCandidate:](self, "setTopCandidate:", v20);

    objc_msgSend(v17, "inlineCandidate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "segmentsFromCandidate:phraseBoundary:", v21, 1);
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v23 = self->_segments;
    self->_segments = v22;

    -[TIKeyboardInputManagerLiveConversion_ja setCandidateBehavior:](self, "setCandidateBehavior:", 2);
  }
  v24.receiver = self;
  v24.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  -[TIKeyboardInputManagerMecabra commitComposition](&v24, sel_commitComposition);
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (NSArray)committedSegments
{
  return self->_committedSegments;
}

- (void)setCommittedSegments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 800);
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 808);
}

- (TISmartPunctuationController)smartPunctuationController
{
  return self->_smartPunctuationController;
}

- (unint64_t)segmentIndex
{
  return self->_segmentIndex;
}

- (void)setSegmentIndex:(unint64_t)a3
{
  self->_segmentIndex = a3;
}

- (TIKeyboardCandidate)topCandidate
{
  return self->_topCandidate;
}

- (void)setTopCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 832);
}

- (TIKeyboardCandidate)currentCandidate
{
  return self->_currentCandidate;
}

- (void)setCurrentCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 840);
}

- (NSString)currentDictionaryReading
{
  return self->_currentDictionaryReading;
}

- (void)setCurrentDictionaryReading:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 848);
}

- (TIKeyboardCandidate)remainingCandidate
{
  return self->_remainingCandidate;
}

- (void)setRemainingCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 856);
}

- (id)syncKeyboardStateHandler
{
  return self->_syncKeyboardStateHandler;
}

- (void)setSyncKeyboardStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 864);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void)setPredictionThreshold:(double)a3
{
  self->_predictionThreshold = a3;
}

- (unint64_t)candidateBehavior
{
  return self->_candidateBehavior;
}

- (void)setCandidateBehavior:(unint64_t)a3
{
  self->_candidateBehavior = a3;
}

- (int64_t)transliterationType
{
  return self->_transliterationType;
}

- (void)setTransliterationType:(int64_t)a3
{
  self->_transliterationType = a3;
}

- (BOOL)autoSelectFirstCandidate
{
  return self->_autoSelectFirstCandidate;
}

- (void)setAutoSelectFirstCandidate:(BOOL)a3
{
  self->_autoSelectFirstCandidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_syncKeyboardStateHandler, 0);
  objc_storeStrong((id *)&self->_remainingCandidate, 0);
  objc_storeStrong((id *)&self->_currentDictionaryReading, 0);
  objc_storeStrong((id *)&self->_currentCandidate, 0);
  objc_storeStrong((id *)&self->_topCandidate, 0);
  objc_storeStrong((id *)&self->_smartPunctuationController, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_committedSegments, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

- (void)handleKeyboardInput:(NSObject *)a1 .cold.1(NSObject *a1)
{
  void *v2;
  uint8_t buf[4];
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s handleKeyboardInput"), "-[TIKeyboardInputManagerLiveConversion_ja handleKeyboardInput:]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_232303000, a1, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

}

@end
