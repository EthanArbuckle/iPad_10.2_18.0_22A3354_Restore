@implementation TIKeyboardInputManagerChinesePhonetic

- (TIKeyboardInputManagerChinesePhonetic)initWithConfig:(id)a3 keyboardState:(id)a4
{
  TIKeyboardInputManagerChinesePhonetic *v4;
  TIKeyboardInputManagerChinesePhonetic *v5;
  uint64_t v6;
  NSMutableArray *replacedAmbiguousPinyinSyllables;
  uint64_t v8;
  NSMutableArray *replacementUnambiguousPinyinSyllables;
  TIConversionHistory *v10;
  TIConversionHistory *conversionHistory;
  NSArray *segments;
  TIMecabraIMLogger *v13;
  TIMecabraIMLogger *logger;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  v4 = -[TIKeyboardInputManagerChinese initWithConfig:keyboardState:](&v17, sel_initWithConfig_keyboardState_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_isCandidateSelected = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    replacedAmbiguousPinyinSyllables = v5->_replacedAmbiguousPinyinSyllables;
    v5->_replacedAmbiguousPinyinSyllables = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    replacementUnambiguousPinyinSyllables = v5->_replacementUnambiguousPinyinSyllables;
    v5->_replacementUnambiguousPinyinSyllables = (NSMutableArray *)v8;

    v5->_selectedPinyinSyllableCandidateIndex = 0x7FFFFFFFFFFFFFFFLL;
    v5->_shouldAdvanceSyllableSelection = 1;
    v10 = objc_alloc_init(TIConversionHistory);
    conversionHistory = v5->_conversionHistory;
    v5->_conversionHistory = v10;

    segments = v5->_segments;
    v5->_segments = (NSArray *)MEMORY[0x24BDBD1A8];

    if (objc_msgSend(MEMORY[0x24BEB5408], "isLoggingEnabled"))
    {
      v13 = (TIMecabraIMLogger *)objc_alloc_init(MEMORY[0x24BEB5408]);
      logger = v5->_logger;
      v5->_logger = v13;

      NSLog(CFSTR("TIMecabraIM: logging is enabled"));
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel_didDeleteCandidates_, CFSTR("MecabraDatabaseDeletedAllElementsNotification"), 0);

  }
  return v5;
}

- (BOOL)supportsNumberKeySelection
{
  void *v2;
  BOOL v3;

  -[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  -[TIKeyboardInputManagerMecabra dealloc](&v4, sel_dealloc);
}

- (void)suspend
{
  void *v3;
  objc_super v4;

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearCache");

  -[TIMecabraIMLogger writeLogToFile](self->_logger, "writeLogToFile");
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  -[TIKeyboardInputManagerMecabra suspend](&v4, sel_suspend);
}

- (void)didDeleteCandidates:(id)a3
{
  void *v4;
  id v5;

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearCache");

  -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clear");

}

- (BOOL)supportsPerRecipientLearning
{
  return 1;
}

- (id)newInputManagerState
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  v2 = -[TIKeyboardInputManagerChinesePhonetic newInputManagerState](&v4, sel_newInputManagerState);
  if (GetInputsPreventingAcceptCurrentCandidateIfSelectedSet(void)::onceToken != -1)
    dispatch_once(&GetInputsPreventingAcceptCurrentCandidateIfSelectedSet(void)::onceToken, &__block_literal_global_394);
  objc_msgSend(v2, "setInputsPreventingAcceptSelectedCandidate:", GetInputsPreventingAcceptCurrentCandidateIfSelectedSet(void)::__inputsPreventingAcceptCurrentCandidateIfSelectedSet);
  return v2;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  -[TIKeyboardInputManagerChinese syncToKeyboardState:from:afterContextChange:](&v8, sel_syncToKeyboardState_from_afterContextChange_, a3, a4, a5);
  -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentCandidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isCandidateSelected = v7 != 0;

  if (self->_isCandidateSelected && !self->_isInAmbiguousMode)
  {
    -[TIKeyboardInputManagerChinesePhonetic updateComposedText](self, "updateComposedText");
    -[TIKeyboardInputManagerChinesePhonetic setMarkedText](self, "setMarkedText");
  }
}

- (void)storeLanguageModelDynamicDataIncludingCache
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  -[TIKeyboardInputManagerMecabra storeLanguageModelDynamicDataIncludingCache](&v4, sel_storeLanguageModelDynamicDataIncludingCache);
  if (-[TIKeyboardInputManagerChinesePhonetic isTypologyEnabled](self, "isTypologyEnabled"))
  {
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mecabra");
    MecabraFlushDynamicData();

  }
}

- (void)clearPinyinSyllableSelection
{
  void *v3;
  void *v4;

  -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[TIKeyboardInputManagerChinesePhonetic replacementUnambiguousPinyinSyllables](self, "replacementUnambiguousPinyinSyllables");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[TIKeyboardInputManagerChinesePhonetic setPinyinSyllableCandidates:](self, "setPinyinSyllableCandidates:", 0);
  -[TIKeyboardInputManagerChinesePhonetic setSelectedPinyinSyllableCandidateIndex:](self, "setSelectedPinyinSyllableCandidateIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)shiftPinyinSyllableSelection
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectAtIndex:", 0);

    -[TIKeyboardInputManagerChinesePhonetic replacementUnambiguousPinyinSyllables](self, "replacementUnambiguousPinyinSyllables");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectAtIndex:", 0);

    -[TIKeyboardInputManagerChinesePhonetic setPinyinSyllableCandidates:](self, "setPinyinSyllableCandidates:", 0);
    -[TIKeyboardInputManagerChinesePhonetic setSelectedPinyinSyllableCandidateIndex:](self, "setSelectedPinyinSyllableCandidateIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (void)revertLastDisambiguation
{
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  TIInputManager *v19;
  id v20;

  if (-[TIKeyboardInputManagerChinesePhonetic hasLockedSyllable](self, "hasLockedSyllable"))
  {
    if (-[TIKeyboardInputManagerChinesePhonetic isPhraseBoundarySet](self, "isPhraseBoundarySet"))
      v3 = -[TIKeyboardInputManagerChinesePhonetic externalIndexToInternal:](self, "externalIndexToInternal:", -[TIKeyboardInputManagerChinesePhonetic inputIndex](self, "inputIndex"));
    else
      v3 = 0x7FFFFFFFFFFFFFFFLL;
    -[TIKeyboardInputManagerChinesePhonetic unconvertedInput](self, "unconvertedInput");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "length");
    -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeLastObject");

    -[TIKeyboardInputManagerChinesePhonetic replacementUnambiguousPinyinSyllables](self, "replacementUnambiguousPinyinSyllables");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerChinesePhonetic replacementUnambiguousPinyinSyllables](self, "replacementUnambiguousPinyinSyllables");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeLastObject");

    -[TIKeyboardInputManagerChinesePhonetic setSelectedPinyinSyllableCandidateIndex:](self, "setSelectedPinyinSyllableCandidateIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[TIKeyboardInputManagerChinesePhonetic replacementUnambiguousPinyinSyllables](self, "replacementUnambiguousPinyinSyllables");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", &stru_251980880);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");
    v14 = objc_msgSend(v9, "length");

    v15 = v20;
    if (v14 + v13 <= (unint64_t)objc_msgSend(v20, "length"))
    {
      objc_msgSend(v20, "stringByReplacingCharactersInRange:withString:", v13, v14, v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[TIKeyboardInputManagerChinesePhonetic stringByPrependingConvertedCandidateTextToString:](self, "stringByPrependingConvertedCandidateTextToString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic setInput:](self, "setInput:", v16);

    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "convertedLength");

      v19 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
      if (v3 != v18 && v3 - v18 > v6)
        objc_msgSend(v9, "hasSuffix:", CFSTR("'"));
      TIInputManager::set_input_index(v19);
    }

  }
}

- (NSString)internalInputString
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  TIInputManager *v8;
  const KB::String *v9;
  void *v10;
  void *v12;
  _BYTE v13[32];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasKindOf:", objc_opt_class());

    if (v4)
    {
      -[TIKeyboardInputManagerChinesePhonetic candidateForInlineTextSegmentation](self, "candidateForInlineTextSegmentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5)
      {
        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "asInlineText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_msgSend(v5, "input");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "asInlineText");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v7;
LABEL_9:

    return (NSString *)v10;
  }
  v8 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (v8)
  {
    TIInputManager::input_string(v8);
    KB::ns_string((KB *)v13, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    KB::String::~String((KB::String *)v13);
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (id)searchStringForMarkedText
{
  void *v3;
  void *v4;
  objc_super v6;

  if (self->_isInAmbiguousMode)
  {
    -[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic stringByRemovingSyllableSeparatorsFromString:](self, "stringByRemovingSyllableSeparatorsFromString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
    -[TIKeyboardInputManagerChinese searchStringForMarkedText](&v6, sel_searchStringForMarkedText);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)doesComposeText
{
  return 1;
}

- (id)stringByRemovingSyllableSeparatorsFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra syllableSeparator](self, "syllableSeparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v5, &stru_251980880);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)externalStringToInternal:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[TIKeyboardInputManagerChinesePhonetic shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
    -[TIKeyboardInputManager_mul externalStringToInternal:](&v8, sel_externalStringToInternal_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TIKeyboardInputManagerChinesePhonetic stringByRemovingSyllableSeparatorsFromString:](self, "stringByRemovingSyllableSeparatorsFromString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)internalStringToExternal:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  objc_super v16;

  v4 = (__CFString *)a3;
  if (-[TIKeyboardInputManagerChinesePhonetic shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    v16.receiver = self;
    v16.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
    -[TIKeyboardInputManager_mul internalStringToExternal:](&v16, sel_internalStringToExternal_, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = v5;

    goto LABEL_15;
  }
  v6 = (int)*MEMORY[0x24BEB5490];
  -[TIKeyboardInputManagerChinesePhonetic externalStringToInternal:](self, "externalStringToInternal:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v4);

  if (v8)
  {
    v5 = (__CFString *)*(id *)((char *)&self->super.super.super.super.super.super.isa + v6);
    goto LABEL_5;
  }
  -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  if (-[__CFString isEqualToString:](v4, "isEqualToString:", v10))
  {
    v9 = v4;
    if (-[__CFString length](v4, "length"))
    {
      -[TIKeyboardInputManagerChinesePhonetic candidateForInlineTextSegmentation](self, "candidateForInlineTextSegmentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerChinesePhonetic composedTextForSelectedCandidate:remainingInput:](self, "composedTextForSelectedCandidate:remainingInput:", v11, v12);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = v4;
        if (!self->_isInAmbiguousMode)
        {
LABEL_13:

          goto LABEL_14;
        }
        objc_msgSend((id)objc_opt_class(), "stringFallBackForTenKeyInput:range:", v10, 0, objc_msgSend(v10, "length"));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v12 = v4;
      }

      goto LABEL_13;
    }
  }
LABEL_14:

LABEL_15:
  if (v9)
    v13 = v9;
  else
    v13 = &stru_251980880;
  v14 = v13;

  return v14;
}

- (unsigned)internalIndexToExternal:(unsigned int)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;
  TIKeyboardInputManagerChinesePhonetic *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5490]);
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic internalStringToExternal:](self, "internalStringToExternal:", v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = a3;
  v8 = objc_msgSend(v6, "length");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__TIKeyboardInputManagerChinesePhonetic_internalIndexToExternal___block_invoke;
  v11[3] = &unk_251980068;
  v13 = self;
  v14 = &v15;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 514, v11);
  LODWORD(v8) = *((_DWORD *)v16 + 6);

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (unsigned)externalIndexToInternal:(unsigned int)a3
{
  return -[TIKeyboardInputManagerChinesePhonetic externalIndexToInternal:shouldBoundToInputCount:](self, "externalIndexToInternal:shouldBoundToInputCount:", *(_QWORD *)&a3, 1);
}

- (unsigned)externalIndexToInternal:(unsigned int)a3 shouldBoundToInputCount:(BOOL)a4
{
  unsigned int v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v5 = a3;
  v7 = (int)*MEMORY[0x24BEB5490];
  v8 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v7);
  if (v8)
  {
    if (objc_msgSend(v8, "length") >= (unint64_t)a3)
      v9 = v5;
    else
      v9 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v7), "length");
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v10 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v7);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __89__TIKeyboardInputManagerChinesePhonetic_externalIndexToInternal_shouldBoundToInputCount___block_invoke;
    v14[3] = &unk_251980090;
    v14[4] = self;
    v14[5] = &v15;
    objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 514, v14);
    v5 = *((_DWORD *)v16 + 6);
    _Block_object_dispose(&v15, 8);
  }
  v11 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (v11)
  {
    v12 = -858993459 * ((*(_QWORD *)(v11 + 16) - *(_QWORD *)(v11 + 8)) >> 3);
    if (v5 > v12 && a4)
      return v12;
  }
  return v5;
}

- (void)syncToLayoutState:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 isInAmbiguousMode;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  v4 = a3;
  -[TIKeyboardInputManagerChinese syncToLayoutState:](&v8, sel_syncToLayoutState_, v4);
  objc_msgSend(v4, "softwareLayout", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->_isInAmbiguousMode = objc_msgSend(v5, "hasPrefix:", CFSTR("Pinyin10"));
  isInAmbiguousMode = self->_isInAmbiguousMode;
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTenKeyPinyinEnabled:", isInAmbiguousMode);

}

- (id)keyboardConfigurationLayoutTag
{
  void *v3;
  BOOL v4;
  _BOOL4 v5;
  __CFString **v6;

  if (self->_isInAmbiguousMode && -[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount"))
  {
    -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[TIKeyboardInputManagerChinese isFacemarkInput:](self, "isFacemarkInput:", v3);

    if (v4)
    {
      v5 = -[TIKeyboardInputManagerChinese shouldEnableHalfWidthPunctuationForCurrentInputContext](self, "shouldEnableHalfWidthPunctuationForCurrentInputContext");
      v6 = kDisambiguationLayoutTag;
      if (v5)
        v6 = kHalfWidthPunctuationLayoutTag;
    }
    else
    {
      v6 = kSeparatorLayoutTag;
    }
  }
  else if (-[TIKeyboardInputManagerChinese shouldEnableHalfWidthPunctuationForCurrentInputContext](self, "shouldEnableHalfWidthPunctuationForCurrentInputContext"))
  {
    v6 = kHalfWidthPunctuationLayoutTag;
  }
  else
  {
    v6 = &kDefaultLayoutTag;
  }
  return *v6;
}

- (void)setInHardwareKeyboardMode:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 isInAmbiguousMode;
  void *v6;
  objc_super v7;

  v3 = a3;
  isInAmbiguousMode = self->_isInAmbiguousMode;
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTenKeyPinyinEnabled:", isInAmbiguousMode);

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  -[TIKeyboardInputManagerChinesePhonetic setInHardwareKeyboardMode:](&v7, sel_setInHardwareKeyboardMode_, v3);
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  -[TIKeyboardInputManagerChinesePhonetic logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginLogging");

  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  -[TIKeyboardInputManagerMecabra handleKeyboardInput:](&v9, sel_handleKeyboardInput_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerChinesePhonetic logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "markTime:", 1);

  return v6;
}

- (BOOL)inputContinuesGB18030OrUnicodeLookupKey:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_isInAmbiguousMode)
  {
    v5 = 0;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v21[0] = CFSTR("|g|");
    v21[1] = CFSTR("|u|");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "rangeOfString:", v4);
          if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v11, "substringToIndex:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v13, "length"))
            {

LABEL_15:
              v5 = 1;
              goto LABEL_16;
            }
            -[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqualToString:", v14);

            if ((v15 & 1) != 0)
              goto LABEL_15;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v8)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_16:

  }
  return v5;
}

- (BOOL)isSpecialInput:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = !objc_msgSend(v4, "length")
    || (unint64_t)objc_msgSend(v4, "length") > 2
    || -[TIKeyboardInputManagerChinese isFacemarkInput:](self, "isFacemarkInput:", v4)
    || -[TIKeyboardInputManagerChinesePhonetic inputContinuesGB18030OrUnicodeLookupKey:](self, "inputContinuesGB18030OrUnicodeLookupKey:", v4);

  return v5;
}

- (BOOL)_shouldCommitInputDirectly:(id)a3
{
  id v4;
  BOOL v5;
  unsigned int v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v4 = a3;
  if (-[TIKeyboardInputManagerChinesePhonetic isSpecialInput:](self, "isSpecialInput:", v4)
    || -[TIKeyboardInputManagerMecabra stringContainsActiveSupplementalLexiconSearchPrefix:](self, "stringContainsActiveSupplementalLexiconSearchPrefix:", v4))
  {
    goto LABEL_3;
  }
  v7 = -[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount");
  if (!v7)
  {
    -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "convertedLength"))
    {
      v12 = objc_msgSend(v4, "length");

      if (v12 > 1)
      {
LABEL_3:
        v5 = 0;
        goto LABEL_4;
      }
    }
    else
    {

    }
  }
  if (self->_isInAmbiguousMode && -[TIKeyboardInputManagerChinese isAlphabeticPlane](self, "isAlphabeticPlane"))
  {
    v5 = 1;
  }
  else
  {
    if (GetDirectlyCommittedNumbersAndPunctuationSet(void)::__onceToken != -1)
      dispatch_once(&GetDirectlyCommittedNumbersAndPunctuationSet(void)::__onceToken, &__block_literal_global_396);
    v8 = objc_msgSend(v4, "rangeOfCharacterFromSet:", GetDirectlyCommittedNumbersAndPunctuationSet(void)::__directNumbersAndPunctuationSet);
    if (v7)
      v9 = v8 == 0;
    else
      v9 = 1;
    v5 = v9;
    if (!v7 && v8)
    {
      objc_msgSend((id)objc_opt_class(), "directlyCommittedCharacterSetForEmptyInline");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v10) == 0;

    }
  }
