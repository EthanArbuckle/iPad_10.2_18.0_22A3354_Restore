@implementation TIKeyboardInputManager_th

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (TIKeyboardInputManager_th)initWithConfig:(id)a3 keyboardState:(id)a4
{
  id v6;
  TIKeyboardInputManager_th *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  TIWordSearch *wordSearch;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_th;
  v7 = -[TIKeyboardInputManagerMecabra initWithConfig:keyboardState:](&v13, sel_initWithConfig_keyboardState_, v6, a4);
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

    TIInputManager::set_search_algorithm();
  }

  return v7;
}

- (void)initImplementation
{
  void *result;
  TIInputManager *v3;

  result = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (!result)
  {
    v3 = (TIInputManager *)operator new();
    TIInputManager::TIInputManager(v3);
    *(_QWORD *)result = &unk_25012CAC0;
  }
  return result;
}

- (void)loadDictionaries
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_th;
  -[TIKeyboardInputManager_mul loadDictionaries](&v4, sel_loadDictionaries);
  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (v3)
    *(_BYTE *)(*(_QWORD *)(v3 + 224) + 64) = 1;
}

- (BOOL)shouldExtendPriorWord
{
  return 1;
}

- (BOOL)supportsLearning
{
  return 0;
}

- (BOOL)usesMarkedTextForInput
{
  return 0;
}

- (BOOL)usesRetrocorrection
{
  return 1;
}

- (id)wordSeparator
{
  return &stru_25012CBF0;
}

- (BOOL)deletesComposedTextByComposedCharacterSequence
{
  return 0;
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4DE0]);
}

- (void)setAutoCorrects:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardInputManager_th wordSearch](self, "wordSearch");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoCorrects:", v3);

}

- (id)firstMecabraCandidateOccurranceFromLastAutocorrectionList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[TIKeyboardInputManager_th lastAutocorrectionList](self, "lastAutocorrectionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "corrections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autocorrection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v5;
  if (!v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[TIKeyboardInputManager_th lastAutocorrectionList](self, "lastAutocorrectionList", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predictions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v9);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v7 = v12;
            goto LABEL_15;
          }
        }
        v7 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_15:

  }
  return v7;
}

