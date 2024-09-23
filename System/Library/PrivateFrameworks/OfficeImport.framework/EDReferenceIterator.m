@implementation EDReferenceIterator

+ (id)referenceIteratorWithReferenceArray:(id)a3 workbook:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithReferenceArray:workbook:", v5, v6);

  return v7;
}

- (EDReferenceIterator)initWithReferenceArray:(id)a3 workbook:(id)a4
{
  id v6;
  id v7;
  void *v8;
  EDReferenceIterator *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = -[EDReferenceIterator initWithReferenceArray:reference:workbook:](self, "initWithReferenceArray:reference:workbook:", v6, v8, v7);

  return v9;
}

- (EDReferenceIterator)initWithReferenceArray:(id)a3 reference:(id)a4 workbook:(id)a5
{
  id v9;
  id v10;
  id v11;
  EDReferenceIterator *v12;
  EDReferenceIterator *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EDReferenceIterator;
  v12 = -[EDReferenceIterator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mWorkbook, a5);
    objc_storeStrong((id *)&v13->mReferences, a3);
    v13->mRowBlockIndex = -1;
    v13->mRowInfo = 0;
    *(_QWORD *)&v13->mRowInfoIndex = -1;
    v13->mNextArrayIndex = v13->mReferences != 0;
    v13->mPreviousColumnNumber = 0;
    -[EDReferenceIterator setReference:](v13, "setReference:", v10);
  }

  return v13;
}

- (void)setReference:(id)a3
{
  EDReference **p_mReference;
  EDRowBlocks *mRowBlocks;
  EDRowBlock *mRowBlock;
  void *v8;
  EDRowBlocks *v9;
  EDRowBlocks *v10;
  EDRowBlocks *v11;
  unint64_t v12;
  EDRowBlock *v13;
  EDRowBlock *v14;
  uint64_t v15;
  EDReference *v16;

  p_mReference = &self->mReference;
  v16 = (EDReference *)a3;
  if (*p_mReference != v16)
  {
    objc_storeStrong((id *)&self->mReference, a3);
    -[EDRowBlocks unlock](self->mRowBlocks, "unlock");
    mRowBlocks = self->mRowBlocks;
    self->mRowBlocks = 0;

    mRowBlock = self->mRowBlock;
    self->mRowBlock = 0;

    self->mRowBlockIndex = -1;
    self->mRowInfo = 0;
    *(_QWORD *)&self->mRowInfoIndex = -1;
    if (self->mReference)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[EDWorkbook sheetAtIndex:](self->mWorkbook, "sheetAtIndex:", -[EDReference sheetIndex](self->mReference, "sheetIndex"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "rowBlocks");
          v9 = (EDRowBlocks *)objc_claimAutoreleasedReturnValue();
          v10 = self->mRowBlocks;
          self->mRowBlocks = v9;

        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_9:
          v12 = -[EDRowBlocks expectedIndexOfRowBlockForRowNumber:](self->mRowBlocks, "expectedIndexOfRowBlockForRowNumber:", -[EDReference firstRow](self->mReference, "firstRow"));
          self->mRowBlockIndex = v12;
          -[EDRowBlocks rowBlockAtIndex:](self->mRowBlocks, "rowBlockAtIndex:", v12);
          v13 = (EDRowBlock *)objc_claimAutoreleasedReturnValue();
          v14 = self->mRowBlock;
          self->mRowBlock = v13;

          v15 = -[EDRowBlock indexOfRowInfoWithRowNumber:](self->mRowBlock, "indexOfRowInfoWithRowNumber:", -[EDReference firstRow](self->mReference, "firstRow"));
          self->mRowInfoIndex = v15;
          self->mRowInfo = -[EDRowBlock rowInfoAtIndex:](self->mRowBlock, "rowInfoAtIndex:", v15);
          self->mCellIndex = -[EDRowBlock expectedIndexOfCellWithColumnNumber:rowInfo:](self->mRowBlock, "expectedIndexOfCellWithColumnNumber:rowInfo:", -[EDReference firstColumn](self->mReference, "firstColumn"), self->mRowInfo);
          self->mPreviousColumnNumber = -[EDReference firstColumn](self->mReference, "firstColumn");
          goto LABEL_10;
        }
        -[EDWorksheet rowBlocks](self->mCurrentSheet, "rowBlocks");
        v11 = (EDRowBlocks *)objc_claimAutoreleasedReturnValue();
        v8 = self->mRowBlocks;
        self->mRowBlocks = v11;
      }

      goto LABEL_9;
    }
  }
