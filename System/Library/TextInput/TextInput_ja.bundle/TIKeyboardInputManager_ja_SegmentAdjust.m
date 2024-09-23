@implementation TIKeyboardInputManager_ja_SegmentAdjust

- (TIKeyboardInputManager_ja_SegmentAdjust)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 at:(unint64_t)a6 romajiEnabled:(BOOL)a7 wordSearch:(id)a8
{
  id v15;
  id v16;
  TIKeyboardInputManager_ja_SegmentAdjust *v17;
  TIKeyboardInputManager_ja_SegmentAdjust *v18;
  objc_super v20;

  v15 = a5;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardInputManager_ja_SegmentAdjust;
  v17 = -[TIKeyboardInputManagerMecabra initWithConfig:keyboardState:](&v20, sel_initWithConfig_keyboardState_, a3, a4);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_segments, a5);
    v18->_index = a6;
    objc_storeStrong((id *)&v18->_wordSearch, a8);
    v18->_romajiEnabled = a7;
    -[TIKeyboardInputManager_ja_SegmentAdjust updateInputString](v18, "updateInputString");
  }

  return v18;
}

- (BOOL)supportsSetPhraseBoundary
{
  return 1;
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4DC0]);
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syncToKeyboardState:from:afterContextChange:", v9, v8, v5);

}

- (id)markedText
{
  return 0;
}

- (BOOL)commitsAcceptedCandidate
{
  return 0;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleKeyboardInput:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "transliterationType"))
  {
    objc_msgSend(v4, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_isSpace");

    if ((v8 & 1) == 0)
      -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  }

  return v6;
}