- (BOOL)shouldAutocommitForInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  void *v11;
  unint64_t WordCount;
  void *v13;
  uint64_t v14;
  char *v15;
  double v16;
  unint64_t v17;
  BOOL v19;
  objc_super v21;
  objc_super v22;

  v4 = a3;
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]))
  {
    -[TIKeyboardInputManager_th keyboardState](self, "keyboardState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "autocorrectionEnabled"))
    {
      -[TIKeyboardInputManager_th keyboardState](self, "keyboardState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textInputTraits");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "autocorrectionType") != 1;

    }
    else
    {
      v8 = 0;
    }

    -[TIKeyboardInputManager_th firstMecabraCandidateOccurranceFromLastAutocorrectionList](self, "firstMecabraCandidateOccurranceFromLastAutocorrectionList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v10);
      MecabraCandidateGetAnalysisString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      WordCount = (int)MecabraCandidateGetWordCount();
    }
    else if (v8)
    {
      v11 = 0;
      WordCount = 0;
    }
    else
    {
      -[TIKeyboardInputManager_th inputStem](self, "inputStem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(v4, "string");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingString:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v14;
      }
      v22.receiver = self;
      v22.super_class = (Class)TIKeyboardInputManager_th;
      WordCount = (unint64_t)-[TIKeyboardInputManager_th countOfWordsIninputStem:](&v22, sel_countOfWordsIninputStem_, v11);
    }
    v21.receiver = self;
    v21.super_class = (Class)TIKeyboardInputManager_th;
    v15 = (char *)-[TIKeyboardInputManager_th maxPriorWordTokensAfterTrimming](&v21, sel_maxPriorWordTokensAfterTrimming)+ 1;
    if (WordCount)
      v16 = (float)((float)(unint64_t)objc_msgSend(v11, "length") / (float)WordCount);
    else
      v16 = 1.0;
    v17 = objc_msgSend(v11, "length");
    v19 = v16 > 2.5 && WordCount > (unint64_t)v15;
    v9 = v17 > 0xC || v19;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)trimmedInputStem
{
  __CFString *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v12;
  objc_super v13;

  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]))
    return 0;
  -[TIKeyboardInputManager_th inputStem](self, "inputStem");
  v3 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v4 = -[__CFString _lastLongCharacter](v3, "_lastLongCharacter");
  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "_stringWithUnichar:", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_25012CBF0;
  }
  if (-[TIKeyboardInputManagerMecabra stringEndsWord:](self, "stringEndsWord:", v5))
  {

    v7 = &stru_25012CBF0;
  }
  else
  {
    v7 = v3;
    if (-[TIKeyboardInputManager_th shouldAutocommitForInput:](self, "shouldAutocommitForInput:", 0))
    {
      -[TIKeyboardInputManager_th firstMecabraCandidateOccurranceFromLastAutocorrectionList](self, "firstMecabraCandidateOccurranceFromLastAutocorrectionList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v8);
        objc_msgSend(MEMORY[0x24BEB5400], "getWordFromAnalysisStringOf:atIndex:", v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString hasPrefix:](v3, "hasPrefix:", v10))
        {
          -[__CFString substringFromIndex:](v3, "substringFromIndex:", objc_msgSend(v10, "length"));
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13.receiver = self;
          v13.super_class = (Class)TIKeyboardInputManager_th;
          -[TIKeyboardInputManager_th trimmedInputStem](&v13, sel_trimmedInputStem);
          v11 = objc_claimAutoreleasedReturnValue();
        }
        v7 = (__CFString *)v11;

        -[TIKeyboardInputManager_th setLastAutocorrectionList:](self, "setLastAutocorrectionList:", 0);
      }
      else
      {
        v12.receiver = self;
        v12.super_class = (Class)TIKeyboardInputManager_th;
        -[TIKeyboardInputManager_th trimmedInputStem](&v12, sel_trimmedInputStem);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v10 = v3;
      }

    }
  }

  return v7;
}

- (BOOL)canTrimInputAtIndex:(unsigned int)a3
{
  return TIInputManager::LockedInput::locked_length((TIInputManager::LockedInput *)(*(char **)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498])
                                                                                                + 172)) <= a3;
}

- (void)dropInputPrefix:(unsigned int)a3
{
  -[TIKeyboardInputManager_th dropInputPrefix:commitToWordSearch:](self, "dropInputPrefix:commitToWordSearch:", *(_QWORD *)&a3, 1);
}

- (void)dropInputPrefix:(unsigned int)a3 commitToWordSearch:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  TIInputManager *v7;
  const KB::String *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  objc_super v14;
  _BYTE v15[32];
  uint64_t v16;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (v7)
  {
    TIInputManager::input_substring(v7);
    KB::ns_string((KB *)v15, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_mul internalStringToExternal:](self, "internalStringToExternal:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    KB::String::~String((KB::String *)v15);
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v10, "length") && v4)
  {
    -[TIKeyboardInputManager_th wordSearch](self, "wordSearch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "commitSurface:", v10);

  }
  if ((_DWORD)v5)
  {
    v12 = v5;
    do
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeInputAtIndex:", 0);

      --v12;
    }
    while (v12);
  }
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardInputManager_th;
  -[TIKeyboardInputManagerMecabra dropInputPrefix:](&v14, sel_dropInputPrefix_, v5);

}

- (void)setInput:(id)a3 withIndex:(unsigned int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  if (!a4)
    a3 = &stru_25012CBF0;
  -[TIKeyboardInputManager_th setInput:](self, "setInput:", a3);
  -[TIKeyboardInputManager_th setInputIndex:](self, "setInputIndex:", v4);
}

