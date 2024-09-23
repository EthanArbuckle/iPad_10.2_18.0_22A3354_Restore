@implementation TIKeyboardInputManager_ja_Edit

- (TIKeyboardInputManager_ja_Edit)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 wordSearch:(id)a6 romajiMode:(BOOL)a7 conversionEnabled:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v14;
  id v15;
  TIKeyboardInputManager_ja_Edit *v16;
  TIKeyboardInputManager_ja_Edit *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __objc2_class **v23;
  void *v24;
  objc_super v26;
  objc_super v27;

  v8 = a8;
  v9 = a7;
  v14 = a5;
  v15 = a6;
  v27.receiver = self;
  v27.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  v16 = -[TIKeyboardInputManagerMecabra initWithConfig:keyboardState:](&v27, sel_initWithConfig_keyboardState_, a3, a4);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_wordSearch, a6);
    -[TIKeyboardInputManager_ja_Edit setEscapeKeyPressed:](v17, "setEscapeKeyPressed:", 0);
    if (v8)
    {
      objc_msgSend(v14, "subarrayWithRange:", 0, objc_msgSend(v14, "count") - 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");
      -[TIKeyboardInputManager_ja_Edit setMutableSegments:](v17, "setMutableSegments:", v19);

      objc_msgSend(v14, "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "reading");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager_ja_Edit setMutableSegments:](v17, "setMutableSegments:", v22);

      objc_msgSend(v14, "_readingStringWithin:", 0, objc_msgSend(v14, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26.receiver = v17;
    v26.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    -[TIKeyboardInputManager_ja_Edit setInput:](&v26, sel_setInput_, v21);
    v23 = &off_250121E40;
    if (!v9)
      v23 = off_250121E38;
    v24 = (void *)objc_msgSend(objc_alloc(*v23), "initWithInternalString:", v21);
    -[TIKeyboardInputManager_ja_Edit setKanaString:](v17, "setKanaString:", v24);

  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  if (_romanAlphabetCharacterSet)
  {
    CFRelease((CFTypeRef)_romanAlphabetCharacterSet);
    _romanAlphabetCharacterSet = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  -[TIKeyboardInputManagerMecabra dealloc](&v3, sel_dealloc);
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4DC8]);
}

- (id)keyEventMap
{
  return objc_alloc_init(MEMORY[0x24BEB4D60]);
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

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (id)wordCharacters
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D00], "romajiWordCharacters");
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  void *v5;
  void *v7;
  void *v8;
  id v9;
  objc_super v10;

  v4 = a3;
  if (-[TIKeyboardInputManager_ja_Edit handleBackspace:](self, "handleBackspace:", v4)
    || -[TIKeyboardInputManager_ja_Edit handleSpaceKey:](self, "handleSpaceKey:", v4)
    || -[TIKeyboardInputManager_ja_Edit handleEsc:](self, "handleEsc:", v4))
  {
    v5 = (void *)objc_opt_new();
  }
  else if (-[TIKeyboardInputManager_ja_Edit handleCancelEditMode:](self, "handleCancelEditMode:", v4))
  {
    v5 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    -[TIKeyboardInputManagerMecabra handleKeyboardInput:](&v10, sel_handleKeyboardInput_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (id)objc_opt_new();
    v5 = v9;

  }
  return v5;
}

- (BOOL)handleCancelEditMode:(id)a3
{
  unsigned int v4;
  unsigned int v5;

  v4 = -[TIKeyboardInputManager_ja_Edit inputCount](self, "inputCount", a3);
  v5 = -[TIKeyboardInputManager_ja_Edit inputIndex](self, "inputIndex");
  if (v4 == v5)
    -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  return v4 == v5;
}

- (BOOL)handleBackspace:(id)a3
{
  id v4;
  int v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "isBackspace");
  if (v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    v6 = -[TIKeyboardInputManagerMecabra handleKeyboardInput:](&v8, sel_handleKeyboardInput_, v4);
    if (!-[TIKeyboardInputManager_ja_Edit inputCount](self, "inputCount"))
      -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  }

  return v5;
}

- (BOOL)handleEsc:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("\x1B"));

  if (v5)
  {
    if (-[TIKeyboardInputManager_ja_Edit escapeKeyPressed](self, "escapeKeyPressed") >= 1)
    {
      -[TIKeyboardInputManager_ja_Edit clearInput](self, "clearInput");
      -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
    }
    -[TIKeyboardInputManager_ja_Edit setEscapeKeyPressed:](self, "setEscapeKeyPressed:", -[TIKeyboardInputManager_ja_Edit escapeKeyPressed](self, "escapeKeyPressed") + 1);
  }
  return v5;
}

