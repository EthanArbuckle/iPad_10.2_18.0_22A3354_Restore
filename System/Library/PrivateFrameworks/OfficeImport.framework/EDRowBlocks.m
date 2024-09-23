@implementation EDRowBlocks

- (EDRowBlocks)initWithWorksheet:(id)a3
{
  id v5;
  EDRowBlocks *v6;
  EDRowBlocks *v7;
  NSMutableArray *v8;
  NSMutableArray *mRowBlocks;
  EDCollection *v10;
  EDCollection *mFormulas;
  NSRecursiveLock *v12;
  NSRecursiveLock *mSaveLoadLock;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EDRowBlocks;
  v6 = -[EDRowBlocks init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mWorksheet, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mRowBlocks = v7->mRowBlocks;
    v7->mRowBlocks = v8;

    v10 = objc_alloc_init(EDCollection);
    mFormulas = v7->mFormulas;
    v7->mFormulas = v10;

    v12 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x24BDD1788]);
    mSaveLoadLock = v7->mSaveLoadLock;
    v7->mSaveLoadLock = v12;

    *(_QWORD *)&v7->mMaxPopulatedRow = 0;
    v7->mLockCount = 0;
    objc_msgSend(v5, "processors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markObject:processor:", v7, objc_opt_class());

  }
  return v7;
}

- (void)lock
{
  void *v3;
  int mLockCount;

  +[OITSUFlushingManager sharedManager](OITSUFlushingManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  -[NSRecursiveLock lock](self->mSaveLoadLock, "lock");
  mLockCount = self->mLockCount;
  if (!mLockCount)
  {
    -[EDRowBlocks load](self, "load");
    mLockCount = self->mLockCount;
  }
  self->mLockCount = mLockCount + 1;
  -[NSRecursiveLock unlock](self->mSaveLoadLock, "unlock");
}

- (void)load
{
  void *v3;
  void *v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  EDRowBlock *v12;
  id v13;
  NSString *mFileName;
  unsigned __int8 v15;
  unint64_t v16;
  uint64_t v17;

  +[OITSUFlushingManager sharedManager](OITSUFlushingManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  -[NSRecursiveLock lock](self->mSaveLoadLock, "lock");
  if (self->mFileName)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:", self->mFileName);
    v5 = objc_msgSend(v4, "length");
    v6 = v4 != 0;
    if (v4)
    {
      v7 = v5;
      v8 = 0;
      v17 = 0;
      if (v5 >= 8)
      {
        objc_msgSend(v4, "getBytes:length:", &v17, 8);
        v8 = v17;
      }
      v9 = v8 + 8;
      if (v9 >= v7)
        v10 = v7;
      else
        v10 = v9;
      v11 = 8;
      v16 = 8;
      if (v10 >= 9)
      {
        do
        {
          v12 = objc_alloc_init(EDRowBlock);
          -[EDRowBlock unarchiveFromData:offset:](v12, "unarchiveFromData:offset:", v4, &v16);
          -[NSMutableArray addObject:](self->mRowBlocks, "addObject:", v12);

          v11 = v16;
        }
        while (v16 < v10);
      }
      while (v11 < v7)
      {
        v15 = 0;
        objc_msgSend(v4, "getBytes:range:", &v15);
        ++v16;
        v13 = objc_alloc_init(-[EDRowBlocks classForFormulaType:](self, "classForFormulaType:", v15));
        objc_msgSend(v13, "unarchiveFromData:offset:", v4, &v16);
        -[EDCollection addObject:](self->mFormulas, "addObject:", v13);

        v11 = v16;
      }
    }
    TCRemoveFileSecurely(self->mFileName);
    mFileName = self->mFileName;
    self->mFileName = 0;

  }
  else
  {
    v4 = 0;
    v6 = 1;
  }
  -[NSRecursiveLock unlock](self->mSaveLoadLock, "unlock");
  if (!v6)
    +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);

}

