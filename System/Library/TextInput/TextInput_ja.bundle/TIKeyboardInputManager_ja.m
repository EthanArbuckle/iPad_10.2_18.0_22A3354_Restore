@implementation TIKeyboardInputManager_ja

- (TIKeyboardInputManager_ja)initWithConfig:(id)a3 keyboardState:(id)a4
{
  TIKeyboardInputManager_ja *v4;
  NSMutableArray *v5;
  NSMutableArray *recentlyCommittedCandidatesForReanalysis;
  TISmartPunctuationController *v7;
  TISmartPunctuationController *smartPunctuationController;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_ja;
  v4 = -[TIKeyboardInputManagerMecabra initWithConfig:keyboardState:](&v11, sel_initWithConfig_keyboardState_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    recentlyCommittedCandidatesForReanalysis = v4->_recentlyCommittedCandidatesForReanalysis;
    v4->_recentlyCommittedCandidatesForReanalysis = v5;

    v7 = (TISmartPunctuationController *)objc_alloc_init(MEMORY[0x24BEB4EB0]);
    smartPunctuationController = v4->_smartPunctuationController;
    v4->_smartPunctuationController = v7;

    -[TISmartPunctuationController setAutoQuoteType:](v4->_smartPunctuationController, "setAutoQuoteType:", 1);
    -[TISmartPunctuationController setSmartDashesEnabled:](v4->_smartPunctuationController, "setSmartDashesEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_preferencesDidChange_, *MEMORY[0x24BEB50F8], 0);

    -[TIKeyboardInputManager_ja preferencesDidChange:](v4, "preferencesDidChange:", 0);
    -[TIKeyboardInputManager_ja setFlickUsed:](v4, "setFlickUsed:", 0);
  }
  return v4;
}

- (void)initImplementation
{
  void *result;
  uint64_t v3;

  result = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (!result)
  {
    v3 = operator new();
    return (void *)MEMORY[0x234902528](v3);
  }
  return result;
}

- (id)keyEventMap
{
  void *v3;
  int v4;
  objc_super v6;

  -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hardwareKeyboardMode");

  if (v4)
    return objc_alloc_init(MEMORY[0x24BEB4D58]);
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManager_ja keyEventMap](&v6, sel_keyEventMap);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dictionaryInputMode
{
  return (id)objc_msgSend(MEMORY[0x24BEB5390], "inputModeWithIdentifier:", CFSTR("en_US"));
}

- (void)loadFavoniusTypingModel
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  objc_super v6;
  uint64_t v7;
  std::__shared_weak_count *v8;

  if (self->_isCandidateSelectionSuppressed)
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_ja;
    -[TIKeyboardInputManager_ja loadFavoniusTypingModel](&v6, sel_loadFavoniusTypingModel);
  }
  else
  {
    v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
    v7 = 0;
    v8 = 0;
    std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100]((_QWORD *)(v2 + 232), &v7);
    v3 = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TIKeyboardInputManager_ja setIsEmojiFacemarkMode:](self, "setIsEmojiFacemarkMode:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManagerMecabra dealloc](&v4, sel_dealloc);
}

- (void)resume
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_mecabraLearningValidator_, *MEMORY[0x24BEDC830], 0);

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManagerMecabra resume](&v4, sel_resume);
}

- (void)suspend
{
  void *v3;
  objc_super v4;

  -[TIWordSearch resetPreviousWord](self->_kbws, "resetPreviousWord");
  -[TIWordSearch clearCache](self->_kbws, "clearCache");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEDC830], 0);

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManagerMecabra suspend](&v4, sel_suspend);
}

- (BOOL)supportsPerRecipientLearning
{
  return 1;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int isCandidateSelectionSuppressed;
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
    v13.super_class = (Class)TIKeyboardInputManager_ja;
    -[TIKeyboardInputManagerMecabra syncToKeyboardState:from:afterContextChange:](&v13, sel_syncToKeyboardState_from_afterContextChange_, v8, v9, v5);
    isCandidateSelectionSuppressed = self->_isCandidateSelectionSuppressed;
    if (isCandidateSelectionSuppressed != objc_msgSend(v8, "suppressingCandidateSelection"))
    {
      self->_isCandidateSelectionSuppressed = objc_msgSend(v8, "suppressingCandidateSelection");
      -[TIKeyboardInputManager_ja loadFavoniusTypingModel](self, "loadFavoniusTypingModel");
    }
  }

}

- (BOOL)usesLiveConversion
{
  int v3;

  v3 = -[TIKeyboardInputManager_ja liveConversionEnabled](self, "liveConversionEnabled");
  if (v3)
    LOBYTE(v3) = -[TIKeyboardInputManager_ja inHardwareKeyboardMode](self, "inHardwareKeyboardMode");
  return v3;
}

- (id)wordSearch
{
  return self->_kbws;
}

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (BOOL)ignoresDeadKeys
{
  return 1;
}

- (id)liveConversionTextInputManager
{
  return 0;
}

- (void)setIsEmojiFacemarkMode:(BOOL)a3
{
  if (!a3)
    -[TIKeyboardInputManager_ja setAlternateDisplayString:](self, "setAlternateDisplayString:", 0);
  self->_isEmojiFacemarkMode = a3;
}

- (void)syncToLayoutState:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_ja;
  v4 = a3;
  -[TIKeyboardInputManager_ja syncToLayoutState:](&v6, sel_syncToLayoutState_, v4);
  v5 = objc_msgSend(v4, "isKanaPlane", v6.receiver, v6.super_class);

  -[TIKeyboardInputManager_ja setIsKanaPlane:](self, "setIsKanaPlane:", v5);
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  int v28;
  const __CFString *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  objc_super v36;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleKeyboardInput:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_33;
  objc_msgSend(v4, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("\n")) & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v4, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR(" ")))
  {

LABEL_5:
LABEL_6:
    -[TIWordSearch resetPreviousWord](self->_kbws, "resetPreviousWord");
    goto LABEL_7;
  }
  objc_msgSend(v4, "string");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("　"));

  if ((v27 & 1) != 0)
    goto LABEL_6;
LABEL_7:
  objc_msgSend(v4, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("\x1B"));

  if (v10)
  {
    -[TIKeyboardInputManager_ja clearInput](self, "clearInput");
    v6 = 0;
    goto LABEL_33;
  }
  if (!-[TIKeyboardInputManager_ja shouldInvokeLiveConversion:](self, "shouldInvokeLiveConversion:", v4))
    goto LABEL_13;
  -[TIKeyboardInputManager_ja liveConversionTextInputManager](self, "liveConversionTextInputManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra composeTextWith:](self, "composeTextWith:", v11);

  if (-[TIKeyboardInputManager_ja inputCount](self, "inputCount"))
  {
    v12 = objc_alloc_init(MEMORY[0x24BEB4E28]);
    -[TIKeyboardInputManager_ja rawInputString](self, "rawInputString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setString:", v13);

    v14 = objc_alloc(MEMORY[0x24BEB53B8]);
    -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithKeyboardState:", v15);

    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addInput:withContext:", v12, v16);

  }
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleKeyboardInput:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_13:
    -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "hardwareKeyboardMode");

    if ((v20 & 1) != 0)
      goto LABEL_32;
    -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layoutState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "userInterfaceIdiom");

    objc_msgSend(v4, "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23 == 1)
    {
      if (objc_msgSend(v24, "isEqualToString:", CFSTR(" ")))
      {

        goto LABEL_24;
      }
      objc_msgSend(v4, "string");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("　"));

      if (v31)
      {
LABEL_24:
        if (!-[TIKeyboardInputManager_ja isKanaPlane](self, "isKanaPlane"))
        {
          -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "shiftState");

          if (v33 != 1)
            goto LABEL_32;
        }
        if (-[TIKeyboardInputManager_ja shouldOutputFullwidthSpace](self, "shouldOutputFullwidthSpace"))
          v29 = CFSTR("　");
        else
          v29 = CFSTR(" ");
        goto LABEL_29;
      }
