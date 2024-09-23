@implementation TIKeyboardInputManagerLiveConversion_zh

- (TIKeyboardInputManagerLiveConversion_zh)initWithConfig:(id)a3 keyboardState:(id)a4
{
  TIKeyboardInputManagerLiveConversion_zh *v4;
  TIZhuyinInputManager *v5;
  TIZhuyinInputManager *zhuyinInputManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  v4 = -[TIKeyboardInputManagerChinesePhonetic initWithConfig:keyboardState:](&v8, sel_initWithConfig_keyboardState_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(TIZhuyinInputManager);
    zhuyinInputManager = v4->_zhuyinInputManager;
    v4->_zhuyinInputManager = v5;

  }
  return v4;
}

- (BOOL)skipSetMarkedTextDuringInput
{
  return 1;
}

- (id)keyEventMap
{
  return (id)objc_msgSend(MEMORY[0x24BEB4DA0], "sharedInstance");
}

- (id)wordCharacters
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D00], "zhuyinWordCharacters");
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4E00]);
}

- (unint64_t)initialSelectedIndex
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    -[TIKeyboardInputManagerLiveConversion_zh inputString](self, "inputString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "length"))
    {
      v7 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  v7 = -[TIKeyboardInputManagerChinese initialSelectedIndex](&v9, sel_initialSelectedIndex);
  if (v6)
    goto LABEL_5;
LABEL_6:

  return (unint64_t)v7;
}

- (BOOL)supportsNumberKeySelection
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

- (BOOL)commitsAcceptedCandidate
{
  return 1;
}

- (id)keyBehaviorsForState:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BEB4E40], "behaviorForSpaceKey:forReturnKey:", 100, 2);
}

- (void)initImplementation
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x24BEB52F8];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  return -[TIKeyboardInputManagerChinese initImplementationWithMode:andLanguage:](&v4, sel_initImplementationWithMode_andLanguage_, CFSTR("Zhuyin"), v2);
}

- (void)clearInput
{
  void *v3;
  objc_super v4;

  -[TIKeyboardInputManagerLiveConversion_zh setCachedInputString:](self, "setCachedInputString:", 0);
  -[TIKeyboardInputManagerLiveConversion_zh setCurrentCandidate:](self, "setCurrentCandidate:", 0);
  -[TIKeyboardInputManagerChinesePhonetic setRemainingInput:](self, "setRemainingInput:", 0);
  -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  -[TIKeyboardInputManagerChinesePhonetic clearInput](&v4, sel_clearInput);
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  void *v31;
  char v32;
  objc_super v34;

  v4 = a3;
  if (TICanLogMessageAtLevel())
  {
    TIOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[TIKeyboardInputManagerLiveConversion_zh handleKeyboardInput:].cold.1();

  }
  objc_msgSend(v4, "acceptedCandidate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_7;
  }
  -[TIKeyboardInputManagerLiveConversion_zh currentCandidate](self, "currentCandidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_zh currentCandidate](self, "currentCandidate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "mecabraCandidateRefFromCandidate:", v12);

    objc_msgSend(MEMORY[0x24BEB4E80], "dictionaryReadingFromMecabraCandidate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");
    -[TIKeyboardInputManagerLiveConversion_zh rawInputString](self, "rawInputString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v15 > v17)
      -[TIKeyboardInputManagerLiveConversion_zh clearInput](self, "clearInput");
    -[TIKeyboardInputManagerLiveConversion_zh addInputToInternal:](self, "addInputToInternal:", v14);
    -[TIKeyboardInputManagerLiveConversion_zh setCurrentCandidate:](self, "setCurrentCandidate:", 0);

  }
  objc_msgSend(v4, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("\x1B"));

  if (v19)
  {
    v9 = objc_alloc_init(MEMORY[0x24BEB4E58]);
    -[TIKeyboardInputManagerLiveConversion_zh inputString](self, "inputString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertText:", v20);

    -[TIKeyboardInputManagerMecabra cancelComposition](self, "cancelComposition");
    goto LABEL_30;
  }
  objc_msgSend(v4, "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("\n"));

  if (!v22)
  {
    if (objc_msgSend(v4, "isBackspace"))
      v24 = objc_msgSend(v4, "isShiftDown");
    else
      v24 = 0;
    -[TIKeyboardInputManagerLiveConversion_zh setRevertTonlessZhuyin:](self, "setRevertTonlessZhuyin:", v24);
    v34.receiver = self;
    v34.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
    -[TIKeyboardInputManagerChinesePhonetic handleKeyboardInput:](&v34, sel_handleKeyboardInput_, v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "_isSpace") & 1) != 0)
    {
      -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "syllableBuffersOccupied");

      if ((v28 & 1) == 0)
      {
        -[TIKeyboardInputManagerLiveConversion_zh presentSegmentPickerIfNeeded](self, "presentSegmentPickerIfNeeded");
        v29 = objc_alloc_init(MEMORY[0x24BEB4E58]);
LABEL_29:
        v9 = v29;

        goto LABEL_30;
      }
    }
    else
    {

    }
    -[TIKeyboardInputManagerLiveConversion_zh updateCandidatesByWaitingForResults:](self, "updateCandidatesByWaitingForResults:", 1);
    -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "syllableBuffersOccupied"))
    {

    }
    else
    {
      -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isCursorAtEnd");

      if ((v32 & 1) == 0)
        -[TIKeyboardInputManagerLiveConversion_zh presentSegmentAdjuster](self, "presentSegmentAdjuster");
    }
    v29 = v25;
    goto LABEL_29;
  }
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
LABEL_7:
  v9 = objc_alloc_init(MEMORY[0x24BEB4E58]);
