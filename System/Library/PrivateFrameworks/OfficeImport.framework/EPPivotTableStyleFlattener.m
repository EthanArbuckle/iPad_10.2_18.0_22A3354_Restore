@implementation EPPivotTableStyleFlattener

- (BOOL)isObjectSupported:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)keysInTheOrderTheyShouldBeApplied
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v2 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 11);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 17);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObjects:", v20, v21, v4, v33, v32, v31, v19, v30, v5, v29, v6, v28, v7, v8, v18, v17, v27,
    v26,
    v25,
    v24,
    v23,
    v16,
    v22,
    v15,
    v14,
    v13,
    v12,
    v9,
    0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)collectionFromWorksheet:(id)a3
{
  objc_msgSend(a3, "pivotTables");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)styleFromObject:(id)a3
{
  objc_msgSend(a3, "style");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)cacheSizes:(id)a3 inObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t mPageFieldsCount;
  int mFirstRow;
  int v14;
  void *v15;
  objc_super v16;
  objc_super v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->mPivotTable, a4);
  -[EDPivotTable pivotTableRange](self->mPivotTable, "pivotTableRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)EPPivotTableStyleFlattener;
  -[EPStyleFlattener cacheRange:](&v18, sel_cacheRange_, v8);

  self->mFirstHeaderRow = -[EDPivotTable firstHeaderRow](self->mPivotTable, "firstHeaderRow");
  self->mFirstDataRow = -[EDPivotTable firstDataRow](self->mPivotTable, "firstDataRow");
  self->mFirstDataColumn = -[EDPivotTable firstDataColumn](self->mPivotTable, "firstDataColumn");
  -[EDPivotTable rowFields](self->mPivotTable, "rowFields");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->mRowFieldsCount = objc_msgSend(v9, "count");

  -[EDPivotTable columnFields](self->mPivotTable, "columnFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->mColumnFieldsCount = objc_msgSend(v10, "count");

  -[EDPivotTable pageFields](self->mPivotTable, "pageFields");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->mPageFieldsCount = objc_msgSend(v11, "count");

  mPageFieldsCount = self->mPageFieldsCount;
  if (mPageFieldsCount)
  {
    mFirstRow = self->super.mFirstRow;
    v14 = ~(_DWORD)mPageFieldsCount;
    if (mFirstRow + v14 >= 0)
    {
      +[EDReference referenceWithFirstRow:lastRow:firstColumn:lastColumn:](EDReference, "referenceWithFirstRow:lastRow:firstColumn:lastColumn:", (mFirstRow + v14), (mFirstRow - 2), self->super.mFirstColumn, (self->super.mFirstColumn + 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17.receiver = self;
      v17.super_class = (Class)EPPivotTableStyleFlattener;
      -[EPStyleFlattener cacheRange:](&v17, sel_cacheRange_, v15);

    }
  }
  v16.receiver = self;
  v16.super_class = (Class)EPPivotTableStyleFlattener;
  -[EPStyleFlattener cacheSizes:inObject:](&v16, sel_cacheSizes_inObject_, v6, v7);

}

- (int)borderFlagsForStyleType:(int)a3 row:(int)a4 column:(int)a5
{
  int v7;
  int mFirstRow;
  int v9;
  int v10;
  int mFirstDataRow;
  int v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  signed int mFirstRowStripeSize;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  BOOL v29;
  int v30;
  _BOOL4 v31;
  int v32;
  void *v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  int v45;
  int v47;
  int v48;
  void *v49;
  void *v50;
  int mFirstDataColumn;
  int v52;
  void *v53;
  void *v54;

  v52 = a5 - self->super.mFirstColumn;
  v7 = a5 == self->super.mFirstColumn;
  mFirstRow = self->super.mFirstRow;
  if (self->super.mLastColumn == a5)
    v7 |= 2u;
  v9 = a4 - mFirstRow;
  if (a4 == mFirstRow)
    v7 |= 4u;
  v47 = v7 | 8;
  if (self->super.mLastRow == a4)
    v10 = v7 | 8;
  else
    v10 = v7;
  mFirstDataRow = self->mFirstDataRow;
  mFirstDataColumn = self->mFirstDataColumn;
  -[EDPivotTable rowItems](self->mPivotTable, "rowItems", 100);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPivotTable columnItems](self->mPivotTable, "columnItems");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v9;
  v45 = v9 - mFirstDataRow;
  objc_msgSend(v49, "objectAtIndex:", v9 - mFirstDataRow);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "objectAtIndex:", v52 - mFirstDataColumn);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 15;
  switch(a3)
  {
    case 1:
      v12 = v10;
      if (v48 < 0)
      {
        v35 = self->super.mFirstRow;
        if (v35 + ~LODWORD(self->mPageFieldsCount) == a4)
          v36 = v10 | 4;
        else
          v36 = v10;
        if (v35 - 2 == a4)
          v37 = v36 | 8;
        else
          v37 = v36;
        if (v52 == 1)
          v12 = v37 | 2;
        else
          v12 = v37;
      }
      break;
    case 2:
      if (self->mFirstDataRow == v48 + 1)
        v12 = v47;
      else
        v12 = v10;
      break;
    case 3:
      if (*(_DWORD *)((char *)&self->super.super.super.isa + v43) == a4)
        v12 = v10 | 4;
      else
        v12 = v10;
      break;
    case 4:
      if (self->mFirstDataColumn == v52 + 1)
        v12 = v10 | 2;
      else
        v12 = v10;
      break;
    case 5:
      if (v48 == 1)
        v38 = 5;
      else
        v38 = 1;
      v12 = v10 | v38;
      break;
    case 6:
    case 7:
      v19 = -[EPPivotTableStyleFlattener stripeOffset:row:](self, "stripeOffset:row:", v48, 1);
      mFirstRowStripeSize = self->super.mFirstRowStripeSize;
      v21 = v19 - mFirstRowStripeSize;
      if (v19 >= mFirstRowStripeSize)
      {
        mFirstRowStripeSize = self->super.mSecondRowStripeSize;
        v19 = v21;
      }
      v22 = v10 | 4;
      if (v19)
        v22 = v10;
      v23 = v19 + 1;
      v24 = v22 | 8;
      goto LABEL_36;
    case 8:
    case 9:
      v25 = -[EPPivotTableStyleFlattener stripeOffset:row:](self, "stripeOffset:row:", v52, 0);
      mFirstRowStripeSize = self->super.mFirstColumnStripeSize;
      v26 = v25 - mFirstRowStripeSize;
      if (v25 >= mFirstRowStripeSize)
      {
        mFirstRowStripeSize = self->super.mSecondColumnStripeSize;
        v25 = v26;
      }
      v22 = v10 | (v25 == 0);
      v23 = v25 + 1;
      v24 = v22 | 2;
LABEL_36:
      if (v23 == mFirstRowStripeSize)
        v12 = v24;
      else
        v12 = v22;
      break;
    case 10:
      if (self->mFirstDataColumn == v52 + 1)
        v12 = v10 | 0xA;
      else
        v12 = v47;
      break;
    case 15:
    case 16:
    case 17:
      if (v48 - 1 == objc_msgSend(v53, "repeatedItemCounts"))
        v13 = 7;
      else
        v13 = 3;
      goto LABEL_12;
    case 18:
    case 19:
    case 20:
      v12 = v10 | 0xC;
      if ((v45 & 0x80000000) == 0 && v52 == objc_msgSend(v50, "repeatedItemCounts"))
        v12 = v10 | 0xD;
      break;
    case 21:
      goto LABEL_18;
    case 22:
    case 23:
    case 24:
      if (v48 <= (int)objc_msgSend(v53, "repeatedItemCounts"))
      {
        v18 = v10 | 0xC;
      }
      else
      {
        objc_msgSend(v53, "itemIndexes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");
        v16 = objc_msgSend(v53, "repeatedItemCounts");

        if (v48 == v16 + v15)
          v17 = v10 | 4;
        else
          v17 = v10;
        if (v48 <= v16 + v15 - 1)
          v17 = v10 | 0xC;
        if (v48 == LODWORD(self->mColumnFieldsCount))
          v18 = v17 | 8;
        else
          v18 = v17;
      }
      v31 = v52 == mFirstDataColumn || v48 > (int)objc_msgSend(v53, "repeatedItemCounts");
      v32 = v18 | v31;
      if (self->super.mLastColumn == a5)
      {
        v12 = v32 | 2;
      }
      else
      {
        objc_msgSend(v54, "objectAtIndex:", v52 - mFirstDataColumn + 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "repeatedItemCounts");

        if (v48 <= v34)
          v12 = v32;
        else
          v12 = v32 | 2;
      }
      break;
    case 25:
    case 26:
    case 27:
      if (-[EDPivotTable compact](self->mPivotTable, "compact"))
      {
LABEL_18:
        v12 = v10 | 0xC;
      }
      else if (-[EDPivotTable outline](self->mPivotTable, "outline"))
      {
        if (v52 == objc_msgSend(v50, "repeatedItemCounts"))
          v13 = 13;
        else
          v13 = 12;
LABEL_12:
        v12 = v13 | v10;
      }
      else if (-[EDPivotTable compact](self->mPivotTable, "compact"))
      {
        v12 = v10;
      }
      else
      {
        v12 = v10;
        if (!-[EDPivotTable outline](self->mPivotTable, "outline"))
        {
          if (v48 == mFirstDataRow)
          {
            v12 = v10 | 7;
            v39 = v49;
          }
          else
          {
            v39 = v49;
            objc_msgSend(v49, "objectAtIndex:", v45 - 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v10 | 3;
            if (objc_msgSend(v40, "type") != 4 && v52 >= (int)objc_msgSend(v40, "repeatedItemCounts"))
              v12 = v10 | 7;

          }
          if (*(_DWORD *)((char *)&self->super.super.super.isa + v43) == a4)
          {
            v12 |= 8u;
          }
          else
          {
            objc_msgSend(v39, "objectAtIndex:", v45 + 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v41, "type") != 4 && v52 >= (int)objc_msgSend(v41, "repeatedItemCounts"))
              v12 |= 8u;

          }
        }
      }
      break;
    case 28:
    case 29:
      v27 = self->super.mFirstRow;
      if (v27 + ~LODWORD(self->mPageFieldsCount) == a4)
        v28 = 7;
      else
        v28 = 3;
      v29 = v27 - 2 == a4;
      v30 = v47;
      if (!v29)
        v30 = v10;
      v12 = v28 | v30;
      break;
    default:
      break;
  }

  return v12;
}

- (void)clearCache
{
  EDPivotTable *mPivotTable;
  objc_super v4;

  mPivotTable = self->mPivotTable;
  self->mPivotTable = 0;

  self->mFirstHeaderRow = 0;
  self->mFirstDataRow = 0;
  self->mFirstDataColumn = 0;
  self->mRowFieldsCount = 0;
  self->mColumnFieldsCount = 0;
  self->mPageFieldsCount = 0;
  v4.receiver = self;
  v4.super_class = (Class)EPPivotTableStyleFlattener;
  -[EPStyleFlattener clearCache](&v4, sel_clearCache);
}

- (void)addColumnSubheadingLevel:(unsigned int)a3 to:(id)a4
{
  uint64_t v4;
  unsigned int v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  v6 = -[EPPivotTableStyleFlattener constrainLevel:](self, "constrainLevel:", v4);
  switch(v6)
  {
    case 2u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 24);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);
      goto LABEL_7;
    case 1u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 23);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);
      goto LABEL_7;
    case 0u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 22);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);
