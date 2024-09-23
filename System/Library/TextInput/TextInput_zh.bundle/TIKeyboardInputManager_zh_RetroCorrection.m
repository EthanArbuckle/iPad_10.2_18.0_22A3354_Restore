@implementation TIKeyboardInputManager_zh_RetroCorrection

- (TIKeyboardInputManager_zh_RetroCorrection)initWithInputMode:(id)a3 keyboardState:(id)a4 inputString:(id)a5
{
  id v8;
  TIKeyboardInputManager_zh_RetroCorrection *v9;
  TIZhuyinInputManager *v10;
  TIZhuyinInputManager *zhuyinInputManager;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_zh_RetroCorrection;
  v9 = -[TIKeyboardInputManagerBase initWithInputMode:keyboardState:](&v13, sel_initWithInputMode_keyboardState_, a3, a4);
  if (v9)
  {
    v10 = objc_alloc_init(TIZhuyinInputManager);
    zhuyinInputManager = v9->_zhuyinInputManager;
    v9->_zhuyinInputManager = v10;

    -[TIKeyboardInputManager_zh_RetroCorrection addInputToInternal:](v9, "addInputToInternal:", v8);
  }

  return v9;
}

- (id)rawInputString
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)internalInputString
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)inputCount
{
  void *v2;
  unsigned int v3;

  -[TIKeyboardInputManager_zh_RetroCorrection inputString](self, "inputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (BOOL)supportsSetPhraseBoundary
{
  void *v2;
  char v3;

  -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "syllableBuffersOccupied") ^ 1;

  return v3;
}

- (void)setPhraseBoundary:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_zh_RetroCorrection;
  -[TIKeyboardInputManagerChinesePhonetic setPhraseBoundary:](&v11, sel_setPhraseBoundary_);
  -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cursorLocation");

  v7 = v6 - a3;
  if (v6 >= a3)
  {
    if (v6 > a3)
    {
      do
      {
        -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "moveCursorBackward");

        --v7;
      }
      while (v7);
    }
  }
  else
  {
    v8 = a3 - v6;
    do
    {
      -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "moveCursorForward");

      --v8;
    }
    while (v8);
  }
}

- (id)inputString
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "composedText");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_25012F088;
  }
  return v6;
}

- (unsigned)inputIndex
{
  void *v2;
  unsigned int v3;

  -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cursorLocation");

  return v3;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleKeyboardInput:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_zh_RetroCorrection;
    -[TIKeyboardInputManagerChinesePhonetic handleKeyboardInput:](&v8, sel_handleKeyboardInput_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)clearInput
{
  void *v3;
  objc_super v4;

  -[TIKeyboardInputManager_zh_RetroCorrection setDefaultCandidate:](self, "setDefaultCandidate:", 0);
  -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_zh_RetroCorrection;
  -[TIKeyboardInputManagerChinesePhonetic clearInput](&v4, sel_clearInput);
}

- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;
  id obj;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TIKeyboardInputManager_zh_RetroCorrection;
  -[TIKeyboardInputManagerChinese groupedCandidatesFromCandidates:usingSortingMethod:](&v28, sel_groupedCandidatesFromCandidates_usingSortingMethod_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_zh_RetroCorrection inputString](self, "inputString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "integerValue") == 1 && v8)
  {
    v19 = v7;
    v20 = v6;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v13, "candidates", v19, v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x24BDD1758];
          v22[0] = MEMORY[0x24BDAC760];
          v22[1] = 3221225472;
          v22[2] = __96__TIKeyboardInputManager_zh_RetroCorrection_groupedCandidatesFromCandidates_usingSortingMethod___block_invoke;
          v22[3] = &unk_25012ED68;
          v23 = v8;
          objc_msgSend(v15, "predicateWithBlock:", v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "filteredOrderedSetUsingPredicate:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setCandidates:", v17);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);
    }

    v7 = v19;
    v6 = v20;
  }

  return v7;
}

- (id)didAcceptCandidate:(id)a3
{
  __CFString *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_zh_RetroCorrection;
  -[TIKeyboardInputManagerChinesePhonetic didAcceptCandidate:](&v10, sel_didAcceptCandidate_, a3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerChinesePhonetic remainingInput](self, "remainingInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  if (v4)
    v7 = v4;
  else
    v7 = &stru_25012F088;
  v8 = v7;

  return v8;
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
    -[TIKeyboardInputManager_zh_RetroCorrection _addInputToInternal:](self, "_addInputToInternal:", v9);
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
        -[TIKeyboardInputManager_zh_RetroCorrection _addInputToInternal:](self, "_addInputToInternal:", v7);

        v8 = objc_msgSend(v9, "length");
        v4 = v9;
      }
    }
  }

}

