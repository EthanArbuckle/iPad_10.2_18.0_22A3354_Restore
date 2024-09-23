@implementation TSTTableTile

- (TSTTableTile)initWithRows:(id)a3 context:(id)a4
{
  TSTTableTile *v5;
  TSTTableTile *v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *mRowInfos;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  unsigned int v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v28;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)TSTTableTile;
  v5 = -[TSPObject initWithContext:](&v29, sel_initWithContext_, a4);
  v6 = v5;
  if (v5)
  {
    v5->mMaxColumn = 0;
    v5->mMaxRow = 0;
    v5->mNumCells = 0;
    v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
    if (a3)
    {
      v8 = (NSMutableArray *)objc_msgSend(v7, "initWithArray:", a3);
      v6->mRowInfos = v8;
      -[NSMutableArray makeObjectsPerformSelector:withObject:](v8, "makeObjectsPerformSelector:withObject:", sel_setOwner_, v6);
      v6->mNumRows = objc_msgSend(a3, "count");
      v6->mMaxRow = 0;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      mRowInfos = v6->mRowInfos;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mRowInfos, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v31 != v12)
              objc_enumerationMutation(mRowInfos);
            v14 = *(unsigned __int16 *)(*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i) + 536);
            if (v14 > v6->mMaxRow)
              v6->mMaxRow = v14;
          }
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mRowInfos, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v11);
      }
      v6->mMaxColumn = 0;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v15 = v6->mRowInfos;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16, 56);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v31 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
            if (*(_WORD *)(v20 + 538))
            {
              if (!*(_BYTE *)(v20 + 541))
                TSTTableTileRowInfoRecalculateMaxTileColumnIndex(*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
              v21 = *(unsigned __int8 *)(v20 + 540);
              if (v21 != 255 && v21 > v6->mMaxColumn)
                v6->mMaxColumn = v21;
            }
          }
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v17);
      }
      v6->mNumCells = 0;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v22 = *(Class *)((char *)&v6->super.super.isa + v28);
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v31;
        do
        {
          for (k = 0; k != v24; ++k)
          {
            if (*(_QWORD *)v31 != v25)
              objc_enumerationMutation(v22);
            v6->mNumCells += *(_WORD *)(*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k) + 538);
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v24);
      }
    }
    else
    {
      v6->mRowInfos = (NSMutableArray *)objc_msgSend(v7, "initWithCapacity:", 32);
      v6->mNumRows = 0;
    }
  }
  return v6;
}

- (TSTTableTile)initWithContext:(id)a3
{
  return -[TSTTableTile initWithRows:context:](self, "initWithRows:context:", 0, a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableTile;
  -[TSTTableTile dealloc](&v3, sel_dealloc);
}

- (unint64_t)flushableSize
{
  NSMutableArray *mRowInfos;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  mRowInfos = self->mRowInfos;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mRowInfos, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 8;
  v4 = v3;
  v5 = *(_QWORD *)v10;
  v6 = 8;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(mRowInfos);
      v6 += TSTTableTileRowInfoFlushableSize(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mRowInfos, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v6;
}

- (id)packageLocator
{
  return CFSTR("Tables/Tile");
}

- (unsigned)maxColumn
{
  return self->mMaxColumn;
}

- (unsigned)maxRow
{
  return self->mMaxRow;
}

- (unsigned)numCells
{
  return self->mNumCells;
}

- (unsigned)numRows
{
  return self->mNumRows;
}

- (NSArray)rowInfos
{
  return &self->mRowInfos->super;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %hu rows / %hu cells>"), NSStringFromClass(v4), self, self->mNumRows, self->mNumCells);
}

- (void)i_upgradeTileRowInfosWithDataStore:(id)a3
{
  NSMutableArray *mRowInfos;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[TSPObject willModifyForUpgrade](self, "willModifyForUpgrade");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  mRowInfos = self->mRowInfos;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mRowInfos, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(mRowInfos);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "i_upgradeWithDataStore:", a3);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mRowInfos, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

@end
