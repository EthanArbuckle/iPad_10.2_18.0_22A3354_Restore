@implementation WBSCompletionQuery

+ (int64_t)currentQueryID
{
  return atomic_load(&_currentQueryID);
}

- (WBSCompletionQuery)init
{

  return 0;
}

- (id)_initWithQueryString:(id)a3 queryID:(int64_t)a4 timestamp:()time_point<std:(std:()std:(1000000000>>>)a5 :(unint64_t)a6 ratio<1 :(unint64_t)a7 chrono::duration<long)long :chrono::steady_clock indexInFeedbackArray:triggerEvent:
{
  id v12;
  WBSCompletionQuery *v13;
  uint64_t v14;
  NSString *queryString;
  WBSCompletionQuery *v16;
  objc_super v18;

  v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBSCompletionQuery;
  v13 = -[WBSCompletionQuery init](&v18, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    queryString = v13->_queryString;
    v13->_queryString = (NSString *)v14;

    v13->_queryID = a4;
    v13->_timestamp = a5;
    v13->_indexInFeedbackArray = a6;
    v13->_triggerEvent = a7;
    v16 = v13;
  }

  return v13;
}

- (WBSCompletionQuery)initWithQueryString:(id)a3
{
  return -[WBSCompletionQuery initWithNewQueryString:queryBeforeRewriting:](self, "initWithNewQueryString:queryBeforeRewriting:", a3, 0);
}

- (WBSCompletionQuery)initWithNewQueryString:(id)a3 queryBeforeRewriting:(id)a4
{
  id v6;
  id *v7;
  unint64_t v8;
  WBSCompletionQuery *v9;
  uint64_t v10;
  NSString *queryStringBeforeRewriting;
  WBSCompletionQuery *v12;

  v6 = a3;
  v7 = (id *)a4;
  do
    v8 = __ldaxr(&_currentQueryID);
  while (__stlxr(v8 + 1, &_currentQueryID));
  v9 = -[WBSCompletionQuery initWithQueryString:queryID:](self, "initWithQueryString:queryID:", v6, v8 + 1);
  if (v9)
  {
    objc_msgSend(v7, "queryString");
    v10 = objc_claimAutoreleasedReturnValue();
    queryStringBeforeRewriting = v9->_queryStringBeforeRewriting;
    v9->_queryStringBeforeRewriting = (NSString *)v10;

    if (v7)
    {
      objc_storeStrong((id *)&v9->_cachedBagOfWords, v7[1]);
      objc_storeStrong((id *)&v9->_profileIdentifierToFilterResults, v7[7]);
    }
    v12 = v9;
  }

  return v9;
}

- (WBSCompletionQuery)initWithQueryString:(id)a3 triggerEvent:(unint64_t)a4
{
  unint64_t v4;

  do
    v4 = __ldaxr(&_currentQueryID);
  while (__stlxr(v4 + 1, &_currentQueryID));
  return -[WBSCompletionQuery initWithQueryString:queryID:triggerEvent:](self, "initWithQueryString:queryID:triggerEvent:", a3, v4 + 1, a4);
}

- (WBSCompletionQuery)initWithQueryString:(id)a3 queryID:(int64_t)a4
{
  return -[WBSCompletionQuery initWithQueryString:queryID:triggerEvent:](self, "initWithQueryString:queryID:triggerEvent:", a3, a4, 1);
}

- (WBSCompletionQuery)initWithQueryString:(id)a3 queryID:(int64_t)a4 triggerEvent:(unint64_t)a5
{
  id v8;
  WBSCompletionQuery *v9;

  v8 = a3;
  v9 = -[WBSCompletionQuery _initWithQueryString:queryID:timestamp:indexInFeedbackArray:triggerEvent:](self, "_initWithQueryString:queryID:timestamp:indexInFeedbackArray:triggerEvent:", v8, a4, std::chrono::steady_clock::now().__d_.__rep_, 0x7FFFFFFFFFFFFFFFLL, a5);

  return v9;
}