LABEL_4:

  return v5;
}

- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6
{
  double y;
  double x;
  uint64_t v9;
  id v11;
  id v12;
  unint64_t *v13;
  void *v14;
  objc_super v16;
  uint64_t v17;

  y = a5.y;
  x = a5.x;
  v9 = *(_QWORD *)&a4;
  v11 = a3;
  *a6 = 0;
  if ((v9 & 8) != 0)
    v12 = -[TIKeyboardInputManagerChinesePhonetic deleteFromInput:](self, "deleteFromInput:", a6);
  v17 = 0;
  if (-[TIKeyboardInputManagerChinesePhonetic shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))v13 = (unint64_t *)&v17;
  else
    v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v16, sel_addInput_flags_point_firstDelete_, v11, v9, v13, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  unsigned int **v38;
  unsigned int **v39;
  unsigned int *v40;
  unsigned int v41;
  char *v42;
  char *v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  unsigned int v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  unint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  unint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  _BOOL4 v78;
  void *v79;
  objc_super v80;
  _QWORD v81[4];
  id v82;
  TIKeyboardInputManagerChinesePhonetic *v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  _BYTE v89[9];

  v6 = a3;
  v7 = a4;
  -[TIKeyboardInputManagerChinese setCurrentKeyHint:](self, "setCurrentKeyHint:", 0);
  if (!-[TIKeyboardInputManagerChinese handlePairedPunctuationInput:context:](self, "handlePairedPunctuationInput:context:", v6, v7))
  {
    objc_msgSend(v6, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
    -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldSkipCandidateSelection");

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v6, "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v12)
      {
        v80.receiver = self;
        v80.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
        -[TIKeyboardInputManagerChinesePhonetic addInput:withContext:](&v80, sel_addInput_withContext_, v6, v7);
        v13 = 0;
      }
      else
      {
        v13 = 1;
      }
      v14 = v8;
    }
    else
    {
      v89[0] = 0;
      -[TIKeyboardInputManagerChinesePhonetic remapInput:isFacemarkInput:](self, "remapInput:isFacemarkInput:", v8, v89);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "isMultitap"))
      {
        v86 = 1;
        v15 = -[TIKeyboardInputManagerChinesePhonetic deleteFromInput:](self, "deleteFromInput:", &v86);
        objc_msgSend(v7, "deleteBackward:", v86);
      }
      v13 = -[TIKeyboardInputManagerChinesePhonetic handleDirectlyCommitForInput:withContext:](self, "handleDirectlyCommitForInput:withContext:", v14, v7);
      if (!v13)
      {
        if (v89[0]
          || -[TIKeyboardInputManagerChinese showingFacemarkCandidates](self, "showingFacemarkCandidates")
          || (-[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = -[TIKeyboardInputManagerChinese isFacemarkInput:](self, "isFacemarkInput:", v16),
              v16,
              v17))
        {
          if (self->_isCandidateSelected)
          {
            -[TIKeyboardInputManagerChinesePhonetic acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
          }
          else if (-[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount"))
          {
            -[TIKeyboardInputManagerChinese acceptFirstCandidateWithContext:](self, "acceptFirstCandidateWithContext:", v7);
          }
        }
        -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "cancel");

        if (-[TIKeyboardInputManagerChinesePhonetic shouldReplaceCharacterOfInputStringBeforeCursorForInput:](self, "shouldReplaceCharacterOfInputStringBeforeCursorForInput:", v14))
        {
          v86 = 1;
          v19 = -[TIKeyboardInputManagerChinesePhonetic deleteFromInput:](self, "deleteFromInput:", &v86);
        }
        if (objc_msgSend(v14, "length") == 1 && (objc_msgSend(v14, "isEqualToString:", CFSTR("'")) & 1) == 0)
        {
          -[TIKeyboardInputManagerChinesePhonetic replacementUnambiguousPinyinSyllables](self, "replacementUnambiguousPinyinSyllables");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          if (v21)
          {
            -[TIKeyboardInputManagerChinesePhonetic replacementUnambiguousPinyinSyllables](self, "replacementUnambiguousPinyinSyllables");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "componentsJoinedByString:", &stru_251980880);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "length");

            -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "length");

            if (v24 == v26)
            {
              -[TIKeyboardInputManagerChinesePhonetic replacementUnambiguousPinyinSyllables](self, "replacementUnambiguousPinyinSyllables");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "lastObject");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "stringByAppendingString:", CFSTR("'"));
              v29 = v13;
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              -[TIKeyboardInputManagerChinesePhonetic replacementUnambiguousPinyinSyllables](self, "replacementUnambiguousPinyinSyllables");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "removeLastObject");

              -[TIKeyboardInputManagerChinesePhonetic replacementUnambiguousPinyinSyllables](self, "replacementUnambiguousPinyinSyllables");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "addObject:", v30);

              -[TIKeyboardInputManagerChinesePhonetic addInputToInternal:](self, "addInputToInternal:", CFSTR("'"));
              v13 = v29;
            }
          }
        }
        -[TIKeyboardInputManagerChinesePhonetic addInputToInternal:](self, "addInputToInternal:", v14);
        if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
        {
          v33 = (_QWORD *)TIInputManager::keys_for_input(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.isa
                                                                            + (int)*MEMORY[0x24BEB5498]));
          if (v33)
          {
            v34 = v33;
            v35 = *v33;
            v36 = v33[2];
            v87 = 0;
            v88 = 0;
            v86 = v35;
            if (v36)
            {
              v88 = v36;
              v37 = malloc_type_malloc(8 * v36, 0x2004093837F09uLL);
              v87 = v37;
              if (v37)
              {
                if (*v34)
                {
                  v38 = (unsigned int **)v34[1];
                  v39 = &v38[*v34];
                  do
                  {
                    v40 = *v38;
                    *v37 = *v38;
                    if (v40)
                    {
                      do
                        v41 = __ldaxr(v40);
                      while (__stlxr(v41 + 1, v40));
                    }
                    ++v37;
                    ++v38;
                  }
                  while (v38 != v39);
                }
              }
            }
          }
          else
          {
            v86 = 0;
            v87 = 0;
            v88 = 0;
          }
          v78 = v13;
          v79 = v14;
          asMCNearbyKeys();
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (v86)
          {
            v42 = (char *)v87;
            v43 = (char *)v87 + 8 * v86;
            do
            {
              v44 = *(_QWORD *)v42;
              if (*(_QWORD *)v42)
              {
                v45 = atomic_load((unsigned int *)v44);
                if (v45 == 1)
                {
                  v46 = *(_QWORD *)(v44 + 8);
                  if (v46)
                    WTF::RefCounted<TI::Favonius::Key>::deref(v46);
                  MEMORY[0x249597548](v44, 0x1020C40DF844C36);
                }
                else
                {
                  do
                    v47 = __ldaxr((unsigned int *)v44);
                  while (__stlxr(v47 - 1, (unsigned int *)v44));
                }
              }
              v42 += 8;
            }
            while (v42 != v43);
            v86 = 0;
          }
          v48 = v87;
          v87 = 0;
          v88 = 0;
          free(v48);
          v75 = objc_alloc(MEMORY[0x24BEB5328]);
          -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "layoutState");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "userInterfaceIdiom");
          -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "splitKeyboardMode");
          -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "floatingKeyboardMode");
          -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)objc_msgSend(v75, "initWithUserInterfaceIdiom:isSplitKeyboard:isFloatingKeyboard:isHardwareKeyboard:", v50, v52, v54, objc_msgSend(v55, "hardwareKeyboardMode"));

          v14 = v79;
          v57 = objc_msgSend(v79, "length");
          v81[0] = MEMORY[0x24BDAC760];
          v81[1] = 3221225472;
          v81[2] = __62__TIKeyboardInputManagerChinesePhonetic_addInput_withContext___block_invoke;
          v81[3] = &unk_2519800F8;
          v82 = v6;
          v83 = self;
          v84 = v77;
          v85 = v56;
          v58 = v56;
          v59 = v77;
          objc_msgSend(v79, "enumerateSubstringsInRange:options:usingBlock:", 0, v57, 2, v81);
          -[TIKeyboardInputManagerMecabra setPreviouslyDeletedTypeInput:](self, "setPreviouslyDeletedTypeInput:", 0);
          -[TIKeyboardInputManagerMecabra setPreviouslyProcessedDeleteInput:](self, "setPreviouslyProcessedDeleteInput:", 0);

          v13 = v78;
        }
        if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5490]))
        {
          if (_os_feature_enabled_impl())
          {
            -[TIKeyboardInputManagerChinesePhonetic segments](self, "segments");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "count");
            v62 = objc_msgSend((id)objc_opt_class(), "maxNumberOfUncommittedSegments");

            if (v61 > v62)
              -[TIKeyboardInputManagerChinesePhonetic autocommitHeadSegmentWithContext:](self, "autocommitHeadSegmentWithContext:", v7);
          }
          v63 = -[TIKeyboardInputManagerChinesePhonetic internalInputIndex](self, "internalInputIndex");
          -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "convertedLength");

          if (v63 <= v65)
          {
            -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "invalidate");

          }
          -[TIKeyboardInputManagerChinesePhonetic updateComposedText](self, "updateComposedText");
        }
      }
      if (!-[TIKeyboardInputManagerChinesePhonetic skipSetMarkedTextDuringInput](self, "skipSetMarkedTextDuringInput"))
      {
        if (-[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount"))
        {
          -[TIKeyboardInputManagerChinesePhonetic setMarkedText](self, "setMarkedText");
        }
        else if (objc_msgSend(v14, "length"))
        {
          objc_msgSend(v7, "insertText:", v14);
        }
      }
    }
    if (!self->_acceptingCandidate && !self->_lockingPinyinSyllableSelection)
    {
      -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setInputChangedSinceLastConversion:", 1);

    }
    if (-[TIKeyboardInputManagerChinesePhonetic usesGeometryModelData](self, "usesGeometryModelData"))
    {
      -[TIKeyboardInputManagerChinesePhonetic pinyinSyllableCandidates](self, "pinyinSyllableCandidates");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v68, "count"))
        v69 = -[TIKeyboardInputManagerChinesePhonetic selectedPinyinSyllableCandidateIndex](self, "selectedPinyinSyllableCandidateIndex");
      else
        v69 = 0x7FFFFFFFFFFFFFFFLL;

      -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerChinesePhonetic inputStringForSearch](self, "inputStringForSearch");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "clearCacheForInputString:keyboardInput:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:", v71, v72, objc_msgSend(v73, "count"), v69);

    }
    if ((objc_msgSend(v6, "isFlick") & 1) == 0 && (objc_msgSend(v6, "isMultitap") & 1) == 0)
    {
      objc_msgSend(v6, "inputManagerHint");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerChinese setCurrentKeyHint:](self, "setCurrentKeyHint:", v74);

    }
    if (((v13 | -[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput")) & 1) == 0)
      -[TIKeyboardInputManagerMecabra saveGeometryForInput:atIndex:](self, "saveGeometryForInput:atIndex:", v6, -[TIKeyboardInputManagerChinesePhonetic internalInputIndex](self, "internalInputIndex"));

  }
}

- (int64_t)addTouch:(id)a3 shouldHitTest:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  if (-[TIKeyboardInputManagerMecabra shouldClearBeforeContinuousPath](self, "shouldClearBeforeContinuousPath"))
  {
    -[TIKeyboardInputManagerMecabra setShouldClearBeforeContinuousPath:](self, "setShouldClearBeforeContinuousPath:", 0);
    -[TIKeyboardInputManagerChinesePhonetic clearInput](self, "clearInput");
  }
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  v7 = -[TIKeyboardInputManagerMecabra addTouch:shouldHitTest:](&v9, sel_addTouch_shouldHitTest_, v6, v4);

  return (int64_t)v7;
}

- (id)remapInput:(id)a3 isFacemarkInput:(BOOL *)a4
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a3;
  *a4 = 0;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("☻")))
  {
    v7 = (id)*MEMORY[0x24BEB5A98];

    *a4 = 1;
    v6 = v7;
  }
  else if (-[TIKeyboardInputManagerChinese isFacemarkInput:](self, "isFacemarkInput:", v6))
  {
    *a4 = 1;
  }
  else
  {
    -[TIKeyboardInputManagerChinese outputByConvertingDecimalPointForInput:](self, "outputByConvertingDecimalPointForInput:", v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  return v6;
}

- (BOOL)handleDirectlyCommitForInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "length"))
    goto LABEL_8;
  if (-[TIKeyboardInputManagerChinesePhonetic _shouldCommitInputDirectly:](self, "_shouldCommitInputDirectly:", v6))
  {
    if (-[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount"))
    {
      -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "keyboardType");

      if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 3
        || -[TIKeyboardInputManagerChinesePhonetic isPhraseBoundarySet](self, "isPhraseBoundarySet"))
      {
        goto LABEL_6;
      }
      -[TIKeyboardInputManagerChinese firstCandidate](self, "firstCandidate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "convertedLength");
        objc_msgSend(v12, "input");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "length") + v14;
        if (v16 >= -[TIKeyboardInputManagerChinesePhonetic internalInputCount](self, "internalInputCount"))
        {
          v17 = objc_msgSend(v6, "isEqualToString:", CFSTR("'"));

          if ((v17 & 1) == 0)
          {
            -[TIKeyboardInputManagerChinese acceptFirstCandidateWithContext:](self, "acceptFirstCandidateWithContext:", v7);
            v10 = 1;
            goto LABEL_15;
          }
        }
        else
        {

        }
      }
      v10 = 0;
LABEL_15:

      goto LABEL_9;
    }
    -[TIKeyboardInputManagerChinesePhonetic acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
LABEL_8:
    v10 = 1;
    goto LABEL_9;
  }
