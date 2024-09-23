@implementation TIKeyboardInputManager_ja_Inline

- (TIKeyboardInputManager_ja_Inline)initWithConfig:(id)a3 keyboardState:(id)a4 wordSearch:(id)a5 romajiMode:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  TIKeyboardInputManager_ja_Inline *v12;
  TIKeyboardInputManager_ja_Inline *v13;
  __objc2_class *v14;
  uint64_t v15;
  TIMarkedTextBuffer *markedTextBuffer;
  NSArray *segments;
  objc_super v19;

  v6 = a6;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  v12 = -[TIKeyboardInputManagerMecabra initWithConfig:keyboardState:](&v19, sel_initWithConfig_keyboardState_, a3, a4);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_wordSearch, a5);
    if (v6)
      v14 = TIMarkedTextBuffer_ja_Romaji;
    else
      v14 = TIMarkedTextBuffer_ja_Kana;
    v15 = objc_msgSend([v14 alloc], "initWithInternalString:", &stru_250122EC0);
    markedTextBuffer = v13->_markedTextBuffer;
    v13->_markedTextBuffer = (TIMarkedTextBuffer *)v15;

    v13->_romajiMode = v6;
    -[TIMarkedTextBuffer setHardwareKeyboard:](v13->_markedTextBuffer, "setHardwareKeyboard:", 0);
    segments = v13->_segments;
    v13->_segments = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v13;
}

- (id)keyboardConfigurationLayoutTag
{
  return CFSTR("VoicedSoundMarkAndSemiVoicedSoundMarkAndSmallVariation");
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (id)wordCharacters
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D00], "kanaWordCharacters");
}

- (id)inputString
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[TIKeyboardInputManager_ja_Inline inlineCandidate](self, "inlineCandidate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_250122EC0;
  v5 = v3;

  return v5;
}

- (id)searchStringForMarkedText
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager_ja_Inline markedTextBuffer](self, "markedTextBuffer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)inputCount
{
  void *v2;
  unsigned int v3;

  -[TIKeyboardInputManager_ja_Inline inputString](self, "inputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (id)rawInputString
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  -[TIKeyboardInputManager_ja_Inline inputString](&v3, sel_inputString);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)rawInputIndex
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  return -[TIKeyboardInputManager_ja_Inline inputIndex](&v3, sel_inputIndex);
}

- (unint64_t)phraseBoundary
{
  return -[TIKeyboardInputManager_ja_Inline inputIndex](self, "inputIndex");
}

- (id)handleKeyboardInput:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  -[TIKeyboardInputManagerMecabra handleKeyboardInput:](&v6, sel_handleKeyboardInput_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_Inline generateInlineCandidate](self, "generateInlineCandidate");
  return v4;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  objc_super v29;
  uint64_t v30;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length")
    && (objc_msgSend(v8, "characterAtIndex:", 0) != 8616
     || -[TIKeyboardInputManager_ja_Inline inputCount](self, "inputCount")))
  {
    -[TIKeyboardInputManager_ja_Inline segments](self, "segments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 >= 4)
    {
      -[TIKeyboardInputManager_ja_Inline segments](self, "segments");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "surface");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v7, "output");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "insertText:", v13);

      }
      v15 = objc_alloc_init(MEMORY[0x24BDD16A8]);
      -[TIKeyboardInputManager_ja_Inline segments](self, "segments");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17 >= 2)
      {
        v18 = 1;
        do
        {
          -[TIKeyboardInputManager_ja_Inline segments](self, "segments");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "reading");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "appendString:", v21);

          ++v18;
          -[TIKeyboardInputManager_ja_Inline segments](self, "segments");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

        }
        while (v18 < v23);
      }
      -[TIKeyboardInputManager_ja_Inline setInput:](self, "setInput:", v15);

    }
    if (objc_msgSend(v6, "isMultitap"))
      -[TIKeyboardInputManager_ja_Inline deleteLastCharacter:](self, "deleteLastCharacter:", 0);
    if (objc_msgSend(v8, "length"))
    {
      v24 = 0;
      v25 = *MEMORY[0x24BDBEFB0];
      v26 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      do
      {
        objc_msgSend(v8, "substringWithRange:", v24, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29.receiver = self;
        v29.super_class = (Class)TIKeyboardInputManager_ja_Inline;
        v30 = 0;
        v28 = -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v29, sel_addInput_flags_point_firstDelete_, v27, 0, &v30, v25, v26);

        ++v24;
      }
      while (v24 < objc_msgSend(v8, "length"));
    }
    -[TIKeyboardInputManager_ja_Inline setMarkedText](self, "setMarkedText");
  }

}

