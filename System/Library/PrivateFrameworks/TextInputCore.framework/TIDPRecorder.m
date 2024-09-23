@implementation TIDPRecorder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingSessionAligned, 0);
  objc_storeStrong((id *)&self->_typingSession, 0);
  objc_storeStrong((id *)&self->_wordCoder, 0);
  objc_storeStrong((id *)&self->_characterCoder, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_secondaryLexiconLock, 0);
  objc_storeStrong((id *)&self->_primaryLexiconLock, 0);
  objc_storeStrong((id *)&self->_delegateLock, 0);
}

- (void)dealloc
{
  _LXLexicon *lexiconPrimaryInputMode;
  _LXLexicon *lexiconSecondaryInputMode;
  objc_super v5;

  -[NSLock lock](self->_primaryLexiconLock, "lock");
  lexiconPrimaryInputMode = self->_lexiconPrimaryInputMode;
  if (lexiconPrimaryInputMode)
  {
    CFRelease(lexiconPrimaryInputMode);
    self->_lexiconPrimaryInputMode = 0;
  }
  -[NSLock unlock](self->_primaryLexiconLock, "unlock");
  -[NSLock lock](self->_secondaryLexiconLock, "lock");
  lexiconSecondaryInputMode = self->_lexiconSecondaryInputMode;
  if (lexiconSecondaryInputMode)
  {
    CFRelease(lexiconSecondaryInputMode);
    self->_lexiconSecondaryInputMode = 0;
  }
  -[NSLock unlock](self->_secondaryLexiconLock, "unlock");
  v5.receiver = self;
  v5.super_class = (Class)TIDPRecorder;
  -[TIDPRecorder dealloc](&v5, sel_dealloc);
}

- (TIDPRecorder)initWithTypingSession:(id)a3 aligned:(id)a4
{
  id v7;
  id v8;
  TIDPRecorder *v9;
  TIDPRecorder *v10;
  NSLock *v11;
  NSLock *delegateLock;
  NSLock *v13;
  NSLock *primaryLexiconLock;
  NSLock *v15;
  NSLock *secondaryLexiconLock;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TIDPRecorder;
  v9 = -[TIDPRecorder init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_typingSession, a3);
    objc_storeStrong((id *)&v10->_typingSessionAligned, a4);
    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    delegateLock = v10->_delegateLock;
    v10->_delegateLock = v11;

    v13 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    primaryLexiconLock = v10->_primaryLexiconLock;
    v10->_primaryLexiconLock = v13;

    v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    secondaryLexiconLock = v10->_secondaryLexiconLock;
    v10->_secondaryLexiconLock = v15;

  }
  return v10;
}

- (NSArray)characterExplodedRecords
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id obj;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[TIDPRecorder records](self, "records");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v10, "word");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v6, "length");
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __40__TIDPRecorder_characterExplodedRecords__block_invoke;
        v18[3] = &unk_1EA100E20;
        v19 = v11;
        v20 = &v25;
        v18[4] = self;
        v13 = v11;
        objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v12, 2, v18);
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(v3, "addObject:", v14);

        v26[3] = 0;
        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v5);

  }
  v15 = (void *)objc_msgSend(v3, "copy");
  _Block_object_dispose(&v25, 8);

  return (NSArray *)v15;
}

- (TITypingSession)typingSession
{
  return self->_typingSession;
}

- (TITypingSessionAligned)typingSessionAligned
{
  return self->_typingSessionAligned;
}

- (NSString)recordingKeyLocaleSubstring
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[TIDPRecorder typingSession](self, "typingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeInputModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "normalizedIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "sortUsingSelector:", sel_compare_);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("+"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (HCHuffmanCoder)characterCoder
{
  HCHuffmanCoder *characterCoder;

  characterCoder = self->_characterCoder;
  if (!characterCoder)
  {
    -[TIDPRecorder _prepareCharacterCoderMatchingSession](self, "_prepareCharacterCoderMatchingSession");
    characterCoder = self->_characterCoder;
  }
  return characterCoder;
}

- (void)_prepareCharacterCoderMatchingSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HCHuffmanCoder *v7;
  HCHuffmanCoder *characterCoder;
  id v9;

  -[TITypingSession sessionParams](self->_typingSession, "sessionParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeInputModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "normalizedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HCHuffmanCoder characterCoderForLocale:](HCHuffmanCoder, "characterCoderForLocale:", v6);
  v7 = (HCHuffmanCoder *)objc_claimAutoreleasedReturnValue();
  characterCoder = self->_characterCoder;
  self->_characterCoder = v7;

}

- (TIDPReportingDelegate)delegate
{
  TIDPReportingDelegate *v3;

  -[NSLock lock](self->_delegateLock, "lock");
  v3 = self->_delegate;
  -[NSLock unlock](self->_delegateLock, "unlock");
  return v3;
}

- (void)setDelegate:(id)a3
{
  TIDPReportingDelegate *v4;
  TIDPReportingDelegate *delegate;
  TIDPReportingDelegate *v6;

  v4 = (TIDPReportingDelegate *)a3;
  -[NSLock lock](self->_delegateLock, "lock");
  delegate = self->_delegate;
  self->_delegate = v4;
  v6 = v4;

  -[NSLock unlock](self->_delegateLock, "unlock");
}

- (NSString)primaryInputModeLocaleIndentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TIDPRecorder typingSession](self, "typingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeInputModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "normalizedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)secondaryInputModeLocaleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TIDPRecorder typingSession](self, "typingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeInputModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "normalizedIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (_LXLexicon)lexiconPrimaryInputMode
{
  void *v3;

  -[NSLock lock](self->_primaryLexiconLock, "lock");
  if (!self->_lexiconPrimaryInputMode)
  {
    -[TIDPRecorder primaryInputModeLocaleIndentifier](self, "primaryInputModeLocaleIndentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_lexiconPrimaryInputMode = (_LXLexicon *)_createStaticLexiconForLocaleIdentifier(v3);

  }
  -[NSLock unlock](self->_primaryLexiconLock, "unlock");
  return self->_lexiconPrimaryInputMode;
}

- (_LXLexicon)lexiconSecondaryInputMode
{
  void *v3;
  void *v4;

  -[TIDPRecorder secondaryInputModeLocaleIdentifier](self, "secondaryInputModeLocaleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[NSLock lock](self->_secondaryLexiconLock, "lock");
  if (!self->_lexiconSecondaryInputMode)
  {
    -[TIDPRecorder secondaryInputModeLocaleIdentifier](self, "secondaryInputModeLocaleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_lexiconSecondaryInputMode = (_LXLexicon *)_createStaticLexiconForLocaleIdentifier(v4);

  }
  -[NSLock unlock](self->_secondaryLexiconLock, "unlock");
  return self->_lexiconSecondaryInputMode;
}

- (BOOL)isWordEntryReallyOOV:(id)a3 caseSensitive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t CharacterAtIndex;
  int v17;
  void *v18;
  unsigned int v19;
  BOOL v20;
  __CFString *v21;
  BOOL v22;
  id v23;
  int TokenIDForUTF8String;
  _BOOL4 v26;
  void *v27;

  v4 = a4;
  v6 = a3;
  if (-[TIDPRecorder lexiconPrimaryInputMode](self, "lexiconPrimaryInputMode"))
  {
    objc_msgSend(v6, "acceptedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9;
    v11 = v10;
    if (v10 && -[__CFString length](v10, "length"))
    {
      if (!-[__CFString length](v11, "length"))
      {

        goto LABEL_29;
      }
      v26 = v4;
      v27 = v7;
      v12 = 0;
      LODWORD(v13) = 0;
      v14 = 0;
      v15 = 0;
      do
      {
        CharacterAtIndex = CFStringGetCharacterAtIndex(v11, v12);
        if ((CharacterAtIndex & 0xFC00) == 0xD800 && v12 + 1 < -[__CFString length](v11, "length"))
        {
          v17 = CFStringGetCharacterAtIndex(v11, v12 + 1);
          if ((v17 & 0xFC00) == 0xDC00)
            v13 = (v17 + ((_DWORD)CharacterAtIndex << 10) - 56613888);
          else
            v13 = v13;
          if ((v17 & 0xFC00) == 0xDC00)
            ++v12;
        }
        else
        {
          v13 = CharacterAtIndex;
        }
        objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "longCharacterIsMember:", v13);

        v14 += v19;
        ++v15;
        ++v12;
      }
      while (v12 < -[__CFString length](v11, "length"));

      v20 = v15 == v14;
      v7 = v27;
      v4 = v26;
      if (v20)
        goto LABEL_29;
    }
    else
    {

    }
    -[TIDPRecorder lexiconPrimaryInputMode](self, "lexiconPrimaryInputMode");
    if (v4)
    {
      v21 = objc_retainAutorelease(v11);
      -[__CFString UTF8String](v21, "UTF8String");
      -[__CFString length](v21, "length");
      if (!LXLexiconGetTokenIDForUTF8String())
      {
LABEL_25:
        if (-[TIDPRecorder lexiconSecondaryInputMode](self, "lexiconSecondaryInputMode"))
        {
          -[TIDPRecorder lexiconSecondaryInputMode](self, "lexiconSecondaryInputMode");
          if (v4)
          {
            v23 = objc_retainAutorelease(v7);
            objc_msgSend(v23, "UTF8String");
            objc_msgSend(v23, "length");
            TokenIDForUTF8String = LXLexiconGetTokenIDForUTF8String();
          }
          else
          {
            TokenIDForUTF8String = LXLexiconGetFirstTokenIDForString();
          }
          v22 = TokenIDForUTF8String == 0;
        }
        else
        {
          v22 = 1;
        }
        goto LABEL_30;
      }
    }
    else if (!LXLexiconGetFirstTokenIDForString())
    {
      goto LABEL_25;
    }
LABEL_29:
    v22 = 0;
LABEL_30:

    goto LABEL_31;
  }
  v22 = 1;
LABEL_31:

  return v22;
}

- (NSArray)records
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSString)recordingKey
{
  return (NSString *)&stru_1EA1081D0;
}

- (HCHuffmanCoder)wordCoder
{
  HCHuffmanCoder *wordCoder;

  wordCoder = self->_wordCoder;
  if (!wordCoder)
  {
    -[TIDPRecorder _prepareWordCoderMatchingSession](self, "_prepareWordCoderMatchingSession");
    wordCoder = self->_wordCoder;
  }
  return wordCoder;
}

- (BOOL)report
{
  return 0;
}

- (void)_prepareWordCoderMatchingSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HCHuffmanCoder *v7;
  HCHuffmanCoder *wordCoder;
  id v9;

  -[TITypingSession sessionParams](self->_typingSession, "sessionParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeInputModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "normalizedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HCHuffmanCoder wordCoderForLocale:](HCHuffmanCoder, "wordCoderForLocale:", v6);
  v7 = (HCHuffmanCoder *)objc_claimAutoreleasedReturnValue();
  wordCoder = self->_wordCoder;
  self->_wordCoder = v7;

}

void __40__TIDPRecorder_characterExplodedRecords__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(_QWORD *)(v4 + 24) + 1;
  *(_QWORD *)(v4 + 24) = v5;
  v6 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "characterCoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIDPWordRecord word:atPosition:coder:](TIDPWordRecord, "word:atPosition:coder:", v6, v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
}

@end
