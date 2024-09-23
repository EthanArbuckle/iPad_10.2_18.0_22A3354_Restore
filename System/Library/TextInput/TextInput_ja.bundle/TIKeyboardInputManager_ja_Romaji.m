@implementation TIKeyboardInputManager_ja_Romaji

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (id)wordCharacters
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D00], "romajiWordCharacters");
}

- (BOOL)usesComposingInput
{
  return _os_feature_enabled_impl();
}

- (BOOL)shouldFixupIncompleteRomaji
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;

  -[TIKeyboardInputManager_ja_Romaji keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputForMarkedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
    goto LABEL_4;
  -[TIKeyboardInputManager_ja_Romaji keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userSelectedCurrentCandidate"))
  {

LABEL_4:
    return 0;
  }
  -[TIKeyboardInputManager_ja_Romaji keyboardState](self, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hardwareKeyboardMode");

  if (!v8)
    return 0;
  -[TIKeyboardInputManager_ja_Romaji keyboardState](self, "keyboardState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputForMarkedText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  v12 = 0;
  v13 = v11 - 1;
  do
  {
    v14 = v12;
    v15 = v13 + v12;
    if (v13 + v12 < 0)
      break;
    -[TIKeyboardInputManager_ja_Romaji keyboardState](self, "keyboardState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inputForMarkedText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "characterAtIndex:", v15);

    v12 = v14 - 1;
  }
  while (v18 == 110);
  return v14 & 1;
}

- (id)liveConversionTextInputManager
{
  TIKeyboardInputManagerLiveConversion_ja_Romaji *v3;
  void *v4;
  void *v5;
  TIKeyboardInputManagerLiveConversion_ja_Romaji *v6;
  TIKeyboardInputManager_ja_Inline *v7;
  void *v8;

  if (-[TIKeyboardInputManager_ja_Romaji inHardwareKeyboardMode](self, "inHardwareKeyboardMode"))
  {
    v3 = [TIKeyboardInputManagerLiveConversion_ja_Romaji alloc];
    -[TIKeyboardInputManager_ja_Romaji config](self, "config");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Romaji keyboardState](self, "keyboardState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TIKeyboardInputManagerLiveConversion_ja_Romaji initWithConfig:keyboardState:](v3, "initWithConfig:keyboardState:", v4, v5);
  }
  else
  {
    v7 = [TIKeyboardInputManager_ja_Inline alloc];
    -[TIKeyboardInputManager_ja_Romaji config](self, "config");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja_Romaji keyboardState](self, "keyboardState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ja wordSearch](self, "wordSearch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TIKeyboardInputManager_ja_Inline initWithConfig:keyboardState:wordSearch:romajiMode:](v7, "initWithConfig:keyboardState:wordSearch:romajiMode:", v4, v5, v8, 1);

  }
  return v6;
}

- (void)loadDictionaries
{
  void *v3;
  void *v4;
  TIWordSearch *v5;
  TIWordSearch *kbws;

  objc_msgSend(MEMORY[0x24BEB5470], "sharedWordSearchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wordSearchForInputMode:", v4);
  v5 = (TIWordSearch *)objc_claimAutoreleasedReturnValue();
  kbws = self->super._kbws;
  self->super._kbws = v5;

  -[TIWordSearch setInsertKatakanaAtIndex:](self->super._kbws, "setInsertKatakanaAtIndex:", 4);
}

- (BOOL)usesCandidateSelection
{
  void *v2;
  char v3;

  -[TIKeyboardInputManager_ja_Romaji keyboardState](self, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suppressingCandidateSelection") ^ 1;

  return v3;
}

- (TIKeyboardInputManager_ja_Romaji)initWithConfig:(id)a3 keyboardState:(id)a4
{
  TIKeyboardInputManager_ja_Romaji *v4;
  uint64_t v5;
  NSMutableArray *externalIndexToInternalIndexMappingArray;
  NSString *externalString;
  TIMathSymbolPunctuationController *v8;
  TIMathSymbolPunctuationController *mathSymbolPunctuationController;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  v4 = -[TIKeyboardInputManager_ja initWithConfig:keyboardState:](&v11, sel_initWithConfig_keyboardState_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
    externalIndexToInternalIndexMappingArray = v4->_externalIndexToInternalIndexMappingArray;
    v4->_externalIndexToInternalIndexMappingArray = (NSMutableArray *)v5;

    v4->_externalInputIndex = 0;
    externalString = v4->_externalString;
    v4->_externalString = 0;

    v8 = (TIMathSymbolPunctuationController *)objc_alloc_init(MEMORY[0x24BEB53F8]);
    mathSymbolPunctuationController = v4->_mathSymbolPunctuationController;
    v4->_mathSymbolPunctuationController = v8;

  }
  return v4;
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
  v3.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  -[TIKeyboardInputManager_ja dealloc](&v3, sel_dealloc);
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v16;
  int v17;
  const __CFString *v18;
  objc_super v19;

  v4 = a3;
  if ((v5 & 1) == 0
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    -[TIKeyboardInputManager_ja_Romaji handleKeyboardInput:]::whitespace = objc_claimAutoreleasedReturnValue();
  }
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_3;
  v7 = (void *)-[TIKeyboardInputManager_ja_Romaji handleKeyboardInput:]::whitespace;
  objc_msgSend(v4, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "longCharacterIsMember:", objc_msgSend(v8, "_firstLongCharacter"));

  if (!(_DWORD)v7)
    goto LABEL_15;
  if (-[TIKeyboardInputManager_ja_Romaji shouldFixupIncompleteRomaji](self, "shouldFixupIncompleteRomaji"))
  {
    -[TIKeyboardInputManager_ja candidateResultSet](self, "candidateResultSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isBilingualCandidate"))
      {

LABEL_18:
        v18 = &stru_250122EC0;
LABEL_20:
        objc_msgSend(v4, "setString:", v18);
        -[TIKeyboardInputManager_ja setSelectFirstCandidate:](self, "setSelectFirstCandidate:", 1);
LABEL_3:

LABEL_15:
        v19.receiver = self;
        v19.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
        -[TIKeyboardInputManager_ja handleKeyboardInput:](&v19, sel_handleKeyboardInput_, v4);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      objc_msgSend(v6, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isAsIsCandidate");

      if (v17)
        goto LABEL_18;
    }
    v18 = CFSTR("n");
    goto LABEL_20;
  }
  v11 = objc_alloc_init(MEMORY[0x24BEB4E58]);
  objc_msgSend(v4, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR(" ")))
  {
    v13 = -[TIKeyboardInputManager_ja shouldOutputFullwidthSpace](self, "shouldOutputFullwidthSpace");

    if (v13)
    {
      objc_msgSend(v11, "insertText:", CFSTR("　"));
      goto LABEL_14;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertText:", v14);

LABEL_14:
  if (!v11)
    goto LABEL_15;
LABEL_16:

  return v11;
}

- (id)convertInput:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[Romakana hiraganaString:mappingArray:](Romakana, "hiraganaString:mappingArray:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_convertToKana:(id)a3
{
  id v3;
  CFCharacterSetRef v4;
  const __CFCharacterSet *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  const __CFCharacterSet *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (CFCharacterSetRef)_romanAlphabetCharacterSet;
  if (!_romanAlphabetCharacterSet)
  {
    v4 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"));
    _romanAlphabetCharacterSet = (uint64_t)v4;
  }
  v5 = v4;
  -[__CFCharacterSet invertedSet](v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v3;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filterUsingPredicate:", v13);

    v26 = v5;
    v14 = -[__CFCharacterSet characterIsMember:](v5, "characterIsMember:", objc_msgSend(v3, "_firstChar"));
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v14 & 1) == 0 && objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendString:", v15);

      objc_msgSend(v12, "removeObjectAtIndex:", 0);
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = v9;
    v16 = v9;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v20), "lowercaseString", v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[Romakana hiraganaString:mappingArray:](Romakana, "hiraganaString:mappingArray:", v21, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "appendString:", v22);
          if (objc_msgSend(v12, "count"))
          {
            objc_msgSend(v12, "firstObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "appendString:", v23);

            objc_msgSend(v12, "removeObjectAtIndex:", 0);
          }

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v18);
    }

    v9 = v25;
    v5 = v26;
  }

  return v10;
}

- (void)updateState
{
  TIKeyboardInputManager_ja_Romaji *v2;
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  NSString *externalString;
  void *v49;
  void *v50;
  uint64_t v51;
  NSString *v52;
  NSMutableArray *externalIndexToInternalIndexMappingArray;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  NSMutableArray *v62;
  void *v63;
  __CFString *v64;
  id v65;
  __CFString *v66;
  void *v67;
  TIKeyboardInputManager_ja_Romaji *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  objc_super v74;
  objc_super v75;
  _BYTE v76[128];
  _QWORD v77[3];

  v2 = self;
  v77[1] = *MEMORY[0x24BDAC8D0];
  v75.receiver = self;
  v75.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  -[TIKeyboardInputManager_ja updateState](&v75, sel_updateState);
  v68 = v2;
  if (-[TIKeyboardInputManager_ja_Romaji usesComposingInput](v2, "usesComposingInput"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BEB5320]);
    while (1)
    {
      -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "composingInput");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        break;
      -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "composingInput");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "insertInput:atIndex:", v8, 0);

      -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeComposingInput");

    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "asSearchString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lowercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[Romakana hiraganaString:mappingArray:](Romakana, "hiraganaString:mappingArray:", v19, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "length"))
    {
      v21 = 0;
      v67 = v17;
      while (1)
      {
        if (objc_msgSend(v17, "count") <= v21)
          goto LABEL_21;
        v22 = objc_msgSend(v20, "characterAtIndex:", v21);
        objc_msgSend(v17, "objectAtIndexedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "intValue");

        objc_msgSend(v3, "inputs");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24 != 1)
          break;
        objc_msgSend(v26, "characters");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (__tolower(objc_msgSend(v27, "_firstChar")) == (_DWORD)v22)
        {

        }
        else
        {
          objc_msgSend(v26, "characters");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "_firstChar");

          if ((_DWORD)v22 != v29)
            break;
        }
        v2 = v68;
        -[TIKeyboardInputManagerMecabra composingInput](v68, "composingInput");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "inputs");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "composeNew:", v32);

        objc_msgSend(v3, "removeInputAtIndex:", 0);
LABEL_20:

        if (objc_msgSend(v20, "length") <= ++v21)
          goto LABEL_21;
      }
      v33 = objc_alloc(MEMORY[0x24BEB5330]);
      objc_msgSend(MEMORY[0x24BDD17C8], "_stringWithUnichar:", v22);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = v34;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v33, "initWithCommittedText:syllables:useSubInputsAsSearchString:", &stru_250122EC0, v35, 1);

      objc_msgSend(v36, "setIncludeSuffixAsSearchString:", 1);
      if (v24 >= 1)
      {
        do
        {
          objc_msgSend(v3, "inputs");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "firstObject");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "composeNew:", v38);

          objc_msgSend(v3, "removeInputAtIndex:", 0);
          --v24;
        }
        while (v24);
      }
      -[TIKeyboardInputManagerMecabra composingInput](v68, "composingInput");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "composeNew:", v36);

      v2 = v68;
      v17 = v67;
      goto LABEL_20;
    }