LABEL_30:

  return v9;
}

- (id)markedText
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[TIKeyboardInputManagerLiveConversion_zh rawInputString](self, "rawInputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_zh inputString](self, "inputString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TIKeyboardInputManagerLiveConversion_zh inputIndex](self, "inputIndex");
  -[TIKeyboardInputManagerChinesePhonetic searchStringForMarkedText](self, "searchStringForMarkedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", 0, objc_msgSend(v4, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerLiveConversion_zh lastInputString](self, "lastInputString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB4E38], "intermediateTextWithInputString:displayString:selectionLocation:searchString:candidateOffset:liveConversionSegments:highlightSegmentIndex:lastInputString:", v3, v4, v5, v6, 0, v8, 0x7FFFFFFFFFFFFFFFLL, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)shouldSearchCompletionForSubstrings
{
  return 0;
}

- (BOOL)shouldReplaceCharacterOfInputStringBeforeCursorForInput:(id)a3
{
  return 0;
}

- (id)validCharacterSetForAutocorrection
{
  return (id)objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinCharacterSet");
}

- (BOOL)shouldClearInputOnMarkedTextOutOfSync
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEB5460], "sharedOperationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "operationCount") == 0;

  return v3;
}

- (int)inputMethodType
{
  return 5;
}

- (id)phoneticSortingMethod
{
  return &unk_2501332E0;
}

- (BOOL)_shouldCommitInputDirectly:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v9;
  BOOL v10;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (TIStringContainsCharacterFromSet(v4, (uint64_t)v5))
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BDD14A8], "punctuationAndSymbolCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (TIStringContainsCharacterFromSet(v4, (uint64_t)v6))
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = TIStringContainsCharacterFromSet(v4, (uint64_t)v9);

  if (!v10)
  {
    v11.receiver = self;
    v11.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
    v7 = -[TIKeyboardInputManagerChinesePhonetic _shouldCommitInputDirectly:](&v11, sel__shouldCommitInputDirectly_, v4);
    goto LABEL_6;
  }
LABEL_5:
  v7 = 0;
LABEL_6:

  return v7;
}

