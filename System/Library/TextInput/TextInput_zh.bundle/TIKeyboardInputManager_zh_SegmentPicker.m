@implementation TIKeyboardInputManager_zh_SegmentPicker

- (NSArray)segments
{
  return (NSArray *)self->_segments;
}

- (TIKeyboardInputManager_zh_SegmentPicker)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 at:(unint64_t)a6 wordSearch:(id)a7
{
  id v12;
  id v13;
  TIKeyboardInputManager_zh_SegmentPicker *v14;
  uint64_t v15;
  NSMutableArray *segments;
  uint64_t v17;
  NSMutableArray *originalSegments;
  objc_super v20;

  v12 = a5;
  v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardInputManager_zh_SegmentPicker;
  v14 = -[TIKeyboardInputManagerMecabra initWithConfig:keyboardState:](&v20, sel_initWithConfig_keyboardState_, a3, a4);
  if (v14)
  {
    v15 = objc_msgSend(v12, "mutableCopy");
    segments = v14->_segments;
    v14->_segments = (NSMutableArray *)v15;

    v14->_index = a6;
    objc_storeStrong((id *)&v14->_kbws, a7);
    v17 = objc_msgSend(v12, "mutableCopy");
    originalSegments = v14->_originalSegments;
    v14->_originalSegments = (NSMutableArray *)v17;

    v14->_shouldShowCandidateWindow = 1;
    -[TIKeyboardInputManager_zh_SegmentPicker updateMarkedText](v14, "updateMarkedText");
  }

  return v14;
}

- (BOOL)supportsSetPhraseBoundary
{
  return 1;
}

- (BOOL)supportsNumberKeySelection
{
  return 1;
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4E00]);
}

- (id)keyEventMap
{
  return (id)objc_msgSend(MEMORY[0x24BEB4DA0], "sharedInstance");
}

- (BOOL)usesLiveConversion
{
  return 1;
}

- (BOOL)delayedCandidateList
{
  return 1;
}

- (id)wordCharacters
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D00], "zhuyinWordCharacters");
}

- (BOOL)commitsAcceptedCandidate
{
  return 0;
}

- (id)handleKeyboardInput:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isSpace");

  if (v5)
    -[TIKeyboardInputManager_zh_SegmentPicker setShouldShowCandidateWindow:](self, "setShouldShowCandidateWindow:", 1);
  else
    -[TIKeyboardInputManagerMecabra cancelComposition](self, "cancelComposition");
  return 0;
}

- (NSString)inputString
{
  NSString *v3;
  void *v4;
  uint64_t v5;

  v3 = self->_inputString;
  -[TIKeyboardInputManager_zh_SegmentPicker alternateDisplayString](self, "alternateDisplayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TIKeyboardInputManager_zh_SegmentPicker alternateDisplayString](self, "alternateDisplayString");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (NSString *)v5;
  }
  return v3;
}

- (void)updateMarkedText
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;

  v17 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  -[TIKeyboardInputManager_zh_SegmentPicker segments](self, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      -[TIKeyboardInputManager_zh_SegmentPicker segments](self, "segments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "reading");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "appendString:", v11);

      objc_msgSend(v10, "surface");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v12);

      if (-[TIKeyboardInputManager_zh_SegmentPicker index](self, "index") >= v7)
      {
        objc_msgSend(v10, "surface");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v8 + objc_msgSend(v13, "length");

      }
      if (-[TIKeyboardInputManager_zh_SegmentPicker index](self, "index") > v7)
      {
        objc_msgSend(v10, "surface");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v14);

      }
      ++v7;
      -[TIKeyboardInputManager_zh_SegmentPicker segments](self, "segments");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

    }
    while (v16 > v7);
  }
  else
  {
    v8 = 0;
  }
  -[TIKeyboardInputManager_zh_SegmentPicker setRawInputString:](self, "setRawInputString:", v17);
  -[TIKeyboardInputManager_zh_SegmentPicker setInputString:](self, "setInputString:", v3);
  -[TIKeyboardInputManager_zh_SegmentPicker setInputIndex:](self, "setInputIndex:", v8);
  -[TIKeyboardInputManager_zh_SegmentPicker setAutoCommitString:](self, "setAutoCommitString:", v4);

}