- (id)rowBlockForRowNumber:(unsigned int)a3 currentRowBlock:(id)a4 createIfNil:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = v8;
  if (!v8 || objc_msgSend(v8, "minRowNumber") > v6)
    goto LABEL_3;
  if (!-[EDRowBlocks spaceForRowNumber:rowBlock:](self, "spaceForRowNumber:rowBlock:", v6, v9))
  {
    -[EDRowBlocks rowBlockAtIndex:](self, "rowBlockAtIndex:", objc_msgSend(v9, "index") + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[EDRowBlock rowBlock](EDRowBlock, "rowBlock");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setIndex:", -[NSMutableArray count](self->mRowBlocks, "count"));
      -[NSMutableArray addObject:](self->mRowBlocks, "addObject:", v13);
      goto LABEL_18;
    }
    if (-[EDRowBlocks spaceForRowNumber:rowBlock:](self, "spaceForRowNumber:rowBlock:", v6, v11))
    {
      v13 = v11;
      goto LABEL_18;
    }

LABEL_3:
    v10 = -[EDRowBlocks expectedIndexOfRowBlockForRowNumber:](self, "expectedIndexOfRowBlockForRowNumber:", v6);
    -[EDRowBlocks rowBlockAtIndex:](self, "rowBlockAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (-[EDRowBlocks spaceForRowNumber:rowBlock:](self, "spaceForRowNumber:rowBlock:", v6, v11))
      {
        v12 = v11;
LABEL_17:
        v13 = v12;
        v11 = v12;
        goto LABEL_18;
      }
      if (!v5)
      {
        v13 = 0;
        goto LABEL_18;
      }
      if (objc_msgSend(v11, "maxRowNumber") < v6)
        ++v10;
    }
    else if (!v5)
    {
      v13 = 0;
      v11 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v14 = -[NSMutableArray count](self->mRowBlocks, "count");
    if (v10 < v14)
    {
      v15 = v10;
      do
      {
        -[NSMutableArray objectAtIndex:](self->mRowBlocks, "objectAtIndex:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "incrementIndex");

        ++v15;
      }
      while (v14 != v15);
    }
    +[EDRowBlock rowBlock](EDRowBlock, "rowBlock");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setIndex:", v10);
    -[NSMutableArray insertObject:atIndex:](self->mRowBlocks, "insertObject:atIndex:", v17, v10);
    v12 = v17;
    goto LABEL_17;
  }
  v13 = v9;
LABEL_19:

  return v13;
}

- (unint64_t)expectedIndexOfRowBlockForRowNumber:(unsigned int)a3
{
  uint64_t v3;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  void *v14;

  v3 = *(_QWORD *)&a3;
  if (!-[EDRowBlocks rowBlockCount](self, "rowBlockCount"))
    return 0;
  v5 = -[EDRowBlocks rowBlockCount](self, "rowBlockCount") - 1;
  if (v5 < 0)
    return 0;
  v6 = 0;
  while (1)
  {
    v7 = v6 + v5;
    v8 = v6 + v5 < 0 != __OFADD__(v6, v5) ? v7 + 1 : v6 + v5;
    v9 = v8 >> 1;
    -[EDRowBlocks rowBlockAtIndex:](self, "rowBlockAtIndex:", v8 >> 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "minRowNumber");
    v12 = objc_msgSend(v10, "maxRowNumber");
    if (v11 <= v3 && v12 >= v3)
      break;
    if (v11 <= v3)
      v6 = v9 + 1;
    else
      v5 = v9 - 1;

    if (v6 > v5)
      goto LABEL_18;
  }

LABEL_18:
  if (v7 >= 2)
  {
    -[EDRowBlocks rowBlockAtIndex:](self, "rowBlockAtIndex:", v9 - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[EDRowBlocks spaceForRowNumber:rowBlock:](self, "spaceForRowNumber:rowBlock:", v3, v14))
      --v9;

  }
  return v9;
}

- (unint64_t)rowBlockCount
{
  return -[NSMutableArray count](self->mRowBlocks, "count");
}

- (id)rowBlockAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->mRowBlocks, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->mRowBlocks, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)updateMaxPopulatedRow:(unsigned int)a3 column:(unsigned int)a4
{
  if (self->mMaxPopulatedRow < a3)
    self->mMaxPopulatedRow = a3;
  if (self->mMaxPopulatedColumn < a4)
    self->mMaxPopulatedColumn = a4;
}

- (BOOL)spaceForRowNumber:(unsigned int)a3 rowBlock:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a4;
  v6 = v5;
  v7 = v5
    && objc_msgSend(v5, "minRowNumber") <= a3
    && objc_msgSend(v6, "maxRowNumber") >= a3;

  return v7;
}

