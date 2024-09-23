@implementation WiFiLexicon

- (void)dealloc
{
  _LXLexicon *lexiconEnglish;
  _LXLexicon *lexiconUserLocale;
  objc_super v5;

  lexiconEnglish = self->_lexiconEnglish;
  if (lexiconEnglish)
  {
    CFRelease(lexiconEnglish);
    self->_lexiconEnglish = 0;
  }
  lexiconUserLocale = self->_lexiconUserLocale;
  if (lexiconUserLocale)
  {
    CFRelease(lexiconUserLocale);
    self->_lexiconUserLocale = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WiFiLexicon;
  -[WiFiLexicon dealloc](&v5, sel_dealloc);
}

- (WiFiLexicon)init
{
  WiFiLexicon *v2;
  void *v3;
  __CFString *v4;
  int v5;
  char v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  NSCharacterSet *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSCharacterSet *tokenizationCharacterSetWithoutUpperCase;
  void *v15;
  NSCharacterSet *tokenizationCharacterSet;
  NSCharacterSet *v17;
  uint64_t v18;
  NSMutableDictionary *stringCache;
  NSSet *v20;
  NSSet *unwantedEnglishWords;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)WiFiLexicon;
  v2 = -[WiFiLexicon init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localeIdentifier");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v5 = -[__CFString hasPrefix:](v4, "hasPrefix:", CFSTR("en"));
    v6 = v5;
    if (v5)
      v7 = v4;
    else
      v7 = CFSTR("en");
    v8 = v7;
    v2->_lexiconEnglish = (_LXLexicon *)_createLexiconWithLocale(v8);
    if ((v6 & 1) == 0)
      v2->_lexiconUserLocale = (_LXLexicon *)_createLexiconWithLocale(v4);
    v9 = (void *)MEMORY[0x1D17AC818]();
    objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
    v10 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCharacterSet formUnionWithCharacterSet:](v10, "formUnionWithCharacterSet:", v11);

    objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCharacterSet formUnionWithCharacterSet:](v10, "formUnionWithCharacterSet:", v12);

    v13 = -[NSCharacterSet copy](v10, "copy");
    tokenizationCharacterSetWithoutUpperCase = v2->_tokenizationCharacterSetWithoutUpperCase;
    v2->_tokenizationCharacterSetWithoutUpperCase = (NSCharacterSet *)v13;

    objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCharacterSet formUnionWithCharacterSet:](v10, "formUnionWithCharacterSet:", v15);

    tokenizationCharacterSet = v2->_tokenizationCharacterSet;
    v2->_tokenizationCharacterSet = v10;
    v17 = v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    stringCache = v2->_stringCache;
    v2->_stringCache = (NSMutableDictionary *)v18;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = (NSSet *)objc_claimAutoreleasedReturnValue();
    -[NSSet addObject:](v20, "addObject:", CFSTR("secure"));
    -[NSSet addObject:](v20, "addObject:", CFSTR("private"));
    unwantedEnglishWords = v2->_unwantedEnglishWords;
    v2->_unwantedEnglishWords = v20;

    objc_autoreleasePoolPop(v9);
  }
  return v2;
}

- (BOOL)stringContainsUnwantedWords:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  -[WiFiLexicon stringCache](self, "stringCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WiFiLexicon stringCache](self, "stringCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

  }
  else
  {
    -[WiFiLexicon unwantedEnglishWords](self, "unwantedEnglishWords");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke;
    v23[3] = &unk_1E881CB58;
    v12 = v4;
    v24 = v12;
    v25 = &v26;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v23);

    if (*((_BYTE *)v27 + 24))
    {
      -[WiFiLexicon stringCache](self, "stringCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v27 + 24));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v14, v12);

      v9 = *((_BYTE *)v27 + 24) != 0;
    }
    else
    {
      -[WiFiLexicon _tokenizeStringForSpecialCharacters:](self, "_tokenizeStringForSpecialCharacters:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        v20[0] = v11;
        v20[1] = 3221225472;
        v20[2] = __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke_2;
        v20[3] = &unk_1E881CBA8;
        v20[4] = self;
        v16 = v12;
        v21 = v16;
        v22 = &v26;
        objc_msgSend(v15, "enumerateObjectsUsingBlock:", v20);
        -[WiFiLexicon stringCache](self, "stringCache");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v27 + 24));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v18, v16);

        v9 = *((_BYTE *)v27 + 24) != 0;
      }
      else
      {
        v9 = 0;
      }

    }
    v7 = v24;
  }

  _Block_object_dispose(&v26, 8);
  return v9;
}

