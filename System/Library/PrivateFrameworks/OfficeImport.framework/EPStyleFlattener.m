@implementation EPStyleFlattener

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  EDWorksheet **p_mWorksheet;
  NSArray *v7;
  NSArray *mKeys;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  EDWorksheet *v13;
  id v14;

  v14 = a3;
  p_mWorksheet = &self->mWorksheet;
  objc_storeStrong((id *)&self->mWorksheet, a3);
  if (!self->mKeys)
  {
    -[EPStyleFlattener keysInTheOrderTheyShouldBeApplied](self, "keysInTheOrderTheyShouldBeApplied");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    mKeys = self->mKeys;
    self->mKeys = v7;

  }
  -[EPStyleFlattener collectionFromWorksheet:](self, "collectionFromWorksheet:", *p_mWorksheet);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EPStyleFlattener processObject:](self, "processObject:", v12);

      ++v11;
    }
    while (v10 != v11);
  }
  v13 = *p_mWorksheet;
  *p_mWorksheet = 0;

}

- (void)processObject:(id)a3
{
  void *v4;
  void *v5;
  EDRowBlocks *v6;
  EDRowBlocks *mRowBlocks;
  EDColumnInfoCollection *v8;
  EDColumnInfoCollection *mColumnInfos;
  NSMutableArray *v10;
  NSMutableArray *mRanges;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  signed int v15;
  uint64_t v16;
  BOOL v17;
  EDRowBlock *v18;
  EDRowBlock *mCurrentRowBlock;
  int v20;
  int v21;
  id v22;
  EDRowBlock *v23;
  EDRowBlock *v24;
  uint64_t v25;
  id v26;
  EDCellHeader *v27;
  NSMutableArray *v28;
  EDColumnInfoCollection *v29;
  EDRowBlocks *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  signed int v36;

  v31 = a3;
  -[EPStyleFlattener styleFromObject:](self, "styleFromObject:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableStyleElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "count"))
  {
    -[EDWorksheet rowBlocks](self->mWorksheet, "rowBlocks");
    v6 = (EDRowBlocks *)objc_claimAutoreleasedReturnValue();
    mRowBlocks = self->mRowBlocks;
    self->mRowBlocks = v6;

    -[EDWorksheet columnInfos](self->mWorksheet, "columnInfos");
    v8 = (EDColumnInfoCollection *)objc_claimAutoreleasedReturnValue();
    mColumnInfos = self->mColumnInfos;
    self->mColumnInfos = v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    mRanges = self->mRanges;
    self->mRanges = v10;

    -[EPStyleFlattener cacheSizes:inObject:](self, "cacheSizes:inObject:", v5, v31);
    v35 = -[EPStyleFlattener newExtractedGlobalStyleElements:](self, "newExtractedGlobalStyleElements:", v5);
    v12 = -[NSMutableArray count](self->mRanges, "count");
    if (v12)
    {
      v13 = 0;
      v32 = v12;
      do
      {
        v33 = v13;
        -[NSMutableArray objectAtIndex:](self->mRanges, "objectAtIndex:");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v34, "firstRow");
        v15 = objc_msgSend(v34, "lastRow");
        v16 = objc_msgSend(v34, "firstColumn");
        v36 = objc_msgSend(v34, "lastColumn");
        v17 = (int)v14 <= 499999 && (int)v16 <= 499999;
        if (v17)
        {
          if (v15 > 500000)
            v15 = -[EDRowBlocks maxPopulatedRow](self->mRowBlocks, "maxPopulatedRow") + 1;
          if (v36 > 500000)
            v36 = -[EDRowBlocks maxPopulatedColumn](self->mRowBlocks, "maxPopulatedColumn") + 1;
          -[EDRowBlocks rowBlockForRowNumber:currentRowBlock:createIfNil:](self->mRowBlocks, "rowBlockForRowNumber:currentRowBlock:createIfNil:", v14, 0, 1);
          v18 = (EDRowBlock *)objc_claimAutoreleasedReturnValue();
          mCurrentRowBlock = self->mCurrentRowBlock;
          self->mCurrentRowBlock = v18;

          if ((int)v14 <= v15)
          {
            if (v36 >= 500000)
              v20 = 500000;
            else
              v20 = v36;
            if (v15 >= 500000)
              v21 = 500000;
            else
              v21 = v15;
            do
            {
              v22 = -[EPStyleFlattener newExtractedRowStyleElements:parentScope:row:](self, "newExtractedRowStyleElements:parentScope:row:", v5, v35, v14);
              -[EDRowBlocks rowBlockForRowNumber:currentRowBlock:createIfNil:](self->mRowBlocks, "rowBlockForRowNumber:currentRowBlock:createIfNil:", v14, self->mCurrentRowBlock, 1);
              v23 = (EDRowBlock *)objc_claimAutoreleasedReturnValue();
              v24 = self->mCurrentRowBlock;
              self->mCurrentRowBlock = v23;

              v25 = v16;
              if ((int)v16 <= v36)
              {
                do
                {
                  v26 = -[EPStyleFlattener newExtractedCellStyleElements:parentScope:row:column:](self, "newExtractedCellStyleElements:parentScope:row:column:", v5, v22, v14, v25);
                  if (objc_msgSend(v26, "count"))
                  {
                    v27 = -[EPStyleFlattener cellWithSetupStyleAtRowNumber:columnNumber:](self, "cellWithSetupStyleAtRowNumber:columnNumber:", v14, v25);
                    if (v27)
                      -[EPStyleFlattener applyStyleElements:toCell:row:column:](self, "applyStyleElements:toCell:row:column:", v26, v27, v14, v25);
                  }

                  v17 = (int)v25 < v20;
                  v25 = (v25 + 1);
                }
                while (v17);
              }

              v17 = (int)v14 < v21;
              v14 = (v14 + 1);
            }
            while (v17);
          }
        }

        v13 = v33 + 1;
      }
      while (v33 + 1 != v32);
    }
    -[EPStyleFlattener clearCache](self, "clearCache");
    v28 = self->mRanges;
    self->mRanges = 0;

    v29 = self->mColumnInfos;
    self->mColumnInfos = 0;

    -[EDRowBlocks unlock](self->mRowBlocks, "unlock");
    v30 = self->mRowBlocks;
    self->mRowBlocks = 0;

  }
}