- (void)setInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TIKeyboardInputManager_th;
  -[TIKeyboardInputManager_th setInput:](&v18, sel_setInput_, v4);
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllInputs");

  objc_msgSend(v4, "_asTypeInputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v6, "inputs", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "composeNew:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

}

- (void)setWordBoundary
{
  uint64_t v2;

  v2 = (int)*MEMORY[0x24BEB5498];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v2))
  {
    -[TIKeyboardInputManager_th dropInput](self, "dropInput");
    TIInputManager::set_input_index(*(TIInputManager **)((char *)&self->super.super.super.super.super.isa + v2));
  }
}

- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TIKeyboardInputManager_th;
  -[TIKeyboardInputManagerMecabra textAccepted:fromPredictiveInputBar:withInput:](&v23, sel_textAccepted_fromPredictiveInputBar_withInput_, v8, v6, v9);
  v10 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v8);
  -[TIKeyboardInputManager_th wordSearch](self, "wordSearch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "performAccept:isPartial:", v10, 0);
  }
  else
  {
    objc_msgSend(v8, "candidate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "commitSurface:", v13);

  }
  objc_msgSend(v9, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    -[TIKeyboardInputManager_th wordSearch](self, "wordSearch");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "commitSurface:", v17);

  }
  if (_os_feature_enabled_impl())
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "composingInput");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "composingInput");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21 && (objc_msgSend(v21, "isCompleting") & 1) == 0 && !objc_msgSend(v21, "isComplete"))
        goto LABEL_15;
    }
    else
    {

      v21 = 0;
    }
    -[TIKeyboardInputManager_th lastAcceptedText](self, "lastAcceptedText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra clearInput](self, "clearInput");
    -[TIKeyboardInputManager_th setLastAcceptedText:](self, "setLastAcceptedText:", v22);

LABEL_15:
    goto LABEL_16;
  }
  -[TIKeyboardInputManagerMecabra clearInput](self, "clearInput");
LABEL_16:

}

- (int64_t)addTouch:(id)a3 shouldHitTest:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  if (!objc_msgSend(v6, "stage") && !objc_msgSend(v6, "continuousPathState"))
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "composingInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "composingInput");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10 || (objc_msgSend(v10, "isCompleting") & 1) == 0 && !objc_msgSend(v10, "isComplete"))
        goto LABEL_10;
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeAllInputs");
    }
    else
    {

      v10 = 0;
    }

LABEL_10:
  }
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_th;
  v11 = -[TIKeyboardInputManagerMecabra addTouch:shouldHitTest:](&v13, sel_addTouch_shouldHitTest_, v6, v4);

  return (int64_t)v11;
}

- (void)candidateRejected:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_th;
  -[TIKeyboardInputManagerMecabra candidateRejected:](&v4, sel_candidateRejected_, a3);
  -[TIKeyboardInputManager_th setWordBoundary](self, "setWordBoundary");
}

- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManager_th;
  -[TIKeyboardInputManagerMecabra registerLearning:fullCandidate:keyboardState:mode:](&v7, sel_registerLearning_fullCandidate_keyboardState_mode_, a3, a4, a5, a6);
  -[TIKeyboardInputManager_th setWordBoundary](self, "setWordBoundary");
}

- (id)validCharacterSetForAutocorrection
{
  return 0;
}