- (void)updateInputString
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *inputString;
  void *v7;
  unint64_t v8;
  void *v9;
  NSString *v10;
  NSString *composingInputString;
  void *v12;
  NSString *v13;
  NSString *contextString;
  void *v15;
  NSArray *v16;
  NSArray *contextSegments;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  -[TIKeyboardInputManager_ja_SegmentAdjust segments](self, "segments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_SegmentAdjust segments](self, "segments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_surfaceStringWithin:", 0, objc_msgSend(v4, "count"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  inputString = self->_inputString;
  self->_inputString = v5;

  -[TIKeyboardInputManager_ja_SegmentAdjust segments](self, "segments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TIKeyboardInputManager_ja_SegmentAdjust index](self, "index");
  -[TIKeyboardInputManager_ja_SegmentAdjust segments](self, "segments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_readingStringWithin:", v8, objc_msgSend(v9, "count") - -[TIKeyboardInputManager_ja_SegmentAdjust index](self, "index"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  composingInputString = self->_composingInputString;
  self->_composingInputString = v10;

  -[TIKeyboardInputManager_ja_SegmentAdjust segments](self, "segments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_surfaceStringWithin:", 0, -[TIKeyboardInputManager_ja_SegmentAdjust index](self, "index"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  contextString = self->_contextString;
  self->_contextString = v13;

  -[TIKeyboardInputManager_ja_SegmentAdjust segments](self, "segments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subarrayWithRange:", 0, -[TIKeyboardInputManager_ja_SegmentAdjust index](self, "index"));
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  contextSegments = self->_contextSegments;
  self->_contextSegments = v16;

  -[TIKeyboardInputManager_ja_SegmentAdjust segments](self, "segments");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_ja_SegmentAdjust index](self, "index"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "reading");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (-[TIKeyboardInputManager_ja_SegmentAdjust romajiEnabled](self, "romajiEnabled"))
  {
    +[Romakana hiraganaString:mappingArray:](Romakana, "hiraganaString:mappingArray:", v21, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    self->_segmentLength = objc_msgSend(v20, "length");

  }
  else
  {
    self->_segmentLength = objc_msgSend(v21, "length");
  }

}

- (unsigned)inputIndex
{
  void *v3;
  void *v4;
  unsigned int v5;
  int v6;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "inputIndex");
  }
  else
  {
    -[TIKeyboardInputManager_ja_SegmentAdjust contextString](self, "contextString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "length");
    v5 = -[TIKeyboardInputManager_ja_SegmentAdjust segmentLength](self, "segmentLength") + v6;
  }

  return v5;
}

- (void)generateNewSegments:(unint64_t)a3
{
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  TIWordSearchJapaneseOperationGetCandidates *v9;
  TIWordSearch *wordSearch;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  TIWordSearchJapaneseOperationGetCandidates *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  __CFString *v26;

  v25 = 0;
  v26 = 0;
  if (-[TIKeyboardInputManager_ja_SegmentAdjust romajiEnabled](self, "romajiEnabled"))
  {
    -[TIKeyboardInputManager_ja_SegmentAdjust composingInputString](self, "composingInputString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)+[Romakana splitRomaji:at:](Romakana, "splitRomaji:at:", v5, a3);
    v26 = v6;

  }
  else
  {
    -[TIKeyboardInputManager_ja_SegmentAdjust composingInputString](self, "composingInputString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringToIndex:", a3);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_SegmentAdjust composingInputString](self, "composingInputString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "substringFromIndex:", a3);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    __copy_assignment_8_8_s0_s8(&v25, &v23);

  }
  v9 = [TIWordSearchJapaneseOperationGetCandidates alloc];
  wordSearch = self->_wordSearch;
  if (v26)
    v11 = v26;
  else
    v11 = &stru_250122EC0;
  objc_msgSend(v25, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_SegmentAdjust contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_SegmentAdjust contextString](self, "contextString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v25, "length");
  if (v16)
    v17 = v16;
  else
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  -[TIKeyboardInputManagerMecabra geometryModelData](self, "geometryModelData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v22) = 1;
  LOWORD(v22) = 0;
  LOBYTE(v21) = 1;
  v19 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v9, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", wordSearch, v12, 0, v15, v17, 0, v21, 0, self, sel__notifyUpdateCandidates_forOperation_, v18, v22, 0);

  -[TIWordSearchJapaneseOperationGetCandidates setSinglePhrase:](v19, "setSinglePhrase:", 1);
  -[TIKeyboardInputManager_ja_SegmentAdjust wordSearch](self, "wordSearch");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "performOperationAsync:", v19);

}

- (id)candidateResultSet
{
  void *v3;
  void *v4;
  void *v5;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidateResultSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB4E18], "dummySet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *segments;
  TIKeyboardInputManager_ja_SegmentPicker *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  void *v22;
  TIKeyboardInputManager_ja_SegmentPicker *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v5);
  objc_msgSend(v5, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BEB5410]);
  objc_msgSend(v7, "input");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReading:", v9);

  objc_msgSend(v7, "candidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSurface:", v10);

  objc_msgSend(v5, "candidateAfterSegmentBreak");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerMecabra segmentsFromCandidate:phraseBoundary:](self, "segmentsFromCandidate:phraseBoundary:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager_ja_SegmentAdjust contextSegments](self, "contextSegments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v15);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  segments = self->_segments;
  self->_segments = v16;

  v18 = [TIKeyboardInputManager_ja_SegmentPicker alloc];
  -[TIKeyboardInputManager_ja_SegmentAdjust config](self, "config");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_SegmentAdjust keyboardState](self, "keyboardState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = self->_segments;
  -[TIKeyboardInputManager_ja_SegmentAdjust contextSegments](self, "contextSegments");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[TIKeyboardInputManager_ja_SegmentPicker initWithConfig:keyboardState:segments:at:wordSearch:](v18, "initWithConfig:keyboardState:segments:at:wordSearch:", v19, v20, v21, objc_msgSend(v22, "count"), self->_wordSearch);
  -[TIKeyboardInputManager_ja_SegmentAdjust composeTextWith:](self, "composeTextWith:", v23);

}

- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[TIKeyboardInputManager_ja_SegmentAdjust candidateRange](self, "candidateRange");
    v7 = v6;
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCandidateRange:", v5, v7);

    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "openCandidateGenerationContextWithCandidateHandler:", v10);

  }
  else
  {
    -[TIKeyboardInputManager_ja_SegmentAdjust setCandidateHandlerForOpenRequest:](self, "setCandidateHandlerForOpenRequest:", v10);
  }

}