LABEL_6:
  v10 = 0;
LABEL_9:

  return v10;
}

- (void)addInputToInternal:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]))
  {
    v6 = objc_msgSend(v4, "length");
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__TIKeyboardInputManagerChinesePhonetic_addInputToInternal___block_invoke;
    v7[3] = &unk_251980120;
    v7[4] = self;
    v8 = v5;
    objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 514, v7);

  }
}

- (void)setInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  -[TIKeyboardInputManagerChinese setInput:](&v8, sel_setInput_, v4);

  if (self->_isInAmbiguousMode)
  {
    v6 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5490]);
    objc_msgSend((id)objc_opt_class(), "stringFallBackForTenKeyInput:range:", v6, 0, objc_msgSend(v6, "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setString:", v7);

  }
  else
  {
    -[TIKeyboardInputManagerChinesePhonetic clearPinyinSyllableSelection](self, "clearPinyinSyllableSelection");
  }
  -[TIKeyboardInputManagerChinesePhonetic setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
}

- (unsigned)inputCount
{
  unsigned int v3;
  void *v4;
  objc_super v6;

  if (-[TIKeyboardInputManagerChinesePhonetic shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
    return -[TIKeyboardInputManagerChinesePhonetic inputCount](&v6, sel_inputCount);
  }
  else
  {
    -[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "length");

  }
  return v3;
}

- (unsigned)inputIndex
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  objc_super v16;

  -[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[TIKeyboardInputManagerChinesePhonetic candidateForInlineTextSegmentation](self, "candidateForInlineTextSegmentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "candidate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (v7)
      {
        objc_msgSend(v5, "candidate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "length");

        return v9;
      }
    }

  }
  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasKindOf:", objc_opt_class());

    if (v11)
    {
      v12 = -[TIKeyboardInputManagerChinesePhonetic internalInputIndex](self, "internalInputIndex");
    }
    else
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v14, "asInlineTextCursorIndex");

    }
    v13 = -[TIKeyboardInputManagerChinesePhonetic internalIndexToExternal:](self, "internalIndexToExternal:", v12);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
    v13 = -[TIKeyboardInputManagerChinesePhonetic inputIndex](&v16, sel_inputIndex);
  }
  v9 = v13;
  if ((-[TIKeyboardInputManagerChinesePhonetic shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection") & 1) == 0
    && v9 >= -[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount"))
  {
    return -[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount");
  }
  return v9;
}

- (id)inputString
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  -[TIKeyboardInputManagerChinesePhonetic inputString](&v7, sel_inputString);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[TIKeyboardInputManagerChinesePhonetic candidateForInlineTextSegmentation](self, "candidateForInlineTextSegmentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "candidate");
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }

  }
  return v3;
}

- (unint64_t)internalInputCount
{
  void *v2;
  unint64_t v3;

  -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (unint64_t)internalInputIndex
{
  void *v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD v11[7];
  _QWORD v12[4];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasKindOf:", objc_opt_class());

    if (v4)
      return -[TIKeyboardInputManagerMecabra inputIndexWithDrawInput](self, "inputIndexWithDrawInput");
  }
  v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (!v6)
    return 0;
  v7 = *(unsigned int *)(v6 + 96);
  if (!(_DWORD)v7)
    return 0;
  -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v9 = objc_msgSend(v8, "length");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__TIKeyboardInputManagerChinesePhonetic_internalInputIndex__block_invoke;
  v11[3] = &unk_251980148;
  v11[4] = &v13;
  v11[5] = v12;
  v11[6] = v7;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 514, v11);
  v10 = v14[3];
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (id)uncommittedText
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;

  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "input");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_251980880;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  -[TIKeyboardInputManagerChinesePhonetic composedTextForSelectedCandidate:remainingInput:](self, "composedTextForSelectedCandidate:remainingInput:", v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    v11 = v10;

    v9 = v11;
  }

  return v9;
}

- (id)convertInputsToSyntheticInputUptoCount:(int)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v3 = *(_QWORD *)&a3;
  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput")
    && (-[TIKeyboardInputManagerMecabra composingInput](self, "composingInput"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasKindOf:", objc_opt_class()),
        v5,
        v6))
  {
    v7 = -[TIKeyboardInputManagerChinesePhonetic internalInputIndex](self, "internalInputIndex");
  }
  else
  {
    v7 = -1;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra _convertInputsToSyntheticInputUptoCount:cursorIndex:](self, "_convertInputsToSyntheticInputUptoCount:cursorIndex:", v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)deleteFromInput:(unint64_t *)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int isKindOfClass;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *i;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  unsigned int v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  unint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  unint64_t v83;
  void *v84;
  unint64_t v85;
  uint64_t v86;
  void *v87;
  unint64_t v88;
  unint64_t v89;
  void *v90;
  unint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  unint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  unint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  _QWORD v123[4];
  id v124;
  _QWORD *v125;
  _QWORD v126[4];
  objc_super v127;

  -[TIKeyboardInputManagerChinesePhonetic setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
  v5 = -[TIKeyboardInputManagerChinesePhonetic hasLockedSyllable](self, "hasLockedSyllable");
  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asInlineText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB5A98]);

    if (!v9)
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "composingInput");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "revertInlineCandidate");

      }
      v14 = objc_alloc(MEMORY[0x24BEB5310]);
      -[TIKeyboardInputManagerMecabra previouslyDeletedTypeInput](self, "previouslyDeletedTypeInput");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerMecabra previouslyProcessedDeleteInput](self, "previouslyProcessedDeleteInput");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "initWithDeletedText:deleteBySyllable:shouldDeleteAcceptCandidateInput:", 0, v15 == 0, v16 == 0);

      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "composeNew:", v17);

      -[TIKeyboardInputManagerMecabra processDeleteInputs](self, "processDeleteInputs");
      -[TIKeyboardInputManagerMecabra setPreviouslyProcessedDeleteInput:](self, "setPreviouslyProcessedDeleteInput:", v17);
      TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.isa
                                                           + (int)*MEMORY[0x24BEB5498]));
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "composingInput");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
      goto LABEL_71;
    }
LABEL_10:
    -[TIKeyboardInputManagerChinesePhonetic clearInput](self, "clearInput");
LABEL_72:
    v21 = 0;
    return v21;
  }
  if (!-[TIKeyboardInputManagerChinesePhonetic shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BEB5A98]);

    if (v23)
      goto LABEL_10;
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cancel");

    v25 = -[TIKeyboardInputManagerChinesePhonetic internalInputIndex](self, "internalInputIndex");
    -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "convertedLength");

    if (v25 < v27)
    {
      -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "invalidate");

    }
    -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "documentState");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "markedText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25 == v27)
    {
      -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "shouldRevertConvertedCandidateOnDeletionFromMarkedText:", v17);

      if ((v32 & 1) == 0)
      {
        -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "invalidate");

      }
    }
    -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "documentState");
    i = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(i, "selectedRangeInMarkedText");
    v37 = v36;
    if (!v36)
    {
      -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "shouldRevertConvertedCandidateOnDeletionFromMarkedText:", v17);

      if (v39)
      {
        v121 = i;
        -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "lastConvertedCandidate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "candidate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "input");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "convertedInput");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "length"))
        {
          v45 = objc_msgSend(v43, "length");
          if (v45 == objc_msgSend(v44, "length"))
          {
            v119 = v17;
            -[TIKeyboardInputManagerChinesePhonetic unconvertedInput](self, "unconvertedInput");
            v46 = objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "didRevertLastConvertedCandidate");

            objc_msgSend(v41, "revertedInput");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManagerChinesePhonetic stringByPrependingConvertedCandidateTextToString:](self, "stringByPrependingConvertedCandidateTextToString:", v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v117 = (void *)v46;
            objc_msgSend(v49, "stringByAppendingString:", v46);
            v50 = objc_claimAutoreleasedReturnValue();

            v116 = (void *)v50;
            -[TIKeyboardInputManagerChinesePhonetic setInput:](self, "setInput:", v50);
            objc_msgSend(v41, "candidate");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "candidate");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v52, "length");

            -[TIKeyboardInputManagerChinesePhonetic convertedInput](self, "convertedInput");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "length") + v53;

            -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "count");

            if (v55 <= v57)
            {
              v115 = v53;
              v58 = v43;
              -[TIKeyboardInputManagerChinesePhonetic convertedInput](self, "convertedInput");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend(v59, "length");

              v61 = objc_msgSend(v44, "length");
              objc_msgSend(v41, "geometryData");
              v62 = objc_claimAutoreleasedReturnValue();
              -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v63;
              if (v62)
              {
                objc_msgSend(v63, "replaceObjectsInRange:withObjectsFromArray:", v60, v115, v62, v62);

              }
              else
              {
                objc_msgSend(v63, "removeObjectsInRange:", v60, v115, 0);

                if (v61)
                {
                  v97 = v61;
                  do
                  {
                    -[TIKeyboardInputManagerMecabra insertDummyGeometryDataAtIndex:](self, "insertDummyGeometryDataAtIndex:", v60);
                    --v97;
                  }
                  while (v97);
                }
              }
              v43 = v58;
              if (-[TIKeyboardInputManagerChinesePhonetic isTypologyEnabled](self, "isTypologyEnabled"))
              {
                -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = objc_msgSend(v98, "count");

                if (v55 <= v99)
                {
                  objc_msgSend(v41, "touchData");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  v102 = v101;
                  if (v100)
                  {
                    objc_msgSend(v101, "replaceObjectsInRange:withObjectsFromArray:", v60, v115, v100);

                  }
                  else
                  {
                    objc_msgSend(v101, "removeObjectsInRange:", v60, v115);

                    for (; v61; --v61)
                      -[TIKeyboardInputManagerMecabra insertDummyTouchDataAtIndex:](self, "insertDummyTouchDataAtIndex:", v60);
                  }

                }
              }

            }
            objc_msgSend(v41, "replacedAmbiguousPinyinSyllables");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = objc_msgSend(v103, "count");

            if (v104)
            {
              objc_msgSend(v41, "replacedAmbiguousPinyinSyllables");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "arrayByAddingObjectsFromArray:", v106);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v108 = (void *)objc_msgSend(v107, "mutableCopy");
              -[TIKeyboardInputManagerChinesePhonetic setReplacedAmbiguousPinyinSyllables:](self, "setReplacedAmbiguousPinyinSyllables:", v108);

              objc_msgSend(v41, "replacementUnambiguousPinyinSyllables");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              -[TIKeyboardInputManagerChinesePhonetic replacementUnambiguousPinyinSyllables](self, "replacementUnambiguousPinyinSyllables");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "arrayByAddingObjectsFromArray:", v110);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = (void *)objc_msgSend(v111, "mutableCopy");
              -[TIKeyboardInputManagerChinesePhonetic setReplacementUnambiguousPinyinSyllables:](self, "setReplacementUnambiguousPinyinSyllables:", v112);

            }
            v17 = v119;
            if (a3)
              *a3 = 0;

            i = v121;
            goto LABEL_70;
          }
        }

        i = v121;
      }
    }
    -[TIKeyboardInputManagerChinesePhonetic revertLastDisambiguation](self, "revertLastDisambiguation");
    if (v5)
    {
LABEL_70:

LABEL_71:
      goto LABEL_72;
    }
    v65 = -[TIKeyboardInputManagerChinesePhonetic inputIndex](self, "inputIndex");
    v66 = (int)*MEMORY[0x24BEB5490];
    v67 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v66), "length");
    if (!v65 || v67 < v65)
    {
LABEL_52:
      if (!-[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount"))
      {
        -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
        -[TIKeyboardInputManagerChinesePhonetic clearPinyinSyllableSelection](self, "clearPinyinSyllableSelection");
        -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "clear");

      }
      goto LABEL_70;
    }
    if (v37 <= 1)
      v68 = 1;
    else
      v68 = v37;
    v120 = v17;
    v122 = i;
    if (v37 || v65 < 2)
    {
      v118 = v68;
LABEL_39:
      -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v78, "length");
      -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v68;
      if (v68 >= objc_msgSend(v80, "length"))
      {
        -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v82, "length");

      }
      v83 = v79 - v81;

      -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "length");

      if (v85 > v83)
      {
        v86 = (int)*MEMORY[0x24BEB5498];
        do
        {
          TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.isa
                                                               + v86));
          -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = objc_msgSend(v87, "length");

        }
        while (v88 > v83);
      }
      if (v25 >= v68)
        v89 = v25 - v68;
      else
        v89 = 0;
      for (i = v122; v68; --v68)
      {
        -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = objc_msgSend(v90, "count");

        if (v89 < v91)
        {
          -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "removeObjectAtIndex:", v89);

        }
      }
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v66), "substringToIndex:", v65 - v118);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v66), "substringFromIndex:", v65);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "stringByAppendingString:", v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v66), "setString:", v95);
      v17 = v120;
      goto LABEL_52;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v126[0] = 0;
    v126[1] = v126;
    v126[2] = 0x2020000000;
    v126[3] = 0;
    v70 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v66);
    v123[0] = MEMORY[0x24BDAC760];
    v123[1] = 3221225472;
    v123[2] = __57__TIKeyboardInputManagerChinesePhonetic_deleteFromInput___block_invoke;
    v123[3] = &unk_251980090;
    v71 = v69;
    v124 = v71;
    v125 = v126;
    objc_msgSend(v70, "enumerateSubstringsInRange:options:usingBlock:", 0, v65, 258, v123);
    if (objc_msgSend(v71, "count") != 1)
    {
      v74 = objc_msgSend(v71, "count");
      v73 = v68;
      if (v74 != 2)
        goto LABEL_38;
      -[TIKeyboardInputManagerMecabra syllableSeparator](self, "syllableSeparator");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v71, "indexOfObject:", v75);

      if (v76 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v71, "removeObjectAtIndex:", v76);
        objc_msgSend(v71, "firstObject");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v77, "length");

        v73 = v68 + 1;
        goto LABEL_38;
      }
    }
    objc_msgSend(v71, "firstObject");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v72, "length");

    v73 = v68;
