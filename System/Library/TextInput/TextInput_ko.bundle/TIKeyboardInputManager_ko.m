@implementation TIKeyboardInputManager_ko

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (TIKeyboardInputManager_ko)initWithConfig:(id)a3 keyboardState:(id)a4
{
  id v6;
  TIKeyboardInputManager_ko *v7;
  TIKeyboardInputManager_ko *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  TIWordSearch *wordSearch;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardInputManager_ko;
  v7 = -[TIKeyboardInputManagerMecabra initWithConfig:keyboardState:](&v14, sel_initWithConfig_keyboardState_, v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_deleteSyllable = 1;
    -[TIKeyboardInputManager_ko initializeKeyLayoutMap](v7, "initializeKeyLayoutMap");
    objc_msgSend(MEMORY[0x24BEB5470], "sharedWordSearchController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wordSearchForInputMode:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    wordSearch = v8->_wordSearch;
    v8->_wordSearch = (TIWordSearch *)v11;

  }
  return v8;
}

- (void)initImplementation
{
  void *result;
  TIInputManager_ko *v3;

  result = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (!result)
  {
    v3 = (TIInputManager_ko *)operator new();
    TIInputManager_ko::TIInputManager_ko(v3);
  }
  return result;
}

- (Hangul2SetAutomata)batchConverter
{
  Hangul2SetAutomata *result;
  Hangul2SetAutomata *v4;

  result = self->_batchConverter;
  if (!result)
  {
    v4 = (Hangul2SetAutomata *)operator new();
    Hangul2SetAutomata::Hangul2SetAutomata(v4);
    self->_batchConverter = result;
  }
  return result;
}

- (void)syncToLayoutState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_ko;
  -[TIKeyboardInputManager_ko syncToLayoutState:](&v10, sel_syncToLayoutState_, v4);
  objc_msgSend(v4, "softwareLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Korean10Key"));

  if (v6)
  {
    *(_BYTE *)(-[TIKeyboardInputManager_ko batchConverter](self, "batchConverter") + 36) = 1;
    TIInputManager_ko::set_is_10key(*(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]), 1);
    -[TIKeyboardInputManager_ko wordSearch](self, "wordSearch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTenKeyEnabled:", 1);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v4, "softwareLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Korean-With-QWERTY"));

  if (v9)
  {
    -[TIKeyboardInputManager_ko wordSearch](self, "wordSearch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBilingualEnabled:", 1);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)dealloc
{
  Hangul2SetAutomata *batchConverter;
  objc_super v4;

  batchConverter = self->_batchConverter;
  if (batchConverter)
  {
    Hangul2SetAutomata::~Hangul2SetAutomata(batchConverter);
    MEMORY[0x234902A68]();
    self->_batchConverter = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ko;
  -[TIKeyboardInputManagerMecabra dealloc](&v4, sel_dealloc);
}

- (id)composeJamo:(id)a3
{
  __CFString *v4;
  __CFString *v5;

  v4 = (__CFString *)a3;
  v5 = __composeJamo(v4, -[TIKeyboardInputManager_ko batchConverter](self, "batchConverter"));

  return v5;
}

- (BOOL)canHandleKeyHitTest
{
  unsigned int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_ko;
  v3 = -[TIKeyboardInputManager_ko canHandleKeyHitTest](&v5, sel_canHandleKeyHitTest);
  if (v3)
    LOBYTE(v3) = TIInputManager_ko::is_10key(*(TIInputManager_ko **)((char *)&self->super.super.super.super.super.isa
                                                                   + (int)*MEMORY[0x24BEB5498])) ^ 1;
  return v3;
}

- (BOOL)doesComposeText
{
  return 1;
}

- (BOOL)forceAutomaticMultiLanguageSwitch
{
  return 1;
}

- (BOOL)usesComposingInput
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[TIKeyboardInputManagerBase currentInputModeIdentifier](self, "currentInputModeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetComponentsFromIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("sw"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (objc_msgSend(v5, "isEqualToString:", CFSTR("Korean")) & 1) != 0
    || -[TIKeyboardInputManager_ko isUsingMultilingual](self, "isUsingMultilingual");

  return v6;
}

- (BOOL)canTypeAndPathSimultaneously
{
  return 0;
}

- (BOOL)shouldResample
{
  return 0;
}

- (BOOL)shouldRescaleTouchPoints
{
  return 0;
}

- (BOOL)dictionaryUsesExternalEncoding
{
  return 0;
}

- (unsigned)pathedWordSeparatorChar
{
  return 32;
}

- (id)externalStringToInternal:(id)a3
{
  return -[TIKeyboardInputManager_ko externalStringToInternal:ignoreCompositionDisabled:](self, "externalStringToInternal:ignoreCompositionDisabled:", a3, 0);
}

- (id)externalStringToInternal:(id)a3 ignoreCompositionDisabled:(BOOL)a4
{
  NSString *v6;
  NSString *v7;
  NSString *v8;

  v6 = (NSString *)a3;
  if (a4 || !-[TIKeyboardInputManager_mul choseSecondary](self, "choseSecondary"))
  {
    DecomposeHangul(v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (id)internalStringToSecondaryExternal:(id)a3
{
  id v4;
  uint64_t v5;
  const KB::String *v6;
  void *v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  __CFString *v18;
  _BYTE v20[32];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (int)*MEMORY[0x24BEB5498];
  TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.super.super.isa + v5));
  KB::ns_string((KB *)v20, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  KB::String::~String((KB::String *)v20);
  v9 = objc_msgSend(v4, "length");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = &stru_2501289D8;
    do
    {
      objc_msgSend(v4, "substringWithRange:", v11, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager_ko keyLayoutMap](self, "keyLayoutMap");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v14);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (v8
          && TIInputManager::is_uppercase(*(TIInputManager **)((char *)&self->super.super.super.super.super.isa
                                                                           + v5)))
        {
          objc_msgSend(v16, "uppercaseString");
          v17 = objc_claimAutoreleasedReturnValue();

          v16 = (id)v17;
        }
      }
      else
      {
        v16 = v14;
      }
      -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v16);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v13 = v18;
      v11 = ++v12;
    }
    while (v10 > v12);
  }
  else
  {
    v18 = &stru_2501289D8;
  }

  return v18;
}

