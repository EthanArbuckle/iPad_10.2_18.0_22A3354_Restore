@implementation SCROBrailleFormatter

+ (void)resetEditingManager
{
  void *v2;

  v2 = (void *)_editingStateManager;
  _editingStateManager = 0;

}

- (SCROBrailleFormatter)initWithOutputTableIdentifier:(id)a3 inputTableIdentifier:(id)a4 showDotsSevenAndEight:(BOOL)a5
{
  id v9;
  id v10;
  SCROBrailleFormatter *v11;
  SCROBrailleFormatter *v12;
  uint64_t v13;
  BRLTBrailleStateManager *stateManager;
  BRLTEditString *v15;
  BRLTEditString *editString;
  BRLTScriptString *emptyEditingScriptString;
  uint64_t v18;
  NSPointerArray *outputDelegates;

  v9 = a3;
  v10 = a4;
  v11 = -[SCROBrailleFormatter init](self, "init");
  v12 = v11;
  if (v11)
  {
    v11->_displayMode = 0;
    v11->_showDotsSevenAndEight = a5;
    v11->_generationID = ++GenerationCount;
    objc_storeStrong((id *)&v11->_outputTableIdentifier, a3);
    objc_storeStrong((id *)&v12->_inputTableIdentifier, a4);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE0FC38]), "initWithDelegate:translationDelegate:", v12, v12);
    stateManager = v12->_stateManager;
    v12->_stateManager = (BRLTBrailleStateManager *)v13;

    v15 = (BRLTEditString *)objc_alloc_init(MEMORY[0x24BE0FC48]);
    editString = v12->_editString;
    v12->_editString = v15;

    emptyEditingScriptString = v12->_emptyEditingScriptString;
    v12->_emptyEditingScriptString = 0;

    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v18 = objc_claimAutoreleasedReturnValue();
    outputDelegates = v12->_outputDelegates;
    v12->_outputDelegates = (NSPointerArray *)v18;

  }
  return v12;
}

