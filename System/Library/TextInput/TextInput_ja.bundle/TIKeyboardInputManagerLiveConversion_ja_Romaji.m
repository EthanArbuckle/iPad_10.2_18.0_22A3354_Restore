@implementation TIKeyboardInputManagerLiveConversion_ja_Romaji

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (TIKeyboardInputManagerLiveConversion_ja_Romaji)initWithConfig:(id)a3 keyboardState:(id)a4
{
  TIKeyboardInputManagerLiveConversion_ja_Romaji *v4;
  uint64_t v5;
  NSMutableArray *externalIndexToInternalIndexMappingArray;
  NSString *externalString;
  TIMathSymbolPunctuationController *v8;
  TIMathSymbolPunctuationController *mathSymbolPunctuationController;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
  v4 = -[TIKeyboardInputManagerLiveConversion_ja initWithConfig:keyboardState:](&v11, sel_initWithConfig_keyboardState_, a3, a4);
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
  v3.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
  -[TIKeyboardInputManagerMecabra dealloc](&v3, sel_dealloc);
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
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  int *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  TIMathSymbolPunctuationController *mathSymbolPunctuationController;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "length"))
  {
    if (-[TIKeyboardInputManagerLiveConversion_ja_Romaji shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
    {
      v49.receiver = self;
      v49.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
      -[TIKeyboardInputManagerLiveConversion_ja_Romaji addInput:withContext:](&v49, sel_addInput_withContext_, v6, v7);
    }
    else
    {
      if (-[TIKeyboardInputManagerLiveConversion_ja shouldCommitHeadSegment](self, "shouldCommitHeadSegment"))
      {
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        -[TIKeyboardInputManagerLiveConversion_ja committedSegments](self, "committedSegments", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v46 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              objc_msgSend(v15, "surface");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                objc_msgSend(v7, "output");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "surface");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "insertText:", v18);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          }
          while (v12);
        }

        objc_msgSend(MEMORY[0x24BDBCE30], "array");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerLiveConversion_ja setCommittedSegments:](self, "setCommittedSegments:", v19);

        -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "surface");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v7, "output");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "insertText:", v22);

        }
        v24 = objc_alloc_init(MEMORY[0x24BDD16A8]);
        -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        if (v26 >= 2)
        {
          v27 = 1;
          do
          {
            -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectAtIndexedSubscript:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "reading");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "appendString:", v30);

            ++v27;
            -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "count");

          }
          while (v27 < v32);
        }
        -[TIKeyboardInputManagerLiveConversion_ja_Romaji setInput:](self, "setInput:", v24);

      }
      v33 = objc_msgSend(v9, "length");
      v34 = (int *)MEMORY[0x24BEB5498];
      if (v33 == 1)
      {
        TIInputManager::initialize_search_if_necessary_from_last_touch(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.isa
                                                                                          + (int)*MEMORY[0x24BEB5498]));
        -[TIKeyboardInputManagerLiveConversion_ja_Romaji transliterate:](self, "transliterate:", v9);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        -[TIKeyboardInputManagerLiveConversion_ja stringByConvertingPunctuationForInput:isLockedInput:](self, "stringByConvertingPunctuationForInput:isLockedInput:", v35, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "touchEvent");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "location");
        -[TIKeyboardInputManagerLiveConversion_ja_Romaji _addInput:point:](self, "_addInput:point:", v9);

      }
      else if (objc_msgSend(v9, "length"))
      {
        v37 = 0;
        do
        {
          objc_msgSend(v9, "substringWithRange:", v37, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManagerLiveConversion_ja_Romaji transliterate:](self, "transliterate:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "touchEvent");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "location");
          -[TIKeyboardInputManagerLiveConversion_ja_Romaji _addInput:point:](self, "_addInput:point:", v39);

          ++v37;
        }
        while (objc_msgSend(v9, "length") > v37);
      }
      -[TIKeyboardInputManagerMecabra saveGeometryForInput:atIndex:](self, "saveGeometryForInput:atIndex:", v6, -[TIKeyboardInputManager_mul internalIndexToExternal:](self, "internalIndexToExternal:", (*(unsigned int **)((char *)&self->super.super.super.super.super.super.isa + *v34))[24]));
      -[TIKeyboardInputManagerLiveConversion_ja_Romaji updateState](self, "updateState");
      mathSymbolPunctuationController = self->_mathSymbolPunctuationController;
      -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIMathSymbolPunctuationController mathSymbolPunctuationedStringForInputString:](mathSymbolPunctuationController, "mathSymbolPunctuationedStringForInputString:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        -[TIKeyboardInputManagerLiveConversion_ja_Romaji setInput:](self, "setInput:", v43);
        -[TIKeyboardInputManagerLiveConversion_ja_Romaji updateState](self, "updateState");
      }
      -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerLiveConversion_ja makeCandidatesWithWordSearch:](self, "makeCandidatesWithWordSearch:", v44);

    }
  }

}

