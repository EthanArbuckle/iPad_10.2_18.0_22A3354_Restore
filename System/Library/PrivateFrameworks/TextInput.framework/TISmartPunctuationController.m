@implementation TISmartPunctuationController

- (void)setSmartQuotesEnabled:(BOOL)a3
{
  self->_smartQuotesEnabled = a3;
}

- (void)setSmartDashesEnabled:(BOOL)a3
{
  self->_smartDashesEnabled = a3;
}

- (unint64_t)autoQuoteType
{
  return self->_autoQuoteType;
}

- (void)reset
{
  *(_WORD *)&self->_leftSingleQuotationMarkInserted = 0;
}

- (void)setSmartPunctuationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_smartPunctuationOptions, a3);
}

- (void)setAutoQuoteType:(unint64_t)a3
{
  self->_autoQuoteType = a3;
}

- (TISmartPunctuationController)init
{
  TISmartPunctuationController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TISmartPunctuationController;
  result = -[TISmartPunctuationController init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_smartQuotesEnabled = 257;
    result->_autoQuoteType = 2;
  }
  return result;
}

- (void)_initializeQuoteCharacterSetsIfNecessary
{
  NSCharacterSet *v3;
  NSCharacterSet *alphanumericCharacterSet;
  NSCharacterSet *v5;
  NSCharacterSet *whitespaceAndNewlineCharacterSet;
  NSCharacterSet *v7;
  NSCharacterSet *decimalDigitCharacterSet;
  NSCharacterSet *v9;
  NSCharacterSet *punctuationCharacterSet;
  void *v11;
  void *v12;
  NSCharacterSet *v13;
  NSCharacterSet *openerCharacterSet;
  NSCharacterSet *v15;
  NSCharacterSet *germanApostrophePrecedingSet;
  NSCharacterSet *v17;
  NSCharacterSet *dutchApostropheFollowingSet;
  NSCharacterSet *v19;
  NSCharacterSet *cornerBracketCharacterSet;
  NSCharacterSet *v21;
  NSCharacterSet *bookTitleMarkCharacterSet;

  if (!self->_alphanumericCharacterSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
    v3 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    alphanumericCharacterSet = self->_alphanumericCharacterSet;
    self->_alphanumericCharacterSet = v3;

  }
  if (!self->_whitespaceAndNewlineCharacterSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    whitespaceAndNewlineCharacterSet = self->_whitespaceAndNewlineCharacterSet;
    self->_whitespaceAndNewlineCharacterSet = v5;

  }
  if (!self->_decimalDigitCharacterSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v7 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    decimalDigitCharacterSet = self->_decimalDigitCharacterSet;
    self->_decimalDigitCharacterSet = v7;

  }
  if (!self->_punctuationCharacterSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v9 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    punctuationCharacterSet = self->_punctuationCharacterSet;
    self->_punctuationCharacterSet = v9;

  }
  if (!self->_openerCharacterSet)
  {
    v11 = (void *)MEMORY[0x1E0CB3500];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("([{</@-=%C%C"), 8211, 8212);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "characterSetWithCharactersInString:", v12);
    v13 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    openerCharacterSet = self->_openerCharacterSet;
    self->_openerCharacterSet = v13;

  }
  if (!self->_germanApostrophePrecedingSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("sxzSXZ"));
    v15 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    germanApostrophePrecedingSet = self->_germanApostrophePrecedingSet;
    self->_germanApostrophePrecedingSet = v15;

  }
  if (!self->_dutchApostropheFollowingSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("nstNST"));
    v17 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    dutchApostropheFollowingSet = self->_dutchApostropheFollowingSet;
    self->_dutchApostropheFollowingSet = v17;

  }
  if (!self->_cornerBracketCharacterSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("「」『』"));
    v19 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    cornerBracketCharacterSet = self->_cornerBracketCharacterSet;
    self->_cornerBracketCharacterSet = v19;

  }
  if (!self->_bookTitleMarkCharacterSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("《》〈〉"));
    v21 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    bookTitleMarkCharacterSet = self->_bookTitleMarkCharacterSet;
    self->_bookTitleMarkCharacterSet = v21;

  }
}

