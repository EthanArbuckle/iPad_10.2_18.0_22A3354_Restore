@implementation TIKeyboardInputManager_ja_SegmentPicker

- (TIKeyboardInputManager_ja_SegmentPicker)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 at:(unint64_t)a6 wordSearch:(id)a7
{
  id v12;
  id v13;
  TIKeyboardInputManager_ja_SegmentPicker *v14;
  TIKeyboardInputManager_ja_SegmentPicker *v15;
  TILiveConversionSegments *v16;
  objc_super v18;

  v12 = a5;
  v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)TIKeyboardInputManager_ja_SegmentPicker;
  v14 = -[TIKeyboardInputManagerMecabra initWithConfig:keyboardState:](&v18, sel_initWithConfig_keyboardState_, a3, a4);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_wordSearch, a7);
    v16 = -[TILiveConversionSegments initWithSegments:at:]([TILiveConversionSegments alloc], "initWithSegments:at:", v12, a6);
    -[TIKeyboardInputManager_ja_SegmentPicker setLiveConversionSegments:](v15, "setLiveConversionSegments:", v16);

    -[TIKeyboardInputManager_ja_SegmentPicker setSupportsSetPhraseBoundary:](v15, "setSupportsSetPhraseBoundary:", 1);
    -[TIKeyboardInputManager_ja_SegmentPicker setShouldShowCandidateWindow:](v15, "setShouldShowCandidateWindow:", 1);
  }

  return v15;
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (id)wordCharacters
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D00], "romajiWordCharacters");
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4DC8]);
}

- (id)keyEventMap
{
  return objc_alloc_init(MEMORY[0x24BEB4D60]);
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
  return 0;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "transliterationType"))
  {
    v5 = objc_msgSend(v4, "transliterationType");

    -[TIKeyboardInputManager_ja_SegmentPicker setTransliterationType:](self, "setTransliterationType:", v5);
  }
  else
  {
    objc_msgSend(v4, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "_isSpace");
    if (!v7)
    {
      -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "commit");

      -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
      v8 = 0;
      return v8;
    }
    -[TIKeyboardInputManager_ja_SegmentPicker setShouldShowCandidateWindow:](self, "setShouldShowCandidateWindow:", 1);
  }
  v8 = objc_alloc_init(MEMORY[0x24BEB4E58]);
  return v8;
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
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;

  -[TIKeyboardInputManager_ja_SegmentPicker rawInputString](self, "rawInputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_SegmentPicker inputString](self, "inputString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TIKeyboardInputManager_ja_SegmentPicker inputIndex](self, "inputIndex");
  -[TIKeyboardInputManager_ja_SegmentPicker searchStringForMarkedText](self, "searchStringForMarkedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "segmentRanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "autoCommitString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  v12 = (void *)MEMORY[0x24BEB4E38];
  v13 = (void *)objc_msgSend(v8, "copy");
  v14 = -[TIKeyboardInputManager_ja_SegmentPicker index](self, "index");
  -[TIKeyboardInputManager_ja_SegmentPicker lastInputString](self, "lastInputString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "intermediateTextWithInputString:displayString:selectionLocation:searchString:candidateOffset:liveConversionSegments:highlightSegmentIndex:lastInputString:", v3, v4, v5, v6, v11, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)rawInputString
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawInputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)inputString
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)inputIndex
{
  void *v2;
  unsigned int v3;

  -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inputIndex");

  return v3;
}

