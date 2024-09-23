@implementation TIKeyboardInputManagerChinese

- (TIKeyboardInputManagerChinese)initWithConfig:(id)a3 keyboardState:(id)a4
{
  id v6;
  TIKeyboardInputManagerChinese *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  TIWordSearch *wordSearch;
  TIMathSymbolPunctuationController *v12;
  TIMathSymbolPunctuationController *mathSymbolPunctuationController;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardInputManagerChinese;
  v7 = -[TIKeyboardInputManagerMecabra initWithConfig:keyboardState:](&v15, sel_initWithConfig_keyboardState_, v6, a4);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BEB5470], "sharedWordSearchController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wordSearchForInputMode:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    wordSearch = v7->_wordSearch;
    v7->_wordSearch = (TIWordSearch *)v10;

    v12 = (TIMathSymbolPunctuationController *)objc_alloc_init(MEMORY[0x24BEB53F8]);
    mathSymbolPunctuationController = v7->_mathSymbolPunctuationController;
    v7->_mathSymbolPunctuationController = v12;

    -[TIMathSymbolPunctuationController setReplaceAfterNumerals:](v7->_mathSymbolPunctuationController, "setReplaceAfterNumerals:", 1);
  }

  return v7;
}

- (void)resetCommitHistory
{
  void *v3;
  id v4;

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetPreviousWord");

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearCache");

}

- (void)initImplementationWithMode:(id)a3 andLanguage:(id)a4
{
  id v6;
  uint64_t v7;
  void *result;
  _BYTE v9[32];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[TIKeyboardInputManagerChinese setModeName:](self, "setModeName:", a3);
  -[TIKeyboardInputManagerChinese setLanguage:](self, "setLanguage:", v6);

  -[TIKeyboardInputManagerChinese setIsInCompletionMode:](self, "setIsInCompletionMode:", 0);
  v7 = (int)*MEMORY[0x24BEB5498];
  result = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
  if (!result)
  {
    operator new();
    *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)MEMORY[0x2495974C4]();
    MEMORY[0x2495974E8](v9, "zh");
    TIInputManager::set_locale_identifier();
    KB::String::~String((KB::String *)v9);
    return *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
  }
  return result;
}

- (void)syncToLayoutState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerChinese;
  v4 = a3;
  -[TIKeyboardInputManagerChinese syncToLayoutState:](&v7, sel_syncToLayoutState_, v4);
  v5 = objc_msgSend(v4, "isAlphabeticPlane", v7.receiver, v7.super_class);

  -[TIKeyboardInputManagerChinese setIsAlphabeticPlane:](self, "setIsAlphabeticPlane:", v5);
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearCache");

}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "syncToKeyboardState:from:afterContextChange:", v8, v9, v5);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TIKeyboardInputManagerChinese;
    -[TIKeyboardInputManagerMecabra syncToKeyboardState:from:afterContextChange:](&v13, sel_syncToKeyboardState_from_afterContextChange_, v8, v9, v5);
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDebuggingLogEnabled:", -[TIKeyboardInputManagerChinese isTypologyEnabled](self, "isTypologyEnabled"));

  }
}

- (id)didAcceptCandidate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[TIKeyboardInputManagerChinese setCurrentKeyHint:](self, "setCurrentKeyHint:", 0);
  v5 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v4);

  if (-[TIKeyboardInputManagerChinese isInCompletionMode](self, "isInCompletionMode")
    && -[TIKeyboardInputManagerChinese shouldLearnAcceptedCandidate](self, "shouldLearnAcceptedCandidate")
    && v5)
  {
    v6 = objc_alloc(MEMORY[0x24BEB5478]);
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithWordSearch:mecabraCandidate:isPartial:isPrediction:", v7, v5, 0, 1);

    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performOperationAsync:", v8);

  }
  if (-[TIKeyboardInputManagerChinese inputCount](self, "inputCount"))
  {
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "candidates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      -[TIKeyboardInputManagerChinese clearInput](self, "clearInput");
  }
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clearCache");

  return 0;
}

- (void)inputLocationChanged
{
  objc_super v3;

  -[TIKeyboardInputManagerChinese setCurrentKeyHint:](self, "setCurrentKeyHint:", 0);
  if (!-[TIKeyboardInputManagerChinese duringDeleteFromInputWithContext](self, "duringDeleteFromInputWithContext"))
    -[TIMathSymbolPunctuationController reset](self->_mathSymbolPunctuationController, "reset");
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerChinese;
  -[TIKeyboardInputManagerChinese inputLocationChanged](&v3, sel_inputLocationChanged);
}