- (void)cacheRange:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[NSMutableArray count](self->mRanges, "count"))
  {
    self->mFirstRow = objc_msgSend(v4, "firstRow");
    self->mLastRow = objc_msgSend(v4, "lastRow");
    self->mFirstColumn = objc_msgSend(v4, "firstColumn");
    self->mLastColumn = objc_msgSend(v4, "lastColumn");
  }
  -[NSMutableArray addObject:](self->mRanges, "addObject:", v4);

}

- (void)cacheSizes:(id)a3 inObject:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  self->mFirstRowStripeSize = 1;
  self->mSecondRowStripeSize = 1;
  v11 = v5;
  objc_msgSend(v5, "objectWithKey:", 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "bandSize") != -1)
    self->mFirstRowStripeSize = objc_msgSend(v7, "bandSize");
  objc_msgSend(v11, "objectWithKey:", 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "bandSize") != -1)
    self->mSecondRowStripeSize = objc_msgSend(v8, "bandSize");
  self->mFirstColumnStripeSize = 1;
  self->mSecondColumnStripeSize = 1;
  objc_msgSend(v11, "objectWithKey:", 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "bandSize") != -1)
    self->mFirstColumnStripeSize = objc_msgSend(v9, "bandSize");
  objc_msgSend(v11, "objectWithKey:", 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "bandSize") != -1)
    self->mSecondColumnStripeSize = objc_msgSend(v10, "bandSize");

}