- (void)addInputToInternal:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t i;
  void *v7;
  unint64_t v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "length") == 1)
  {
    -[TIKeyboardInputManagerLiveConversion_zh _addInputToInternal:](self, "_addInputToInternal:", v9);
    v4 = v9;
  }
  else
  {
    v5 = objc_msgSend(v9, "length");
    v4 = v9;
    if (v5)
    {
      for (i = 0; i < v8; ++i)
      {
        objc_msgSend(v4, "substringWithRange:", i, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerLiveConversion_zh _addInputToInternal:](self, "_addInputToInternal:", v7);

        v8 = objc_msgSend(v9, "length");
        v4 = v9;
      }
    }
  }

}

- (void)_addInputToInternal:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  NSString *v7;
  NSString *cachedInputString;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = TIStringContainsCharacterFromSet(v11, (uint64_t)v4);

  if (v5)
  {
    -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "composedText");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    cachedInputString = self->_cachedInputString;
    self->_cachedInputString = v7;

    -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addZhuyinInput:", v11);

    -[TIKeyboardInputManagerLiveConversion_zh updateCandidatesByWaitingForResults:](self, "updateCandidatesByWaitingForResults:", 1);
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR(" ")) & 1) == 0)
  {
    -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addNonZhuyinInput:", v11);

  }
}

- (id)rawInputString
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)internalInputString
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)inputCount
{
  void *v2;
  unsigned int v3;

  -[TIKeyboardInputManagerLiveConversion_zh inputString](self, "inputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (id)inputString
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v9;
  void *v10;

  -[TIKeyboardInputManagerLiveConversion_zh currentCandidate](self, "currentCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIKeyboardInputManagerLiveConversion_zh currentCandidate](self, "currentCandidate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidate");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TIKeyboardInputManagerLiveConversion_zh cachedInputString](self, "cachedInputString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[TIKeyboardInputManagerLiveConversion_zh cachedInputString](self, "cachedInputString");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "composedText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v6 = &stru_25012F088;
      return v6;
    }
    -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "composedText");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (__CFString *)v5;

  return v6;
}

- (unsigned)inputIndex
{
  void *v3;
  void *v5;
  unsigned int v6;

  -[TIKeyboardInputManagerLiveConversion_zh currentCandidate](self, "currentCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return -[TIKeyboardInputManagerLiveConversion_zh inputCount](self, "inputCount");
  -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cursorLocation");

  return v6;
}

- (id)deleteFromInput:(unint64_t *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = -[TIKeyboardInputManagerLiveConversion_zh revertTonlessZhuyin](self, "revertTonlessZhuyin");
  -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "revertCurrentCharacterToTonelessZhuyin");
  else
    objc_msgSend(v6, "deleteFromInput");

  if (a3)
    *a3 = 1;
  -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  return 0;
}

- (BOOL)updateCandidatesByWaitingForResults:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  TIKeyboardInputManagerLiveConversion_zh *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;

  v3 = a3;
  -[TIKeyboardInputManagerLiveConversion_zh rawInputString](self, "rawInputString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  if (TICanLogMessageAtLevel())
  {
    TIOSLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[TIKeyboardInputManagerLiveConversion_zh updateCandidatesByWaitingForResults:].cold.1((uint64_t)v5);

  }
  if (!v6)
  {
    -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
    v17 = 1;
    goto LABEL_18;
  }
  -[TIKeyboardInputManagerMecabra geometryModelData](self, "geometryModelData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BEB5288]);
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v12 = 0;
  else
    v12 = self;
  if (v3)
    v13 = 0;
  else
    v13 = sel_wordSearchEngineDidFindCandidates_forOperation_;
  -[TIKeyboardInputManagerChinesePhonetic logger](self, "logger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = 1;
  BYTE2(v21) = 0;
  LOWORD(v21) = 1;
  v15 = (void *)objc_msgSend(v9, "initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:disambiguationCandidates:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:regenerateDisambiguationCandidates:predictionEnabled:reanalysisMode:target:action:geometryModelData:hardwareKeyboardMode:logger:", v10, v5, v11, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0x7FFFFFFFFFFFFFFFLL, v21, v12, v13, v8, v22, v14);

  objc_msgSend(v15, "results");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;

  if (!v16)
  {
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "performOperationAsync:", v15);

    if (!v3)
    {
      v17 = 0;
      goto LABEL_16;
    }
    objc_msgSend(v15, "waitUntilFinished");
  }
  objc_msgSend(v15, "results");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_zh _notifyUpdateCandidates:forOperation:](self, "_notifyUpdateCandidates:forOperation:", v19, v15);

LABEL_16:
LABEL_18:

  return v17;
}

- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSString *cachedInputString;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v24 = a4;
  if (-[TIKeyboardInputManagerLiveConversion_zh shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection")|| (objc_msgSend(v6, "candidates"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "count"), v7, !v8))
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cancelComposition");

    goto LABEL_21;
  }
  -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v6);
  cachedInputString = self->_cachedInputString;
  self->_cachedInputString = 0;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = v6;
  objc_msgSend(v6, "candidates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v11)
    goto LABEL_20;
  v12 = v11;
  v13 = *(_QWORD *)v26;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v26 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      if ((objc_msgSend(v15, "containPunctuationOnly") & 1) != 0)
      {
LABEL_19:
        -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "updateWithCandidate:isWholeInputCandidate:", v15, 1);

        -[TIKeyboardInputManagerLiveConversion_zh setTopCandidate:](self, "setTopCandidate:", v15);
        -[TIKeyboardInputManagerMecabra segmentsFromCandidate:phraseBoundary:](self, "segmentsFromCandidate:phraseBoundary:", v15, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerChinesePhonetic setSegments:](self, "setSegments:", v22);

        goto LABEL_20;
      }
      objc_msgSend(v15, "candidate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "_containsBopomofoOnly") & 1) != 0)
        goto LABEL_14;
      objc_msgSend(v15, "input");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "inputString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isEqualToString:", v18) & 1) == 0)
      {

LABEL_14:
        continue;
      }
      v19 = objc_msgSend(v15, "hasUnsupportedReading");

      if ((v19 & 1) == 0)
        goto LABEL_19;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
      continue;
    break;
  }
LABEL_20:

  -[TIKeyboardInputManagerLiveConversion_zh setMarkedText](self, "setMarkedText");
  v6 = v23;
LABEL_21:

}

- (BOOL)closeCandidateGenerationContextWithResults:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  -[TIKeyboardInputManagerLiveConversion_zh closeCandidateGenerationContextWithResults:](&v4, sel_closeCandidateGenerationContextWithResults_, 0);
  return 1;
}