- (void)_initializeDashCharacterSetsIfNecessary
{
  NSCharacterSet *v3;
  NSCharacterSet *decimalDigitCharacterSet;
  NSCharacterSet *v5;
  NSCharacterSet *dashCharacterSet;
  NSCharacterSet *v7;
  NSCharacterSet *enDashCharacterSet;
  NSCharacterSet *v9;
  NSCharacterSet *emDashCharacterSet;

  if (!self->_decimalDigitCharacterSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v3 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    decimalDigitCharacterSet = self->_decimalDigitCharacterSet;
    self->_decimalDigitCharacterSet = v3;

  }
  if (!self->_dashCharacterSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-"));
    v5 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    dashCharacterSet = self->_dashCharacterSet;
    self->_dashCharacterSet = v5;

  }
  if (!self->_enDashCharacterSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("–"));
    v7 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    enDashCharacterSet = self->_enDashCharacterSet;
    self->_enDashCharacterSet = v7;

  }
  if (!self->_emDashCharacterSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("—"));
    v9 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    emDashCharacterSet = self->_emDashCharacterSet;
    self->_emDashCharacterSet = v9;

  }
}

- (id)smartPunctuationResultsForString:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v25;
  TISmartPunctuationController *v26;
  void *v27;
  void *v28;

  v4 = a3;
  if (-[TISmartPunctuationController smartQuotesEnabled](self, "smartQuotesEnabled")
    || -[TISmartPunctuationController smartDashesEnabled](self, "smartDashesEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-'\"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");
    if (v5)
    {
      v6 = v5;
      v26 = self;
      while (1)
      {
        v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v27, 4, 0, v6);
        if (v7 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_11;
        v9 = v7;
        v10 = v8;
        objc_msgSend(v4, "substringToIndex:", v7);
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "substringFromIndex:", v9 + v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "substringWithRange:", v9, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[TIDocumentState documentStateWithContextBefore:selectedText:contextAfter:](TIDocumentState, "documentStateWithContextBefore:selectedText:contextAfter:", v11, 0, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TISmartPunctuationController smartPunctuationOutputForInput:isLockedInput:documentState:](self, "smartPunctuationOutputForInput:isLockedInput:documentState:", v13, 0, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "insertionText");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)v11;
        if (!objc_msgSend(v16, "length"))
          goto LABEL_9;
        objc_msgSend(v15, "insertionText");
        v17 = v4;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v13);

        v4 = v17;
        if ((v19 & 1) == 0)
          break;
LABEL_10:
        v6 = v9 - objc_msgSend(v15, "deletionCount");

        self = v26;
        if (!v6)
          goto LABEL_11;
      }
      v20 = v9 - objc_msgSend(v15, "deletionCount");
      v21 = objc_msgSend(v15, "deletionCount") + v10;
      v22 = objc_alloc(MEMORY[0x1E0CB3950]);
      objc_msgSend(v15, "insertionText");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v22, "initWithRange:replacementString:", v20, v21, v23);

      v4 = v17;
      objc_msgSend(v25, "addObject:", v16);
LABEL_9:

      goto LABEL_10;
    }
LABEL_11:

  }
  else
  {
    v25 = (id)MEMORY[0x1E0C9AA60];
  }

  return v25;
}

- (id)smartPunctuationedStringForString:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v25;
  TISmartPunctuationController *v26;
  void *v27;
  void *v28;

  v4 = a3;
  if (objc_msgSend(v4, "length")
    && (-[TISmartPunctuationController smartQuotesEnabled](self, "smartQuotesEnabled")
     || -[TISmartPunctuationController smartDashesEnabled](self, "smartDashesEnabled")))
  {
    v25 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-'\"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");
    if (v5)
    {
      v6 = v5;
      v26 = self;
      while (1)
      {
        v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v27, 4, 0, v6);
        if (v7 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_12;
        v9 = v7;
        v10 = v8;
        objc_msgSend(v4, "substringToIndex:", v7);
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "substringFromIndex:", v9 + v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "substringWithRange:", v9, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[TIDocumentState documentStateWithContextBefore:selectedText:contextAfter:](TIDocumentState, "documentStateWithContextBefore:selectedText:contextAfter:", v11, 0, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TISmartPunctuationController smartPunctuationOutputForInput:isLockedInput:documentState:](self, "smartPunctuationOutputForInput:isLockedInput:documentState:", v13, 0, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "insertionText");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)v11;
        if (!objc_msgSend(v16, "length"))
          goto LABEL_10;
        objc_msgSend(v15, "insertionText");
        v17 = v4;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v13);

        v4 = v17;
        if ((v19 & 1) == 0)
          break;
LABEL_11:
        v6 = v9 - objc_msgSend(v15, "deletionCount");

        self = v26;
        if (!v6)
          goto LABEL_12;
      }
      v20 = v9 - objc_msgSend(v15, "deletionCount");
      v21 = objc_msgSend(v15, "deletionCount") + v10;
      objc_msgSend(v15, "insertionText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v4 = v17;
      objc_msgSend(v25, "replaceCharactersInRange:withString:", v20, v22, v16);
LABEL_10:

      goto LABEL_11;
    }
