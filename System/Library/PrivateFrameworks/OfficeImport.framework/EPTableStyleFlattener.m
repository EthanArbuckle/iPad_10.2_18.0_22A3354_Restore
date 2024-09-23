@implementation EPTableStyleFlattener

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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v2 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObjects:", v15, v3, v18, v17, v14, v16, v4, v13, v12, v11, v5, v6, v7, v8, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)collectionFromWorksheet:(id)a3
{
  objc_msgSend(a3, "tables");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)styleFromObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableBorderDxf");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
    {
      v7 = objc_msgSend(v5, "copy");

      v5 = (void *)v7;
    }
    else
    {
      +[EDTableStyle tableStyle](EDTableStyle, "tableStyle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "tableStyleElements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EPStyleFlattener wrapDifferentialStyleInATableStyleElement:type:](self, "wrapDifferentialStyleInATableStyleElement:type:", v6, 14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  return v5;
}

- (void)cacheSizes:(id)a3 inObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->mTable, a4);
  -[EDTable tableRange](self->mTable, "tableRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)EPTableStyleFlattener;
  -[EPStyleFlattener cacheRange:](&v10, sel_cacheRange_, v8);

  self->mHeaderRowCount = -[EDTable headerRowCount](self->mTable, "headerRowCount");
  self->mTotalsRowCount = -[EDTable totalsRowCount](self->mTable, "totalsRowCount");
  v9.receiver = self;
  v9.super_class = (Class)EPTableStyleFlattener;
  -[EPStyleFlattener cacheSizes:inObject:](&v9, sel_cacheSizes_inObject_, v6, v7);

}

- (int)borderFlagsForStyleType:(int)a3 row:(int)a4 column:(int)a5
{
  int mFirstColumn;
  int mLastColumn;
  int v7;
  int mFirstRow;
  int mLastRow;
  int v10;
  int v11;
  int v14;
  signed int mFirstRowStripeSize;
  int v16;
  int v17;
  int v19;
  signed int mFirstColumnStripeSize;
  int v21;

  mFirstColumn = self->super.mFirstColumn;
  mLastColumn = self->super.mLastColumn;
  v7 = (mFirstColumn == a5) | 2;
  if (mLastColumn != a5)
    v7 = mFirstColumn == a5;
  mFirstRow = self->super.mFirstRow;
  mLastRow = self->super.mLastRow;
  if (mFirstRow == a4)
    v10 = v7 | 4;
  else
    v10 = v7;
  if (mLastRow == a4)
    v11 = v10 | 8;
  else
    v11 = v10;
  switch(a3)
  {
    case 1:
    case 14:
      return v11;
    case 2:
      if (a4 - mFirstRow + 1 == LODWORD(self->mHeaderRowCount))
        v11 = v10 | 8;
      break;
    case 3:
      if (mLastRow - a4 + 1 == LODWORD(self->mTotalsRowCount))
        v11 |= 4u;
      break;
    case 4:
      if (mFirstColumn == a5)
        v11 |= 2u;
      break;
    case 5:
      v11 |= mLastColumn == a5;
      break;
    case 6:
    case 7:
      v14 = -[EPTableStyleFlattener stripeOffset:row:](self, "stripeOffset:row:", *(_QWORD *)&a4, 1);
      mFirstRowStripeSize = self->super.mFirstRowStripeSize;
      v16 = v14 - mFirstRowStripeSize;
      if (v14 >= mFirstRowStripeSize)
      {
        mFirstRowStripeSize = self->super.mSecondRowStripeSize;
        v14 = v16;
      }
      v17 = v11 | 4;
      if (v14)
        v17 = v11;
      if (v14 + 1 == mFirstRowStripeSize || self->super.mLastRow - a4 == LODWORD(self->mTotalsRowCount))
        v11 = v17 | 8;
      else
        v11 = v17;
      break;
    case 8:
    case 9:
      v19 = -[EPTableStyleFlattener stripeOffset:row:](self, "stripeOffset:row:", *(_QWORD *)&a5, 0);
      mFirstColumnStripeSize = self->super.mFirstColumnStripeSize;
      v21 = v19 - mFirstColumnStripeSize;
      if (v19 >= mFirstColumnStripeSize)
      {
        mFirstColumnStripeSize = self->super.mSecondColumnStripeSize;
        v19 = v21;
      }
      if (v19 + 1 == mFirstColumnStripeSize)
        v11 |= (v19 == 0) | 2;
      else
        v11 |= v19 == 0;
      break;
    default:
      v11 = 15;
      break;
  }
  return v11;
}

- (int)stripeOffset:(int)a3 row:(BOOL)a4
{
  int mFirstColumn;
  int *v5;
  int *v6;

  if (a4)
  {
    mFirstColumn = self->super.mFirstRow + LODWORD(self->mHeaderRowCount);
    v5 = &OBJC_IVAR___EPStyleFlattener_mSecondRowStripeSize;
    v6 = &OBJC_IVAR___EPStyleFlattener_mFirstRowStripeSize;
  }
  else
  {
    mFirstColumn = self->super.mFirstColumn;
    v5 = &OBJC_IVAR___EPStyleFlattener_mSecondColumnStripeSize;
    v6 = &OBJC_IVAR___EPStyleFlattener_mFirstColumnStripeSize;
  }
  return (a3 - mFirstColumn)
       % (*(_DWORD *)((char *)&self->super.super.super.isa + *v5)
                      + *(_DWORD *)((char *)&self->super.super.super.isa + *v6));
}