- (void)_addInput:(id)a3 point:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id v8;
  objc_super v9;
  uint64_t v10;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[TIKeyboardInputManagerLiveConversion_ja _cancelCandidatesThread](self, "_cancelCandidatesThread");
  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
    v10 = 0;
    v8 = -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v9, sel_addInput_flags_point_firstDelete_, v7, 0, &v10, x, y);
  }

}

- (void)updateState
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[TIKeyboardInputManagerLiveConversion_ja_Romaji setExternalString:](self, "setExternalString:", 0);
  -[TIKeyboardInputManagerLiveConversion_ja_Romaji externalIndexToInternalIndexMappingArray](self, "externalIndexToInternalIndexMappingArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[TIKeyboardInputManagerLiveConversion_ja_Romaji setExternalInputIndex:](self, "setExternalInputIndex:", 0);
  -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  if (v4)
  {
    v6 = v5;
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v4;
      objc_msgSend(v4, "lowercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[Romakana hiraganaString:mappingArray:](Romakana, "hiraganaString:mappingArray:", v8, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerLiveConversion_ja_Romaji setExternalString:](self, "setExternalString:", v9);

      -[TIKeyboardInputManagerLiveConversion_ja_Romaji setExternalInputIndex:](self, "setExternalInputIndex:", 0x7FFFFFFFFFFFFFFFLL);
      -[TIKeyboardInputManagerLiveConversion_ja_Romaji externalIndexToInternalIndexMappingArray](self, "externalIndexToInternalIndexMappingArray");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      if (!v6)
        -[TIKeyboardInputManagerLiveConversion_ja_Romaji setExternalInputIndex:](self, "setExternalInputIndex:", 0);
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = 0;
        v17 = *(_QWORD *)v23;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v12);
            v15 += (int)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "intValue");
            -[TIKeyboardInputManagerLiveConversion_ja_Romaji externalIndexToInternalIndexMappingArray](self, "externalIndexToInternalIndexMappingArray");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v20);

            if (v15 == v6)
              -[TIKeyboardInputManagerLiveConversion_ja_Romaji setExternalInputIndex:](self, "setExternalInputIndex:", v16 + v18 + 1);
            ++v18;
          }
          while (v14 != v18);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          v16 += v18;
        }
        while (v14);
      }

      v4 = v21;
    }
  }

}

- (id)deleteFromInput:(unint64_t *)a3
{
  unsigned int v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;

  -[TIMathSymbolPunctuationController reset](self->_mathSymbolPunctuationController, "reset");
  v5 = -[TIKeyboardInputManagerLiveConversion_ja inputIndex](self, "inputIndex");
  if (v5)
  {
    v6 = v5;
    if (-[NSMutableArray count](self->_externalIndexToInternalIndexMappingArray, "count") > (unint64_t)v5)
    {
      if (a3)
        *a3 = 1;
      -[NSMutableArray objectAtIndexedSubscript:](self->_externalIndexToInternalIndexMappingArray, "objectAtIndexedSubscript:", v6 - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntValue");

      -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      v11 = v10 - v8;
      if (v10 != v8)
      {
        v12 = (int *)MEMORY[0x24BEB5498];
        do
        {
          -[TIKeyboardInputManagerLiveConversion_ja _deleteFromInput](self, "_deleteFromInput");
          TIInputManager::delete_from_favonius_stroke_history(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.isa
                                                                                 + *v12));
          --v11;
        }
        while (v11);
      }
      -[TIKeyboardInputManagerLiveConversion_ja_Romaji updateState](self, "updateState");
    }
  }
  return 0;
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

- (void)setInput:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
  v4 = a3;
  -[TIKeyboardInputManagerLiveConversion_ja setInput:](&v5, sel_setInput_, v4);
  -[TIMathSymbolPunctuationController setInputString:](self->_mathSymbolPunctuationController, "setInputString:", v4, v5.receiver, v5.super_class);

}