LABEL_12:

    v23 = v25;
  }
  else
  {
    v23 = v4;
  }

  return v23;
}

- (id)smartPunctuationOutputForInput:(id)a3 isLockedInput:(BOOL)a4 documentState:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  TIKeyboardOutput *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TIKeyboardOutput *v15;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (!v8
    || !-[TISmartPunctuationController smartQuotesEnabled](self, "smartQuotesEnabled")
    && !-[TISmartPunctuationController smartDashesEnabled](self, "smartDashesEnabled"))
  {
    v11 = 0;
    goto LABEL_27;
  }
  if (-[TISmartPunctuationController smartQuotesEnabled](self, "smartQuotesEnabled"))
  {
    if (-[TISmartPunctuationController autoQuoteType](self, "autoQuoteType") != 2 || v6)
    {
      if (-[TISmartPunctuationController autoQuoteType](self, "autoQuoteType") == 1)
      {
        objc_msgSend(v9, "markedText");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TISmartPunctuationController _alternatingStringForInputString:isLockedInput:hasMarkedText:](self, "_alternatingStringForInputString:isLockedInput:hasMarkedText:", v8, v6, objc_msgSend(v12, "length") != 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v10 = objc_alloc_init(TIKeyboardOutput);
          -[TIKeyboardOutput insertText:](v10, "insertText:", v13);
        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      -[TISmartPunctuationController _checkInput:forContextualQuotesInDocumentState:](self, "_checkInput:forContextualQuotesInDocumentState:", v8, v9);
      v10 = (TIKeyboardOutput *)objc_claimAutoreleasedReturnValue();
    }
    if (!v10 && !v6)
    {
      -[TISmartPunctuationController _checkInput:forContextualChinesePunctuationInDocumentState:](self, "_checkInput:forContextualChinesePunctuationInDocumentState:", v8, v9);
      v10 = (TIKeyboardOutput *)objc_claimAutoreleasedReturnValue();
    }
    if (!-[TISmartPunctuationController smartDashesEnabled](self, "smartDashesEnabled"))
    {
      v11 = 0;
      v14 = 0;
      if (!v10)
        goto LABEL_27;
LABEL_25:
      v15 = v10;

      v11 = v14;
      goto LABEL_26;
    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
    if (!-[TISmartPunctuationController smartDashesEnabled](self, "smartDashesEnabled"))
      goto LABEL_27;
  }
  -[TISmartPunctuationController _checkInput:forContextualDashesInDocumentState:](self, "_checkInput:forContextualDashesInDocumentState:", v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISmartPunctuationController _checkInput:forContextualEllipsesInDocumentState:](self, "_checkInput:forContextualEllipsesInDocumentState:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_25;
  if (v14)
  {
    v15 = v14;
LABEL_26:

    v11 = v15;
  }
LABEL_27:

  return v11;
}

- (id)_alternatingStringForInputString:(id)a3 isLockedInput:(BOOL)a4 hasMarkedText:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  const __CFString *v9;
  char v10;
  char v11;
  const __CFString *v12;
  int v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  BOOL *p_leftDoubleQuotationMarkInserted;
  const __CFString *v18;

  v6 = a4;
  v8 = a3;
  v9 = CFSTR("\");
  if ((objc_msgSend(v8, "containsString:", CFSTR("\")) & 1) != 0)
  {
    v10 = 0;
    v11 = 0;
    v12 = CFSTR("”");
    v13 = 1;
    v14 = 9;
    v15 = CFSTR("“");
LABEL_11:
    p_leftDoubleQuotationMarkInserted = (BOOL *)self + v14;
    if (v13 && !v6)
    {
      if (*p_leftDoubleQuotationMarkInserted)
        v18 = v12;
      else
        v18 = v15;
      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v9, v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = !*p_leftDoubleQuotationMarkInserted;
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  v13 = objc_msgSend(v8, "containsString:", CFSTR("'"));
  if ((v13 & 1) != 0)
  {
    v11 = 0;
    v10 = 0;
    goto LABEL_5;
  }
  v11 = objc_msgSend(v8, "containsString:", CFSTR("“"));
  if ((v11 & 1) == 0 && (objc_msgSend(v8, "containsString:", CFSTR("”")) & 1) == 0)
  {
    if ((objc_msgSend(v8, "containsString:", CFSTR("‘")) & 1) != 0)
    {
      v10 = 0;
      v11 = 1;
    }
    else
    {
      if (!objc_msgSend(v8, "containsString:", CFSTR("’")))
        goto LABEL_6;
      v11 = 0;
      v10 = 1;
    }
LABEL_5:
    if (!a5)
    {
      v9 = CFSTR("'");
      v12 = CFSTR("’");
      v14 = 8;
      v15 = CFSTR("‘");
      goto LABEL_11;
    }
LABEL_6:
    v16 = 0;
    goto LABEL_22;
  }
  v13 = 0;
  v10 = v11 ^ 1;
  p_leftDoubleQuotationMarkInserted = &self->_leftDoubleQuotationMarkInserted;
LABEL_17:
  v16 = 0;
  if ((v11 & 1) != 0 || (v10 & 1) != 0)
    goto LABEL_21;
  v16 = 0;
  if ((v13 & v6) == 1)
  {
    v11 = 0;
LABEL_21:
    *p_leftDoubleQuotationMarkInserted = v11;
  }
LABEL_22:

  return v16;
}

- (id)_checkInput:(id)a3 forContextualQuotesInDocumentState:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  TIKeyboardOutput *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  unsigned __int16 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v37;
  _BOOL4 v38;
  int v39;
  int v40;
  TISmartPunctuationOptions *smartPunctuationOptions;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  int v45;
  TISmartPunctuationOptions *v46;
  void *v47;
  uint64_t v49;
  unsigned __int16 v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "rangeOfString:", CFSTR("'"));
  v10 = v8;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v9;
    v15 = v8;
    goto LABEL_6;
  }
  v11 = objc_msgSend(v6, "rangeOfString:", CFSTR("\"));
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v11;
    v14 = v12;
LABEL_6:
    -[TISmartPunctuationController smartPunctuationOptions](self, "smartPunctuationOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v13 = 0;
LABEL_34:

      goto LABEL_35;
    }
    v17 = v16;
    -[TISmartPunctuationController _initializeQuoteCharacterSetsIfNecessary](self, "_initializeQuoteCharacterSetsIfNecessary");
    objc_msgSend(v7, "contextBeforeInput");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (__CFString *)v18;
    else
      v20 = &stru_1E243B990;
    objc_msgSend(v6, "substringToIndex:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v20, "stringByAppendingString:", v21);
    v22 = v15;
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v22;
    v54 = v14;
    objc_msgSend(v6, "substringFromIndex:", v22 + v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v7;
    objc_msgSend(v7, "contextAfterInput");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
      v27 = (const __CFString *)v25;
    else
      v27 = &stru_1E243B990;
    objc_msgSend(v24, "stringByAppendingString:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(v23, "_lastLongCharacter");
    v52 = v28;
    v50 = objc_msgSend(v28, "_firstLongCharacter");
    v51 = objc_msgSend(v23, "length");
    v30 = -[NSCharacterSet characterIsMember:](self->_whitespaceAndNewlineCharacterSet, "characterIsMember:", v29);
    v31 = -[NSCharacterSet characterIsMember:](self->_openerCharacterSet, "characterIsMember:", v29);
    objc_msgSend(v17, "leftSingleQuote");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "rangeOfString:options:", v32, 12);
    v49 = v33;

    objc_msgSend(v17, "leftDoubleQuote");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "rangeOfString:options:", v34, 12);
    v36 = v35;

    v37 = -[NSCharacterSet characterIsMember:](self->_alphanumericCharacterSet, "characterIsMember:", v29);
    v38 = -[NSCharacterSet characterIsMember:](self->_alphanumericCharacterSet, "characterIsMember:", v50);
    if (v51)
      v39 = v30;
    else
      v39 = 1;
    v40 = v39 | v31;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v49)
        v40 = 1;
      smartPunctuationOptions = self->_smartPunctuationOptions;
      if (v40 == 1)
        -[TISmartPunctuationOptions leftDoubleQuote](smartPunctuationOptions, "leftDoubleQuote");
      else
        -[TISmartPunctuationOptions rightDoubleQuote](smartPunctuationOptions, "rightDoubleQuote");
      v42 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v36)
        v40 = 1;
      if (v40 != 1)
      {
        v45 = v37 && v38;
        v46 = self->_smartPunctuationOptions;
        v7 = v55;
        v44 = v54;
        if (v45 == 1)
          -[TISmartPunctuationOptions apostrophe](v46, "apostrophe");
        else
          -[TISmartPunctuationOptions rightSingleQuote](v46, "rightSingleQuote");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      -[TISmartPunctuationOptions leftSingleQuote](self->_smartPunctuationOptions, "leftSingleQuote");
      v42 = objc_claimAutoreleasedReturnValue();
    }
    v43 = (void *)v42;
    v7 = v55;
    v44 = v54;
LABEL_33:
    objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", v53, v44, v43, v49);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc_init(TIKeyboardOutput);
    -[TIKeyboardOutput insertText:](v13, "insertText:", v47);

    v16 = v17;
    goto LABEL_34;
  }
  v13 = 0;
LABEL_35:

  return v13;
}

- (id)_checkInput:(id)a3 forContextualChinesePunctuationInDocumentState:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  TIKeyboardOutput *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("「")) & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("」"));
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("《")) & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(v6, "isEqualToString:", CFSTR("》"));
  -[TISmartPunctuationController smartPunctuationOptions](self, "smartPunctuationOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("zh-Hans"));

  if (v8)
    v14 = v13;
  else
    v14 = v9;
  if (v14 == 1)
  {
    -[TISmartPunctuationController _initializeQuoteCharacterSetsIfNecessary](self, "_initializeQuoteCharacterSetsIfNecessary");
    v15 = 80;
    if (v8)
      v15 = 72;
    v16 = *(id *)((char *)&self->super.isa + v15);
    objc_msgSend(v7, "contextBeforeInput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "rangeOfCharacterFromSet:options:", v16, 4);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend(v17, "substringWithRange:", v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_chineseContextualVariantMapping");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v20 = objc_alloc_init(TIKeyboardOutput);
        -[TIKeyboardOutput insertText:](v20, "insertText:", v24);
      }
      else
      {
        v20 = 0;
      }

    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_checkInput:(id)a3 forContextualDashesInDocumentState:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  TIKeyboardOutput *v31;
  char v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  void *v38;
  uint64_t v40;
  uint64_t v41;

  v6 = a4;
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("-")))
    goto LABEL_18;
  -[TISmartPunctuationController _initializeDashCharacterSetsIfNecessary](self, "_initializeDashCharacterSetsIfNecessary");
  objc_msgSend(v6, "contextBeforeInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  objc_msgSend(v6, "contextBeforeInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "rangeOfCharacterFromSet:options:range:", self->_dashCharacterSet, 12, 0, v8);
  v12 = v11;

  objc_msgSend(v6, "contextBeforeInput");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v13, "rangeOfCharacterFromSet:options:range:", self->_enDashCharacterSet, 12, 0, v8);
  v15 = v14;

  objc_msgSend(v6, "contextBeforeInput");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v16, "rangeOfCharacterFromSet:options:range:", self->_emDashCharacterSet, 12, 0, v8);
  v18 = v17;

  if (v10 && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    do
    {
      objc_msgSend(v6, "contextBeforeInput", v40);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "rangeOfCharacterFromSet:options:range:", self->_dashCharacterSet, 12, v10 - 1, 1);
      v22 = v21;

      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v23 = 0;
      }
      else
      {
        v10 = v20;
        v23 = v22;
      }
      v12 += v23;
    }
    while (v20 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0);
  }
  if (v12)
  {
    objc_msgSend(v6, "contextBeforeInput");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v12 + v10 == objc_msgSend(v25, "length");

    if (v15)
      goto LABEL_14;
LABEL_27:
    v29 = 0;
    if (!v18)
      goto LABEL_16;
    goto LABEL_15;
  }
  v26 = 0;
  if (!v15)
    goto LABEL_27;