- (void)clearInput
{
  objc_super v3;

  -[TIKeyboardInputManagerChinese setCurrentKeyHint:](self, "setCurrentKeyHint:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerChinese;
  -[TIKeyboardInputManagerMecabra clearInput](&v3, sel_clearInput);
}

- (void)setInput:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[TIKeyboardInputManagerChinese setCurrentKeyHint:](self, "setCurrentKeyHint:", 0);
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerChinese;
  -[TIKeyboardInputManagerChinese setInput:](&v5, sel_setInput_, v4);

}

- (id)deleteFromInput:(unint64_t *)a3
{
  objc_super v6;

  -[TIKeyboardInputManagerChinese setCurrentKeyHint:](self, "setCurrentKeyHint:", 0);
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerChinese;
  -[TIKeyboardInputManagerChinese deleteFromInput:](&v6, sel_deleteFromInput_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)deleteFromInputWithContext:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[TIKeyboardInputManagerChinese setDuringDeleteFromInputWithContext:](self, "setDuringDeleteFromInputWithContext:", 1);
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerChinese;
  -[TIKeyboardInputManagerMecabra deleteFromInputWithContext:](&v5, sel_deleteFromInputWithContext_, v4);

  -[TIKeyboardInputManagerChinese setDuringDeleteFromInputWithContext:](self, "setDuringDeleteFromInputWithContext:", 0);
  -[TIMathSymbolPunctuationController setEnabled:](self->_mathSymbolPunctuationController, "setEnabled:", -[TIMathSymbolPunctuationController converted](self->_mathSymbolPunctuationController, "converted") ^ 1);
}

- (id)replacementForDoubleSpace
{
  if (-[TIKeyboardInputManagerChinese isAlphabeticPlane](self, "isAlphabeticPlane"))
    return CFSTR(".");
  else
    return CFSTR("。");
}

- (id)wordCharacters
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)-[TIKeyboardInputManagerChinese wordCharacters]::__wordCharacterSet;
  if (!-[TIKeyboardInputManagerChinese wordCharacters]::__wordCharacterSet)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4D00]), "initWithBaseCharacterSet:", 3);
    objc_msgSend(v3, "invertedSetDescription");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)-[TIKeyboardInputManagerChinese wordCharacters]::__wordCharacterSet;
    -[TIKeyboardInputManagerChinese wordCharacters]::__wordCharacterSet = v4;

    v2 = (void *)-[TIKeyboardInputManagerChinese wordCharacters]::__wordCharacterSet;
  }
  return v2;
}

- (BOOL)shouldEnableHalfWidthPunctuationForCurrentInputContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[TIKeyboardInputManagerChinese keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextBeforeInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5490]))
  {
    -[TIKeyboardInputManager_mul externalStringToInternal:](self, "externalStringToInternal:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = +[TIKeyboardInputManagerChinese shouldEnableHalfWidthPunctuationForDocumentContext:composedText:](TIKeyboardInputManagerChinese, "shouldEnableHalfWidthPunctuationForDocumentContext:composedText:", v5, v6);

  return v7;
}

- (id)candidateResultSetUsedForCompletionQuery
{
  return 0;
}

- (BOOL)isFacemarkInput:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB5A98]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[TIKeyboardInputManagerChinese keyboardState](self, "keyboardState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hardwareKeyboardMode"))
    {
      if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB5A88]) & 1) != 0)
        v5 = 1;
      else
        v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB5A90]);
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)showingFacemarkCandidates
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v4);
        v8 += objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "isFacemarkCandidate", (_QWORD)v12);
        if (v7 + i + 1 > 4)
        {
          v7 += i + 1;
          goto LABEL_12;
        }
      }
      v7 += i;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
LABEL_12:

  return v7 < 2 * v8;
}

