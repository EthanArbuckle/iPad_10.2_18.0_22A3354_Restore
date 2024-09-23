@implementation PLSearchResult

- (PLSearchResult)initWithGroupResult:(id)a3
{
  id v5;
  PLSearchResult *v6;
  PLSearchResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSearchResult;
  v6 = -[PLSearchResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_groupResult, a3);

  return v7;
}

- (unint64_t)type
{
  return 0;
}

- (unint64_t)categoryMask
{
  unint64_t v3;
  unint64_t v4;

  if (!-[PSIGroupResult groupCount](self->_groupResult, "groupCount"))
    return 0;
  v3 = 0;
  v4 = 0;
  do
    v4 |= PLSearchIndexCategoryMaskForCategory(-[PSIGroupResult categoryAtIndex:](self->_groupResult, "categoryAtIndex:", v3++));
  while (v3 < -[PSIGroupResult groupCount](self->_groupResult, "groupCount"));
  return v4;
}

- (NSArray)searchTokens
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PSIGroupResult groupsSearchTokens](self->_groupResult, "groupsSearchTokens", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)contentStrings
{
  return -[PSIGroupResult contentStrings](self->_groupResult, "contentStrings");
}

- (NSArray)lookupIdentifiers
{
  return -[PSIGroupResult lookupIdentifiers](self->_groupResult, "lookupIdentifiers");
}

- (NSArray)matchRanges
{
  return -[PSIGroupResult groupsMatchRanges](self->_groupResult, "groupsMatchRanges");
}

- (NSString)transientToken
{
  return -[PSIGroupResult transientToken](self->_groupResult, "transientToken");
}

- (NSString)keyAssetUUID
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchResult.m"), 60, CFSTR("%@: %s must be subclassed"), v6, "-[PLSearchResult keyAssetUUID]");

  return 0;
}

- (unint64_t)assetCount
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchResult.m"), 65, CFSTR("%@: %s must be subclassed"), v6, "-[PLSearchResult assetCount]");

  return 0;
}

- (NSString)groupDescription
{
  return (NSString *)-[PSIGroupResult debugDescription](self->_groupResult, "debugDescription");
}

- (NSString)owningContentString
{
  return -[PSIGroupResult owningContentString](self->_groupResult, "owningContentString");
}

- (unint64_t)groupCount
{
  return -[PSIGroupResult groupCount](self->_groupResult, "groupCount");
}

- (int64_t)categoryAtIndex:(int64_t)a3
{
  return -[PSIGroupResult categoryAtIndex:](self->_groupResult, "categoryAtIndex:", a3);
}

- (id)tokensAtIndex:(int64_t)a3
{
  return -[PSIGroupResult tokensAtIndex:](self->_groupResult, "tokensAtIndex:", a3);
}

- (id)matchRangesAtIndex:(int64_t)a3
{
  return -[PSIGroupResult matchRangesAtIndex:](self->_groupResult, "matchRangesAtIndex:", a3);
}

- (BOOL)isContentStringTextSearchableAtIndex:(int64_t)a3
{
  return -[PSIGroupResult isContentStringTextSearchableAtIndex:](self->_groupResult, "isContentStringTextSearchableAtIndex:", a3);
}

- (BOOL)isMatchedByIdentifierAtIndex:(int64_t)a3
{
  return -[PSIGroupResult isMatchedByIdentifierAtIndex:](self->_groupResult, "isMatchedByIdentifierAtIndex:", a3);
}

- (BOOL)isImplicitlyTokenized
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSearchResult groupResult](self, "groupResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasDateFilterFromImplicitToken");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PLSearchResult searchTokens](self, "searchTokens", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v5;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "belongsToSearchText"))
        {
          v12 = (void *)MEMORY[0x1E0CB3B18];
          v13 = objc_msgSend(v11, "rangeInSearchText");
          objc_msgSend(v12, "valueWithRange:", v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v3, "containsObject:", v15) & 1) == 0)
          {
            objc_msgSend(v3, "addObject:", v15);
            if (v8)
            {

              LOBYTE(v7) = 1;
              goto LABEL_15;
            }
            v8 = 1;
          }

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_15:

  return v7;
}

- (BOOL)isSinglePersonOrPetResult
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  v3 = -[PLSearchResult categoryMask](self, "categoryMask");
  if (v3 > 0x7FFFFFFFFFFFFLL)
  {
    if (v3 == 0x8000000000000)
      goto LABEL_7;
    v4 = 0x10000000000000;
  }
  else
  {
    if (v3 == 128)
      goto LABEL_7;
    v4 = 0x4000000000000;
  }
  if (v3 != v4)
  {
    -[PLSearchResult type](self, "type");
    return 0;
  }
LABEL_7:
  if (-[PLSearchResult type](self, "type") != 1)
    return 0;
  -[PLSearchResult lookupIdentifiers](self, "lookupIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") == 1;

  return v6;
}

- (PSIGroupResult)groupResult
{
  return self->_groupResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupResult, 0);
}

@end