LABEL_14:
  v27 = v40 + v15;
  objc_msgSend(v6, "contextBeforeInput", v40);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27 == objc_msgSend(v28, "length");

  if (v18)
  {
LABEL_15:
    objc_msgSend(v6, "contextBeforeInput", v40);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = v41 + v18 == objc_msgSend(v30, "length");

  }
LABEL_16:
  if (v26 || v29 || (_DWORD)v18)
  {
    v32 = !v26;
    if (v12 != 1)
      v32 = 1;
    if ((v32 & 1) != 0)
    {
      if (v26 && v12 > 1)
        v36 = 2;
      else
        v36 = 1;
      if (v26 && v12 > 1 || v29)
      {
        v35 = 8212;
LABEL_39:
        v31 = objc_alloc_init(TIKeyboardOutput);
        -[TIKeyboardOutput deleteBackward:](v31, "deleteBackward:", v36);
        objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardOutput insertText:](v31, "insertText:", v38);

        goto LABEL_40;
      }
      v37 = v18 ^ 1;
      if (v12 != 1)
        v37 = 1;
      if ((v37 & 1) != 0)
        goto LABEL_18;
      v35 = 8212;
    }
    else
    {
      objc_msgSend(v6, "contextBeforeInput");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "substringToIndex:", v10);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[NSCharacterSet characterIsMember:](self->_decimalDigitCharacterSet, "characterIsMember:", (unsigned __int16)objc_msgSend(v34, "_lastLongCharacter")))
      {
        v35 = 8211;
      }
      else
      {
        v35 = 8212;
      }

    }
    v36 = 1;
    goto LABEL_39;
  }