- (BOOL)hasIdeographicCandidates
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "candidate", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "_containsIdeographicCharacters");

        if ((v9 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)mecabraCandidateRefFromPointerValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateRefsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)predictionOptions
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;
  int v9;

  if (-[TIKeyboardInputManagerChinese shouldSearchCompletionForSubstrings](self, "shouldSearchCompletionForSubstrings"))
    v3 = 2;
  else
    v3 = 0;
  if (-[TIKeyboardInputManagerChinese shouldLearnAcceptedCandidate](self, "shouldLearnAcceptedCandidate"))
    v4 = v3;
  else
    v4 = v3 | 4;
  -[TIKeyboardInputManagerChinese keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hardwareKeyboardMode");

  if (v6)
    v7 = v4 | 0x10;
  else
    v7 = v4;
  -[TIKeyboardInputManagerChinese keyboardState](self, "keyboardState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "candidateSelectionPredictionEnabled");

  if (v9)
    return v7;
  else
    return v7 | 0x20;
}

- (id)generateCompletions
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  id v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  TIKeyboardInputManagerChinese *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  __CFString *v37;
  __CFString *v38;
  id v39;
  TIKeyboardInputManagerChinese *v40;
  unint64_t v41;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BEB5468]);
    v4 = -[TIKeyboardInputManagerChinese predictionOptions](self, "predictionOptions");
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mecabraEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerChinese keyboardState](self, "keyboardState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "contextBeforeInput");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_251980880;
    v12 = v11;

    objc_msgSend(v8, "contextAfterInput");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (__CFString *)v13;
    else
      v15 = &stru_251980880;
    v16 = v15;

    v17 = (void *)MEMORY[0x24BDD1478];
    v18 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke;
    v35[3] = &unk_25197FD28;
    v36 = v6;
    v37 = v12;
    v38 = v16;
    v41 = v4;
    v19 = v3;
    v39 = v19;
    v40 = self;
    v20 = v16;
    v21 = v12;
    v22 = v6;
    objc_msgSend(v17, "blockOperationWithBlock:", v35);
    v28 = v18;
    v29 = 3221225472;
    v30 = __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_60;
    v31 = &unk_25197FDC8;
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v33 = self;
    v34 = v19;
    v23 = v19;
    v24 = v32;
    objc_msgSend(v24, "setCompletionBlock:", &v28);
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch", v28, v29, v30, v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "cancel");

    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "performOperationAsync:", v24);

  }
  return 0;
}

- (BOOL)updateCompletionCandidatesIfAppropriate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if ((-[TIKeyboardInputManagerChinese conformsToProtocol:](self, "conformsToProtocol:", &unk_25773D688) & 1) != 0)
  {
    if ((-[TIKeyboardInputManagerChinese shouldLookForCompletionCandidates](self, "shouldLookForCompletionCandidates") & 1) != 0)
    {
      -[TIKeyboardInputManagerChinese currentKeyHint](self, "currentKeyHint");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        -[TIKeyboardInputManagerChinese currentKeyHint](self, "currentKeyHint");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerChinese completionCandidateResultSetForKeyHint:](self, "completionCandidateResultSetForKeyHint:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[TIKeyboardInputManagerChinese generateCompletions](self, "generateCompletions");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v5);
      v7 = v5 != 0;

    }
    else
    {
      -[TIKeyboardInputManagerChinese willExitCompletionMode](self, "willExitCompletionMode");
      -[TIKeyboardInputManagerChinese setIsInCompletionMode:](self, "setIsInCompletionMode:", 0);
      return 0;
    }
  }
  else
  {
    if (-[TIKeyboardInputManagerChinese isInCompletionMode](self, "isInCompletionMode"))
    {
      -[TIKeyboardInputManagerChinese willExitCompletionMode](self, "willExitCompletionMode");
      -[TIKeyboardInputManagerChinese setIsInCompletionMode:](self, "setIsInCompletionMode:", 0);
    }
    objc_msgSend(MEMORY[0x24BEB5468], "emptySet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v6);

    return 1;
  }
  return v7;
}

- (void)wordSearchEngineDidFindPredictionCandidates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TIKeyboardInputManagerChinese setIsInCompletionMode:](self, "setIsInCompletionMode:", objc_msgSend(v4, "isEmpty") ^ 1);
  v5 = (void *)objc_opt_class();
  -[TIKeyboardInputManagerChinese keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextBeforeInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "punctuationPredictionsForString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v9, "reverseObjectEnumerator", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v4, "insertSyntheticMecabraCandidateWithSurface:input:atIndex:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14++), &stru_251980880, 0);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  -[TIKeyboardInputManagerMecabra updateProactiveCandidatesForCandidateResultSet:withInput:](self, "updateProactiveCandidatesForCandidateResultSet:withInput:", v4, &stru_251980880);
  if (-[TIKeyboardInputManagerChinese candidateRange](self, "candidateRange"))
  {
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "candidateRefsDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addCandidates:candidateRefsDictionary:", MEMORY[0x24BDBD1A8], v16);

  }
  -[TIKeyboardInputManagerMecabra updateProactiveCandidatesForCandidateResultSet:withInput:](self, "updateProactiveCandidatesForCandidateResultSet:withInput:", v4, &stru_251980880);
  -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v4);
  -[TIKeyboardInputManagerMecabra candidateResultSetFromWordSearchCandidateResultSet:](self, "candidateResultSetFromWordSearchCandidateResultSet:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerChinese closeCandidateGenerationContextWithResults:](self, "closeCandidateGenerationContextWithResults:", v17);

}