- (void)unlock
{
  int v3;
  void *v4;

  -[NSRecursiveLock lock](self->mSaveLoadLock, "lock");
  v3 = self->mLockCount - 1;
  self->mLockCount = v3;
  if (!v3)
  {
    +[OITSUFlushingManager sharedManager](OITSUFlushingManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", self);

  }
  -[NSRecursiveLock unlock](self->mSaveLoadLock, "unlock");
}

- (id)formulas
{
  return self->mFormulas;
}

- (unsigned)maxPopulatedRow
{
  return self->mMaxPopulatedRow;
}

- (void)dealloc
{
  NSString *mFileName;
  objc_super v4;

  mFileName = self->mFileName;
  if (mFileName)
    TCRemoveFileSecurely(mFileName);
  v4.receiver = self;
  v4.super_class = (Class)EDRowBlocks;
  -[EDRowBlocks dealloc](&v4, sel_dealloc);
}

- (EDCellHeader)cellWithRowNumber:(unsigned int)a3 columnNumber:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  EDCellHeader *v8;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[EDRowBlocks rowBlockForRowNumber:currentRowBlock:](self, "rowBlockForRowNumber:currentRowBlock:", *(_QWORD *)&a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rowInfoWithRowNumber:", v5);
  if (v7)
    v8 = (EDCellHeader *)objc_msgSend(v6, "cellWithColumnNumber:rowInfo:", v4, v7);
  else
    v8 = 0;

  return v8;
}

- (id)rowBlockForRowNumber:(unsigned int)a3 currentRowBlock:(id)a4
{
  -[EDRowBlocks rowBlockForRowNumber:currentRowBlock:createIfNil:](self, "rowBlockForRowNumber:currentRowBlock:createIfNil:", *(_QWORD *)&a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)removeRowBlockAtIndex:(unint64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->mRowBlocks, "removeObjectAtIndex:", a3);
}

- (unint64_t)indexOfRowBlockForRowNumber:(unsigned int)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v4 = -[EDRowBlocks expectedIndexOfRowBlockForRowNumber:](self, "expectedIndexOfRowBlockForRowNumber:", *(_QWORD *)&a3);
  -[EDRowBlocks rowBlockAtIndex:](self, "rowBlockAtIndex:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v4;
  else
    v6 = -1;

  return v6;
}

- (unsigned)maxPopulatedColumn
{
  return self->mMaxPopulatedColumn;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDRowBlocks;
  -[EDRowBlocks description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSaveLoadLock, 0);
  objc_storeStrong((id *)&self->mFileName, 0);
  objc_storeStrong((id *)&self->mFormulas, 0);
  objc_storeStrong((id *)&self->mRowBlocks, 0);
  objc_storeStrong((id *)&self->mWorksheet, 0);
}

- (id)fileNameForPersistingRowBlocksWithIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[EDSheet workbook](self->mWorksheet, "workbook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("_"), "stringByAppendingFormat:", CFSTR("%@_"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("_");
  }
  -[EDSheet workbook](self->mWorksheet, "workbook");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfSheet:", self->mWorksheet);

  if (v10 != -1)
  {
    -[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR("Sheet%li_"), v10 + 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)v11;
  }
  -[EDSheet name](self->mWorksheet, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDSheet workbook](self->mWorksheet, "workbook");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "temporaryDirectory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("_%lu"), a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingPathComponent:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "stringByAppendingPathExtension:", CFSTR("ed"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)fileNameForPersistingRowBlocks
{
  void *v3;
  void *i;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDRowBlocks fileNameForPersistingRowBlocksWithIndex:](self, "fileNameForPersistingRowBlocksWithIndex:", -[EDRowBlocks(Private) fileNameForPersistingRowBlocks]::index);
  for (i = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fileExistsAtPath:", i);
        i = (void *)v5)
  {
    ++-[EDRowBlocks(Private) fileNameForPersistingRowBlocks]::index;
    -[EDRowBlocks fileNameForPersistingRowBlocksWithIndex:](self, "fileNameForPersistingRowBlocksWithIndex:");
    v5 = objc_claimAutoreleasedReturnValue();

  }
  return i;
}

- (void)save
{
  id v3;
  char v4;
  void *v5;
  NSString *v6;
  NSString *mFileName;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;

  -[NSRecursiveLock lock](self->mSaveLoadLock, "lock");
  if (self->mLockCount || self->mFileName)
  {
    v3 = 0;
    v4 = 1;
  }
  else
  {
    -[EDRowBlocks fileNameForPersistingRowBlocks](self, "fileNameForPersistingRowBlocks");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    mFileName = self->mFileName;
    self->mFileName = v6;

    v3 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    while (-[EDRowBlocks rowBlockCount](self, "rowBlockCount"))
    {
      -[EDRowBlocks rowBlockAtIndex:](self, "rowBlockAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "archiveByAppendingToMutableData:", v3);

      -[NSMutableArray removeObjectAtIndex:](self->mRowBlocks, "removeObjectAtIndex:", 0);
    }
    v11 = objc_msgSend(v3, "length");
    objc_msgSend(v3, "replaceBytesInRange:withBytes:length:", 0, 0, &v11, 8);
    while (-[EDCollection count](self->mFormulas, "count"))
    {
      -[EDCollection objectAtIndex:](self->mFormulas, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v10 = -[EDRowBlocks formulaTypeForFormula:](self, "formulaTypeForFormula:", v9);
      objc_msgSend(v3, "appendBytes:length:", &v10, 1);
      objc_msgSend(v9, "archiveByAppendingToMutableData:", v3);
      -[EDCollection removeObjectAtIndex:](self->mFormulas, "removeObjectAtIndex:", 0);

    }
    v4 = objc_msgSend(v3, "writeToFile:atomically:", self->mFileName, 1);
  }
  -[NSRecursiveLock unlock](self->mSaveLoadLock, "unlock");
  if ((v4 & 1) == 0)
  {
    -[EDSheet workbook](self->mWorksheet, "workbook");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "outOfMemoryDetected");

  }
}

- (unsigned)formulaTypeForFormula:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    LOBYTE(v4) = 2;
  }
  else
  {
    objc_opt_class();
    v4 = objc_opt_isKindOfClass() & 1;
  }

  return v4;
}

- (Class)classForFormulaType:(unsigned __int8)a3
{
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

@end