- (USet)validUSetForAutocorrection
{
  if (-[TIKeyboardInputManager_th validUSetForAutocorrection]::onceToken != -1)
    dispatch_once(&-[TIKeyboardInputManager_th validUSetForAutocorrection]::onceToken, &__block_literal_global);
  return (USet *)-[TIKeyboardInputManager_th validUSetForAutocorrection]::thai_alphabet_set;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  -[TIKeyboardInputManager_th lastAutocorrectionList](self, "lastAutocorrectionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "corrections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "autocorrection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "candidate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (-[TIKeyboardInputManager_th shouldAutocommitForInput:](self, "shouldAutocommitForInput:", v6) && (v13 & 1) == 0)
    {
      v14 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v10);
      objc_msgSend(MEMORY[0x24BEB5400], "getWordFromSurfaceOf:atIndex:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEB5400], "getWordFromAnalysisStringOf:atIndex:", v14, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      MecabraCandidateGetAnalysisString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager_th inputStem](self, "inputStem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "substringFromIndex:", objc_msgSend(v16, "length"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deleteTextBackward:", v18);
      objc_msgSend(v7, "insertText:", v15);
      objc_msgSend(v7, "insertText:", v19);
      -[TIKeyboardInputManager_th wordSearch](self, "wordSearch");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "commitSurface:", v15);

      v21 = -[TIKeyboardInputManager_th internalIndexOfInputStemSuffix:](self, "internalIndexOfInputStemSuffix:", v19);
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[TIKeyboardInputManagerMecabra clearInput](self, "clearInput");
        -[TIKeyboardInputManager_th setInput:](self, "setInput:", v19);
      }
      else
      {
        -[TIKeyboardInputManager_th dropInputPrefix:commitToWordSearch:](self, "dropInputPrefix:commitToWordSearch:", v21, 0);
      }
      -[TIKeyboardInputManager_th setLastAutocorrectionList:](self, "setLastAutocorrectionList:", 0);

    }
  }
  else
  {
    -[TIKeyboardInputManager_th shouldAutocommitForInput:](self, "shouldAutocommitForInput:", v6);
  }
  v26.receiver = self;
  v26.super_class = (Class)TIKeyboardInputManager_th;
  -[TIKeyboardInputManager_th addInput:withContext:](&v26, sel_addInput_withContext_, v6, v7);
  v22 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (v22)
  {
    if (-858993459 * ((*(_QWORD *)(v22 + 16) - *(_QWORD *)(v22 + 8)) >> 3))
    {
      v23 = *(unsigned int *)(v22 + 96);
      objc_msgSend(v6, "string");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "length");

      if (v25)
        -[TIKeyboardInputManagerMecabra saveGeometryForInput:atIndex:](self, "saveGeometryForInput:atIndex:", v6, v23);
    }
  }
  -[TIKeyboardInputManager_th setLastAutocorrectionList:](self, "setLastAutocorrectionList:", 0);
  -[TIKeyboardInputManager_th usesComposingInput](self, "usesComposingInput");

}

- (id)deleteFromInput:(unint64_t *)a3
{
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  objc_super v16;

  if (!-[TIKeyboardInputManager_th usesComposingInput](self, "usesComposingInput"))
    goto LABEL_11;
  -[TIKeyboardInputManager_th wordSearch](self, "wordSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composingInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    -[NSObject removeComposingInput](v9, "removeComposingInput");
LABEL_4:

    goto LABEL_9;
  }
  -[NSObject composingInput](v9, "composingInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0 && TICanLogMessageAtLevel())
  {
    TIOSLogFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[TIKeyboardInputManager_th deleteFromInput:].cold.1(v10);
    goto LABEL_4;
  }
LABEL_9:
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "composingInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
LABEL_11:
  v16.receiver = self;
  v16.super_class = (Class)TIKeyboardInputManager_th;
  -[TIKeyboardInputManager_th deleteFromInput:](&v16, sel_deleteFromInput_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)usesComposingInput
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = _os_feature_enabled_impl();
  -[TIKeyboardInputManager_th keyboardState](self, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "softwareLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Thai"));

  return v3 & v7;
}

- (BOOL)canTypeAndPathSimultaneously
{
  return 0;
}

- (BOOL)shouldResample
{
  return 1;
}

- (void)setKeyLayout:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isShifted") & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManager_th;
    -[TIKeyboardInputManager_th setKeyLayout:](&v5, sel_setKeyLayout_, v4);
  }

}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

- (void)deleteFromInput:(NSObject *)a1 .cold.1(NSObject *a1)
{
  void *v2;
  uint8_t buf[4];
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Thai input doesn't expect MCSyntethicInput in any case"), "-[TIKeyboardInputManager_th deleteFromInput:]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_23234A000, a1, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

}

@end