- (id)completionCandidateResultSetForKeyHint:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  int v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Chinese")))
  {
    -[TIKeyboardInputManagerChinese language](self, "language");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("zh-Hans"));

    v25 = 0;
    if (v6)
      v7 = &unk_2519875F0;
    else
      v7 = &unk_251987608;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Latin")) & 1) != 0)
  {
    v7 = &unk_251987620;
    v25 = 1;
  }
  else
  {
    v25 = objc_msgSend(v4, "isEqualToString:", CFSTR("Numbers"));
    if (v25)
      v7 = &unk_251987638;
    else
      v7 = 0;
  }
  if (!objc_msgSend(v7, "count"))
  {
    v27 = 0;
    goto LABEL_32;
  }
  v24 = v4;
  v27 = objc_alloc_init(MEMORY[0x24BEB5468]);
  objc_msgSend((id)objc_opt_class(), "pairedPunctuationDictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v8)
    goto LABEL_30;
  v9 = v8;
  v10 = *(_QWORD *)v29;
  v11 = *MEMORY[0x24BDBCB98];
  v12 = v7;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v29 != v10)
        objc_enumerationMutation(v7);
      v14 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * i);
      v15 = v14;
      if (v25)
      {
        objc_msgSend(v14, "stringByApplyingTransform:reverse:", v11, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v16) & 1) == 0)
        {
          v17 = CFSTR("UI-Fullwidth");
          goto LABEL_22;
        }
      }
      else
      {
        objc_msgSend(v14, "stringByApplyingTransform:reverse:", v11, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v16) & 1) == 0)
        {
          v17 = CFSTR("UI-Halfwidth");
LABEL_22:
          if (objc_msgSend(v7, "containsObject:", v16, v24))
            v18 = v17;
          else
            v18 = 0;
          goto LABEL_25;
        }
      }
      v18 = 0;
LABEL_25:

      objc_msgSend(v26, "objectForKeyedSubscript:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v21 = -objc_msgSend(v19, "length");
        objc_msgSend(v15, "stringByAppendingString:", v20);
        v22 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v22;
      }
      else
      {
        v21 = 0;
      }
      objc_msgSend(v27, "addSyntheticMecabraCandidateWithSurface:input:isExtension:deleteCount:cursorMovement:annotation:", v15, &stru_251980880, 0, 1, v21, v18, v24);

      v7 = v12;
    }
    v9 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v9);
LABEL_30:

  v4 = v24;