LABEL_38:
    v118 = v73;

    _Block_object_dispose(v126, 8);
    goto LABEL_39;
  }
  v127.receiver = self;
  v127.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  -[TIKeyboardInputManagerChinese deleteFromInput:](&v127, sel_deleteFromInput_, a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  return v21;
}

- (void)resume
{
  void *v3;
  objc_super v4;

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mecabra");
  MecabraPreheatResources();

  if (-[TIKeyboardInputManagerChinesePhonetic resume]::onceToken != -1)
    dispatch_once(&-[TIKeyboardInputManagerChinesePhonetic resume]::onceToken, &__block_literal_global_130);
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  -[TIKeyboardInputManagerMecabra resume](&v4, sel_resume);
}

- (void)clearInput
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearCache");

  -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
  -[TIKeyboardInputManagerChinesePhonetic setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
  -[TIKeyboardInputManagerChinesePhonetic setRemainingInput:](self, "setRemainingInput:", 0);
  if (!self->_acceptingCandidate)
  {
    -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clear");

  }
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  -[TIKeyboardInputManagerChinese clearInput](&v6, sel_clearInput);
}

- (void)inputLocationChanged
{
  void *v3;
  void *v4;
  objc_super v5;

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
  -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clear");

  -[TIKeyboardInputManagerChinesePhonetic setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
  -[TIKeyboardInputManagerChinesePhonetic clearPinyinSyllableSelection](self, "clearPinyinSyllableSelection");
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  -[TIKeyboardInputManagerChinese inputLocationChanged](&v5, sel_inputLocationChanged);
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (BOOL)shouldReplaceCharacterOfInputStringBeforeCursorForInput:(id)a3
{
  return 0;
}

- (void)setAutoCorrects:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoCorrects:", v3);

}

- (void)setPhraseBoundary:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  if (self->_isInAmbiguousMode && -[TIKeyboardInputManagerChinesePhonetic hasLockedSyllable](self, "hasLockedSyllable"))
  {
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      -[TIKeyboardInputManagerChinesePhonetic composedTextBeforeFirstSyllableLocked](self, "composedTextBeforeFirstSyllableLocked");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5490]));

      if ((v7 & 1) != 0)
        return;
    }
  }
  -[TIKeyboardInputManagerChinesePhonetic clearPinyinSyllableSelection](self, "clearPinyinSyllableSelection");
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clearCache");

  -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInputChangedSinceLastConversion:", 1);

  -[TIKeyboardInputManagerChinese setPairedPunctuationOpenQuote:](self, "setPairedPunctuationOpenQuote:", 0);
  -[TIKeyboardInputManagerChinese setPairedPunctuationSelectedText:](self, "setPairedPunctuationSelectedText:", 0);
  -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "documentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectedRangeInMarkedText");
  v14 = v13 + a3;

  -[TIKeyboardInputManagerChinesePhonetic setInputIndex:](self, "setInputIndex:", v14);
  -[TIKeyboardInputManagerChinesePhonetic setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", -[TIKeyboardInputManagerChinesePhonetic isPhraseBoundarySet](self, "isPhraseBoundarySet"));
  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    v15 = -[TIKeyboardInputManagerChinesePhonetic externalIndexToInternal:shouldBoundToInputCount:](self, "externalIndexToInternal:shouldBoundToInputCount:", v14, 0);
    -[TIKeyboardInputManagerMecabra _convertInputsToSyntheticInputWithOffset:](self, "_convertInputsToSyntheticInputWithOffset:", v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra _replaceComposingInputWithSyntheticInput:internalIndex:](self, "_replaceComposingInputWithSyntheticInput:internalIndex:", v16, v15);

  }
}

- (unint64_t)phraseBoundary
{
  return -[TIKeyboardInputManagerChinesePhonetic inputIndex](self, "inputIndex");
}

- (id)candidateResultSet
{
  return -[TIKeyboardInputManagerChinesePhonetic candidateResultSetByWaitingForResults:](self, "candidateResultSetByWaitingForResults:", 0);
}

- (unint64_t)predictionOptions
{
  unint64_t result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  result = -[TIKeyboardInputManagerChinese predictionOptions](&v4, sel_predictionOptions);
  if (self->_isInAmbiguousMode)
    result |= 0x40uLL;
  return result;
}

- (id)candidateResultSetByWaitingForResults:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  void *v28;
  uint64_t v29;

  v3 = a3;
  if ((-[TIKeyboardInputManagerChinesePhonetic shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection") & 1) != 0)
  {
    v5 = 0;
    return v5;
  }
  if (-[TIKeyboardInputManagerChinesePhonetic candidateRange](self, "candidateRange")
    || (-[TIKeyboardInputManagerChinesePhonetic candidateRange](self, "candidateRange"), v6))
  {
    -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "length");
    if (!v10)
      goto LABEL_7;
    v11 = v10;
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inputs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (!v14)
    {
      if (v11 > *MEMORY[0x24BEB54B8]
        || (objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v24),
            v24,
            v25 != 0x7FFFFFFFFFFFFFFFLL)
        || -[TIKeyboardInputManagerChinesePhonetic inputMethodType](self, "inputMethodType") == 5
        && !objc_msgSend(v9, "_containsIdeographsOrBopomofoOnly")
        || (-[TIKeyboardInputManagerChinese language](self, "language"),
            v26 = (__CFString *)objc_claimAutoreleasedReturnValue(),
            v26,
            v26 == CFSTR("yue-Hant")))
      {
        v5 = 0;
        goto LABEL_22;
      }
      if (!-[TIKeyboardInputManagerChinesePhonetic generateReanalysisCandidatesIfAppropriate](self, "generateReanalysisCandidatesIfAppropriate"))goto LABEL_13;
    }
    else
    {
LABEL_7:
      -[TIKeyboardInputManagerChinesePhonetic inputStringForSearch](self, "inputStringForSearch");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length")
        || -[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput")
        && (-[TIKeyboardInputManagerMecabra composingInput](self, "composingInput"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v20, "inputs"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v21, "count"),
            v21,
            v20,
            v22))
      {
        v16 = -[TIKeyboardInputManagerChinesePhonetic updateCandidatesByWaitingForResults:](self, "updateCandidatesByWaitingForResults:", v3);

        if (!v16)
        {
LABEL_13:
          objc_msgSend(MEMORY[0x24BEB4E18], "dummySet");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        }
      }
      else
      {
        v23 = -[TIKeyboardInputManagerChinese updateCompletionCandidatesIfAppropriate](self, "updateCompletionCandidatesIfAppropriate");

        if (!v23)
          goto LABEL_13;
      }
    }
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic rawInputString](self, "rawInputString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra updateProactiveCandidatesForCandidateResultSet:withInput:](self, "updateProactiveCandidatesForCandidateResultSet:withInput:", v17, v18);

    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra candidateResultSetFromWordSearchCandidateResultSet:](self, "candidateResultSetFromWordSearchCandidateResultSet:", v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
    return v5;
  }
  objc_msgSend(MEMORY[0x24BEB4E18], "dummySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerChinesePhonetic mostRecentCandidateResultSetPendingDisplay](self, "mostRecentCandidateResultSetPendingDisplay");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[TIKeyboardInputManagerChinesePhonetic mostRecentCandidateResultSetPendingDisplay](self, "mostRecentCandidateResultSetPendingDisplay");
    v29 = objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerChinesePhonetic setMostRecentCandidateResultSetPendingDisplay:](self, "setMostRecentCandidateResultSetPendingDisplay:", 0);
    v5 = (void *)v29;
  }
  return v5;
}

- (BOOL)hasExtensionEmojiCandidates
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__TIKeyboardInputManagerChinesePhonetic_hasExtensionEmojiCandidates__block_invoke;
  v5[3] = &unk_2519801B8;
  v5[4] = &v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)sortingMethods
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  if (-[TIKeyboardInputManagerChinese showingFacemarkCandidates](self, "showingFacemarkCandidates"))
    return &unk_251987710;
  if (!-[TIKeyboardInputManagerChinese hasIdeographicCandidates](self, "hasIdeographicCandidates"))
    return &unk_251987728;
  if (-[TIKeyboardInputManagerChinesePhonetic hasExtensionEmojiCandidates](self, "hasExtensionEmojiCandidates")
    && !-[TIKeyboardInputManagerChinesePhonetic shouldOmitEmojiCandidates](self, "shouldOmitEmojiCandidates"))
  {
    return &unk_251987740;
  }
  if (-[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount"))
    return &unk_251987770;
  -[TIKeyboardInputManagerChinesePhonetic phoneticSortingMethod](self, "phoneticSortingMethod");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7[0] = &unk_251987880;
    v7[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &unk_251987758;
  }

  return v6;
}

- (id)phoneticSortingMethod
{
  return 0;
}

- (BOOL)usesAutoDeleteWord
{
  return 0;
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (BOOL)suppliesCompletions
{
  return 1;
}

- (BOOL)suppressCompletionsForFieldEditor
{
  return 0;
}

- (BOOL)supportsSetPhraseBoundary
{
  return 1;
}

- (BOOL)commitsAcceptedCandidate
{
  return 0;
}

- (BOOL)shouldExtendPriorWord
{
  return 0;
}

- (BOOL)supportsReversionUI
{
  return 0;
}

- (BOOL)supportsLearning
{
  return 0;
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4DE8]);
}

- (BOOL)ignoresDeadKeys
{
  return 1;
}