- (SCROBrailleFormatter)initWithOutputContractionMode:(int)a3 inputContractionMode:(int)a4 outputShowEightDot:(BOOL)a5 inputShowEightDot:(BOOL)a6 showDotsSevenAndEight:(BOOL)a7
{
  const __CFString *v7;

  if (a3)
    v7 = CFSTR("com.apple.scrod.braille.table.duxbury.eng-xueb_g1");
  else
    v7 = CFSTR("com.apple.scrod.braille.table.duxbury.eng-xueb_g2");
  return -[SCROBrailleFormatter initWithOutputTableIdentifier:inputTableIdentifier:showDotsSevenAndEight:](self, "initWithOutputTableIdentifier:inputTableIdentifier:showDotsSevenAndEight:", v7, v7, a7, a6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithOutputTableIdentifier:inputTableIdentifier:showDotsSevenAndEight:", self->_outputTableIdentifier, self->_inputTableIdentifier, self->_showDotsSevenAndEight);
  objc_msgSend(v4, "setDisplayMode:", self->_displayMode);
  objc_msgSend(v4, "setAppToken:", self->_appToken);
  objc_msgSend(v4, "setStatusText:", self->_statusText);
  objc_msgSend(v4, "setCurrentUnread:", self->_currentUnread);
  objc_msgSend(v4, "setAnyUnread:", self->_anyUnread);
  objc_msgSend(v4, "setLineFocus:", -[SCROBrailleFormatter lineFocus](self, "lineFocus"));
  objc_msgSend(v4, "setLineOffset:", -[SCROBrailleFormatter lineOffset](self, "lineOffset"));
  v4[12] = self->_generationID;
  v5 = -[NSPointerArray copy](self->_outputDelegates, "copy");
  v6 = (void *)v4[13];
  v4[13] = v5;

  v7 = -[BRLTBrailleStateManager copy](self->_stateManager, "copy");
  v8 = (void *)v4[8];
  v4[8] = v7;

  v9 = -[BRLTEditString copy](self->_editString, "copy");
  v10 = (void *)v4[9];
  v4[9] = v9;

  return v4;
}

- (id)deepCopyWithZone:(_NSZone *)a3
{
  char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = -[SCROBrailleFormatter copyWithZone:](self, "copyWithZone:");
  v6 = -[NSAttributedString deepCopyWithZone:](self->_statusText, "deepCopyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 7);
  *((_QWORD *)v5 + 7) = v6;

  *((_QWORD *)v5 + 10) = self->_firstToken;
  *(_OWORD *)(v5 + 88) = *(_OWORD *)&self->_lastToken;
  *((_QWORD *)v5 + 6) = self->_lineOffset;
  v8 = -[BRLTBrailleStateManager copy](self->_stateManager, "copy");
  v9 = (void *)*((_QWORD *)v5 + 8);
  *((_QWORD *)v5 + 8) = v8;

  v10 = -[BRLTEditString copy](self->_editString, "copy");
  v11 = (void *)*((_QWORD *)v5 + 9);
  *((_QWORD *)v5 + 9) = v10;

  v12 = -[NSPointerArray copy](self->_outputDelegates, "copy");
  v13 = (void *)*((_QWORD *)v5 + 13);
  *((_QWORD *)v5 + 13) = v12;

  return v5;
}

- (void)addText:(id)a3 selection:(_NSRange *)a4 token:(int64_t)a5 focus:(_NSRange *)a6 isEditableText:(BOOL)a7
{
  -[SCROBrailleFormatter addText:language:selection:token:focus:isEditableText:](self, "addText:language:selection:token:focus:isEditableText:", a3, 0, a4, a5, a6, a7);
}

- (void)addText:(id)a3 language:(id)a4 selection:(_NSRange *)a5 token:(int64_t)a6 focus:(_NSRange *)a7 isEditableText:(BOOL)a8
{
  uint64_t v8;

  BYTE1(v8) = a8;
  LOBYTE(v8) = 0;
  -[SCROBrailleFormatter addText:overrideText:language:selection:token:focus:technical:isEditableText:](self, "addText:overrideText:language:selection:token:focus:technical:isEditableText:", a3, 0, a4, a5, a6, a7, v8);
}

- (void)addText:(id)a3 selection:(_NSRange *)a4 token:(int64_t)a5 focus:(_NSRange *)a6 technical:(BOOL)a7 isEditableText:(BOOL)a8
{
  uint64_t v8;

  BYTE1(v8) = a8;
  LOBYTE(v8) = a7;
  -[SCROBrailleFormatter addText:overrideText:language:selection:token:focus:technical:isEditableText:](self, "addText:overrideText:language:selection:token:focus:technical:isEditableText:", a3, 0, 0, a4, a5, a6, v8);
}

- (void)addText:(id)a3 overrideText:(id)a4 language:(id)a5 selection:(_NSRange *)a6 token:(int64_t)a7 focus:(_NSRange *)a8 technical:(BOOL)a9 isEditableText:(BOOL)a10
{
  uint64_t v10;
  uint64_t v11;

  LOBYTE(v11) = 0;
  LOWORD(v10) = __PAIR16__(a10, a9);
  -[SCROBrailleFormatter addText:overrideText:language:selection:token:focus:technical:isEditableText:paddingRange:suggestionRange:editingString:textFormattingRanges:selectionOnDifferentLine:](self, "addText:overrideText:language:selection:token:focus:technical:isEditableText:paddingRange:suggestionRange:editingString:textFormattingRanges:selectionOnDifferentLine:", a3, a4, a5, a6, a7, a8, v10, 0x7FFFFFFFFFFFFFFFLL, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0, v11);
}

- (void)addText:(id)a3 overrideText:(id)a4 language:(id)a5 selection:(_NSRange *)a6 token:(int64_t)a7 focus:(_NSRange *)a8 technical:(BOOL)a9 isEditableText:(BOOL)a10 paddingRange:(_NSRange)a11 suggestionRange:(_NSRange)a12 editingString:(id)a13 textFormattingRanges:(id)a14 selectionOnDifferentLine:(BOOL)a15
{
  id v19;
  NSRange v20;
  void *v22;
  uint64_t v23;
  NSUInteger location;
  _BOOL4 v25;
  uint64_t v26;
  NSUInteger v27;
  id v28;
  id v29;
  void *v30;
  BRLTEditString *v31;
  BRLTEditString *editString;
  id v33;
  id v34;
  NSRange v35;

  v33 = a3;
  v19 = a14;
  v35.length = objc_msgSend(v33, "length");
  v35.location = 0;
  v20 = NSIntersectionRange(v35, a11);
  if (v20.location == a11.location && v20.length == a11.length)
  {
    objc_msgSend(v33, "stringByReplacingCharactersInRange:withString:", a11.location, a11.length, &stru_24CC1DB88);
    v23 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v23;
  }
  else
  {
    v22 = v33;
  }
  if (a6)
  {
    location = a6->location;
    a6 = (_NSRange *)a6->length;
  }
  else
  {
    location = 0x7FFFFFFFFFFFFFFFLL;
  }
  v25 = !a10;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
    v25 = 1;
  if (v25)
    v26 = location;
  else
    v26 = 0x7FFFFFFFFFFFFFFFLL;
  v34 = v22;
  if (!v25 && !a15)
  {
    v26 = objc_msgSend(v22, "length");
    a6 = 0;
  }
  if (a8)
  {
    v27 = a8->location;
    a8 = (_NSRange *)a8->length;
  }
  else
  {
    v27 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v28 = objc_alloc(MEMORY[0x24BE0FC48]);
  if (a10)
    v29 = 0;
  else
    v29 = v19;
  v30 = (void *)objc_msgSend(v28, "initWithString:selection:focus:token:suggestion:textFormattingRanges:", v34, v26, a6, v27, a8, a7, a12.location, a12.length, v29);
  -[BRLTEditString appending:](self->_editString, "appending:", v30);
  v31 = (BRLTEditString *)objc_claimAutoreleasedReturnValue();
  editString = self->_editString;
  self->_editString = v31;

  self->_isEditableText = a10;
  self->_needsTechnicalMode = a9;
  if (a7)
  {
    if (!self->_firstToken)
      self->_firstToken = a7;
    self->_lastToken = a7;
  }

}

- (void)addTextPreCustom:(id)a3 overrideText:(id)a4 language:(id)a5 selection:(_NSRange *)a6 token:(int64_t)a7 focus:(_NSRange *)a8 technical:(BOOL)a9 isEditableText:(BOOL)a10 isTerminalOutput:(BOOL)a11 paddingRange:(_NSRange)a12 suggestionRange:(_NSRange)a13 editingString:(id)a14 textFormattingRanges:(id)a15
{
  id v19;
  NSRange v20;
  void *v22;
  NSUInteger length;
  NSUInteger location;
  uint64_t v25;
  NSUInteger v26;
  BRLTBrailleStateManager **p_stateManager;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSPointerArray *outputDelegates;
  void *v33;
  void *v34;
  NSPointerArray *v35;
  NSPointerArray *v36;
  NSPointerArray *v37;
  NSPointerArray *v38;
  NSPointerArray *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  char isKindOfClass;
  id v49;
  id v50;
  NSRange v51;

  v49 = a3;
  v19 = a15;
  v51.length = objc_msgSend(v49, "length");
  v51.location = 0;
  v20 = NSIntersectionRange(v51, a12);
  if (v20.location == a12.location && v20.length == a12.length)
  {
    objc_msgSend(v49, "stringByReplacingCharactersInRange:withString:", a12.location, a12.length, &stru_24CC1DB88);
    v25 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v25;
    if (a6)
      goto LABEL_6;
LABEL_8:
    length = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_9;
  }
  v22 = v49;
  if (!a6)
    goto LABEL_8;
LABEL_6:
  location = a6->location;
  length = a6->length;
LABEL_9:
  v50 = v22;
  if (a10 && location == 0x7FFFFFFFFFFFFFFFLL)
  {
    location = objc_msgSend(v22, "length");
    length = 0;
  }
  if (a8)
  {
    v26 = a8->location;
    a8 = (_NSRange *)a8->length;
  }
  else
  {
    v26 = 0x7FFFFFFFFFFFFFFFLL;
  }
  p_stateManager = &self->_stateManager;
  -[BRLTBrailleStateManager outputScriptString](self->_stateManager, "outputScriptString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[BRLTBrailleStateManager outputScriptString](*p_stateManager, "outputScriptString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addString:selection:focus:token:", v50, location, length, v26, a8, a7);
  }
  else
  {
    if (a10)
    {
      if (_editingStateManager)
      {
        v30 = -[BRLTBrailleStateManager inputTranslationMode](*p_stateManager, "inputTranslationMode");
        objc_msgSend((id)_editingStateManager, "setInputTranslationMode:", v30);
        v31 = -[BRLTBrailleStateManager outputTranslationMode](self->_stateManager, "outputTranslationMode");
        objc_msgSend((id)_editingStateManager, "setOutputTranslationMode:", v31);
        objc_storeStrong((id *)&self->_stateManager, (id)_editingStateManager);
        outputDelegates = self->_outputDelegates;
        if (!outputDelegates || !-[NSPointerArray count](outputDelegates, "count"))
        {
          -[BRLTBrailleStateManager translationDelegate](*p_stateManager, "translationDelegate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            -[BRLTBrailleStateManager translationDelegate](self->_stateManager, "translationDelegate");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "outputDelegates");
            v35 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
            v36 = self->_outputDelegates;
            self->_outputDelegates = v35;

            v37 = self->_outputDelegates;
            if (v37)
            {
              v38 = (NSPointerArray *)-[NSPointerArray copy](v37, "copy");
              v39 = self->_outputDelegates;
              self->_outputDelegates = v38;

            }
          }
        }
        -[BRLTBrailleStateManager setDelegate:](self->_stateManager, "setDelegate:", self);
        -[BRLTBrailleStateManager setTranslationDelegate:](self->_stateManager, "setTranslationDelegate:", self);
      }
      else
      {
        objc_storeStrong((id *)&_editingStateManager, *p_stateManager);
      }
    }
    if (a4)
    {
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC58]), "initWithString:selection:focus:token:", &stru_24CC1DB88, 0, 0, v26, a8, a7);
      -[SCROBrailleFormatter setEmptyEditingScriptString:](self, "setEmptyEditingScriptString:", v40);

    }
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC58]), "initWithString:selection:focus:token:", v50, location, length, v26, a8, a7);
  }
  objc_msgSend(v29, "setTextFormattingRanges:", v19);

  objc_msgSend(v29, "setSuggestionRange:", a13.location, a13.length);
  if (a7)
  {
    if (!self->_firstToken)
      self->_firstToken = a7;
    self->_lastToken = a7;
  }
  if (a9)
    -[BRLTBrailleStateManager setOutputTranslationMode:](*p_stateManager, "setOutputTranslationMode:", 4);
  -[BRLTBrailleStateManager setScriptString:](*p_stateManager, "setScriptString:", v29);
  -[BRLTBrailleStateManager setEditable:](*p_stateManager, "setEditable:", a10);
  -[BRLTBrailleStateManager setIsTerminalOutput:](*p_stateManager, "setIsTerminalOutput:", a11);
  if (*p_stateManager == (BRLTBrailleStateManager *)_editingStateManager)
  {
    v41 = _editingLanguage;
    +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "defaultLanguage");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v41) = objc_msgSend((id)v41, "isEqualToString:", v43);

    if ((v41 & 1) == 0)
    {
      if (_editingLanguage)
        -[BRLTBrailleStateManager translateForced:](*p_stateManager, "translateForced:", 1);
      +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "defaultLanguage");
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)_editingLanguage;
      _editingLanguage = v45;

    }
  }

}