- (NSString)canonicalQueryString
{
  uint64_t v2;

  v2 = 64;
  if (!self->_queryStringBeforeRewriting)
    v2 = 32;
  return (NSString *)*(id *)((char *)&self->super.isa + v2);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; string = \"%@\">"), v5, self, self->_queryString);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_bagOfWords
{
  NSSet *cachedBagOfWords;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  NSSet *v9;
  NSSet *v10;
  _QWORD v12[4];
  id v13;

  cachedBagOfWords = self->_cachedBagOfWords;
  if (!cachedBagOfWords)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 64;
    if (!self->_queryStringBeforeRewriting)
      v5 = 32;
    v6 = *(id *)((char *)&self->super.isa + v5);
    v7 = objc_msgSend(v6, "length");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __33__WBSCompletionQuery__bagOfWords__block_invoke;
    v12[3] = &unk_1E4B2C1C0;
    v8 = v4;
    v13 = v8;
    objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 3, v12);
    v9 = (NSSet *)objc_msgSend(v8, "copy");
    v10 = self->_cachedBagOfWords;
    self->_cachedBagOfWords = v9;

    cachedBagOfWords = self->_cachedBagOfWords;
  }
  return cachedBagOfWords;
}

void __33__WBSCompletionQuery__bagOfWords__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "safari_stringByTrimmingWhitespace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    if (objc_msgSend(v3, "safari_containsCJKCharacters"))
    {
      for (i = 0; i < objc_msgSend(v3, "length"); ++i)
      {
        objc_msgSend(v3, "substringWithRange:", i, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(void **)(a1 + 32);
        objc_msgSend(v5, "lowercaseString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v7);

      }
    }
    else
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v3, "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }

}

- (BOOL)_bagOfWordsContainsString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[WBSCompletionQuery _bagOfWords](self, "_bagOfWords", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!objc_msgSend(v9, "safari_caseAndDiacriticInsensitiveStandardRangeOfString:additionalOptions:", v4, 8)
          && v10 == objc_msgSend(v9, "length"))
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (id)rangesToHighlightInSearchSuggestion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t, uint64_t);
  void *v18;
  WBSCompletionQuery *v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 64;
  if (!self->_queryStringBeforeRewriting)
    v5 = 32;
  v6 = *(id *)((char *)&self->super.isa + v5);
  objc_msgSend(v6, "safari_stringByTrimmingWhitespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v8, "length"))
  {
    if (objc_msgSend(v4, "safari_caseAndDiacriticInsensitiveStandardRangeOfString:additionalOptions:", v8, 8) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v4, "length");
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __58__WBSCompletionQuery_rangesToHighlightInSearchSuggestion___block_invoke;
      v18 = &unk_1E4B2C1E8;
      v19 = self;
      v12 = v10;
      v20 = v12;
      objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 3, &v15);
      v13 = (void *)objc_msgSend(v12, "copy", v15, v16, v17, v18, v19);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v9, objc_msgSend(v4, "length") - v9);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v21[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

void __58__WBSCompletionQuery_rangesToHighlightInSearchSuggestion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v7 = a2;
  objc_msgSend(v7, "safari_stringByTrimmingWhitespace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    objc_msgSend(v7, "lowercaseString");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v23, "safari_containsCJKCharacters"))
    {
      for (i = 0; i < objc_msgSend(v23, "length"); ++i)
      {
        objc_msgSend(v23, "substringWithRange:", i, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_bagOfWords");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v11);

        if ((v13 & 1) == 0)
        {
          v14 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3 + i, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v15);

        }
      }
    }
    else
    {
      v17 = objc_msgSend(v23, "length");
      if (v17)
      {
        v18 = v23;
        while (1)
        {
          v19 = *(void **)(a1 + 32);
          objc_msgSend(v18, "substringToIndex:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v19) = objc_msgSend(v19, "_bagOfWordsContainsString:", v20);

          if ((v19 & 1) != 0)
            break;
          --v17;
          v18 = v23;
          if (!v17)
            goto LABEL_15;
        }
      }
      v18 = v23;
LABEL_15:
      if (v17 != objc_msgSend(v18, "length"))
      {
        v21 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v17 + a3, a4 - v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v22);

      }
    }
    v16 = v23;
  }
  else
  {
    v16 = v7;
  }

}