- (unsigned)inputCount
{
  void *v2;
  unsigned int v3;

  -[TIKeyboardInputManager_ja_SegmentPicker rawInputString](self, "rawInputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (void)setPhraseBoundary:(unint64_t)a3
{
  id v4;

  -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhraseBoundary:", a3);

}

- (unint64_t)phraseBoundary
{
  return -[TIKeyboardInputManager_ja_SegmentPicker inputIndex](self, "inputIndex");
}

- (unint64_t)index
{
  void *v2;
  unint64_t v3;

  -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "index");

  return v3;
}

- (NSArray)segments
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawSegments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
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
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v3 = -[TIKeyboardInputManager_ja_SegmentPicker index](self, "index");
  -[TIKeyboardInputManager_ja_SegmentPicker segments](self, "segments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= objc_msgSend(v4, "count"))
    goto LABEL_7;
  v5 = -[TIKeyboardInputManager_ja_SegmentPicker shouldShowCandidateWindow](self, "shouldShowCandidateWindow");

  if (!v5)
  {
    v17 = 0;
    return v17;
  }
  -[TIKeyboardInputManager_ja_SegmentPicker segments](self, "segments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_ja_SegmentPicker index](self, "index"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reading");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutoSelectTransliterateCandidate:", -[TIKeyboardInputManager_ja_SegmentPicker transliterationType](self, "transliterationType"));
    -[TIKeyboardInputManager_ja_SegmentPicker segments](self, "segments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_ja_SegmentPicker index](self, "index"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "surface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutoSelectCandidate:", v11);

    -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "autoCommitString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_SegmentPicker contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "makeCandidatesWithInputString:autoCommitString:contextString:predictionEnabled:reanalysisMode:singlePhrase:geometoryModelData:", v4, v13, v14, 0, 1, 1, v15);

    objc_msgSend(MEMORY[0x24BEB4E18], "dummySet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager_ja_SegmentPicker rawInputString](self, "rawInputString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerMecabra updateProactiveCandidatesForCandidateResultSet:withInput:](self, "updateProactiveCandidatesForCandidateResultSet:withInput:", v18, v19);

      -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerMecabra candidateResultSetFromWordSearchCandidateResultSet:](self, "candidateResultSetFromWordSearchCandidateResultSet:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v21;
    }

  }
  else
  {
LABEL_7:
    v17 = 0;
  }

  return v17;
}

- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3
{
  id v4;
  void *v5;
  TIKeyboardInputManager_ja_Candidates *v6;
  void *v7;
  void *v8;
  void *v9;
  TIKeyboardInputManager_ja_Candidates *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  TIKeyboardInputManager_ja_SegmentPicker *v23;
  id v24;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [TIKeyboardInputManager_ja_Candidates alloc];
    -[TIKeyboardInputManager_ja_SegmentPicker config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_SegmentPicker keyboardState](self, "keyboardState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_SegmentPicker wordSearch](self, "wordSearch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TIKeyboardInputManager_ja_Candidates initWithConfig:keyboardState:wordSearch:](v6, "initWithConfig:keyboardState:wordSearch:", v7, v8, v9);
    -[TIKeyboardInputManagerMecabra composeTextWith:](self, "composeTextWith:", v10);

    v11 = -[TIKeyboardInputManager_ja_SegmentPicker candidateRange](self, "candidateRange");
    v13 = v12;
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCandidateRange:", v11, v13);

  }
  objc_msgSend(v4, "open");
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x24BEB5340]);
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __94__TIKeyboardInputManager_ja_SegmentPicker_openCandidateGenerationContextWithCandidateHandler___block_invoke;
  v22 = &unk_2501229C0;
  v23 = self;
  v24 = v4;
  v17 = v4;
  v18 = (void *)objc_msgSend(v16, "initWithWrappedCandidateHandler:resultSetHandlerBlock:", v17, &v19);
  objc_msgSend(v15, "openCandidateGenerationContextWithCandidateHandler:", v18, v19, v20, v21, v22, v23);

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
  char v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  __CFString *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "isTransliterationCandidate") ^ 1;
  else
    v5 = 0;
  v6 = -[TIKeyboardInputManager_ja_SegmentPicker shouldShowCandidateWindow](self, "shouldShowCandidateWindow");
  -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6 || (v5 & 1) != 0)
  {
    objc_msgSend(v7, "clear");

    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
    objc_msgSend(v4, "candidate");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "currentCandidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v4);

    if ((v10 & 1) == 0)
      -[TIKeyboardInputManager_ja_SegmentPicker selectCandidate:](self, "selectCandidate:", v4);
    -[TIKeyboardInputManager_ja_SegmentPicker rawInputString](self, "rawInputString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_SegmentPicker keyboardState](self, "keyboardState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInputForMarkedText:", v11);

    -[TIKeyboardInputManager_ja_SegmentPicker setShouldShowCandidateWindow:](self, "setShouldShowCandidateWindow:", 0);
    v13 = &stru_250122EC0;
  }

  return v13;
}

- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id syncKeyboardStateHandler;
  BOOL v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "currentCandidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TIKeyboardInputManager_ja_SegmentPicker index](self, "index");
  -[TIKeyboardInputManager_ja_SegmentPicker segments](self, "segments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 >= v11)
    goto LABEL_6;
  -[TIKeyboardInputManager_ja_SegmentPicker segments](self, "segments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_ja_SegmentPicker index](self, "index"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {

LABEL_6:
    -[TIKeyboardInputManager_ja_SegmentPicker setTransliterationType:](self, "setTransliterationType:", 0);
    goto LABEL_7;
  }
  objc_msgSend(v13, "reading");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");
  objc_msgSend(v8, "input");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  -[TIKeyboardInputManager_ja_SegmentPicker setTransliterationType:](self, "setTransliterationType:", 0);
  if (v15 <= v17)
  {
LABEL_7:
    v20 = 0;
    goto LABEL_8;
  }
  v18 = (void *)MEMORY[0x2349027B0](v7);
  syncKeyboardStateHandler = self->_syncKeyboardStateHandler;
  self->_syncKeyboardStateHandler = v18;

  -[TIKeyboardInputManager_ja_SegmentPicker setSupportsSetPhraseBoundary:](self, "setSupportsSetPhraseBoundary:", 0);
  v22.receiver = self;
  v22.super_class = (Class)TIKeyboardInputManager_ja_SegmentPicker;
  -[TIKeyboardInputManagerBase syncToKeyboardState:](&v22, sel_syncToKeyboardState_, v6);
  v20 = 1;
  -[TIKeyboardInputManager_ja_SegmentPicker setSupportsSetPhraseBoundary:](self, "setSupportsSetPhraseBoundary:", 1);
LABEL_8:

  return v20;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  objc_super v29;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "currentCandidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "candidate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  objc_msgSend(v10, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  v15 = -[TIKeyboardInputManager_ja_SegmentPicker index](self, "index");
  if (v10)
  {
    v16 = v12 - v14;
    if ((v16 & 0x8000000000000000) != 0)
    {
LABEL_9:
      -[TIKeyboardInputManager_ja_SegmentPicker finishSyncToKeyboardState](self, "finishSyncToKeyboardState");
      goto LABEL_10;
    }
    v17 = v15;
    objc_msgSend(v10, "candidate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 > objc_msgSend(v18, "length"))
    {
LABEL_4:

      goto LABEL_9;
    }
    -[TIKeyboardInputManager_ja_SegmentPicker segments](self, "segments");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v17 >= v20)
      goto LABEL_9;
    -[TIKeyboardInputManager_ja_SegmentPicker segments](self, "segments");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_surfaceStringWithin:", 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager_ja_SegmentPicker segments](self, "segments");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "reading");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "candidate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "substringToIndex:", v16);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "input");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "hasPrefix:", v27))
    {

      goto LABEL_4;
    }
    v28 = objc_msgSend(v18, "isEqualToString:", v26);

    if (!v28)
      goto LABEL_9;
    -[TIKeyboardInputManager_ja_SegmentPicker selectCandidate:](self, "selectCandidate:", v10);
  }
LABEL_10:
  -[TIKeyboardInputManager_ja_SegmentPicker setSupportsSetPhraseBoundary:](self, "setSupportsSetPhraseBoundary:", 0);
  v29.receiver = self;
  v29.super_class = (Class)TIKeyboardInputManager_ja_SegmentPicker;
  -[TIKeyboardInputManagerMecabra syncToKeyboardState:from:afterContextChange:](&v29, sel_syncToKeyboardState_from_afterContextChange_, v9, v8, v5);

  -[TIKeyboardInputManager_ja_SegmentPicker setSupportsSetPhraseBoundary:](self, "setSupportsSetPhraseBoundary:", 1);
}

