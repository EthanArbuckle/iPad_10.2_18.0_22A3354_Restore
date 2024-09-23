@implementation TSTCellIterator

- (TSTCellIterator)initWithTableModel:(id)a3 region:(id)a4 flags:(unint64_t)a5
{
  unsigned int v5;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  TSTCellIterator *v16;
  TSTCellIterator *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  unint64_t v22;
  TSTCellRegion *v24;
  uint64_t v25;
  objc_super v27;

  v5 = a5;
  v9 = +[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration");
  if ((v5 & 8) == 0)
  {
    v10 = objc_msgSend(a4, "boundingCellRange");
    if (objc_msgSend(v9, "maxNumberOfRows") <= (unsigned __int16)(v10 + HIWORD(v10) - 1))
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTCellIterator initWithTableModel:region:flags:]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellIterator.mm"), 33, CFSTR("Tried to create iterator with range larger than is possible."));
    }
    v13 = objc_msgSend(a4, "boundingCellRange");
    if (objc_msgSend(v9, "maxNumberOfColumns") <= (BYTE4(v13) + BYTE2(v13) - 1))
    {
      v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTCellIterator initWithTableModel:region:flags:]");
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellIterator.mm"), 34, CFSTR("Tried to create iterator with range larger than is possible."));
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)TSTCellIterator;
  v16 = -[TSTCellIterator init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->mDontCheckSize = (v5 & 8) >> 3;
    if ((v5 & 8) != 0
      || (v18 = objc_msgSend(a4, "boundingCellRange"),
          objc_msgSend(v9, "maxNumberOfRows") > (unsigned __int16)(v18 + HIWORD(v18) - 1))
      && (v19 = objc_msgSend(a4, "boundingCellRange"),
          objc_msgSend(v9, "maxNumberOfColumns") > (BYTE4(v19) + BYTE2(v19) - 1)))
    {
      v20 = (v5 >> 2) & 1;
      v17->mSkipStyleOnlyCells = v5 & 1;
      v17->mSkipCommentStorageOnlyCells = BYTE1(v5) & 1;
      v17->mDontExpandCellRefs = (v5 & 2) != 0;
      v17->mRowWalkDirection = v20;
      if ((v5 & 0x10) != 0)
      {
        v22 = TSTTableRangeOfTableWithMerges((uint64_t)a3);
        v21 = 0;
        if ((_WORD)v22 != 0xFFFF && (v22 & 0xFF0000) != 0xFF0000)
          v21 = (v22 & 0xFFFF00000000) != 0 && HIWORD(v22) != 0;
      }
      else
      {
        v21 = 0;
      }
      v17->mDontReturnMergeRegions = v21;
      v17->mReturnHiddenCells = (v5 & 0x20) != 0;
      v17->mDontInflateFormulas = (v5 & 0x40) != 0;
      v17->mReturnEmptyCells = (v5 & 0x80) != 0;
      v17->mTableModel = (TSTTableModel *)a3;
      v17->mTableDataStore = (TSTTableDataStore *)*((id *)a3 + 6);
      v24 = (TSTCellRegion *)objc_msgSend(a4, "copy");
      v17->mModelRegion = v24;
      if (v20)
        v25 = -[TSTCellRegion rightToLeftIterator](v24, "rightToLeftIterator");
      else
        v25 = -[TSTCellRegion iterator](v24, "iterator");
      v17->mModelRegionIterator = (TSTCellRegionIterating *)v25;
      v17->mPreviousCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)0xFFFFFF;
      v17->mCurRow = 0;
      v17->mCurTile = 0;
      v17->mCurTileRange = (_NSRange)NSRangeEmpty;
      v17->mCurRowID = -1;
      v17->mCell = objc_alloc_init(TSTCell);
      objc_msgSend(a4, "boundingCellRange");
    }
    else
    {
      NSLog((NSString *)CFSTR("The crash you are probably about to encounter is because you provided bad arguments to the cell iterator."));
      return 0;
    }
  }
  return v17;
}

- (TSTCellIterator)initWithTableModel:(id)a3 region:(id)a4
{
  return -[TSTCellIterator initWithTableModel:region:flags:](self, "initWithTableModel:region:flags:", a3, a4, 0);
}

- (TSTCellIterator)initWithTableModel:(id)a3 range:(id)a4
{
  return -[TSTCellIterator initWithTableModel:region:flags:](self, "initWithTableModel:region:flags:", a3, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a4), 0);
}

- (TSTCellIterator)initWithTableModel:(id)a3 range:(id)a4 flags:(unint64_t)a5
{
  return -[TSTCellIterator initWithTableModel:region:flags:](self, "initWithTableModel:region:flags:", a3, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a4), a5);
}

