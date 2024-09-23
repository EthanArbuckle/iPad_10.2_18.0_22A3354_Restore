@implementation TIKeyboardInputManager_zh_hant_Zhuyin

- (BOOL)usesComposingInput
{
  return _os_feature_enabled_impl();
}

- (BOOL)shouldResample
{
  return 1;
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
    -[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "length"))
    {
      v7 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
  v7 = -[TIKeyboardInputManagerChinese initialSelectedIndex](&v9, sel_initialSelectedIndex);
  if (v6)
    goto LABEL_5;
LABEL_6:

  return (unint64_t)v7;
}

- (id)didAcceptCandidate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
  -[TIKeyboardInputManagerChinesePhonetic didAcceptCandidate:](&v8, sel_didAcceptCandidate_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TIKeyboardInputManager_zh_hant_Zhuyin isDynamic](self, "isDynamic"))
  {
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_zh_hant_Zhuyin setAssertDefaultKeyPlane:](self, "setAssertDefaultKeyPlane:", objc_msgSend(v6, "count") != 0);

  }
  return v4;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
  -[TIKeyboardInputManagerChinesePhonetic handleAcceptedCandidate:keyboardState:](&v8, sel_handleAcceptedCandidate_keyboardState_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  objc_super v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[TIKeyboardInputManager_zh_hant_Zhuyin setAssertDefaultKeyPlane:](self, "setAssertDefaultKeyPlane:", 0);
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
  -[TIKeyboardInputManagerChinesePhonetic syncToKeyboardState:from:afterContextChange:](&v10, sel_syncToKeyboardState_from_afterContextChange_, v9, v8, v5);

}

- (void)syncToLayoutState:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
  v4 = a3;
  -[TIKeyboardInputManagerChinesePhonetic syncToLayoutState:](&v6, sel_syncToLayoutState_, v4);
  objc_msgSend(v4, "softwareLayout", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager_zh_hant_Zhuyin setDynamic:](self, "setDynamic:", objc_msgSend(v5, "isEqualToString:", CFSTR("ZhuyinDynamic")));
  -[TIKeyboardInputManager_zh_hant_Zhuyin setAssertDefaultKeyPlane:](self, "setAssertDefaultKeyPlane:", -[TIKeyboardInputManager_zh_hant_Zhuyin isDynamic](self, "isDynamic"));
}

- (unsigned)mapKeyboardLayoutKey:(unsigned __int16)a3
{
  if (a3 == 32)
    return 713;
  else
    return a3;
}

- (id)deleteFromInput:(unint64_t *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
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
  objc_super v22;

  if (-[TIKeyboardInputManager_zh_hant_Zhuyin usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerChinese wordSearch](self, "wordSearch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asInlineText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB5A98]);

    if (v8)
    {
      -[TIKeyboardInputManagerChinesePhonetic clearInput](self, "clearInput");
    }
    else
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
      TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                           + (int)*MEMORY[0x24BEB5498]));
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "composingInput");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);

    }
    v9 = 0;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
    -[TIKeyboardInputManagerChinesePhonetic deleteFromInput:](&v22, sel_deleteFromInput_, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[TIKeyboardInputManager_zh_hant_Zhuyin isDynamic](self, "isDynamic"))
    -[TIKeyboardInputManager_zh_hant_Zhuyin setAssertDefaultKeyPlane:](self, "setAssertDefaultKeyPlane:", -[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount") == 0);
  return v9;
}

- (BOOL)shouldInsertFirstToneMark
{
  void *v3;
  unsigned int v4;
  BOOL v5;

  -[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TIKeyboardInputManagerChinesePhonetic inputIndex](self, "inputIndex");
  if (objc_msgSend(v3, "length") >= (unint64_t)v4)
  {
    objc_msgSend(v3, "characterAtIndex:", v4 - 1);
    v5 = uscript_getScript() == 5;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)keyboardConfigurationLayoutTag
{
  objc_super v4;

  if (-[TIKeyboardInputManager_zh_hant_Zhuyin isDynamic](self, "isDynamic"))
    return (id)*MEMORY[0x24BEB52D8];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
  -[TIKeyboardInputManagerChinesePhonetic keyboardConfigurationLayoutTag](&v4, sel_keyboardConfigurationLayoutTag);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)syllableSeparator
{
  return (id)*MEMORY[0x24BEB4CC8];
}

- (BOOL)shouldReplaceCharacterOfInputStringBeforeCursorForInput:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = -[TIKeyboardInputManagerChinesePhonetic inputIndex](self, "inputIndex");
  objc_msgSend(v4, "substringToIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (objc_msgSend(v6, "_containsBopomofoToneOnly") && v5)
  {
    v8 = (int)*MEMORY[0x24BEB5490];
    if ((unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + v8), "length") < 2)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + v8), "substringWithRange:", v5 - 1, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "_containsBopomofoToneOnly");

    }
  }

  return v7;
}

- (id)validCharacterSetForAutocorrection
{
  return (id)objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinCharacterSet");
}

- (BOOL)delayedCandidateList
{
  return 1;
}