LABEL_32:

  return v27;
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
    -[TIKeyboardInputManagerChinese inputString](self, "inputString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "length"))
    {
      v7 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerChinese;
  v7 = -[TIKeyboardInputManagerChinese initialSelectedIndex](&v9, sel_initialSelectedIndex);
  if (v6)
    goto LABEL_5;
LABEL_6:

  return (unint64_t)v7;
}

- (id)sortingMethods
{
  return 0;
}

- (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3
{
  return 1;
}

- (id)titleForSortingMethod:(id)a3
{
  return +[CIMCandidateData sortTitleFromSortingMethod:](CIMCandidateData, "sortTitleFromSortingMethod:", objc_msgSend(a3, "unsignedIntegerValue"));
}

- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (-[TIKeyboardInputManagerChinese shouldOmitEmojiCandidates](self, "shouldOmitEmojiCandidates"))
  {
    objc_msgSend(v8, "_arrayByFilteringEmojiCandidates:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardInputManagerChinese;
  -[TIKeyboardInputManagerChinese candidateResultSetFromCandidates:proactiveTriggers:](&v12, sel_candidateResultSetFromCandidates_proactiveTriggers_, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)sortMethodsGroupsForCandidates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  -[TIKeyboardInputManagerChinese candidateData](self, "candidateData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearCache");

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerChinese;
  -[TIKeyboardInputManagerChinese sortMethodsGroupsForCandidates:](&v8, sel_sortMethodsGroupsForCandidates_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    -[TIKeyboardInputManagerChinese candidateData](self, "candidateData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCandidates:", v7);

    v9 = objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(v8, "candidatesSortedByMethod:omittingEmoji:", v9, -[TIKeyboardInputManagerChinese shouldOmitEmojiCandidates](self, "shouldOmitEmojiCandidates"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9 && v10)
  {
    -[TIKeyboardInputManagerChinese operationQueue](self, "operationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __95__TIKeyboardInputManagerChinese_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke;
    v13[3] = &unk_251980568;
    v13[4] = self;
    v14 = v8;
    v15 = v9;
    v16 = v11;
    objc_msgSend(v12, "addOperationWithBlock:", v13);

  }
}

- (CIMCandidateData)candidateData
{
  TIKeyboardInputManagerChinese *v2;
  CIMCandidateData *candidateData;
  CIMCandidateData *v4;
  void *v5;
  uint64_t v6;
  CIMCandidateData *v7;
  CIMCandidateData *v8;

  v2 = self;
  objc_sync_enter(v2);
  candidateData = v2->_candidateData;
  if (!candidateData)
  {
    v4 = [CIMCandidateData alloc];
    -[TIKeyboardInputManagerBase inputMode](v2, "inputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CIMCandidateData initWithInputMode:](v4, "initWithInputMode:", v5);
    v7 = v2->_candidateData;
    v2->_candidateData = (CIMCandidateData *)v6;

    candidateData = v2->_candidateData;
  }
  v8 = candidateData;
  objc_sync_exit(v2);

  return v8;
}

- (NSOperationQueue)operationQueue
{
  TIKeyboardInputManagerChinese *v2;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;
  NSOperationQueue *v6;

  v2 = self;
  objc_sync_enter(v2);
  operationQueue = v2->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v5 = v2->_operationQueue;
    v2->_operationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    operationQueue = v2->_operationQueue;
  }
  v6 = operationQueue;
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)shouldSearchCompletionForSubstrings
{
  return 1;
}

- (id)outputByConvertingDecimalPointForInput:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[TIKeyboardInputManagerChinese keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hardwareKeyboardMode");

  v7 = v4;
  if (v6)
  {
    -[TIKeyboardInputManagerChinese keyboardState](self, "keyboardState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contextBeforeInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_lastGrapheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerChinese mathSymbolPunctuationController](self, "mathSymbolPunctuationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mathSymbolPunctuationedStringForInputString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v4;
    if (v14)
    {
      objc_msgSend(v14, "substringFromIndex:", objc_msgSend(v11, "length"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (void)setLearnsCorrection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerChinese;
  -[TIKeyboardInputManagerChinese setLearnsCorrection:](&v6, sel_setLearnsCorrection_);
  -[TIKeyboardInputManagerChinese setShouldLearnAcceptedCandidate:](self, "setShouldLearnAcceptedCandidate:", v3);
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldLearnAcceptedCandidate:", v3);

}

- (id)firstCandidate
{
  void *v2;
  void *v3;
  void *v4;

  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)acceptFirstCandidateWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  -[TIKeyboardInputManagerChinese firstCandidate](self, "firstCandidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v12, "acceptCandidate:", v4);
    -[TIKeyboardInputManagerChinese keyboardState](self, "keyboardState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra handleAcceptedCandidate:keyboardState:](self, "handleAcceptedCandidate:keyboardState:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hasKindOf:", objc_opt_class());

      if (v8)
      {
        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "asCommittedText");
        v10 = objc_claimAutoreleasedReturnValue();

        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeAllInputs");

        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5490]), "setString:", &stru_251980880);
        v6 = (void *)v10;
      }
    }
    if (v6)
      objc_msgSend(v12, "unmarkText:", v6);

  }
}

- (BOOL)supportsPairedPunctutationInput
{
  return 0;
}

- (BOOL)handlePairedPunctuationInput:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v41;
  uint64_t v42;
  uint64_t v43;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isFlick") & 1) == 0
    && -[TIKeyboardInputManagerChinese supportsPairedPunctutationInput](self, "supportsPairedPunctutationInput"))
  {
    objc_msgSend(v6, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "length"))
    {
      v33 = 0;
LABEL_29:

      goto LABEL_30;
    }
    v9 = objc_msgSend(v6, "isMultitap");
    if (v9)
    {
      -[TIKeyboardInputManagerChinese pairedPunctuationOpenQuote](self, "pairedPunctuationOpenQuote");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (!v11)
      {
LABEL_13:
        objc_msgSend((id)objc_opt_class(), "pairedPunctuationDictionary");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKey:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v14, "length"))
        {
          -[TIKeyboardInputManagerChinese setPairedPunctuationOpenQuote:](self, "setPairedPunctuationOpenQuote:", 0);
          -[TIKeyboardInputManagerChinese setPairedPunctuationSelectedText:](self, "setPairedPunctuationSelectedText:", 0);
          v33 = 0;
LABEL_28:

          goto LABEL_29;
        }
        if (v9)
        {
          -[TIKeyboardInputManagerChinese pairedPunctuationSelectedText](self, "pairedPunctuationSelectedText");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "length");

          if (v31)
          {
            -[TIKeyboardInputManagerChinese pairedPunctuationSelectedText](self, "pairedPunctuationSelectedText");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "deleteBackward:", objc_msgSend(v32, "length"));

            objc_msgSend(v7, "deleteForward:", 1);
          }
          else
          {
            objc_msgSend(v7, "deleteBackward:", 1);
          }
        }
        else
        {
          -[TIKeyboardInputManagerChinese keyboardState](self, "keyboardState");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "documentState");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "selectedText");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManagerChinese setPairedPunctuationSelectedText:](self, "setPairedPunctuationSelectedText:", v36);

          if (-[TIKeyboardInputManagerChinese inputCount](self, "inputCount"))
            -[TIKeyboardInputManagerChinese acceptFirstCandidateWithContext:](self, "acceptFirstCandidateWithContext:", v7);
          else
            -[TIKeyboardInputManagerChinese acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
        }
        -[TIKeyboardInputManagerChinese setPairedPunctuationOpenQuote:](self, "setPairedPunctuationOpenQuote:", v8);
        objc_msgSend(v7, "insertText:", v8);
        -[TIKeyboardInputManagerChinese pairedPunctuationSelectedText](self, "pairedPunctuationSelectedText");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "length");

        if (v38)
        {
          -[TIKeyboardInputManagerChinese pairedPunctuationSelectedText](self, "pairedPunctuationSelectedText");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "insertText:", v39);

        }
        objc_msgSend(v7, "insertTextAfterSelection:", v14);