- (EDCellHeader)cellWithSetupStyleAtRowNumber:(int)a3 columnNumber:(int)a4
{
  EDCellHeader *v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  EDRowInfo *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  EDRowInfo *v15;

  if (a3 > 500000 || a4 > 500000)
    return 0;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  -[EDRowBlocks rowBlockForRowNumber:currentRowBlock:createIfNil:](self->mRowBlocks, "rowBlockForRowNumber:currentRowBlock:createIfNil:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (EDRowInfo *)objc_msgSend(v9, "rowInfoWithRowNumber:createIfNil:", v7, 1);
  v15 = v10;
  if (v10)
  {
    v5 = (EDCellHeader *)objc_msgSend(v9, "cellWithColumnNumber:rowInfo:", v6, v10);
    if (!v5)
    {
      v5 = (EDCellHeader *)objc_msgSend(v9, "addCellWithColumnNumber:type:isFormulaCell:rowInfo:rowBlocks:", v6, 0, 0, &v15, self->mRowBlocks);
      if (v5)
      {
        v11 = styleIndexForEDRowInfo(v15);
        LODWORD(v12) = v11;
        if (v11 != -1
          || (-[EDColumnInfoCollection columnInfoForColumnNumber:](self->mColumnInfos, "columnInfoForColumnNumber:", v6),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v12 = objc_msgSend(v13, "styleIndex"),
              v13,
              v12 != -1))
        {
          setStyleIndexForEDCell((uint64_t)v5, v12);
        }
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)applyStyleElements:(id)a3 toCell:(EDCellHeader *)a4 row:(int)a5 column:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  NSUInteger v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  EDCellHeader *v18;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v18 = a4;
  v11 = -[NSArray count](self->mKeys, "count");
  if (v11)
  {
    v12 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->mKeys, "objectAtIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

      objc_msgSend(v10, "objectWithKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = -[EPStyleFlattener borderFlagsForStyleType:row:column:](self, "borderFlagsForStyleType:row:column:", v14, v7, v6);
        objc_msgSend(v15, "differentialStyle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[EPStyleFlattener applyDifferentialStyle:borderFlags:precedence:toCell:row:column:](self, "applyDifferentialStyle:borderFlags:precedence:toCell:row:column:", v17, v16, v12, &v18, v7, v6);

      }
      ++v12;
    }
    while (v11 != v12);
  }

}

- (void)applyDifferentialStyle:(id)a3 borderFlags:(int)a4 precedence:(unint64_t)a5 toCell:(EDCellHeader *)a6 row:(int)a7 column:(int)a8
{
  uint64_t v10;
  id v12;
  uint64_t v13;
  void *v14;
  ECIntToTwoIntKeyCache *mFlattenedStyleCache;
  ECIntToTwoIntKeyCache *v16;
  ECIntToTwoIntKeyCache *v17;
  EDCellHeader *v18;
  EDResources *WeakRetained;
  void *v20;
  EDStyle *v21;
  EDStyle *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  id v32;
  EDCellHeader *v33;
  EDResources *v34;
  uint64_t v35;
  void *v36;
  void *v39;
  unint64_t v40;

  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = styleIndexForEDCell(*a6);
  v40 = -1;
  objc_msgSend(v12, "borders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    goto LABEL_6;
  mFlattenedStyleCache = self->mFlattenedStyleCache;
  if (!mFlattenedStyleCache)
  {
    v16 = objc_alloc_init(ECIntToTwoIntKeyCache);
    v17 = self->mFlattenedStyleCache;
    self->mFlattenedStyleCache = v16;

    mFlattenedStyleCache = self->mFlattenedStyleCache;
  }
  if (!-[ECIntToTwoIntKeyCache integerIsPresentForKey1:key2:outValue:](mFlattenedStyleCache, "integerIsPresentForKey1:key2:outValue:", v13, v12, &v40))
  {
LABEL_6:
    v39 = v12;
    v35 = v13;
    v18 = *a6;
    WeakRetained = (EDResources *)objc_loadWeakRetained((id *)&self->super.mResources);
    styleForEDCell(v18, WeakRetained);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (EDStyle *)objc_msgSend(v20, "copy");
    if (!v21)
    {
      v22 = [EDStyle alloc];
      v23 = objc_loadWeakRetained((id *)&self->super.mResources);
      v21 = -[EDStyle initWithResources:](v22, "initWithResources:", v23);

    }
    objc_msgSend(v20, "borders");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "borders");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[EPStyleFlattener copyFlattenBorders:differentialBorders:borderFlags:precedence:row:column:](self, "copyFlattenBorders:differentialBorders:borderFlags:precedence:row:column:", v24, v25, v10, a5, a7, a8);

    v36 = v26;
    if (v26)
      -[EDStyle setBorders:](v21, "setBorders:", v26);
    v27 = objc_msgSend(v20, "fillIndex");
    objc_msgSend(v39, "fill");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[EPStyleFlattener flattenFillIndex:differentialFill:](self, "flattenFillIndex:differentialFill:", v27, v28);

    if (v29 != -1)
      -[EDStyle setFillIndex:](v21, "setFillIndex:", v29);
    objc_msgSend(v20, "font");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "font");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[EPStyleFlattener copyFlattenFont:differentialFont:](self, "copyFlattenFont:differentialFont:", v30, v31);

    if (v32)
      -[EDStyle setFont:](v21, "setFont:", v32);
    v33 = -[EPStyleFlattener cellWithSetupStyleAtRowNumber:columnNumber:](self, "cellWithSetupStyleAtRowNumber:columnNumber:", a7, a8);
    *a6 = v33;
    v34 = (EDResources *)objc_loadWeakRetained((id *)&self->super.mResources);
    setStyleForEDCell(v33, v21, v34);

    if (!v14)
    {
      v40 = styleIndexForEDCell(*a6);
      -[ECIntToTwoIntKeyCache setObject:forKey1:key2:](self->mFlattenedStyleCache, "setObject:forKey1:key2:", v40, v35, v39);
    }

    v12 = v39;
  }
  else
  {
    setStyleIndexForEDCell((uint64_t)*a6, v40);
  }

}

- (id)copyFlattenBorders:(id)a3 differentialBorders:(id)a4 borderFlags:(int)a5 precedence:(unint64_t)a6 row:(int)a7 column:(int)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  EDBorders *v21;
  id WeakRetained;
  EDBorders *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v9 = *(_QWORD *)&a7;
  v14 = a3;
  v15 = a4;
  if (v15)
  {
    LODWORD(v25) = a8;
    v16 = -[EPStyleFlattener copyFlattenBorder:borders:differentialBorders:flag:precedence:row:column:](self, "copyFlattenBorder:borders:differentialBorders:flag:precedence:row:column:", 0, v14, v15, a5 & 1, a6, v9, v25);
    LODWORD(v26) = a8;
    v17 = -[EPStyleFlattener copyFlattenBorder:borders:differentialBorders:flag:precedence:row:column:](self, "copyFlattenBorder:borders:differentialBorders:flag:precedence:row:column:", 1, v14, v15, (a5 >> 1) & 1, a6, v9, v26);
    LODWORD(v27) = a8;
    v18 = -[EPStyleFlattener copyFlattenBorder:borders:differentialBorders:flag:precedence:row:column:](self, "copyFlattenBorder:borders:differentialBorders:flag:precedence:row:column:", 2, v14, v15, (a5 >> 2) & 1, a6, v9, v27);
    LODWORD(v28) = a8;
    v19 = -[EPStyleFlattener copyFlattenBorder:borders:differentialBorders:flag:precedence:row:column:](self, "copyFlattenBorder:borders:differentialBorders:flag:precedence:row:column:", 3, v14, v15, (a5 >> 3) & 1, a6, v9, v28);
    LODWORD(v29) = a8;
    v20 = -[EPStyleFlattener copyFlattenBorder:borders:differentialBorders:flag:precedence:row:column:](self, "copyFlattenBorder:borders:differentialBorders:flag:precedence:row:column:", 4, v14, v15, 1, a6, v9, v29);
    v21 = [EDBorders alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
    v23 = -[EDBorders initWithResources:](v21, "initWithResources:", WeakRetained);

    -[EDBorders setLeftBorder:](v23, "setLeftBorder:", v16);
    -[EDBorders setRightBorder:](v23, "setRightBorder:", v17);
    -[EDBorders setTopBorder:](v23, "setTopBorder:", v18);
    -[EDBorders setBottomBorder:](v23, "setBottomBorder:", v19);
    -[EDBorders setDiagonalBorder:](v23, "setDiagonalBorder:", v20);

  }
  else
  {
    v23 = (EDBorders *)v14;
  }

  return v23;
}

- (id)copyFlattenBorder:(int)a3 borders:(id)a4 differentialBorders:(id)a5 flag:(BOOL)a6 precedence:(unint64_t)a7 row:(int)a8 column:(int)a9
{
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  EDCellHeader *v18;
  EDResources *WeakRetained;
  EPBorder *v20;
  EPBorder *v21;
  EPBorder *v22;
  void *v23;
  uint64_t v24;
  EPBorder *v25;
  EPBorder *v26;
  EDBorder *v27;
  id v28;
  EPBorder *v29;
  id v30;
  unint64_t v32;
  id v33;

  v9 = *(_QWORD *)&a8;
  v32 = a7;
  v10 = a6;
  v14 = a9;
  v33 = a4;
  v15 = a5;
  v16 = 0;
  v17 = 0;
  switch(a3)
  {
    case 0:
      v14 = (a9 - 1);
      if (a9 >= 1)
        goto LABEL_8;
      v16 = 0;
      v17 = 0;
LABEL_9:
      objc_msgSend(v33, "leftBorder", v32);
      v20 = (EPBorder *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "rightBorder");
      v21 = (EPBorder *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v15, "leftBorder");
      else
LABEL_19:
        objc_msgSend(v15, "verticalBorder");
      goto LABEL_23;
    case 1:
      v14 = (a9 + 1);
      goto LABEL_8;
    case 2:
      if ((int)v9 <= 0)
      {
        v16 = 0;
        v17 = 0;
LABEL_21:
        objc_msgSend(v33, "topBorder", v32);
        v20 = (EPBorder *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bottomBorder");
        v21 = (EPBorder *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v15, "topBorder");
        else
LABEL_24:
          objc_msgSend(v15, "horizontalBorder");
      }
      else
      {
        v9 = (v9 - 1);
LABEL_8:
        v18 = -[EPStyleFlattener cellWithSetupStyleAtRowNumber:columnNumber:](self, "cellWithSetupStyleAtRowNumber:columnNumber:", v9, v14, v32);
        WeakRetained = (EDResources *)objc_loadWeakRetained((id *)&self->super.mResources);
        styleForEDCell(v18, WeakRetained);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "borders");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        switch(a3)
        {
          case 0:
            goto LABEL_9;
          case 1:
            objc_msgSend(v33, "rightBorder");
            v20 = (EPBorder *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "leftBorder");
            v21 = (EPBorder *)objc_claimAutoreleasedReturnValue();
            if (!v10)
              goto LABEL_19;
            objc_msgSend(v15, "rightBorder");
            break;
          case 2:
            goto LABEL_21;
          case 3:
            objc_msgSend(v33, "bottomBorder");
            v20 = (EPBorder *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "topBorder");
            v21 = (EPBorder *)objc_claimAutoreleasedReturnValue();
            if (!v10)
              goto LABEL_24;
            objc_msgSend(v15, "bottomBorder");
            break;
          case 4:
            goto LABEL_11;
          default:
            v22 = 0;
            goto LABEL_37;
        }
      }
LABEL_23:
      v24 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v24;
      v25 = v20;
      v22 = v21;
      if (v24)
      {
        if (v21 && -[EDBorder type](v21, "type"))
        {
          if (!v20 || !-[EDBorder type](v20, "type"))
          {
            v20 = v21;

            v22 = v20;
          }
        }
        else if (!v20)
        {
          goto LABEL_41;
        }
LABEL_39:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (-[EPBorder precedence](v20, "precedence") > v32)
          {
LABEL_41:
            v29 = [EPBorder alloc];
            v30 = objc_loadWeakRetained((id *)&self->super.mResources);
            v26 = -[EPBorder initWithBorder:precedence:resources:](v29, "initWithBorder:precedence:resources:", v23, v32, v30);

            goto LABEL_44;
          }
        }
        else if (!-[EDBorder type](v20, "type"))
        {
          goto LABEL_41;
        }
        v20 = v20;

        v26 = v20;
      }
      else
      {
LABEL_35:
        if (v20)
        {
          v20 = v20;
          v26 = v20;
        }
        else
        {
LABEL_37:
          v27 = [EDBorder alloc];
          v28 = objc_loadWeakRetained((id *)&self->super.mResources);
          v26 = -[EDBorder initWithResources:](v27, "initWithResources:", v28);

          v20 = 0;
        }
      }
LABEL_44:

      return v26;
    case 3:
      v9 = (v9 + 1);
      goto LABEL_8;
    case 4:
LABEL_11:
      objc_msgSend(v33, "diagonalBorder", v32);
      v20 = (EPBorder *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "diagonalBorder");
      v22 = 0;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
        goto LABEL_35;
      if (!v20)
        goto LABEL_41;
      goto LABEL_39;
    default:
      goto LABEL_8;
  }
}

- (id)copyFlattenFont:(id)a3 differentialFont:(id)a4
{
  id v6;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v8 = (id)objc_msgSend(v6, "copy");
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
      objc_msgSend(WeakRetained, "styles");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "defaultWorkbookStyle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "font");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v12, "copy");

    }
    objc_msgSend(v7, "color");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorReference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 && (!v14 || objc_msgSend(v14, "themeIndex") == 1))
      objc_msgSend(v8, "setColor:", v13);
    if (objc_msgSend(v7, "isBoldOverridden") && objc_msgSend(v7, "isBold"))
      objc_msgSend(v8, "setBold:", 1);
    if (objc_msgSend(v7, "isItalicOverridden") && objc_msgSend(v7, "isItalic"))
      objc_msgSend(v8, "setItalic:", 1);
    if (objc_msgSend(v7, "isStrikeOverridden") && objc_msgSend(v7, "isStrike"))
      objc_msgSend(v8, "setStrike:", 1);
    if (objc_msgSend(v7, "isUnderlineOverridden")
      && (!objc_msgSend(v6, "isUnderlineOverridden") || !objc_msgSend(v6, "underline")))
    {
      objc_msgSend(v8, "setUnderline:", objc_msgSend(v7, "underline"));
    }

  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (void)clearCache
{
  ECIntToTwoIntKeyCache *mFlattenedStyleCache;
  ECIntToTwoIntKeyCache *mFillCache;

  mFlattenedStyleCache = self->mFlattenedStyleCache;
  self->mFlattenedStyleCache = 0;

  mFillCache = self->mFillCache;
  self->mFillCache = 0;

  self->mFirstRow = 0;
  self->mLastRow = 0;
  self->mFirstColumn = 0;
  self->mLastColumn = 0;
}