LABEL_21:
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](v2, "wordSearchCandidateResultSet");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "candidates");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "firstObject");
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v43, "hasKindOf:", objc_opt_class()) & 1) != 0)
    {
      -[__CFString input](v42, "input");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        v45 = (void *)objc_opt_class();
        -[__CFString input](v42, "input");
        v46 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "_convertToKana:", v46);
        v47 = objc_claimAutoreleasedReturnValue();
LABEL_26:
        externalString = v2->_externalString;
        v2->_externalString = (NSString *)v47;

LABEL_27:
        goto LABEL_28;
      }
    }
    else
    {

    }
    -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "asInlineText");
    v47 = objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  v10 = v2->_externalString;
  v2->_externalString = 0;

  -[NSMutableArray removeAllObjects](v2->_externalIndexToInternalIndexMappingArray, "removeAllObjects");
  v2->_externalInputIndex = 0;
  v74.receiver = v2;
  v74.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  -[TIKeyboardInputManager_ja inputString](&v74, sel_inputString);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v73.receiver = v2;
  v73.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  v11 = -[TIKeyboardInputManager_ja inputIndex](&v73, sel_inputIndex);
  if (v3)
  {
    v12 = v11;
    if (objc_msgSend(v3, "length"))
    {
      v13 = v12;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v3, "substringToIndex:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lowercaseString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[Romakana hiraganaString:mappingArray:](Romakana, "hiraganaString:mappingArray:", v16, v14);
        v66 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v66 = &stru_250122EC0;
      }
      if (objc_msgSend(v3, "length") <= (unint64_t)v12)
      {
        v42 = &stru_250122EC0;
      }
      else
      {
        objc_msgSend(v3, "substringFromIndex:", v12);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "lowercaseString");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[Romakana hiraganaString:mappingArray:](Romakana, "hiraganaString:mappingArray:", v50, v14);
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      -[__CFString stringByAppendingString:](v66, "stringByAppendingString:", v42);
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = v2->_externalString;
      v2->_externalString = (NSString *)v51;

      v2->_externalInputIndex = 0x7FFFFFFFFFFFFFFFLL;
      externalIndexToInternalIndexMappingArray = v2->_externalIndexToInternalIndexMappingArray;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](externalIndexToInternalIndexMappingArray, "addObject:", v54);

      if (!(_DWORD)v13)
        v2->_externalInputIndex = 0;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v46 = v14;
      v55 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
      if (v55)
      {
        v56 = v55;
        v57 = v46;
        v64 = v42;
        v65 = v3;
        v58 = 0;
        v59 = 0;
        v60 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v56; ++i)
          {
            if (*(_QWORD *)v70 != v60)
              objc_enumerationMutation(v57);
            v58 += (int)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "intValue");
            v62 = v2->_externalIndexToInternalIndexMappingArray;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v58);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](v62, "addObject:", v63);

            v2 = v68;
            if (v58 == v13)
              v68->_externalInputIndex = v59 + i + 1;
          }
          v56 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
          v59 += i;
        }
        while (v56);
        v46 = v57;
        v17 = v57;
        v3 = v65;
        v20 = v66;
        v42 = v64;
      }
      else
      {
        v17 = v46;
        v20 = v66;
      }
      goto LABEL_27;
    }
  }
