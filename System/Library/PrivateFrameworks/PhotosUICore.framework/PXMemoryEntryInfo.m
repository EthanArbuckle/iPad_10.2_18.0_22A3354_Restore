@implementation PXMemoryEntryInfo

- (int64_t)compare:(id)a3
{
  NSDate *startDate;
  void *v4;
  int64_t v5;

  startDate = self->_startDate;
  objc_msgSend(a3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSDate compare:](startDate, "compare:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v16.receiver = self;
  v16.super_class = (Class)PXMemoryEntryInfo;
  -[PXMemoryEntryInfo description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ startDate:%@ endDate:%@, memories:\r"), v4, self->_startDate, self->_endDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_memories;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "appendFormat:", CFSTR("\t%@\r"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "appendString:", CFSTR("\r>"));
  return v5;
}

- (PXMemoryEntryInfo)initWithMemories:(id)a3
{
  PXMemoryEntryInfo *v4;
  void *v5;
  PXMemoryEntryInfo *v6;
  _QWORD v8[4];
  PXMemoryEntryInfo *v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__PXMemoryEntryInfo_initWithMemories___block_invoke;
  v8[3] = &unk_1E5138530;
  v4 = self;
  v9 = v4;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXMemoryEntryInfo initWithSortedMemories:](v4, "initWithSortedMemories:", v5);

  return v6;
}

- (PXMemoryEntryInfo)initWithSortedMemories:(id)a3
{
  id v4;
  PXMemoryEntryInfo *v5;
  uint64_t v6;
  NSArray *memories;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  NSDate *v11;
  NSDate *v12;
  uint64_t v13;
  uint64_t v14;
  NSDate *v15;
  NSDate *v16;
  void *v17;
  void *v18;
  NSDate *startDate;
  NSDate *v20;
  NSDate *endDate;
  NSDate *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PXMemoryEntryInfo;
  v5 = -[PXMemoryEntryInfo init](&v29, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    memories = v5->_memories;
    v5->_memories = (NSArray *)v6;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v5->_memories;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    v24 = v4;
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = 0;
      v13 = *(_QWORD *)v26;
      do
      {
        v14 = 0;
        v15 = v11;
        v16 = v12;
        do
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v14), "assetCollection");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "creationDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "earlierDate:", v16);
          v12 = (NSDate *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "laterDate:", v15);
          v11 = (NSDate *)objc_claimAutoreleasedReturnValue();

          ++v14;
          v15 = v11;
          v16 = v12;
        }
        while (v10 != v14);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }

    startDate = v5->_startDate;
    v5->_startDate = v12;
    v20 = v12;

    endDate = v5->_endDate;
    v5->_endDate = v11;
    v22 = v11;

    objc_storeStrong((id *)&v5->_representativeDate, v5->_startDate);
    v4 = v24;
  }

  return v5;
}