- (id)rangesOfMatchedTextInTitle:(id)a3 displayOnlyAddress:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v29;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  void *v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v32 = a4;
  v6 = 64;
  if (!self->_queryStringBeforeRewriting)
    v6 = 32;
  v29 = *(id *)((char *)&self->super.isa + v6);
  objc_msgSend(v29, "safari_stringByTrimmingWhitespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v31, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasPrefix:", v8);

    objc_msgSend(v32, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "substringFromIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasPrefix:", v8);

    if ((v10 | v13) != 1)
    {
      -[WBSCompletionQuery _rangesOfMatchedTextInString:offset:](self, "_rangesOfMatchedTextInString:offset:", v31, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend(v32, "componentsSeparatedByString:", CFSTR("."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v19)
      {
        v20 = 0;
        v21 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v34 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            -[WBSCompletionQuery _rangesOfMatchedTextInString:offset:](self, "_rangesOfMatchedTextInString:offset:", v23, v20);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObjectsFromArray:", v24);
            v25 = objc_msgSend(v23, "length");

            v20 += v25 + 1;
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v19);
      }

      v26 = objc_alloc(MEMORY[0x1E0D89C18]);
      v27 = (void *)objc_msgSend(v16, "copy");
      v17 = (void *)objc_msgSend(v26, "initWithFirst:second:", v30, v27);

      goto LABEL_20;
    }
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0, objc_msgSend(v8, "length"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
LABEL_7:
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 1, objc_msgSend(v8, "length"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C18]), "initWithFirst:second:", v30, v16);
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      v30 = (void *)MEMORY[0x1E0C9AA60];
      if (v13)
        goto LABEL_7;
    }
    v16 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_19;
  }
  v17 = 0;
LABEL_21:

  return v17;
}

- (id)_rangesOfMatchedTextInString:(id)a3 offset:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  unint64_t v14;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "length");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__WBSCompletionQuery__rangesOfMatchedTextInString_offset___block_invoke;
  v12[3] = &unk_1E4B2C210;
  v12[4] = self;
  v9 = v7;
  v13 = v9;
  v14 = a4;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 3, v12);
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

void __58__WBSCompletionQuery__rangesOfMatchedTextInString_offset___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a2;
  objc_msgSend(v5, "safari_stringByTrimmingWhitespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v5, "lowercaseString");
    v21 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "safari_containsCJKCharacters"))
    {
      for (i = 0; i < objc_msgSend(v21, "length"); ++i)
      {
        objc_msgSend(v21, "substringWithRange:", i, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_bagOfWords");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v9);

        if (v11)
        {
          v12 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3 + i + *(_QWORD *)(a1 + 48), 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);

        }
      }
    }
    else
    {
      v15 = objc_msgSend(v21, "length");
      if (v15)
      {
        while (1)
        {
          objc_msgSend(*(id *)(a1 + 32), "_bagOfWords");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "substringToIndex:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "containsObject:", v17);

          if ((v18 & 1) != 0)
            break;
          if (!--v15)
            goto LABEL_14;
        }
        v19 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", *(_QWORD *)(a1 + 48) + a3, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v20);

      }
    }
LABEL_14:
    v14 = v21;
  }
  else
  {
    v14 = v5;
  }

}

+ (id)recentAndSuggestedCompletionStringsByMergingRecentSearches:(id)a3 withSuggestions:(id)a4 literalSearch:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t v34;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "count", v9);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v10);
  v12 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __111__WBSCompletionQuery_recentAndSuggestedCompletionStringsByMergingRecentSearches_withSuggestions_literalSearch___block_invoke;
  v31[3] = &unk_1E4B2C238;
  v13 = v9;
  v32 = v13;
  v34 = v10;
  v14 = v11;
  v33 = v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v31);
  v15 = objc_msgSend(v8, "count");
  v16 = (void *)objc_msgSend(v14, "copy");
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __111__WBSCompletionQuery_recentAndSuggestedCompletionStringsByMergingRecentSearches_withSuggestions_literalSearch___block_invoke_2;
  v25[3] = &unk_1E4B2C288;
  v18 = v13;
  v26 = v18;
  v19 = v16;
  v27 = v19;
  v20 = v17;
  v28 = v20;
  v30 = v15;
  v21 = v14;
  v29 = v21;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v25);
  objc_msgSend(v21, "keysSortedByValueUsingComparator:", &__block_literal_global_23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

void __111__WBSCompletionQuery_recentAndSuggestedCompletionStringsByMergingRecentSearches_withSuggestions_literalSearch___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "safari_isCaseInsensitiveEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    *(float *)&v5 = (float)((float)((float)(unint64_t)(*(_QWORD *)(a1 + 48) - a3) * 0.9)
                          / (float)*(unint64_t *)(a1 + 48))
                  + 1.1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v7);

  }
}