- (void)clearCache
{
  EDTable *mTable;
  objc_super v4;

  mTable = self->mTable;
  self->mTable = 0;

  self->mHeaderRowCount = 0;
  self->mTotalsRowCount = 0;
  self->super.mFirstRowStripeSize = 0;
  self->super.mSecondRowStripeSize = 0;
  self->super.mFirstColumnStripeSize = 0;
  self->super.mSecondColumnStripeSize = 0;
  v4.receiver = self;
  v4.super_class = (Class)EPTableStyleFlattener;
  -[EPStyleFlattener clearCache](&v4, sel_clearCache);
}

- (id)newExtractedGlobalStyleElements:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCE30]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithObjects:", v6, v7, 0);

  v9 = -[EPStyleFlattener newExtractedKeys:from:parent:](self, "newExtractedKeys:from:parent:", v8, v4, 0);
  return v9;
}

- (id)newExtractedRowStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  signed int v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if ((int)v5 - self->super.mFirstRow >= SLODWORD(self->mHeaderRowCount))
  {
    if (self->super.mLastRow - (int)v5 >= SLODWORD(self->mTotalsRowCount))
    {
      if (-[EDTable showRowStripes](self->mTable, "showRowStripes"))
      {
        v12 = -[EPTableStyleFlattener stripeOffset:row:](self, "stripeOffset:row:", v5, 1);
        v13 = objc_alloc(MEMORY[0x24BDD16E0]);
        if (v12 < (signed int)self->super.mFirstRowStripeSize)
          v14 = 6;
        else
          v14 = 7;
        v11 = (void *)objc_msgSend(v13, "initWithInt:", v14);
        objc_msgSend(v10, "addObject:", v11);
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 3);
      objc_msgSend(v10, "addObject:", v11);
    }
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 2);
    objc_msgSend(v10, "addObject:", v11);
  }
  v15 = -[EPStyleFlattener newExtractedKeys:from:parent:](self, "newExtractedKeys:from:parent:", v10, v8, v9);

  return v15;
}

- (id)newExtractedCellStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5 column:(int)a6
{
  id v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int mFirstRow;
  int mLastRow;
  _BOOL4 v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  signed int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v28;
  id v29;

  v29 = a3;
  v28 = a4;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = -[EDTable showFirstColumn](self->mTable, "showFirstColumn");
  v11 = -[EDTable showLastColumn](self->mTable, "showLastColumn");
  v12 = v11;
  if (!self->mHeaderRowCount)
  {
    if (!self->mTotalsRowCount || self->super.mLastRow != a5)
    {
LABEL_11:
      v17 = 0;
      v15 = 0;
      v18 = 0;
      if (v10)
      {
LABEL_12:
        v19 = (void *)v18;
        goto LABEL_19;
      }
LABEL_26:
      v19 = (void *)v18;
      goto LABEL_27;
    }
    goto LABEL_8;
  }
  mFirstRow = self->super.mFirstRow;
  if (!self->mTotalsRowCount)
  {
    v17 = 0;
    if (mFirstRow != a5)
    {
      v18 = 0;
      v15 = 0;
      if (v10)
        goto LABEL_12;
      goto LABEL_26;
    }
    v15 = 0;
    goto LABEL_15;
  }
  mLastRow = self->super.mLastRow;
  v15 = mLastRow == a5;
  if (mFirstRow == a5)
  {
LABEL_15:
    if (!v10 || self->super.mFirstColumn != a6)
    {
      if (v11 && self->super.mLastColumn == a6)
      {
        v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 11);
        objc_msgSend(v9, "addObject:", v18);
      }
      else
      {
        v18 = 0;
      }
      v17 = 1;
      if (v10)
        goto LABEL_12;
      goto LABEL_26;
    }
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 10);
    objc_msgSend(v9, "addObject:", v16);
    v17 = 1;
    goto LABEL_18;
  }
  if (mLastRow != a5)
    goto LABEL_11;
LABEL_8:
  if (!v10 || self->super.mFirstColumn != a6)
  {
    if (v11 && self->super.mLastColumn == a6)
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 13);
      objc_msgSend(v9, "addObject:", v18);
      v17 = 0;
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }
    v15 = 1;
    if (v10)
      goto LABEL_12;
    goto LABEL_26;
  }
  v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 12);
  objc_msgSend(v9, "addObject:", v16);
  v17 = 0;
  v15 = 1;
LABEL_18:
  v19 = (void *)v16;
LABEL_19:
  if (self->super.mFirstColumn == a6)
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 4);

    v19 = (void *)v20;
    objc_msgSend(v9, "addObject:", v20);
    goto LABEL_30;
  }
LABEL_27:
  if (v12 && self->super.mLastColumn == a6)
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 5);

    v19 = (void *)v21;
    objc_msgSend(v9, "addObject:", v21);
  }
LABEL_30:
  if (((v17 | v15 | !-[EDTable showColumnStripes](self->mTable, "showColumnStripes")) & 1) == 0)
  {
    v22 = -[EPTableStyleFlattener stripeOffset:row:](self, "stripeOffset:row:", a6, 0);
    v23 = objc_alloc(MEMORY[0x24BDD16E0]);
    if (v22 < (signed int)self->super.mFirstColumnStripeSize)
      v24 = 8;
    else
      v24 = 9;
    v25 = objc_msgSend(v23, "initWithInt:", v24);

    v19 = (void *)v25;
    objc_msgSend(v9, "addObject:", v25);
  }
  v26 = -[EPStyleFlattener newExtractedKeys:from:parent:](self, "newExtractedKeys:from:parent:", v9, v29, v28);

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTable, 0);
}

@end