- (id)defaultCandidate
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  if (-[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount"))
  {
    -[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[TIKeyboardInputManagerChinesePhonetic inputIndex](self, "inputIndex");
    if (v4)
    {
      v5 = v4;
      if (v4 <= -[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount"))
      {
        objc_msgSend(v3, "substringToIndex:", v5);
        v6 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v6;
      }
    }
    -[TIKeyboardInputManagerChinesePhonetic stringByStrippingConvertedCandidateTextFromString:](self, "stringByStrippingConvertedCandidateTextFromString:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = v7;

      v3 = v8;
    }
    v9 = objc_alloc(MEMORY[0x24BEB4E20]);
    -[TIKeyboardInputManagerChinesePhonetic externalStringToInternal:](self, "externalStringToInternal:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithCandidate:", v10);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  self->_acceptingCandidate = 1;
  v6 = a4;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TIKeyboardInputManagerChinesePhonetic handleAcceptedPinyinDisambiguationCandidate:keyboardState:](self, "handleAcceptedPinyinDisambiguationCandidate:keyboardState:", v7, v6);

    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
    -[TIKeyboardInputManagerMecabra handleAcceptedCandidate:keyboardState:](&v10, sel_handleAcceptedCandidate_keyboardState_, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  self->_acceptingCandidate = 0;
  -[TIKeyboardInputManagerChinese setCurrentKeyHint:](self, "setCurrentKeyHint:", 0);
  return v8;
}

- (void)handleAcceptedPinyinDisambiguationCandidate:(id)a3 keyboardState:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  unint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    if (!-[TIKeyboardInputManagerChinesePhonetic shouldAdvanceSyllableSelection](self, "shouldAdvanceSyllableSelection"))-[TIKeyboardInputManagerChinesePhonetic revertLastDisambiguation](self, "revertLastDisambiguation");
    v8 = v5;
    -[TIKeyboardInputManagerChinesePhonetic setShouldAdvanceSyllableSelection:](self, "setShouldAdvanceSyllableSelection:", objc_msgSend(v8, "isGeneratedByChoosePinyin") ^ 1);
    objc_msgSend(v8, "setGeneratedByChoosePinyin:", 0);
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancel");

    -[TIKeyboardInputManagerChinesePhonetic setComposedTextBeforeFirstSyllableLocked:](self, "setComposedTextBeforeFirstSyllableLocked:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5490]));
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "disambiguationCandidates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = objc_msgSend(v11, "indexOfObject:", v8);
    if (v51 == 0x7FFFFFFFFFFFFFFFLL)
    {

      v52 = 0;
    }
    else
    {
      v52 = v11;
    }
    self->_lockingPinyinSyllableSelection = 1;
    -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = 0;
      v15 = 0;
      while (1)
      {
        -[TIKeyboardInputManagerChinesePhonetic unconvertedInput](self, "unconvertedInput");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerChinesePhonetic unconvertedInput](self, "unconvertedInput");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "rangeOfString:options:range:", CFSTR("'"), 0, v14, objc_msgSend(v17, "length") - v14);

        v19 = v18 + 1;
        -[TIKeyboardInputManagerChinesePhonetic unconvertedInput](self, "unconvertedInput");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "length");

        if (v18 + 1 > v21)
          break;
        ++v15;
        -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        v14 = v18 + 1;
        if (v15 >= v23)
          goto LABEL_14;
      }
      -[TIKeyboardInputManagerChinesePhonetic revertLastDisambiguation](self, "revertLastDisambiguation");
      v19 = v14;
    }
    else
    {
      v19 = 0;
    }
LABEL_14:
    objc_msgSend(v8, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic unconvertedInput](self, "unconvertedInput");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");

    objc_msgSend((id)objc_opt_class(), "ambiguousAndPinyinCharacterSet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v24, "rangeOfCharacterFromSet:", v27);

    objc_msgSend((id)objc_opt_class(), "ambiguousAndPinyinCharacterSet");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v53 = v8;
    if (v28 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v29, "invertedSet");
      v31 = objc_claimAutoreleasedReturnValue();

      v30 = (void *)v31;
    }
    -[TIKeyboardInputManagerChinesePhonetic unconvertedInput](self, "unconvertedInput");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "rangeOfCharacterFromSet:options:range:", v30, 0, v19, v26 - v19);

    if (v33 == 0x7FFFFFFFFFFFFFFFLL)
      v34 = v26;
    else
      v34 = v33;
    -[TIKeyboardInputManagerChinesePhonetic unconvertedInput](self, "unconvertedInput");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v36 = v24;
    v37 = objc_msgSend(v36, "length");
    v38 = v37 + v19;
    v39 = v36;
    if ((objc_msgSend(v36, "hasSuffix:", CFSTR("'")) & 1) == 0)
    {
      v39 = v36;
      if (v38 < v34)
      {
        v39 = v36;
        if (objc_msgSend(v35, "rangeOfString:options:range:", CFSTR("'"), 2, v37 + v19, 1) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v36, "stringByAppendingString:", CFSTR("'"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
    v54 = v5;
    v50 = v30;
    if (v34 >= v38)
    {
      objc_msgSend(v35, "substringWithRange:", v19, v37);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringByReplacingCharactersInRange:withString:", v19, v37, v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        v56 = "-[TIKeyboardInputManagerChinesePhonetic handleAcceptedPinyinDisambiguationCandidate:keyboardState:]";
        v57 = 2048;
        v58 = v19;
        v59 = 2048;
        v60 = v37;
        v61 = 2048;
        v62 = v34;
        _os_log_fault_impl(&dword_248040000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%s: disambiguation candidate(location=%ld, length=%ld) is longer than input(length=%ld). Please file to 'TextInput | Input Managers'", buf, 0x2Au);
      }
      v40 = v36;
      v41 = v35;
    }
    -[TIKeyboardInputManagerChinesePhonetic stringByPrependingConvertedCandidateTextToString:](self, "stringByPrependingConvertedCandidateTextToString:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = (void *)objc_msgSend(v52, "copy");
    -[TIKeyboardInputManagerChinesePhonetic clearInput](self, "clearInput");
    -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObject:", v40);

    -[TIKeyboardInputManagerChinesePhonetic replacementUnambiguousPinyinSyllables](self, "replacementUnambiguousPinyinSyllables");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v39);

    -[TIKeyboardInputManagerChinesePhonetic setSelectedPinyinSyllableCandidateIndex:](self, "setSelectedPinyinSyllableCandidateIndex:", v51);
    -[TIKeyboardInputManagerChinesePhonetic setPinyinSyllableCandidates:](self, "setPinyinSyllableCandidates:", v43);
    v46 = objc_alloc_init(MEMORY[0x24BEB4E28]);
    v47 = objc_alloc(MEMORY[0x24BEB53B8]);
    -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v47, "initWithKeyboardState:", v48);

    objc_msgSend(v46, "setString:", v42);
    -[TIKeyboardInputManagerChinesePhonetic addInput:withContext:](self, "addInput:withContext:", v46, v49);
    self->_lockingPinyinSyllableSelection = 0;

    v5 = v54;
  }

}

- (id)sentenceDelimitingCharacters
{
  return CFSTR(".?!。？！");
}

- (BOOL)canStartSentenceAfterString:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "length")
    && (v10.receiver = self,
        v10.super_class = (Class)TIKeyboardInputManagerChinesePhonetic,
        !-[TIKeyboardInputManagerChinesePhonetic canStartSentenceAfterString:](&v10, sel_canStartSentenceAfterString_, v4)))
  {
    v6 = -[TIKeyboardInputManagerChinesePhonetic canStartSentenceAfterString:]::ChineseSentenceDelimitingCharacters;
    if (!-[TIKeyboardInputManagerChinesePhonetic canStartSentenceAfterString:]::ChineseSentenceDelimitingCharacters)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("。？！"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)-[TIKeyboardInputManagerChinesePhonetic canStartSentenceAfterString:]::ChineseSentenceDelimitingCharacters;
      -[TIKeyboardInputManagerChinesePhonetic canStartSentenceAfterString:]::ChineseSentenceDelimitingCharacters = v7;

      v6 = -[TIKeyboardInputManagerChinesePhonetic canStartSentenceAfterString:]::ChineseSentenceDelimitingCharacters;
    }
    v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v6, 1, objc_msgSend(v4, "length") - 1, 1) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)didAcceptCandidate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char isKindOfClass;
  void *v30;
  __int16 v31;
  _BOOL4 v32;
  void *v33;
  int v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  unsigned int v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  uint64_t v68;
  unint64_t v69;
  void *v70;
  unint64_t v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  unint64_t v79;
  void *v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  unint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  unint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  id v108;
  void *v109;
  char v110;
  void *v111;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  uint8_t buf[4];
  void *v121;
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearCache");

  if (!v6)
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_81;
  }
  objc_msgSend(v4, "input");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v4, "input");
  else
    objc_msgSend(v4, "candidate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerChinesePhonetic convertedInput](self, "convertedInput");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", v15))
  {
    -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "documentState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "markedText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "isEqualToString:", v18);

  }
  else
  {
    v10 = 0;
  }

  v19 = objc_msgSend(v12, "length");
  -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");
  v118 = v13;
  v22 = v21 - objc_msgSend(v13, "length");

  v23 = !-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput");
  if (v19 < v22)
    v24 = v23;
  else
    v24 = 0;
  if ((v23 & 1) == 0 && (v10 & 1) == 0)
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v25, "hasRemainingComposingInput");

  }
  if (-[TIKeyboardInputManagerChinesePhonetic isTypologyEnabled](self, "isTypologyEnabled"))
  {
    -[TIKeyboardInputManagerMecabra logCommittedCandidate:partial:](self, "logCommittedCandidate:partial:", v4, v24);
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mecabra");
    MecabraGetDebuggingLog();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "description");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v28);

    -[TIKeyboardInputManagerChinesePhonetic logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", CFSTR("\n\n"));
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v4, "proactiveTrigger");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v4, "customInfoType");
  v32 = -[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput");
  v119 = v10;
  if ((isKindOfClass & 1) != 0 || v30 || (v31 & 0x1000) != 0)
  {
    -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isValid") | v32;

    v35 = v34 == 1;
    v10 = v119;
    if (v35)
    {
      v116 = v12;
      v36 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v4);
      objc_msgSend(MEMORY[0x24BEB4E80], "convertedInputFromMecabraCandidate:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36 && MecabraCandidateIsFuzzyMatchCandidate())
      {
        -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "inputMode");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        TIStatisticGetKeyForCandidateAccepted();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        TIStatisticScalarIncrement();

        v10 = v119;
      }
      if (self->_isInAmbiguousMode
        && -[TIKeyboardInputManagerChinesePhonetic hasLockedSyllable](self, "hasLockedSyllable"))
      {
        -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "inputMode");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        TIStatisticGetKeyForCandidateAccepted();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        TIStatisticScalarIncrement();

        v10 = v119;
      }
      -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v36)
      {
        objc_msgSend(v44, "performAccept:isPartial:", v36, v24);

        v46 = v36;
      }
      else
      {
        objc_msgSend(v4, "candidate");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "commitSurface:", v55);

        v10 = v119;
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v46 = (id)objc_claimAutoreleasedReturnValue();
      }
      v117 = v46;
      if (self->_isInAmbiguousMode)
      {
        v56 = (void *)MecabraCandidateCopySyllableLengthArrayInAnalysisString();
        v57 = objc_msgSend(v56, "count");

        -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v118;
        if (v57 >= objc_msgSend(v58, "count"))
        {
          -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v59, "count");

        }
        -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "subarrayWithRange:", 0, v57);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        -[TIKeyboardInputManagerChinesePhonetic replacementUnambiguousPinyinSyllables](self, "replacementUnambiguousPinyinSyllables");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "subarrayWithRange:", 0, v57);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "addCandidate:candidateRef:replacedAmbiguousPinyinSyllables:replacementUnambiguousPinyinSyllables:convertedInput:", v4, v117, v61, v63, v37);

        for (; v57; --v57)
          -[TIKeyboardInputManagerChinesePhonetic shiftPinyinSyllableSelection](self, "shiftPinyinSyllableSelection");

        v10 = v119;
      }
      else
      {
        -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "addCandidate:candidateRef:replacedAmbiguousPinyinSyllables:replacementUnambiguousPinyinSyllables:convertedInput:", v4, v117, 0, 0, v37);
        v48 = v118;
      }

      v12 = v116;
      if (!v32)
      {
        if (!(_DWORD)v24)
        {
          -[TIKeyboardInputManagerChinesePhonetic convertedInput](self, "convertedInput");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "clear");

          -[TIKeyboardInputManagerChinesePhonetic clearPinyinSyllableSelection](self, "clearPinyinSyllableSelection");
          -[TIKeyboardInputManagerMecabra updateUsageStatisticsForCandidate:isPartial:](self, "updateUsageStatisticsForCandidate:isPartial:", v4, 0);

          goto LABEL_80;
        }
        v68 = objc_msgSend(v48, "length");
        v69 = objc_msgSend(v116, "length") + v68;
        -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "length");

        if (v69 > v71)
        {
          if (TICanLogMessageAtLevel())
          {
            TIOSLogFacility();
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Warning: internalInputString index is out of bounds with new candidateInputText"), "-[TIKeyboardInputManagerChinesePhonetic didAcceptCandidate:]");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v121 = v113;
              _os_log_debug_impl(&dword_248040000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

            }
          }
          -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v73, "length");

        }
        -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "substringFromIndex:", v69);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerChinesePhonetic stringByPrependingConvertedCandidateTextToString:](self, "stringByPrependingConvertedCandidateTextToString:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerChinesePhonetic setRemainingInput:](self, "setRemainingInput:", v76);

        -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "lastConvertedCandidate");
        v115 = (void *)objc_claimAutoreleasedReturnValue();

        v78 = objc_msgSend(v48, "length");
        v79 = objc_msgSend(v116, "length") + v78;
        -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v80, "count");

        if (v79 < v81)
        {
          v82 = objc_msgSend(v48, "length");
          v83 = objc_msgSend(v116, "length");
          objc_msgSend(v4, "candidate");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = objc_msgSend(v84, "length");

          -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "subarrayWithRange:", v82, v83);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "setGeometryData:", v87);

          -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = v83;
          objc_msgSend(v88, "removeObjectsInRange:", v82, v83);

          if (v85)
          {
            v89 = v85;
            do
            {
              -[TIKeyboardInputManagerMecabra insertDummyGeometryDataAtIndex:](self, "insertDummyGeometryDataAtIndex:", v82);
              --v89;
            }
            while (v89);
          }
          v48 = v118;
          if ((-[TIKeyboardInputManagerChinesePhonetic isTypologyEnabled](self, "isTypologyEnabled") & 1) != 0)
          {
            -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = objc_msgSend(v90, "count");

            if (v79 < v91)
            {
              -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "subarrayWithRange:", v82, v114);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "setTouchData:", v93);

              -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "removeObjectsInRange:", v82, v114);

              for (; v85; --v85)
                -[TIKeyboardInputManagerMecabra insertDummyTouchDataAtIndex:](self, "insertDummyTouchDataAtIndex:", v82);
            }
          }
        }

        v12 = v116;
        v10 = v119;
      }
      -[TIKeyboardInputManagerMecabra updateUsageStatisticsForCandidate:isPartial:](self, "updateUsageStatisticsForCandidate:isPartial:", v4, v24);

      v47 = 0;
      v11 = 0;
      if ((v24 & 1) == 0)
        goto LABEL_80;
      goto LABEL_79;
    }
  }
  if (v32)
  {
    v47 = 0;
    v37 = 0;
    v11 = 0;
    v48 = v118;
    if (!(_DWORD)v24)
      goto LABEL_80;
    goto LABEL_79;
  }
  objc_msgSend(v4, "input");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "length");

  v10 = v119;
  v48 = v118;
  if (v119)
  {
    objc_msgSend(v4, "candidate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic stringByRemovingSyllableSeparatorsFromString:](self, "stringByRemovingSyllableSeparatorsFromString:", v51);
    v47 = objc_claimAutoreleasedReturnValue();

    goto LABEL_78;
  }
  if ((v50 != 0) | isKindOfClass & 1 || v30)
  {
    objc_msgSend(v4, "candidate");
    v47 = objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v24)
      goto LABEL_48;
    v67 = 0;
  }
  else
  {
    v52 = -[TIKeyboardInputManagerChinesePhonetic inputIndex](self, "inputIndex");
    v53 = objc_msgSend(v118, "length");
    objc_msgSend(v4, "candidate");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53 >= v52)
    {
      -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v65, "length");
      if (v96 <= objc_msgSend(v12, "length"))
      {
        -[TIKeyboardInputManagerChinesePhonetic setRemainingInput:](self, "setRemainingInput:", &stru_251980880);
      }
      else
      {
        -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "substringFromIndex:", objc_msgSend(v12, "length"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerChinesePhonetic setRemainingInput:](self, "setRemainingInput:", v98);

      }
      v67 = 0;
      v10 = 0;
      goto LABEL_76;
    }
    objc_msgSend(v118, "stringByAppendingString:", v54);
    v47 = objc_claimAutoreleasedReturnValue();

    if ((v24 & 1) != 0)
    {
      v10 = 0;
LABEL_48:
      -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "substringFromIndex:", objc_msgSend(v12, "length") + objc_msgSend(v118, "length"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerChinesePhonetic setRemainingInput:](self, "setRemainingInput:", v66);

      v67 = 1;
      v54 = (void *)v47;
LABEL_76:

      v47 = (uint64_t)v54;
      goto LABEL_77;
    }
    v67 = 0;
    v10 = 0;
  }
LABEL_77:
  -[TIKeyboardInputManagerMecabra updateUsageStatisticsForCandidate:isPartial:](self, "updateUsageStatisticsForCandidate:isPartial:", v4, v24);
  LOBYTE(v24) = v67;
  v48 = v118;
LABEL_78:
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "commitSurface:", v47);

  -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "clear");

  -[TIKeyboardInputManagerChinesePhonetic clearPinyinSyllableSelection](self, "clearPinyinSyllableSelection");
  v37 = 0;
  v11 = (void *)v47;
  if ((v24 & 1) != 0)
  {
LABEL_79:
    -[TIKeyboardInputManagerMecabra savePartialGeometryData](self, "savePartialGeometryData");
    v11 = (void *)v47;
  }
LABEL_80:

LABEL_81:
  -[TIKeyboardInputManagerChinesePhonetic setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    if (v10)
    {
      objc_msgSend(v4, "candidate");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerChinesePhonetic stringByRemovingSyllableSeparatorsFromString:](self, "stringByRemovingSyllableSeparatorsFromString:", v101);
      v102 = objc_claimAutoreleasedReturnValue();

      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "removeAllInputs");

      -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "commitSurface:", v102);
      v11 = (void *)v102;
