@implementation PSIGroupResultGroupSnapshot

- (PSIGroupResultGroupSnapshot)initWithContentString:(id)a3 normalizedString:(id)a4 token:(id)a5 category:(signed __int16)a6 lookupIdentifier:(id)a7 dateFilter:(id)a8 groupId:(unint64_t)a9 owningGroupId:(unint64_t)a10 groupRanges:(id)a11 datedTokens:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PSIGroupResultGroupSnapshot *v24;
  uint64_t v25;
  NSString *contentString;
  uint64_t v27;
  NSString *normalizedString;
  uint64_t v29;
  NSString *lookupIdentifier;
  NSMutableArray *v31;
  NSMutableArray *tokens;
  NSMutableArray *v33;
  NSMutableArray *matchRanges;
  uint64_t v35;
  PSIDateFilter *dateFilter;
  void *v37;
  objc_super v40;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a7;
  v21 = a8;
  v22 = a11;
  v23 = a12;
  v40.receiver = self;
  v40.super_class = (Class)PSIGroupResultGroupSnapshot;
  v24 = -[PSIGroupResultGroupSnapshot init](&v40, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v17, "copy");
    contentString = v24->_contentString;
    v24->_contentString = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    normalizedString = v24->_normalizedString;
    v24->_normalizedString = (NSString *)v27;

    v29 = objc_msgSend(v20, "copy");
    lookupIdentifier = v24->_lookupIdentifier;
    v24->_lookupIdentifier = (NSString *)v29;

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v19);
      v31 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
    tokens = v24->_tokens;
    v24->_tokens = v31;

    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    matchRanges = v24->_matchRanges;
    v24->_matchRanges = v33;

    v35 = objc_msgSend(v21, "copy");
    dateFilter = v24->_dateFilter;
    v24->_dateFilter = (PSIDateFilter *)v35;

    v24->_category = a6;
    v24->_groupId = a9;
    v24->_owningGroupId = a10;
    if (v22)
      v37 = v22;
    else
      v37 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v24->_groupRanges, v37);
    objc_storeStrong((id *)&v24->_datedTokens, a12);
  }

  return v24;
}

- (PSIGroupResultGroupSnapshot)initWithGroup:(id)a3 token:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  PSIGroupResultGroupSnapshot *v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "tokenRangesCount");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      v11 = (void *)MEMORY[0x1E0CB3B18];
      v12 = objc_msgSend(v6, "tokenRangeAtIndex:", i);
      objc_msgSend(v11, "valueWithRange:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v14);

    }
  }
  objc_msgSend(v6, "contentString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "normalizedString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v6, "category");
  objc_msgSend(v6, "lookupIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v6, "groupId");
  v20 = objc_msgSend(v6, "owningGroupId");
  v21 = -[PSIGroupResultGroupSnapshot initWithContentString:normalizedString:token:category:lookupIdentifier:dateFilter:groupId:owningGroupId:groupRanges:datedTokens:](self, "initWithContentString:normalizedString:token:category:lookupIdentifier:dateFilter:groupId:owningGroupId:groupRanges:datedTokens:", v15, v16, v7, v17, v18, 0, v19, v20, v9, MEMORY[0x1E0C9AA60]);

  return v21;
}

- (PSIGroupResultGroupSnapshot)initWithDateFilter:(id)a3 datedTokens:(id)a4
{
  id v6;
  id v7;
  PSIGroupResultGroupSnapshot *v8;
  void *v9;
  PSIGroupResultGroupSnapshot *v10;

  v6 = a4;
  v7 = a3;
  v8 = [PSIGroupResultGroupSnapshot alloc];
  objc_msgSend(v7, "displayString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PSIGroupResultGroupSnapshot initWithContentString:normalizedString:token:category:lookupIdentifier:dateFilter:groupId:owningGroupId:groupRanges:datedTokens:](v8, "initWithContentString:normalizedString:token:category:lookupIdentifier:dateFilter:groupId:owningGroupId:groupRanges:datedTokens:", v9, 0, 0, 1102, 0, v7, 0, 0, 0, v6);

  return v10;
}

- (PSIGroupResultGroupSnapshot)initWithContentString:(id)a3 lookupIdentifier:(id)a4 category:(signed __int16)a5
{
  uint64_t v5;
  id v8;
  id v9;
  PSIGroupResultGroupSnapshot *v10;
  PSIGroupResultGroupSnapshot *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [PSIGroupResultGroupSnapshot alloc];
  v11 = -[PSIGroupResultGroupSnapshot initWithContentString:normalizedString:token:category:lookupIdentifier:dateFilter:groupId:owningGroupId:groupRanges:datedTokens:](v10, "initWithContentString:normalizedString:token:category:lookupIdentifier:dateFilter:groupId:owningGroupId:groupRanges:datedTokens:", v9, 0, 0, v5, v8, 0, 0, 0, 0, MEMORY[0x1E0C9AA60]);

  return v11;
}

- (void)addToken:(id)a3
{
  -[NSMutableArray addObject:](self->_tokens, "addObject:", a3);
}

- (void)addMatchRange:(id)a3
{
  -[NSMutableArray addObject:](self->_matchRanges, "addObject:", a3);
}

- (BOOL)isDateFilterFromFullSearchText
{
  void *v3;
  char v4;

  if (-[NSArray count](self->_datedTokens, "count") != 1)
    return 0;
  -[NSArray firstObject](self->_datedTokens, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFullTextToken");

  return v4;
}

- (BOOL)isDateFilterPartiallyFromFullSearchText
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_datedTokens;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isFullTextToken", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isDateFilterFromImplicitToken
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
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
  v2 = self->_datedTokens;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "belongsToSearchText", (_QWORD)v8)
          && !objc_msgSend(v6, "isFullTextToken"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (NSArray)tokens
{
  return &self->_tokens->super;
}

- (NSArray)matchRanges
{
  return &self->_matchRanges->super;
}

- (NSString)contentString
{
  return self->_contentString;
}

- (NSString)normalizedString
{
  return self->_normalizedString;
}

- (NSString)lookupIdentifier
{
  return self->_lookupIdentifier;
}

- (NSArray)groupRanges
{
  return self->_groupRanges;
}

- (PSIDateFilter)dateFilter
{
  return self->_dateFilter;
}

- (NSArray)datedTokens
{
  return self->_datedTokens;
}

- (signed)category
{
  return self->_category;
}

- (unint64_t)groupId
{
  return self->_groupId;
}

- (unint64_t)owningGroupId
{
  return self->_owningGroupId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datedTokens, 0);
  objc_storeStrong((id *)&self->_dateFilter, 0);
  objc_storeStrong((id *)&self->_groupRanges, 0);
  objc_storeStrong((id *)&self->_lookupIdentifier, 0);
  objc_storeStrong((id *)&self->_normalizedString, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
  objc_storeStrong((id *)&self->_matchRanges, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