- (void)selectCandidate:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  TIWordSearchJapaneseOperationGetCandidates *v16;
  void *v17;
  void *v18;
  void *v19;
  TIWordSearchJapaneseOperationGetCandidates *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v26 = a3;
  v4 = -[TIKeyboardInputManager_ja_SegmentPicker index](self, "index");
  -[TIKeyboardInputManager_ja_SegmentPicker segments](self, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 < v6)
  {
    -[TIKeyboardInputManager_ja_SegmentPicker segments](self, "segments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_ja_SegmentPicker index](self, "index"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "reading");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    objc_msgSend(v26, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v10 <= v12)
    {
      -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "didUpdateCandidate:with:", v26, 0);
    }
    else
    {
      -[TIKeyboardInputManager_ja_SegmentPicker setCurrentCandidate:](self, "setCurrentCandidate:", v26);
      objc_msgSend(v8, "reading");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "input");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "substringFromIndex:", objc_msgSend(v14, "length"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = [TIWordSearchJapaneseOperationGetCandidates alloc];
      -[TIKeyboardInputManager_ja_SegmentPicker wordSearch](self, "wordSearch");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager_ja_SegmentPicker contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerMecabra geometryModelData](self, "geometryModelData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE2(v25) = 1;
      LOWORD(v25) = 0;
      LOBYTE(v24) = 1;
      v20 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v16, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", v17, v15, 0, v18, 0x7FFFFFFFFFFFFFFFLL, 0, v24, 0, 0, 0, v19, v25, 0);

      -[TIWordSearchJapaneseOperationGetCandidates setSinglePhrase:](v20, "setSinglePhrase:", 1);
      -[TIWordSearchJapaneseOperationGetCandidates results](v20, "results");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        -[TIKeyboardInputManager_ja_SegmentPicker wordSearch](self, "wordSearch");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "performOperationAsync:", v20);

        -[TIWordSearchJapaneseOperationGetCandidates waitUntilFinished](v20, "waitUntilFinished");
      }
      -[TIWordSearchJapaneseOperationGetCandidates results](v20, "results");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager_ja_SegmentPicker _selectPartialCandidate:forOperation:](self, "_selectPartialCandidate:forOperation:", v23, v20);

    }
  }

}

- (void)_selectPartialCandidate:(id)a3 forOperation:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v6 = objc_alloc_init(MEMORY[0x24BEB5410]);
    objc_msgSend(v11, "input");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReading:", v7);

    objc_msgSend(v11, "candidate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSurface:", v8);

    -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_SegmentPicker currentCandidate](self, "currentCandidate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didUpdateCandidate:with:", v10, v6);

    -[TIKeyboardInputManager_ja_SegmentPicker setCurrentCandidate:](self, "setCurrentCandidate:", 0);
    -[TIKeyboardInputManager_ja_SegmentPicker finishSyncToKeyboardState](self, "finishSyncToKeyboardState");

  }
}

- (void)finishSyncToKeyboardState
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  id syncKeyboardStateHandler;

  if (self->_syncKeyboardStateHandler)
  {
    -[TIKeyboardInputManager_ja_SegmentPicker syncKeyboardStateHandler](self, "syncKeyboardStateHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra keyboardConfiguration](self, "keyboardConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v3)[2](v3, v4);

    syncKeyboardStateHandler = self->_syncKeyboardStateHandler;
    self->_syncKeyboardStateHandler = 0;

  }
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  _BOOL8 v5;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v5 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "-[TIKeyboardInputManager_ja_SegmentPicker _adjustPhraseBoundaryInForwardDirection:granularity:]";
    v14 = 1024;
    v15 = v5;
    v16 = 1024;
    v17 = a4;
    _os_log_impl(&dword_232303000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s  adjust phrase: %d %d", (uint8_t *)&v12, 0x18u);
  }
  if (a4)
  {
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  }
  else
  {
    -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "canMove:", v5);

    if (v8)
    {
      -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "commit");

      -[TIKeyboardInputManager_ja_SegmentPicker liveConversionSegments](self, "liveConversionSegments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "move:", v5);

    }
  }
  return a4 == 0;
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (id)syncKeyboardStateHandler
{
  return self->_syncKeyboardStateHandler;
}

- (void)setSyncKeyboardStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 800);
}

- (TILiveConversionSegments)liveConversionSegments
{
  return self->_liveConversionSegments;
}

- (void)setLiveConversionSegments:(id)a3
{
  objc_storeStrong((id *)&self->_liveConversionSegments, a3);
}

- (TIKeyboardCandidate)currentCandidate
{
  return self->_currentCandidate;
}

- (void)setCurrentCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 816);
}

- (BOOL)supportsSetPhraseBoundary
{
  return self->_supportsSetPhraseBoundary;
}

- (void)setSupportsSetPhraseBoundary:(BOOL)a3
{
  self->_supportsSetPhraseBoundary = a3;
}

- (BOOL)shouldShowCandidateWindow
{
  return self->_shouldShowCandidateWindow;
}

- (void)setShouldShowCandidateWindow:(BOOL)a3
{
  self->_shouldShowCandidateWindow = a3;
}

- (int64_t)transliterationType
{
  return self->_transliterationType;
}

- (void)setTransliterationType:(int64_t)a3
{
  self->_transliterationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCandidate, 0);
  objc_storeStrong((id *)&self->_liveConversionSegments, 0);
  objc_storeStrong(&self->_syncKeyboardStateHandler, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

@end
