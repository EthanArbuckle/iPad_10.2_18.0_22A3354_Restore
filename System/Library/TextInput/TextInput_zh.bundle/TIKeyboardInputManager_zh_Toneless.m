@implementation TIKeyboardInputManager_zh_Toneless

- (TIKeyboardInputManager_zh_Toneless)initWithInputMode:(id)a3 keyboardState:(id)a4 dynamic:(BOOL)a5
{
  _BOOL8 v5;
  TIKeyboardInputManager_zh_Toneless *v6;
  TIKeyboardInputManager_zh_Toneless *v7;
  objc_super v9;

  v5 = a5;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  v6 = -[TIKeyboardInputManagerBase initWithInputMode:keyboardState:](&v9, sel_initWithInputMode_keyboardState_, a3, a4);
  v7 = v6;
  if (v6)
  {
    -[TIKeyboardInputManager_zh_Toneless setDynamic:](v6, "setDynamic:", v5);
    -[TIKeyboardInputManager_zh_Toneless setAssertDefaultKeyPlane:](v7, "setAssertDefaultKeyPlane:", v5);
  }
  return v7;
}

- (void)setPhraseBoundary:(unint64_t)a3
{
  id v5;
  objc_super v6;

  if (-[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount") == a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
    -[TIKeyboardInputManagerChinesePhonetic setPhraseBoundary:](&v6, sel_setPhraseBoundary_, a3);
  }
  else
  {
    -[TIKeyboardInputManager_zh_Toneless activateRetroCorrection](self, "activateRetroCorrection");
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPhraseBoundary:", a3);

  }
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  objc_super v11;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  v10 = a3;
  -[TIKeyboardInputManager_zh_Toneless setPhraseBoundaryIfNecessary](self, "setPhraseBoundaryIfNecessary");
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  -[TIKeyboardInputManagerMecabra generateCandidatesWithKeyboardState:candidateRange:candidateHandler:](&v11, sel_generateCandidatesWithKeyboardState_candidateRange_candidateHandler_, v10, location, length, v9);

}

- (void)commitComposition
{
  void *v3;
  char isKindOfClass;
  objc_super v5;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TIKeyboardInputManager_zh_Toneless clearInput](self, "clearInput");
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  }
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  -[TIKeyboardInputManagerMecabra commitComposition](&v5, sel_commitComposition);
}

- (BOOL)shouldSearchCompletionForSubstrings
{
  return 0;
}

- (id)keyboardConfigurationLayoutTag
{
  objc_super v4;

  if (-[TIKeyboardInputManager_zh_Toneless dynamic](self, "dynamic"))
    return (id)*MEMORY[0x24BEB52D8];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  -[TIKeyboardInputManagerChinesePhonetic keyboardConfigurationLayoutTag](&v4, sel_keyboardConfigurationLayoutTag);
  return (id)objc_claimAutoreleasedReturnValue();
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

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleKeyboardInput:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
    -[TIKeyboardInputManagerChinesePhonetic handleKeyboardInput:](&v14, sel_handleKeyboardInput_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TIKeyboardInputManager_zh_Toneless candidateRange](self, "candidateRange");
    v9 = v8;
    -[TIKeyboardInputManager_zh_Toneless setCandidateRange:](self, "setCandidateRange:", 0, 1);
    v10 = -[TIKeyboardInputManagerChinesePhonetic candidateResultSetByWaitingForResults:](self, "candidateResultSetByWaitingForResults:", 1);
    -[TIKeyboardInputManager_zh_Toneless setCandidateRange:](self, "setCandidateRange:", v7, v9);
    -[TIKeyboardInputManager_zh_Toneless inputString](self, "inputString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v11, "_graphemeCount") <= 2)
    {

    }
    else
    {
      -[TIKeyboardInputManager_zh_Toneless inlineCandidate](self, "inlineCandidate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        -[TIKeyboardInputManager_zh_Toneless activateRetroCorrection](self, "activateRetroCorrection");
    }
  }

  return v6;
}

- (void)updateComposedText
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  -[TIKeyboardInputManagerChinesePhonetic updateComposedText](&v6, sel_updateComposedText);
  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_zh_Toneless setInlineCandidate:](self, "setInlineCandidate:", v5);

  -[TIKeyboardInputManager_zh_Toneless setMarkedText](self, "setMarkedText");
}