LABEL_32:
      v36.receiver = self;
      v36.super_class = (Class)TIKeyboardInputManager_ja;
      -[TIKeyboardInputManagerMecabra handleKeyboardInput:](&v36, sel_handleKeyboardInput_, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    v28 = objc_msgSend(v24, "isEqualToString:", CFSTR("　"));

    if (!v28)
      goto LABEL_32;
    if (-[TIKeyboardInputManager_ja isKanaPlane](self, "isKanaPlane"))
    {
      if (!-[TIKeyboardInputManager_ja shouldOutputFullwidthSpace](self, "shouldOutputFullwidthSpace"))
      {
LABEL_22:
        v29 = CFSTR(" ");
LABEL_29:
        objc_msgSend(v4, "setString:", v29);
        goto LABEL_32;
      }
    }
    else if (!-[TIKeyboardInputManager_ja shouldOutputFullwidthSpaceForKanaABC123](self, "shouldOutputFullwidthSpaceForKanaABC123"))
    {
      goto LABEL_22;
    }
    objc_msgSend(v4, "string");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setString:", v34);

    goto LABEL_32;
  }
LABEL_33:

  return v6;
}

- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6
{
  double y;
  double x;
  uint64_t v9;
  id v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  objc_super v17;

  y = a5.y;
  x = a5.x;
  v9 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = v11;
  if (v11 && objc_msgSend(v11, "length"))
  {
    if (-[TIKeyboardInputManager_ja shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
    {
      v17.receiver = self;
      v17.super_class = (Class)TIKeyboardInputManager_ja;
      -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v17, sel_addInput_flags_point_firstDelete_, v12, v9, a6, x, y);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if ((v9 & 8) != 0)
        *a6 = 1;
    }
    else
    {
      -[TIKeyboardInputManager_ja setIsEmojiFacemarkMode:](self, "setIsEmojiFacemarkMode:", 0);
      -[TIKeyboardInputManager_ja setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
      if (objc_msgSend(v12, "length") == 1)
      {
        -[TIKeyboardInputManager_ja _addInput:point:](self, "_addInput:point:", v12, x, y);
      }
      else if (objc_msgSend(v12, "length"))
      {
        v14 = 0;
        do
        {
          objc_msgSend(v12, "substringWithRange:", v14, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager_ja _addInput:point:](self, "_addInput:point:", v15, x, y);

          ++v14;
        }
        while (objc_msgSend(v12, "length") > v14);
      }
      v13 = v12;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_addInput:(id)a3 point:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id v8;
  unsigned int v9;
  objc_super v10;
  uint64_t v11;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v11 = 0;
  -[TIKeyboardInputManager_ja _cancelCandidatesThread](self, "_cancelCandidatesThread");
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_ja;
  v8 = -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v10, sel_addInput_flags_point_firstDelete_, v7, 0, &v11, x, y);
  v9 = -[TIKeyboardInputManager_ja inputCount](self, "inputCount");
  if (v9 == -[TIKeyboardInputManager_ja inputIndex](self, "inputIndex"))
    self->_isPhraseBoundarySet = 0;

}

- (void)_deleteFromInput
{
  id v3;
  objc_super v4;
  uint64_t v5;

  v5 = 0;
  -[TIKeyboardInputManager_ja _cancelCandidatesThread](self, "_cancelCandidatesThread");
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja;
  v3 = -[TIKeyboardInputManager_ja deleteFromInput:](&v4, sel_deleteFromInput_, &v5);
}

- (void)setInput:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[TIKeyboardInputManager_ja _cancelCandidatesThread](self, "_cancelCandidatesThread");
  self->_isPhraseBoundarySet = 0;
  -[TIKeyboardInputManager_ja setIsEmojiFacemarkMode:](self, "setIsEmojiFacemarkMode:", 0);
  -[TIKeyboardInputManager_ja setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManager_ja setInput:](&v5, sel_setInput_, v4);

}

- (id)deleteFromInput:(unint64_t *)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  objc_super v12;

  if (-[TIKeyboardInputManager_ja shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    v12.receiver = self;
    v12.super_class = (Class)TIKeyboardInputManager_ja;
    -[TIKeyboardInputManager_ja deleteFromInput:](&v12, sel_deleteFromInput_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[TIKeyboardInputManager_ja isEmojiFacemarkMode](self, "isEmojiFacemarkMode"))
    {
      -[TIKeyboardInputManager_ja clearInput](self, "clearInput");
    }
    else
    {
      self->_remainingInputLength = 0;
      -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "documentState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "selectedRangeInMarkedText");
      v9 = v8;

      if (v9 <= 1)
        v10 = 1;
      else
        v10 = v9;
      if (a3)
        *a3 = v10;
      do
      {
        -[TIKeyboardInputManager_ja _deleteFromInput](self, "_deleteFromInput");
        --v10;
      }
      while (v10);
      if (!-[TIKeyboardInputManager_ja inputCount](self, "inputCount"))
      {
        -[TIKeyboardInputManager_ja setFlickUsed:](self, "setFlickUsed:", 0);
        -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
      }
      -[TIKeyboardInputManager_ja setIsEmojiFacemarkMode:](self, "setIsEmojiFacemarkMode:", 0);
      -[TIKeyboardInputManager_ja setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
    }
    v5 = 0;
  }
  return v5;
}

- (void)clearInput
{
  objc_super v3;

  -[TIKeyboardInputManager_ja setFlickUsed:](self, "setFlickUsed:", 0);
  -[TIKeyboardInputManager_ja _cancelCandidatesThread](self, "_cancelCandidatesThread");
  -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
  -[TIWordSearch clearCache](self->_kbws, "clearCache");
  self->_isPhraseBoundarySet = 0;
  -[TIKeyboardInputManager_ja setIsEmojiFacemarkMode:](self, "setIsEmojiFacemarkMode:", 0);
  -[TIKeyboardInputManager_ja setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManagerMecabra clearInput](&v3, sel_clearInput);
}

- (void)inputLocationChanged
{
  objc_super v3;

  -[TIKeyboardInputManager_ja _cancelCandidatesThread](self, "_cancelCandidatesThread");
  -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
  -[TIWordSearch clearCache](self->_kbws, "clearCache");
  self->_isPhraseBoundarySet = 0;
  -[TIKeyboardInputManager_ja setIsEmojiFacemarkMode:](self, "setIsEmojiFacemarkMode:", 0);
  -[TIKeyboardInputManager_ja setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
  -[TIWordSearch resetPreviousWord](self->_kbws, "resetPreviousWord");
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManager_ja inputLocationChanged](&v3, sel_inputLocationChanged);
}

- (id)rawInputString
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  objc_super v12;

  if (!-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    v12.receiver = self;
    v12.super_class = (Class)TIKeyboardInputManager_ja;
    -[TIKeyboardInputManager_ja inputString](&v12, sel_inputString);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasKindOf:", objc_opt_class());

  if (v4)
  {
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "asSearchString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    objc_msgSend(v7, "input");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asSearchString");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;
LABEL_9:

  return v10;
}

- (unsigned)inputCount
{
  unsigned int v3;
  void *v4;
  objc_super v6;

  if (-[TIKeyboardInputManager_ja shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_ja;
    return -[TIKeyboardInputManager_ja inputCount](&v6, sel_inputCount);
  }
  else
  {
    -[TIKeyboardInputManager_ja _inputString](self, "_inputString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "length");

  }
  return v3;
}

- (unsigned)inputIndex
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  -[TIKeyboardInputManager_ja alternateDisplayString](self, "alternateDisplayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || (v5 = objc_msgSend(v3, "length")) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManager_ja;
    LODWORD(v5) = -[TIKeyboardInputManager_ja inputIndex](&v7, sel_inputIndex);
  }

  return v5;
}

- (id)_inputString
{
  void *v3;
  id v4;
  void *v5;

  -[TIKeyboardInputManager_ja alternateDisplayString](self, "alternateDisplayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    -[TIKeyboardInputManager_ja rawInputString](self, "rawInputString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)inputString
{
  void *v3;
  objc_super v5;

  if (-[TIKeyboardInputManager_ja shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManager_ja;
    -[TIKeyboardInputManager_ja inputString](&v5, sel_inputString);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TIKeyboardInputManager_ja _inputString](self, "_inputString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_convertStringWithBoundary:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  -[TIKeyboardInputManager_ja _convertString](self, "_convertString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 && objc_msgSend(v4, "length") > a3)
  {
    objc_msgSend(v5, "substringToIndex:", a3);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (id)wordCharacters
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D00], "kanaWordCharacters");
}

- (void)setAutoCorrects:(BOOL)a3
{
  -[TIWordSearch setAutoCorrects:](self->_kbws, "setAutoCorrects:", a3);
}

- (BOOL)shouldOutputFullwidthSpace
{
  void *v3;
  char v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hardwareKeyboardMode");

  if ((v4 & 1) != 0)
    return 0;
  -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "shouldOutputFullwidthSpace");

  -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isAlphabeticPlane") & 1) != 0)
  {
    -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shiftState") == 1;

    return v5 ^ v10;
  }
  else
  {

  }
  return v5;
}

- (BOOL)shouldOutputFullwidthSpaceForKanaABC123
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  BOOL result;

  if (!-[TIKeyboardInputManager_ja shouldOutputFullwidthSpace](self, "shouldOutputFullwidthSpace"))
    return 0;
  -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextBeforeInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_lastGrapheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
    goto LABEL_5;
  if (objc_msgSend(v6, "_containsFullwidthLettersAndNumbersOnly"))
    v7 = objc_msgSend(v6, "_containsCJScripts") ^ 1;
  else
LABEL_5:
    v7 = 0;
  v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("　"));

  result = 1;
  if ((v7 & 1) == 0 && (v8 & 1) == 0)
    return 0;
  return result;
}

- (void)setPhraseBoundary:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  id v12;

  v3 = a3;
  self->_isPhraseBoundarySet = -[TIKeyboardInputManager_ja inputCount](self, "inputCount") != a3;
  -[TIKeyboardInputManager_ja _cancelCandidatesThread](self, "_cancelCandidatesThread");
  -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedRangeInMarkedText");
  v8 = v7;

  if (v8)
  {
    v9 = (v8 + v3);
    -[TIKeyboardInputManager_ja inputString](self, "inputString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v9 <= v11)
      v3 = v9;
  }
  -[TIKeyboardInputManager_ja setInputIndex:](self, "setInputIndex:", v3);
  -[TIKeyboardInputManager_ja setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", self->_isPhraseBoundarySet);
  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerMecabra _convertInputsToSyntheticInputWithOffset:](self, "_convertInputsToSyntheticInputWithOffset:", v3);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra _replaceComposingInputWithSyntheticInput:internalIndex:](self, "_replaceComposingInputWithSyntheticInput:internalIndex:", v12, v3);

  }
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  if (-[TIKeyboardInputManager_ja usesLiveConversion](self, "usesLiveConversion"))
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      -[TIKeyboardInputManager_ja setAlternateDisplayString:](self, "setAlternateDisplayString:", 0);
  }
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManagerMecabra adjustPhraseBoundaryInForwardDirection:granularity:](&v8, sel_adjustPhraseBoundaryInForwardDirection_granularity_, v5, v4);
}