LABEL_28:

}

- (id)transliterate:(id)a3
{
  id v4;
  void *v5;
  const __CFCharacterSet *v6;
  int IsCharacterMember;
  id v8;

  v4 = a3;
  -[TIKeyboardInputManager_ja_Romaji keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "hardwareKeyboardMode"))
    goto LABEL_6;
  v6 = (const __CFCharacterSet *)_romanAlphabetCharacterSet;
  if (!_romanAlphabetCharacterSet)
  {
    v6 = CFCharacterSetCreateWithCharactersInString(0, CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"));
    _romanAlphabetCharacterSet = (uint64_t)v6;
  }
  IsCharacterMember = CFCharacterSetIsCharacterMember(v6, objc_msgSend(v4, "characterAtIndex:", 0));

  if (!IsCharacterMember)
  {
    +[Romakana kanaSymbol:](Romakana, "kanaSymbol:", v4);
    v5 = v4;
    v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:

  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB5AA8]))
  {
    v8 = (id)*MEMORY[0x24BEB5A98];

    v4 = v8;
  }
  return v4;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  TIMathSymbolPunctuationController *mathSymbolPunctuationController;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned int v54;
  unsigned int v55;
  void *v56;
  void *v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  objc_super v63;
  objc_super v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  self->super._remainingInputLength = 0;
  if (v8 && objc_msgSend(v8, "length"))
  {
    if (-[TIKeyboardInputManager_ja_Romaji shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
    {
      v64.receiver = self;
      v64.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
      -[TIKeyboardInputManager_ja_Romaji addInput:withContext:](&v64, sel_addInput_withContext_, v6, v7);
      goto LABEL_47;
    }
    -[TIKeyboardInputManager_ja rawInputString](self, "rawInputString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TIKeyboardInputManager_ja_Romaji inputCount](self, "inputCount")
      && ((v11 = *MEMORY[0x24BEB5AA0], (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEB5AA0]) & 1) != 0)
       || (v12 = *MEMORY[0x24BEB5AA8], (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEB5AA8]) & 1) != 0)
       || (v13 = *MEMORY[0x24BEB5A98], (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEB5A98]) & 1) != 0)
       || (objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0
       || (objc_msgSend(v10, "isEqualToString:", v12) & 1) != 0
       || objc_msgSend(v10, "isEqualToString:", v13)))
    {
      if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) != 0)
      {
LABEL_46:

        goto LABEL_47;
      }
      -[TIKeyboardInputManager_ja_Romaji acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v7);
    }
    else
    {
      -[TIKeyboardInputManager_ja_Romaji acceptCurrentCandidateIfSelectedWithContext:](self, "acceptCurrentCandidateIfSelectedWithContext:", v7);
    }
    -[TIKeyboardInputManager_ja setIsEmojiFacemarkMode:](self, "setIsEmojiFacemarkMode:", 0);
    -[TIKeyboardInputManager_ja setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
    -[TIKeyboardInputManager_ja_Romaji inputString](self, "inputString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    v16 = -[TIKeyboardInputManager_ja_Romaji inputIndex](self, "inputIndex");
    if (objc_msgSend(v9, "length") == 1)
    {
      TIInputManager::initialize_search_if_necessary_from_last_touch(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.isa
                                                                                        + (int)*MEMORY[0x24BEB5498]));
      -[TIKeyboardInputManager_ja_Romaji transliterate:](self, "transliterate:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if ((-[TIKeyboardInputManager_ja_Romaji inHardwareKeyboardMode](self, "inHardwareKeyboardMode") & 1) != 0)
        v18 = 0;
      else
        v18 = objc_msgSend(v6, "isPopupVariant");
      -[TIKeyboardInputManager_ja stringByConvertingPunctuationForInput:isLockedInput:](self, "stringByConvertingPunctuationForInput:isLockedInput:", v17, v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "touchEvent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "location");
      -[TIKeyboardInputManager_ja _addInput:point:](self, "_addInput:point:", v9);

    }
    else if (objc_msgSend(v9, "length"))
    {
      v54 = v16;
      v19 = v15;
      v20 = 0;
      do
      {
        objc_msgSend(v9, "substringWithRange:", v20, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager_ja_Romaji transliterate:](self, "transliterate:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "touchEvent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "location");
        -[TIKeyboardInputManager_ja _addInput:point:](self, "_addInput:point:", v22);

        ++v20;
      }
      while (objc_msgSend(v9, "length") > v20);
      v15 = v19;
      v16 = v54;
    }
    v63.receiver = self;
    v63.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    -[TIKeyboardInputManagerMecabra saveGeometryForInput:atIndex:](self, "saveGeometryForInput:atIndex:", v6, -[TIKeyboardInputManager_ja inputIndex](&v63, sel_inputIndex));
    -[TIKeyboardInputManager_ja_Romaji updateState](self, "updateState");
    mathSymbolPunctuationController = self->_mathSymbolPunctuationController;
    -[TIKeyboardInputManager_ja rawInputString](self, "rawInputString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMathSymbolPunctuationController mathSymbolPunctuationedStringForInputString:](mathSymbolPunctuationController, "mathSymbolPunctuationedStringForInputString:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      if (-[TIKeyboardInputManager_ja_Romaji usesComposingInput](self, "usesComposingInput"))
      {
        v55 = v16;
        v53 = v15;
        v56 = v10;
        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v28 = v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v29, "composingInputIndex");

        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeAllInputs");

        v52 = v28;
        objc_msgSend(v28, "_asTypeInputs");
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "inputs");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v60;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v60 != v34)
                objc_enumerationMutation(v31);
              v36 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
              -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "composeNew:", v36);

            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
          }
          while (v33);
        }

        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "inputs");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "count");

        if (v50 < v40)
        {
          -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "inputs");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectAtIndexedSubscript:", v50);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setComposingInput:", v43);

        }
        v10 = v56;
        v27 = v52;
        v15 = v53;
        v16 = v55;
      }
      else
      {
        v45 = -[TIKeyboardInputManager_ja_Romaji inputIndex](self, "inputIndex");
        -[TIKeyboardInputManager_ja setInput:](self, "setInput:", v27);
        -[TIKeyboardInputManager_ja_Romaji setInputIndex:](self, "setInputIndex:", v45);
      }
      -[TIKeyboardInputManager_ja_Romaji updateState](self, "updateState");
    }
    if (-[TIKeyboardInputManager_ja_Romaji usesCandidateSelection](self, "usesCandidateSelection"))
    {
      -[TIKeyboardInputManager_ja_Romaji setMarkedText](self, "setMarkedText");
    }
    else
    {
      v57 = v10;
      v58 = 0;
      v46 = v27;
      -[TIKeyboardInputManager_ja_Romaji inputString](self, "inputString");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "substringToIndex:", -[TIKeyboardInputManager_ja_Romaji inputIndex](self, "inputIndex"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIKeyboardInputManager_ja_Romaji suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:](self, "suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:", v48, v15, v16, &v58);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
        objc_msgSend(v7, "deleteBackward:");
      if (v49)
        objc_msgSend(v7, "insertText:", v49);

      v27 = v46;
      v10 = v57;
    }

    goto LABEL_46;
  }