LABEL_27:
        v33 = 1;
        goto LABEL_28;
      }
      objc_msgSend((id)objc_opt_class(), "pairedPunctuationDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerChinese pairedPunctuationOpenQuote](self, "pairedPunctuationOpenQuote");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "length"))
      {
        -[TIKeyboardInputManagerChinese keyboardState](self, "keyboardState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "documentState");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "contextAfterInput");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "hasPrefix:", v14);

        if (v18)
        {
          -[TIKeyboardInputManagerChinese pairedPunctuationSelectedText](self, "pairedPunctuationSelectedText");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "length");

          if (!v20)
          {
            objc_msgSend(v7, "deleteForward:", 1);

            goto LABEL_13;
          }
          -[TIKeyboardInputManagerChinese pairedPunctuationOpenQuote](self, "pairedPunctuationOpenQuote");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManagerChinese pairedPunctuationSelectedText](self, "pairedPunctuationSelectedText");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringByAppendingString:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          -[TIKeyboardInputManagerChinese keyboardState](self, "keyboardState");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "documentState");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "contextBeforeInput");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "rangeOfString:options:", v23, 4);
          v42 = v28;
          v43 = v27;

          if (v43 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v7, "deleteBackward:", v42);
            -[TIKeyboardInputManagerChinese pairedPunctuationSelectedText](self, "pairedPunctuationSelectedText");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "insertText:", v41);

            -[TIKeyboardInputManagerChinese setPairedPunctuationOpenQuote:](self, "setPairedPunctuationOpenQuote:", 0);
            goto LABEL_27;
          }

        }
      }

    }
    -[TIKeyboardInputManagerChinese setPairedPunctuationOpenQuote:](self, "setPairedPunctuationOpenQuote:", 0, v42);
    -[TIKeyboardInputManagerChinese setPairedPunctuationSelectedText:](self, "setPairedPunctuationSelectedText:", 0);
    goto LABEL_13;
  }
  v33 = 0;
LABEL_30:

  return v33;
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 800);
}

- (NSString)modeName
{
  return self->_modeName;
}

- (void)setModeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 808);
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

- (BOOL)isAlphabeticPlane
{
  return self->_isAlphabeticPlane;
}