- (unint64_t)phraseBoundary
{
  return -[TIKeyboardInputManager_ja inputIndex](self, "inputIndex");
}

- (unint64_t)actualInputIndex
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t remainingInputLength;
  unint64_t v9;

  -[TIKeyboardInputManager_ja inputString](self, "inputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TIKeyboardInputManager_ja inputIndex](self, "inputIndex");
  if (v4
    && (v5 = v4, -[TIKeyboardInputManager_ja filterCandidatesUsingInputIndex](self, "filterCandidatesUsingInputIndex")))
  {
    v6 = v5;
  }
  else
  {
    v6 = objc_msgSend(v3, "length");
  }
  remainingInputLength = self->_remainingInputLength;
  if (remainingInputLength >= v6 || remainingInputLength == 0)
    remainingInputLength = 0;
  v9 = v6 - remainingInputLength;

  return v9;
}

- (id)remainingInput
{
  void *v3;
  unint64_t v4;
  void *v5;

  -[TIKeyboardInputManager_ja inputString](self, "inputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TIKeyboardInputManager_ja actualInputIndex](self, "actualInputIndex");
  if (v4 >= objc_msgSend(v3, "length"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringFromIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)candidateResultSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _BOOL8 v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  if ((-[TIKeyboardInputManager_ja shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "asSearchString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[TIKeyboardInputManager_ja _convertString](self, "_convertString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "length");
    if ((unint64_t)(v10 - 1) >= *MEMORY[0x24BEB54B8])
    {
      -[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput");
      v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v11);

      v13 = !-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput");
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        v14 = v13;
      else
        v14 = 0;
      if ((v13 & 1) == 0 && v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v15, "totalDrawSamples") == 0;

      }
    }
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB5AA0]) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB5AA8]) & 1) != 0)
    {
      v16 = 1;
    }
    else
    {
      v16 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB5A98]);
    }
    -[TIKeyboardInputManager_ja setIsEmojiFacemarkMode:](self, "setIsEmojiFacemarkMode:", v16);
    if ((_DWORD)v14)
    {
      -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "documentState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "selectedText");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "_containsKatakanaOrKanji"))
      {
        -[TIKeyboardInputManager_ja recentlyCommittedCandidatesForReanalysis](self, "recentlyCommittedCandidatesForReanalysis");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerMecabra adaptationContextReadingForReanalysisString:fromRecentlyCommittedCandidates:](self, "adaptationContextReadingForReanalysisString:fromRecentlyCommittedCandidates:", v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = v21;
        }
        else
        {
          objc_msgSend(v19, "_stringByTranscribingFromLanguage:", CFSTR("ja_JP"));
          v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        v24 = v22;

        v19 = v24;
      }
      if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
      {
        v25 = objc_alloc(MEMORY[0x24BEB5320]);
        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "sourceKeyboardState");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v25, "initWithSourceKeyboardState:", v27);

        v29 = objc_alloc(MEMORY[0x24BEB5330]);
        v30 = (void *)objc_msgSend(v29, "initWithCommittedText:syllables:", v19, MEMORY[0x24BDBD1A8]);
        objc_msgSend(v28, "composeNew:", v30);

        v23 = 1;
        v6 = v28;
      }
      else
      {
        v23 = 1;
      }
    }
    else
    {
      if (-[TIKeyboardInputManager_ja isEmojiFacemarkMode](self, "isEmojiFacemarkMode")
        || !-[TIKeyboardInputManager_ja filterCandidatesUsingInputIndex](self, "filterCandidatesUsingInputIndex"))
      {
        v19 = v5;
      }
      else
      {
        -[TIKeyboardInputManager_ja _convertStringWithBoundary:](self, "_convertStringWithBoundary:", -[TIKeyboardInputManager_ja inputIndex](self, "inputIndex"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v23 = (-[TIKeyboardInputManager_ja inHardwareKeyboardMode](self, "inHardwareKeyboardMode") & 1) == 0
         && !self->_isPhraseBoundarySet;
    }
    if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
    {

      v19 = 0;
    }
    v31 = -[TIKeyboardInputManager_ja makeCandidatesWithWordSearch:input:predictionEnabled:reanalysisMode:](self, "makeCandidatesWithWordSearch:input:predictionEnabled:reanalysisMode:", v19, v6, v23, v14);
    objc_msgSend(MEMORY[0x24BEB4E18], "dummySet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager_ja rawInputString](self, "rawInputString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerMecabra updateProactiveCandidatesForCandidateResultSet:withInput:](self, "updateProactiveCandidatesForCandidateResultSet:withInput:", v32, v33);

      -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager_ja candidateResultSetFromWordSearchCandidateResultSet:](self, "candidateResultSetFromWordSearchCandidateResultSet:", v34);
      v35 = objc_claimAutoreleasedReturnValue();

      if (-[TIKeyboardInputManager_ja isEmojiFacemarkMode](self, "isEmojiFacemarkMode"))
      {
        -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "candidates");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "firstObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "candidate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager_ja setAlternateDisplayString:](self, "setAlternateDisplayString:", v39);

      }
      v3 = (void *)v35;
    }
    else if (-[TIKeyboardInputManager_ja isEmojiFacemarkMode](self, "isEmojiFacemarkMode"))
    {
      -[TIKeyboardInputManager_ja setAlternateDisplayString:](self, "setAlternateDisplayString:", *MEMORY[0x24BEB5A98]);
    }

  }
  return v3;
}

- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (-[TIKeyboardInputManager_ja shouldOmitEmojiCandidates](self, "shouldOmitEmojiCandidates"))
  {
    objc_msgSend(v8, "_arrayByFilteringEmojiCandidates:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_arrayByFilteringCandidatesForNonExtendedView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManager_ja candidateResultSetFromCandidates:proactiveTriggers:](&v13, sel_candidateResultSetFromCandidates_proactiveTriggers_, v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIKeyboardInputManager_ja addFullwidthAnnotationToResultSet:](TIKeyboardInputManager_ja, "addFullwidthAnnotationToResultSet:", v11);

  return v11;
}

+ (void)addFullwidthAnnotationToResultSet:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v3, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = v3;
  objc_msgSend(v3, "candidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(v12, "candidate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v9);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v23, "candidates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v20 = v19;
            objc_msgSend(v20, "candidate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "_containsFullwidthLettersAndSymbolsOnly"))
            {
              objc_msgSend(v21, "_stringByConvertingFromFullWidthToHalfWidth");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v21, "isEqualToString:", v22) & 1) == 0
                && objc_msgSend(v6, "containsObject:", v22))
              {
                objc_msgSend(v20, "setAnnotationText:", CFSTR("UI-Fullwidth"));
              }

            }
          }
        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v16);
  }

}

- (id)geometryModelData
{
  objc_super v4;

  if (-[TIKeyboardInputManager_ja isEmojiFacemarkMode](self, "isEmojiFacemarkMode"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManagerMecabra geometryModelData](&v4, sel_geometryModelData);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)makeCandidatesWithWordSearch:(id)a3 input:(id)a4 predictionEnabled:(BOOL)a5 reanalysisMode:(BOOL)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  TIWordSearchJapaneseOperationGetCandidates *v19;
  TIWordSearch *kbws;
  void *v21;
  BOOL v22;
  void *v23;
  TIWordSearchJapaneseOperationGetCandidates *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  BOOL v31;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = *MEMORY[0x24BEB5A98];
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEB5A98]))
  {
    v13 = (id)*MEMORY[0x24BEB5AA8];

    v10 = v13;
  }
  objc_msgSend(v11, "asSearchString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", v12);

  v31 = a6;
  if (v15)
  {
    objc_msgSend((id)*MEMORY[0x24BEB5AA8], "_asTypeInputs");
    v16 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v16;
  }
  else
  {
    v30 = v11;
  }
  -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearch setSupportsPairedPunctutationInput:](self->_kbws, "setSupportsPairedPunctutationInput:", objc_msgSend(v17, "hardwareKeyboardMode") ^ 1);

  -[TIKeyboardInputManager_ja geometryModelData](self, "geometryModelData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [TIWordSearchJapaneseOperationGetCandidates alloc];
  kbws = self->_kbws;
  -[TIKeyboardInputManager_ja contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[TIKeyboardInputManager_ja flickUsed](self, "flickUsed");
  LOBYTE(v17) = self->_isPhraseBoundarySet;
  -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v29) = objc_msgSend(v23, "hardwareKeyboardMode");
  BYTE1(v29) = (_BYTE)v17;
  LOBYTE(v29) = v22;
  LOBYTE(v28) = v31;
  v24 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v19, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", kbws, v10, v30, v21, 0x7FFFFFFFFFFFFFFFLL, v7, v28, 0, self, sel__notifyUpdateCandidates_forOperation_, v18, v29, 0);

  -[TIWordSearchJapaneseOperationGetCandidates setAllowIncompleteRomaji:](v24, "setAllowIncompleteRomaji:", -[TIKeyboardInputManager_ja inHardwareKeyboardMode](self, "inHardwareKeyboardMode"));
  -[TIWordSearchOperationGetCandidates checkForCachedResults](v24, "checkForCachedResults");
  -[TIWordSearchJapaneseOperationGetCandidates results](v24, "results");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[TIWordSearchJapaneseOperationGetCandidates results](v24, "results");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v26);

  }
  else
  {
    -[TIWordSearch performOperationAsync:](self->_kbws, "performOperationAsync:", v24);
  }

  return v25 != 0;
}