- (id)wrapDifferentialStyleInATableStyleElement:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  +[EDTableStyleElement tableStyleElementWithResources:](EDTableStyleElement, "tableStyleElementWithResources:", WeakRetained);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setType:", v4);
  objc_msgSend(v8, "setDifferentialStyle:", v6);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFillCache, 0);
  objc_storeStrong((id *)&self->mFlattenedStyleCache, 0);
  objc_storeStrong((id *)&self->mRanges, 0);
  objc_storeStrong((id *)&self->mKeys, 0);
  objc_storeStrong((id *)&self->mColumnInfos, 0);
  objc_storeStrong((id *)&self->mCurrentRowBlock, 0);
  objc_storeStrong((id *)&self->mRowBlocks, 0);
  objc_storeStrong((id *)&self->mWorksheet, 0);
}

- (unint64_t)flattenFillIndex:(unint64_t)a3 differentialFill:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  ECIntToTwoIntKeyCache *mFillCache;
  ECIntToTwoIntKeyCache *v10;
  ECIntToTwoIntKeyCache *v11;
  void *v12;
  int v13;
  unsigned int v14;
  EDPatternFill *v15;
  uint64_t v16;
  void *v17;
  id v18;
  EDPatternFill *v19;
  unint64_t v20;
  void *v22;
  id v23;
  uint64_t v24;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  objc_msgSend(WeakRetained, "fills");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    mFillCache = self->mFillCache;
    if (!mFillCache)
    {
      v10 = objc_alloc_init(ECIntToTwoIntKeyCache);
      v11 = self->mFillCache;
      self->mFillCache = v10;

      mFillCache = self->mFillCache;
    }
    v24 = -1;
    if (-[ECIntToTwoIntKeyCache integerIsPresentForKey1:key2:outValue:](mFillCache, "integerIsPresentForKey1:key2:outValue:", v6, a3, &v24))
    {
      goto LABEL_17;
    }
    if (a3 == -1)
      goto LABEL_8;
    objc_msgSend(v8, "objectAtIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "type");

      if (!v13)
      {
LABEL_8:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = v6;
          v14 = objc_msgSend(v23, "type");
          v15 = [EDPatternFill alloc];
          if (v14 <= 1)
            v16 = 1;
          else
            v16 = v14;
          objc_msgSend(v23, "backColor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "foreColor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_loadWeakRetained((id *)&self->super.mResources);
          v19 = -[EDPatternFill initWithType:foreColor:backColor:resources:](v15, "initWithType:foreColor:backColor:resources:", v16, v22, v17, v18);

          v24 = objc_msgSend(v8, "addOrEquivalentObject:", v19);
          v20 = v24;
        }
        else
        {
          v20 = objc_msgSend(v8, "indexOfObject:", v6);
          v24 = v20;
        }
        goto LABEL_16;
      }
    }
    else
    {
      objc_opt_class();
      objc_opt_isKindOfClass();

    }
    v24 = a3;
    v20 = a3;