LABEL_88:

      goto LABEL_89;
    }
    -[TIKeyboardInputManagerMecabra processAcceptedCandidate:](self, "processAcceptedCandidate:", v4);
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v106, "hasDrawInput");

    if (v107)
    {
      v108 = -[TIKeyboardInputManagerChinesePhonetic candidateResultSetByWaitingForResults:](self, "candidateResultSetByWaitingForResults:", 1);
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = objc_msgSend(v109, "hasRemainingComposingInput");

      if ((v110 & 1) == 0)
      {
        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "asCommittedText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "removeAllInputs");
        goto LABEL_88;
      }
    }
    v11 = v105;
  }
LABEL_89:

  return v11;
}

- (void)lastAcceptedCandidateCorrected
{
  id v2;

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastAcceptedCandidateCorrected");

}

- (void)clearDynamicDictionary
{
  id v2;

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearLearningDictionary");

}

- (BOOL)shouldLookForCompletionCandidates
{
  return -[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount") == 0;
}

- (BOOL)updateCandidatesByWaitingForResults:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  TIKeyboardInputManagerChinesePhonetic *v15;
  char *v16;
  void *v17;
  char v18;
  void *v19;
  TIWordSearchChinesePhoneticOperationGetCandidates *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _BOOL4 v28;
  void *v29;
  TIWordSearchChinesePhoneticOperationGetCandidates *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;

  v3 = a3;
  -[TIKeyboardInputManagerChinesePhonetic inputStringForSearch](self, "inputStringForSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length")
    || -[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput")
    && (-[TIKeyboardInputManagerMecabra composingInput](self, "composingInput"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "inputs"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7,
        v9))
  {
    if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
    {
      v6 = MEMORY[0x24BDBD1A8];
    }
    else
    {
      -[TIKeyboardInputManagerMecabra geometryModelData](self, "geometryModelData");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    -[TIKeyboardInputManagerChinesePhonetic pinyinSyllableCandidates](self, "pinyinSyllableCandidates");
    v33 = v5;
    v34 = (void *)v6;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "count"))
      v31 = -[TIKeyboardInputManagerChinesePhonetic selectedPinyinSyllableCandidateIndex](self, "selectedPinyinSyllableCandidateIndex");
    else
      v31 = 0x7FFFFFFFFFFFFFFFLL;
    v30 = [TIWordSearchChinesePhoneticOperationGetCandidates alloc];
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    v14 = -[TIKeyboardInputManagerChinesePhonetic shouldAdvanceSyllableSelection](self, "shouldAdvanceSyllableSelection");
    if (v3)
      v15 = 0;
    else
      v15 = self;
    if (v3)
      v16 = 0;
    else
      v16 = sel_wordSearchEngineDidFindCandidates_forOperation_;
    -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
    v28 = v3;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hardwareKeyboardMode");
    -[TIKeyboardInputManagerChinesePhonetic logger](self, "logger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = v18;
    v26 = v16;
    *(_WORD *)((char *)&v25 + 1) = 1;
    LOBYTE(v25) = v14;
    v5 = v33;
    v20 = -[TIWordSearchChinesePhoneticOperationGetCandidates initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:disambiguationCandidates:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:regenerateDisambiguationCandidates:predictionEnabled:reanalysisMode:target:action:geometryModelData:hardwareKeyboardMode:logger:](v30, "initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:disambiguationCandidates:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:regenerateDisambiguationCandidates:predictionEnabled:reanalysisMode:target:action:geometryModelData:hardwareKeyboardMode:logger:", v29, v33, v11, 0x7FFFFFFFFFFFFFFFLL, v32, v13, v31, v25, v15, v26, v34, v27, v19);

    -[TIWordSearchOperationGetCandidates results](v20, "results");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "performOperationAsync:", v20);

      if (!v28)
      {
        v10 = 0;
        goto LABEL_22;
      }
      -[TIWordSearchChinesePhoneticOperationGetCandidates waitUntilFinished](v20, "waitUntilFinished");
    }
    -[TIWordSearchOperationGetCandidates results](v20, "results");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v23);

    -[TIKeyboardInputManagerChinesePhonetic updateComposedText](self, "updateComposedText");
    v10 = 1;
LABEL_22:

    goto LABEL_23;
  }
  -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
  v10 = 1;
LABEL_23:

  return v10;
}

- (_NSRange)analysisStringRange
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (objc_msgSend(v5, "convertedLength") < v4)
  {
    -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "convertedLength");

  }
  if (-[TIKeyboardInputManagerChinesePhonetic filterCandidatesUsingInputIndex](self, "filterCandidatesUsingInputIndex"))
  {
    v8 = -[TIKeyboardInputManagerChinesePhonetic internalInputIndex](self, "internalInputIndex");
    if (v8 < v4 && v8 > v6)
      v4 = v8;
  }
  v10 = v4 - v6;
  v11 = v6;
  result.length = v10;
  result.location = v11;
  return result;
}

- (NSString)inputStringForSearch
{
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "asSearchString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[TIKeyboardInputManagerChinesePhonetic internalInputIndex](self, "internalInputIndex");
    -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "convertedLength");

    if (-[TIKeyboardInputManagerChinesePhonetic filterCandidatesUsingInputIndex](self, "filterCandidatesUsingInputIndex")&& v5 > v7&& v5 < objc_msgSend(v3, "length"))
    {
      objc_msgSend(v3, "substringToIndex:", v5);
      v8 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v8;
    }
    -[TIKeyboardInputManagerChinesePhonetic stringByStrippingConvertedCandidateTextFromString:](self, "stringByStrippingConvertedCandidateTextFromString:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
      v10 = v9;
    else
      v10 = v3;
    v4 = v10;

  }
  return (NSString *)v4;
}

- (NSString)unconvertedInput
{
  void *v3;
  void *v4;

  -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerChinesePhonetic stringByStrippingConvertedCandidateTextFromString:](self, "stringByStrippingConvertedCandidateTextFromString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)convertedInput
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertedCandidateText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)stringByStrippingConvertedCandidateTextFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asCommittedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v4, "length");
    if (v7 <= objc_msgSend(v6, "length"))
    {
      v8 = &stru_251980880;
    }
    else
    {
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v6, "length"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[TIKeyboardInputManagerChinesePhonetic conversionHistory](self, "conversionHistory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "convertedLength");

    if (v10 <= objc_msgSend(v4, "length"))
    {
      objc_msgSend(v4, "substringFromIndex:", v10);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = &stru_251980880;
    }
  }

  return v8;
}

- (id)stringByPrependingConvertedCandidateTextToString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asCommittedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TIKeyboardInputManagerChinesePhonetic convertedInput](self, "convertedInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "stringByAppendingString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)wordSearchEngineDidFindCandidates:(id)a3 forOperation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a4;
  v7 = a3;
  -[TIKeyboardInputManagerChinesePhonetic logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "markTime:", 4);

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __88__TIKeyboardInputManagerChinesePhonetic_wordSearchEngineDidFindCandidates_forOperation___block_invoke;
  v10[3] = &unk_2519802A0;
  objc_copyWeak(&v12, &location);
  v11 = v6;
  v9 = v6;
  -[TIKeyboardInputManagerMecabra addStickers:withCompletionHandler:](self, "addStickers:withCompletionHandler:", v7, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)wordSearchEngineDidFindPredictionCandidates:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  -[TIKeyboardInputManagerChinese wordSearchEngineDidFindPredictionCandidates:](&v4, sel_wordSearchEngineDidFindPredictionCandidates_, a3);
  if (-[TIKeyboardInputManagerChinesePhonetic isTypologyEnabled](self, "isTypologyEnabled"))
    -[TIKeyboardInputManagerMecabra logInputString](self, "logInputString");
}

- (void)updateComposedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "asInlineText");
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TIKeyboardInputManagerChinesePhonetic internalInputString](self, "internalInputString");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[TIKeyboardInputManagerChinesePhonetic candidateForInlineTextSegmentation](self, "candidateForInlineTextSegmentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "hasKindOf:", objc_opt_class()))
      {
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v7, "input");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "asCommittedText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "input");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingString:", v11);
        v12 = objc_claimAutoreleasedReturnValue();

        v15 = (id)v12;
        goto LABEL_9;
      }
    }
LABEL_10:
    -[TIKeyboardInputManagerChinesePhonetic composedTextForSelectedCandidate:remainingInput:](self, "composedTextForSelectedCandidate:remainingInput:", v4, v15);
    v13 = objc_claimAutoreleasedReturnValue();

LABEL_17:
    v14 = (id)v13;
    goto LABEL_18;
  }
  if (self->_isInAmbiguousMode)
  {
    if (self->_lockingPinyinSyllableSelection)
      -[TIKeyboardInputManagerChinesePhonetic composedTextBeforeFirstSyllableLocked](self, "composedTextBeforeFirstSyllableLocked");
    else
      objc_msgSend((id)objc_opt_class(), "stringFallBackForTenKeyInput:range:", v15, 0, objc_msgSend(v15, "length"));
    v13 = objc_claimAutoreleasedReturnValue();
    v7 = v15;
    goto LABEL_17;
  }
  v14 = v15;
LABEL_18:
  v16 = v14;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5490]), "setString:", v14);

}

- (BOOL)shouldDelayUpdateComposedText
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  return -[TIKeyboardInputManagerMecabra shouldDelayUpdateComposedText](&v4, sel_shouldDelayUpdateComposedText)
      || self->_isInAmbiguousMode;
}

- (BOOL)isPhraseBoundarySet
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;

  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "inputs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIKeyboardInputManagerMecabra syllableSeparator](self, "syllableSeparator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "externalSuffix:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length") != 0;

    }
    else
    {
      objc_msgSend(v7, "asInlineText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "asInlineTextCursorIndex");

      v13 = v17 < objc_msgSend(v15, "length");
    }
  }
  else
  {
    v14 = -[TIKeyboardInputManagerChinesePhonetic internalInputIndex](self, "internalInputIndex");
    return v14 != -[TIKeyboardInputManagerChinesePhonetic internalInputCount](self, "internalInputCount");
  }
  return v13;
}

- (TIKeyboardCandidate)candidateForInlineTextSegmentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  if (self->_isInAmbiguousMode)
  {
    v3 = 0;
  }
  else
  {
    -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentCandidate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v3 = 0;
  }
  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndex:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "isEqual:", v7);

  if (v8)
  {

    v3 = 0;
  }

  return (TIKeyboardCandidate *)v3;
}

- (int)inputMethodType
{
  return 0;
}

- (id)SegmentedPinyin:(id)a3 inputMethodType:(int)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t SyllableCount;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    if (a4 == 13)
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MecabraCandidateCopySyllableLengthArrayInAnalysisString();
      v10 = v9;
      if (v9)
      {
        v11 = objc_msgSend(v9, "count");
        if (v11 >= 1)
        {
          v12 = v11;
          v13 = 0;
          v14 = 0;
          do
          {
            objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (int)objc_msgSend(v15, "intValue");

            objc_msgSend(v7, "substringWithRange:", v14, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "appendString:", v17);
            if (++v13 < v12)
            {
              -[TIKeyboardInputManagerMecabra syllableSeparator](self, "syllableSeparator");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "appendString:", v18);

              v14 += v16;
            }

          }
          while (v12 != v13);
        }
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      MecabraSyllablesCreateWithString();
      SyllableCount = MecabraSyllablesGetSyllableCount();
      if (SyllableCount)
      {
        v20 = SyllableCount;
        for (i = 0; i != v20; ++i)
        {
          MecabraSyllablesGetSyllableAtIndex();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "length"))
          {
            if (objc_msgSend(v8, "length"))
            {
              -[TIKeyboardInputManagerMecabra syllableSeparator](self, "syllableSeparator");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "appendString:", v23);

            }
            objc_msgSend(v8, "appendString:", v22);
          }

        }
      }
      MecabraSyllablesRelease();
    }
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (id)segmentedInputFromString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t, uint64_t);
  void *v18;
  TIKeyboardInputManagerChinesePhonetic *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  __n128 (*v26)(__n128 *, __n128 *);
  uint64_t (*v27)();
  void *v28;
  __int128 v29;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = &v23;
    v25 = 0x4012000000;
    v26 = __Block_byref_object_copy__502;
    v27 = __Block_byref_object_dispose__503;
    v28 = &unk_248060BB3;
    v29 = xmmword_24805F1E0;
    v6 = objc_msgSend(v4, "length");
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __66__TIKeyboardInputManagerChinesePhonetic_segmentedInputFromString___block_invoke;
    v18 = &unk_2519801E0;
    v19 = self;
    v7 = v4;
    v20 = v7;
    v22 = &v23;
    v8 = v5;
    v21 = v8;
    objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 514, &v15);
    if (v24[6] != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v8, "length", v15, v16, v17, v18, v19, v20))
      {
        -[TIKeyboardInputManagerMecabra syllableSeparator](self, "syllableSeparator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendString:", v9);

      }
      objc_msgSend(v7, "substringWithRange:", v24[6], v24[7]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerChinesePhonetic SegmentedPinyin:inputMethodType:](self, "SegmentedPinyin:inputMethodType:", v10, -[TIKeyboardInputManagerChinesePhonetic inputMethodType](self, "inputMethodType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendString:", v11);

    }
    v12 = v21;
    v13 = v8;

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v13 = v4;
  }

  return v13;
}