- (void)setIsAlphabeticPlane:(BOOL)a3
{
  self->_isAlphabeticPlane = a3;
}

- (NSString)pairedPunctuationOpenQuote
{
  return self->_pairedPunctuationOpenQuote;
}

- (void)setPairedPunctuationOpenQuote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 832);
}

- (NSString)pairedPunctuationSelectedText
{
  return self->_pairedPunctuationSelectedText;
}

- (void)setPairedPunctuationSelectedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 840);
}

- (NSString)currentKeyHint
{
  return self->_currentKeyHint;
}

- (void)setCurrentKeyHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 848);
}

- (TIMathSymbolPunctuationController)mathSymbolPunctuationController
{
  return (TIMathSymbolPunctuationController *)objc_getProperty(self, a2, 856, 1);
}

- (BOOL)duringDeleteFromInputWithContext
{
  return self->_duringDeleteFromInputWithContext;
}

- (void)setDuringDeleteFromInputWithContext:(BOOL)a3
{
  self->_duringDeleteFromInputWithContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mathSymbolPunctuationController, 0);
  objc_storeStrong((id *)&self->_currentKeyHint, 0);
  objc_storeStrong((id *)&self->_pairedPunctuationSelectedText, 0);
  objc_storeStrong((id *)&self->_pairedPunctuationOpenQuote, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_candidateData, 0);
  objc_storeStrong((id *)&self->_modeName, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

void __95__TIKeyboardInputManagerChinese_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "groupedCandidatesFromCandidates:usingSortingMethod:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __95__TIKeyboardInputManagerChinese_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke_2;
  v6[3] = &unk_251980590;
  v4 = *(id *)(a1 + 56);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  objc_msgSend(v3, "addOperationWithBlock:", v6);

}

uint64_t __95__TIKeyboardInputManagerChinese_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t NextCandidate;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setLeftDocumentContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setRightDocumentContext:", *(_QWORD *)(a1 + 48));
  if (TICanLogMessageAtLevel())
  {
    TIOSLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 32), "leftDocumentContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "rightDocumentContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%s [Environment] Set left context: %@, Right context: %@"), "-[TIKeyboardInputManagerChinese generateCompletions]_block_invoke", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_debug_impl(&dword_248040000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "adjustEnvironmentDirectly:", 0);
  objc_msgSend(*(id *)(a1 + 32), "adjustEnvironmentDirectly:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "predictionAnalyzeWithOptions:maxNumberOfCandidates:", *(_QWORD *)(a1 + 72), 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "mecabra");
    while (1)
    {
      NextCandidate = MecabraPredictionGetNextCandidate();
      if (!NextCandidate)
        break;
      v4 = NextCandidate;
      if (MecabraCandidateGetType() == 6)
      {
        objc_msgSend(*(id *)(a1 + 56), "addMecabraProactiveCandidate:triggerSourceType:", v4, 0);
      }
      else
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4E80]), "initWithMecabraCandidate:", v4);
        objc_msgSend(*(id *)(a1 + 56), "addMecabraCandidate:mecabraCandidateRef:", v5, v4);

      }
    }
    objc_msgSend(*(id *)(a1 + 56), "proactiveTriggers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      if (TICanLogMessageAtLevel())
      {
        TIOSLogFacility();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v14 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(*(id *)(a1 + 56), "proactiveTriggers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: found prediction proactive triggers: %@"), "-[TIKeyboardInputManagerChinese generateCompletions]_block_invoke", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v18 = v16;
          _os_log_debug_impl(&dword_248040000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        }
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 64), "wordSearch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertTopSupplementalCandidateSurroundingCursorToFrontOfResultSet:", *(_QWORD *)(a1 + 56));

}

void __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_60(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_2;
  v6[3] = &unk_25197FDC8;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v2, "addOperationWithBlock:", v6);

}

void __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;
  _QWORD v11[5];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
  v2 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_3;
  v11[3] = &unk_25197FD78;
  v3 = *(void **)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 40);
  v12 = v3;
  v4 = (void *)MEMORY[0x2495977F4](v11);
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v6 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7[0] = v2;
    v7[1] = 3221225472;
    v7[2] = __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_5;
    v7[3] = &unk_25197FDA0;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    objc_msgSend(v6, "addStickers:withCompletionHandler:", v5, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_4;
  v4[3] = &unk_25197FD50;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "addOperationWithBlock:", v4);

}