- (void)setInputIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  if (-[TIKeyboardInputManagerLiveConversion_ja_Romaji shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
  {
    v10.receiver = self;
    v10.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
    -[TIKeyboardInputManagerLiveConversion_ja_Romaji setInputIndex:](&v10, sel_setInputIndex_, v3);
  }
  else
  {
    -[TIKeyboardInputManagerLiveConversion_ja_Romaji externalIndexToInternalIndexMappingArray](self, "externalIndexToInternalIndexMappingArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 > v3)
    {
      -[TIKeyboardInputManagerLiveConversion_ja_Romaji setExternalInputIndex:](self, "setExternalInputIndex:", v3);
      -[TIKeyboardInputManagerLiveConversion_ja_Romaji externalIndexToInternalIndexMappingArray](self, "externalIndexToInternalIndexMappingArray");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", -[TIKeyboardInputManagerLiveConversion_ja_Romaji externalInputIndex](self, "externalInputIndex"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9.receiver = self;
      v9.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
      -[TIKeyboardInputManagerLiveConversion_ja_Romaji setInputIndex:](&v9, sel_setInputIndex_, objc_msgSend(v8, "unsignedIntValue"));

    }
  }
}

- (id)inputString
{
  void *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
  -[TIKeyboardInputManagerLiveConversion_ja inputString](&v10, sel_inputString);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[TIKeyboardInputManagerLiveConversion_ja_Romaji externalString](self, "externalString");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = &stru_250122EC0;
    if (v6)
      v8 = (__CFString *)v6;
    v5 = v8;

  }
  return v5;
}

- (id)searchStringForMarkedText
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  -[TIKeyboardInputManagerLiveConversion_ja_Romaji inputString](self, "inputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "length"))
    {
      v5 = -[TIKeyboardInputManagerLiveConversion_ja inputIndex](self, "inputIndex");
      if (v5)
      {
        v6 = v5;
        while (1)
        {
          -[TIKeyboardInputManagerLiveConversion_ja_Romaji inputString](self, "inputString");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (!_romanAlphabetCharacterSet)
            _romanAlphabetCharacterSet = (uint64_t)CFCharacterSetCreateWithCharactersInString(0, CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"));
          v8 = objc_msgSend(v7, "rangeOfCharacterFromSet:options:range:");
          v10 = v9;

          if (v8 == 0x7FFFFFFFFFFFFFFFLL)
            break;
          objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v8, v10, &stru_250122EC0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v4 = v11;
          if (!--v6)
            return v11;
        }
      }
    }
    v11 = v4;
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)displayStringForSearch
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[TIKeyboardInputManagerLiveConversion_ja committedSurface](self, "committedSurface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja_Romaji externalString](self, "externalString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 && v4)
  {
    objc_msgSend(v3, "stringByAppendingString:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (void)clearInput
{
  void *v3;
  objc_super v4;

  -[TIKeyboardInputManagerLiveConversion_ja_Romaji setExternalString:](self, "setExternalString:", 0);
  -[TIKeyboardInputManagerLiveConversion_ja_Romaji externalIndexToInternalIndexMappingArray](self, "externalIndexToInternalIndexMappingArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[TIKeyboardInputManagerLiveConversion_ja_Romaji setExternalInputIndex:](self, "setExternalInputIndex:", 0);
  -[TIMathSymbolPunctuationController reset](self->_mathSymbolPunctuationController, "reset");
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
  -[TIKeyboardInputManagerLiveConversion_ja clearInput](&v4, sel_clearInput);
}

- (void)inputLocationChanged
{
  void *v3;
  objc_super v4;

  -[TIKeyboardInputManagerLiveConversion_ja_Romaji setExternalString:](self, "setExternalString:", 0);
  -[TIKeyboardInputManagerLiveConversion_ja_Romaji externalIndexToInternalIndexMappingArray](self, "externalIndexToInternalIndexMappingArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[TIKeyboardInputManagerLiveConversion_ja_Romaji setExternalInputIndex:](self, "setExternalInputIndex:", 0);
  -[TIMathSymbolPunctuationController reset](self->_mathSymbolPunctuationController, "reset");
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Romaji;
  -[TIKeyboardInputManagerLiveConversion_ja inputLocationChanged](&v4, sel_inputLocationChanged);
}

- (id)segmentAdjustInputManager:(unint64_t)a3
{
  TIKeyboardInputManager_ja_SegmentAdjust *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TIKeyboardInputManager_ja_SegmentAdjust *v10;

  v5 = [TIKeyboardInputManager_ja_SegmentAdjust alloc];
  -[TIKeyboardInputManagerLiveConversion_ja_Romaji config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja_Romaji keyboardState](self, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja segmentsForPicker](self, "segmentsForPicker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja wordSearch](self, "wordSearch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TIKeyboardInputManager_ja_SegmentAdjust initWithConfig:keyboardState:segments:at:romajiEnabled:wordSearch:](v5, "initWithConfig:keyboardState:segments:at:romajiEnabled:wordSearch:", v6, v7, v8, a3, 1, v9);

  return v10;
}

- (id)rawInputStringFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mecabraCandidateRefFromCandidate:", v4);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEB4E80], "dictionaryReadingFromMecabraCandidate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[Romakana romajiString:](Romakana, "romajiString:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)hiraganaStringFor:(id)a3
{
  return +[Romakana hiraganaString:mappingArray:](Romakana, "hiraganaString:mappingArray:", a3, 0);
}

- (NSMutableArray)externalIndexToInternalIndexMappingArray
{
  return self->_externalIndexToInternalIndexMappingArray;
}

- (unint64_t)externalInputIndex
{
  return self->_externalInputIndex;
}

- (void)setExternalInputIndex:(unint64_t)a3
{
  self->_externalInputIndex = a3;
}

- (NSString)externalString
{
  return self->_externalString;
}

- (void)setExternalString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 928);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalString, 0);
  objc_storeStrong((id *)&self->_externalIndexToInternalIndexMappingArray, 0);
  objc_storeStrong((id *)&self->_mathSymbolPunctuationController, 0);
}

@end