- (void)setPhraseBoundary:(unint64_t)a3
{
  void *v5;
  _QWORD v6[7];
  _QWORD v7[4];

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  -[TIKeyboardInputManager_zh_SegmentPicker segments](self, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__TIKeyboardInputManager_zh_SegmentPicker_setPhraseBoundary___block_invoke;
  v6[3] = &unk_25012EEA8;
  v6[5] = v7;
  v6[6] = a3;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

  -[TIKeyboardInputManager_zh_SegmentPicker updateMarkedText](self, "updateMarkedText");
  _Block_object_dispose(v7, 8);
}

- (unint64_t)phraseBoundary
{
  return -[TIKeyboardInputManager_zh_SegmentPicker inputIndex](self, "inputIndex");
}

- (id)markedText
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v21;
  TIKeyboardInputManager_zh_SegmentPicker *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[TIKeyboardInputManager_zh_SegmentPicker rawInputString](self, "rawInputString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_zh_SegmentPicker inputString](self, "inputString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[TIKeyboardInputManager_zh_SegmentPicker inputIndex](self, "inputIndex");
  -[TIKeyboardInputManager_zh_SegmentPicker searchStringForMarkedText](self, "searchStringForMarkedText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v22 = self;
  -[TIKeyboardInputManager_zh_SegmentPicker segments](self, "segments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "surface");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v7, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

        objc_msgSend(v10, "surface");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v7 += objc_msgSend(v14, "length");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }

  v15 = (void *)MEMORY[0x24BEB4E38];
  -[TIKeyboardInputManager_zh_SegmentPicker autoCommitString](v22, "autoCommitString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");
  v18 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v15, "intermediateTextWithInputString:displayString:selectionLocation:searchString:candidateOffset:liveConversionSegments:highlightSegmentIndex:lastInputString:", v25, v24, v21, v23, v17, v18, -[TIKeyboardInputManager_zh_SegmentPicker index](v22, "index"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)convertString
{
  void *v3;
  void *v4;
  void *v5;

  -[TIKeyboardInputManager_zh_SegmentPicker segments](self, "segments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_zh_SegmentPicker index](self, "index"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reading");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)candidateResultSet
{
  unint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v3 = -[TIKeyboardInputManager_zh_SegmentPicker index](self, "index");
  -[TIKeyboardInputManager_zh_SegmentPicker segments](self, "segments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= objc_msgSend(v4, "count"))
    goto LABEL_6;
  v5 = -[TIKeyboardInputManager_zh_SegmentPicker shouldShowCandidateWindow](self, "shouldShowCandidateWindow");

  if (!v5)
  {
    v12 = 0;
    return v12;
  }
  -[TIKeyboardInputManager_zh_SegmentPicker convertString](self, "convertString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_zh_SegmentPicker segments](self, "segments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_zh_SegmentPicker index](self, "index"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "surface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v9, "length") < 2)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAutoSelectCandidates:", v10);
    }
    else
    {
      objc_msgSend(v9, "_lastGrapheme");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v9, v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAutoSelectCandidates:", v11);

    }
    -[TIKeyboardInputManager_zh_SegmentPicker rawInputString](self, "rawInputString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSyntheticCandidate:", v14);

    -[TIKeyboardInputManager_zh_SegmentPicker autoCommitString](self, "autoCommitString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v6, "makeCandidatesWithInputString:autoCommitString:predictionEnabled:reanalysisMode:geometoryModelData:", v4, v15, 0, 1, v16);

    objc_msgSend(MEMORY[0x24BEB4E18], "dummySet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager_zh_SegmentPicker rawInputString](self, "rawInputString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerMecabra updateProactiveCandidatesForCandidateResultSet:withInput:](self, "updateProactiveCandidatesForCandidateResultSet:withInput:", v18, v19);

      -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerMecabra candidateResultSetFromWordSearchCandidateResultSet:](self, "candidateResultSetFromWordSearchCandidateResultSet:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v21;
    }

  }
  else
  {
LABEL_6:
    v12 = 0;
  }

  return v12;
}

- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3
{
  id v4;
  void *v5;
  TIKeyboardInputManager_zh_Candidates *v6;
  void *v7;
  void *v8;
  TIKeyboardInputManager_zh_Candidates *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  TIKeyboardInputManager_zh_SegmentPicker *v22;
  id v23;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [TIKeyboardInputManager_zh_Candidates alloc];
    -[TIKeyboardInputManager_zh_SegmentPicker config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_zh_SegmentPicker keyboardState](self, "keyboardState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TIKeyboardInputManager_zh_Candidates initWithConfig:keyboardState:wordSearch:](v6, "initWithConfig:keyboardState:wordSearch:", v7, v8, self->_kbws);
    -[TIKeyboardInputManagerMecabra composeTextWith:](self, "composeTextWith:", v9);

    v10 = -[TIKeyboardInputManager_zh_SegmentPicker candidateRange](self, "candidateRange");
    v12 = v11;
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCandidateRange:", v10, v12);

  }
  objc_msgSend(v4, "open");
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x24BEB5340]);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __94__TIKeyboardInputManager_zh_SegmentPicker_openCandidateGenerationContextWithCandidateHandler___block_invoke;
  v21 = &unk_25012EED0;
  v22 = self;
  v23 = v4;
  v16 = v4;
  v17 = (void *)objc_msgSend(v15, "initWithWrappedCandidateHandler:resultSetHandlerBlock:", v16, &v18);
  objc_msgSend(v14, "openCandidateGenerationContextWithCandidateHandler:", v17, v18, v19, v20, v21, v22);

}

