@implementation PSSearchOperation

- (PSSearchOperation)initWithSearchQuery:(id)a3 rootEntries:(id)a4
{
  id v6;
  id v7;
  PSSearchOperation *v8;
  uint64_t v9;
  NSString *query;
  uint64_t v11;
  NSSet *rootEntries;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PSSearchOperation;
  v8 = -[PSSearchOperation init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    query = v8->_query;
    v8->_query = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    rootEntries = v8->_rootEntries;
    v8->_rootEntries = (NSSet *)v11;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[PSSearchOperation setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PSSearchOperation;
  -[PSSearchOperation dealloc](&v3, sel_dealloc);
}

- (void)_didCancel
{
  void *v3;

  -[PSSearchOperation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchOperationDidCancel:", self);

  -[PSSearchOperation setDelegate:](self, "setDelegate:", 0);
}

- (void)main
{
  PSSearchResults *v3;
  PSSearchResults *currentResults;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[PSSearchOperation isCancelled](self, "isCancelled"))
    goto LABEL_7;
  v3 = objc_alloc_init(PSSearchResults);
  currentResults = self->_currentResults;
  self->_currentResults = v3;

  -[PSSearchOperation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchOperationDidBegin:", self);

  if (-[NSString length](self->_query, "length"))
  {
    if (!-[PSSearchOperation _searchEntries:forQuery:](self, "_searchEntries:forQuery:", self->_rootEntries, self->_query))goto LABEL_7;
    -[PSSearchOperation isNewQuery](self, "isNewQuery");
    if ((-[PSSearchOperation isCancelled](self, "isCancelled") & 1) != 0)
      goto LABEL_7;
    -[PSSearchOperation delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchOperation:configureSearchResults:", self, self->_currentResults);

    -[PSSearchOperation isNewQuery](self, "isNewQuery");
  }
  if ((-[PSSearchOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
LABEL_7:
    -[PSSearchOperation _didCancel](self, "_didCancel");
    return;
  }
  -[PSSearchOperation delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PSSearchOperation currentResults](self, "currentResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchOperationDidFinish:withResults:", self, v7);

}

- (BOOL)_searchEntries:(id)a3 forQuery:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  PSSearchResults *currentResults;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((-[PSSearchOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[PSSearchOperation delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[PSSearchOperation delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "searchOperation:filteredEntriesForEntries:", self, v6);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = v6;
    }

    -[PSSearchOperation _filterEntriesMatchingQuery:forQuery:](self, "_filterEntriesMatchingQuery:forQuery:", v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    currentResults = self->_currentResults;
    objc_msgSend(v12, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSearchResults addEntries:](currentResults, "addEntries:", v14);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "childEntries", (_QWORD)v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count")
            && !-[PSSearchOperation _searchEntries:forQuery:](self, "_searchEntries:forQuery:", v20, v7))
          {

            v8 = 0;
            goto LABEL_17;
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v17)
          continue;
        break;
      }
    }
    v8 = 1;
LABEL_17:

  }
  return v8;
}

+ (__CFStringTokenizer)_wordBoundaryTokenizer
{
  if (_wordBoundaryTokenizer_onceToken != -1)
    dispatch_once(&_wordBoundaryTokenizer_onceToken, &__block_literal_global_39);
  return (__CFStringTokenizer *)_wordBoundaryTokenizer_tokenizer;
}

void __43__PSSearchOperation__wordBoundaryTokenizer__block_invoke()
{
  const __CFAllocator *v0;
  const __CFLocale *v1;
  CFRange v2;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v1 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();
  v2.location = 0;
  v2.length = 0;
  _wordBoundaryTokenizer_tokenizer = (uint64_t)CFStringTokenizerCreate(v0, 0, v2, 4uLL, v1);

}

- (BOOL)_systemLanguageHasContinuousScript
{
  if (_systemLanguageHasContinuousScript_onceToken != -1)
    dispatch_once(&_systemLanguageHasContinuousScript_onceToken, &__block_literal_global_4);
  return _systemLanguageHasContinuousScript_systemLanguageIsContinuous;
}

void __55__PSSearchOperation__systemLanguageHasContinuousScript__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  _systemLanguageHasContinuousScript_systemLanguageIsContinuous = 0;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(&unk_1E4A92E20, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(&unk_1E4A92E20);
        if (objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6)))
          _systemLanguageHasContinuousScript_systemLanguageIsContinuous = 1;
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_1E4A92E20, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_filterEntriesMatchingQuery:(id)a3 forQuery:(id)a4
{
  __CFString *v5;
  __CFStringTokenizer *v6;
  void *v7;
  CFRange CurrentTokenRange;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  _QWORD v26[3];
  CFRange v27;

  v26[2] = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v5 = (__CFString *)a4;
  v6 = +[PSSearchOperation _wordBoundaryTokenizer](PSSearchOperation, "_wordBoundaryTokenizer");
  v27.length = -[__CFString length](v5, "length");
  v27.location = 0;
  CFStringTokenizerSetString(v6, v5, v27);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  while (CFStringTokenizerAdvanceToNextToken(v6))
  {
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
    if (CurrentTokenRange.location != -1 && CurrentTokenRange.length)
    {
      -[__CFString substringWithRange:](v5, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", 0));

      if ((v11 & 1) == 0)
      {
        if (-[PSSearchOperation _systemLanguageHasContinuousScript](self, "_systemLanguageHasContinuousScript"))
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("name CONTAINS[cd] %@"), v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY keywords CONTAINS[cd] %@"), v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR(".*\\b%@.*"), v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("name MATCHES[cd] %@"), v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY keywords MATCHES[cd] %@"), v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v17 = (void *)MEMORY[0x1E0CB3528];
        v26[0] = v12;
        v26[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "orPredicateWithSubpredicates:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v19);
      }

    }
  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    objc_msgSend(v24, "filteredSetUsingPredicate:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
  }

  return v22;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PSSearchOperation;
  -[PSSearchOperation description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ query: \"%@\", new query: %d"), v4, self->_query, self->_newQuery);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugDescription
{
  void *v3;
  void *v4;

  -[PSSearchOperation description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", current results: %@"), self->_currentResults);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)query
{
  return self->_query;
}

- (NSSet)rootEntries
{
  return self->_rootEntries;
}

- (PSSearchResults)currentResults
{
  return (PSSearchResults *)objc_getProperty(self, a2, 272, 1);
}

- (BOOL)isNewQuery
{
  return self->_newQuery;
}

- (void)setNewQuery:(BOOL)a3
{
  self->_newQuery = a3;
}

- (PSSearchOperationDelegate)delegate
{
  return (PSSearchOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentResults, 0);
  objc_storeStrong((id *)&self->_rootEntries, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