- (void)_cancelCandidatesThread
{
  -[TIWordSearch cancel](self->_kbws, "cancel");
}

- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id location;
  _QWORD v36[5];

  v6 = a3;
  v7 = a4;
  if (!-[TIKeyboardInputManager_ja shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    objc_msgSend(v6, "candidates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BEB5AA0];
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEB5AA0]) & 1) == 0)
    {
      objc_msgSend(v7, "inputString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x24BEB5AA8];
      if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEB5AA8]) & 1) == 0)
      {
        objc_msgSend(v7, "inputString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *MEMORY[0x24BEB5A98];
        if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BEB5A98]) & 1) == 0)
        {
          v29 = v14;
          v31 = v13;
          objc_msgSend(v7, "keyboardInput");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "asInlineText");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "isEqualToString:", v10) & 1) == 0)
          {
            v27 = v16;
            v28 = v15;
            objc_msgSend(v7, "keyboardInput");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "asInlineText");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v18, "isEqualToString:", v12) & 1) == 0)
            {
              objc_msgSend(v7, "keyboardInput");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "asInlineText");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v26, "isEqualToString:", v29);

              if ((v30 & 1) == 0)
                goto LABEL_14;
              goto LABEL_13;
            }

            v15 = v28;
          }

          v13 = v31;
        }

      }
    }

LABEL_13:
    -[TIKeyboardInputManager_ja setIsEmojiFacemarkMode:](self, "setIsEmojiFacemarkMode:", 1);
    objc_msgSend(v8, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "candidate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja setAlternateDisplayString:](self, "setAlternateDisplayString:", v20);

LABEL_14:
    -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v6);
    -[TIKeyboardInputManager_ja updateState](self, "updateState");
    v21 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __66__TIKeyboardInputManager_ja__notifyUpdateCandidates_forOperation___block_invoke;
    v36[3] = &unk_250122A80;
    v36[4] = self;
    v22 = (void *)MEMORY[0x2349027B0](v36);
    objc_initWeak(&location, self);
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v21;
    v32[1] = 3221225472;
    v32[2] = __66__TIKeyboardInputManager_ja__notifyUpdateCandidates_forOperation___block_invoke_2;
    v32[3] = &unk_250122AA8;
    objc_copyWeak(&v34, &location);
    v33 = v22;
    v24 = v22;
    -[TIKeyboardInputManagerMecabra addStickers:withCompletionHandler:](self, "addStickers:withCompletionHandler:", v23, v32);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);

    goto LABEL_15;
  }
  -[TIKeyboardInputManager_ja closeCandidateGenerationContextWithResults:](self, "closeCandidateGenerationContextWithResults:", 0);
LABEL_15:

}

- (id)candidateResultSetFromWordSearchCandidateResultSet:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManagerMecabra candidateResultSetFromWordSearchCandidateResultSet:](&v6, sel_candidateResultSetFromWordSearchCandidateResultSet_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TIKeyboardInputManager_ja selectFirstCandidate](self, "selectFirstCandidate"))
  {
    objc_msgSend(v4, "setInitialSelectedIndex:", 0);
    -[TIKeyboardInputManager_ja setSelectFirstCandidate:](self, "setSelectFirstCandidate:", 0);
  }
  return v4;
}

- (TICandidateSorter)candidateSorter
{
  TIKeyboardInputManager_ja *v2;
  TICandidateSorter *candidateSorter;
  TICandidateSorter *v4;
  TICandidateSorter *v5;
  TICandidateSorter *v6;

  v2 = self;
  objc_sync_enter(v2);
  candidateSorter = v2->_candidateSorter;
  if (!candidateSorter)
  {
    v4 = objc_alloc_init(TICandidateSorter);
    v5 = v2->_candidateSorter;
    v2->_candidateSorter = v4;

    candidateSorter = v2->_candidateSorter;
  }
  v6 = candidateSorter;
  objc_sync_exit(v2);

  return v6;
}

- (NSOperationQueue)operationQueue
{
  TIKeyboardInputManager_ja *v2;
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

+ (id)sortTitleFromSort:(unint64_t)a3
{
  if (a3 > 4)
    return 0;
  else
    return off_250122BC8[a3];
}

+ (unint64_t)sortFromSortTitle:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI-Sort-Common")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI-Sort-Yomi")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI-Sort-Radical")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI-Sort-Facemark")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UI-Sort-Emoji")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)sortingMethods
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;

  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TIKeyboardInputManager_ja isEmojiFacemarkMode](self, "isEmojiFacemarkMode") || !objc_msgSend(v4, "count"))
  {
    v9 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend((id)objc_opt_class(), "sortTitleFromSort:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithObject:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja inputString](self, "inputString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 5; ++i)
    {
      objc_msgSend((id)objc_opt_class(), "sortTitleFromSort:", kCandidateSorts[i]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[TIKeyboardInputManager_ja hasGroupedCandidatesFromCandidates:usingSortingMethod:inputString:](self, "hasGroupedCandidatesFromCandidates:usingSortingMethod:inputString:", v4, v8, v6))
      {
        objc_msgSend(v5, "addObject:", v8);
      }

    }
  }

  return v5;
}

- (id)titleForSortingMethod:(id)a3
{
  return a3;
}

+ (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("UI-Sort-Common")) ^ 1;
}

- (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "alwaysShowExtensionCandidatesForSortingMethod:", v3);

  return v4;
}

- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4 inputString:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    v12 = objc_msgSend((id)objc_opt_class(), "sortFromSortTitle:", v10);
    -[TIKeyboardInputManager_ja candidateSorter](self, "candidateSorter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "candidatesFromCandidates:inputString:sortedBy:omittingEmoji:", v9, v11, v12, -[TIKeyboardInputManager_ja shouldOmitEmojiCandidates](self, "shouldOmitEmojiCandidates"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TIKeyboardInputManager_ja.mm"), 896, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sortTitle != nil"));
    v14 = 0;
  }

  return v14;
}

- (BOOL)hasGroupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4 inputString:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  char v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    v12 = objc_msgSend((id)objc_opt_class(), "sortFromSortTitle:", v10);
    -[TIKeyboardInputManager_ja candidateSorter](self, "candidateSorter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasCandidatesFromCandidates:inputString:sortedBy:omittingEmoji:", v9, v11, v12, -[TIKeyboardInputManager_ja shouldOmitEmojiCandidates](self, "shouldOmitEmojiCandidates"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TIKeyboardInputManager_ja.mm"), 908, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sortTitle != nil"));
    v14 = 0;
  }

  return v14;
}

- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TIKeyboardInputManager_ja.mm"), 919, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[NSThread isMainThread]"));

  }
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[TIKeyboardInputManager_ja inputString](self, "inputString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[TIKeyboardInputManager_ja groupedCandidatesFromCandidates:usingSortingMethod:inputString:](self, "groupedCandidatesFromCandidates:usingSortingMethod:inputString:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
    {
      if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TIKeyboardInputManager_ja.mm"), 935, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[NSThread isMainThread]"));

      }
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        -[TIKeyboardInputManager_ja inputString](self, "inputString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      -[TIKeyboardInputManager_ja operationQueue](self, "operationQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __91__TIKeyboardInputManager_ja_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke;
      v18[3] = &unk_250122AF8;
      v18[4] = self;
      v19 = v9;
      v20 = v10;
      v21 = v13;
      v22 = v12;
      v15 = v13;
      objc_msgSend(v14, "addOperationWithBlock:", v18);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TIKeyboardInputManager_ja.mm"), 930, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sortTitle != nil"));

  }
}

- (id)indexTitlesForGroupTitles:(id)a3 sortingMethod:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  if ((objc_msgSend(a4, "isEqual:", CFSTR("UI-Sort-Yomi")) & 1) != 0)
    v6 = &unk_250128508;
  else
    v6 = v5;

  return v6;
}

- (unint64_t)autoquoteType
{
  return 0;
}

- (BOOL)usesAutoDeleteWord
{
  return 1;
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
  return 1;
}

- (BOOL)supportsSetPhraseBoundary
{
  return 1;
}

- (BOOL)newInputAcceptsUserSelectedCandidate
{
  return 1;
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
  return objc_alloc_init(MEMORY[0x24BEB4DC0]);
}

- (unint64_t)initialSelectedIndex
{
  if (-[TIKeyboardInputManager_ja isEmojiFacemarkMode](self, "isEmojiFacemarkMode"))
    return 0;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)defaultCandidate
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (-[TIKeyboardInputManager_ja inputCount](self, "inputCount"))
  {
    -[TIKeyboardInputManager_ja inputString](self, "inputString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[TIKeyboardInputManager_ja inputIndex](self, "inputIndex");
    if (v4)
    {
      v5 = v4;
      if (v4 < -[TIKeyboardInputManager_ja inputCount](self, "inputCount"))
      {
        if (-[TIKeyboardInputManager_ja filterCandidatesUsingInputIndex](self, "filterCandidatesUsingInputIndex"))
        {
          objc_msgSend(v3, "substringToIndex:", v5);
          v6 = objc_claimAutoreleasedReturnValue();

          v3 = (void *)v6;
        }
      }
    }
    if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "asSearchString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "asSearchTextCursorIndex");

      objc_msgSend(v8, "substringToIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[TIKeyboardInputManager_ja rawInputString](self, "rawInputString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[TIWordSearch candidateForDefault:rawInputString:](self->_kbws, "candidateForDefault:rawInputString:", v3, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (unint64_t)remainingInputLengthOfString:(id)a3 index:(unint64_t)a4 candidate:(id)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;

  v7 = a3;
  objc_msgSend(a5, "input");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    if (!a4)
      a4 = objc_msgSend(v7, "length");
    if (a4 >= v9)
      v10 = a4 - v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)remainingInputLengthOfCandidate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  if (-[TIKeyboardInputManager_ja filterCandidatesUsingInputIndex](self, "filterCandidatesUsingInputIndex"))
    v5 = -[TIKeyboardInputManager_ja inputIndex](self, "inputIndex");
  else
    v5 = 0;
  -[TIKeyboardInputManager_ja inputString](self, "inputString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TIKeyboardInputManager_ja remainingInputLengthOfString:index:candidate:](self, "remainingInputLengthOfString:index:candidate:", v6, v5, v4);

  return v7;
}

- (void)preferencesDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5118]);
  -[TIKeyboardInputManager_ja smartPunctuationController](self, "smartPunctuationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSmartQuotesEnabled:", v5);

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "BOOLForPreferenceKey:", *MEMORY[0x24BEB5108]);
  -[TIKeyboardInputManager_ja smartPunctuationController](self, "smartPunctuationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSmartDashesEnabled:", v7);

}

- (id)stringByConvertingPunctuationForInput:(id)a3 isLockedInput:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  -[TIKeyboardInputManager_ja smartPunctuationController](self, "smartPunctuationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "smartPunctuationOutputForInput:isLockedInput:documentState:", v6, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "insertionText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "insertionText");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v6;
  }
  v11 = v10;

  return v11;
}

- (id)syllableSeparator
{
  return &stru_250122EC0;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManagerMecabra handleAcceptedCandidate:keyboardState:](&v8, sel_handleAcceptedCandidate_keyboardState_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)getInputStringFromTopCandidate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)lockAnyDrawInputResults
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasDrawInput");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja getInputStringFromTopCandidate](self, "getInputStringFromTopCandidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "_stringWithUnichar:", objc_msgSend(v6, "characterAtIndex:", v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

        ++v7;
      }
      while (objc_msgSend(v6, "length") > v7);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB5330]), "initWithCommittedText:syllables:", &stru_250122EC0, v5);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v9, "composeNew:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeAllInputs");

    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "composeNew:", v9);

  }
}

- (id)didAcceptCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  char isKindOfClass;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  int v63;
  int v64;
  unint64_t v65;
  void *v66;
  _BOOL8 v68;
  void *v69;
  unint64_t v70;
  void *v71;
  unint64_t v72;
  unint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id obj;
  void *v81;
  char v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TIKeyboardInputManager_ja _cancelCandidatesThread](self, "_cancelCandidatesThread");
  if (-[TIKeyboardInputManager_ja usesLiveConversion](self, "usesLiveConversion"))
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[TIKeyboardInputManager_ja setAlternateDisplayString:](self, "setAlternateDisplayString:", 0);
  }
  -[TIKeyboardInputManager_ja setFlickUsed:](self, "setFlickUsed:", 0);
  self->_remainingInputLength = 0;
  -[TIKeyboardInputManager_ja rawInputString](self, "rawInputString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  objc_msgSend(v4, "input");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  objc_msgSend(v4, "candidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    v11 = -[TIKeyboardInputManager_ja isTypologyEnabled](self, "isTypologyEnabled");

    if (v11)
      -[TIKeyboardInputManagerMecabra logCommittedCandidate:partial:](self, "logCommittedCandidate:partial:", v4, v7 > v9);
  }
  else
  {

  }
  if (v7 > v9)
    -[TIKeyboardInputManagerMecabra savePartialGeometryData](self, "savePartialGeometryData");
  v12 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v4);
  objc_msgSend(v4, "proactiveTrigger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TIKeyboardInputManager_ja isEmojiFacemarkMode](self, "isEmojiFacemarkMode"))
  {
    -[TIWordSearch performAccept:isPartial:](self->_kbws, "performAccept:isPartial:", v12, 0);
    -[TIKeyboardInputManager_ja setIsEmojiFacemarkMode:](self, "setIsEmojiFacemarkMode:", 0);
LABEL_12:
    v14 = 0;
    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && !v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "candidate");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v81, "length"))
      {
        -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "documentIdentifier");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = 0x255FB4000uLL;
        if (v16)
        {
          v18 = (void *)v16;
          -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "inputForMarkedText");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "length");

          if (v21)
          {
            -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "candidates");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v85 = 0u;
            v86 = 0u;
            v83 = 0u;
            v84 = 0u;
            obj = v23;
            v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v84;
              do
              {
                for (i = 0; i != v25; ++i)
                {
                  if (*(_QWORD *)v84 != v26)
                    objc_enumerationMutation(obj);
                  v28 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
                  objc_msgSend(v28, "candidate");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v81, "isEqualToString:", v29))
                  {
                    objc_opt_class();
                    isKindOfClass = objc_opt_isKindOfClass();

                    if ((isKindOfClass & 1) != 0)
                    {
                      v68 = v7 > v9;
                      v69 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v28);
                      -[TIKeyboardInputManager_ja addRecentlyCommittedCandidatesForReanalysis:](self, "addRecentlyCommittedCandidatesForReanalysis:", v69);
                      -[TIWordSearch performAccept:isPartial:](self->_kbws, "performAccept:isPartial:", v69, v68);
                      -[TIKeyboardInputManagerMecabra updateUsageStatisticsForCandidate:isPartial:](self, "updateUsageStatisticsForCandidate:isPartial:", v28, v68);

                      goto LABEL_67;
                    }
                  }
                  else
                  {

                  }
                }
                v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
              }
              while (v25);
            }

            v17 = 0x255FB4000;
          }
        }
        else
        {

        }
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *(int *)(v17 + 3168)), "performAccept:isPartial:", 0, 0);
      }