LABEL_47:

}

- (id)deleteFromInput:(unint64_t *)a3
{
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  char **v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  unsigned int v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  unsigned int v55;
  unint64_t v56;
  void *v57;
  unsigned int v58;
  uint64_t v59;
  void *v60;
  unsigned int v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t j;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  unsigned int v71;
  objc_class *v72;
  objc_class *v73;
  unsigned int v74;
  void *v75;
  objc_class *v76;
  unint64_t v77;
  void *v78;
  unint64_t v79;
  unint64_t i;
  void *v81;
  void *v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double *v88;
  void *v89;
  double v90;
  double v91;
  objc_class *v92;
  id v93;
  void *v94;
  void *v95;
  objc_class *v96;
  unsigned int v97;
  objc_class *v98;
  objc_class *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t *v106;
  void *v107;
  BOOL v108;
  void *v109;
  void *v110;
  objc_super v111;
  objc_super v112;
  objc_super v113;
  objc_super v114;
  uint64_t v115;
  objc_super v116;
  objc_super v117;
  objc_super v118;
  objc_super v119;
  objc_super v120;
  objc_super v121;
  objc_super v122;
  objc_super v123;
  objc_super v124;
  objc_super v125;
  objc_super v126;
  __int16 v127[2];
  int v128;
  __int16 v129;
  int v130;
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  if (-[TIKeyboardInputManager_ja_Romaji usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManager_ja wordSearch](self, "wordSearch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

    -[TIKeyboardInputManager_ja lockAnyDrawInputResults](self, "lockAnyDrawInputResults");
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "composingInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "composingInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) != 0)
    {

      if (objc_msgSend(v10, "useSubInputsAsSearchString"))
      {
        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "composingInput");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "inputs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(v10, "syllables");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20)
      {
        objc_msgSend(v10, "syllables");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");
        v23 = objc_msgSend(v10, "cursorIndex");

        if (v22 == v23)
        {
          objc_msgSend(v10, "syllables");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "syllables");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "subarrayWithRange:", 0, objc_msgSend(v25, "count") - 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "committedText");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "syntheticInputWithCommittedText:syllables:", v27, v26);
          v28 = objc_claimAutoreleasedReturnValue();

          -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "replaceComposingInputWith:", v28);

          v10 = (void *)v28;
        }
        else
        {
          v32 = objc_alloc(MEMORY[0x24BEB5310]);
          -[TIKeyboardInputManagerMecabra previouslyProcessedDeleteInput](self, "previouslyProcessedDeleteInput");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v32, "initWithDeletedText:deleteBySyllable:shouldDeleteAcceptCandidateInput:", 0, 1, v33 == 0);

          -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "composeNew:", v26);

          -[TIKeyboardInputManagerMecabra processDeleteInputs](self, "processDeleteInputs");
          -[TIKeyboardInputManagerMecabra setPreviouslyProcessedDeleteInput:](self, "setPreviouslyProcessedDeleteInput:", v26);
        }

      }
      objc_msgSend(v10, "syllables");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count");

      if (!v36)
      {
        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "removeComposingInput");

      }
      if (v14 < 1)
        goto LABEL_24;
    }
    else
    {
      objc_opt_class();
      v16 = objc_opt_isKindOfClass();

      if ((v16 & 1) == 0)
        goto LABEL_24;
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeComposingInput");

      v14 = 1;
    }
    v38 = (int)*MEMORY[0x24BEB5498];
    do
    {
      TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.isa + v38));
      --v14;
    }
    while (v14);