LABEL_16:
    -[ECIntToTwoIntKeyCache setObject:forKey1:key2:](self->mFillCache, "setObject:forKey1:key2:", v20, v6, a3);
LABEL_17:
    a3 = v24;
  }

  return a3;
}

- (id)collectionFromWorksheet:(id)a3
{
  return 0;
}

- (id)styleFromObject:(id)a3
{
  return 0;
}

- (id)newExtractedKeys:(id)a3 from:(id)a4 parent:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  EDKeyedCollection *v11;
  EDKeyedCollection *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
    v11 = (EDKeyedCollection *)objc_msgSend(v9, "copy");
  else
    v11 = objc_alloc_init(EDKeyedCollection);
  v12 = v11;
  v13 = objc_msgSend(v7, "count");
  if (v13)
  {
    for (i = 0; i != v13; ++i)
    {
      objc_msgSend(v7, "objectAtIndex:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectWithKey:", (int)objc_msgSend(v15, "intValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        -[EDKeyedCollection addObject:](v12, "addObject:", v16);

    }
  }

  return v12;
}

- (id)newExtractedGlobalStyleElements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[EPStyleFlattener newExtractedKeys:from:parent:](self, "newExtractedKeys:from:parent:", v7, v4, 0);
  return v8;
}

- (id)newExtractedRowStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5
{
  return 0;
}

- (id)newExtractedCellStyleElements:(id)a3 parentScope:(id)a4 row:(int)a5 column:(int)a6
{
  return 0;
}

- (id)keysInTheOrderTheyShouldBeApplied
{
  return 0;
}

- (int)borderFlagsForStyleType:(int)a3 row:(int)a4 column:(int)a5
{
  return 0;
}

@end
