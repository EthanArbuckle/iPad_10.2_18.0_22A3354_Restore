@implementation EDWorkbook

- (EDWorkbook)initWithFileName:(id)a3 andStringOptimization:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  EDWorkbook *v8;
  EDWorkbook *v9;

  v4 = a4;
  v7 = a3;
  v8 = -[EDWorkbook initWithStringOptimization:](self, "initWithStringOptimization:", v4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->mFileName, a3);

  return v9;
}

- (EDWorkbook)initWithStringOptimization:(BOOL)a3
{
  _BOOL8 v3;
  EDWorkbook *v4;
  EDResources *v5;
  EDResources *mResources;
  NSMutableArray *v7;
  NSMutableArray *mOtherResources;
  EDProcessors *v9;
  EDProcessors *mProcessors;
  EDWarnings *v11;
  EDWarnings *mWarnings;
  NSMutableArray *v13;
  NSMutableArray *mSheets;
  ECMappingContext *v15;
  ECMappingContext *mMappingContext;
  NSMutableArray *v17;
  NSMutableArray *mBulletBlips;
  objc_super v20;

  v3 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EDWorkbook;
  v4 = -[OCDDocument init](&v20, sel_init);
  if (v4)
  {
    v5 = -[EDResources initWithStringOptimization:]([EDResources alloc], "initWithStringOptimization:", v3);
    mResources = v4->mResources;
    v4->mResources = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mOtherResources = v4->mOtherResources;
    v4->mOtherResources = v7;

    v9 = -[EDProcessors initWithWorkbook:]([EDProcessors alloc], "initWithWorkbook:", v4);
    mProcessors = v4->mProcessors;
    v4->mProcessors = v9;

    v11 = objc_alloc_init(EDWarnings);
    mWarnings = v4->mWarnings;
    v4->mWarnings = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mSheets = v4->mSheets;
    v4->mSheets = v13;

    v15 = objc_alloc_init(ECMappingContext);
    mMappingContext = v4->mMappingContext;
    v4->mMappingContext = v15;

    v4->mDateBase = 2;
    v4->mActiveSheetIndex = -1;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mBulletBlips = v4->mBulletBlips;
    v4->mBulletBlips = v17;

    v4->mIsOutOfMemoryConditionDetected = 0;
  }
  return v4;
}

- (void)setTemporaryDirectory:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->mTemporaryDirectory != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mTemporaryDirectory, a3);
    v5 = v6;
  }

}

- (id)processors
{
  return self->mProcessors;
}

- (id)resources
{
  return self->mResources;
}

- (void)setDateBase:(int)a3
{
  self->mDateBase = a3;
}

- (void)setActiveSheetIndex:(unint64_t)a3
{
  self->mActiveSheetIndex = a3;
}

- (void)addSheet:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[NSMutableArray addObject:](self->mSheets, "addObject:", v4);

}

- (int)dateBase
{
  return self->mDateBase;
}

- (unint64_t)sheetCount
{
  return -[NSMutableArray count](self->mSheets, "count");
}

- (id)sheetAtIndex:(unint64_t)a3 loadIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;

  v4 = a4;
  if (-[EDWorkbook sheetCount](self, "sheetCount") <= a3)
  {
    v8 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->mSheets, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4 && (objc_msgSend(v7, "isLoaded") & 1) == 0)
      objc_msgSend(v8, "load");
  }
  return v8;
}

- (id)sheetAtIndex:(unint64_t)a3
{
  return -[EDWorkbook sheetAtIndex:loadIfNeeded:](self, "sheetAtIndex:loadIfNeeded:", a3, 1);
}

- (id)workbookName
{
  return -[NSString lastPathComponent](self->mFileName, "lastPathComponent");
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v3 = -[NSMutableArray count](self->mSheets, "count");
  if (v3)
  {
    v4 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->mSheets, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "teardown");

      ++v4;
    }
    while (v3 != v4);
  }
  -[EDProcessors removeAllObjects](self->mProcessors, "removeAllObjects");
  v6.receiver = self;
  v6.super_class = (Class)EDWorkbook;
  -[EDWorkbook dealloc](&v6, sel_dealloc);
}

- (id)mappingContext
{
  return self->mMappingContext;
}

- (unint64_t)indexOfSheet:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if (v4)
    v5 = -[NSMutableArray indexOfObject:](self->mSheets, "indexOfObject:", v4);
  else
    v5 = -1;

  return v5;
}

- (id)warnings
{
  return self->mWarnings;
}

- (void)addOtherResources:(id)a3
{
  -[NSMutableArray addObject:](self->mOtherResources, "addObject:", a3);
}

- (void)setVisibleRange:(id)a3
{
  EDReference *v5;
  EDReference *v6;

  v5 = (EDReference *)a3;
  if (self->mVisibleRange != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mVisibleRange, a3);
    v5 = v6;
  }

}

- (EDWorkbook)init
{
  return -[EDWorkbook initWithStringOptimization:](self, "initWithStringOptimization:", 0);
}

- (void)setResources:(id)a3
{
  EDResources *v5;
  EDResources *v6;

  v5 = (EDResources *)a3;
  if (self->mResources != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mResources, a3);
    v5 = v6;
  }

}

- (id)fileName
{
  return self->mFileName;
}

- (id)temporaryDirectory
{
  NSString *mTemporaryDirectory;
  NSString *v4;
  NSString *v5;

  mTemporaryDirectory = self->mTemporaryDirectory;
  if (!mTemporaryDirectory)
  {
    NSTemporaryDirectory();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->mTemporaryDirectory;
    self->mTemporaryDirectory = v4;

    mTemporaryDirectory = self->mTemporaryDirectory;
  }
  return mTemporaryDirectory;
}