- (BOOL)closeCandidateGenerationContextWithResults:(id)a3
{
  void *v3;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelComposition");

  return 1;
}

- (id)didAcceptCandidate:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  __CFString *v11;

  v4 = a3;
  -[TIKeyboardInputManager_zh_SegmentPicker rawInputString](self, "rawInputString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  objc_msgSend(v4, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 <= objc_msgSend(v7, "length"))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  if (!-[TIKeyboardInputManager_zh_SegmentPicker shouldShowCandidateWindow](self, "shouldShowCandidateWindow")
    || (isKindOfClass & 1) != 0)
  {
    -[TIKeyboardInputManager_zh_SegmentPicker inputString](self, "inputString");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeAllObjects](self->_segments, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_originalSegments, "removeAllObjects");
    self->_index = 0;
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  }
  else
  {
    -[TIKeyboardInputManager_zh_SegmentPicker selectCandidate:](self, "selectCandidate:", v4);
    -[TIKeyboardInputManager_zh_SegmentPicker inputString](self, "inputString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_zh_SegmentPicker keyboardState](self, "keyboardState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInputForMarkedText:", v9);

    -[TIKeyboardInputManager_zh_SegmentPicker setShouldShowCandidateWindow:](self, "setShouldShowCandidateWindow:", 0);
    v11 = &stru_25012F088;
  }

  return v11;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  objc_super v10;

  v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_zh_SegmentPicker;
  v8 = a3;
  -[TIKeyboardInputManagerMecabra syncToKeyboardState:from:afterContextChange:](&v10, sel_syncToKeyboardState_from_afterContextChange_, v8, a4, v5);
  objc_msgSend(v8, "currentCandidate", v10.receiver, v10.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[TIKeyboardInputManager_zh_SegmentPicker selectCandidate:](self, "selectCandidate:", v9);

}

- (void)selectCandidate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BEB5410]);
  -[TIKeyboardInputManager_zh_SegmentPicker setAlternateDisplayString:](self, "setAlternateDisplayString:", 0);
  objc_msgSend(v19, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_containsBopomofoOnly");

  if (v6)
  {
    objc_msgSend(v19, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_zh_SegmentPicker setAlternateDisplayString:](self, "setAlternateDisplayString:", v7);

  }
  objc_msgSend(v19, "input");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  -[TIKeyboardInputManager_zh_SegmentPicker convertString](self, "convertString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v9 >= v11)
  {
    objc_msgSend(v19, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSurface:", v14);
  }
  else
  {
    -[TIKeyboardInputManager_zh_SegmentPicker originalSegments](self, "originalSegments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_zh_SegmentPicker index](self, "index"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "surface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "_stringByTrimmingLastCharacter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSurface:", v17);

  }
  -[TIKeyboardInputManager_zh_SegmentPicker convertString](self, "convertString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReading:", v18);

  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_segments, "replaceObjectAtIndex:withObject:", -[TIKeyboardInputManager_zh_SegmentPicker index](self, "index"), v4);
  -[TIKeyboardInputManager_zh_SegmentPicker updateMarkedText](self, "updateMarkedText");

}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD *)&a4;
  if (TICanLogMessageAtLevel())
  {
    TIOSLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[TIKeyboardInputManager_zh_SegmentPicker _adjustPhraseBoundaryInForwardDirection:granularity:].cold.1(a3, v4, v7);

  }
  if ((_DWORD)v4 == 4)
    goto LABEL_15;
  if (!(_DWORD)v4
    && -[TIKeyboardInputManager_zh_SegmentPicker shouldShowCandidateWindow](self, "shouldShowCandidateWindow"))
  {
    v8 = -[TIKeyboardInputManager_zh_SegmentPicker index](self, "index");
    v9 = v8;
    if (a3)
    {
      -[TIKeyboardInputManager_zh_SegmentPicker segments](self, "segments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count") - 1;

      v12 = 1;
      if (v9 == v11)
        return v12;
    }
    else
    {
      if (!v8)
      {
LABEL_15:
        LOBYTE(v12) = 1;
        return v12;
      }
      v12 = -1;
    }
    self->_index = -[TIKeyboardInputManager_zh_SegmentPicker index](self, "index") + v12;
    -[TIKeyboardInputManager_zh_SegmentPicker updateMarkedText](self, "updateMarkedText");
    goto LABEL_15;
  }
  -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  LOBYTE(v12) = 0;
  return v12;
}