- (BOOL)shouldInvokeLiveConverison:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a3;
  if (-[TIKeyboardInputManager_zh_hant_Zhuyin liveConversionEnabled](self, "liveConversionEnabled"))
  {
    -[TIKeyboardInputManagerChinesePhonetic inputString](self, "inputString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    if (v6 == -[TIKeyboardInputManagerChinesePhonetic inputIndex](self, "inputIndex"))
    {
      objc_msgSend(v4, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length") != 0;

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
  if ((-[TIKeyboardInputManager_zh_hant_Zhuyin inHardwareKeyboardMode](self, "inHardwareKeyboardMode") & 1) == 0)
  {
    objc_msgSend(v4, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEB52E0]) & 1) != 0)
    {
      LOBYTE(v10) = 0;
    }
    else
    {
      objc_msgSend(v4, "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEB5A98]) ^ 1;

    }
    v8 &= v10;
  }

  return v8;
}

- (BOOL)liveConversionEnabled
{
  int v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  char v8;

  if (-[TIKeyboardInputManager_zh_hant_Zhuyin liveConversionForceEnabled](self, "liveConversionForceEnabled"))
    return 1;
  if (-[TIKeyboardInputManager_zh_hant_Zhuyin liveConversionForceDisabled](self, "liveConversionForceDisabled"))
    return 0;
  v4 = -[TIKeyboardInputManager_zh_hant_Zhuyin inHardwareKeyboardMode](self, "inHardwareKeyboardMode");
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

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super *v9;
  void *v11;
  char v12;
  void *v13;
  TIKeyboardInputManagerLiveConversion_zh *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  TIKeyboardInputManager_zh_Toneless *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  TIKeyboardInputManager_zh_hant_Zhuyin *v27;
  objc_super v28;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleKeyboardInput:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v4, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("\n")) & 1) != 0)
    {
LABEL_5:

LABEL_6:
      v28.receiver = self;
      v9 = &v28;
LABEL_7:
      v9->super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
      -[objc_super handleKeyboardInput:](v9, sel_handleKeyboardInput_, v4, v27);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(v4, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR(" ")))
    {

      goto LABEL_5;
    }
    objc_msgSend(v4, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("　"));

    if ((v12 & 1) != 0)
      goto LABEL_6;
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

LABEL_19:
      v27 = self;
      v9 = (objc_super *)&v27;
      goto LABEL_7;
    }
    if (!-[TIKeyboardInputManager_zh_hant_Zhuyin shouldInvokeLiveConverison:](self, "shouldInvokeLiveConverison:", v4))
      goto LABEL_19;
    if (-[TIKeyboardInputManager_zh_hant_Zhuyin inHardwareKeyboardMode](self, "inHardwareKeyboardMode"))
    {
      v14 = [TIKeyboardInputManagerLiveConversion_zh alloc];
      -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager_zh_hant_Zhuyin keyboardState](self, "keyboardState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[TIKeyboardInputManagerBase initWithInputMode:keyboardState:](v14, "initWithInputMode:keyboardState:", v15, v16);
    }
    else
    {
      v18 = [TIKeyboardInputManager_zh_Toneless alloc];
      -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager_zh_hant_Zhuyin keyboardState](self, "keyboardState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[TIKeyboardInputManager_zh_Toneless initWithInputMode:keyboardState:dynamic:](v18, "initWithInputMode:keyboardState:dynamic:", v15, v16, -[TIKeyboardInputManager_zh_hant_Zhuyin isDynamic](self, "isDynamic"));
    }
    v19 = (void *)v17;
    -[TIKeyboardInputManagerMecabra composeTextWith:](self, "composeTextWith:", v17);

    if (-[TIKeyboardInputManagerChinesePhonetic inputCount](self, "inputCount"))
    {
      v20 = objc_alloc_init(MEMORY[0x24BEB4E28]);
      -[TIKeyboardInputManagerChinesePhonetic rawInputString](self, "rawInputString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setString:", v21);

      v22 = objc_alloc(MEMORY[0x24BEB53B8]);
      -[TIKeyboardInputManager_zh_hant_Zhuyin keyboardState](self, "keyboardState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithKeyboardState:", v23);

      -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addInput:withContext:", v20, v24);

    }
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleKeyboardInput:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_19;
  }
LABEL_8:

  return v6;
}

- (void)commitComposition
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rawInputString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x24BEB4E28]);
    objc_msgSend(v7, "setString:", v6);
    v8 = objc_alloc(MEMORY[0x24BEB53B8]);
    -[TIKeyboardInputManager_zh_hant_Zhuyin keyboardState](self, "keyboardState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithKeyboardState:", v9);

    -[TIKeyboardInputManagerChinesePhonetic clearInput](self, "clearInput");
    TIInputManager::sync_with_input_from_UI(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                               + (int)*MEMORY[0x24BEB5498]));
    -[TIKeyboardInputManagerChinesePhonetic addInput:withContext:](self, "addInput:withContext:", v7, v10);

  }
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
  -[TIKeyboardInputManagerMecabra commitComposition](&v11, sel_commitComposition);
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

- (BOOL)isDynamic
{
  return self->_dynamic;
}

- (void)setDynamic:(BOOL)a3
{
  self->_dynamic = a3;
}

- (BOOL)isAssertDefaultKeyPlane
{
  return self->_assertDefaultKeyPlane;
}

- (void)setAssertDefaultKeyPlane:(BOOL)a3
{
  self->_assertDefaultKeyPlane = a3;
}

@end