- (id)didAcceptCandidate:(id)a3
{
  id v4;
  int isKindOfClass;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[TIKeyboardInputManagerChinesePhonetic remainingInput](self, "remainingInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7 || (isKindOfClass & 1) != 0)
  {
    -[TIKeyboardInputManagerLiveConversion_zh rawInputString](self, "rawInputString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    objc_msgSend(v4, "input");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (v9 > objc_msgSend(v10, "length")) & (isKindOfClass ^ 1u);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315394;
      v21 = "-[TIKeyboardInputManagerLiveConversion_zh didAcceptCandidate:]";
      v22 = 1024;
      v23 = v11;
      _os_log_impl(&dword_23235B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s  candidate is partial: %d", (uint8_t *)&v20, 0x12u);
    }
    objc_msgSend(v4, "candidate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      v13 = -[TIKeyboardInputManagerLiveConversion_zh isTypologyEnabled](self, "isTypologyEnabled");

      if (v13)
        -[TIKeyboardInputManagerMecabra logCommittedCandidate:partial:](self, "logCommittedCandidate:partial:", v4, v11);
    }
    else
    {

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TIKeyboardInputManagerMecabra updateUsageStatisticsForCandidate:isPartial:](self, "updateUsageStatisticsForCandidate:isPartial:", v4, v11);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[TIKeyboardInputManagerLiveConversion_zh topCandidate](self, "topCandidate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v15 = objc_opt_isKindOfClass();

      if ((v15 & 1) != 0)
      {
        -[TIKeyboardInputManagerLiveConversion_zh topCandidate](self, "topCandidate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v16);

        -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "performAccept:isPartial:", v17, 0);

      }
    }
    -[TIKeyboardInputManagerLiveConversion_zh clearInput](self, "clearInput");
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");

  }
  return &stru_25012F088;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  -[TIKeyboardInputManagerChinesePhonetic handleAcceptedCandidate:keyboardState:](&v9, sel_handleAcceptedCandidate_keyboardState_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_zh rawInputString](self, "rawInputString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
    -[TIKeyboardInputManagerLiveConversion_zh updateCandidatesByWaitingForResults:](self, "updateCandidatesByWaitingForResults:", 1);
  else
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  return v5;
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  objc_super v13;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  if (TICanLogMessageAtLevel())
  {
    TIOSLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[TIKeyboardInputManagerLiveConversion_zh _adjustPhraseBoundaryInForwardDirection:granularity:].cold.1(v5, v4);

  }
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  if (-[TIKeyboardInputManagerMecabra _adjustPhraseBoundaryInForwardDirection:granularity:](&v13, sel__adjustPhraseBoundaryInForwardDirection_granularity_, v5, v4))
  {
    return 1;
  }
  -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "syllableBuffersOccupied");

  if ((v9 & 1) != 0)
    return 1;
  if ((_DWORD)v4 == 4)
    -[TIKeyboardInputManagerLiveConversion_zh presentSegmentPickerIfNeeded](self, "presentSegmentPickerIfNeeded");
  else
    -[TIKeyboardInputManagerLiveConversion_zh presentSegmentAdjuster](self, "presentSegmentAdjuster");
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v11, "_adjustPhraseBoundaryInForwardDirection:granularity:", v5, v4);

  return v10;
}

- (void)presentSegmentAdjuster
{
  TIKeyboardInputManager_zh_SegmentAdjust *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TIKeyboardInputManager_zh_SegmentAdjust *v8;
  id v9;

  v3 = [TIKeyboardInputManager_zh_SegmentAdjust alloc];
  -[TIKeyboardInputManagerLiveConversion_zh config](self, "config");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_zh keyboardState](self, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerChinesePhonetic segments](self, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_zh zhuyinInputManager](self, "zhuyinInputManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TIKeyboardInputManager_zh_SegmentAdjust initWithConfig:keyboardState:segments:inputManager:wordSearch:](v3, "initWithConfig:keyboardState:segments:inputManager:wordSearch:", v9, v4, v5, v6, v7);
  -[TIKeyboardInputManagerMecabra composeTextWith:](self, "composeTextWith:", v8);

}

- (void)presentSegmentPickerIfNeeded
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  TIKeyboardInputManager_zh_SegmentPicker *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  TIKeyboardInputManager_zh_SegmentPicker *v14;
  _QWORD v15[7];
  _QWORD v16[4];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    -[TIKeyboardInputManagerChinesePhonetic segments](self, "segments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __71__TIKeyboardInputManagerLiveConversion_zh_presentSegmentPickerIfNeeded__block_invoke;
    v15[3] = &unk_25012ED90;
    v15[4] = self;
    v15[5] = v16;
    v15[6] = &v17;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);

    if (v18[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[TIKeyboardInputManagerChinesePhonetic segments](self, "segments");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      v18[3] = v7 - 1;

    }
    v8 = [TIKeyboardInputManager_zh_SegmentPicker alloc];
    -[TIKeyboardInputManagerLiveConversion_zh config](self, "config");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_zh keyboardState](self, "keyboardState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic segments](self, "segments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18[3];
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[TIKeyboardInputManager_zh_SegmentPicker initWithConfig:keyboardState:segments:at:wordSearch:](v8, "initWithConfig:keyboardState:segments:at:wordSearch:", v9, v10, v11, v12, v13);

    -[TIKeyboardInputManagerMecabra composeTextWith:](self, "composeTextWith:", v14);
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&v17, 8);
  }
}

