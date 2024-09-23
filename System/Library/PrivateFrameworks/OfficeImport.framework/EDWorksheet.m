@implementation EDWorksheet

- (void)setup
{
  EDColumnInfoCollection *v3;
  void *v4;
  void *v5;
  EDColumnInfoCollection *v6;
  EDColumnInfoCollection *mColumnInfos;
  EDWarnings *v8;
  EDWarnings *mWorksheetWarnings;
  NSMutableDictionary *v10;
  NSMutableDictionary *mMergedRows;
  NSMutableDictionary *v12;
  NSMutableDictionary *mMergedCols;
  objc_super v14;

  v3 = [EDColumnInfoCollection alloc];
  -[EDSheet workbook](self, "workbook");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDColumnInfoCollection initWithResources:worksheet:](v3, "initWithResources:worksheet:", v5, self);
  mColumnInfos = self->mColumnInfos;
  self->mColumnInfos = v6;

  v8 = objc_alloc_init(EDWarnings);
  mWorksheetWarnings = self->mWorksheetWarnings;
  self->mWorksheetWarnings = v8;

  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mMergedRows = self->mMergedRows;
  self->mMergedRows = v10;

  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mMergedCols = self->mMergedCols;
  self->mMergedCols = v12;

  self->mDefaultColumnWidth = 8.0;
  self->mDefaultRowHeight = 255;
  self->mMaxRowOutlineLevel = 0;
  self->mMaxColumnOutlineLevel = 0;
  self->mFitToPage = 0;
  v14.receiver = self;
  v14.super_class = (Class)EDWorksheet;
  -[EDSheet setup](&v14, sel_setup);
}

- (void)setDefaultColumnWidth:(double)a3
{
  self->mDefaultColumnWidth = a3;
}

- (void)setDefaultRowHeight:(unsigned __int16)a3
{
  self->mDefaultRowHeight = a3;
}

- (void)setFitToPage:(BOOL)a3
{
  self->mFitToPage = a3;
}

- (void)setMaxRowOutlineLevel:(unint64_t)a3
{
  self->mMaxRowOutlineLevel = a3;
}

- (void)setMaxColumnOutlineLevel:(unint64_t)a3
{
  self->mMaxColumnOutlineLevel = a3;
}

- (id)columnInfos
{
  return self->mColumnInfos;
}

- (id)rowBlocks
{
  EDRowBlocks *mRowBlocks;
  EDRowBlocks *v4;
  EDRowBlocks *v5;

  mRowBlocks = self->mRowBlocks;
  if (!mRowBlocks)
  {
    v4 = -[EDRowBlocks initWithWorksheet:]([EDRowBlocks alloc], "initWithWorksheet:", self);
    v5 = self->mRowBlocks;
    self->mRowBlocks = v4;

    mRowBlocks = self->mRowBlocks;
  }
  -[EDRowBlocks lock](mRowBlocks, "lock");
  return self->mRowBlocks;
}

