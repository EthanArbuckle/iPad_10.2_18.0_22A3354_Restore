@implementation WDList

- (unint64_t)levelOverrideCount
{
  return -[NSMutableArray count](self->mLevelOverrides, "count");
}

- (id)levelOverrideAt:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mLevelOverrides, "objectAtIndex:", a3);
}

- (id)levelOverrideForLevel:(unsigned __int8)a3
{
  int v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->mLevelOverrides;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "level", (_QWORD)v11) == v3)
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)addLevelOverrideWithLevel:(unsigned __int8)a3
{
  uint64_t v3;
  WDListLevelOverride *v5;
  id WeakRetained;
  WDListLevelOverride *v7;

  v3 = a3;
  v5 = [WDListLevelOverride alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  v7 = -[WDListLevelOverride initWithDocument:level:](v5, "initWithDocument:level:", WeakRetained, v3);

  -[NSMutableArray addObject:](self->mLevelOverrides, "addObject:", v7);
  return v7;
}

- (void)removeLevelOverride:(id)a3
{
  -[NSMutableArray removeObjectIdenticalTo:](self->mLevelOverrides, "removeObjectIdenticalTo:", a3);
}

- (id)levelOverrides
{
  return self->mLevelOverrides;
}

- (BOOL)isAnyListLevelOverridden
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->mLevelOverrides;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isListLevelOverridden", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (WDList)initWithDocument:(id)a3 listId:(int)a4 listDefinitionId:(int)a5
{
  id v8;
  WDList *v9;
  WDList *v10;
  NSMutableArray *v11;
  NSMutableArray *mLevelOverrides;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WDList;
  v9 = -[WDList init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->mDocument, v8);
    v10->mListId = a4;
    v10->mListDefinitionId = a5;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mLevelOverrides = v10->mLevelOverrides;
    v10->mLevelOverrides = v11;

  }
  return v10;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDList;
  -[WDList description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)listId
{
  return self->mListId;
}

- (int)listDefinitionId
{
  return self->mListDefinitionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLevelOverrides, 0);
  objc_destroyWeak((id *)&self->mDocument);
}

@end