void __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_5(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "addProactiveTriggers:withCompletionHandler:", v4, *(_QWORD *)(a1 + 32));

}

uint64_t __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "wordSearchEngineDidFindPredictionCandidates:", *(_QWORD *)(a1 + 40));
}

+ (id)punctuationPredictionsForString:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (+[TIKeyboardInputManagerChinese punctuationPredictionsForString:]::__onceToken != -1)
    dispatch_once(&+[TIKeyboardInputManagerChinese punctuationPredictionsForString:]::__onceToken, &__block_literal_global);
  v4 = objc_msgSend(v3, "length");
  v5 = v4;
  if (v4 < 2)
  {
    v8 = 0;
    if (!v4)
      goto LABEL_9;
  }
  else
  {
    v6 = (void *)+[TIKeyboardInputManagerChinese punctuationPredictionsForString:]::__punctuationPredictions;
    objc_msgSend(v3, "substringFromIndex:", v4 - 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_9;
  }
  if (!v8)
  {
    v9 = (void *)+[TIKeyboardInputManagerChinese punctuationPredictionsForString:]::__punctuationPredictions;
    objc_msgSend(v3, "substringFromIndex:", v5 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v8;
}

+ (id)GB18030CandidateFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  _BYTE v10[4];
  unsigned int v11;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("|g|")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("|g|"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "length") & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      if (objc_msgSend(v5, "scanHexInt:", &v11))
      {
        v6 = 0;
        v7 = 0;
        v11 = bswap32(v11);
        do
        {
          if (*((_BYTE *)&v11 + v6))
            v10[v7++] = *((_BYTE *)&v11 + v6);
          if (v6 > 2)
            break;
          ++v6;
        }
        while (v7 < 4);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v10, v7, CFStringConvertEncodingToNSStringEncoding(0x632u));
      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)unicodeCandidateFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  _WORD v10[2];
  int v11;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("|u|")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("|u|"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (objc_msgSend(v5, "scanHexInt:", &v11))
    {
      if ((v11 - 0x10000) >> 20)
      {
        v7 = 1;
        LOWORD(v6) = v11;
      }
      else
      {
        v6 = ((v11 + 67043328) >> 10) - 10240;
        v10[1] = v11 & 0x3FF | 0xDC00;
        v7 = 2;
      }
      v10[0] = v6;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v10, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)shouldEnableHalfWidthPunctuationForDocumentContext:(id)a3 composedText:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v5, "stringByAppendingString:", v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v5;
    }
    v7 = v8;

  }
  if (!objc_msgSend(v7, "length"))
    goto LABEL_19;
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "rangeOfCharacterFromSet:options:", v9, 12);
  v12 = v11;

  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v10 + v12 != objc_msgSend(v7, "length"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = objc_msgSend(&unk_251987650, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
LABEL_12:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(&unk_251987650);
        if ((objc_msgSend(v7, "hasSuffix:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17)) & 1) != 0)
          goto LABEL_9;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(&unk_251987650, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          v13 = 0;
          if (v15)
            goto LABEL_12;
          goto LABEL_20;
        }
      }
    }
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
LABEL_9:
  v13 = 1;
LABEL_20:

  return v13;
}

+ (Class)wordSearchClass
{
  return 0;
}

+ (id)pairedPunctuationDictionary
{
  if (+[TIKeyboardInputManagerChinese pairedPunctuationDictionary]::__onceToken != -1)
    dispatch_once(&+[TIKeyboardInputManagerChinese pairedPunctuationDictionary]::__onceToken, &__block_literal_global_325);
  return (id)+[TIKeyboardInputManagerChinese pairedPunctuationDictionary]::__pairedPunctuationDictionary;
}

void __60__TIKeyboardInputManagerChinese_pairedPunctuationDictionary__block_invoke()
{
  void *v0;

  v0 = (void *)+[TIKeyboardInputManagerChinese pairedPunctuationDictionary]::__pairedPunctuationDictionary;
  +[TIKeyboardInputManagerChinese pairedPunctuationDictionary]::__pairedPunctuationDictionary = (uint64_t)&unk_2519877F8;

}

void __65__TIKeyboardInputManagerChinese_punctuationPredictionsForString___block_invoke()
{
  void *v0;

  v0 = (void *)+[TIKeyboardInputManagerChinese punctuationPredictionsForString:]::__punctuationPredictions;
  +[TIKeyboardInputManagerChinese punctuationPredictionsForString:]::__punctuationPredictions = (uint64_t)&unk_2519877D0;

}

@end