- (id)mergedCells
{
  EDMergedCellCollection *mMergedCells;
  EDMergedCellCollection *v4;
  EDMergedCellCollection *v5;
  void *v6;

  mMergedCells = self->mMergedCells;
  if (!mMergedCells)
  {
    v4 = objc_alloc_init(EDMergedCellCollection);
    v5 = self->mMergedCells;
    self->mMergedCells = v4;

    -[EDSheet processors](self, "processors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "markObject:processor:", self, objc_opt_class());

    mMergedCells = self->mMergedCells;
  }
  return mMergedCells;
}

- (unsigned)defaultRowHeight
{
  return self->mDefaultRowHeight;
}

- (double)defaultColumnWidth
{
  _BOOL4 v3;
  double result;

  v3 = -[EDSheet isDisplayFormulas](self, "isDisplayFormulas");
  result = self->mDefaultColumnWidth;
  if (v3)
    return result + result;
  return result;
}

- (void)teardown
{
  void *v3;
  EDRowBlocks *mRowBlocks;
  EDColumnInfoCollection *mColumnInfos;
  EDCollection *mConditionalFormattings;
  EDMergedCellCollection *mMergedCells;
  EDCollection *mHyperlinks;
  EDCollection *mTables;
  EDCollection *mPivotTables;
  EDPane *mPane;
  EDReference *mImplicitCellArea;
  EDWarnings *mWorksheetWarnings;
  EDReference *mMaxCellReferencedInFormulas;
  NSMutableDictionary *mMergedRows;
  NSMutableDictionary *mMergedCols;
  objc_super v17;

  if (self->mRowBlocks)
  {
    +[OITSUFlushingManager sharedManager](OITSUFlushingManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", self->mRowBlocks);

    mRowBlocks = self->mRowBlocks;
    self->mRowBlocks = 0;

  }
  mColumnInfos = self->mColumnInfos;
  self->mColumnInfos = 0;

  mConditionalFormattings = self->mConditionalFormattings;
  self->mConditionalFormattings = 0;

  mMergedCells = self->mMergedCells;
  self->mMergedCells = 0;

  mHyperlinks = self->mHyperlinks;
  self->mHyperlinks = 0;

  mTables = self->mTables;
  self->mTables = 0;

  mPivotTables = self->mPivotTables;
  self->mPivotTables = 0;

  mPane = self->mPane;
  self->mPane = 0;

  mImplicitCellArea = self->mImplicitCellArea;
  self->mImplicitCellArea = 0;

  mWorksheetWarnings = self->mWorksheetWarnings;
  self->mWorksheetWarnings = 0;

  mMaxCellReferencedInFormulas = self->mMaxCellReferencedInFormulas;
  self->mMaxCellReferencedInFormulas = 0;

  mMergedRows = self->mMergedRows;
  self->mMergedRows = 0;

  mMergedCols = self->mMergedCols;
  self->mMergedCols = 0;

  v17.receiver = self;
  v17.super_class = (Class)EDWorksheet;
  -[EDSheet teardown](&v17, sel_teardown);
}

- (id)maxCellReferencedInFormulas
{
  EDReference *mMaxCellReferencedInFormulas;
  EDReference *v4;
  EDReference *v5;

  mMaxCellReferencedInFormulas = self->mMaxCellReferencedInFormulas;
  if (!mMaxCellReferencedInFormulas)
  {
    v4 = objc_alloc_init(EDReference);
    v5 = self->mMaxCellReferencedInFormulas;
    self->mMaxCellReferencedInFormulas = v4;

    mMaxCellReferencedInFormulas = self->mMaxCellReferencedInFormulas;
  }
  return mMaxCellReferencedInFormulas;
}

- (void)setPane:(id)a3
{
  EDPane *v5;
  EDPane *v6;

  v5 = (EDPane *)a3;
  if (self->mPane != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mPane, a3);
    v5 = v6;
  }

}

- (id)conditionalFormattings
{
  EDCollection *mConditionalFormattings;
  EDCollection *v4;
  EDCollection *v5;

  mConditionalFormattings = self->mConditionalFormattings;
  if (!mConditionalFormattings)
  {
    v4 = objc_alloc_init(EDCollection);
    v5 = self->mConditionalFormattings;
    self->mConditionalFormattings = v4;

    mConditionalFormattings = self->mConditionalFormattings;
  }
  return mConditionalFormattings;
}

- (id)worksheetWarnings
{
  return self->mWorksheetWarnings;
}

- (id)tables
{
  EDCollection *mTables;
  EDCollection *v4;
  EDCollection *v5;
  void *v6;

  mTables = self->mTables;
  if (!mTables)
  {
    v4 = objc_alloc_init(EDCollection);
    v5 = self->mTables;
    self->mTables = v4;

    -[EDSheet processors](self, "processors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "markObject:processor:", self, objc_opt_class());

    mTables = self->mTables;
  }
  return mTables;
}

- (id)pivotTables
{
  EDCollection *mPivotTables;
  EDCollection *v4;
  EDCollection *v5;
  void *v6;

  mPivotTables = self->mPivotTables;
  if (!mPivotTables)
  {
    v4 = objc_alloc_init(EDCollection);
    v5 = self->mPivotTables;
    self->mPivotTables = v4;

    -[EDSheet processors](self, "processors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "markObject:processor:", self, objc_opt_class());

    mPivotTables = self->mPivotTables;
  }
  return mPivotTables;
}

- (id)hyperlinks
{
  EDCollection *mHyperlinks;
  EDCollection *v4;
  EDCollection *v5;

  mHyperlinks = self->mHyperlinks;
  if (!mHyperlinks)
  {
    v4 = objc_alloc_init(EDCollection);
    v5 = self->mHyperlinks;
    self->mHyperlinks = v4;

    mHyperlinks = self->mHyperlinks;
  }
  return mHyperlinks;
}

- (void)updateMaxColumnOutlineLevelIfNeeded:(unint64_t)a3
{
  if (self->mMaxColumnOutlineLevel < a3)
    self->mMaxColumnOutlineLevel = a3;
}

- (BOOL)fitToPage
{
  return self->mFitToPage;
}

- (id)pane
{
  return self->mPane;
}

- (BOOL)hasMergedCells
{
  EDMergedCellCollection *mMergedCells;

  mMergedCells = self->mMergedCells;
  if (mMergedCells)
    LOBYTE(mMergedCells) = -[EDCollection count](mMergedCells, "count") != 0;
  return (char)mMergedCells;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDWorksheet;
  -[EDSheet description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mImplicitCellArea, 0);
  objc_storeStrong((id *)&self->mMergedCols, 0);
  objc_storeStrong((id *)&self->mMergedRows, 0);
  objc_storeStrong((id *)&self->mMaxCellReferencedInFormulas, 0);
  objc_storeStrong((id *)&self->mWorksheetWarnings, 0);
  objc_storeStrong((id *)&self->mPane, 0);
  objc_storeStrong((id *)&self->mMergedCells, 0);
  objc_storeStrong((id *)&self->mPivotTables, 0);
  objc_storeStrong((id *)&self->mTables, 0);
  objc_storeStrong((id *)&self->mHyperlinks, 0);
  objc_storeStrong((id *)&self->mConditionalFormattings, 0);
  objc_storeStrong((id *)&self->mColumnInfos, 0);
  objc_storeStrong((id *)&self->mRowBlocks, 0);
}

- (void)reduceMemoryIfPossible
{
  -[EDRowBlocks save](self->mRowBlocks, "save");
}

- (unint64_t)maxRowOutlineLevel
{
  return self->mMaxRowOutlineLevel;
}

- (void)updateMaxRowOutlineLevelIfNeeded:(unint64_t)a3
{
  if (self->mMaxRowOutlineLevel < a3)
    self->mMaxRowOutlineLevel = a3;
}

- (unint64_t)maxColumnOutlineLevel
{
  return self->mMaxColumnOutlineLevel;
}

- (void)setMergedRowsRef:(id)a3 from:(unsigned int)a4 to:(unsigned int)a5
{
  uint64_t v6;
  NSMutableDictionary *mMergedRows;
  void *v9;
  id i;

  v6 = *(_QWORD *)&a4;
  for (i = a3; v6 <= a5; v6 = (v6 + 1))
  {
    mMergedRows = self->mMergedRows;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](mMergedRows, "setObject:forKey:", i, v9);

  }
}

- (void)setMergedColsRef:(id)a3 from:(unsigned int)a4 to:(unsigned int)a5
{
  uint64_t v6;
  NSMutableDictionary *mMergedCols;
  void *v9;
  id i;

  v6 = *(_QWORD *)&a4;
  for (i = a3; v6 <= a5; v6 = (v6 + 1))
  {
    mMergedCols = self->mMergedCols;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](mMergedCols, "setObject:forKey:", i, v9);

  }
}

- (BOOL)hasMergedRow
{
  return -[NSMutableDictionary count](self->mMergedRows, "count") != 0;
}

- (BOOL)isRowMerged:(unsigned int)a3
{
  NSMutableDictionary *mMergedRows;
  void *v4;
  void *v5;

  mMergedRows = self->mMergedRows;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mMergedRows, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mMergedRows) = v5 != 0;

  return (char)mMergedRows;
}

- (id)mergedRowRef:(unsigned int)a3
{
  NSMutableDictionary *mMergedRows;
  void *v4;
  void *v5;

  mMergedRows = self->mMergedRows;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mMergedRows, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasMergedCol
{
  return -[NSMutableDictionary count](self->mMergedCols, "count") != 0;
}

- (BOOL)isColMerged:(unsigned int)a3
{
  NSMutableDictionary *mMergedCols;
  void *v4;
  void *v5;

  mMergedCols = self->mMergedCols;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mMergedCols, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mMergedCols) = v5 != 0;

  return (char)mMergedCols;
}

- (id)mergedColRef:(unsigned int)a3
{
  NSMutableDictionary *mMergedCols;
  void *v4;
  void *v5;

  mMergedCols = self->mMergedCols;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mMergedCols, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)implicitCellArea
{
  return self->mImplicitCellArea;
}

- (void)setImplicitCellArea:(id)a3
{
  EDReference *v5;
  EDReference *v6;

  v5 = (EDReference *)a3;
  if (self->mImplicitCellArea != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mImplicitCellArea, a3);
    v5 = v6;
  }

}

@end
