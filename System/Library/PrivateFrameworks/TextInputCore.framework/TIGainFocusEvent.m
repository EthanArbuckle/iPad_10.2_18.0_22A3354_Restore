@implementation TIGainFocusEvent

- (id)originalDocumentText
{
  NSString *originalDocumentText;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  NSString *v16;
  NSString *v17;

  originalDocumentText = self->_originalDocumentText;
  if (!originalDocumentText)
  {
    -[TIUserAction keyboardState](self, "keyboardState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "contextBeforeInput");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (NSString *)v7;
      if (v7)
        v9 = (const __CFString *)v7;
      else
        v9 = &stru_1EA1081D0;
      objc_msgSend(v5, "selectedText");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (const __CFString *)v10;
      else
        v12 = &stru_1EA1081D0;
      objc_msgSend(v5, "contextAfterInput");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = (const __CFString *)v13;
      else
        v15 = &stru_1EA1081D0;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@%@ "), v9, v12, v15);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      v17 = self->_originalDocumentText;
      self->_originalDocumentText = v16;

    }
    else
    {
      v8 = self->_originalDocumentText;
      self->_originalDocumentText = (NSString *)&stru_1EA1081D0;
    }

    originalDocumentText = self->_originalDocumentText;
  }
  return originalDocumentText;
}

- (TIGainFocusEvent)initWithTIKeyboardState:(id)a3 andLocale:(id)a4
{
  id v7;
  TIGainFocusEvent *v8;
  TIGainFocusEvent *v9;
  id v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TIGainFocusEvent;
  v8 = -[TIContextChangeEvent initWithTIKeyboardState:andActionType:](&v12, sel_initWithTIKeyboardState_andActionType_, a3, 10);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locale, a4);
    v10 = -[TIGainFocusEvent originalWords](v9, "originalWords");
  }

  return v9;
}

- (id)originalWords
{
  NSArray *originalWords;
  void *v4;
  void *v5;
  size_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSArray *v10;
  NSArray *v11;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  originalWords = self->_originalWords;
  if (!originalWords)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIGainFocusEvent originalDocumentText](self, "originalDocumentText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "length"))
    {
LABEL_15:
      v10 = (NSArray *)objc_msgSend(v4, "copy");
      v11 = self->_originalWords;
      self->_originalWords = v10;

      originalWords = self->_originalWords;
      return originalWords;
    }
    v6 = 4 * objc_msgSend(v5, "length");
    v7 = malloc_type_malloc(v6, 0x93A6B256uLL);
    v17 = 0;
    v16 = xmmword_1DA910F40;
    if (objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v7, v6, &v17, 4, 0, 0, objc_msgSend(v5, "length"), &v16))
    {
      if (v16 != 0x7FFFFFFFFFFFFFFFLL && IXACanLogMessageAtLevel())
      {
        IXASessionDetailsLogFacility();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s The range (%lu, %lu) was left over when getting the bytes from the original document text '%@'"), "-[TIGainFocusEvent originalWords]", v16, v5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v19 = v14;
          _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        }
      }
      LMStreamTokenizerCreate();
      v15 = v4;
      LMStreamTokenizerPushBytes();
      LMStreamTokenizerRelease();
      v9 = v15;
    }
    else
    {
      if (!IXACanLogMessageAtLevel())
      {
LABEL_14:
        free(v7);
        goto LABEL_15;
      }
      IXASessionDetailsLogFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Unable to get the bytes from the original document text '%@'"), "-[TIGainFocusEvent originalWords]", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v13;
        _os_log_debug_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }

    goto LABEL_14;
  }
  return originalWords;
}

- (NSArray)originalWordEntries
{
  NSArray *originalWordEntries;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  TIWordEntry *v20;
  void *v21;
  NSObject *v22;
  NSArray *v23;
  void *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  NSArray *v29;
  TIGainFocusEvent *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  originalWordEntries = self->_originalWordEntries;
  if (!originalWordEntries)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[TIGainFocusEvent originalDocumentText](self, "originalDocumentText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v30 = self;
    -[TIGainFocusEvent originalWords](self, "originalWords");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v28)
    {
      v6 = 0;
      v27 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v32 != v27)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v9 = objc_msgSend(v4, "rangeOfString:options:range:", v8, 2, v6, v5);
          if (v9 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (IXACanLogMessageAtLevel())
            {
              IXASessionDetailsLogFacility();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s An error occurred when trying to locate '%@' within the original document text '%@'"), "-[TIGainFocusEvent originalWordEntries]", v8, v4);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v36 = v25;
                _os_log_debug_impl(&dword_1DA6F2000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

              }
            }
            goto LABEL_15;
          }
          v11 = v9;
          v12 = v10;
          objc_msgSend(v4, "substringWithRange:", 0, v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DBDB78], "documentStateWithContextBefore:selectedText:contextAfter:", v13, 0, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v11 + v12;
          objc_msgSend(v4, "substringWithRange:", 0, v11 + v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIUserAction keyboardState](v30, "keyboardState");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v16, "copy");

          objc_msgSend(MEMORY[0x1E0DBDB78], "documentStateWithContextBefore:selectedText:contextAfter:", v15, 0, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setDocumentState:", v18);

          objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithCandidate:forInput:", v8, v8);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_alloc_init(TIWordEntry);
          -[TIUserAction setDocumentState:](v20, "setDocumentState:", v14);
          -[TIUserAction setKeyboardState:](v20, "setKeyboardState:", v17);
          -[TIWordEntry setAcceptedCandidate:](v20, "setAcceptedCandidate:", v19);
          objc_msgSend(v19, "candidate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIWordEntry setAcceptedString:](v20, "setAcceptedString:", v21);

          -[TIWordEntry setOrigin:](v20, "setOrigin:", 1);
          -[NSArray addObject:](v29, "addObject:", v20);
          v5 = objc_msgSend(v4, "length") - v6;

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v28)
          continue;
        break;
      }
    }
LABEL_15:

    v23 = v30->_originalWordEntries;
    v30->_originalWordEntries = v29;

    originalWordEntries = v30->_originalWordEntries;
  }
  return originalWordEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalWordEntries, 0);
  objc_storeStrong((id *)&self->_originalWords, 0);
  objc_storeStrong((id *)&self->_originalDocumentText, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

void __33__TIGainFocusEvent_originalWords__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  id v5;

  if ((a4 - 500) <= 0xFFFFFE0C)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a2, a3, 4);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
}

@end