- (id)deleteFromInput:(unint64_t *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteFromInput");

  if (a3)
    *a3 = 1;
  -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  return 0;
}

- (id)keyboardConfigurationLayoutTag
{
  return (id)*MEMORY[0x24BEB52D8];
}

- (id)validCharacterSetForAutocorrection
{
  return (id)objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinCharacterSet");
}

- (BOOL)supportsCandidateGeneration
{
  void *v2;
  BOOL v3;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)_addInputToInternal:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = TIStringContainsCharacterFromSet(v7, (uint64_t)v4);

  if (v5)
  {
    -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addZhuyinInput:", v7);
LABEL_5:

    goto LABEL_6;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR(" ")) & 1) == 0)
  {
    -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addNonZhuyinInput:", v7);
    goto LABEL_5;
  }
LABEL_6:
  -[TIKeyboardInputManager_zh_RetroCorrection updateInlineCandidate](self, "updateInlineCandidate");

}

- (void)updateInlineCandidate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if ((-[TIKeyboardInputManager_zh_RetroCorrection shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection") & 1) != 0)
    return;
  -[TIKeyboardInputManager_zh_RetroCorrection rawInputString](self, "rawInputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
    goto LABEL_25;
  -[TIKeyboardInputManagerMecabra geometryModelData](self, "geometryModelData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BEB5288]);
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerChinesePhonetic logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = 1;
  BYTE2(v29) = 0;
  LOWORD(v29) = 1;
  v9 = (void *)objc_msgSend(v5, "initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:disambiguationCandidates:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:regenerateDisambiguationCandidates:predictionEnabled:reanalysisMode:target:action:geometryModelData:hardwareKeyboardMode:logger:", v6, v3, v7, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0x7FFFFFFFFFFFFFFFLL, v29, 0, 0, v4, v30, v8);

  objc_msgSend(v9, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performOperationAsync:", v9);

    objc_msgSend(v9, "waitUntilFinished");
  }
  objc_msgSend(v9, "results");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "candidates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "cancelComposition");

    goto LABEL_24;
  }
  v31 = v4;
  v32 = v3;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v9, "results");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "candidates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v16;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v17)
    goto LABEL_22;
  v18 = v17;
  v19 = *(_QWORD *)v35;
  while (2)
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v35 != v19)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      if ((objc_msgSend(v21, "containPunctuationOnly") & 1) != 0)
      {
LABEL_21:
        -[TIKeyboardInputManager_zh_RetroCorrection setDefaultCandidate:](self, "setDefaultCandidate:", v21);
        -[TIKeyboardInputManager_zh_RetroCorrection zhuyinInputManager](self, "zhuyinInputManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "updateWithCandidate:isWholeInputCandidate:", v21, 1);

        goto LABEL_22;
      }
      objc_msgSend(v21, "candidate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "_containsBopomofoOnly") & 1) != 0)
        goto LABEL_17;
      objc_msgSend(v21, "input");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v9;
      objc_msgSend(v9, "inputString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "isEqualToString:", v25) & 1) == 0)
      {

        v9 = v24;
LABEL_17:

        continue;
      }
      v26 = objc_msgSend(v21, "hasUnsupportedReading");

      v9 = v24;
      if ((v26 & 1) == 0)
        goto LABEL_21;
    }
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v18)
      continue;
    break;
  }
LABEL_22:

  -[TIKeyboardInputManager_zh_RetroCorrection setMarkedText](self, "setMarkedText");
  v4 = v31;
  v3 = v32;
LABEL_24:

LABEL_25:
}

- (TIZhuyinInputManager)zhuyinInputManager
{
  return self->_zhuyinInputManager;
}

- (void)setZhuyinInputManager:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (TIKeyboardCandidate)defaultCandidate
{
  return self->_defaultCandidate;
}

- (void)setDefaultCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultCandidate, 0);
  objc_storeStrong((id *)&self->_zhuyinInputManager, 0);
}

@end