LABEL_18:
  v31 = 0;
LABEL_40:

  return v31;
}

- (id)_checkInput:(id)a3 forContextualEllipsesInDocumentState:(id)a4
{
  id v5;
  void *v6;
  int v7;
  TIKeyboardOutput *v8;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("."))
    && (objc_msgSend(v5, "contextBeforeInput"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hasSuffix:", CFSTR("..")),
        v6,
        v7))
  {
    v8 = objc_alloc_init(TIKeyboardOutput);
    -[TIKeyboardOutput deleteBackward:](v8, "deleteBackward:", 2);
    -[TIKeyboardOutput insertText:](v8, "insertText:", CFSTR("…"));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)smartQuotesEnabled
{
  return self->_smartQuotesEnabled;
}

- (BOOL)smartDashesEnabled
{
  return self->_smartDashesEnabled;
}

- (TISmartPunctuationOptions)smartPunctuationOptions
{
  return self->_smartPunctuationOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartPunctuationOptions, 0);
  objc_storeStrong((id *)&self->_emDashCharacterSet, 0);
  objc_storeStrong((id *)&self->_enDashCharacterSet, 0);
  objc_storeStrong((id *)&self->_dashCharacterSet, 0);
  objc_storeStrong((id *)&self->_bookTitleMarkCharacterSet, 0);
  objc_storeStrong((id *)&self->_cornerBracketCharacterSet, 0);
  objc_storeStrong((id *)&self->_dutchApostropheFollowingSet, 0);
  objc_storeStrong((id *)&self->_germanApostrophePrecedingSet, 0);
  objc_storeStrong((id *)&self->_openerCharacterSet, 0);
  objc_storeStrong((id *)&self->_punctuationCharacterSet, 0);
  objc_storeStrong((id *)&self->_decimalDigitCharacterSet, 0);
  objc_storeStrong((id *)&self->_whitespaceAndNewlineCharacterSet, 0);
  objc_storeStrong((id *)&self->_alphanumericCharacterSet, 0);
}

+ (id)_chineseContextualVariantMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__TISmartPunctuationController__chineseContextualVariantMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_chineseContextualVariantMapping___onceToken != -1)
    dispatch_once(&_chineseContextualVariantMapping___onceToken, block);
  return (id)_chineseContextualVariantMapping___chineseContextualVariantMapping;
}

void __64__TISmartPunctuationController__chineseContextualVariantMapping__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", CFSTR("ChineseContextualVariantMapping"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v1);
    v3 = (void *)_chineseContextualVariantMapping___chineseContextualVariantMapping;
    _chineseContextualVariantMapping___chineseContextualVariantMapping = v2;

  }
}

@end
