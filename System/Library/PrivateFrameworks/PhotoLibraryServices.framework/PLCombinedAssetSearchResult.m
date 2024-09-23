@implementation PLCombinedAssetSearchResult

- (PLCombinedAssetSearchResult)initWithAssetSearchResults:(id)a3 canOverlap:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  PLCombinedAssetSearchResult *v9;
  uint64_t v10;
  NSMutableArray *assetSearchResults;
  objc_super v13;

  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PLCombinedAssetSearchResult;
  v9 = -[PLSearchResult initWithGroupResult:](&v13, sel_initWithGroupResult_, v8);

  if (v9)
  {
    v10 = objc_msgSend(v6, "mutableCopy");
    assetSearchResults = v9->_assetSearchResults;
    v9->_assetSearchResults = (NSMutableArray *)v10;

    v9->_resultsCanOverlap = a4;
  }

  return v9;
}

- (PLCombinedAssetSearchResult)initWithAssetSearchResult:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PLCombinedAssetSearchResult *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PLCombinedAssetSearchResult initWithAssetSearchResults:canOverlap:](self, "initWithAssetSearchResults:canOverlap:", v6, 1, v9, v10);
  return v7;
}

- (void)addAssetSearchResult:(id)a3 isMainSearchResult:(BOOL)a4
{
  NSMutableArray *assetSearchResults;

  assetSearchResults = self->_assetSearchResults;
  if (a4)
    -[NSMutableArray insertObject:atIndex:](assetSearchResults, "insertObject:atIndex:", a3, 0);
  else
    -[NSMutableArray addObject:](assetSearchResults, "addObject:", a3);
}

- (unint64_t)categoryMask
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_assetSearchResults;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "categoryMask", (_QWORD)v9);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)groupDescription
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Combined asset result:"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_assetSearchResults;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "groupDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  return v3;
}

- (unint64_t)assetCount
{
  unint64_t assetCount;
  NSMutableArray *v4;
  uint64_t v5;
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
  assetCount = self->_assetCount;
  if (!assetCount)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = self->_assetSearchResults;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      assetCount = 0;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          assetCount += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "assetCount", (_QWORD)v10);
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
    else
    {
      assetCount = 0;
    }

    self->_assetCount = assetCount;
  }
  return assetCount;
}

- (id)assetUUIDs
{
  NSArray *assetUUIDs;
  unint64_t assetCount;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  assetUUIDs = self->_assetUUIDs;
  if (!assetUUIDs)
  {
    assetCount = self->_assetCount;
    if (self->_resultsCanOverlap)
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", assetCount);
    else
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", assetCount);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_assetSearchResults;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "assetUUIDs", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    if (self->_resultsCanOverlap)
    {
      objc_msgSend(v5, "allObjects");
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v5;
    }
    v13 = self->_assetUUIDs;
    self->_assetUUIDs = v12;

    self->_assetCount = objc_msgSend(v5, "count");
    assetUUIDs = self->_assetUUIDs;
  }
  return assetUUIDs;
}

- (NSArray)groupResults
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_assetSearchResults, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_assetSearchResults;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "groupResult", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSMutableArray)assetSearchResults
{
  return self->_assetSearchResults;
}

- (void)setAssetSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_assetSearchResults, a3);
}

- (BOOL)resultsCanOverlap
{
  return self->_resultsCanOverlap;
}

- (void)setResultsCanOverlap:(BOOL)a3
{
  self->_resultsCanOverlap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSearchResults, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
}

@end