LABEL_24:
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "composingInput");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
      -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
    -[TIKeyboardInputManager_ja setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
    -[TIKeyboardInputManager_ja_Romaji updateState](self, "updateState");
    goto LABEL_27;
  }
  if (-[TIKeyboardInputManager_ja_Romaji shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    v126.receiver = self;
    v126.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    -[TIKeyboardInputManager_ja deleteFromInput:](&v126, sel_deleteFromInput_, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  -[TIKeyboardInputManager_ja setIsEmojiFacemarkMode:](self, "setIsEmojiFacemarkMode:", 0);
  -[TIKeyboardInputManager_ja setFilterCandidatesUsingInputIndex:](self, "setFilterCandidatesUsingInputIndex:", 0);
  -[TIMathSymbolPunctuationController reset](self->_mathSymbolPunctuationController, "reset");
  -[TIKeyboardInputManager_ja_Romaji inputString](self, "inputString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BEB5AA8]))
  {

LABEL_16:
    -[TIKeyboardInputManager_ja_Romaji clearInput](self, "clearInput");
LABEL_27:
    v41 = 0;
    return v41;
  }
  -[TIKeyboardInputManager_ja_Romaji inputString](self, "inputString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x24BEB5A98]);

  if (v31)
    goto LABEL_16;
  if (a3)
    *a3 = 1;
  v42 = -[TIKeyboardInputManager_ja_Romaji inputIndex](self, "inputIndex");
  v43 = &selRef_loadAddressBook;
  v125.receiver = self;
  v125.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  if (-[TIKeyboardInputManager_ja inputIndex](&v125, sel_inputIndex))
  {
    v44 = v42;
    -[TIKeyboardInputManager_ja_Romaji inputString](self, "inputString");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v45, "copy");

    if (v44 < 2)
    {
      v47 = 0;
    }
    else
    {
      objc_msgSend(v46, "substringWithRange:", v44 - 2, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v105 = v44 - 1;
    -[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "unsignedIntValue");

    v124.receiver = self;
    v124.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    v50 = -[TIKeyboardInputManager_ja inputIndex](&v124, sel_inputIndex);
    v108 = v49 != v50;
    v109 = v47;
    v103 = v44;
    v107 = v46;
    if (v49 == v50)
    {
      +[Romakana romajiString:](Romakana, "romajiString:", v47);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:", v44 - 2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "unsignedIntValue");

      v123.receiver = self;
      v123.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
      v56 = -[TIKeyboardInputManager_ja inputIndex](&v123, sel_inputIndex) - (unint64_t)v58;
    }
    else
    {
      if (-[NSMutableArray count](self->_externalIndexToInternalIndexMappingArray, "count") <= (unint64_t)(v44 + 1)
        || (-[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:"),
            v51 = (void *)objc_claimAutoreleasedReturnValue(),
            v52 = objc_msgSend(v51, "unsignedIntValue"),
            v51,
            v122.receiver = self,
            v122.super_class = (Class)TIKeyboardInputManager_ja_Romaji,
            v52 != -[TIKeyboardInputManager_ja inputIndex](&v122, sel_inputIndex)))
      {
        v110 = 0;
        v108 = 0;
LABEL_45:
        if (!objc_msgSend(v47, "isEqualToString:", CFSTR("ん"), v44))
          goto LABEL_48;
        +[Romakana romajiString:](Romakana, "romajiString:", v47);
        v59 = objc_claimAutoreleasedReturnValue();

        -[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:", v44 - 2);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "unsignedIntValue");

        v120.receiver = self;
        v120.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
        v56 = -[TIKeyboardInputManager_ja inputIndex](&v120, sel_inputIndex) - (unint64_t)v61;
        v43 = &selRef_loadAddressBook;
        v110 = (void *)v59;
LABEL_47:
        if (v56)
        {
LABEL_56:
          if (!v110)
          {
            -[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:", v105);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "unsignedIntValue");

            v72 = (objc_class *)v43[48];
            v118.receiver = self;
            v118.super_class = v72;
            v56 = -[TIKeyboardInputManager_ja inputIndex](&v118, sel_inputIndex) - (unint64_t)v71;
          }
          v73 = (objc_class *)v43[48];
          v117.receiver = self;
          v117.super_class = v73;
          v74 = -[TIKeyboardInputManager_ja inputIndex](&v117, sel_inputIndex, v103);
          -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v75, "count") <= (unint64_t)v74)
          {
            -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = objc_msgSend(v78, "count");

            v43 = &selRef_loadAddressBook;
          }
          else
          {
            v76 = (objc_class *)v43[48];
            v116.receiver = self;
            v116.super_class = v76;
            v77 = -[TIKeyboardInputManager_ja inputIndex](&v116, sel_inputIndex);
          }

          if (v56 >= v77)
            v79 = v77;
          else
            v79 = v56;
          for (i = v77 - v79; v79; --v79)
          {
            -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "removeObjectAtIndex:", i);

            if (-[TIKeyboardInputManager_ja_Romaji isTypologyEnabled](self, "isTypologyEnabled"))
            {
              -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "removeObjectAtIndex:", i);

            }
          }
          if (v56)
          {
            v83 = v56;
            do
            {
              -[TIKeyboardInputManager_ja _deleteFromInput](self, "_deleteFromInput");
              --v83;
            }
            while (v83);
            if (v56 >= 2)
            {
              v84 = (int)*MEMORY[0x24BEB5498];
              v85 = v56 - 1;
              do
              {
                TIInputManager::delete_from_favonius_stroke_history(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.isa
                                                                                       + v84));
                --v85;
              }
              while (v85);
            }
          }
          if (v110)
          {
            v106 = a3;
            v115 = 0;
            v86 = objc_msgSend(v110, "length");
            if (v86)
            {
              v87 = 0;
              v88 = (double *)MEMORY[0x24BDBEFB0];
              do
              {
                objc_msgSend(v110, "substringWithRange:", v87, 1);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v90 = *v88;
                v91 = v88[1];
                v92 = (objc_class *)v43[48];
                v114.receiver = self;
                v114.super_class = v92;
                v93 = -[TIKeyboardInputManager_ja addInput:flags:point:firstDelete:](&v114, sel_addInput_flags_point_firstDelete_, v89, 0, &v115, v90, v91);
                -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                v127[0] = objc_msgSend(v89, "characterAtIndex:", 0);
                v128 = 0;
                v129 = 0;
                v130 = 0;
                objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v127, 16);
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "insertObject:atIndex:", v95, i + v87);

                if (-[TIKeyboardInputManager_ja_Romaji isTypologyEnabled](self, "isTypologyEnabled"))
                  -[TIKeyboardInputManagerMecabra insertDummyTouchDataAtIndex:](self, "insertDummyTouchDataAtIndex:", i);

                ++v87;
                v43 = &selRef_loadAddressBook;
              }
              while (v86 != v87);
            }
            if (v108)
            {
              v96 = (objc_class *)v43[48];
              v113.receiver = self;
              v113.super_class = v96;
              v97 = -[TIKeyboardInputManager_ja inputIndex](&v113, sel_inputIndex);
              v98 = (objc_class *)v43[48];
              v112.receiver = self;
              v112.super_class = v98;
              -[TIKeyboardInputManager_ja_Romaji setInputIndex:](&v112, sel_setInputIndex_, v97 - v86);
            }
            a3 = v106;
            v46 = v107;
          }
          -[TIKeyboardInputManager_ja_Romaji updateState](self, "updateState");
          v99 = (objc_class *)v43[48];
          v111.receiver = self;
          v111.super_class = v99;
          if (-[TIKeyboardInputManager_ja inputCount](&v111, sel_inputCount))
          {
            -[TIKeyboardInputManager_ja_Romaji inputString](self, "inputString");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "substringToIndex:", -[TIKeyboardInputManager_ja_Romaji inputIndex](self, "inputIndex"));
            v101 = (void *)objc_claimAutoreleasedReturnValue();

            -[TIKeyboardInputManager_ja_Romaji suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:](self, "suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:", v101, v46, v104, a3);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = v109;
            if (!objc_msgSend(v41, "length"))
            {

              v41 = 0;
            }

          }
          else
          {
            -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", 0);
            v41 = 0;
            v102 = v109;
          }

          return v41;
        }
LABEL_48:
        if (objc_msgSend(v47, "isEqualToString:", CFSTR("っ"), v103))
        {
          -[TIKeyboardInputManager_ja_Romaji inputString](self, "inputString");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "substringToIndex:", v105);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = objc_msgSend(v63, "length");
          objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 3 * v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          if (v64)
          {
            for (j = 0; j != v64; ++j)
            {
              objc_msgSend(v63, "substringWithRange:", j, 1);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              +[Romakana romajiString:](Romakana, "romajiString:", v67);
              v68 = (id)objc_claimAutoreleasedReturnValue();
              if (!v68)
                v68 = v67;
              objc_msgSend(v65, "appendString:", v68);

            }
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v65);
          v69 = objc_claimAutoreleasedReturnValue();

          v43 = &selRef_loadAddressBook;
          v119.receiver = self;
          v119.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
          v56 = -[TIKeyboardInputManager_ja inputIndex](&v119, sel_inputIndex);

          v110 = (void *)v69;
          v46 = v107;
        }
        else
        {
          v56 = 0;
        }
        goto LABEL_56;
      }
      objc_msgSend(v46, "substringWithRange:", v44, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[Romakana romajiString:](Romakana, "romajiString:", v53);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:", v105);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "unsignedIntValue");

      v121.receiver = self;
      v121.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
      v56 = -[TIKeyboardInputManager_ja inputIndex](&v121, sel_inputIndex) - (unint64_t)v55;
      v43 = &selRef_loadAddressBook;

    }
    if (v56)
      goto LABEL_47;
    goto LABEL_45;
  }
  if (!a3)
    goto LABEL_27;
  *a3 = 0;
  return 0;
}