LABEL_67:

    }
    goto LABEL_12;
  }
  -[TIKeyboardInputManager_ja addRecentlyCommittedCandidatesForReanalysis:](self, "addRecentlyCommittedCandidatesForReanalysis:", v12);
  self->_remainingInputLength = -[TIKeyboardInputManager_ja remainingInputLengthOfCandidate:](self, "remainingInputLengthOfCandidate:", v4);
  -[TIWordSearch performAccept:isPartial:](self->_kbws, "performAccept:isPartial:", v12, v7 > v9);
  if (v13)
  {
    objc_msgSend(v4, "candidate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  -[TIKeyboardInputManagerMecabra updateUsageStatisticsForCandidate:isPartial:](self, "updateUsageStatisticsForCandidate:isPartial:", v4, v7 > v9);
LABEL_35:
  if (!-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
    goto LABEL_64;
  v31 = -[TIKeyboardInputManagerMecabra processAcceptedCandidate:](self, "processAcceptedCandidate:", v4);
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "inputs");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35)
  {
    v36 = 0;
    v37 = 0;
    do
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "inputs");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", v36);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v40, "convertedInput");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "appendString:", v41);

        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "removeInputAtIndex:", v36);

        --v37;
      }

      v36 = ++v37;
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "inputs");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count");

    }
    while (v45 > v37);
  }
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "inputs");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v47, "count") <= 1)
    goto LABEL_46;
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "inputs");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "firstObject");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_46;
  }
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v51 = v14;
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v52, "hasDrawInput");

  v14 = v51;
  if ((v82 & 1) == 0)
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "inputs");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[TIKeyboardInputManagerMecabra convertInputsToSyntheticInputUptoCount:](self, "convertInputsToSyntheticInputUptoCount:", objc_msgSend(v47, "count"));
LABEL_46:

  }
  -[TIKeyboardInputManager_ja lockAnyDrawInputResults](self, "lockAnyDrawInputResults");
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "inputs");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v55, "count"))
  {
    while (1)
    {
      v56 = objc_msgSend(v32, "length");

      if (!v56)
        goto LABEL_63;
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "inputs");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      v60 = v59;
      objc_msgSend(v60, "characters");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v61, "length"))
        goto LABEL_58;
      objc_msgSend(v60, "characters");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "characterAtIndex:", 0);
      v64 = objc_msgSend(v32, "characterAtIndex:", 0);

      if (v63 != v64)
      {
        v59 = v60;
        goto LABEL_62;
      }
LABEL_59:
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "removeInputAtIndex:", 0);

      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v54 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "inputs");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v55, "count"))
        goto LABEL_60;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_62;
    v54 = v59;
    objc_msgSend(v54, "text");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v61, "length"))
    {
      if ((objc_msgSend(v32, "hasPrefix:", v61) & 1) == 0)
      {
        v65 = objc_msgSend(v32, "length");
        if (v65 < objc_msgSend(v61, "length"))
        {
          if ((objc_msgSend(v61, "hasPrefix:", v32) & 1) != 0
            || (v70 = objc_msgSend(v61, "length"), v70 > objc_msgSend(v32, "length")))
          {
            objc_msgSend(v54, "syllables");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = objc_msgSend(v71, "count");
            v73 = objc_msgSend(v32, "length");

            if (v72 <= v73)
            {
              v55 = v54;
            }
            else
            {
              objc_msgSend(v54, "syllables");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = objc_msgSend(v32, "length");
              objc_msgSend(v54, "syllables");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "subarrayWithRange:", v75, objc_msgSend(v76, "count") - objc_msgSend(v32, "length"));
              v77 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v54, "committedText");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "syntheticInputWithCommittedText:syllables:", v78, v77);
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "replaceInputAtIndex:with:", 0, v55);

              v32 = 0;
            }
          }
          else
          {
            v55 = v54;
          }

          goto LABEL_60;
        }
      }
    }
    objc_msgSend(v32, "deleteCharactersInRange:", 0, objc_msgSend(v61, "length"));
LABEL_58:

    goto LABEL_59;
  }
LABEL_60:

  v59 = v54;
LABEL_62:

LABEL_63:
LABEL_64:

  return v14;
}

- (void)lastAcceptedCandidateCorrected
{
  -[TIWordSearch lastAcceptedCandidateCorrected](self->_kbws, "lastAcceptedCandidateCorrected");
}

- (void)clearDynamicDictionary
{
  objc_super v3;

  -[TIWordSearch clearLearningDictionary](self->_kbws, "clearLearningDictionary");
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManager_ja clearDynamicDictionary](&v3, sel_clearDynamicDictionary);
}

- (void)setLearnsCorrection:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManager_ja setLearnsCorrection:](&v5, sel_setLearnsCorrection_);
  self->_shouldLearnAcceptedCandidate = v3;
  -[TIWordSearch setShouldLearnAcceptedCandidate:](self->_kbws, "setShouldLearnAcceptedCandidate:", v3);
}