- (id)deleteFromInput:(unint64_t *)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[TIKeyboardInputManager_ja_Inline deleteLastCharacter:](self, "deleteLastCharacter:", a3);
  -[TIKeyboardInputManager_ja_Inline segments](self, "segments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 2)
  {
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  }
  else
  {
    -[TIKeyboardInputManager_ja_Inline invokeEditMode](self, "invokeEditMode");
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setBackspace:", 1);
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "handleKeyboardInput:", v6);

  }
  return 0;
}

- (void)clearInput
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  -[TIKeyboardInputManagerMecabra clearInput](&v4, sel_clearInput);
  -[TIKeyboardInputManager_ja_Inline setInlineCandidate:](self, "setInlineCandidate:", 0);
  -[TIKeyboardInputManager_ja_Inline markedTextBuffer](self, "markedTextBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clear");

  -[TIKeyboardInputManager_ja_Inline setSegments:](self, "setSegments:", MEMORY[0x24BDBD1A8]);
  -[TIKeyboardInputManager_ja_Inline setMarkedText](self, "setMarkedText");
}

- (id)candidateResultSet
{
  if (-[TIKeyboardInputManager_ja_Inline shouldSkipCandidateGeneration](self, "shouldSkipCandidateGeneration"))
    return 0;
  objc_msgSend(MEMORY[0x24BEB4E18], "dummySet");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3
{
  id v4;
  TIKeyboardInputManager_ja_Candidates *v5;
  TIKeyboardInputManager_ja_Candidates *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  id location;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (TIKeyboardInputManager_ja_Candidates *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = [TIKeyboardInputManager_ja_Candidates alloc];
    -[TIKeyboardInputManager_ja_Inline config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Inline keyboardState](self, "keyboardState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Inline wordSearch](self, "wordSearch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[TIKeyboardInputManager_ja_Candidates initWithConfig:keyboardState:wordSearch:](v6, "initWithConfig:keyboardState:wordSearch:", v7, v8, v9);

    v10 = -[TIKeyboardInputManager_ja_Inline candidateRange](self, "candidateRange");
    -[TIKeyboardInputManager_ja_Candidates setCandidateRange:](v5, "setCandidateRange:", v10, v11);
    -[TIKeyboardInputManager_ja_Candidates setHardwareKeyboardMode:](v5, "setHardwareKeyboardMode:", 0);
    -[TIKeyboardInputManager_ja_Candidates setShowsPartialCandidate:](v5, "setShowsPartialCandidate:", 1);
    -[TIKeyboardInputManagerMecabra composeTextWith:](self, "composeTextWith:", v5);
  }
  objc_initWeak(&location, self);
  objc_msgSend(v4, "open");
  v12 = objc_alloc(MEMORY[0x24BEB5340]);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __87__TIKeyboardInputManager_ja_Inline_openCandidateGenerationContextWithCandidateHandler___block_invoke;
  v21 = &unk_2501228C8;
  objc_copyWeak(&v23, &location);
  v22 = v4;
  v13 = v4;
  v14 = (void *)objc_msgSend(v12, "initWithWrappedCandidateHandler:resultSetHandlerBlock:", v13, &v18);
  -[TIKeyboardInputManager_ja_Candidates openCandidateGenerationContextWithCandidateHandler:](v5, "openCandidateGenerationContextWithCandidateHandler:", v14);

  -[TIKeyboardInputManager_ja_Inline convertString](self, "convertString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_Inline contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_Inline geometryModelData](self, "geometryModelData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_Candidates makeCandidatesWithInputString:autoCommitString:contextString:predictionEnabled:reanalysisMode:singlePhrase:geometoryModelData:](v5, "makeCandidatesWithInputString:autoCommitString:contextString:predictionEnabled:reanalysisMode:singlePhrase:geometoryModelData:", v15, &stru_250122EC0, v16, 1, 0, 0, v17, v18, v19, v20, v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)setMarkedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  -[TIKeyboardInputManager_ja_Inline markedTextBuffer](self, "markedTextBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_Inline rawInputString](self, "rawInputString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInternalString:withInputIndex:", v4, -[TIKeyboardInputManager_ja_Inline rawInputIndex](self, "rawInputIndex"));

  -[TIKeyboardInputManager_ja_Inline markedTextBuffer](self, "markedTextBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  -[TIKeyboardInputManager_ja_Inline setInput:](&v8, sel_setInput_, v6);

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  -[TIKeyboardInputManager_ja_Inline setMarkedText](&v7, sel_setMarkedText);
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  -[TIKeyboardInputManagerMecabra handleAcceptedCandidate:keyboardState:](&v9, sel_handleAcceptedCandidate_keyboardState_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra remainingInput](self, "remainingInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
    -[TIKeyboardInputManager_ja_Inline generateInlineCandidate](self, "generateInlineCandidate");
  return v5;
}

- (id)didAcceptCandidate:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  -[TIKeyboardInputManager_ja_Inline convertString](self, "convertString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= objc_msgSend(v7, "length") || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[TIKeyboardInputManager_ja_Inline clearInput](self, "clearInput");
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "substringFromIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra setRemainingInput:](self, "setRemainingInput:", v9);

    v8 = &stru_250122EC0;
  }

  return (id)v8;
}

- (void)syncToKeyboardState:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (-[TIKeyboardInputManager_ja_Inline isEditMode](self, "isEditMode"))
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "syncToKeyboardState:", v4);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_ja_Inline;
    -[TIKeyboardInputManagerBase syncToKeyboardState:](&v6, sel_syncToKeyboardState_, v4);
    -[TIKeyboardInputManager_ja_Inline setPhraseBoundaryIfNecessary](self, "setPhraseBoundaryIfNecessary");
  }

}

- (id)geometryModelData
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)commitComposition
{
  void *v3;
  objc_super v4;

  if (-[TIKeyboardInputManager_ja_Inline isEditMode](self, "isEditMode"))
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Inline syncWithEditMode:](self, "syncWithEditMode:", v3);

  }
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  -[TIKeyboardInputManagerMecabra commitComposition](&v4, sel_commitComposition);
}