- (void)commitComposition
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "segments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(v5, "segments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerChinesePhonetic setSegments:](self, "setSegments:", v8);

      objc_msgSend(v5, "inputString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerLiveConversion_zh setCachedInputString:](self, "setCachedInputString:", v9);

      objc_msgSend(v5, "remainingInput");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerChinesePhonetic setRemainingInput:](self, "setRemainingInput:", v10);

    }
    else
    {
      -[TIKeyboardInputManagerLiveConversion_zh clearInput](self, "clearInput");
    }

  }
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "segments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic setSegments:](self, "setSegments:", v14);

    objc_msgSend(v13, "inputString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_zh setCachedInputString:](self, "setCachedInputString:", v15);

    objc_msgSend(v13, "remainingInput");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic setRemainingInput:](self, "setRemainingInput:", v16);

  }
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  -[TIKeyboardInputManagerMecabra commitComposition](&v17, sel_commitComposition);
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  -[TIKeyboardInputManagerChinesePhonetic syncToKeyboardState:from:afterContextChange:](&v13, sel_syncToKeyboardState_from_afterContextChange_, v8, a4, v5);
  objc_msgSend(v8, "currentCandidate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "currentCandidate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLiveConversion_zh setCurrentCandidate:](self, "setCurrentCandidate:", v10);

  }
  objc_msgSend(v8, "inputForMarkedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (!v12)
    -[TIKeyboardInputManagerMecabra cancelComposition](self, "cancelComposition");

}

- (TIKeyboardCandidate)topCandidate
{
  return self->_topCandidate;
}

- (void)setTopCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (TIKeyboardCandidate)currentCandidate
{
  return self->_currentCandidate;
}

- (void)setCurrentCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (TIZhuyinInputManager)zhuyinInputManager
{
  return self->_zhuyinInputManager;
}

- (void)setZhuyinInputManager:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (NSString)cachedInputString
{
  return self->_cachedInputString;
}

- (void)setCachedInputString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (BOOL)revertTonlessZhuyin
{
  return *(&self->_revertTonlessZhuyin + 4);
}

- (void)setRevertTonlessZhuyin:(BOOL)a3
{
  *(&self->_revertTonlessZhuyin + 4) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedInputString, 0);
  objc_storeStrong((id *)&self->_zhuyinInputManager, 0);
  objc_storeStrong((id *)&self->_currentCandidate, 0);
  objc_storeStrong((id *)&self->_topCandidate, 0);
}

- (void)handleKeyboardInput:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s handleKeyboardInput"), "-[TIKeyboardInputManagerLiveConversion_zh handleKeyboardInput:]");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v0;
  OUTLINED_FUNCTION_0(&dword_23235B000, v1, v2, "%@", (uint8_t *)&v3);

  OUTLINED_FUNCTION_1();
}

- (void)updateCandidatesByWaitingForResults:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s updateCandidates for %@"), "-[TIKeyboardInputManagerLiveConversion_zh updateCandidatesByWaitingForResults:]", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v1;
  OUTLINED_FUNCTION_0(&dword_23235B000, v2, v3, "%@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_1();
}

- (void)_adjustPhraseBoundaryInForwardDirection:(char)a1 granularity:(uint64_t)a2 .cold.1(char a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s adjust phrase: %d %d"), "-[TIKeyboardInputManagerLiveConversion_zh _adjustPhraseBoundaryInForwardDirection:granularity:]", a1 & 1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v2;
  OUTLINED_FUNCTION_0(&dword_23235B000, v3, v4, "%@", (uint8_t *)&v5);

}

@end