- (void)clearInput
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  -[TIKeyboardInputManagerChinesePhonetic clearInput](&v3, sel_clearInput);
  -[TIKeyboardInputManager_zh_Toneless setInlineCandidate:](self, "setInlineCandidate:", 0);
}

- (id)inputString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[TIKeyboardInputManager_zh_Toneless inlineCandidate](self, "inlineCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TIKeyboardInputManager_zh_Toneless inlineCandidate](self, "inlineCandidate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic stringByPrependingConvertedCandidateTextToString:](self, "stringByPrependingConvertedCandidateTextToString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
    -[TIKeyboardInputManagerChinesePhonetic inputString](&v9, sel_inputString);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)deleteFromInput:(unint64_t *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  -[TIKeyboardInputManagerChinesePhonetic deleteFromInput:](&v8, sel_deleteFromInput_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerChinesePhonetic inputStringForSearch](self, "inputStringForSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  return v4;
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
  v28.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  -[TIKeyboardInputManagerChinese groupedCandidatesFromCandidates:usingSortingMethod:](&v28, sel_groupedCandidatesFromCandidates_usingSortingMethod_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_zh_Toneless inlineCandidate](self, "inlineCandidate");
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
          v22[2] = __89__TIKeyboardInputManager_zh_Toneless_groupedCandidatesFromCandidates_usingSortingMethod___block_invoke;
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
  id v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  objc_super v13;

  v4 = a3;
  -[TIKeyboardInputManager_zh_Toneless setInlineCandidate:](self, "setInlineCandidate:", 0);
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  -[TIKeyboardInputManagerChinesePhonetic didAcceptCandidate:](&v13, sel_didAcceptCandidate_, v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerChinesePhonetic remainingInput](self, "remainingInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    if (-[TIKeyboardInputManager_zh_Toneless dynamic](self, "dynamic"))
    {
      -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "candidates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager_zh_Toneless setAssertDefaultKeyPlane:](self, "setAssertDefaultKeyPlane:", objc_msgSend(v9, "count") != 0);

    }
  }
  else
  {
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  }
  if (v5)
    v10 = v5;
  else
    v10 = &stru_25012F088;
  v11 = v10;

  return v11;
}

- (void)activateRetroCorrection
{
  void *v3;
  void *v4;
  TIKeyboardInputManager_zh_RetroCorrection *v5;
  void *v6;
  void *v7;
  TIKeyboardInputManager_zh_RetroCorrection *v8;
  id v9;

  -[TIKeyboardInputManager_zh_Toneless inlineCandidate](self, "inlineCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v3);

  objc_msgSend(MEMORY[0x24BEB4E80], "dictionaryReadingFromMecabraCandidate:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [TIKeyboardInputManager_zh_RetroCorrection alloc];
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_zh_Toneless keyboardState](self, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TIKeyboardInputManager_zh_RetroCorrection initWithInputMode:keyboardState:inputString:](v5, "initWithInputMode:keyboardState:inputString:", v6, v7, v9);
  -[TIKeyboardInputManagerMecabra composeTextWith:](self, "composeTextWith:", v8);

}

- (TIMecabraCandidate)inlineCandidate
{
  return self->_inlineCandidate;
}

- (void)setInlineCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (BOOL)dynamic
{
  return *(&self->_assertDefaultKeyPlane + 3);
}

- (void)setDynamic:(BOOL)a3
{
  *(&self->_assertDefaultKeyPlane + 3) = a3;
}

- (BOOL)assertDefaultKeyPlane
{
  return *(&self->_assertDefaultKeyPlane + 4);
}

- (void)setAssertDefaultKeyPlane:(BOOL)a3
{
  *(&self->_assertDefaultKeyPlane + 4) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineCandidate, 0);
}

@end