LABEL_7:

      break;
  }

}

- (unsigned)constrainLevel:(unsigned int)a3
{
  if (a3 >= 3)
    return 2 - (a3 & 1);
  else
    return a3;
}

- (void)addRowSubheadingLevel:(unsigned int)a3 to:(id)a4
{
  uint64_t v4;
  unsigned int v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  v6 = -[EPPivotTableStyleFlattener constrainLevel:](self, "constrainLevel:", v4);
  switch(v6)
  {
    case 2u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 27);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);
      goto LABEL_7;
    case 1u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 26);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);
      goto LABEL_7;
    case 0u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 25);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);
LABEL_7:

      break;
  }

}

- (id)newExtractedRowStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t mFirstRow;
  _BOOL4 v12;
  int64_t v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  mFirstRow = self->super.mFirstRow;
  v12 = -[EDPivotTable showColumnHeaders](self->mPivotTable, "showColumnHeaders");
  v13 = a5 - mFirstRow;
  v14 = (int)v13 >= 0 && v12;
  if (v14 && self->mFirstDataRow > v13)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v15);
LABEL_13:

    goto LABEL_14;
  }
  if (-[EDPivotTable showRowStripes](self->mPivotTable, "showRowStripes") && self->mFirstDataRow <= v13)
  {
    if (-[EPPivotTableStyleFlattener stripeOffset:row:](self, "stripeOffset:row:", v13, 1) < (signed int)self->super.mFirstRowStripeSize)
      v16 = 6;
    else
      v16 = 7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v15);
    goto LABEL_13;
  }