- (BOOL)handleSpaceKey:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  TIWordSearchJapaneseOperationGetCandidates *v11;
  void *v12;
  TIWordSearchJapaneseOperationGetCandidates *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend(a3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isSpace");

  if (v5)
  {
    -[TIKeyboardInputManager_ja_Edit rawInputString](self, "rawInputString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Edit contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Edit prefixString](self, "prefixString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[TIKeyboardInputManager_ja_Edit prefixString](self, "prefixString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    v11 = [TIWordSearchJapaneseOperationGetCandidates alloc];
    -[TIKeyboardInputManager_ja_Edit wordSearch](self, "wordSearch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v23) = 1;
    LOWORD(v23) = 0;
    LOBYTE(v22) = 1;
    v13 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v11, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", v12, v6, 0, v7, 0x7FFFFFFFFFFFFFFFLL, 1, v22, 0, 0, 0, 0, v23, 0);

    -[TIWordSearchJapaneseOperationGetCandidates setAllowIncompleteRomaji:](v13, "setAllowIncompleteRomaji:", 1);
    -[TIWordSearchJapaneseOperationGetCandidates setReferenceMode:](v13, "setReferenceMode:", 1);
    -[TIWordSearchJapaneseOperationGetCandidates results](v13, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[TIKeyboardInputManager_ja_Edit wordSearch](self, "wordSearch");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "performOperationAsync:", v13);

      -[TIWordSearchJapaneseOperationGetCandidates waitUntilFinished](v13, "waitUntilFinished");
    }
    -[TIWordSearchJapaneseOperationGetCandidates results](v13, "results");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v16);

    -[TIWordSearchJapaneseOperationGetCandidates results](v13, "results");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "candidates");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_storeStrong((id *)&self->_inlineCandidate, v19);
      -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setInternalString:withInputIndex:", &stru_250122EC0, 0);

      -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
    }

  }
  return v5;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  objc_super v19;
  objc_super v20;
  uint64_t v21;

  objc_msgSend(a3, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v6, "length"))
    {
      v7 = 0;
      v8 = *MEMORY[0x24BDBEFB0];
      v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      do
      {
        objc_msgSend(v6, "substringWithRange:", v7, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager_ja_Edit transliterate:](self, "transliterate:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v20.receiver = self;
        v20.super_class = (Class)TIKeyboardInputManager_ja_Edit;
        v21 = 0;
        v12 = -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v20, sel_addInput_flags_point_firstDelete_, v11, 0, &v21, v8, v9);

        ++v7;
      }
      while (v7 < objc_msgSend(v6, "length"));
    }
    -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Edit rawInputString](self, "rawInputString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInternalString:withInputIndex:", v14, -[TIKeyboardInputManager_ja_Edit rawInputIndex](self, "rawInputIndex"));

    -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "internalString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19.receiver = self;
    v19.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    -[TIKeyboardInputManager_ja_Edit setInput:](&v19, sel_setInput_, v16);

    -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18.receiver = self;
    v18.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    -[TIKeyboardInputManager_ja_Edit setInputIndex:](&v18, sel_setInputIndex_, objc_msgSend(v17, "internalIndex"));

  }
}