- (id)internalStringToExternal:(id)a3
{
  return -[TIKeyboardInputManager_ko internalStringToExternal:ignoreCompositionDisabled:](self, "internalStringToExternal:ignoreCompositionDisabled:", a3, 0);
}

- (id)internalStringToExternal:(id)a3 ignoreCompositionDisabled:(BOOL)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  if (a4 || !-[TIKeyboardInputManager_mul choseSecondary](self, "choseSecondary"))
  {
    -[TIKeyboardInputManager_ko composeJamo:](self, "composeJamo:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TIKeyboardInputManager_ko internalStringToSecondaryExternal:](self, "internalStringToSecondaryExternal:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (void)clearInput
{
  objc_super v2;

  self->_deleteSyllable = 1;
  v2.receiver = self;
  v2.super_class = (Class)TIKeyboardInputManager_ko;
  -[TIKeyboardInputManagerMecabra clearInput](&v2, sel_clearInput);
}

- (void)setInput:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[TIKeyboardInputManager_ko clearInput](self, "clearInput");
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_ko;
  -[TIKeyboardInputManager_ko setInput:](&v5, sel_setInput_, v4);

}

- (void)setInputIndex:(unsigned int)a3
{
  objc_super v3;

  self->_deleteSyllable = 1;
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ko;
  -[TIKeyboardInputManager_ko setInputIndex:](&v3, sel_setInputIndex_, *(_QWORD *)&a3);
}

- (BOOL)shouldExtendPriorWord
{
  return 0;
}

- (BOOL)supportsLearning
{
  return 1;
}

- (BOOL)whiteSpaceEndsSentence
{
  return 0;
}

- (BOOL)apostropheEndsSentence
{
  return 0;
}

- (BOOL)usesMarkedTextForInput
{
  return 0;
}

- (void)setLearnsCorrection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_ko;
  -[TIKeyboardInputManager_ko setLearnsCorrection:](&v6, sel_setLearnsCorrection_);
  -[TIKeyboardInputManager_ko wordSearch](self, "wordSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldLearnAcceptedCandidate:", v3);

}

- (void)setAutoCorrects:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIKeyboardInputManager_ko wordSearch](self, "wordSearch");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoCorrects:", v3);

}

- (id)rawInputString
{
  const KB::String *v2;
  void *v3;
  _BYTE v5[32];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.super.super.isa
                                                  + (int)*MEMORY[0x24BEB5498]));
  KB::ns_string((KB *)v5, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  KB::String::~String((KB::String *)v5);
  return v3;
}

- (BOOL)acceptsCharacter:(unsigned int)a3
{
  uint64_t v3;
  USet *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v5 = -[TIKeyboardInputManager_ko validUSetForAutocorrection](self, "validUSetForAutocorrection");
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManager_ko;
  return -[TIKeyboardInputManager_ko acceptsCharacter:](&v7, sel_acceptsCharacter_, v3)
      || MEMORY[0x234902C3C](v5, v3) != 0;
}

