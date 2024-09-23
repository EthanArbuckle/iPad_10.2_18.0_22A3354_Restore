@implementation VSTextPreProcessor

- (VSTextPreProcessor)initWithContentsOfPath:(id)a3 languageIdentifier:(id)a4
{
  VSTextPreProcessor *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  VSTextPreProcessorRule *v14;
  VSTextPreProcessorRule *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = -[VSTextPreProcessor init](self, "init");
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithContentsOfFile:", a3);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v17 = a4;
      v10 = 0;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = -[VSTextPreProcessorRule initWithDictionaryRepresentation:]([VSTextPreProcessorRule alloc], "initWithDictionaryRepresentation:", v13);
            if (!v14)
            {

              goto LABEL_17;
            }
            v15 = v14;
            if (!v10)
              v10 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[NSArray addObject:](v10, "addObject:", v15);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          continue;
        break;
      }

      if (v10)
      {
        v6->_rules = v10;
        v6->_languageID = (NSString *)v17;
        return v6;
      }
    }
    else
    {
LABEL_17:

    }
    return 0;
  }
  return v6;
}

- (void)dealloc
{
  __CFStringTokenizer *tokenizer;
  objc_super v4;

  tokenizer = self->_tokenizer;
  if (tokenizer)
    CFRelease(tokenizer);
  v4.receiver = self;
  v4.super_class = (Class)VSTextPreProcessor;
  -[VSTextPreProcessor dealloc](&v4, sel_dealloc);
}

- (id)processedTextFromString:(id)a3
{
  __CFString *v3;
  CFIndex v5;
  NSUInteger v6;
  __CFStringTokenizer *tokenizer;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  CFIndex length;
  const __CFString *languageID;
  const __CFAllocator *v16;
  const __CFLocale *v17;
  CFRange CurrentTokenRange;
  CFRange v19;
  CFRange v20;
  CFRange v21;

  v3 = (__CFString *)a3;
  v5 = objc_msgSend(a3, "length");
  v6 = -[NSArray count](self->_rules, "count");
  tokenizer = self->_tokenizer;
  if (tokenizer)
  {
    v19.location = 0;
    v19.length = v5;
    CFStringTokenizerSetString(tokenizer, v3, v19);
  }
  else
  {
    languageID = (const __CFString *)self->_languageID;
    v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (languageID)
    {
      v17 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], languageID);
      v20.location = 0;
      v20.length = v5;
      self->_tokenizer = CFStringTokenizerCreate(v16, v3, v20, 0, v17);
      if (v17)
        CFRelease(v17);
    }
    else
    {
      v21.location = 0;
      v21.length = v5;
      self->_tokenizer = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3, v21, 0, 0);
    }
  }
  v8 = 0;
  v9 = 0;
  CurrentTokenRange.location = 0;
  CurrentTokenRange.length = 0;
  while (CFStringTokenizerAdvanceToNextToken(self->_tokenizer))
  {
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(self->_tokenizer);
    if (v6)
    {
      v10 = 1;
      do
      {
        v11 = objc_msgSend(-[NSArray objectAtIndex:](self->_rules, "objectAtIndex:", v10 - 1, CurrentTokenRange.location), "matchedString:forTokenInRange:", v3, &CurrentTokenRange);
        v12 = (void *)v11;
        if (v10 >= v6)
          break;
        ++v10;
      }
      while (!v11);
      if (v11)
      {
        if (!v9)
          v9 = (void *)-[__CFString mutableCopy](v3, "mutableCopy");
        objc_msgSend(v9, "replaceCharactersInRange:withString:", CurrentTokenRange.location - v8, CurrentTokenRange.length, v12);
        length = CurrentTokenRange.length;
        v8 = length + v8 - objc_msgSend(v12, "length");
      }
    }
  }
  if (v9)
    return v9;
  return v3;
}

@end