- (id)deleteFromInput:(unint64_t *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t i;
  id v11;
  unint64_t v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  objc_super v20;
  objc_super v21;
  objc_super v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "externalIndex") >= 2)
  {

  }
  else
  {
    -[TIKeyboardInputManager_ja_Edit segments](self, "segments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
      -[TIKeyboardInputManager_ja_Edit revertLastSegment](self, "revertLastSegment");
  }
  v24 = 0;
  v25 = 0;
  -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v8, "deleteFromInput:newInput:inputIndex:", &v24, &v23, &v25);
  v9 = v23;

  if (v24 >= 1)
  {
    for (i = 0; i < v24; ++i)
    {
      v22.receiver = self;
      v22.super_class = (Class)TIKeyboardInputManager_ja_Edit;
      v11 = -[TIKeyboardInputManager_ja_Edit deleteFromInput:](&v22, sel_deleteFromInput_, a3);
    }
  }
  if (objc_msgSend(v9, "length"))
  {
    v12 = 0;
    v13 = *MEMORY[0x24BDBEFB0];
    v14 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    do
    {
      objc_msgSend(v9, "substringWithRange:", v12, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21.receiver = self;
      v21.super_class = (Class)TIKeyboardInputManager_ja_Edit;
      v16 = -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v21, sel_addInput_flags_point_firstDelete_, v15, 0, a3, v13, v14);

      ++v12;
    }
    while (v12 < objc_msgSend(v9, "length"));
  }
  if (v25 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v20.receiver = self;
    v20.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    -[TIKeyboardInputManager_ja_Edit setInputIndex:](&v20, sel_setInputIndex_);
  }
  -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_Edit rawInputString](self, "rawInputString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setInternalString:withInputIndex:", v18, -[TIKeyboardInputManager_ja_Edit rawInputIndex](self, "rawInputIndex"));

  return 0;
}

- (NSString)rawInputString
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  -[TIKeyboardInputManager_ja_Edit inputString](&v3, sel_inputString);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)rawInputIndex
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  return -[TIKeyboardInputManager_ja_Edit inputIndex](&v3, sel_inputIndex);
}