- (unsigned)inputCount
{
  unsigned int v3;
  void *v4;
  objc_super v6;

  if (-[TIKeyboardInputManager_ja_Romaji shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    return -[TIKeyboardInputManager_ja inputCount](&v6, sel_inputCount);
  }
  else
  {
    -[TIKeyboardInputManager_ja_Romaji inputString](self, "inputString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "length");

  }
  return v3;
}

- (unsigned)inputIndex
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v9;

  -[TIKeyboardInputManager_ja alternateDisplayString](self, "alternateDisplayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || (v5 = (void *)objc_msgSend(v3, "length")) == 0)
  {
    if (-[TIKeyboardInputManager_ja_Romaji shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
    {
      v9.receiver = self;
      v9.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
      LODWORD(v5) = -[TIKeyboardInputManager_ja inputIndex](&v9, sel_inputIndex);
    }
    else if (-[TIKeyboardInputManager_ja_Romaji usesComposingInput](self, "usesComposingInput"))
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "hasKindOf:", objc_opt_class()))
      {
        v6 = -[TIKeyboardInputManagerMecabra inputIndexWithDrawInput](self, "inputIndexWithDrawInput");
      }
      else
      {
        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v7, "asInlineTextCursorIndex");

      }
      LODWORD(v5) = v6;
    }
    else
    {
      LODWORD(v5) = self->_externalInputIndex;
    }
  }

  return v5;
}