- (id)validCharacterSetForAutocorrection
{
  return 0;
}

- (USet)validUSetForAutocorrection
{
  if (-[TIKeyboardInputManager_ko validUSetForAutocorrection]::onceToken != -1)
    dispatch_once(&-[TIKeyboardInputManager_ko validUSetForAutocorrection]::onceToken, &__block_literal_global_0);
  return (USet *)-[TIKeyboardInputManager_ko validUSetForAutocorrection]::hangul_set;
}

- (id)geometryModelData
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  char *v20;
  int v21;
  char *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t *v30;
  id v31;
  id v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (-[TIKeyboardInputManager_ko usesComposingInput](self, "usesComposingInput"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v4;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v39;
      v26 = *(_QWORD *)v39;
      do
      {
        v8 = 0;
        v28 = v6;
        do
        {
          if (*(_QWORD *)v39 != v7)
            objc_enumerationMutation(v29);
          v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = v9;
            objc_msgSend(v10, "nearbyKeys");
            v31 = (id)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v31, "count");
            v30 = &v25;
            v12 = (char *)&v25 - ((8 * v11 + 23) & 0xFFFFFFFFFFFFFFF0);
            v36 = 0u;
            v37 = 0u;
            v34 = 0u;
            v35 = 0u;
            v32 = v10;
            objc_msgSend(v10, "nearbyKeys");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v14)
            {
              v15 = v14;
              v16 = 0;
              v17 = *(_QWORD *)v35;
              do
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v35 != v17)
                    objc_enumerationMutation(v13);
                  v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                  if (objc_msgSend(v19, "character"))
                  {
                    v20 = &v12[8 * v16];
                    *(_WORD *)v20 = objc_msgSend(v19, "character");
                    objc_msgSend(v19, "logLikelihood");
                    *((_DWORD *)v20 + 1) = v21;
                    ++v16;
                  }
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              }
              while (v15);
            }
            else
            {
              v16 = 0;
            }

            v22 = &v12[8 * v16];
            *(_WORD *)v22 = 0;
            *((_DWORD *)v22 + 1) = 0;
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v12, 8 * (v16 + 1));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v23);

            v7 = v26;
            v6 = v28;
          }
          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v6);
    }

  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)TIKeyboardInputManager_ko;
    -[TIKeyboardInputManagerMecabra geometryModelData](&v33, sel_geometryModelData);
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v27;
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
  v23.super_class = (Class)TIKeyboardInputManager_ko;
  -[TIKeyboardInputManagerMecabra textAccepted:fromPredictiveInputBar:withInput:](&v23, sel_textAccepted_fromPredictiveInputBar_withInput_, v8, v6, v9);
  v10 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v8);
  -[TIKeyboardInputManager_ko wordSearch](self, "wordSearch");
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
    -[TIKeyboardInputManager_ko wordSearch](self, "wordSearch");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "commitSurface:", v17);

  }
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "composingInput");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v21 = 0;
LABEL_12:
    -[TIKeyboardInputManager_ko lastAcceptedText](self, "lastAcceptedText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ko clearInput](self, "clearInput");
    -[TIKeyboardInputManager_ko setLastAcceptedText:](self, "setLastAcceptedText:", v22);

    goto LABEL_13;
  }
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "composingInput");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21 || (objc_msgSend(v21, "isCompleting") & 1) != 0 || objc_msgSend(v21, "isComplete"))
    goto LABEL_12;
LABEL_13:

}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  int *v11;
  const KB::String *v12;
  void *v13;
  int v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;
  _BYTE v19[32];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_deleteSyllable = 0;
  if (!-[TIKeyboardInputManager_ko isUsingMultilingual](self, "isUsingMultilingual"))
  {
    objc_msgSend(v6, "setAutoshifted:", 0);
    objc_msgSend(v6, "setUppercase:", 0);
  }
  v9 = objc_msgSend(v6, "isMultitap");
  v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("ㆍ"));
  v11 = (int *)MEMORY[0x24BEB5498];
  if (!v10)
  {
    if (!v9)
      goto LABEL_12;
    v16 = 1;
    goto LABEL_11;
  }
  TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.super.super.isa
                                                  + (int)*MEMORY[0x24BEB5498]));
  KB::ns_string((KB *)v19, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  KB::String::~String((KB::String *)v19);
  v14 = objc_msgSend(v13, "hasSuffix:", CFSTR("ㆍㆍ"));

  v15 = v14 | v9;
  if (v14)
    v16 = 2;
  else
    v16 = 1;
  if ((v15 & 1) != 0)
  {
    do
    {
LABEL_11:
      -[TIKeyboardInputManagerMecabra deleteFromInputWithContext:](self, "deleteFromInputWithContext:", v7);
      --v16;
    }
    while (v16);
  }
LABEL_12:
  v18.receiver = self;
  v18.super_class = (Class)TIKeyboardInputManager_ko;
  -[TIKeyboardInputManager_ko addInput:withContext:](&v18, sel_addInput_withContext_, v6, v7);
  v17 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + *v11);
  if (v17 && -858993459 * ((*(_QWORD *)(v17 + 16) - *(_QWORD *)(v17 + 8)) >> 3))
    -[TIKeyboardInputManagerMecabra saveGeometryForInput:atIndex:](self, "saveGeometryForInput:atIndex:", v6, *(unsigned int *)(v17 + 96));
  if (-[TIKeyboardInputManager_ko usesComposingInput](self, "usesComposingInput")
    && v8
    && -[TIKeyboardInputManagerMecabra stringEndsWord:](self, "stringEndsWord:", v8))
  {
    -[TIKeyboardInputManager_ko clearInput](self, "clearInput");
  }

}