LABEL_10:

}

- (EDCellHeader)nextCell
{
  EDRowInfo *mRowInfo;
  unsigned int var2;
  unsigned int i;
  EDRowBlock *mRowBlock;
  EDCellHeader *v7;
  unsigned int var1;
  signed int v9;
  unint64_t mNextArrayIndex;
  int v11;
  signed int v12;
  int mCurrentCellIndex;
  unsigned int v14;
  int v15;
  int v16;

  mRowInfo = self->mRowInfo;
  if (!mRowInfo)
    return 0;
  var2 = mRowInfo->var2;
  for (i = self->mCellIndex; ; self->mCellIndex = i)
  {
    if (i >= var2)
      return 0;
    if (!self->mReference)
      return 0;
    mRowBlock = self->mRowBlock;
    self->mCellIndex = i + 1;
    v7 = -[EDRowBlock cellAtIndex:rowInfo:](mRowBlock, "cellAtIndex:rowInfo:");
    if (!v7 && !-[EDReferenceIterator nextRow](self, "nextRow"))
      return 0;
    var1 = self->mRowInfo->var1;
    v9 = columnNumberForEDCell(v7);
    if (v9 > -[EDReference lastColumn](self->mReference, "lastColumn"))
    {
      self->mCurrentCellIndex += -[EDReference lastColumn](self->mReference, "lastColumn") - self->mPreviousColumnNumber;
      if (var1 == -[EDReference lastRow](self->mReference, "lastRow"))
      {
        mNextArrayIndex = self->mNextArrayIndex;
        if (-[EDCollection count](self->mReferences, "count") <= mNextArrayIndex)
          return 0;
      }
      if (!-[EDReferenceIterator nextRow](self, "nextRow"))
        return 0;
    }
    if (v9 >= -[EDReference firstColumn](self->mReference, "firstColumn"))
      break;
    i = self->mCellIndex + 1;
  }
  v11 = -[EDReference firstColumn](self->mReference, "firstColumn");
  if (v11 != -[EDReference lastColumn](self->mReference, "lastColumn"))
  {
    v16 = v9 - self->mPreviousColumnNumber + self->mCurrentCellIndex;
LABEL_22:
    self->mCurrentCellIndex = v16;
    goto LABEL_23;
  }
  v12 = self->mRowInfo->var1;
  if (v12 < -[EDReference lastRow](self->mReference, "lastRow") && !-[EDReferenceIterator nextRow](self, "nextRow"))
    return 0;
  mCurrentCellIndex = self->mCurrentCellIndex;
  v14 = var1 - -[EDReference firstRow](self->mReference, "firstRow");
  v15 = -[EDReference firstRow](self->mReference, "firstRow");
  if (mCurrentCellIndex != v14)
  {
    v16 = var1 - v15;
    goto LABEL_22;
  }
  if (v15 == -[EDReference lastRow](self->mReference, "lastRow")
    && -[EDCollection count](self->mReferences, "count") == 1)
  {
    self->mRowInfo = 0;
LABEL_23:
    self->mPreviousColumnNumber = v9;
    return v7;
  }
  if (self->mCurrentCellIndex <= 0)
    goto LABEL_23;
  return 0;
}