- (unint64_t)indexOfMemory:(id)a3
{
  id v4;
  NSArray *memories;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  memories = self->_memories;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__PXMemoryEntryInfo_indexOfMemory___block_invoke;
  v9[3] = &unk_1E5138558;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSArray enumerateObjectsUsingBlock:](memories, "enumerateObjectsUsingBlock:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)entryByAddingMemory:(id)a3
{
  void *v4;
  NSArray *memories;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  PXMemoryEntryInfo *v9;
  _QWORD v11[5];

  +[PXMemoryInfo memoryInfoWithMemory:](PXMemoryInfo, "memoryInfoWithMemory:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memories = self->_memories;
  v6 = -[NSArray count](memories, "count");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__PXMemoryEntryInfo_entryByAddingMemory___block_invoke;
  v11[3] = &unk_1E5138530;
  v11[4] = self;
  v7 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](memories, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v6, 1024, v11);
  v8 = (void *)-[NSArray mutableCopy](self->_memories, "mutableCopy");
  objc_msgSend(v8, "insertObject:atIndex:", v4, v7);
  v9 = -[PXMemoryEntryInfo initWithSortedMemories:]([PXMemoryEntryInfo alloc], "initWithSortedMemories:", v8);

  return v9;
}

- (id)entryByRemovingMemory:(id)a3
{
  PXMemoryEntryInfo *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PXMemoryEntryInfo *v9;

  v4 = self;
  v5 = -[PXMemoryEntryInfo indexOfMemory:](v4, "indexOfMemory:", a3);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, -[NSArray count](v4->_memories, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeIndex:", v6);
    -[NSArray objectsAtIndexes:](v4->_memories, "objectsAtIndexes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXMemoryEntryInfo initWithSortedMemories:]([PXMemoryEntryInfo alloc], "initWithSortedMemories:", v8);

    v4 = v9;
  }
  return v4;
}

- (id)entryByReplacingMemoryInfoAtIndex:(int64_t)a3 withMemoryInfo:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PXMemoryEntryInfo *v12;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v7 = a4;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoryEntryInfo.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index != NSNotFound"));

  }
  if (-[NSArray count](self->_memories, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoryEntryInfo.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < [_memories count]"));

  }
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, -[NSArray count](self->_memories, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeIndex:", a3);
  -[NSArray objectsAtIndexes:](self->_memories, "objectsAtIndexes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = objc_msgSend(v10, "count");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__PXMemoryEntryInfo_entryByReplacingMemoryInfoAtIndex_withMemoryInfo___block_invoke;
  v16[3] = &unk_1E5138530;
  v16[4] = self;
  objc_msgSend(v10, "insertObject:atIndex:", v7, objc_msgSend(v10, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v11, 1024, v16));
  v12 = -[PXMemoryEntryInfo initWithSortedMemories:]([PXMemoryEntryInfo alloc], "initWithSortedMemories:", v10);

  return v12;
}

- (NSDate)representativeDate
{
  return self->_representativeDate;
}

- (NSArray)memories
{
  return self->_memories;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_memories, 0);
  objc_storeStrong((id *)&self->_representativeDate, 0);
}

uint64_t __70__PXMemoryEntryInfo_entryByReplacingMemoryInfoAtIndex_withMemoryInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend((id)objc_opt_class(), "compareMemoryInfo:toMemoryInfo:", v5, v4);

  return v6;
}

uint64_t __41__PXMemoryEntryInfo_entryByAddingMemory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend((id)objc_opt_class(), "compareMemoryInfo:toMemoryInfo:", v5, v4);

  return v6;
}

void __35__PXMemoryEntryInfo_indexOfMemory___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;

  objc_msgSend(a2, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

uint64_t __38__PXMemoryEntryInfo_initWithMemories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend((id)objc_opt_class(), "compareMemoryInfo:toMemoryInfo:", v5, v4);

  return v6;
}

+ (int64_t)compareMemoryInfo:(id)a3 toMemoryInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;

  v5 = a4;
  v6 = a3;
  +[PXMemoriesFeedSettings sharedInstance](PXMemoriesFeedSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rankMemoriesByRelevanceScore");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("PXSortMemoriesByCreationDateOnly"));

    objc_msgSend(v6, "assetCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "assetCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v12, "isUserCreated");
    v15 = objc_msgSend(v13, "isUserCreated");
    if ((v11 & 1) != 0)
    {
LABEL_4:
      objc_msgSend(v13, "creationDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "creationDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v16, "compare:", v17);

LABEL_5:
      if (!v9)
      {
        objc_msgSend(v12, "localIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v18, "compare:", v19);

      }
      goto LABEL_22;
    }
    if (((v14 | v15) & 1) != 0)
    {
      if (v14)
        v20 = v15 ^ 1;
      else
        v20 = v15;
      v21 = (uint64_t)((unint64_t)(v14 & (v15 ^ 1)) << 63) >> 63;
      if (!v14)
        v21 = v15;
      if (v20)
        v9 = v21;
      else
        v9 = 0;
      if (v9)
        goto LABEL_5;
      goto LABEL_4;
    }
    objc_msgSend(v12, "score");
    v23 = v22;
    objc_msgSend(v13, "score");
    if (v23 <= v24)
    {
      if (v23 >= v24)
        goto LABEL_4;
      v9 = 1;
    }
    else
    {
      v9 = -1;
    }
LABEL_22:
    v5 = v13;
    v6 = v12;
    goto LABEL_23;
  }
  v9 = objc_msgSend((id)objc_opt_class(), "compareMemoryInfo:byRelevanceScoreToMemoryInfo:", v6, v5);
LABEL_23:

  return v9;
}

+ (int64_t)compareMemoryInfo:(id)a3 byRelevanceScoreToMemoryInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;

  v5 = a4;
  objc_msgSend(a3, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relevanceScoreAtDate:", v8);
  v10 = v9;
  objc_msgSend(v7, "relevanceScoreAtDate:", v8);
  if (v10 > v11)
    v12 = -1;
  else
    v12 = v10 < v11;

  return v12;
}

@end