- (BOOL)hasLockedSyllable
{
  void *v2;
  BOOL v3;

  -[TIKeyboardInputManagerChinesePhonetic replacedAmbiguousPinyinSyllables](self, "replacedAmbiguousPinyinSyllables");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)composedTextForSelectedCandidate:(id)a3 remainingInput:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, int, NSString *, _NSRange, uint64_t, _BYTE *);
  void *v45;
  id v46;
  TIKeyboardInputManagerChinesePhonetic *v47;
  __CFString *v48;
  _QWORD *v49;
  uint64_t *v50;
  uint64_t *v51;
  unint64_t v52;
  _QWORD v53[4];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;

  v6 = a3;
  v7 = a4;
  if (self->_isInAmbiguousMode
    && -[TIKeyboardInputManagerChinesePhonetic filterCandidatesUsingInputIndex](self, "filterCandidatesUsingInputIndex")
    && ((v8 = -[TIKeyboardInputManagerChinesePhonetic hasLockedSyllable](self, "hasLockedSyllable"),
         v9 = (int)*MEMORY[0x24BEB5490],
         v8)
     || (v10 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v9),
         -[TIKeyboardInputManagerChinesePhonetic composedTextBeforeFirstSyllableLocked](self, "composedTextBeforeFirstSyllableLocked"), v11 = (void *)objc_claimAutoreleasedReturnValue(), LOBYTE(v10) = objc_msgSend(v10, "isEqualToString:", v11), v11, (v10 & 1) == 0)))
  {
    v29 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v9);
  }
  else
  {
    v12 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v6);
    if (!self->_isInAmbiguousMode || v12 != 0)
    {
      v14 = v12;
      -[TIKeyboardInputManagerChinesePhonetic stringByStrippingConvertedCandidateTextFromString:](self, "stringByStrippingConvertedCandidateTextFromString:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "input");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = &stru_251980880;
      if (v16)
        v18 = (__CFString *)v16;
      v19 = v18;

      v20 = -[__CFString length](v19, "length");
      v21 = objc_msgSend(v15, "length");
      v22 = v21;
      if (self->_isInAmbiguousMode)
      {
        if (v21 < v20 || !v21)
          goto LABEL_37;
        v23 = (void *)MEMORY[0x24BEB4E80];
        -[TIKeyboardInputManagerMecabra syllableSeparator](self, "syllableSeparator");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "displayReadingFromMecabraCandidate:syllableSeparator:", v14, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = v22 - v20;
        if (v26)
        {
          objc_msgSend(MEMORY[0x24BDD16A8], "string");
          v28 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "length"))
            objc_msgSend(v28, "appendString:", v25);
          objc_msgSend((id)objc_opt_class(), "stringFallBackForTenKeyInput:range:", v15, v20, v26);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "appendString:", v40);

        }
        else
        {
          v27 = objc_msgSend(v25, "length") ? v25 : 0;
          v28 = v27;
        }

        if (!v28)
        {
LABEL_37:
          objc_msgSend((id)objc_opt_class(), "stringFallBackForTenKeyInput:range:", v15, 0, objc_msgSend(v15, "length"));
          v28 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_38;
      }
      v31 = (void *)MEMORY[0x24BEB4E80];
      -[TIKeyboardInputManagerMecabra syllableSeparator](self, "syllableSeparator");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "displayReadingFromMecabraCandidate:syllableSeparator:", v14, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 && (objc_msgSend(v15, "hasPrefix:", v19) & 1) != 0)
      {
        if (v6)
        {
          v28 = v33;
          if (v22 > v20)
          {
            -[TIKeyboardInputManagerChinesePhonetic segmentedInputFromString:](self, "segmentedInputFromString:", v15);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = 0;
            v59 = &v58;
            v60 = 0x2020000000;
            v61 = 1;
            v54 = 0;
            v55 = &v54;
            v56 = 0x2020000000;
            v57 = 0;
            v57 = objc_msgSend(v34, "length");
            v53[0] = 0;
            v53[1] = v53;
            v53[2] = 0x2020000000;
            v53[3] = 0;
            v35 = objc_msgSend(v34, "length");
            v42 = MEMORY[0x24BDAC760];
            v43 = 3221225472;
            v44 = __89__TIKeyboardInputManagerChinesePhonetic_composedTextForSelectedCandidate_remainingInput___block_invoke;
            v45 = &unk_251980230;
            v52 = v20;
            v49 = v53;
            v50 = &v54;
            v36 = v34;
            v46 = v36;
            v47 = self;
            v48 = v19;
            v51 = &v58;
            objc_msgSend(v36, "enumerateSubstringsInRange:options:usingBlock:", 0, v35, 514, &v42);
            if (*((_BYTE *)v59 + 24))
            {
              objc_msgSend(v36, "substringFromIndex:", v55[3], v42, v43, v44, v45, v46, v47);
              v37 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "stringByAppendingString:", v37);
              v38 = objc_claimAutoreleasedReturnValue();

              v28 = (id)v37;
            }
            else
            {
              v38 = 0;
            }

            _Block_object_dispose(v53, 8);
            _Block_object_dispose(&v54, 8);
            _Block_object_dispose(&v58, 8);

            v28 = (id)v38;
          }
          if (v28)
            goto LABEL_32;
        }
      }
      else
      {

        v6 = 0;
      }
      -[TIKeyboardInputManagerChinesePhonetic segmentedInputFromString:](self, "segmentedInputFromString:", v15, v42, v43, v44, v45);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      if (!v39)
        v39 = v15;
      v28 = v39;
LABEL_32:

LABEL_38:
      -[TIKeyboardInputManagerChinesePhonetic stringByPrependingConvertedCandidateTextToString:](self, "stringByPrependingConvertedCandidateTextToString:", v28, v42, v43, v44, v45);
      v30 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_39;
    }
    v29 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5490]);
  }
  v30 = v29;
  v15 = v7;
LABEL_39:

  return v30;
}

- (id)locale
{
  return 0;
}

- (BOOL)generateReanalysisCandidatesIfAppropriate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  TIWordSearchChinesePhoneticOperationGetCandidates *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  TIWordSearchChinesePhoneticOperationGetCandidates *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;

  -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerChinese language](self, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_stringByTranscribingFromLanguage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TIKeyboardInputManagerChinesePhonetic inputMethodType](self, "inputMethodType") == 5)
    v8 = CFSTR("Latin-Bopomofo");
  else
    v8 = (const __CFString *)*MEMORY[0x24BDBD668];
  objc_msgSend(v7, "_stringByApplyingTransform:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [TIWordSearchChinesePhoneticOperationGetCandidates alloc];
  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hardwareKeyboardMode");
  -[TIKeyboardInputManagerChinesePhonetic logger](self, "logger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = v13;
  BYTE2(v19) = 1;
  LOWORD(v19) = 257;
  v15 = -[TIWordSearchChinesePhoneticOperationGetCandidates initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:disambiguationCandidates:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:regenerateDisambiguationCandidates:predictionEnabled:reanalysisMode:target:action:geometryModelData:hardwareKeyboardMode:logger:](v10, "initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:disambiguationCandidates:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:regenerateDisambiguationCandidates:predictionEnabled:reanalysisMode:target:action:geometryModelData:hardwareKeyboardMode:logger:", v11, v9, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0x7FFFFFFFFFFFFFFFLL, v19, self, sel_wordSearchEngineDidFindCandidates_forOperation_, 0, v20, v14);

  -[TIWordSearchOperationGetCandidates results](v15, "results");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[TIWordSearchOperationGetCandidates results](v15, "results");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v17);
  }
  else
  {
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "performOperationAsync:", v15);
  }

  return v16 != 0;
}

- (BOOL)usesGeometryModelData
{
  void *v2;
  char v3;

  -[TIKeyboardInputManagerChinesePhonetic keyboardState](self, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hardwareKeyboardMode") ^ 1;

  return v3;
}

- (void)autocommitHeadSegmentWithContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerChinesePhonetic segments](self, "segments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x24BEB5308]);
    objc_msgSend(v11, "surface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reading");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithCandidateText:convertedInput:", v7, v8);

    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "composeNew:", v9);

  }
}

- (TIConversionHistory)conversionHistory
{
  return self->_conversionHistory;
}

- (void)setConversionHistory:(id)a3
{
  objc_storeStrong((id *)&self->_conversionHistory, a3);
}

- (NSString)remainingInput
{
  return self->_remainingInput;
}

- (void)setRemainingInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 904);
}

- (NSMutableArray)replacedAmbiguousPinyinSyllables
{
  return self->_replacedAmbiguousPinyinSyllables;
}

- (void)setReplacedAmbiguousPinyinSyllables:(id)a3
{
  objc_storeStrong((id *)&self->_replacedAmbiguousPinyinSyllables, a3);
}

- (NSMutableArray)replacementUnambiguousPinyinSyllables
{
  return self->_replacementUnambiguousPinyinSyllables;
}

- (void)setReplacementUnambiguousPinyinSyllables:(id)a3
{
  objc_storeStrong((id *)&self->_replacementUnambiguousPinyinSyllables, a3);
}

- (NSString)composedTextBeforeFirstSyllableLocked
{
  return self->_composedTextBeforeFirstSyllableLocked;
}

- (void)setComposedTextBeforeFirstSyllableLocked:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 928);
}

- (NSArray)pinyinSyllableCandidates
{
  return self->_pinyinSyllableCandidates;
}

- (void)setPinyinSyllableCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_pinyinSyllableCandidates, a3);
}

- (unint64_t)selectedPinyinSyllableCandidateIndex
{
  return self->_selectedPinyinSyllableCandidateIndex;
}

- (void)setSelectedPinyinSyllableCandidateIndex:(unint64_t)a3
{
  self->_selectedPinyinSyllableCandidateIndex = a3;
}

- (TIMecabraIMLogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (BOOL)filterCandidatesUsingInputIndex
{
  return self->_filterCandidatesUsingInputIndex;
}

- (void)setFilterCandidatesUsingInputIndex:(BOOL)a3
{
  self->_filterCandidatesUsingInputIndex = a3;
}

- (BOOL)shouldAdvanceSyllableSelection
{
  return self->_shouldAdvanceSyllableSelection;
}

- (void)setShouldAdvanceSyllableSelection:(BOOL)a3
{
  self->_shouldAdvanceSyllableSelection = a3;
}

- (TIKeyboardCandidateResultSet)mostRecentCandidateResultSetPendingDisplay
{
  return self->_mostRecentCandidateResultSetPendingDisplay;
}

- (void)setMostRecentCandidateResultSetPendingDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentCandidateResultSetPendingDisplay, a3);
}

- (BOOL)skipSetMarkedTextDuringInput
{
  return self->_skipSetMarkedTextDuringInput;
}

- (void)setSkipSetMarkedTextDuringInput:(BOOL)a3
{
  self->_skipSetMarkedTextDuringInput = a3;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_storeStrong((id *)&self->_segments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_mostRecentCandidateResultSetPendingDisplay, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_pinyinSyllableCandidates, 0);
  objc_storeStrong((id *)&self->_composedTextBeforeFirstSyllableLocked, 0);
  objc_storeStrong((id *)&self->_replacementUnambiguousPinyinSyllables, 0);
  objc_storeStrong((id *)&self->_replacedAmbiguousPinyinSyllables, 0);
  objc_storeStrong((id *)&self->_remainingInput, 0);
  objc_storeStrong((id *)&self->_conversionHistory, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_candidateData, 0);
}

void __89__TIKeyboardInputManagerChinesePhonetic_composedTextForSelectedCandidate_remainingInput___block_invoke(uint64_t a1, int a2, NSString *a3, _NSRange a4, uint64_t a5, _BYTE *a6)
{
  uint64_t v8;
  NSUInteger length;
  KB *v11;
  NSString *v12;
  char v13;
  _NSRange v14;
  _BYTE v15[32];
  _BYTE v16[32];
  uint64_t v17;
  _NSRange v18;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + v8) <= *(_QWORD *)(a1 + 80))
  {
    length = v18.length;
    v18.location = v18.length;
    KB::utf8_substring(*(KB **)(a1 + 32), a3, v18);
    objc_msgSend(*(id *)(a1 + 40), "syllableSeparator");
    v11 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v11, v12);
    v13 = KB::String::equal((KB::String *)v16, (const KB::String *)v15);
    KB::String::~String((KB::String *)v15);

    if ((v13 & 1) == 0)
    {
      v14.location = length;
      KB::utf8_substring(*(KB **)(a1 + 48), *(NSString **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v14);
      if ((KB::String::equal((KB::String *)v16, (const KB::String *)v15) & 1) != 0)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += length;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        *a6 = 1;
      }
      KB::String::~String((KB::String *)v15);
    }
    KB::String::~String((KB::String *)v16);
  }
  else
  {
    *a6 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;
  }
}

void __66__TIKeyboardInputManagerChinesePhonetic_segmentedInputFromString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  if (a4 == 1
    && (objc_msgSend(*(id *)(a1 + 32), "validCharacterSetForSegmentation"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(*(id *)(a1 + 40), "characterAtIndex:", a3)),
        v7,
        v8))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = v19;
    if (*(_QWORD *)(v9 + 48) == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_QWORD *)(v9 + 48) = a3;
      *(_QWORD *)(v9 + 56) = 1;
    }
    else
    {
      ++*(_QWORD *)(v9 + 56);
    }
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48) != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(*(id *)(a1 + 48), "length"))
      {
        v11 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 32), "syllableSeparator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendString:", v12);

      }
      v13 = *(void **)(a1 + 32);
      v14 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "SegmentedPinyin:inputMethodType:", v15, objc_msgSend(*(id *)(a1 + 32), "inputMethodType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendString:", v16);

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48) = 0x7FFFFFFFFFFFFFFFLL;
    }
    v17 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a3, a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendString:", v18);

    v10 = v19;
  }

}