- (void)abortComposition
{
  void *v3;
  objc_super v4;

  if (-[TIKeyboardInputManager_ja_Inline isEditMode](self, "isEditMode"))
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Inline syncWithEditMode:](self, "syncWithEditMode:", v3);
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");

  }
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  -[TIKeyboardInputManagerMecabra abortComposition](&v4, sel_abortComposition);
}

- (void)deleteLastCharacter:(unint64_t *)a3
{
  void *v5;
  id v6;
  uint64_t i;
  id v8;
  unint64_t v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  objc_super v14;
  objc_super v15;
  objc_super v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v18 = 0;
  v19 = 0;
  -[TIKeyboardInputManager_ja_Inline markedTextBuffer](self, "markedTextBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v5, "deleteFromInput:newInput:inputIndex:", &v18, &v17, &v19);
  v6 = v17;

  if (v18 >= 1)
  {
    for (i = 0; i < v18; ++i)
    {
      v16.receiver = self;
      v16.super_class = (Class)TIKeyboardInputManager_ja_Inline;
      v8 = -[TIKeyboardInputManager_ja_Inline deleteFromInput:](&v16, sel_deleteFromInput_, a3);
    }
  }
  if (objc_msgSend(v6, "length"))
  {
    v9 = 0;
    v10 = *MEMORY[0x24BDBEFB0];
    v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    do
    {
      objc_msgSend(v6, "substringWithRange:", v9, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15.receiver = self;
      v15.super_class = (Class)TIKeyboardInputManager_ja_Inline;
      v13 = -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v15, sel_addInput_flags_point_firstDelete_, v12, 0, a3, v10, v11);

      ++v9;
    }
    while (v9 < objc_msgSend(v6, "length"));
  }
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14.receiver = self;
    v14.super_class = (Class)TIKeyboardInputManager_ja_Inline;
    -[TIKeyboardInputManager_ja_Inline setInputIndex:](&v14, sel_setInputIndex_);
  }

}