void __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "localizedCaseInsensitiveContainsString:")
    && (!objc_msgSend(v5, "isEqualToString:", CFSTR("secure"))
     || (objc_msgSend(*(id *)(a1 + 32), "localizedCaseInsensitiveContainsString:", CFSTR("unsecured")) & 1) == 0))
  {
    NSLog(CFSTR("%s: found unwanted word (%@) in string (%@)"), "-[WiFiLexicon stringContainsUnwantedWords:]_block_invoke", v5, *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }

}

void __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  v6 = *(id *)(a1 + 40);
  LXLexiconEnumerateEntriesForString();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v4 = v3;
    v5 = *(id *)(a1 + 40);
    LXLexiconEnumerateEntriesForString();

  }
}

void __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke_3(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  id v5;

  v5 = (id)LXEntryCopyString();
  if (objc_msgSend(v5, "isEqualToString:", a1[4]) && (LXEntryGetMetaFlags() & 0x3800000) != 0)
  {
    NSLog(CFSTR("%s: found unwanted word (%@) in string (%@)"), "-[WiFiLexicon stringContainsUnwantedWords:]_block_invoke_3", a1[4], a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }

}

void __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke_4(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  id v5;

  v5 = (id)LXEntryCopyString();
  if (objc_msgSend(v5, "isEqualToString:", a1[4]) && (LXEntryGetMetaFlags() & 0x3800000) != 0)
  {
    NSLog(CFSTR("%s: found unwanted word (%@) in string (%@)"), "-[WiFiLexicon stringContainsUnwantedWords:]_block_invoke_4", a1[4], a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }

}

- (id)_tokenizeStringForSpecialCharacters:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *context;
  unint64_t v18;
  id v19;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    context = (void *)MEMORY[0x1D17AC818]();
    v18 = objc_msgSend(v3, "length");
    v4 = v18 - 2;
    if (v18 >= 2)
    {
      v5 = 0;
      v6 = 0;
      do
      {
        v7 = v5 + 1;
        v8 = objc_msgSend(v3, "characterAtIndex:", v5 + 1);
        -[WiFiLexicon tokenizationCharacterSet](self, "tokenizationCharacterSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "characterIsMember:", v8);

        if (v4 == v5 || v10)
        {
          v11 = v18;
          if (v4 != v5)
            v11 = v5 + 1;
          objc_msgSend(v3, "substringWithRange:", v6, v11 - v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[WiFiLexicon tokenizationCharacterSetWithoutUpperCase](self, "tokenizationCharacterSetWithoutUpperCase");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "lowercaseString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "addObject:", v15);
        }
        else
        {
          v7 = v6;
        }
        ++v5;
        v6 = v7;
      }
      while (v18 - 1 != v5);
    }
    objc_autoreleasePoolPop(context);
  }

  return v19;
}

- (NSCharacterSet)tokenizationCharacterSet
{
  return self->_tokenizationCharacterSet;
}

- (void)setTokenizationCharacterSet:(id)a3
{
  objc_storeStrong((id *)&self->_tokenizationCharacterSet, a3);
}

- (NSCharacterSet)tokenizationCharacterSetWithoutUpperCase
{
  return self->_tokenizationCharacterSetWithoutUpperCase;
}

- (void)setTokenizationCharacterSetWithoutUpperCase:(id)a3
{
  objc_storeStrong((id *)&self->_tokenizationCharacterSetWithoutUpperCase, a3);
}

- (NSMutableDictionary)stringCache
{
  return self->_stringCache;
}

- (void)setStringCache:(id)a3
{
  objc_storeStrong((id *)&self->_stringCache, a3);
}

- (NSSet)unwantedEnglishWords
{
  return self->_unwantedEnglishWords;
}

- (void)setUnwantedEnglishWords:(id)a3
{
  objc_storeStrong((id *)&self->_unwantedEnglishWords, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unwantedEnglishWords, 0);
  objc_storeStrong((id *)&self->_stringCache, 0);
  objc_storeStrong((id *)&self->_tokenizationCharacterSetWithoutUpperCase, 0);
  objc_storeStrong((id *)&self->_tokenizationCharacterSet, 0);
}

@end