- (void)composeTextWith:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_ja_SegmentAdjust;
  -[TIKeyboardInputManagerMecabra composeTextWith:](&v13, sel_composeTextWith_, a3);
  -[TIKeyboardInputManager_ja_SegmentAdjust candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[TIKeyboardInputManager_ja_SegmentAdjust candidateRange](self, "candidateRange");
    v7 = v6;
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCandidateRange:", v5, v7);

    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_SegmentAdjust candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "openCandidateGenerationContextWithCandidateHandler:", v10);

    -[TIKeyboardInputManager_ja_SegmentAdjust setCandidateHandlerForOpenRequest:](self, "setCandidateHandlerForOpenRequest:", 0);
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "candidateResultSet");

  }
}

- (BOOL)closeCandidateGenerationContextWithResults:(id)a3
{
  -[TIKeyboardInputManager_ja_SegmentAdjust setCandidateHandlerForOpenRequest:](self, "setCandidateHandlerForOpenRequest:", 0);
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

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[TIKeyboardInputManager_ja_SegmentAdjust _adjustPhraseBoundaryInForwardDirection:granularity:]";
    v14 = 1024;
    v15 = v5;
    v16 = 1024;
    v17 = v4;
    _os_log_impl(&dword_232303000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s  adjust phrase: %d %d", buf, 0x18u);
  }
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_ja_SegmentAdjust;
  if (!-[TIKeyboardInputManagerMecabra _adjustPhraseBoundaryInForwardDirection:granularity:](&v11, sel__adjustPhraseBoundaryInForwardDirection_granularity_, v5, v4))
  {
    v7 = -[TIKeyboardInputManager_ja_SegmentAdjust segmentLength](self, "segmentLength");
    v8 = v7 - 1;
    if (v5)
      v8 = v7 + 1;
    if (v8 <= 1)
      v9 = 1;
    else
      v9 = v8;
    -[TIKeyboardInputManager_ja_SegmentAdjust generateNewSegments:](self, "generateNewSegments:", v9);
  }
  return 1;
}

- (void)commitComposition
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_SegmentAdjust setIndex:](self, "setIndex:", objc_msgSend(v5, "index"));

    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "segments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_SegmentAdjust setSegments:](self, "setSegments:", v7);

  }
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_ja_SegmentAdjust;
  -[TIKeyboardInputManagerMecabra commitComposition](&v10, sel_commitComposition);
  -[TIKeyboardInputManager_ja_SegmentAdjust segments](self, "segments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
    -[TIKeyboardInputManager_ja_SegmentAdjust updateInputString](self, "updateInputString");
  else
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 800);
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (unint64_t)breaktAt
{
  return self->_breaktAt;
}

- (void)setBreaktAt:(unint64_t)a3
{
  self->_breaktAt = a3;
}

- (NSString)inputString
{
  return self->_inputString;
}

- (NSString)composingInputString
{
  return self->_composingInputString;
}

- (NSString)contextString
{
  return self->_contextString;
}

- (NSArray)contextSegments
{
  return self->_contextSegments;
}

- (void)setContextSegments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 848);
}

- (unint64_t)segmentLength
{
  return self->_segmentLength;
}

- (void)setSegmentLength:(unint64_t)a3
{
  self->_segmentLength = a3;
}

- (BOOL)romajiEnabled
{
  return self->_romajiEnabled;
}

- (void)setRomajiEnabled:(BOOL)a3
{
  self->_romajiEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextSegments, 0);
  objc_storeStrong((id *)&self->_contextString, 0);
  objc_storeStrong((id *)&self->_composingInputString, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

@end