LABEL_14:
  v17 = -[EPStyleFlattener newExtractedKeys:from:parent:](self, "newExtractedKeys:from:parent:", v10, v8, v9);

  return v17;
}

- (id)newExtractedCellStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5 column:(int)a6
{
  int mFirstRow;
  int mFirstDataRow;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  int v24;
  void *v25;
  _BOOL4 v26;
  _BOOL4 v27;
  BOOL v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  int v34;
  void *v35;
  uint64_t v36;
  id v37;
  _BOOL4 v39;
  int v40;
  int mFirstDataColumn;
  id v42;
  id v43;
  int v44;
  int mFirstColumn;
  id v47;
  int v48;

  v43 = a3;
  v42 = a4;
  v47 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  mFirstRow = self->super.mFirstRow;
  mFirstColumn = self->super.mFirstColumn;
  mFirstDataRow = self->mFirstDataRow;
  mFirstDataColumn = self->mFirstDataColumn;
  v11 = -[EDPivotTable showRowHeaders](self->mPivotTable, "showRowHeaders");
  v39 = -[EDPivotTable showColumnHeaders](self->mPivotTable, "showColumnHeaders");
  v44 = a5 - mFirstRow;
  v40 = a6 - mFirstColumn;
  v48 = a6 - mFirstColumn;
  v12 = a5 - mFirstRow >= 0 && v11;
  if (v12 && self->mFirstDataColumn > v40)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v13);

  }
  v14 = a5 == mFirstRow && v11;
  if (v14 && self->mFirstDataColumn > v40)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v15);

  }
  if (-[EDPivotTable showColumnStripes](self->mPivotTable, "showColumnStripes")
    && self->mFirstDataColumn <= v40
    && self->mFirstDataRow <= v44)
  {
    if (-[EPPivotTableStyleFlattener stripeOffset:row:](self, "stripeOffset:row:", v40, 0) < (signed int)self->super.mFirstColumnStripeSize)
      v16 = 8;
    else
      v16 = 9;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v17);

  }
  -[EDPivotTable rowItems](self->mPivotTable, "rowItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = (v44 - mFirstDataRow);
  if ((v20 & 0x80000000) == 0 && (int)v20 < (int)objc_msgSend(v18, "count"))
  {
    objc_msgSend(v19, "objectAtIndex:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "repeatedItemCounts");
    v23 = objc_msgSend(v21, "type");
    v24 = v23;
    if (v23 == 1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v25);
    }
    else
    {
      if (v23 != 6)
        goto LABEL_27;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v25);
    }

LABEL_27:
    if (-[EDPivotTable compact](self->mPivotTable, "compact"))
    {
      v26 = v24 == 4 && v11;
      if (!v26 || self->mRowFieldsCount <= (v22 + 1))
        goto LABEL_54;
    }
    else
    {
      if (!-[EDPivotTable outline](self->mPivotTable, "outline"))
      {
        if (!-[EDPivotTable compact](self->mPivotTable, "compact")
          && !-[EDPivotTable outline](self->mPivotTable, "outline"))
        {
          if (v11 && v48 + 1 < SLODWORD(self->mRowFieldsCount) && (v24 == 4 || v40 < (int)v22))
            -[EPPivotTableStyleFlattener addRowSubheadingLevel:to:](self, "addRowSubheadingLevel:to:", v40, v47);
          if (v24 == 5 && v40 >= (int)v22)
            -[EPPivotTableStyleFlattener addSubtotalRowLevel:to:](self, "addSubtotalRowLevel:to:", v22, v47);
        }
        goto LABEL_54;
      }
      v27 = v24 == 4 && v11;
      if (!v27 || (self->mRowFieldsCount > (v22 + 1) ? (v28 = v48 < (int)v22) : (v28 = 1), v28))
      {
LABEL_54:

        goto LABEL_55;
      }
    }
    -[EPPivotTableStyleFlattener addRowSubheadingLevel:to:](self, "addRowSubheadingLevel:to:", v22, v47);
    goto LABEL_54;
  }