void __111__WBSCompletionQuery_recentAndSuggestedCompletionStringsByMergingRecentSearches_withSuggestions_literalSearch___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  double v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v13 = a2;
  if ((objc_msgSend(v13, "safari_isCaseInsensitiveEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __111__WBSCompletionQuery_recentAndSuggestedCompletionStringsByMergingRecentSearches_withSuggestions_literalSearch___block_invoke_3;
    v14[3] = &unk_1E4B2C260;
    v6 = v13;
    v15 = v6;
    objc_msgSend(v5, "safari_firstObjectPassingTest:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v10 = (float)(v9 + 1.0)
          + (float)((float)(unint64_t)(*(_QWORD *)(a1 + 64) - a3) / (float)*(unint64_t *)(a1 + 64));

      *(float *)&v11 = v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v12, v7);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    }

  }
}

uint64_t __111__WBSCompletionQuery_recentAndSuggestedCompletionStringsByMergingRecentSearches_withSuggestions_literalSearch___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_isCaseInsensitiveEqualToString:", a2);
}

uint64_t __111__WBSCompletionQuery_recentAndSuggestedCompletionStringsByMergingRecentSearches_withSuggestions_literalSearch___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (int64_t)queryID
{
  return self->_queryID;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (BOOL)isForLastSearch
{
  return self->_forLastSearch;
}

- (void)setForLastSearch:(BOOL)a3
{
  self->_forLastSearch = a3;
}

- (NSArray)queryItems
{
  return self->_queryItems;
}

- (void)setQueryItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)querySuggestions
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQuerySuggestions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)profileIdentifierToFilterResults
{
  return self->_profileIdentifierToFilterResults;
}

- (void)setProfileIdentifierToFilterResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)queryStringBeforeRewriting
{
  return self->_queryStringBeforeRewriting;
}

- (NSString)rewrittenQueryStringFromParsec
{
  return self->_rewrittenQueryStringFromParsec;
}

- (void)setRewrittenQueryStringFromParsec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (NSString)parsecFeedbackQueryIdentifier
{
  return self->_parsecFeedbackQueryIdentifier;
}

- (void)setParsecFeedbackQueryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURLRequest)parsecSearchRequest
{
  return self->_parsecSearchRequest;
}

- (void)setParsecSearchRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (time_point<std::chrono::steady_clock,)timestamp
{
  return self->_timestamp;
}

- (NSString)searchSuggestionProviderIdentifier
{
  return self->_searchSuggestionProviderIdentifier;
}

- (void)setSearchSuggestionProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (duration<long)searchSuggestionProviderLatency
{
  return self->_searchSuggestionProviderLatency;
}

- (void)setSearchSuggestionProviderLatency:(duration<long)long
{
  self->_searchSuggestionProviderLatency = a3;
}

- (duration<long)parsecLatency
{
  return self->_parsecLatency;
}

- (void)setParsecLatency:(duration<long)long
{
  self->_parsecLatency = a3;
}

- (unint64_t)indexInFeedbackArray
{
  return self->_indexInFeedbackArray;
}

- (void)setIndexInFeedbackArray:(unint64_t)a3
{
  self->_indexInFeedbackArray = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSuggestionProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_parsecSearchRequest, 0);
  objc_storeStrong((id *)&self->_parsecFeedbackQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_rewrittenQueryStringFromParsec, 0);
  objc_storeStrong((id *)&self->_queryStringBeforeRewriting, 0);
  objc_storeStrong((id *)&self->_profileIdentifierToFilterResults, 0);
  objc_storeStrong((id *)&self->_querySuggestions, 0);
  objc_storeStrong((id *)&self->_queryItems, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_cachedBagOfWords, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  return self;
}

@end