- (BOOL)nextRow
{
  unsigned int v3;
  uint64_t mRowInfoIndex;
  EDRowBlocks *mRowBlocks;
  EDRowBlock *v6;
  EDRowBlock *mRowBlock;
  EDRowInfo *v8;
  int v9;

  while (1)
  {
    v3 = self->mRowInfoIndex + 1;
    self->mRowInfoIndex = v3;
    if (v3 >= -[EDRowBlock rowCount](self->mRowBlock, "rowCount"))
    {
      mRowBlocks = self->mRowBlocks;
      ++self->mRowBlockIndex;
      -[EDRowBlocks rowBlockAtIndex:](mRowBlocks, "rowBlockAtIndex:");
      v6 = (EDRowBlock *)objc_claimAutoreleasedReturnValue();
      mRowBlock = self->mRowBlock;
      self->mRowBlock = v6;

      mRowInfoIndex = 0;
      self->mRowInfoIndex = 0;
    }
    else
    {
      mRowInfoIndex = self->mRowInfoIndex;
    }
    v8 = -[EDRowBlock rowInfoAtIndex:](self->mRowBlock, "rowInfoAtIndex:", mRowInfoIndex);
    self->mRowInfo = v8;
    if (v8)
      break;
    v9 = -[EDReference lastColumn](self->mReference, "lastColumn");
    self->mCurrentCellIndex += v9 - -[EDReference firstColumn](self->mReference, "firstColumn");
    if (!-[EDReferenceIterator nextReference](self, "nextReference"))
      return 0;
  }
  self->mCellIndex = -[EDRowBlock expectedIndexOfCellWithColumnNumber:rowInfo:](self->mRowBlock, "expectedIndexOfCellWithColumnNumber:rowInfo:", -[EDReference firstColumn](self->mReference, "firstColumn"), self->mRowInfo);
  self->mPreviousColumnNumber = -[EDReference firstColumn](self->mReference, "firstColumn");
  return self->mRowInfo != 0;
}

- (void)dealloc
{
  objc_super v3;

  -[EDRowBlocks unlock](self->mRowBlocks, "unlock");
  v3.receiver = self;
  v3.super_class = (Class)EDReferenceIterator;
  -[EDReferenceIterator dealloc](&v3, sel_dealloc);
}

- (unsigned)currentCellIndex
{
  return self->mCurrentCellIndex;
}

- (BOOL)nextReference
{
  EDCollection *mReferences;
  unint64_t mNextArrayIndex;
  EDCollection *v5;
  void *v6;

  mReferences = self->mReferences;
  if (mReferences)
  {
    mNextArrayIndex = self->mNextArrayIndex;
    if (-[EDCollection count](mReferences, "count") <= mNextArrayIndex)
    {
      LOBYTE(mReferences) = 0;
    }
    else
    {
      v5 = self->mReferences;
      ++self->mNextArrayIndex;
      -[EDCollection objectAtIndex:](v5, "objectAtIndex:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDReferenceIterator setReference:](self, "setReference:", v6);

      LOBYTE(mReferences) = 1;
    }
  }
  return (char)mReferences;
}

- (EDReferenceIterator)initWithReference:(id)a3 workbook:(id)a4
{
  return -[EDReferenceIterator initWithReferenceArray:reference:workbook:](self, "initWithReferenceArray:reference:workbook:", 0, a3, a4);
}

+ (id)referenceIteratorWithReference:(id)a3 workbook:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithReference:workbook:", v5, v6);

  return v7;
}

- (void)setCurrentSheet:(id)a3
{
  EDWorksheet *v5;
  EDWorksheet **p_mCurrentSheet;
  EDWorksheet *mCurrentSheet;
  EDWorksheet *v8;

  v5 = (EDWorksheet *)a3;
  mCurrentSheet = self->mCurrentSheet;
  p_mCurrentSheet = &self->mCurrentSheet;
  if (mCurrentSheet != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mCurrentSheet, a3);
    v5 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRowBlock, 0);
  objc_storeStrong((id *)&self->mRowBlocks, 0);
  objc_storeStrong((id *)&self->mReference, 0);
  objc_storeStrong((id *)&self->mReferences, 0);
  objc_storeStrong((id *)&self->mCurrentSheet, 0);
  objc_storeStrong((id *)&self->mWorkbook, 0);
}

@end