LABEL_55:
  -[EDPivotTable columnItems](self->mPivotTable, "columnItems");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v44 < 1)
  {
    if (v44 < 0)
    {
      if (a6 == mFirstColumn)
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 28);
      else
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v32);
      goto LABEL_77;
    }
  }
  else
  {
    v31 = v40 - mFirstDataColumn;
    if (v40 - mFirstDataColumn < (int)objc_msgSend(v29, "count"))
    {
      objc_msgSend(v30, "objectAtIndex:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "repeatedItemCounts");
      v34 = objc_msgSend(v32, "type");
      if (v34 == 6)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addObject:", v35);

      }
      if (v39 && v44 <= SLODWORD(self->mColumnFieldsCount) && (v31 & 0x80000000) == 0 && v34 != 6)
      {
        v36 = (v44 - 1);
        if (v34 == 4)
        {
          -[EPPivotTableStyleFlattener addColumnSubheadingLevel:to:](self, "addColumnSubheadingLevel:to:", v36, v47);
LABEL_77:

          goto LABEL_78;
        }
        if (v44 <= (int)v33)
          v36 = v36;
        else
          v36 = v33;
        -[EPPivotTableStyleFlattener addColumnSubheadingLevel:to:](self, "addColumnSubheadingLevel:to:", v36, v47);
      }
      if (v44 > (int)v33 && v34 == 5)
        -[EPPivotTableStyleFlattener addSubtotalColumnLevel:to:](self, "addSubtotalColumnLevel:to:", v33, v47);
      goto LABEL_77;
    }
  }