- (void)setInputIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  objc_super v6;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  if (-[TIKeyboardInputManager_ja_Romaji shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    -[TIKeyboardInputManager_ja_Romaji setInputIndex:](&v7, sel_setInputIndex_, v3);
  }
  else if (-[NSMutableArray count](self->_externalIndexToInternalIndexMappingArray, "count") > (unint64_t)v3)
  {
    -[TIMathSymbolPunctuationController reset](self->_mathSymbolPunctuationController, "reset");
    self->_externalInputIndex = v3;
    -[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    -[TIKeyboardInputManager_ja_Romaji setInputIndex:](&v6, sel_setInputIndex_, objc_msgSend(v5, "unsignedIntValue"));

  }
}

- (id)uncommittedText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_convertToKana:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)convertInputsToSyntheticInputUptoCount:(int)a3
{
  return -[TIKeyboardInputManagerMecabra _convertInputsToSyntheticInputUptoCount:cursorIndex:](self, "_convertInputsToSyntheticInputUptoCount:cursorIndex:", *(_QWORD *)&a3, 0);
}

- (id)inputString
{
  void *v3;
  __CFString *v4;
  NSString *externalString;
  __CFString *v6;
  objc_super v8;

  -[TIKeyboardInputManager_ja alternateDisplayString](self, "alternateDisplayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else if (-[TIKeyboardInputManager_ja_Romaji shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    -[TIKeyboardInputManager_ja inputString](&v8, sel_inputString);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    externalString = self->_externalString;
    if (!externalString)
    {
      v6 = &stru_250122EC0;
      goto LABEL_8;
    }
    v4 = externalString;
  }
  v6 = v4;
LABEL_8:

  return v6;
}

