@implementation EDCellIterator

- (EDCellIterator)initWithWorksheet:(id)a3
{
  id v4;
  EDCellIterator *v5;
  uint64_t v6;
  EDRowBlocks *mRowBlocks;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDCellIterator;
  v5 = -[EDCellIterator init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "rowBlocks");
    v6 = objc_claimAutoreleasedReturnValue();
    mRowBlocks = v5->mRowBlocks;
    v5->mRowBlocks = (EDRowBlocks *)v6;

    v5->mCurrentRowInfoIndex = 0;
    *(_QWORD *)&v5->mCurrentCellIndex = 0xFFFFFFFF00000000;
    v5->mDesiredColumnNumber = -1;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[EDRowBlocks unlock](self->mRowBlocks, "unlock");
  v3.receiver = self;
  v3.super_class = (Class)EDCellIterator;
  -[EDCellIterator dealloc](&v3, sel_dealloc);
}

- (EDCellHeader)adjacentCellLeft
{
  return -[EDCellIterator adjacentCell:](self, "adjacentCell:", 0xFFFFFFFFLL);
}

- (EDCellHeader)adjacentCellRight
{
  return -[EDCellIterator adjacentCell:](self, "adjacentCell:", 1);
}

- (EDCellHeader)scanToRowNumber:(unsigned int)a3 columnNumber:(unsigned int)a4
{
  unsigned int mDesiredRowNumber;
  unsigned int mDesiredColumnNumber;
  EDRowInfo *mCurrentRowInfo;
  id *p_mCurrentRowBlock;
  id mCurrentRowBlock;
  void *v12;
  unsigned int v13;
  unsigned int i;
  EDRowInfo *v15;
  EDCellHeader *mCurrentCell;
  unsigned int v17;
  unsigned int var2;
  unsigned int j;
  EDCellHeader *v20;
  EDCellHeader *result;
  unsigned int v22;

  mDesiredRowNumber = self->mDesiredRowNumber;
  if (mDesiredRowNumber > a3 && mDesiredRowNumber != -1)
    return 0;
  if (mDesiredRowNumber == a3)
  {
    mDesiredColumnNumber = self->mDesiredColumnNumber;
    if (mDesiredColumnNumber > a4 && mDesiredColumnNumber != -1)
      return 0;
  }
  self->mDesiredRowNumber = a3;
  self->mDesiredColumnNumber = a4;
  mCurrentRowInfo = self->mCurrentRowInfo;
  if (!mCurrentRowInfo || mCurrentRowInfo->var1 < a3)
  {
    p_mCurrentRowBlock = (id *)&self->mCurrentRowBlock;
    -[EDRowBlocks rowBlockForRowNumber:currentRowBlock:](self->mRowBlocks, "rowBlockForRowNumber:currentRowBlock:");
    mCurrentRowBlock = (id)objc_claimAutoreleasedReturnValue();
    v12 = mCurrentRowBlock;
    if (mCurrentRowBlock != *p_mCurrentRowBlock)
    {
      objc_storeStrong((id *)&self->mCurrentRowBlock, mCurrentRowBlock);
      self->mCurrentRowInfoIndex = 0;
      self->mCurrentRowInfo = 0;
      mCurrentRowBlock = self->mCurrentRowBlock;
    }
    v13 = objc_msgSend(mCurrentRowBlock, "rowCount");
    for (i = self->mCurrentRowInfoIndex; i < v13; self->mCurrentRowInfoIndex = i)
    {
      v15 = (EDRowInfo *)objc_msgSend(*p_mCurrentRowBlock, "rowInfoAtIndex:");
      self->mCurrentRowInfo = v15;
      if (v15->var1 >= self->mDesiredRowNumber)
        break;
      i = self->mCurrentRowInfoIndex + 1;
    }
    self->mCurrentCellIndex = 0;
    self->mCurrentCell = 0;

    mCurrentRowInfo = self->mCurrentRowInfo;
    if (!mCurrentRowInfo)
      return 0;
  }
  if (self->mDesiredRowNumber != mCurrentRowInfo->var1)
    return 0;
  mCurrentCell = self->mCurrentCell;
  if (mCurrentCell)
  {
    v17 = self->mDesiredColumnNumber;
    if (v17 <= columnNumberForEDCell(mCurrentCell))
      goto LABEL_29;
    mCurrentRowInfo = self->mCurrentRowInfo;
  }
  var2 = mCurrentRowInfo->var2;
  for (j = self->mCurrentCellIndex; j < var2; self->mCurrentCellIndex = j)
  {
    v20 = -[EDRowBlock cellAtIndex:rowInfo:](self->mCurrentRowBlock, "cellAtIndex:rowInfo:");
    self->mCurrentCell = v20;
    if (columnNumberForEDCell(v20) >= self->mDesiredColumnNumber)
      break;
    j = self->mCurrentCellIndex + 1;
  }
LABEL_29:
  result = self->mCurrentCell;
  if (!result)
    return result;
  v22 = self->mDesiredColumnNumber;
  if (v22 == columnNumberForEDCell(result))
    return self->mCurrentCell;
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCurrentRowBlock, 0);
  objc_storeStrong((id *)&self->mRowBlocks, 0);
}

- (EDCellHeader)adjacentCell:(int)a3
{
  unsigned int mDesiredColumnNumber;
  EDRowInfo *mCurrentRowInfo;
  unsigned int mCurrentCellIndex;
  EDCellHeader *v8;

  if (self->mDesiredRowNumber == -1)
    return 0;
  mDesiredColumnNumber = self->mDesiredColumnNumber;
  if (mDesiredColumnNumber == -1)
    return 0;
  mCurrentRowInfo = self->mCurrentRowInfo;
  if (!mCurrentRowInfo)
    return 0;
  if (mDesiredColumnNumber)
  {
    mCurrentCellIndex = self->mCurrentCellIndex;
    if (a3 < 0 && !mCurrentCellIndex)
      return 0;
  }
  else
  {
    if (a3 < 0)
      return 0;
    mCurrentCellIndex = self->mCurrentCellIndex;
  }
  if (mCurrentCellIndex + a3 >= mCurrentRowInfo->var2)
    return 0;
  v8 = -[EDRowBlock cellAtIndex:rowInfo:](self->mCurrentRowBlock, "cellAtIndex:rowInfo:");
  if (columnNumberForEDCell(v8) == self->mDesiredColumnNumber + a3)
    return v8;
  else
    return 0;
}

@end