void __88__TIKeyboardInputManagerChinesePhonetic_wordSearchEngineDidFindCandidates_forOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  const void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char isKindOfClass;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  BOOL v45;
  id v46;
  id v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  void *v66;
  unint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  char v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  NSObject *v86;
  os_signpost_id_t v87;
  os_signpost_id_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  uint64_t v94;
  const void *v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  unsigned int *v101;
  uint8_t buf[8];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_73;
  objc_msgSend(WeakRetained, "composingInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composingInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (const void *)arc4random();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    kdebug_trace();
    kac_get_log();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_make_with_pointer(v9, v8);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_248040000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "kbdCPMecabraSetMarkedText", " enableTelemetry=YES ", buf, 2u);
      }
    }

  }
  objc_msgSend(v5, "setWordSearchCandidateResultSet:", v3);
  objc_msgSend(v5, "updateComposedText");
  objc_msgSend(v5, "setMarkedText");
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v3, "candidates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "segmentsFromCandidate:phraseBoundary:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSegments:", v14);

  }
  objc_msgSend(v5, "wordSearchCandidateResultSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rawInputString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateProactiveCandidatesForCandidateResultSet:withInput:", v15, v16);

  objc_msgSend(v5, "wordSearchCandidateResultSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateResultSetFromWordSearchCandidateResultSet:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *(id *)(a1 + 32);
  objc_msgSend(v19, "keyboardInput");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v8;
  v96 = v18;
  if ((objc_msgSend(v20, "hasDrawInput") & 1) != 0
    && (objc_msgSend(v19, "lastAcceptCandidateInput"), (v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v22 = (void *)v21;
    v23 = v3;
    objc_msgSend(v19, "lastAcceptCandidateInput");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "remainingMecabraInputs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
    {

      v3 = v23;
      v18 = v96;
    }
    else
    {
      objc_msgSend(v19, "lastAcceptCandidateInput");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "remainingInputString");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v55, "length");

      v3 = v23;
      v18 = v96;
      if (!v94)
      {
        objc_msgSend(v19, "keyboardInput");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "asInlineText");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setCommittedText:", v57);

        objc_msgSend(v5, "composingInput");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "removeAllInputs");

        objc_msgSend(v5, "keyboardState");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "documentState");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "documentStateAfterUnmarkingText");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "keyboardState");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setDocumentState:", v61);

        v18 = v96;
        objc_msgSend(v5, "updateComposedText");
        objc_msgSend(v5, "setMarkedText");
      }
    }
  }
  else
  {

  }
  if (objc_msgSend(v5, "isTypologyEnabled"))
  {
    objc_msgSend(v5, "keyboardState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "documentState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "selectedText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    v18 = v96;
    if (!v29)
      objc_msgSend(v5, "logInputString");
  }
  objc_msgSend(v19, "keyboardInput");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "composingInput");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "keyboardInput");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "inputs");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "count") != 1)
    goto LABEL_21;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && objc_msgSend(v31, "isComplete"))
  {
    objc_msgSend(v3, "candidates");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "candidate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "_graphemeCount");

    objc_msgSend(v5, "typingSessionMonitor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboardState");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addDrawInputWithSyllableCount:keyboardState:", v37, v38);

LABEL_21:
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "composingInput");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "inputs");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");
      objc_msgSend(v19, "keyboardInput");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "inputs");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v3;
      v44 = objc_msgSend(v43, "count");

      v45 = v41 == v44;
      v18 = v96;
      v3 = v93;
      if (v45)
      {
        v46 = v7;
        v47 = v31;
        objc_msgSend(v19, "keyboardInput");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "totalDrawSamples");

        if ((int)objc_msgSend(MEMORY[0x24BEB5400], "maxNumberOfDrawSamples") >= v49)
        {
LABEL_44:

          goto LABEL_45;
        }
        v92 = v47;
        objc_msgSend(v5, "composingInput");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "inputs");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (id)objc_msgSend(v5, "convertInputsToSyntheticInputUptoCount:", objc_msgSend(v51, "count"));

        v53 = objc_alloc(MEMORY[0x24BEB5318]);
        if (v46)
        {
          objc_msgSend(v46, "keyboardLayout");
          objc_msgSend(v46, "rescaleKeyboardLayout");
        }
        else
        {
          v101 = 0;
          *(_QWORD *)buf = 0;
        }
        v63 = (void *)objc_msgSend(v53, "initWithKeyboardLayout:rescaleKeyboardLayout:shouldResample:", buf, &v101, objc_msgSend(v5, "shouldResample"));
        if (v101)
          WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v101);
        if (*(_QWORD *)buf)
          WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(*(unsigned int **)buf);
        objc_msgSend(v92, "inputs");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v65) = objc_msgSend(v64, "count");

        objc_msgSend(v46, "inputs");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "count");

        if (v67 > (int)v65)
        {
          v65 = (int)v65;
          do
          {
            objc_msgSend(v46, "inputs");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "objectAtIndexedSubscript:", v65);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "composeNew:", v69);

            ++v65;
            objc_msgSend(v46, "inputs");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "count");

          }
          while (v71 > v65);
        }
        objc_msgSend(v63, "inputs");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v72, "count"))
        {
          objc_msgSend(v46, "inputs");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v73, "count");

          if (!v74)
          {
LABEL_43:
            objc_msgSend(v5, "composingInput");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "composeNew:", v63);

            v47 = v92;
            v3 = v93;
            goto LABEL_44;
          }
          objc_msgSend(v46, "inputs");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "lastObject");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "composeNew:", v75);

        }
        goto LABEL_43;
      }
    }
  }
LABEL_45:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_61:
    if (objc_msgSend(v5, "closeCandidateGenerationContextWithResults:", v18))
      v85 = 0;
    else
      v85 = v18;
    objc_msgSend(v5, "setMostRecentCandidateResultSetPendingDisplay:", v85);
    goto LABEL_65;
  }
  if (!objc_msgSend(v7, "isComplete"))
  {
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    objc_msgSend(MEMORY[0x24BEB5460], "sharedOperationQueue");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "operations");
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v81 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
    if (v81)
    {
      v82 = v81;
      v83 = *(_QWORD *)v98;
      while (2)
      {
        for (i = 0; i != v82; ++i)
        {
          if (*(_QWORD *)v98 != v83)
            objc_enumerationMutation(v78);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * i), "isMemberOfClass:", objc_opt_class()))
          {
            v18 = v96;
            objc_msgSend(v96, "setInputManagerHasPendingCandidatesUpdate:", 1);
            goto LABEL_60;
          }
        }
        v82 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
        if (v82)
          continue;
        break;
      }
      v18 = v96;
    }
    goto LABEL_60;
  }
  objc_msgSend(v19, "keyboardInput");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "composingInput");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_60:

    goto LABEL_61;
  }
  v79 = objc_msgSend(v78, "isComplete");

  if ((v79 & 1) != 0)
    goto LABEL_61;
LABEL_65:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    kdebug_trace();
    kac_get_log();
    v86 = (id)objc_claimAutoreleasedReturnValue();
    v87 = os_signpost_id_make_with_pointer(v86, v95);
    if (v87 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v88 = v87;
      if (os_signpost_enabled(v86))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_248040000, v86, OS_SIGNPOST_INTERVAL_END, v88, "kbdCPMecabraSetMarkedText", " enableTelemetry=YES ", buf, 2u);
      }
    }

  }
  objc_msgSend(v5, "logger");
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    objc_msgSend(v5, "logger");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internalInputString");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "endLoggingForInput:atFinalTimeMark:", v91, 5);

  }
LABEL_73:

}

void __68__TIKeyboardInputManagerChinesePhonetic_hasExtensionEmojiCandidates__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isEmojiCandidate") && objc_msgSend(v6, "isExtensionCandidate"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __47__TIKeyboardInputManagerChinesePhonetic_resume__block_invoke()
{
  id v0;

  _TIQueueBackground();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  TIDispatchAsync();

}

id __47__TIKeyboardInputManagerChinesePhonetic_resume__block_invoke_2()
{
  return (id)objc_msgSend(CFSTR("a"), "_stringByConvertingFromHalfWidthToFullWidth");
}

uint64_t __57__TIKeyboardInputManagerChinesePhonetic_deleteFromInput___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  result = objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(_QWORD *)(v10 + 24) + 1;
  *(_QWORD *)(v10 + 24) = v11;
  if (v11 == 2)
    *a7 = 1;
  return result;
}

_QWORD *__59__TIKeyboardInputManagerChinesePhonetic_internalInputIndex__block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v7;
  unint64_t v8;

  *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) += a4;
  v7 = *(_QWORD *)(result[5] + 8);
  v8 = *(_QWORD *)(v7 + 24) + 1;
  *(_QWORD *)(v7 + 24) = v8;
  if (v8 >= result[6])
    *a7 = 1;
  return result;
}

void __60__TIKeyboardInputManagerChinesePhonetic_addInputToInternal___block_invoke(uint64_t a1, int a2, NSString *a3, _NSRange a4)
{
  _BYTE v5[32];
  uint64_t v6;
  _NSRange v7;

  v6 = *MEMORY[0x24BDAC8D0];
  v7.location = v7.length;
  KB::utf8_substring(*(KB **)(a1 + 40), a3, v7);
  TIInputManager::add_input();
  KB::String::~String((KB::String *)v5);
}

void __62__TIKeyboardInputManagerChinesePhonetic_addInput_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  void *v15;
  id v16;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "touchEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v7 = v6;
    v9 = v8;

    if (objc_msgSend(*(id *)(a1 + 40), "shouldRescaleTouchPoints"))
    {
      v11 = *MEMORY[0x24BDBEFB0];
      v10 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      if (v7 != *MEMORY[0x24BDBEFB0] || v9 != v10)
      {
        objc_msgSend(*(id *)(a1 + 40), "currentCharacterKeysLayoutFrame");
        objc_msgSend(*(id *)(a1 + 40), "baseCharacterKeysLayoutFrame");
        TI_GET_SCALED_POINT();
        v11 = v13;
        v10 = v14;
      }
    }
    else
    {
      v10 = v9;
      v11 = v7;
    }
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB5338]), "initWithCharacters:point:nearbyKeys:sourceKeyboardState:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v11, v10);

    objc_msgSend(*(id *)(a1 + 40), "composingInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "composeNew:", v16);

  }
}

void __89__TIKeyboardInputManagerChinesePhonetic_externalIndexToInternal_shouldBoundToInputCount___block_invoke(uint64_t a1, int a2, NSString *a3, _NSRange a4)
{
  KB *v6;
  NSString *v7;
  char v8;
  _BYTE v9[32];
  _BYTE v10[32];
  uint64_t v11;
  _NSRange v12;

  v11 = *MEMORY[0x24BDAC8D0];
  v12.location = v12.length;
  KB::utf8_substring(*(KB **)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BEB5490]), a3, v12);
  objc_msgSend(*(id *)(a1 + 32), "syllableSeparator");
  v6 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v6, v7);
  v8 = KB::String::equal((KB::String *)v10, (const KB::String *)v9);
  KB::String::~String((KB::String *)v9);

  KB::String::~String((KB::String *)v10);
  if ((v8 & 1) == 0)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __65__TIKeyboardInputManagerChinesePhonetic_internalIndexToExternal___block_invoke(uint64_t a1, int a2, NSString *a3, _NSRange a4, uint64_t a5, _BYTE *a6)
{
  NSUInteger length;
  KB *v9;
  NSString *v10;
  int v11;
  void *v12;
  _BYTE v13[32];
  _BYTE v14[32];
  uint64_t v15;
  _NSRange v16;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)a3 >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *a6 = 1;
  }
  else
  {
    length = v16.length;
    v16.location = v16.length;
    KB::utf8_substring(*(KB **)(a1 + 32), a3, v16);
    objc_msgSend(*(id *)(a1 + 40), "syllableSeparator");
    v9 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v9, v10);
    v11 = KB::String::equal((KB::String *)v14, (const KB::String *)v13);
    KB::String::~String((KB::String *)v13);

    KB::String::~String((KB::String *)v14);
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "syllableSeparator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v12, "length");

    }
    else if (length >= 2)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = length
                                                                  + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 24)
                                                                  - 1;
    }
  }
}

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

+ (id)ambiguousPinyinSet
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)+[TIKeyboardInputManagerChinesePhonetic ambiguousPinyinSet]::_ambiguousPinyinSet;
  if (!+[TIKeyboardInputManagerChinesePhonetic ambiguousPinyinSet]::_ambiguousPinyinSet)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("➋➌➍➎➏➐➑➒"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)+[TIKeyboardInputManagerChinesePhonetic ambiguousPinyinSet]::_ambiguousPinyinSet;
    +[TIKeyboardInputManagerChinesePhonetic ambiguousPinyinSet]::_ambiguousPinyinSet = v3;

    v2 = (void *)+[TIKeyboardInputManagerChinesePhonetic ambiguousPinyinSet]::_ambiguousPinyinSet;
  }
  return v2;
}

+ (id)ambiguousAndPinyinCharacterSet
{
  if (+[TIKeyboardInputManagerChinesePhonetic ambiguousAndPinyinCharacterSet]::__onceToken != -1)
    dispatch_once(&+[TIKeyboardInputManagerChinesePhonetic ambiguousAndPinyinCharacterSet]::__onceToken, &__block_literal_global_536);
  return (id)+[TIKeyboardInputManagerChinesePhonetic ambiguousAndPinyinCharacterSet]::__ambiguousAndPinyinCharacterSet;
}

+ (id)ambiguousDefaults
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)+[TIKeyboardInputManagerChinesePhonetic ambiguousDefaults]::_ambiguousDefaults;
  if (!+[TIKeyboardInputManagerChinesePhonetic ambiguousDefaults]::_ambiguousDefaults)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("a"), CFSTR("➋"), CFSTR("d"), CFSTR("➌"), CFSTR("g"), CFSTR("➍"), CFSTR("j"), CFSTR("➎"), CFSTR("m"), CFSTR("➏"), CFSTR("p"), CFSTR("➐"), CFSTR("t"), CFSTR("➑"), CFSTR("w"), CFSTR("➒"), 0);
    v4 = (void *)+[TIKeyboardInputManagerChinesePhonetic ambiguousDefaults]::_ambiguousDefaults;
    +[TIKeyboardInputManagerChinesePhonetic ambiguousDefaults]::_ambiguousDefaults = v3;

    v2 = (void *)+[TIKeyboardInputManagerChinesePhonetic ambiguousDefaults]::_ambiguousDefaults;
  }
  return v2;
}

+ (id)directlyCommittedCharacterSetForEmptyInline
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__TIKeyboardInputManagerChinesePhonetic_directlyCommittedCharacterSetForEmptyInline__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[TIKeyboardInputManagerChinesePhonetic directlyCommittedCharacterSetForEmptyInline]::__onceToken != -1)
    dispatch_once(&+[TIKeyboardInputManagerChinesePhonetic directlyCommittedCharacterSetForEmptyInline]::__onceToken, block);
  return (id)+[TIKeyboardInputManagerChinesePhonetic directlyCommittedCharacterSetForEmptyInline]::__committedCharacterSetForEmptyInline;
}

+ (id)stringFallBackForTenKeyInput:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  length = a4.length;
  location = a4.location;
  v7 = (void *)MEMORY[0x24BDD16A8];
  v8 = a3;
  objc_msgSend(v7, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __76__TIKeyboardInputManagerChinesePhonetic_stringFallBackForTenKeyInput_range___block_invoke;
  v12[3] = &unk_251980208;
  v14 = a1;
  v10 = v9;
  v13 = v10;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", location, length, 2, v12);

  return v10;
}

+ (unint64_t)maxNumberOfUncommittedSegments
{
  return 3;
}

void __76__TIKeyboardInputManagerChinesePhonetic_stringFallBackForTenKeyInput_range___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "ambiguousDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
    v6 = v7;
  else
    v6 = v4;
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v6);

}

void __84__TIKeyboardInputManagerChinesePhonetic_directlyCommittedCharacterSetForEmptyInline__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1690], "letterCharacterSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ambiguousPinyinSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formUnionWithCharacterSet:", v0);

  objc_msgSend(v3, "invertedSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[TIKeyboardInputManagerChinesePhonetic directlyCommittedCharacterSetForEmptyInline]::__committedCharacterSetForEmptyInline;
  +[TIKeyboardInputManagerChinesePhonetic directlyCommittedCharacterSetForEmptyInline]::__committedCharacterSetForEmptyInline = v1;

}

void __71__TIKeyboardInputManagerChinesePhonetic_ambiguousAndPinyinCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("➋➌➍➎➏➐➑➒abcdefghijklmnopqrstuvwxyz'"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[TIKeyboardInputManagerChinesePhonetic ambiguousAndPinyinCharacterSet]::__ambiguousAndPinyinCharacterSet;
  +[TIKeyboardInputManagerChinesePhonetic ambiguousAndPinyinCharacterSet]::__ambiguousAndPinyinCharacterSet = v0;

}

@end