- (unint64_t)index
{
  return self->_index;
}

- (TIWordSearch)kbws
{
  return self->_kbws;
}

- (void)setKbws:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 808);
}

- (NSString)rawInputString
{
  return self->_rawInputString;
}

- (void)setRawInputString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 816);
}

- (void)setInputString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 824);
}

- (NSString)autoCommitString
{
  return self->_autoCommitString;
}

- (void)setAutoCommitString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 832);
}

- (unsigned)inputIndex
{
  return self->_inputIndex;
}

- (void)setInputIndex:(unsigned int)a3
{
  self->_inputIndex = a3;
}

- (NSMutableArray)originalSegments
{
  return self->_originalSegments;
}

- (void)setOriginalSegments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 840);
}

- (NSString)alternateDisplayString
{
  return self->_alternateDisplayString;
}

- (void)setAlternateDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_alternateDisplayString, a3);
}

- (BOOL)shouldShowCandidateWindow
{
  return self->_shouldShowCandidateWindow;
}

- (void)setShouldShowCandidateWindow:(BOOL)a3
{
  self->_shouldShowCandidateWindow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDisplayString, 0);
  objc_storeStrong((id *)&self->_originalSegments, 0);
  objc_storeStrong((id *)&self->_autoCommitString, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
  objc_storeStrong((id *)&self->_rawInputString, 0);
  objc_storeStrong((id *)&self->_kbws, 0);
  objc_storeStrong((id *)&self->_segments, 0);
}

- (void)_adjustPhraseBoundaryInForwardDirection:(NSObject *)a3 granularity:.cold.1(char a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s adjust phrase: %d %d"), "-[TIKeyboardInputManager_zh_SegmentPicker _adjustPhraseBoundaryInForwardDirection:granularity:]", a1 & 1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_23235B000, a3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

}

@end