- (id)inputString
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  -[TIKeyboardInputManager_ja_Edit prefixString](self, "prefixString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_250122EC0;
  objc_msgSend(v3, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)inputCount
{
  void *v2;
  unsigned int v3;

  -[TIKeyboardInputManager_ja_Edit inputString](self, "inputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (unsigned)inputIndex
{
  void *v3;
  int v4;
  void *v5;
  unsigned int v6;

  -[TIKeyboardInputManager_ja_Edit prefixString](self, "prefixString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "externalIndex") + v4;

  return v6;
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  unsigned __int8 v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  v7 = -[TIKeyboardInputManagerMecabra _adjustPhraseBoundaryInForwardDirection:granularity:](&v17, sel__adjustPhraseBoundaryInForwardDirection_granularity_);
  if (a4 <= 1 && (v7 & 1) == 0)
  {
    v8 = -[TIKeyboardInputManager_ja_Edit inputIndex](self, "inputIndex");
    if (a3)
    {
      v9 = 1;
    }
    else
    {
      v10 = v8;
      -[TIKeyboardInputManager_ja_Edit prefixString](self, "prefixString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v12 == v10)
        -[TIKeyboardInputManager_ja_Edit revertLastSegment](self, "revertLastSegment");
      v9 = -1;
    }
    v13 = -[TIKeyboardInputManager_ja_Edit inputCount](self, "inputCount");
    v14 = -[TIKeyboardInputManager_ja_Edit inputIndex](self, "inputIndex") + v9;
    if (v13 >= v14)
      v15 = v14;
    else
      v15 = v13;
    -[TIKeyboardInputManager_ja_Edit setInputIndex:](self, "setInputIndex:", v15);
  }
  return 1;
}

- (void)setRawInputString:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  -[TIKeyboardInputManager_ja_Edit setInput:](&v3, sel_setInput_, a3);
}

- (void)setInputIndex:(unsigned int)a3
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  -[TIKeyboardInputManager_ja_Edit prefixString](self, "prefixString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 <= a3)
  {
    v7 = a3;
    -[TIKeyboardInputManager_ja_Edit prefixString](self, "prefixString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 - objc_msgSend(v8, "length");
    -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setExternalIndex:", v9);

    -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12.receiver = self;
    v12.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    -[TIKeyboardInputManager_ja_Edit setInputIndex:](&v12, sel_setInputIndex_, objc_msgSend(v11, "internalIndex"));

  }
}

- (id)transliterate:(id)a3
{
  id v3;
  const __CFCharacterSet *v4;
  uint64_t v5;

  v3 = a3;
  v4 = (const __CFCharacterSet *)_romanAlphabetCharacterSet;
  if (!_romanAlphabetCharacterSet)
  {
    v4 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"));
    _romanAlphabetCharacterSet = (uint64_t)v4;
  }
  if (!CFCharacterSetIsCharacterMember(v4, objc_msgSend(v3, "characterAtIndex:", 0)))
  {
    +[Romakana kanaSymbol:](Romakana, "kanaSymbol:", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  return v3;
}

- (NSArray)segments
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager_ja_Edit mutableSegments](self, "mutableSegments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSString)prefixString
{
  void *v3;
  void *v4;
  void *v5;

  -[TIKeyboardInputManager_ja_Edit segments](self, "segments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ja_Edit segments](self, "segments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_surfaceStringWithin:", 0, objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)revertLastSegment
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  -[TIKeyboardInputManager_ja_Edit mutableSegments](self, "mutableSegments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[TIKeyboardInputManager_ja_Edit segments](self, "segments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reading");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager_ja_Edit mutableSegments](self, "mutableSegments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeLastObject");

    -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "internalString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "stringByAppendingString:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v11;
    }
    -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "externalString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");
    -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "externalIndex") - v14;

    -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInternalString:withInputIndex:", v7, objc_msgSend(v7, "length"));

    -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "externalString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16 + objc_msgSend(v19, "length");
    -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setExternalIndex:", v20);

    -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "internalString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Edit setRawInputString:](self, "setRawInputString:", v23);

    -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25.receiver = self;
    v25.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    -[TIKeyboardInputManager_ja_Edit setInputIndex:](&v25, sel_setInputIndex_, objc_msgSend(v24, "internalIndex"));

  }
}

- (void)clearInput
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  -[TIKeyboardInputManagerMecabra clearInput](&v5, sel_clearInput);
  v3 = (void *)objc_opt_new();
  -[TIKeyboardInputManager_ja_Edit setMutableSegments:](self, "setMutableSegments:", v3);

  -[TIKeyboardInputManager_ja_Edit kanaString](self, "kanaString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalString:withInputIndex:", &stru_250122EC0, 0);

}

- (void)setPhraseBoundary:(unint64_t)a3
{
  objc_super v5;

  if (-[TIKeyboardInputManager_ja_Edit shouldCancelIfPhraseBoundaryChanged](self, "shouldCancelIfPhraseBoundaryChanged"))
  {
    -[TIKeyboardInputManagerMecabra cancelComposition](self, "cancelComposition");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    -[TIKeyboardInputManager_ja_Edit setPhraseBoundary:](&v5, sel_setPhraseBoundary_, a3);
  }
}

- (unint64_t)phraseBoundary
{
  objc_super v4;

  if (-[TIKeyboardInputManager_ja_Edit shouldCancelIfPhraseBoundaryChanged](self, "shouldCancelIfPhraseBoundaryChanged"))
  {
    return -[TIKeyboardInputManager_ja_Edit inputIndex](self, "inputIndex");
  }
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  return -[TIKeyboardInputManager_ja_Edit phraseBoundary](&v4, sel_phraseBoundary);
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (TIKeyboardCandidate)inlineCandidate
{
  return self->_inlineCandidate;
}

- (BOOL)shouldCancelIfPhraseBoundaryChanged
{
  return self->_shouldCancelIfPhraseBoundaryChanged;
}

- (void)setShouldCancelIfPhraseBoundaryChanged:(BOOL)a3
{
  self->_shouldCancelIfPhraseBoundaryChanged = a3;
}

- (NSMutableArray)mutableSegments
{
  return self->_mutableSegments;
}

- (void)setMutableSegments:(id)a3
{
  objc_storeStrong((id *)&self->_mutableSegments, a3);
}

- (TIMarkedTextBuffer)kanaString
{
  return self->_kanaString;
}

- (void)setKanaString:(id)a3
{
  objc_storeStrong((id *)&self->_kanaString, a3);
}

- (int64_t)escapeKeyPressed
{
  return self->_escapeKeyPressed;
}

- (void)setEscapeKeyPressed:(int64_t)a3
{
  self->_escapeKeyPressed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kanaString, 0);
  objc_storeStrong((id *)&self->_mutableSegments, 0);
  objc_storeStrong((id *)&self->_inlineCandidate, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

@end