- (id)deleteFromInput:(unint64_t *)a3
{
  uint64_t v6;
  unsigned int v7;
  const KB::String *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v24;
  _BYTE v25[32];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    *a3 = 0;
    if (!self->_deleteSyllable)
    {
      *a3 = 1;
      goto LABEL_6;
    }
LABEL_5:
    v24.receiver = self;
    v24.super_class = (Class)TIKeyboardInputManager_ko;
    -[TIKeyboardInputManager_ko deleteFromInput:](&v24, sel_deleteFromInput_, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (self->_deleteSyllable)
    goto LABEL_5;
LABEL_6:
  v6 = (int)*MEMORY[0x24BEB5498];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v6))
    return 0;
  v7 = -[TIKeyboardInputManager_ko inputIndex](self, "inputIndex");
  TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.super.isa + v6));
  TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.super.super.isa + v6));
  KB::ns_string((KB *)v25, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  KB::String::~String((KB::String *)v25);
  v10 = (*(_DWORD **)((char *)&self->super.super.super.super.super.isa + v6))[24];
  if (-[TIKeyboardInputManager_ko usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManager_ko wordSearch](self, "wordSearch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancel");

    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeComposingInput");

    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "composingInput");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "asInlineText");
    v16 = objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v17, "asInlineTextCursorIndex");

    v9 = (void *)v16;
  }
  v18 = (int)*MEMORY[0x24BEB5490];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v18))
  {
    -[TIKeyboardInputManager_ko internalStringToExternal:](self, "internalStringToExternal:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "_indexFromStartingIndex:byIncrementingComposedCharacterSequenceCount:", 0, v10));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ko internalStringToExternal:](self, "internalStringToExternal:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager_ko suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:](self, "suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:", v21, *(Class *)((char *)&self->super.super.super.super.super.isa + v18), v7, a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v18), "setString:", v19);
    if (!objc_msgSend(v22, "length"))
    {

      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  return v23;
}

- (unint64_t)additionalAnalysisOptions
{
  void *v2;
  unint64_t v3;

  -[TIKeyboardInputManager_ko wordSearch](self, "wordSearch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "tenKeyEnabled"))
    v3 = 2105344;
  else
    v3 = 0x200000;
  if (objc_msgSend(v2, "bilingualEnabled"))
    v3 &= 0x2000u;

  return v3;
}

- (BOOL)isUsingMultilingual
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  if (!_os_feature_enabled_impl())
    return 0;
  -[TIKeyboardInputManagerBase currentInputModeIdentifier](self, "currentInputModeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetComponentsFromIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("sw"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Korean-With-QWERTY")))
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_ko;
    v6 = -[TIKeyboardInputManager_mul isUsingMultilingual](&v8, sel_isUsingMultilingual);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)maxDrawSamplesWithNoCandidatesResult
{
  return 0;
}

- (void)initializeKeyLayoutMap
{
  NSDictionary *keyLayoutMap;

  if (-[TIKeyboardInputManager_ko isUsingMultilingual](self, "isUsingMultilingual"))
  {
    keyLayoutMap = self->_keyLayoutMap;
    self->_keyLayoutMap = (NSDictionary *)&unk_250129A78;

  }
}

- (NSDictionary)keyLayoutMap
{
  if (-[TIKeyboardInputManager_ko isUsingMultilingual](self, "isUsingMultilingual") && !self->_keyLayoutMap)
    -[TIKeyboardInputManager_ko initializeKeyLayoutMap](self, "initializeKeyLayoutMap");
  return self->_keyLayoutMap;
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyLayoutMap, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

@end