- (id)getInputStringFromTopCandidate
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)objc_opt_class();
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  -[TIKeyboardInputManager_ja getInputStringFromTopCandidate](&v7, sel_getInputStringFromTopCandidate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_convertToKana:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateComposedText
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  -[TIKeyboardInputManagerMecabra updateComposedText](&v3, sel_updateComposedText);
  -[TIKeyboardInputManager_ja_Romaji updateState](self, "updateState");
}

- (id)_convertStringWithBoundary:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  if (a3)
  {
    if (-[NSMutableArray count](self->_externalIndexToInternalIndexMappingArray, "count") <= a3)
    {
      v3 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndex:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndex:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "unsignedIntValue");

    }
  }
  -[TIKeyboardInputManager_ja _convertString](self, "_convertString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3 && v3 < objc_msgSend(v6, "length"))
  {
    objc_msgSend(v7, "substringToIndex:", v3);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  return v7;
}

- (void)clearInput
{
  NSString *externalString;
  objc_super v4;

  externalString = self->_externalString;
  self->_externalString = 0;

  -[NSMutableArray removeAllObjects](self->_externalIndexToInternalIndexMappingArray, "removeAllObjects");
  self->_externalInputIndex = 0;
  -[TIKeyboardInputManager_ja setIsEmojiFacemarkMode:](self, "setIsEmojiFacemarkMode:", 0);
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  -[TIKeyboardInputManager_ja clearInput](&v4, sel_clearInput);
}

- (void)inputLocationChanged
{
  NSString *externalString;
  objc_super v4;

  externalString = self->_externalString;
  self->_externalString = 0;

  -[NSMutableArray removeAllObjects](self->_externalIndexToInternalIndexMappingArray, "removeAllObjects");
  self->_externalInputIndex = 0;
  -[TIKeyboardInputManager_ja setIsEmojiFacemarkMode:](self, "setIsEmojiFacemarkMode:", 0);
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  -[TIKeyboardInputManager_ja inputLocationChanged](&v4, sel_inputLocationChanged);
}

- (unint64_t)actualInternalInputIndex
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t remainingInputLength;
  unint64_t v9;
  objc_super v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  -[TIKeyboardInputManager_ja inputString](&v12, sel_inputString);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  v4 = -[TIKeyboardInputManager_ja inputIndex](&v11, sel_inputIndex);
  if (v4
    && (v5 = v4, -[TIKeyboardInputManager_ja filterCandidatesUsingInputIndex](self, "filterCandidatesUsingInputIndex")))
  {
    v6 = v5;
  }
  else
  {
    v6 = objc_msgSend(v3, "length");
  }
  remainingInputLength = self->super._remainingInputLength;
  if (remainingInputLength >= v6 || remainingInputLength == 0)
    remainingInputLength = 0;
  v9 = v6 - remainingInputLength;

  return v9;
}

- (id)remainingInput
{
  void *v4;
  void *v5;
  objc_super v6;

  if (-[TIKeyboardInputManager_ja_Romaji usesComposingInput](self, "usesComposingInput"))
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  -[TIKeyboardInputManager_ja inputString](&v6, sel_inputString);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TIKeyboardInputManager_ja_Romaji actualInternalInputIndex](self, "actualInternalInputIndex");
  if (v5)
  {
    if ((unint64_t)v5 >= objc_msgSend(v4, "length"))
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v4, "substringFromIndex:", v5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (unint64_t)remainingInputLengthOfCandidate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;
  objc_super v10;

  v4 = a3;
  if (-[TIKeyboardInputManager_ja filterCandidatesUsingInputIndex](self, "filterCandidatesUsingInputIndex"))
  {
    v10.receiver = self;
    v10.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
    v5 = -[TIKeyboardInputManager_ja inputIndex](&v10, sel_inputIndex);
  }
  else
  {
    v5 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  -[TIKeyboardInputManager_ja inputString](&v9, sel_inputString);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TIKeyboardInputManager_ja remainingInputLengthOfString:index:candidate:](self, "remainingInputLengthOfString:index:candidate:", v6, v5, v4);

  return v7;
}

- (_NSRange)analysisStringRange
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  objc_super v8;
  _NSRange result;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  v3 = -[TIKeyboardInputManager_ja inputIndex](&v8, sel_inputIndex);
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    -[TIKeyboardInputManager_ja rawInputString](self, "rawInputString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length");

  }
  v6 = 0;
  v7 = v4;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)validCharacterSetForAutocorrection
{
  if (-[TIKeyboardInputManager_ja_Romaji validCharacterSetForAutocorrection]::__onceToken != -1)
    dispatch_once(&-[TIKeyboardInputManager_ja_Romaji validCharacterSetForAutocorrection]::__onceToken, &__block_literal_global_63);
  return (id)-[TIKeyboardInputManager_ja_Romaji validCharacterSetForAutocorrection]::__validCharSet;
}

- (void)keyLayoutWillChangeTo:(id)a3 from:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_ja_Romaji;
  -[TIKeyboardInputManagerMecabra keyLayoutWillChangeTo:from:](&v10, sel_keyLayoutWillChangeTo_from_, a3, a4);
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDrawInput");

  if (v6)
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TIKeyboardInputManager_ja_Romaji convertInputsToSyntheticInputUptoCount:](self, "convertInputsToSyntheticInputUptoCount:", objc_msgSend(v8, "count"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mathSymbolPunctuationController, 0);
  objc_storeStrong((id *)&self->_externalString, 0);
  objc_storeStrong((id *)&self->_externalIndexToInternalIndexMappingArray, 0);
}

@end