- (_NSRange)rangeOfBrailleCellRepresentingCharacterAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  if (SCROCustomBrailleEnabled())
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "scriptRangeOfBrailleCellRepresentingCharacterAtScriptIndex:", a3);
    v8 = v7;

    v9 = v6;
    v10 = v8;
  }
  else if ((SCROJapaneseBrailleSelected() & 1) != 0)
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v10 = 0;
  }
  else
  {
    v9 = -[BRLTBrailleStateManager scriptRangeOfBrailleCellRepresentingCharacterAtScriptIndex:](self->_stateManager, "scriptRangeOfBrailleCellRepresentingCharacterAtScriptIndex:", a3);
  }
  result.length = v10;
  result.location = v9;
  return result;
}

- (BOOL)hasPlaceholderText
{
  void *v2;
  BOOL v3;

  -[SCROBrailleFormatter emptyEditingScriptString](self, "emptyEditingScriptString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)clearPlaceholderForEditing
{
  BRLTBrailleStateManager *stateManager;
  void *v4;

  if ((SCROJapaneseBrailleSelected() & 1) == 0 && (SCROCustomBrailleEnabled() & 1) == 0)
  {
    stateManager = self->_stateManager;
    -[SCROBrailleFormatter emptyEditingScriptString](self, "emptyEditingScriptString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRLTBrailleStateManager setScriptString:](stateManager, "setScriptString:", v4);

    -[BRLTBrailleStateManager setEditable:](self->_stateManager, "setEditable:", 1);
    -[SCROBrailleFormatter setEmptyEditingScriptString:](self, "setEmptyEditingScriptString:", 0);
  }
}

- (void)translate
{
  -[SCROBrailleFormatter translate:](self, "translate:", 0);
}

- (void)translate:(BOOL)a3
{
  id v4;

  if (SCROCustomBrailleEnabled())
  {
    objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forceTranslate");

  }
  else if ((SCROJapaneseBrailleSelected() & 1) == 0)
  {
    -[BRLTBrailleStateManager translate](self->_stateManager, "translate");
  }
}

- (id)printBrailleForText:(id)a3 language:(id)a4 mode:(unint64_t)a5 textPositionsRange:(_NSRange)a6 locations:(id *)a7 textFormattingRanges:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  length = a6.length;
  location = a6.location;
  v14 = a8;
  v15 = a4;
  v16 = a3;
  +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v16, v15, a5, location, length, a7, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)textForPrintBraille:(id)a3 language:(id)a4 mode:(unint64_t)a5 locations:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a4;
  v10 = a3;
  +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textForPrintBraille:language:mode:locations:", v10, v9, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)addOutputDelegate:(id)a3
{
  id v4;
  NSPointerArray *v5;
  NSPointerArray *outputDelegates;
  void *v7;
  char v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!self->_outputDelegates)
  {
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v5 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    outputDelegates = self->_outputDelegates;
    self->_outputDelegates = v5;

    v4 = v9;
  }
  if (v4)
  {
    -[NSPointerArray allObjects](self->_outputDelegates, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v9);

    v4 = v9;
    if ((v8 & 1) == 0)
    {
      -[NSPointerArray addPointer:](self->_outputDelegates, "addPointer:", v9);
      v4 = v9;
    }
  }

}

- (void)brailleDisplayStringDidChange:(id)a3 brailleSelection:(_NSRange)a4 modifiers:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  NSPointerArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  length = a4.length;
  location = a4.location;
  v21 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_outputDelegates;
  v12 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "brailleDisplayStringDidChange:brailleSelection:modifiers:", v9, location, length, v10, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)replaceScriptStringRange:(_NSRange)a3 withScriptString:(id)a4 cursorLocation:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  NSPointerArray *v10;
  _OWORD v11[4];
  _BYTE v12[128];
  uint64_t v13;

  length = a3.length;
  location = a3.location;
  v13 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  memset(v11, 0, sizeof(v11));
  v10 = self->_outputDelegates;
  if (-[NSPointerArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", v11, v12, 16))
  {
    objc_msgSend(**((id **)&v11[0] + 1), "replaceScriptStringRange:withScriptString:cursorLocation:", location, length, v9, a5, *(_QWORD *)&v11[0]);
  }

}

- (void)scriptSelectionDidChange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSPointerArray *v5;
  _OWORD v6[4];
  _BYTE v7[128];
  uint64_t v8;

  length = a3.length;
  location = a3.location;
  v8 = *MEMORY[0x24BDAC8D0];
  memset(v6, 0, sizeof(v6));
  v5 = self->_outputDelegates;
  if (-[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", v6, v7, 16))
  {
    objc_msgSend(**((id **)&v6[0] + 1), "scriptSelectionDidChange:", location, length, *(_QWORD *)&v6[0]);
  }

}

- (void)didInsertScriptString:(id)a3
{
  id v4;
  NSPointerArray *v5;
  _OWORD v6[4];
  _BYTE v7[128];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(v6, 0, sizeof(v6));
  v5 = self->_outputDelegates;
  if (-[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", v6, v7, 16))
  {
    objc_msgSend(**((id **)&v6[0] + 1), "didInsertScriptString:", v4, *(_QWORD *)&v6[0]);
  }

}

- (void)brailleDisplayInsertedCharacter:(id)a3 modifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSPointerArray *v10;
  _OWORD v11[4];
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((SCROCustomBrailleEnabled() & 1) == 0 && (SCROJapaneseBrailleSelected() & 1) == 0)
  {
    if (!objc_msgSend(v6, "bits")
      || -[BRLTBrailleStateManager inputTranslationMode](self->_stateManager, "inputTranslationMode") == 2
      && (+[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "primaryTableSupportsEightDotBraille"),
          v8,
          v9))
    {
      -[BRLTBrailleStateManager translate](self->_stateManager, "translate");
    }
  }
  memset(v11, 0, sizeof(v11));
  v10 = self->_outputDelegates;
  if (-[NSPointerArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", v11, v12, 16))
  {
    objc_msgSend(**((id **)&v11[0] + 1), "brailleDisplayInsertedCharacter:modifiers:", v6, v7, *(_QWORD *)&v11[0]);
  }

}

- (void)brailleDisplayDeletedCharacter:(id)a3
{
  id v4;
  NSPointerArray *v5;
  void *v6;
  int v7;
  _OWORD v8[4];
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(v8, 0, sizeof(v8));
  v5 = self->_outputDelegates;
  if (-[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", v8, v9, 16))
  {
    objc_msgSend(**((id **)&v8[0] + 1), "brailleDisplayDeletedCharacter:", v4, *(_QWORD *)&v8[0]);
  }

  if ((SCROCustomBrailleEnabled() & 1) == 0 && (SCROJapaneseBrailleSelected() & 1) == 0)
  {
    if (!objc_msgSend(v4, "bits")
      || -[BRLTBrailleStateManager inputTranslationMode](self->_stateManager, "inputTranslationMode") == 2
      && (+[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "primaryTableSupportsEightDotBraille"),
          v6,
          v7))
    {
      -[BRLTBrailleStateManager translate](self->_stateManager, "translate", *(_QWORD *)&v8[0]);
    }
  }

}

- (void)requestSpeech:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  NSPointerArray *v8;
  _OWORD v9[4];
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  memset(v9, 0, sizeof(v9));
  v8 = self->_outputDelegates;
  if (-[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", v9, v10, 16))
  {
    objc_msgSend(**((id **)&v9[0] + 1), "requestSpeech:language:", v6, v7, *(_QWORD *)&v9[0]);
  }

}

- (int)lineFocus
{
  return self->_lineFocus;
}

- (void)setLineFocus:(int)a3
{
  self->_lineFocus = a3;
}

- (NSString)outputTableIdentifier
{
  return self->_outputTableIdentifier;
}

- (NSString)inputTableIdentifier
{
  return self->_inputTableIdentifier;
}

- (BOOL)isEditableText
{
  return self->_isEditableText;
}

- (BOOL)needsTechnicalMode
{
  return self->_needsTechnicalMode;
}

- (BOOL)showDotsSevenAndEight
{
  return self->_showDotsSevenAndEight;
}

- (int)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(int)a3
{
  self->_displayMode = a3;
}

- (BOOL)currentUnread
{
  return self->_currentUnread;
}

- (void)setCurrentUnread:(BOOL)a3
{
  self->_currentUnread = a3;
}

- (BOOL)anyUnread
{
  return self->_anyUnread;
}

- (void)setAnyUnread:(BOOL)a3
{
  self->_anyUnread = a3;
}

- (id)appToken
{
  return self->_appToken;
}

- (void)setAppToken:(id)a3
{
  objc_storeStrong(&self->_appToken, a3);
}

- (int64_t)lineOffset
{
  return self->_lineOffset;
}

- (void)setLineOffset:(int64_t)a3
{
  self->_lineOffset = a3;
}

- (NSAttributedString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
  objc_storeStrong((id *)&self->_statusText, a3);
}

- (BRLTBrailleStateManager)stateManager
{
  return self->_stateManager;
}

- (BRLTEditString)editString
{
  return self->_editString;
}

- (int64_t)firstToken
{
  return self->_firstToken;
}

- (int64_t)lastToken
{
  return self->_lastToken;
}

- (unint64_t)generationID
{
  return self->_generationID;
}

- (NSPointerArray)outputDelegates
{
  return self->_outputDelegates;
}

- (BRLTScriptString)emptyEditingScriptString
{
  return self->_emptyEditingScriptString;
}

- (void)setEmptyEditingScriptString:(id)a3
{
  objc_storeStrong((id *)&self->_emptyEditingScriptString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyEditingScriptString, 0);
  objc_storeStrong((id *)&self->_outputDelegates, 0);
  objc_storeStrong((id *)&self->_editString, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong(&self->_appToken, 0);
  objc_storeStrong((id *)&self->_inputTableIdentifier, 0);
  objc_storeStrong((id *)&self->_outputTableIdentifier, 0);
}

@end
