@implementation PSIParse

- (PSIParse)initWithToken:(id)a3
{
  id v4;
  PSIParse *v5;
  uint64_t v6;
  NSArray *tokens;
  uint64_t v8;
  NSString *string;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)PSIParse;
    v5 = -[PSIParse init](&v11, sel_init);
    if (v5)
    {
      v12[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v6 = objc_claimAutoreleasedReturnValue();
      tokens = v5->_tokens;
      v5->_tokens = (NSArray *)v6;

      objc_msgSend(v4, "text");
      v8 = objc_claimAutoreleasedReturnValue();
      string = v5->_string;
      v5->_string = (NSString *)v8;

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (PSIParse)initWithTokens:(id)a3 fromString:(id)a4
{
  id v6;
  id v7;
  PSIParse *v8;
  uint64_t v9;
  NSArray *tokens;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSIParse;
  v8 = -[PSIParse init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    tokens = v8->_tokens;
    v8->_tokens = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_string, a4);
  }

  return v8;
}

- (unint64_t)numberOfTokens
{
  return -[NSArray count](self->_tokens, "count");
}

- (void)enumerateTokensUsingBlock:(id)a3
{
  -[NSArray enumerateObjectsUsingBlock:](self->_tokens, "enumerateObjectsUsingBlock:", a3);
}

- (id)tokenAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_tokens, "objectAtIndexedSubscript:", a3);
}

- (NSArray)datedTokens
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_tokens;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "matchType", (_QWORD)v11) == 3)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)parseByReplacingTokenAtIndex:(unint64_t)a3 withToken:(id)a4
{
  NSArray *tokens;
  id v7;
  void *v8;
  PSIParse *v9;

  tokens = self->_tokens;
  v7 = a4;
  v8 = (void *)-[NSArray mutableCopy](tokens, "mutableCopy");
  objc_msgSend(v8, "replaceObjectAtIndex:withObject:", a3, v7);

  v9 = -[PSIParse initWithTokens:fromString:]([PSIParse alloc], "initWithTokens:fromString:", v8, self->_string);
  -[PSIParse setDateFilter:](v9, "setDateFilter:", self->_dateFilter);

  return v9;
}

- (id)parseByReplacingTokensInRange:(_NSRange)a3 withTokens:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  NSArray *tokens;
  id v8;
  void *v9;
  PSIParse *v10;

  length = a3.length;
  location = a3.location;
  tokens = self->_tokens;
  v8 = a4;
  v9 = (void *)-[NSArray mutableCopy](tokens, "mutableCopy");
  objc_msgSend(v9, "replaceObjectsInRange:withObjectsFromArray:", location, length, v8);

  v10 = -[PSIParse initWithTokens:fromString:]([PSIParse alloc], "initWithTokens:fromString:", v9, self->_string);
  -[PSIParse setDateFilter:](v10, "setDateFilter:", self->_dateFilter);

  return v10;
}

- (id)descriptionWithToken:(id)a3
{
  id v3;
  uint64_t v4;
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

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Identifier: %@"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "resolvedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupMatchingText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "wordEmbeddingMatch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "wordEmbeddingMatch");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "extendedWord");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR(" (%@)"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Text: %@, matching %@%@"), v8, v9, v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Text: %@, matching %@%@"), v8, v9, &stru_1E36789C0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v7;
}

- (BOOL)isImplicitlyTokenizedParse
{
  NSArray *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_tokens;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v4 += objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "belongsToSearchText", (_QWORD)v8);
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
    LOBYTE(v3) = v4 > 1;
  }

  return v3;
}

- (id)description
{
  void *v3;
  NSUInteger v4;
  const __CFString *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PSIDateFilter *dateFilter;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = -[NSArray count](self->_tokens, "count");
  if (self->_dateFilter)
    v5 = CFSTR("with");
  else
    v5 = CFSTR("without");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%d tokens %@ date filter\n"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_tokens;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        -[PSIParse descriptionWithToken:](self, "descriptionWithToken:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("\t%@\n"), v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  dateFilter = self->_dateFilter;
  if (dateFilter)
  {
    -[PSIDateFilter displayString](dateFilter, "displayString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("\tDate: %@\n"), v14);

  }
  return v6;
}

- (PSIDateFilter)dateFilter
{
  return self->_dateFilter;
}

- (void)setDateFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFilter, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