- (void)generateInlineCandidate
{
  TIWordSearchJapaneseOperationGetCandidates *v3;
  void *v4;
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
  uint64_t v15;
  uint64_t v16;
  TIWordSearchJapaneseOperationGetCandidates *v17;

  if (!-[TIKeyboardInputManager_ja_Inline shouldSkipCandidateGeneration](self, "shouldSkipCandidateGeneration"))
  {
    v3 = [TIWordSearchJapaneseOperationGetCandidates alloc];
    -[TIKeyboardInputManager_ja_Inline wordSearch](self, "wordSearch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Inline convertString](self, "convertString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Inline contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Inline geometryModelData](self, "geometryModelData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v16) = 1;
    LOWORD(v16) = 0;
    LOBYTE(v15) = 1;
    v17 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v3, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", v4, v5, 0, v6, 0x7FFFFFFFFFFFFFFFLL, 1, v15, 0, 0, 0, v7, v16, 0);

    -[TIWordSearchJapaneseOperationGetCandidates setReferenceMode:](v17, "setReferenceMode:", 1);
    -[TIWordSearchJapaneseOperationGetCandidates results](v17, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[TIKeyboardInputManager_ja_Inline wordSearch](self, "wordSearch");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "performOperationAsync:", v17);

      -[TIWordSearchJapaneseOperationGetCandidates waitUntilFinished](v17, "waitUntilFinished");
    }
    -[TIWordSearchJapaneseOperationGetCandidates results](v17, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v10);
    objc_msgSend(v10, "candidates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Inline setInlineCandidate:](self, "setInlineCandidate:", v12);

    -[TIKeyboardInputManager_ja_Inline inlineCandidate](self, "inlineCandidate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra segmentsFromCandidate:phraseBoundary:](self, "segmentsFromCandidate:phraseBoundary:", v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Inline setSegments:](self, "setSegments:", v14);

    -[TIKeyboardInputManager_ja_Inline setMarkedText](self, "setMarkedText");
  }
}

- (BOOL)shouldSkipCandidateGeneration
{
  BOOL v3;
  void *v4;

  if ((-[TIKeyboardInputManager_ja_Inline shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection") & 1) != 0)
    return 1;
  -[TIKeyboardInputManager_ja_Inline convertString](self, "convertString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "length") == 0;

  return v3;
}

- (void)removeInlineCandidate:(id)a3
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
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[TIKeyboardInputManager_ja_Inline inlineCandidate](self, "inlineCandidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "sortMethodGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UI-Sort-Common"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "candidates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDD1758];
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __58__TIKeyboardInputManager_ja_Inline_removeInlineCandidate___block_invoke;
      v13[3] = &unk_2501228F0;
      v14 = v5;
      objc_msgSend(v10, "predicateWithBlock:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "filteredOrderedSetUsingPredicate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCandidates:", v12);

    }
  }

}

- (BOOL)isEditMode
{
  void *v2;
  char isKindOfClass;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)invokeEditMode
{
  TIKeyboardInputManager_ja_Edit *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TIKeyboardInputManager_ja_Edit *v8;

  v3 = [TIKeyboardInputManager_ja_Edit alloc];
  -[TIKeyboardInputManager_ja_Inline config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_Inline keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_Inline segments](self, "segments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_Inline wordSearch](self, "wordSearch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TIKeyboardInputManager_ja_Edit initWithConfig:keyboardState:segments:wordSearch:romajiMode:conversionEnabled:](v3, "initWithConfig:keyboardState:segments:wordSearch:romajiMode:conversionEnabled:", v4, v5, v6, v7, -[TIKeyboardInputManager_ja_Inline romajiMode](self, "romajiMode"), 1);

  -[TIKeyboardInputManager_ja_Edit setShouldCancelIfPhraseBoundaryChanged:](v8, "setShouldCancelIfPhraseBoundaryChanged:", 1);
  -[TIKeyboardInputManagerMecabra composeTextWith:](self, "composeTextWith:", v8);

}

- (void)syncWithEditMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[TIKeyboardInputManager_ja_Inline clearInput](self, "clearInput");
  objc_msgSend(v4, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_readingStringWithin:", 0, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawInputString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  -[TIKeyboardInputManager_ja_Inline setInput:](&v10, sel_setInput_, v8);
  -[TIKeyboardInputManager_ja_Inline setSegments:](self, "setSegments:", v5);
  objc_msgSend(v4, "inlineCandidate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager_ja_Inline setInlineCandidate:](self, "setInlineCandidate:", v9);
}

- (id)convertString
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager_ja_Inline markedTextBuffer](self, "markedTextBuffer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "internalString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TIMarkedTextBuffer)markedTextBuffer
{
  return self->_markedTextBuffer;
}

- (void)setMarkedTextBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_markedTextBuffer, a3);
}

- (TIKeyboardCandidate)inlineCandidate
{
  return self->_inlineCandidate;
}

- (void)setInlineCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_inlineCandidate, a3);
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_storeStrong((id *)&self->_segments, a3);
}

- (BOOL)romajiMode
{
  return self->_romajiMode;
}

- (void)setRomajiMode:(BOOL)a3
{
  self->_romajiMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_inlineCandidate, 0);
  objc_storeStrong((id *)&self->_markedTextBuffer, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

@end