- (id)dateBaseDate
{
  NSDate *mDateBaseDate;
  int mDateBase;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSDate *v13;
  NSDate *v14;

  mDateBaseDate = self->mDateBaseDate;
  if (!mDateBaseDate)
  {
    mDateBase = self->mDateBase;
    v5 = 1904;
    if (mDateBase == 1)
      v5 = 1900;
    if (mDateBase)
      v6 = v5;
    else
      v6 = 1899;
    if (mDateBase)
      v7 = 1;
    else
      v7 = 30;
    v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v8, "setDay:", v7);
    if (mDateBase)
      v9 = 1;
    else
      v9 = 12;
    objc_msgSend(v8, "setMonth:", v9);
    objc_msgSend(v8, "setYear:", v6);
    v10 = objc_alloc(MEMORY[0x24BDBCE48]);
    v11 = (void *)objc_msgSend(v10, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimeZone:", v12);

    objc_msgSend(v11, "dateFromComponents:", v8);
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v14 = self->mDateBaseDate;
    self->mDateBaseDate = v13;

    mDateBaseDate = self->mDateBaseDate;
  }
  return mDateBaseDate;
}

- (unsigned)legacyDateBase
{
  if (self->mDateBase == 2)
    return 1904;
  else
    return 1900;
}

- (id)visibleRange
{
  return self->mVisibleRange;
}

- (void)removeSheetAtIndex:(unint64_t)a3
{
  id v5;

  -[EDWorkbook sheetAtIndex:loadIfNeeded:](self, "sheetAtIndex:loadIfNeeded:", a3, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "teardown");
    -[NSMutableArray removeObjectAtIndex:](self->mSheets, "removeObjectAtIndex:", a3);
  }

}

- (unint64_t)indexOfSheetWithName:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[NSMutableArray count](self->mSheets, "count");
  if (v5)
  {
    for (i = 0; v5 != i; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->mSheets, "objectAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "string");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 && (objc_msgSend(v10, "isEqual:", v4) & 1) != 0)
        {

          goto LABEL_9;
        }

      }
    }
  }
  i = -1;
LABEL_9:

  return i;
}

- (id)activeSheet
{
  void *v2;

  if (self->mActiveSheetIndex == -1)
  {
    v2 = 0;
  }
  else
  {
    -[EDWorkbook sheetAtIndex:](self, "sheetAtIndex:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setActiveSheet:(id)a3
{
  self->mActiveSheetIndex = -[EDWorkbook indexOfSheet:](self, "indexOfSheet:", a3);
}

- (void)setMappingContext:(id)a3
{
  ECMappingContext *v5;
  ECMappingContext *v6;

  v5 = (ECMappingContext *)a3;
  if (self->mMappingContext != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mMappingContext, a3);
    v5 = v6;
  }

}

- (void)applyProcessors
{
  unint64_t v3;
  unint64_t v4;
  uint64_t i;
  id v6;

  -[EDProcessors applyProcessorsWithSheet:](self->mProcessors, "applyProcessorsWithSheet:", 0);
  -[EDProcessors removeAllObjects](self->mProcessors, "removeAllObjects");
  v3 = -[EDWorkbook sheetCount](self, "sheetCount");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
      v6 = -[EDWorkbook sheetAtIndex:loadIfNeeded:](self, "sheetAtIndex:loadIfNeeded:", i, 1);
  }
}

- (void)outOfMemoryDetected
{
  self->mIsOutOfMemoryConditionDetected = 1;
}

- (BOOL)isOutOfMemoryDetected
{
  return self->mIsOutOfMemoryConditionDetected;
}

- (id)bulletBlips
{
  return self->mBulletBlips;
}

+ (id)impliedColorMap
{
  OADColorMap *v2;

  v2 = objc_alloc_init(OADColorMap);
  -[OADColorMap addDefaultMappings:](v2, "addDefaultMappings:", 1);
  return v2;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDWorkbook;
  -[EDWorkbook description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEscherDrawingGroup, 0);
  objc_storeStrong((id *)&self->mBulletBlips, 0);
  objc_storeStrong((id *)&self->mTemporaryDirectory, 0);
  objc_storeStrong((id *)&self->mFileName, 0);
  objc_storeStrong((id *)&self->mDateBaseDate, 0);
  objc_storeStrong((id *)&self->mVisibleRange, 0);
  objc_storeStrong((id *)&self->mSheets, 0);
  objc_storeStrong((id *)&self->mWarnings, 0);
  objc_storeStrong((id *)&self->mMappingContext, 0);
  objc_storeStrong((id *)&self->mProcessors, 0);
  objc_storeStrong((id *)&self->mOtherResources, 0);
  objc_storeStrong((id *)&self->mResources, 0);
}

- (id)escherDrawingGroup
{
  return self->mEscherDrawingGroup;
}

- (void)setEscherDrawingGroup:(id)a3
{
  objc_storeStrong((id *)&self->mEscherDrawingGroup, a3);
}

- (void)reduceMemoryIfPossible
{
  unint64_t v3;
  unint64_t v4;
  uint64_t i;
  void *v6;

  v3 = -[EDWorkbook sheetCount](self, "sheetCount");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[EDWorkbook sheetAtIndex:loadIfNeeded:](self, "sheetAtIndex:loadIfNeeded:", i, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isLoaded"))
        objc_msgSend(v6, "reduceMemoryIfPossible");

    }
  }
}

- (unint64_t)activeSheetIndex
{
  return self->mActiveSheetIndex;
}

- (void)removeWorksheetAtIndex:(unsigned int)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->mSheets, "removeObjectAtIndex:", a3);
}

@end