LABEL_78:
  v37 = -[EPStyleFlattener newExtractedKeys:from:parent:](self, "newExtractedKeys:from:parent:", v47, v43, v42);

  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPivotTable, 0);
}

- (int)stripeOffset:(int)a3 row:(BOOL)a4
{
  int *v4;
  int *v5;
  int *v6;
  int v7;

  v4 = &OBJC_IVAR___EPPivotTableStyleFlattener_mFirstDataColumn;
  if (a4)
    v4 = &OBJC_IVAR___EPPivotTableStyleFlattener_mFirstDataRow;
  v5 = &OBJC_IVAR___EPStyleFlattener_mFirstColumnStripeSize;
  if (a4)
    v5 = &OBJC_IVAR___EPStyleFlattener_mFirstRowStripeSize;
  v6 = &OBJC_IVAR___EPStyleFlattener_mSecondRowStripeSize;
  v7 = *(_DWORD *)((char *)&self->super.super.super.isa + *v4);
  if (!a4)
    v6 = &OBJC_IVAR___EPStyleFlattener_mSecondColumnStripeSize;
  return (a3 - v7)
       % (*(_DWORD *)((char *)&self->super.super.super.isa + *v6)
                      + *(_DWORD *)((char *)&self->super.super.super.isa + *v5));
}

- (void)addSubtotalRowLevel:(unsigned int)a3 to:(id)a4
{
  uint64_t v4;
  unsigned int v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  v6 = -[EPPivotTableStyleFlattener constrainLevel:](self, "constrainLevel:", v4);
  switch(v6)
  {
    case 2u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 20);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);
      goto LABEL_7;
    case 1u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);
      goto LABEL_7;
    case 0u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);
LABEL_7:

      break;
  }

}

- (void)addSubtotalColumnLevel:(unsigned int)a3 to:(id)a4
{
  uint64_t v4;
  unsigned int v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  v6 = -[EPPivotTableStyleFlattener constrainLevel:](self, "constrainLevel:", v4);
  switch(v6)
  {
    case 2u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);
      goto LABEL_7;
    case 1u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);
      goto LABEL_7;
    case 0u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);
LABEL_7:

      break;
  }

}

@end