- (void)addRecentlyCommittedCandidatesForReanalysis:(void *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  if (a3)
  {
    MecabraCandidateGetSurface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja recentlyCommittedCandidatesForReanalysis](self, "recentlyCommittedCandidatesForReanalysis");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __73__TIKeyboardInputManager_ja_addRecentlyCommittedCandidatesForReanalysis___block_invoke;
    v14[3] = &unk_250122B20;
    v13 = v5;
    v15 = v13;
    v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v14);

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[TIKeyboardInputManager_ja recentlyCommittedCandidatesForReanalysis](self, "recentlyCommittedCandidatesForReanalysis");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectAtIndex:", v7);

    }
    -[TIKeyboardInputManager_ja recentlyCommittedCandidatesForReanalysis](self, "recentlyCommittedCandidatesForReanalysis");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertObject:atIndex:", a3, 0);

    -[TIKeyboardInputManager_ja recentlyCommittedCandidatesForReanalysis](self, "recentlyCommittedCandidatesForReanalysis");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 >= 0x1F)
    {
      -[TIKeyboardInputManager_ja recentlyCommittedCandidatesForReanalysis](self, "recentlyCommittedCandidatesForReanalysis");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeLastObject");

    }
  }
}

- (BOOL)isLiveConversion
{
  void *v3;
  uint64_t v4;
  int v5;

  if (-[TIKeyboardInputManager_ja liveConversionEnabled](self, "liveConversionEnabled"))
  {
    -[TIKeyboardInputManager_ja inputString](self, "inputString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");
    if (v4 == -[TIKeyboardInputManager_ja inputIndex](self, "inputIndex"))
      v5 = -[TIKeyboardInputManager_ja shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection") ^ 1;
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)liveConversionEnabled
{
  int v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  char v8;

  if (-[TIKeyboardInputManager_ja liveConversionForceEnabled](self, "liveConversionForceEnabled"))
    return 1;
  if (-[TIKeyboardInputManager_ja liveConversionForceDisabled](self, "liveConversionForceDisabled"))
    return 0;
  v4 = -[TIKeyboardInputManager_ja inHardwareKeyboardMode](self, "inHardwareKeyboardMode");
  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = (_QWORD *)MEMORY[0x24BEB50D8];
  if (!v4)
    v7 = (_QWORD *)MEMORY[0x24BEB5120];
  v8 = objc_msgSend(v5, "BOOLForPreferenceKey:", *v7);

  return v8;
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

- (void)commitComposition
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "inputStringForHiraganaMode");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0)
      goto LABEL_7;
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rawInputString");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BEB4E28]);
    objc_msgSend(v10, "setString:", v9);
    v11 = objc_alloc(MEMORY[0x24BEB53B8]);
    -[TIKeyboardInputManager_ja keyboardState](self, "keyboardState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithKeyboardState:", v12);

    -[TIKeyboardInputManager_ja clearInput](self, "clearInput");
    TIInputManager::sync_with_input_from_UI(*(TIInputManager **)((char *)&self->super.super.super.super.super.isa
                                                               + (int)*MEMORY[0x24BEB5498]));
    -[TIKeyboardInputManager_ja addInput:withContext:](self, "addInput:withContext:", v10, v13);

  }
LABEL_7:
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManagerMecabra commitComposition](&v14, sel_commitComposition);
}

- (BOOL)shouldInvokeLiveConversion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 || !-[TIKeyboardInputManager_ja isLiveConversion](self, "isLiveConversion"))
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    objc_msgSend(v4, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v4, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "_isSpace") & 1) != 0)
      {
        LOBYTE(v8) = 0;
      }
      else
      {
        objc_msgSend(v4, "string");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEB5AA0]) & 1) != 0)
        {
          LOBYTE(v8) = 0;
        }
        else
        {
          objc_msgSend(v4, "string");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEB5AA8]) & 1) != 0)
          {
            LOBYTE(v8) = 0;
          }
          else
          {
            objc_msgSend(v4, "string");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BEB5A98]) & 1) != 0)
              LOBYTE(v8) = 0;
            else
              v8 = !-[TIKeyboardInputManager_ja isEmojiFacemarkMode](self, "isEmojiFacemarkMode");

          }
        }

      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  return v8;
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  v10 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "syncToKeyboardState:", v10);

  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManagerMecabra generateCandidatesWithKeyboardState:candidateRange:candidateHandler:](&v12, sel_generateCandidatesWithKeyboardState_candidateRange_candidateHandler_, v10, location, length, v9);

}

- (void)mecabraLearningValidator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TIKeyboardInputManagerMecabra storeLanguageModelDynamicDataIncludingCache](self, "storeLanguageModelDynamicDataIncludingCache");
  -[TIKeyboardInputManagerBase clearHumanReadableTrace](self, "clearHumanReadableTrace");
  -[TIKeyboardInputManagerBase inputManagerLogger](self, "inputManagerLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeToFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v16 = "-[TIKeyboardInputManager_ja mecabraLearningValidator:]";
    v17 = 2080;
    v18 = "-[TIKeyboardInputManager_ja mecabraLearningValidator:]";
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_232303000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s  [%s]Wrote typology log: %@, typology trace log: %@", buf, 0x2Au);

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.keyboard.TypoTracker"));
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke;
  v12[3] = &unk_250122B88;
  v13 = v4;
  v14 = v9;
  v10 = v9;
  v11 = v4;
  objc_msgSend(v10, "requestAuthorizationWithOptions:completionHandler:", 7, v12);

}

- (BOOL)isKanaPlane
{
  return self->_isKanaPlane;
}

- (void)setIsKanaPlane:(BOOL)a3
{
  self->_isKanaPlane = a3;
}

- (NSMutableArray)recentlyCommittedCandidatesForReanalysis
{
  return self->_recentlyCommittedCandidatesForReanalysis;
}

- (TISmartPunctuationController)smartPunctuationController
{
  return self->_smartPunctuationController;
}

- (BOOL)flickUsed
{
  return self->_flickUsed;
}

- (void)setFlickUsed:(BOOL)a3
{
  self->_flickUsed = a3;
}

- (BOOL)isEmojiFacemarkMode
{
  return self->_isEmojiFacemarkMode;
}

- (BOOL)filterCandidatesUsingInputIndex
{
  return self->_filterCandidatesUsingInputIndex;
}

- (void)setFilterCandidatesUsingInputIndex:(BOOL)a3
{
  self->_filterCandidatesUsingInputIndex = a3;
}

- (NSString)alternateDisplayString
{
  return self->_alternateDisplayString;
}

- (void)setAlternateDisplayString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 848);
}

- (BOOL)selectFirstCandidate
{
  return self->_selectFirstCandidate;
}

- (void)setSelectFirstCandidate:(BOOL)a3
{
  self->_selectFirstCandidate = a3;
}

- (BOOL)liveConversionForceEnabled
{
  return self->_liveConversionForceEnabled;
}

- (void)setLiveConversionForceEnabled:(BOOL)a3
{
  self->_liveConversionForceEnabled = a3;
}

- (BOOL)liveConversionForceDisabled
{
  return self->_liveConversionForceDisabled;
}

- (void)setLiveConversionForceDisabled:(BOOL)a3
{
  self->_liveConversionForceDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDisplayString, 0);
  objc_storeStrong((id *)&self->_smartPunctuationController, 0);
  objc_storeStrong((id *)&self->_recentlyCommittedCandidatesForReanalysis, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_candidateSorter, 0);
  objc_storeStrong((id *)&self->_kbws, 0);
}

@end
