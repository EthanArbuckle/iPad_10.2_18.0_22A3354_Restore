@implementation ICSearchResultRegexMatchFinder

- (ICSearchResultRegexMatchFinder)initWithSearchString:(id)a3
{
  return -[ICSearchResultRegexMatchFinder initWithPrefixMatchingTokens:substringMatchingTokens:searchString:](self, "initWithPrefixMatchingTokens:substringMatchingTokens:searchString:", 0, 0, a3);
}

- (ICSearchResultRegexMatchFinder)initWithPrefixMatchingTokens:(id)a3 substringMatchingTokens:(id)a4 searchString:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICSearchResultRegexMatchFinder *v11;
  void *v12;
  uint64_t v13;
  NSSet *prefixMatchingTokens;
  void *v15;
  uint64_t v16;
  NSSet *substringMatchingTokens;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSRegularExpression *normalRegex;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSRegularExpression *fallbackRegex;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)ICSearchResultRegexMatchFinder;
  v11 = -[ICSearchResultRegexMatchFinder init](&v31, sel_init);
  if (v11)
  {
    v12 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "setByAddingObject:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    prefixMatchingTokens = v11->_prefixMatchingTokens;
    v11->_prefixMatchingTokens = (NSSet *)v13;

    if (!v8)
    v15 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "setByAddingObject:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    substringMatchingTokens = v11->_substringMatchingTokens;
    v11->_substringMatchingTokens = (NSSet *)v16;

    if (!v9)
    objc_storeStrong((id *)&v11->_searchString, a5);
    v18 = (void *)MEMORY[0x1E0CB38E8];
    -[NSSet allObjects](v11->_prefixMatchingTokens, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSet allObjects](v11->_substringMatchingTokens, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ic_regexForPrefixMatchingTokens:substringMatchingTokens:", v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    normalRegex = v11->_normalRegex;
    v11->_normalRegex = (NSRegularExpression *)v21;

    v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NSSet allObjects](v11->_prefixMatchingTokens, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObjectsFromArray:", v24);

    -[NSSet allObjects](v11->_substringMatchingTokens, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObjectsFromArray:", v25);

    v26 = (void *)MEMORY[0x1E0CB38E8];
    objc_msgSend(v23, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ic_regexForSearchStrings:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    fallbackRegex = v11->_fallbackRegex;
    v11->_fallbackRegex = (NSRegularExpression *)v28;

  }
  return v11;
}

- (id)firstMatchInDocumentWithGlobalFallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x1E0CB38E8];
    -[ICSearchResultRegexMatchFinder searchString](self, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_regexForSearchStrings:matchWordBoundaries:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9 || objc_msgSend(v9, "range") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = (void *)MEMORY[0x1E0CB38E8];
      -[ICSearchResultRegexMatchFinder searchString](self, "searchString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ic_regexForSearchStrings:matchWordBoundaries:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
      v15 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v15;
      if (!v15)
        goto LABEL_8;
    }
    if (objc_msgSend(v10, "range") == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_8:
      -[ICSearchResultRegexMatchFinder normalRegex](self, "normalRegex");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[ICSearchResultRegexMatchFinder normalRegex](self, "normalRegex");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
        v18 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v18;
      }
      if (!v10)
        goto LABEL_10;
    }
    if (objc_msgSend(v10, "range") == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_10:
      -[ICSearchResultRegexMatchFinder fallbackRegex](self, "fallbackRegex");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[ICSearchResultRegexMatchFinder fallbackRegex](self, "fallbackRegex");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
        v21 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v21;
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)matchesInDocumentWithPerTokenFallback:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v4, "length"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[ICSearchResultRegexMatchFinder prefixMatchingTokens](self, "prefixMatchingTokens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend((id)objc_opt_class(), "matchesForToken:inDocument:checkPrefixBeforeFallingBack:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10), v4, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObjectsFromArray:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[ICSearchResultRegexMatchFinder substringMatchingTokens](self, "substringMatchingTokens", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend((id)objc_opt_class(), "matchesForToken:inDocument:checkPrefixBeforeFallingBack:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16), v4, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v5, "addObjectsFromArray:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v14);
    }

  }
  v18 = (void *)objc_msgSend(v5, "copy");

  return v18;
}

+ (id)matchesForToken:(id)a3 inDocument:(id)a4 checkPrefixBeforeFallingBack:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  _QWORD v19[2];

  v5 = a5;
  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v9, "length"))
  {
    v13 = 0;
    goto LABEL_9;
  }
  if (!v5)
  {
LABEL_8:
    v14 = (void *)MEMORY[0x1E0CB38E8];
    v18 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ic_regexForSearchStrings:matchWordBoundaries:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v10 = (void *)MEMORY[0x1E0CB38E8];
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ic_regexForSearchStrings:matchWordBoundaries:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "textCheckingResultsAreValid:", v13) & 1) == 0)
  {

    goto LABEL_8;
  }

  if (!v13)
    goto LABEL_8;
LABEL_9:

  return v13;
}

+ (BOOL)textCheckingResultsAreValid:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "range", (_QWORD)v10) != 0x7FFFFFFFFFFFFFFFLL)
          {
            LOBYTE(v6) = 1;
            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchResultRegexMatchFinder searchString](self, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[ICSearchResultRegexMatchFinder prefixMatchingTokens](self, "prefixMatchingTokens");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "prefixMatchingTokens");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToSet:", v9))
      {
        -[ICSearchResultRegexMatchFinder substringMatchingTokens](self, "substringMatchingTokens");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "substringMatchingTokens");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToSet:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[3];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[ICSearchResultRegexMatchFinder searchString](self, "searchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v3;
  -[ICSearchResultRegexMatchFinder prefixMatchingTokens](self, "prefixMatchingTokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v5;
  -[ICSearchResultRegexMatchFinder substringMatchingTokens](self, "substringMatchingTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v11 = ICHashWithObject(*(void **)(*((_QWORD *)&v18 + 1) + 8 * i)) - v11 + 32 * v11;
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v14);
  }

  if (!v6)
  if (!v4)

  return v11;
}

- (NSRegularExpression)normalRegex
{
  return self->_normalRegex;
}

- (void)setNormalRegex:(id)a3
{
  objc_storeStrong((id *)&self->_normalRegex, a3);
}

- (NSSet)prefixMatchingTokens
{
  return self->_prefixMatchingTokens;
}

- (void)setPrefixMatchingTokens:(id)a3
{
  objc_storeStrong((id *)&self->_prefixMatchingTokens, a3);
}

- (NSSet)substringMatchingTokens
{
  return self->_substringMatchingTokens;
}

- (void)setSubstringMatchingTokens:(id)a3
{
  objc_storeStrong((id *)&self->_substringMatchingTokens, a3);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (NSRegularExpression)fallbackRegex
{
  return self->_fallbackRegex;
}

- (void)setFallbackRegex:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackRegex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackRegex, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_substringMatchingTokens, 0);
  objc_storeStrong((id *)&self->_prefixMatchingTokens, 0);
  objc_storeStrong((id *)&self->_normalRegex, 0);
}

@end