- (TSTCellIterator)initWithTableModel:(id)a3
{
  return -[TSTCellIterator initWithTableModel:range:](self, "initWithTableModel:range:", a3, objc_msgSend(a3, "range"));
}

- (TSTCellIterator)initWithTableModel:(id)a3 flags:(unint64_t)a4
{
  return -[TSTCellIterator initWithTableModel:region:flags:](self, "initWithTableModel:region:flags:", a3, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", objc_msgSend(a3, "range")), a4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTCellIterator;
  -[TSTCellIterator dealloc](&v3, sel_dealloc);
}

- (void)p_resetIterData:(id *)a3
{
  a3->var2 = 0;
  a3->var3 = 0;
  a3->var4 = ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  *(_QWORD *)&a3->var0.var0 = 0xFFFFFF00FFFFFFLL;
  *(_WORD *)&a3->var5 = 0;
  a3->var7 = 0;
}

- (BOOL)p_getData:(id *)a3 forCellID:(id)a4
{
  uint64_t v7;
  NSUInteger var0;
  NSUInteger location;
  NSUInteger v10;
  BOOL v11;
  TSTTableTile *TileForRow;
  void *v13;
  uint64_t v14;
  int v15;
  $CA3468F20078D5D2DB35E78E73CA60DA v16;
  TSTTableTile *mCurTile;
  NSUInteger v18;
  unsigned int v19;
  NSUInteger v20;
  TSTTableTileRowInfo *v22;
  int v23;
  int v24;
  UInt8 *v25;
  int v26;
  BOOL v27;
  BOOL v28;
  _BOOL4 v29;
  TSTCell *mCell;
  unint64_t v31;
  unsigned __int16 v34;

  v7 = *(_QWORD *)&a4.var0 >> 16;
  v34 = 0;
  var0 = a4.var0;
  location = self->mCurTileRange.location;
  v11 = a4.var0 >= location;
  v10 = a4.var0 - location;
  v11 = !v11 || v10 >= self->mCurTileRange.length;
  if (v11)
  {
    self->mCurTile = 0;
    self->mCurTileRange = (_NSRange)NSRangeEmpty;
    TileForRow = (TSTTableTile *)TSTDataStoreGetTileForRow(self->mTableDataStore, a4.var0, &v34);
    self->mCurTile = TileForRow;
    if (TileForRow
      || (v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
          v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTCellIterator p_getData:forCellID:]"),
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellIterator.mm"), 149, CFSTR("Failed to get a tile while iterating!")), (TileForRow = self->mCurTile) != 0))
    {
      v15 = v34;
      if (-[TSTTableTile maxRow](TileForRow, "maxRow") + v15 < a4.var0)
        self->mCurTile = (TSTTableTile *)TSTDataStoreGetTileAtOrAfterRow(self->mTableDataStore, a4.var0, &v34);
    }
    if (!self->mReturnEmptyCells && self->mDontReturnMergeRegions)
    {
      if (!self->mCurTile
        || (v16 = -[TSTCellRegion boundingCellRange](self->mModelRegion, "boundingCellRange"),
            v34 > (unsigned __int16)(v16.var0.var0 + v16.var1.var1 - 1)))
      {
        -[TSTCellRegionIterating terminate](self->mModelRegionIterator, "terminate");
      }
    }
    mCurTile = self->mCurTile;
    if (mCurTile)
    {
      v18 = v34;
      v19 = -[TSTTableTile maxRow](mCurTile, "maxRow");
      self->mCurTileRange.location = v18;
      self->mCurTileRange.length = v19 + 1;
    }
  }
  if (self->mCurRowID != a4.var0)
  {
    self->mCurRow = 0;
    self->mCurRowID = -1;
    v20 = self->mCurTileRange.location;
    if (var0 >= v20 && var0 - v20 < self->mCurTileRange.length)
    {
      v22 = TSTTableTileRowInfoForTileRowIndex(self->mCurTile, (unsigned __int16)(a4.var0 - v20), 0);
      self->mCurRow = v22;
      if (v22)
        self->mCurRowID = a4.var0;
    }
  }
  a3->var8 = TSTHidingActionForRow((uint64_t)self->mTableModel, a4.var0) != 0;
  v23 = TSTHidingActionForColumn((uint64_t)self->mTableModel, v7);
  a3->var9 = v23 != 0;
  v24 = a3->var8 | v23;
  a3->var7 = v24 != 0;
  if (v24 && !self->mReturnHiddenCells)
    return 0;
  if ((__int16)self->mCurRowID == -1
    || (v25 = TSTTableTileRowInfoCellStorageRefAtTileColumnIndex((uint64_t)self->mCurRow, v7),
        (a3->var3 = (TSTCellStorage *)v25) == 0))
  {
    v28 = 0;
    v26 = 1;
    v29 = 1;
LABEL_45:
    if (self->mReturnEmptyCells && v26 && v29 && !a3->var2)
    {
      TSTCellClear((uint64_t)self->mCell);
      mCell = self->mCell;
      TSTCellClearValue((uint64_t)mCell);
      *(_DWORD *)&mCell->mPrivate &= 0xFFFF00FF;
      a3->var2 = self->mCell;
      a3->var0 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mPreviousCellID;
      a3->var1.var0 = a4.var0;
      a3->var1.var1 = v7;
      a3->var1.var2 = a4.var2;
      v28 = 1;
    }
    goto LABEL_50;
  }
  if (*(unsigned __int16 *)(v25 + 1) > 0xFFu)
  {
    a3->var5 = 0;
  }
  else
  {
    a3->var5 = (TSTCellStorageHeaderFlagsForStorage((uint64_t)v25) & 2) != 0;
    if ((TSTCellStorageHeaderFlagsForStorage((uint64_t)a3->var3) & 0x1000) != 0)
    {
      v26 = 0;
      v27 = 1;
      goto LABEL_35;
    }
  }
  v27 = 0;
  v26 = 1;
LABEL_35:
  a3->var6 = v27;
  v29 = !self->mSkipStyleOnlyCells || !a3->var5;
  if (!self->mSkipCommentStorageOnlyCells)
  {
    v26 = 1;
    goto LABEL_42;
  }
  if ((v29 | v26) == 1)
  {
LABEL_42:
    if (!self->mDontExpandCellRefs)
    {
      -[TSTCell inflateFromStorageRef:dataStore:suppressingFormulaInflation:](self->mCell, "inflateFromStorageRef:dataStore:suppressingFormulaInflation:", a3->var3, self->mTableDataStore, self->mDontInflateFormulas);
      a3->var2 = self->mCell;
    }
    a3->var1.var0 = a4.var0;
    a3->var1.var1 = v7;
    a3->var1.var2 = a4.var2;
    a3->var0 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mPreviousCellID;
    v28 = 1;
    goto LABEL_45;
  }
  v28 = 0;
LABEL_50:
  if (!self->mDontReturnMergeRegions)
  {
    a3->var1.var0 = a4.var0;
    a3->var1.var1 = v7;
    a3->var1.var2 = a4.var2;
    v31 = TSTTableMergeRangeAtCellID((uint64_t)self->mTableModel, *(_DWORD *)&a4);
    a3->var4 = ($CA3468F20078D5D2DB35E78E73CA60DA)v31;
    if (v28)
    {
      return 1;
    }
    else
    {
      v28 = 0;
      if ((_WORD)v31 != 0xFFFF && (v31 & 0xFF0000) != 0xFF0000)
        return (v31 & 0xFFFF00000000) != 0 && HIWORD(v31) != 0;
    }
  }
  return v28;
}

- (BOOL)getNext:(id *)a3
{
  unint64_t v3;
  $5CFCD363C99B2F51819B67AD7AD2E060 v6;
  $5CFCD363C99B2F51819B67AD7AD2E060 v7;
  _BOOL4 v8;
  uint64_t v9;

  -[TSTCellIterator p_resetIterData:](self, "p_resetIterData:");
  v6 = ($5CFCD363C99B2F51819B67AD7AD2E060)-[TSTCellRegionIterating getNext](self->mModelRegionIterator, "getNext");
  v7 = v6;
  LOBYTE(v8) = 0;
  if (v6.row != 0xFFFF)
  {
    v9 = v6;
    if ((*(_DWORD *)&v6 & 0xFF0000) != 0xFF0000)
    {
      do
      {
        v3 = v3 & 0xFFFFFFFF00000000 | v9;
        v8 = -[TSTCellIterator p_getData:forCellID:](self, "p_getData:forCellID:", a3, v3);
        if (!v8)
          v7 = ($5CFCD363C99B2F51819B67AD7AD2E060)-[TSTCellRegionIterating getNext](self->mModelRegionIterator, "getNext");
        if (v7.row == 0xFFFF)
          break;
        v9 = v7;
        if ((*(_DWORD *)&v7 & 0xFF0000) == 0xFF0000)
          break;
      }
      while (!v8);
    }
  }
  self->mPreviousCellID = v7;
  return v8;
}

- (void)terminate
{
  -[TSTCellRegionIterating terminate](self->mModelRegionIterator, "terminate");
}

- (BOOL)dontExpandCellRefs
{
  return self->mDontExpandCellRefs;
}

- (int)rowWalkDirection
{
  return self->mRowWalkDirection;
}

@end
