@implementation EPFormulaCleaner

- (void)cleanFormula:(id)a3 sheet:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6)
    -[EPFormulaCleaner cleanFormula:sheet:name:](self, "cleanFormula:sheet:name:", v7, v6, 0);

}

- (void)cleanFormula:(id)a3 sheet:(id)a4 name:(id)a5
{
  id v9;
  id v10;
  id v11;
  EDFormula *v12;
  EDFormula *mTokensToClean;
  EDFormula *v14;
  uint64_t i;
  int v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[EPFormulaCleaner prepareToProcessFormula:sheet:name:](self, "prepareToProcessFormula:sheet:name:", v9, v10, v11);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = -[EPFormulaCleaner newFormulaToCleanFromSharedFormula:](self, "newFormulaToCleanFromSharedFormula:", v9);
    mTokensToClean = self->mTokensToClean;
    self->mTokensToClean = v12;

    v14 = self->mTokensToClean;
    if (!v14)
      goto LABEL_12;
  }
  else
  {
    objc_storeStrong((id *)&self->mTokensToClean, a3);
    v14 = self->mTokensToClean;
  }
  if (-[EDFormula tokenCount](v14, "tokenCount") || objc_msgSend(v11, "isInternalFunction"))
  {
    for (i = 0;
          i < -[EDFormula tokenCount](self->mTokensToClean, "tokenCount");
          i = (i + v16 + 1))
    {
      v16 = 0;
      if (!-[EPFormulaCleaner cleanTokenAtIndex:tokenOffset:](self, "cleanTokenAtIndex:tokenOffset:", i, &v16))
        goto LABEL_12;
    }
    objc_msgSend(v9, "setCleaned:", 1);
    -[EPFormulaCleaner reset](self, "reset");
  }
LABEL_12:

}

- (void)prepareToProcessFormula:(id)a3 sheet:(id)a4 name:(id)a5
{
  id v9;
  id v10;
  EDFormula *mTokensToClean;
  id v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  -[EPFormulaCleaner reset](self, "reset");
  objc_storeStrong((id *)&self->mFormula, a3);
  mTokensToClean = self->mTokensToClean;
  self->mTokensToClean = 0;

  objc_storeStrong((id *)&self->mCurrentSheet, a4);
  objc_storeStrong((id *)&self->mParentName, a5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v13;
    if ((objc_msgSend(v12, "isBaseFormula") & 1) == 0)
    {
      self->mRowOffset = objc_msgSend(v12, "rowBaseOrOffset");
      self->mColumnOffset = objc_msgSend(v12, "columnBaseOrOffset");
    }

  }
}

- (void)reset
{
  EDSheet *mCurrentSheet;
  EDFormula *mFormula;
  EDFormula *mTokensToClean;
  EDName *mParentName;
  EDRowBlocks *mBaseFormulaRowBlocks;

  mCurrentSheet = self->mCurrentSheet;
  self->mCurrentSheet = 0;

  mFormula = self->mFormula;
  self->mFormula = 0;

  mTokensToClean = self->mTokensToClean;
  self->mTokensToClean = 0;

  mParentName = self->mParentName;
  self->mParentName = 0;

  self->mRowOffset = 0;
  self->mColumnOffset = 0;
  -[EDRowBlocks unlock](self->mBaseFormulaRowBlocks, "unlock");
  mBaseFormulaRowBlocks = self->mBaseFormulaRowBlocks;
  self->mBaseFormulaRowBlocks = 0;

}

- (BOOL)cleanRef:(unsigned int)a3 updateSheet:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v6;
  int v8;
  BOOL v9[2];
  int v10[2];

  v4 = a4;
  *(_QWORD *)v10 = 0;
  *(_WORD *)v9 = 0;
  v8 = 0;
  extractDataFromPtgRefBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", *(_QWORD *)&a3, &v8), &v10[1], &v9[1], v10, v9);
  v6 = -[EPFormulaCleaner isReferenceValidInLassoForRow:rowRelative:column:columnRelative:](self, "isReferenceValidInLassoForRow:rowRelative:column:columnRelative:", v10[1], v9[1], v10[0], v9[0]);
  if (v6 && v4)
    -[EPFormulaCleaner updateSheet:row:rowRelative:column:columnRelative:](self, "updateSheet:row:rowRelative:column:columnRelative:", self->mCurrentSheet, v10[1], v9[1], v10[0], v9[0]);
  return v6;
}

- (BOOL)isReferenceValidInLassoForRow:(int)a3 rowRelative:(BOOL)a4 column:(int)a5 columnRelative:(BOOL)a6
{
  BOOL v7;
  BOOL v8;
  int v10;
  int v11;

  v10 = a5;
  v11 = a3;
  -[EPFormulaCleaner addOffsetsToRow:rowRelative:column:columnRelative:](self, "addOffsetsToRow:rowRelative:column:columnRelative:", &v11, a4, &v10, a6);
  v7 = v11 < 500001 && v10 < 500001;
  v8 = v7;
  if (!v7)
    -[EPFormulaCleaner reportWarning:](self, "reportWarning:", 10);
  return v8;
}

- (void)addOffsetsToRow:(int *)a3 rowRelative:(BOOL)a4 column:(int *)a5 columnRelative:(BOOL)a6
{
  if (!a4)
  {
    if (!a6)
      return;
LABEL_5:
    *a5 += self->mColumnOffset;
    return;
  }
  *a3 += self->mRowOffset;
  if (a6)
    goto LABEL_5;
}

- (void)updateSheet:(id)a3 row:(int)a4 rowRelative:(BOOL)a5 column:(int)a6 columnRelative:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  EDName *mParentName;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;

  v7 = a7;
  v8 = a5;
  v15 = a6;
  v16 = a4;
  v10 = a3;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EPFormulaCleaner addOffsetsToRow:rowRelative:column:columnRelative:](self, "addOffsetsToRow:rowRelative:column:columnRelative:", &v16, v8, &v15, v7);
      -[EDFormula updateContainsRelativeReferences:](self->mFormula, "updateContainsRelativeReferences:", v8 | v7);
      mParentName = self->mParentName;
      if (mParentName)
      {
        v13 = v15;
        v12 = v16;
        -[EDName maxWorksheetReferences](mParentName, "maxWorksheetReferences");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[EPFormulaCleaner updateWorksheet:row:column:inDictionary:](self, "updateWorksheet:row:column:inDictionary:", v10, v12, v13, v14);
      }
      else
      {
        objc_msgSend(v10, "maxCellReferencedInFormulas");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "unionWithRow:column:", v16, v15);
      }

    }
  }

}

- (BOOL)cleanFuncVar:(unsigned int)a3
{
  int v4;

  v4 = 0;
  return -[EPFormulaCleaner checkFunctionId:tokenIndex:](self, "checkFunctionId:tokenIndex:", *(unsigned __int16 *)(-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", *(_QWORD *)&a3, &v4)+ 4), *(_QWORD *)&a3);
}

- (BOOL)checkFunctionId:(int)a3 tokenIndex:(unsigned int)a4
{
  return 1;
}

- (id)newFormulaToCleanFromSharedFormula:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  EDFormula *v7;
  void *v8;
  void *v9;
  EDFormula *v10;

  v4 = a3;
  -[EDSheet rowBlocks](self->mCurrentSheet, "rowBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "warningWithRowBlocks:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "unlock");
  if (v6)
  {
    v7 = 0;
  }
  else if (objc_msgSend(v4, "isBaseFormula"))
  {
    v7 = (EDFormula *)v4;
  }
  else
  {
    -[EDSheet rowBlocks](self->mCurrentSheet, "rowBlocks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "baseFormulaWithRowBlocks:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isContainsRelativeReferences") & 1) != 0
      || objc_msgSend(v9, "isCleanedWithEvaluationStack"))
    {
      objc_storeStrong((id *)&self->mBaseFormulaRowBlocks, v8);
      v10 = -[EDFormula initWithFormula:]([EDFormula alloc], "initWithFormula:", v9);

      v7 = v10;
      v9 = v7;
    }
    else
    {
      objc_msgSend(v8, "unlock");
      v7 = 0;
    }

  }
  return v7;
}

- (BOOL)cleanArea:(unsigned int)a3 updateSheet:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v6;
  BOOL *v8;
  BOOL *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  BOOL v13[2];
  BOOL v14[2];
  int v15[2];
  int v16;
  int v17;

  v4 = a4;
  v17 = 0;
  v16 = 0;
  *(_QWORD *)v15 = 0;
  *(_WORD *)v14 = 0;
  *(_WORD *)v13 = 0;
  v12 = 0;
  extractDataFromPtgAreaBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", *(_QWORD *)&a3, &v12), &v17, &v14[1], &v16, v14, &v15[1], &v13[1], v15, v13);
  LOBYTE(v10) = v13[0];
  HIDWORD(v8) = v15[0];
  LOBYTE(v8) = v13[1];
  v6 = -[EPFormulaCleaner isReferenceValidInLassoForSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:](self, "isReferenceValidInLassoForSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:", self->mCurrentSheet, v17, v14[1], v16, v14[0], v15[1], v8, v10);
  if (v6 && v4)
  {
    LOBYTE(v11) = v13[0];
    HIDWORD(v9) = v15[0];
    LOBYTE(v9) = v13[1];
    -[EPFormulaCleaner updateSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:](self, "updateSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:", self->mCurrentSheet, v17, v14[1], v16, v14[0], v15[1], v9, v11);
  }
  return v6;
}

- (BOOL)isThereContentOutsideOfLassoBoundsForSheet:(id)a3 rowMin:(int)a4 rowMax:(int)a5 columnMin:(int)a6 columnMax:(int)a7
{
  return 0;
}

- (BOOL)cleanFunc:(unsigned int)a3
{
  int v4;

  v4 = 0;
  return -[EPFormulaCleaner checkFunctionId:tokenIndex:](self, "checkFunctionId:tokenIndex:", *(unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", *(_QWORD *)&a3, &v4), *(_QWORD *)&a3);
}

- (BOOL)isObjectSupported:(id)a3
{
  id v3;
  id v4;
  int v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (objc_msgSend(v4, "isSupportedFormula"))
      v5 = objc_msgSend(v4, "isCleaned") ^ 1;
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)cleanArea3D:(unsigned int)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  int *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  BOOL v16[2];
  BOOL v17[2];
  int v18;
  int v19[2];
  unsigned int v20[2];

  *(_QWORD *)v19 = 0;
  *(_QWORD *)v20 = 0;
  v18 = 0;
  *(_WORD *)v17 = 0;
  *(_WORD *)v16 = 0;
  v15 = 0;
  extractDataFromPtgArea3DBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", *(_QWORD *)&a3, &v15), &v20[1], (int *)v20, &v17[1], &v19[1], v17, v19, &v16[1], &v18, v16);
  v4 = 0;
  if (-[EPFormulaCleaner isLinkReferenceIndexSupported:allowExternal:](self, "isLinkReferenceIndexSupported:allowExternal:", v20[1], 0))
  {
    -[EPFormulaCleaner worksheetsFromLinkReferenceIndex:](self, "worksheetsFromLinkReferenceIndex:", v20[1]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "count"))
    {
      v7 = objc_msgSend(v6, "count");
      if (v7)
      {
        v4 = 0;
        v8 = 0;
        while (1)
        {
          objc_msgSend(v6, "objectAtIndex:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v13) = v16[0];
          HIDWORD(v11) = v18;
          LOBYTE(v11) = v16[1];
          if (!-[EPFormulaCleaner isReferenceValidInLassoForSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:](self, "isReferenceValidInLassoForSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:", v9, v20[0], v17[1], v19[1], v17[0], v19[0], v11, v13))break;
          LOBYTE(v14) = v16[0];
          HIDWORD(v12) = v18;
          LOBYTE(v12) = v16[1];
          -[EPFormulaCleaner updateSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:](self, "updateSheet:rowMin:rowMinRelative:rowMax:rowMaxRelative:columnMin:columnMinRelative:columnMax:columnMaxRelative:", v9, v20[0], v17[1], v19[1], v17[0], v19[0], v12, v14);

          v4 = ++v8 >= v7;
          if (v7 == v8)
            goto LABEL_8;
        }

      }
      else
      {
LABEL_8:
        v4 = 1;
      }
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (BOOL)isLinkReferenceIndexSupported:(unsigned int)a3 allowExternal:(BOOL)a4
{
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  BOOL v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v19;
  void *v20;
  unint64_t v21;

  WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  objc_msgSend(WeakRetained, "links");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "referenceAtIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v8, "linkAtIndex:", objc_msgSend(v9, "linkIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "type");
    v13 = v12 == 2 && a4;
    if ((v12 & 0xFFFFFFFD) == 1 || v13)
    {
      v15 = objc_msgSend(v10, "firstSheetIndex");
      v16 = objc_msgSend(v10, "lastSheetIndex");
      v17 = v16;
      if (v15 != -1 && v16 != -1)
      {
        if ((objc_msgSend(v10, "isWorkbookLevelReference") & 1) != 0)
        {
          v14 = 1;
LABEL_24:

          goto LABEL_25;
        }
        v19 = objc_loadWeakRetained((id *)&self->super.mWorkbook);
        objc_msgSend(v19, "mappingContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "mappingInfoCount");

        if (v12 != 1 || v15 <= v21)
        {
          v14 = 1;
          if (v12 != 1 || v15 == v17 || v17 <= v21)
            goto LABEL_24;
        }
      }
      -[EPFormulaCleaner reportWarning:](self, "reportWarning:", 6);
    }
    else
    {
      -[EPFormulaCleaner reportWarning:](self, "reportWarning:", 5);
    }
    v14 = 0;
    goto LABEL_24;
  }
  -[EPFormulaCleaner reportWarning:](self, "reportWarning:", 5);
  v14 = 0;
LABEL_25:

  return v14;
}

- (void)reportWarning:(int)a3
{
  -[EPFormulaCleaner reportWarning:parameter:](self, "reportWarning:parameter:", *(_QWORD *)&a3, 0);
}

- (void)reportWarning:(int)a3 parameter:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[EDFormula setWarning:](self->mFormula, "setWarning:", v4);
  if (v6)
    -[EDFormula setWarningParameter:](self->mFormula, "setWarningParameter:", v6);

}

- (BOOL)cleanRef3D:(unsigned int)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v12;
  BOOL v13[2];
  int v14;
  unsigned int v15[2];

  *(_QWORD *)v15 = 0;
  v14 = 0;
  *(_WORD *)v13 = 0;
  v12 = 0;
  extractDataFromPtgRef3DBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", *(_QWORD *)&a3, &v12), &v15[1], (int *)v15, &v13[1], &v14, v13);
  v4 = -[EPFormulaCleaner isLinkReferenceIndexSupported:allowExternal:](self, "isLinkReferenceIndexSupported:allowExternal:", v15[1], 0);
  LOBYTE(v5) = 0;
  if (v4)
  {
    v5 = -[EPFormulaCleaner isReferenceValidInLassoForRow:rowRelative:column:columnRelative:](self, "isReferenceValidInLassoForRow:rowRelative:column:columnRelative:", v15[0], v13[1], v14, v13[0]);
    if (v5)
    {
      -[EPFormulaCleaner worksheetsFromLinkReferenceIndex:](self, "worksheetsFromLinkReferenceIndex:", v15[1]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        if (objc_msgSend(v6, "count"))
        {
          v8 = objc_msgSend(v7, "count");
          if (v8)
          {
            v9 = 0;
            do
            {
              objc_msgSend(v7, "objectAtIndex:", v9);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              -[EPFormulaCleaner updateSheet:row:rowRelative:column:columnRelative:](self, "updateSheet:row:rowRelative:column:columnRelative:", v10, v15[0], v13[1], v14, v13[0]);

              ++v9;
            }
            while (v8 != v9);
          }
        }
      }

      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)applyMaxCellsInName:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "maxWorksheetReferences");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "maxCellReferencedInFormulas");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "unionWithReference:", v9);

      }
      ++v5;
    }
    while (v4 != v5);
  }
  objc_msgSend(v10, "removeAllObjects");

}

- (BOOL)checkSupportedAddInName:(id)a3 externalLink:(BOOL)a4
{
  return 1;
}

- (BOOL)cleanUnion:(unsigned int)a3
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  char i;
  char v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  char v16;
  char v17;
  char *v18;
  uint64_t v19;
  int v20;
  BOOL v21[2];
  BOOL v22[2];
  int v23;
  int v24[2];
  unsigned int v25[2];

  if (a3 >= 2)
  {
    v6 = *(_QWORD *)&a3;
    v4 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    for (i = 1; ; i = 0)
    {
      v11 = i;
      v12 = -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:](self, "useEvaluationStackToGetParameter:tokenIndex:", v4, v6);
      if ((_DWORD)v12 == -1)
        goto LABEL_2;
      v13 = v12;
      v14 = -[EDFormula tokenTypeAtIndex:](self->mTokensToClean, "tokenTypeAtIndex:", v12);
      v15 = v14;
      v16 = v14 - 16;
      if ((v14 - 16) > 0x3D)
        goto LABEL_10;
      if (((1 << v16) & 0x3030000030300000) != 0)
        goto LABEL_16;
      if (((1 << v16) & 0xC0000000000) == 0)
        break;
LABEL_13:
      if ((v8 & 1) != 0)
        goto LABEL_2;
      *(_QWORD *)v24 = 0;
      *(_QWORD *)v25 = 0;
      v23 = 0;
      *(_WORD *)v22 = 0;
      *(_WORD *)v21 = 0;
      v20 = 0;
      v18 = -[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v13, &v20);
      if (v15 == 58)
        extractDataFromPtgRef3DBuffer((unsigned __int16 *)v18, &v25[1], (int *)v25, &v22[1], v24, &v21[1]);
      else
        extractDataFromPtgArea3DBuffer((unsigned __int16 *)v18, &v25[1], (int *)v25, &v22[1], &v24[1], v22, v24, &v21[1], &v23, v21);
      v19 = v25[1];
      if ((v9 & 1) != 0)
      {
        v19 = v7;
        if ((_DWORD)v7 != v25[1])
          goto LABEL_2;
      }
      v8 = 0;
      v9 = 1;
      v7 = v19;
LABEL_22:
      v4 = 1;
      if ((v11 & 1) == 0)
        return v4;
    }
    if (v14 == 16)
      goto LABEL_22;
LABEL_10:
    v17 = v14 - 90;
    if ((v14 - 90) > 0x21)
      goto LABEL_2;
    if (((1 << v17) & 0xC0C00) != 0)
    {
LABEL_16:
      if ((v9 & 1) != 0)
        goto LABEL_2;
      v9 = 0;
      v8 = 1;
      goto LABEL_22;
    }
    if (((1 << v17) & 0x300000003) == 0)
      goto LABEL_2;
    goto LABEL_13;
  }
LABEL_2:
  -[EPFormulaCleaner reportWarning:](self, "reportWarning:", 1);
  LOBYTE(v4) = 0;
  return v4;
}

- (unsigned)useEvaluationStackToGetParameter:(unsigned int)a3 tokenIndex:(unsigned int)a4
{
  void *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;

  +[EDTokenTree buildSubtree:formula:](EDTokenTree, "buildSubtree:formula:", *(_QWORD *)&a4, self->mTokensToClean);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstChild");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = a3 + 1;
    v8 = (void *)v6;
    while (--v7)
    {
      objc_msgSend(v8, "sibling");
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
      if (!v9)
        goto LABEL_7;
    }
    v10 = objc_msgSend(v8, "tokenIndex");
  }
  else
  {
    v8 = 0;
LABEL_7:
    v10 = -1;
  }

  return v10;
}

- (BOOL)cleanArray:(unsigned int)a3
{
  uint64_t v3;
  char *v5;
  int v6;
  int v7;
  char *v8;
  int v10;

  v3 = *(_QWORD *)&a3;
  v10 = 0;
  v5 = -[EDFormula extendedDataForTokenAtIndex:extendedDataIndex:length:](self->mFormula, "extendedDataForTokenAtIndex:extendedDataIndex:length:", *(_QWORD *)&a3, 0, &v10);
  if (!v5)
    return 1;
  v6 = *(_DWORD *)v5;
  if (*(int *)v5 < 1)
    return 1;
  v7 = 0;
  while (1)
  {
    v8 = -[EDFormula extendedDataForTokenAtIndex:extendedDataIndex:length:](self->mFormula, "extendedDataForTokenAtIndex:extendedDataIndex:length:", v3, (v7 + 2), &v10);
    if (v8)
    {
      if (*v8 == 16)
        break;
    }
    if (v6 == ++v7)
      return 1;
  }
  -[EPFormulaCleaner reportWarning:](self, "reportWarning:", 6);
  return 0;
}

- (void)cleanFormula:(id)a3 name:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6)
    -[EPFormulaCleaner cleanFormula:sheet:name:](self, "cleanFormula:sheet:name:", v7, 0, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNameCircularReferenceTestCache, 0);
  objc_storeStrong((id *)&self->mNameArrayedTestCache, 0);
  objc_storeStrong((id *)&self->mBaseFormulaRowBlocks, 0);
  objc_storeStrong((id *)&self->mParentName, 0);
  objc_storeStrong((id *)&self->mTokensToClean, 0);
  objc_storeStrong((id *)&self->mFormula, 0);
  objc_storeStrong((id *)&self->mCurrentSheet, 0);
}

- (BOOL)cleanTokenAtIndex:(unsigned int)a3 tokenOffset:(int *)a4
{
  uint64_t v5;
  int v7;
  BOOL result;
  EPFormulaCleaner *v9;
  uint64_t v10;
  EPFormulaCleaner *v11;
  uint64_t v12;
  uint64_t v13;
  EPFormulaCleaner *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_QWORD *)&a3;
  *a4 = 0;
  v7 = -[EDFormula tokenTypeAtIndex:](self->mTokensToClean, "tokenTypeAtIndex:") - 1;
  result = 1;
  switch(v7)
  {
    case 0:
    case 1:
    case 45:
    case 46:
    case 77:
    case 78:
    case 109:
    case 110:
      v9 = self;
      v10 = 2;
      goto LABEL_4;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 24:
    case 28:
    case 29:
    case 30:
    case 37:
    case 38:
    case 39:
    case 40:
    case 69:
    case 70:
    case 71:
    case 72:
    case 87:
    case 101:
    case 102:
    case 103:
    case 104:
    case 119:
      return result;
    case 15:
      return -[EPFormulaCleaner cleanUnion:](self, "cleanUnion:", v5);
    case 16:
      return -[EPFormulaCleaner cleanRange:tokenOffset:](self, "cleanRange:tokenOffset:", v5, a4);
    case 23:
      v9 = self;
      v10 = 3;
      goto LABEL_4;
    case 27:
    case 41:
    case 42:
    case 59:
    case 60:
    case 73:
    case 74:
    case 91:
    case 92:
    case 105:
    case 106:
    case 123:
    case 124:
      v9 = self;
      v10 = 6;
      goto LABEL_4;
    case 31:
    case 63:
    case 95:
      return -[EPFormulaCleaner cleanArray:](self, "cleanArray:", v5);
    case 32:
    case 64:
    case 96:
      return -[EPFormulaCleaner cleanFunc:](self, "cleanFunc:", v5);
    case 33:
    case 65:
    case 97:
      return -[EPFormulaCleaner cleanFuncVar:](self, "cleanFuncVar:", v5);
    case 34:
    case 66:
    case 98:
      return -[EPFormulaCleaner cleanName:tokenOffset:](self, "cleanName:tokenOffset:", v5, a4);
    case 35:
    case 67:
    case 99:
      v11 = self;
      v12 = v5;
      v13 = 1;
      goto LABEL_15;
    case 36:
    case 68:
    case 100:
      v14 = self;
      v15 = v5;
      v16 = 1;
      goto LABEL_17;
    case 43:
    case 75:
    case 107:
      v11 = self;
      v12 = v5;
      v13 = 0;
LABEL_15:
      result = -[EPFormulaCleaner cleanRef:updateSheet:](v11, "cleanRef:updateSheet:", v12, v13);
      break;
    case 44:
    case 76:
    case 108:
      v14 = self;
      v15 = v5;
      v16 = 0;
LABEL_17:
      result = -[EPFormulaCleaner cleanArea:updateSheet:](v14, "cleanArea:updateSheet:", v15, v16);
      break;
    case 56:
    case 88:
    case 120:
      result = -[EPFormulaCleaner cleanNameX:tokenOffset:](self, "cleanNameX:tokenOffset:", v5, a4);
      break;
    case 57:
    case 89:
    case 121:
      result = -[EPFormulaCleaner cleanRef3D:](self, "cleanRef3D:", v5);
      break;
    case 58:
    case 90:
    case 122:
      result = -[EPFormulaCleaner cleanArea3D:](self, "cleanArea3D:", v5);
      break;
    default:
      v9 = self;
      v10 = 1;
LABEL_4:
      -[EPFormulaCleaner reportWarning:](v9, "reportWarning:", v10);
      result = 0;
      break;
  }
  return result;
}

- (BOOL)isReferenceValidInLassoForSheet:(id)a3 rowMin:(int)a4 rowMinRelative:(BOOL)a5 rowMax:(int)a6 rowMaxRelative:(BOOL)a7 columnMin:(int)a8 columnMinRelative:(BOOL)a9 columnMax:(int)a10 columnMaxRelative:(BOOL)a11
{
  _BOOL8 v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v17;
  id v18;
  BOOL v19;
  _BOOL8 v20;
  BOOL v21;
  int v23;
  int v24;
  int v25;

  v12 = a7;
  v13 = *(_QWORD *)&a6;
  v14 = a5;
  v17 = a10;
  v18 = a3;
  v24 = v13;
  v25 = a4;
  v23 = a8;
  v19 = isRowReference(a8, v17);
  v20 = a11;
  if (v19 || isColumnReference(a4, v13))
  {
    -[EPFormulaCleaner addOffsetsToRow:rowRelative:column:columnRelative:](self, "addOffsetsToRow:rowRelative:column:columnRelative:", &v25, v14, &v23, a9);
    -[EPFormulaCleaner addOffsetsToRow:rowRelative:column:columnRelative:](self, "addOffsetsToRow:rowRelative:column:columnRelative:", &v24, v12, &a10, v20);
    if (v25 >= 500001 && v23 >= 500001
      || -[EPFormulaCleaner isThereContentOutsideOfLassoBoundsForSheet:rowMin:rowMax:columnMin:columnMax:](self, "isThereContentOutsideOfLassoBoundsForSheet:rowMin:rowMax:columnMin:columnMax:", v18))
    {
      -[EPFormulaCleaner reportWarning:](self, "reportWarning:", 10);
      v21 = 0;
    }
    else
    {
      v21 = 1;
    }
  }
  else
  {
    v21 = -[EPFormulaCleaner isReferenceValidInLassoForRow:rowRelative:column:columnRelative:](self, "isReferenceValidInLassoForRow:rowRelative:column:columnRelative:", v13, v12, v17, v20);
  }

  return v21;
}

- (void)updateSheet:(id)a3 rowMin:(int)a4 rowMinRelative:(BOOL)a5 rowMax:(int)a6 rowMaxRelative:(BOOL)a7 columnMin:(int)a8 columnMinRelative:(BOOL)a9 columnMax:(int)a10 columnMaxRelative:(BOOL)a11
{
  _BOOL8 v12;
  _BOOL4 v16;
  _BOOL4 v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v12 = a7;
  v24 = a3;
  v16 = isRowReference(a8, a10);
  v17 = isColumnReference(a4, a6);
  if (a10 >= 500000)
    v18 = 500000;
  else
    v18 = a10;
  if (v16)
    v19 = a6;
  else
    v19 = 0;
  if (v17)
    v20 = v18;
  else
    v20 = a10;
  if (!v17)
  {
    v19 = a6;
    v18 = 0;
  }
  if (v19 >= 500000)
    v21 = 500000;
  else
    v21 = v19;
  if (v16)
    v22 = v18;
  else
    v22 = v20;
  if (v16)
    v23 = v21;
  else
    v23 = v19;
  -[EPFormulaCleaner updateSheet:row:rowRelative:column:columnRelative:](self, "updateSheet:row:rowRelative:column:columnRelative:", v24, v23, v12, v22, a11);

}

- (BOOL)cleanName:(unsigned int)a3 tokenOffset:(int *)a4
{
  uint64_t v5;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  int v11;

  v5 = *(_QWORD *)&a3;
  v11 = 0;
  v7 = *(unsigned int *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", *(_QWORD *)&a3, &v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mWorkbook);
  v9 = objc_msgSend(WeakRetained, "indexOfSheet:", self->mCurrentSheet);

  return -[EPFormulaCleaner cleanName:nameIndex:sheetIndex:tokenOffset:](self, "cleanName:nameIndex:sheetIndex:tokenOffset:", v5, v7, v9, a4);
}

- (BOOL)cleanNameX:(unsigned int)a3 tokenOffset:(int *)a4
{
  uint64_t v5;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;

  v5 = *(_QWORD *)&a3;
  v21 = 0;
  v7 = -[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", *(_QWORD *)&a3, &v21);
  v8 = *(unsigned __int16 *)v7;
  v9 = *((unsigned __int16 *)v7 + 1);
  v10 = 0;
  if (-[EPFormulaCleaner isLinkReferenceIndexSupported:allowExternal:](self, "isLinkReferenceIndexSupported:allowExternal:", v8, 1))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
    objc_msgSend(WeakRetained, "links");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "referenceAtIndex:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "linkAtIndex:", objc_msgSend(v13, "linkIndex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "type");
    v16 = v15;
    if (v15 == 1)
    {
      v10 = -[EPFormulaCleaner cleanName:nameIndex:sheetIndex:tokenOffset:](self, "cleanName:nameIndex:sheetIndex:tokenOffset:", v5, v9, objc_msgSend(v13, "firstSheetIndex"), a4);
    }
    else if ((v15 & 0xFFFFFFFE) == 2)
    {
      objc_msgSend(v14, "externalNames");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count") <= v9)
      {
        -[EPFormulaCleaner reportWarning:](self, "reportWarning:", 5);
        v10 = 0;
      }
      else
      {
        objc_msgSend(v17, "objectAtIndex:", v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "string");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[EPFormulaCleaner checkSupportedAddInName:externalLink:](self, "checkSupportedAddInName:externalLink:", v19, v16 == 2);

      }
    }
    else
    {
      -[EPFormulaCleaner reportWarning:](self, "reportWarning:", 5);
      v10 = 0;
    }

  }
  return v10;
}

- (BOOL)cleanRange:(unsigned int)a3 tokenOffset:(int *)a4
{
  _BOOL8 v5;
  uint64_t v8;
  uint64_t i;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v14;
  int v15;

  *a4 = 0;
  if (a3 >= 2)
  {
    v8 = *(_QWORD *)&a3;
    v5 = 0;
LABEL_6:
    for (i = v5; ; i = 1)
    {
      v10 = i;
      v11 = -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:](self, "useEvaluationStackToGetParameter:tokenIndex:", i, v8);
      if ((_DWORD)v11 == -1)
        break;
      v12 = v11;
      v13 = -[EDFormula tokenTypeAtIndex:](self->mTokensToClean, "tokenTypeAtIndex:", v11);
      v14 = v13 - 17;
      if ((v13 - 17) > 0x3C)
        goto LABEL_14;
      if (((1 << v14) & 0x1818000018180000) == 0)
      {
        if (v13 != 17)
        {
          if (((1 << v14) & 0x3000000030000) != 0)
            goto LABEL_19;
LABEL_14:
          if ((v13 - 97) > 0xC)
            break;
          v15 = 1 << (v13 - 97);
          if ((v15 & 0x1818) == 0)
          {
            if ((v15 & 3) == 0)
              break;
LABEL_19:
            v5 = 1;
            if (!v10)
              goto LABEL_6;
            return v5;
          }
          goto LABEL_16;
        }
        if (!-[EPFormulaCleaner combineCellReferences:tokenOffset:](self, "combineCellReferences:tokenOffset:", v12, a4))goto LABEL_3;
      }
LABEL_16:
      if (v10)
      {
        if (v5)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        return -[EPFormulaCleaner combineCellReferences:tokenOffset:](self, "combineCellReferences:tokenOffset:", (*a4 + v8), a4);
      }
    }
  }
  -[EPFormulaCleaner reportWarning:](self, "reportWarning:", 1);
LABEL_3:
  LOBYTE(v5) = 0;
  return v5;
}

- (BOOL)combineCellReferences:(unsigned int)a3 tokenOffset:(int *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  BOOL v13;
  BOOL v14;
  _BOOL4 v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  unsigned __int16 v20;
  int v21;
  unsigned __int16 v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  BOOL v28;
  char v30;
  _WORD *v31;
  unsigned __int16 v32;
  unsigned __int16 v33;
  _BOOL4 v34;
  unsigned int v35;
  void *v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  if (a3 >= 2)
  {
    v6 = *(_QWORD *)&a3;
    if (-[EDFormula tokenCount](self->mTokensToClean, "tokenCount") > a3)
    {
      v7 = -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:](self, "useEvaluationStackToGetParameter:tokenIndex:", 0, v6);
      v8 = -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:](self, "useEvaluationStackToGetParameter:tokenIndex:", 1, v6);
      if ((_DWORD)v7 != -1)
      {
        v9 = v8;
        if ((_DWORD)v8 != -1)
        {
          v10 = -[EDFormula tokenTypeAtIndex:](self->mTokensToClean, "tokenTypeAtIndex:", v7);
          v11 = -[EDFormula tokenTypeAtIndex:](self->mTokensToClean, "tokenTypeAtIndex:", v9);
          v12 = v11;
          v13 = (v10 - 37) > 0x27 || ((1 << (v10 - 37)) & 0x8100000101) == 0;
          v34 = !v13 || v10 == 109 || v10 == 101;
          v14 = (v11 - 37) > 0x27 || ((1 << (v11 - 37)) & 0x8100000101) == 0;
          v15 = !v14 || v11 == 109 || v11 == 101;
          if ((v16 = v10 - 36, (v10 - 36) <= 0x29) && ((1 << v16) & 0x20100000101) != 0
            || v10 == 100
            || v10 == 108
            || v34)
          {
            if ((v17 = v11 - 36, (v11 - 36) <= 0x29) && ((1 << v17) & 0x20100000101) != 0
              || v11 == 100
              || v11 == 108
              || v15)
            {
              if (v16 <= 0x29 && ((1 << v16) & 0x20100000101) != 0 || v10 == 108 || (v35 = v7, v10 == 100))
              {
                if (v15)
                  v18 = v9;
                else
                  v18 = v7;
                v35 = v18;
              }
              +[EDFormula formula](EDFormula, "formula");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v36, "addToken:extendedDataLength:", 37, 8);
              if (v19)
              {
                v31 = (_WORD *)v19;
                v44 = -1;
                v45 = 0;
                v42 = -1;
                v43 = -1;
                v40 = -1;
                v41 = -1;
                v38 = -1;
                v39 = -1;
                v37 = -1;
                if (v16 <= 0x29 && ((1 << v16) & 0x20100000101) != 0 || v10 == 108 || v10 == 100)
                {
                  extractDataFromPtgRefBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v7, &v45), &v44, &v43);
                  v20 = v43 & 0xC000;
                  v21 = v43;
                  v42 = v44;
                  v43 = v43;
                  v32 = v20;
                  v33 = v20;
                }
                else
                {
                  extractDataFromPtgAreaBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v7, &v45), &v44, &v42, &v43, &v41);
                  v32 = v41 & 0xC000;
                  v33 = v43 & 0xC000;
                  v43 = v43;
                  v21 = v41;
                }
                v41 = v21;
                if (v17 <= 0x29 && ((1 << v17) & 0x20100000101) != 0 || v12 == 108 || v12 == 100)
                {
                  extractDataFromPtgRefBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v9, &v45), &v40, &v39);
                  v22 = v33;
                  if ((v39 & 0xC000) != v33)
                    goto LABEL_66;
                  v23 = v40;
                  v24 = v39;
                  v38 = v40;
                  v39 = v24;
                  v25 = v40;
                  v26 = v24;
                }
                else
                {
                  extractDataFromPtgAreaBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v9, &v45), &v40, &v38, &v39, &v37);
                  v22 = v33;
                  if ((v39 & 0xC000) != v33)
                    goto LABEL_66;
                  v30 = !v34;
                  if ((v37 & 0xC000) == v32)
                    v30 = 1;
                  if ((v30 & 1) == 0)
                    goto LABEL_66;
                  if (v16 <= 0x29 && ((1 << v16) & 0x20100000101) != 0 || v10 == 108 || v10 == 100)
                    v32 = v37 & 0xC000;
                  v24 = v39;
                  v39 = v39;
                  v26 = v37;
                  v25 = v40;
                  v23 = v38;
                }
                v46.origin.x = (double)v43;
                v46.origin.y = (double)v44;
                v46.size.width = (double)(v41 - v43 + 1);
                v37 = v26;
                v46.size.height = (double)(v42 - v44 + 1);
                v48.origin.x = (double)v24;
                v48.origin.y = (double)v25;
                v48.size.width = (double)(v26 - v24 + 1);
                v48.size.height = (double)(v23 - v25 + 1);
                v47 = CGRectUnion(v46, v48);
                *v31 = (int)v47.origin.y;
                v31[1] = (int)(v47.origin.y + v47.size.height + -1.0);
                v31[2] = v22 | (int)v47.origin.x;
                v31[3] = v32 | (int)(v47.origin.x + v47.size.width + -1.0);
              }
              if (-[EDFormula replaceTokenAtIndex:withFormula:formulaTokenIndex:](self->mTokensToClean, "replaceTokenAtIndex:withFormula:formulaTokenIndex:", v35, v36, 0))
              {
                -[EDFormula removeTokenAtIndex:](self->mTokensToClean, "removeTokenAtIndex:", v6);
                if (v35 == (_DWORD)v7)
                  v27 = v9;
                else
                  v27 = v7;
                -[EDFormula removeTokenAtIndex:](self->mTokensToClean, "removeTokenAtIndex:", v27);
                *a4 -= 2;
                v28 = 1;
                goto LABEL_67;
              }
LABEL_66:
              -[EPFormulaCleaner reportWarning:](self, "reportWarning:", 1);
              v28 = 0;
LABEL_67:

              return v28;
            }
          }
        }
      }
    }
  }
  -[EPFormulaCleaner reportWarning:](self, "reportWarning:", 1);
  return 0;
}

- (id)worksheetFromLinkReferenceIndex:(unsigned int)a3
{
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;

  v12 = -1;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  objc_msgSend(WeakRetained, "links", -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertLinkReferenceIndex:firstSheetIndex:lastSheetIndex:", a3, &v12, &v11);

  v7 = objc_loadWeakRetained((id *)&self->super.mWorkbook);
  objc_msgSend(v7, "sheetAtIndex:loadIfNeeded:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (id)worksheetsFromLinkReferenceIndex:(unsigned int)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  unint64_t v8;
  EDWorkbook **p_mWorkbook;
  id v10;
  void *v11;
  id v12;
  unint64_t v14;
  unint64_t v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -1;
  v15 = -1;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  objc_msgSend(WeakRetained, "links");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertLinkReferenceIndex:firstSheetIndex:lastSheetIndex:", a3, &v15, &v14);

  v8 = v15;
  if (v15 > v14)
  {
LABEL_5:
    v12 = v5;
  }
  else
  {
    p_mWorkbook = &self->super.mWorkbook;
    while (1)
    {
      v10 = objc_loadWeakRetained((id *)p_mWorkbook);
      objc_msgSend(v10, "sheetAtIndex:loadIfNeeded:", v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(v5, "addObject:", v11);

      if (++v8 > v14)
        goto LABEL_5;
    }

    v12 = 0;
  }

  return v12;
}

- (BOOL)cleanName:(unsigned int)a3 nameIndex:(unsigned int)a4 sheetIndex:(unint64_t)a5 tokenOffset:(int *)a6
{
  uint64_t v7;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *mNameArrayedTestCache;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  BOOL v29;
  int *v32;

  v7 = *(_QWORD *)&a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  objc_msgSend(WeakRetained, "names");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "sheetIndex");
  if (v12 != a5 && v12 != 0)
  {
    objc_msgSend(v11, "nameString", a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "string");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EPFormulaCleaner reportWarning:parameter:](self, "reportWarning:parameter:", 8, v23);
LABEL_29:

    goto LABEL_30;
  }
  objc_msgSend(v11, "formula");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isInternalFunction") && !objc_msgSend(v22, "tokenCount"))
  {
LABEL_35:
    v29 = 1;
    goto LABEL_31;
  }
  mNameArrayedTestCache = self->mNameArrayedTestCache;
  if (!mNameArrayedTestCache)
  {
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v16 = self->mNameArrayedTestCache;
    self->mNameArrayedTestCache = v15;

    mNameArrayedTestCache = self->mNameArrayedTestCache;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (v7 + 1), a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mNameArrayedTestCache, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedLongValue");

  if (v19)
  {
    v20 = (v19 - 1);
    if (v19 != 1)
    {
LABEL_12:
      objc_msgSend(v11, "nameString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "string");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[EPFormulaCleaner reportWarning:parameter:](self, "reportWarning:parameter:", v20, v21);
LABEL_28:

      goto LABEL_29;
    }
  }
  else
  {
    if (v22
      && objc_msgSend(v22, "isSupportedFormula")
      && (objc_msgSend(v22, "isContainsRelativeReferences") & 1) == 0
      && objc_msgSend(v22, "tokenTypeAtIndex:", 0))
    {
      if (objc_msgSend(v22, "tokenCount") < 2)
      {
        v20 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[EPFormulaCleaner isArrayedFormulaSupported:allowSimpleRanges:formulasBeingEvaluated:](self, "isArrayedFormulaSupported:allowSimpleRanges:formulasBeingEvaluated:", v22, 1, v24);

        if (v25)
          v20 = 0;
        else
          v20 = 9;
      }
    }
    else
    {
      v20 = 9;
    }
    v26 = self->mNameArrayedTestCache;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v20 + 1));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (v7 + 1));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v27, v28);

    if ((_DWORD)v20)
      goto LABEL_12;
  }
  if (-[EPFormulaCleaner doesNameIndexContainCircularReferences:sheetIndex:previousNameIndexes:](self, "doesNameIndexContainCircularReferences:sheetIndex:previousNameIndexes:", v7, a5, 0)|| !-[EDFormula replaceTokenAtIndex:withFormula:](self->mTokensToClean, "replaceTokenAtIndex:withFormula:", a3, v22))
  {
    objc_msgSend(v11, "nameString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "string");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EPFormulaCleaner reportWarning:parameter:](self, "reportWarning:parameter:", 9, v21);
    goto LABEL_28;
  }
  if (-[EDFormula tokenCount](self->mTokensToClean, "tokenCount") < 0x7D1)
  {
    if (*v32 >= 1)
      --*v32;
    -[EPFormulaCleaner applyMaxCellsInName:](self, "applyMaxCellsInName:", v11);
    -[EDFormula updateContainsRelativeReferences:](self->mFormula, "updateContainsRelativeReferences:", objc_msgSend(v22, "isContainsRelativeReferences"));
    -[EDFormula updateCleanedWithEvaluationStack:](self->mFormula, "updateCleanedWithEvaluationStack:", objc_msgSend(v22, "isCleanedWithEvaluationStack"));
    goto LABEL_35;
  }
  -[EPFormulaCleaner reportWarning:](self, "reportWarning:", 10);
LABEL_30:
  v29 = 0;
LABEL_31:

  return v29;
}

- (BOOL)checkCustomFunction:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  int v22;

  v3 = *(_QWORD *)&a3;
  v5 = -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:](self, "useEvaluationStackToGetParameter:tokenIndex:", 0, *(_QWORD *)&a3);
  if ((_DWORD)v5 == -1)
    return 1;
  v6 = v5;
  v7 = -[EDFormula tokenTypeAtIndex:](self->mTokensToClean, "tokenTypeAtIndex:", v5);
  if (v7 != 57 && v7 != 121 && v7 != 89)
    return 1;
  v22 = 0;
  v8 = -[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v6, &v22);
  v9 = *(unsigned __int16 *)v8;
  v10 = *((unsigned __int16 *)v8 + 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  objc_msgSend(WeakRetained, "links");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "referenceAtIndex:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "linkAtIndex:", objc_msgSend(v13, "linkIndex"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 && (objc_msgSend(v14, "type") == 3 || objc_msgSend(v15, "type") == 2))
  {
    objc_msgSend(v15, "externalNames");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count") <= v10)
    {
      v20 = 1;
    }
    else
    {
      objc_msgSend(v16, "objectAtIndex:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uppercaseString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "isEqualToString:", CFSTR("CONVERT"))
        && (-[EDFormula updateCleanedWithEvaluationStack:](self->mTokensToClean, "updateCleanedWithEvaluationStack:", 1), !-[EPFormulaCleaner useEvaluationStackToCheckFunctionId:functionName:tokenIndex:](self, "useEvaluationStackToCheckFunctionId:functionName:tokenIndex:", 255, v19, v3)))
      {
        -[EPFormulaCleaner reportWarning:parameter:](self, "reportWarning:parameter:", 11, v19);
        v20 = 0;
      }
      else
      {
        v20 = 1;
      }

    }
  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (void)updateWorksheet:(id)a3 row:(int)a4 column:(int)a5 inDictionary:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v11 = a3;
  v9 = a6;
  objc_msgSend(v9, "objectForKey:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[EDReference reference](EDReference, "reference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forUncopiedKey:", v10, v11);
  }
  objc_msgSend(v10, "unionWithRow:column:", v8, v7);

}

- (BOOL)useEvaluationStackToCheckFunctionId:(int)a3 functionName:(id)a4 tokenIndex:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  int v19;
  void *v20;
  BOOL v21;
  char v22;
  id v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  unsigned __int8 v29;
  char v30;
  char v31;
  char v32;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  v11 = 1;
  v32 = 1;
  if (a3 <= 147)
  {
    if ((a3 - 76) >= 2)
    {
      if (a3 == 111)
      {
        -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:](self, "useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:", 0, v5, 0, &v32);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = (int)objc_msgSend(v10, "intValue") < 127;
          goto LABEL_68;
        }
      }
      else
      {
        if (a3 != 121)
          goto LABEL_68;
        -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:](self, "useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:", 0, v5, 0, &v32);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v10;
          if (objc_msgSend(v10, "length"))
          {
            objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithRange:", 0, 127);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v12);
            v15 = v14;

            if (v13)
              v11 = 0;
            else
              v11 = v15 == objc_msgSend(v10, "length");

            goto LABEL_68;
          }
          goto LABEL_54;
        }
      }
LABEL_67:
      v11 = v32 != 0;
      goto LABEL_68;
    }
    goto LABEL_22;
  }
  if (a3 > 254)
  {
    if (a3 != 255)
    {
      if (a3 != 347)
        goto LABEL_68;
LABEL_22:
      -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:](self, "useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:", 0, v5, 1, &v32);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_67;
      v10 = v10;
      if (!isRowReference(objc_msgSend(v10, "firstColumn"), objc_msgSend(v10, "lastColumn"))
        && !isColumnReference(objc_msgSend(v10, "firstRow"), objc_msgSend(v10, "lastRow")))
      {
LABEL_54:
        v23 = v10;
LABEL_55:

        v10 = v23;
        goto LABEL_67;
      }

LABEL_51:
      v11 = 0;
      goto LABEL_68;
    }
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("CONVERT")))
    {
      v10 = 0;
      goto LABEL_67;
    }
    v31 = 0;
    v30 = 0;
    -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:](self, "useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:", 2, v5, 0, &v31);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:](self, "useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:", 3, v5, 0, &v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      v21 = v30 == 0;
    else
      v21 = 1;
    v22 = !v21;
    v32 = v22;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v10, "isEqualToString:", CFSTR("Pica")) & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v20, "isEqualToString:", CFSTR("Pica")) & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v10, "isEqualToString:", CFSTR("p")) & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v20, "isEqualToString:", CFSTR("p")) & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v10, "isEqualToString:", CFSTR("at")) & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v20, "isEqualToString:", CFSTR("at")) & 1) == 0)
              {

                v23 = 0;
                goto LABEL_55;
              }
            }
          }
        }
      }
    }

LABEL_50:
    v10 = 0;
    goto LABEL_51;
  }
  if (a3 != 148)
  {
    if (a3 != 219)
      goto LABEL_68;
    v16 = -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:](self, "useEvaluationStackToGetParameter:tokenIndex:", 4, v5);
    if ((_DWORD)v16 == -1 || -[EDFormula tokenTypeAtIndex:](self->mTokensToClean, "tokenTypeAtIndex:", v16) == 22)
    {
      -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:](self, "useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:", 3, v5, 0, &v32);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = objc_msgSend(v10, "BOOLValue");
        if (v32)
          v18 = v17;
        else
          v18 = 0;
        if ((v18 & 1) == 0)
          goto LABEL_51;
      }
      else if (!v32)
      {
        goto LABEL_51;
      }
      -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:](self, "useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:", 2, v5, 0, &v32);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (int)objc_msgSend(v27, "intValue") < 5;
        v10 = v27;
        goto LABEL_68;
      }
      v10 = v27;
      goto LABEL_67;
    }
    goto LABEL_50;
  }
  v19 = -[EPFormulaCleaner useEvaluationStackToGetParameterTokenType:tokenIndex:success:](self, "useEvaluationStackToGetParameterTokenType:tokenIndex:success:", 0, v5, &v32);
  v10 = 0;
  if (v19 <= 35)
  {
    v11 = 0;
    if (v19 == 8 || v19 == 23)
      goto LABEL_68;
    goto LABEL_67;
  }
  if (v19 != 36 && v19 != 68)
    goto LABEL_67;
  v29 = 1;
  -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:](self, "useEvaluationStackToGetParameter:tokenIndex:allReferencesAllowed:success:", 0, v5, 0, &v29);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  v26 = v29;
  if (v29 && v24)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = objc_msgSend(v25, "rangeOfString:", CFSTR("!")) == 0x7FFFFFFFFFFFFFFFLL;
      v29 = v26;
    }
    else
    {
      v26 = v29;
    }
  }
  v11 = v26 != 0;

  v10 = 0;
LABEL_68:

  return v11;
}

- (int)useEvaluationStackToGetParameterTokenType:(unsigned int)a3 tokenIndex:(unsigned int)a4 success:(BOOL *)a5
{
  uint64_t v7;

  *a5 = 1;
  v7 = -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:](self, "useEvaluationStackToGetParameter:tokenIndex:", *(_QWORD *)&a3, *(_QWORD *)&a4);
  if ((_DWORD)v7 != -1)
    return -[EDFormula tokenTypeAtIndex:](self->mTokensToClean, "tokenTypeAtIndex:", v7);
  *a5 = 0;
  return 0;
}

- (id)useEvaluationStackToGetParameter:(unsigned int)a3 tokenIndex:(unsigned int)a4 allReferencesAllowed:(BOOL)a5 success:(BOOL *)a6
{
  uint64_t v9;
  uint64_t v10;
  int v12;
  void *v13;
  void *v14;
  EDCellHeader *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  OcText *OcTextFromPtgStrBuffer;
  char *v23;
  unsigned int v24;
  uint64_t v25;
  EDResources *WeakRetained;
  void *v27;
  BOOL v28;
  BOOL v29[4];
  BOOL v30;
  BOOL v31[2];
  BOOL v32[4];
  BOOL v33[8];
  unsigned int v34;
  int v35;

  *a6 = 1;
  v9 = -[EPFormulaCleaner useEvaluationStackToGetParameter:tokenIndex:](self, "useEvaluationStackToGetParameter:tokenIndex:", *(_QWORD *)&a3, *(_QWORD *)&a4);
  if ((_DWORD)v9 == -1)
    return 0;
  v10 = v9;
  if (-[EDFormula tokenTypeAtIndex:](self->mTokensToClean, "tokenTypeAtIndex:", v9) == 22)
    return 0;
  v35 = 0;
  v12 = -[EDFormula tokenTypeAtIndex:](self->mTokensToClean, "tokenTypeAtIndex:", v10);
  v13 = 0;
  switch(v12)
  {
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 33:
    case 34:
    case 65:
    case 66:
    case 97:
    case 98:
      goto LABEL_5;
    case 22:
    case 24:
    case 26:
    case 27:
    case 28:
    case 32:
    case 35:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 67:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 99:
      return v13;
    case 23:
      OcTextFromPtgStrBuffer = extractOcTextFromPtgStrBuffer((unsigned __int8 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v10, &v35));
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", OcTextFromPtgStrBuffer);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (OcTextFromPtgStrBuffer)
        (*((void (**)(OcText *))OcTextFromPtgStrBuffer->var0 + 1))(OcTextFromPtgStrBuffer);
      return v13;
    case 25:
      if ((*(_WORD *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v10, &v35) & 0x10) == 0)return 0;
      goto LABEL_5;
    case 29:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v10, &v35) != 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      return v20;
    case 30:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v10, &v35));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      return v20;
    case 31:
      v23 = -[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v10, &v35);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      return v20;
    case 36:
    case 68:
    case 100:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_5;
      *(_DWORD *)&v33[4] = 0;
      v34 = 0;
      v33[0] = 0;
      v32[0] = 0;
      extractDataFromPtgRefBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v10, &v35), (int *)&v34, v33, (int *)&v33[4], v32);
      -[EPFormulaCleaner addOffsetsToRow:rowRelative:column:columnRelative:](self, "addOffsetsToRow:rowRelative:column:columnRelative:", &v34, v33[0], &v33[4], v32[0]);
      -[EDSheet rowBlocks](self->mCurrentSheet, "rowBlocks");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (EDCellHeader *)objc_msgSend(v14, "cellWithRowNumber:columnNumber:", v34, *(unsigned int *)&v33[4]);
      goto LABEL_17;
    case 37:
    case 69:
    case 101:
      if (!a5)
        goto LABEL_5;
      v34 = 0;
      *(_QWORD *)v33 = 0;
      *(_DWORD *)v32 = 0;
      v29[0] = 0;
      *(_WORD *)v31 = 0;
      v30 = 0;
      extractDataFromPtgAreaBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v10, &v35), (int *)&v34, v29, (int *)&v33[4], &v31[1], (int *)v33, v31, (int *)v32, &v30);
      -[EPFormulaCleaner addOffsetsToRow:rowRelative:column:columnRelative:](self, "addOffsetsToRow:rowRelative:column:columnRelative:", &v34, v29[0], v33, v31[0]);
      -[EPFormulaCleaner addOffsetsToRow:rowRelative:column:columnRelative:](self, "addOffsetsToRow:rowRelative:column:columnRelative:", &v33[4], v31[1], v32, v30);
      v17 = *(unsigned int *)&v33[4];
      v16 = v34;
      v19 = *(unsigned int *)v32;
      v18 = *(unsigned int *)v33;
      goto LABEL_15;
    case 58:
    case 90:
      goto LABEL_16;
    case 59:
    case 91:
      goto LABEL_13;
    default:
      if (v12 == 122)
      {
LABEL_16:
        v34 = 0;
        *(_QWORD *)v33 = 0;
        v32[0] = 0;
        v29[0] = 0;
        extractDataFromPtgRef3DBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v10, &v35), &v34, (int *)&v33[4], v32, (int *)v33, v29);
        -[EPFormulaCleaner addOffsetsToRow:rowRelative:column:columnRelative:](self, "addOffsetsToRow:rowRelative:column:columnRelative:", &v33[4], v32[0], v33, v29[0]);
        -[EPFormulaCleaner worksheetFromLinkReferenceIndex:](self, "worksheetFromLinkReferenceIndex:", v34);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "rowBlocks");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (EDCellHeader *)objc_msgSend(v14, "cellWithRowNumber:columnNumber:", *(unsigned int *)&v33[4], *(unsigned int *)v33);

LABEL_17:
        v13 = 0;
        if (!v15 || a5)
          goto LABEL_36;
        if (formulaIndexForEDCell(v15) != -1)
          goto LABEL_20;
        v24 = typeForEDCell(v15);
        switch(v24)
        {
          case 3u:
            WeakRetained = (EDResources *)objc_loadWeakRetained((id *)&self->super.mResources);
            stringValueForEDCell(v15, WeakRetained);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "string");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_36;
          case 2u:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", numberValueForEDCell(v15));
            v25 = objc_claimAutoreleasedReturnValue();
            break;
          case 1u:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", BOOLValueForEDCell((_BOOL8)v15));
            v25 = objc_claimAutoreleasedReturnValue();
            break;
          default:
LABEL_20:
            v13 = 0;
            *a6 = 0;
LABEL_36:
            objc_msgSend(v14, "unlock");

            return v13;
        }
        v13 = (void *)v25;
        goto LABEL_36;
      }
      if (v12 != 123)
        return v13;
LABEL_13:
      if (!a5)
      {
LABEL_5:
        v13 = 0;
        *a6 = 0;
        return v13;
      }
      v34 = 0;
      *(_QWORD *)v33 = 0;
      *(_DWORD *)v32 = 0;
      *(_DWORD *)v29 = 0;
      *(_WORD *)v31 = 0;
      v30 = 0;
      v28 = 0;
      extractDataFromPtgArea3DBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self->mTokensToClean, "lastExtendedDataForTokenAtIndex:length:", v10, &v35), &v34, (int *)&v33[4], &v31[1], (int *)v33, v31, (int *)v32, &v30, (int *)v29, &v28);
      -[EPFormulaCleaner addOffsetsToRow:rowRelative:column:columnRelative:](self, "addOffsetsToRow:rowRelative:column:columnRelative:", &v33[4], v31[1], v32, v30);
      -[EPFormulaCleaner addOffsetsToRow:rowRelative:column:columnRelative:](self, "addOffsetsToRow:rowRelative:column:columnRelative:", v33, v31[0], v29, v28);
      v17 = *(unsigned int *)v33;
      v16 = *(unsigned int *)&v33[4];
      v18 = *(unsigned int *)v32;
      v19 = *(unsigned int *)v29;
LABEL_15:
      +[EDReference referenceWithFirstRow:lastRow:firstColumn:lastColumn:](EDReference, "referenceWithFirstRow:lastRow:firstColumn:lastColumn:", v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      return v20;
  }
}

- (BOOL)isArrayedFormulaSupported:(id)a3 allowSimpleRanges:(BOOL)a4 formulasBeingEvaluated:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  EPFormulaCleaner *v22;
  id WeakRetained;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  unsigned __int16 *v28;
  uint64_t v29;
  int v31;
  unsigned int v32;
  int v33;
  BOOL v34[2];
  BOOL v35[2];
  __int128 v36;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if ((objc_msgSend(v9, "containsObject:", v8) & 1) != 0)
  {
    v10 = 0;
    goto LABEL_41;
  }
  if (!v8)
  {
    v10 = 1;
    goto LABEL_41;
  }
  objc_msgSend(v9, "addObject:", v8);
  v11 = 0;
  v12 = 0;
  v13 = 0;
  while (2)
  {
    v14 = objc_msgSend(v8, "tokenCount");
    if (v13 >= v14)
      goto LABEL_40;
    v15 = objc_msgSend(v8, "tokenTypeAtIndex:", v13);
    v16 = v15;
    v17 = 0;
    switch(v15)
    {
      case 1:
      case 2:
      case 46:
      case 47:
      case 57:
      case 78:
      case 79:
        goto LABEL_40;
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
        v12 = 1;
        goto LABEL_33;
      case 15:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 36:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 58:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 68:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
        goto LABEL_33;
      case 16:
      case 17:
        if (!v6)
          goto LABEL_40;
        v11 = 1;
        goto LABEL_33;
      case 33:
      case 65:
        goto LABEL_10;
      case 34:
      case 66:
LABEL_9:
        v17 = 2;
LABEL_10:
        HIDWORD(v36) = 0;
        v18 = *(unsigned __int16 *)(objc_msgSend(v8, "lastExtendedDataForTokenAtIndex:length:", v13, (char *)&v36 + 12)
                                  + 2 * v17);
        if (v18 != 78 && v18 != 148)
          v12 = 1;
        if (v18 == 78 || v18 == 148)
          goto LABEL_40;
        goto LABEL_33;
      case 35:
      case 67:
LABEL_16:
        v31 = v12;
        v19 = v6;
        v20 = v11;
        HIDWORD(v36) = 0;
        v21 = *(unsigned int *)objc_msgSend(v8, "lastExtendedDataForTokenAtIndex:length:", v13, (char *)&v36 + 12);
        v22 = self;
        WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
        objc_msgSend(WeakRetained, "names");
        v24 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v24, "objectAtIndex:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "formula");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v24) = -[EPFormulaCleaner isArrayedFormulaSupported:allowSimpleRanges:formulasBeingEvaluated:](v22, "isArrayedFormulaSupported:allowSimpleRanges:formulasBeingEvaluated:", v26, 0, v9);

        if ((v24 & 1) != 0)
        {
          self = v22;
          v11 = v20;
          v6 = v19;
          v12 = v31;
LABEL_33:
          v13 = (v13 + 1);
          continue;
        }
        LOBYTE(v11) = v20;
        LOBYTE(v12) = v31;
LABEL_40:
        v10 = (v13 >= v14) & (v12 & v11 ^ 1);
LABEL_41:

        return v10;
      case 37:
      case 45:
      case 59:
      case 69:
      case 77:
LABEL_20:
        v36 = 0uLL;
        *(_WORD *)v35 = 0;
        *(_WORD *)v34 = 0;
        v33 = 0;
        v28 = (unsigned __int16 *)objc_msgSend(v8, "lastExtendedDataForTokenAtIndex:length:", v13, &v33);
        if (v16 == 59 || v16 == 123 || v16 == 91)
        {
          v32 = 0;
          extractDataFromPtgArea3DBuffer(v28, &v32, (int *)&v36 + 3, &v35[1], (int *)&v36 + 2, v35, (int *)&v36 + 1, &v34[1], (int *)&v36, v34);
        }
        else
        {
          extractDataFromPtgAreaBuffer(v28, (int *)&v36 + 3, &v35[1], (int *)&v36 + 2, v35, (int *)&v36 + 1, &v34[1], (int *)&v36, v34);
        }
        if (__PAIR64__(HIDWORD(v36), v36) == *(_QWORD *)((char *)&v36 + 4) && v35[1] == v35[0])
        {
          v29 = (v34[1] != v34[0]) | v11;
          if (v34[1] != v34[0] && !v6)
            goto LABEL_40;
        }
        else
        {
          if (!v6)
            goto LABEL_40;
          v29 = 1;
        }
        v11 = v29;
        goto LABEL_33;
      default:
        switch(v15)
        {
          case 'Y':
            goto LABEL_40;
          case 'Z':
          case '\\':
          case ']':
          case '^':
          case '_':
          case 'd':
            goto LABEL_33;
          case '[':
          case 'e':
            goto LABEL_20;
          case 'a':
            goto LABEL_10;
          case 'b':
            goto LABEL_9;
          case 'c':
            goto LABEL_16;
          default:
            if ((v15 - 109) > 0xE)
              goto LABEL_33;
            v27 = 1 << (v15 - 109);
            if ((v27 & 0x4001) != 0)
              goto LABEL_20;
            if ((v27 & 0x1006) != 0)
              goto LABEL_40;
            goto LABEL_33;
        }
    }
  }
}

- (BOOL)doesNameIndexContainCircularReferences:(unsigned int)a3 sheetIndex:(unint64_t)a4 previousNameIndexes:(void *)a5
{
  NSMutableDictionary *mNameCircularReferenceTestCache;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  id WeakRetained;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t **v24;
  int v25;
  unsigned int *v26;
  unsigned int v27;
  uint64_t *i;
  unsigned int v29;
  uint64_t v30;
  uint64_t **v31;
  NSMutableDictionary *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unsigned int v38;
  unsigned int v39;
  int v40;

  mNameCircularReferenceTestCache = self->mNameCircularReferenceTestCache;
  if (!mNameCircularReferenceTestCache)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v11 = self->mNameCircularReferenceTestCache;
    self->mNameCircularReferenceTestCache = v10;

    mNameCircularReferenceTestCache = self->mNameCircularReferenceTestCache;
  }
  v38 = a3 + 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mNameCircularReferenceTestCache, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedLongValue");

  if (!v14)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
    objc_msgSend(WeakRetained, "names");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "sheetIndex");
    if (v19 == a4 || v19 == 0)
    {
      objc_msgSend(v18, "formula");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v23 = 0;
      v24 = (uint64_t **)((char *)a5 + 8);
      while (v23 < objc_msgSend(v21, "tokenCount") && !v22)
      {
        v25 = objc_msgSend(v21, "tokenTypeAtIndex:", v23);
        if (v25 == 35 || v25 == 67 || v25 == 99)
        {
          v40 = 0;
          v26 = (unsigned int *)objc_msgSend(v21, "lastExtendedDataForTokenAtIndex:length:", v23, &v40);
          v39 = 0;
          v27 = *v26;
          v39 = *v26;
          if (a5)
          {
            for (i = *v24; i; i = (uint64_t *)*i)
            {
              v29 = *((_DWORD *)i + 7);
              if (v27 >= v29)
              {
                if (v29 >= v27)
                {

                  v32 = self->mNameCircularReferenceTestCache;
                  v33 = (void *)MEMORY[0x24BDD16E0];
                  goto LABEL_29;
                }
                ++i;
              }
            }
          }
          v30 = operator new();
          v31 = (uint64_t **)v30;
          *(_QWORD *)(v30 + 16) = 0;
          *(_QWORD *)(v30 + 8) = 0;
          *(_QWORD *)v30 = v30 + 8;
          if (a5 && (void *)v30 != a5)
            std::__tree<unsigned int>::__assign_multi<std::__tree_const_iterator<unsigned int,std::__tree_node<unsigned int,void *> *,long>>((uint64_t **)v30, *(unsigned int **)a5, (unsigned int *)a5 + 2);
          std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int const&>(v31, &v39, &v39);
          v22 = -[EPFormulaCleaner doesNameIndexContainCircularReferences:sheetIndex:previousNameIndexes:](self, "doesNameIndexContainCircularReferences:sheetIndex:previousNameIndexes:", v39, a4, v31);
          std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)v31, v31[1]);
          MEMORY[0x22E2DD408](v31, 0x1020C4062D53EE8);
        }
        v23 = (v23 + 1);
      }

      v32 = self->mNameCircularReferenceTestCache;
      v33 = (void *)MEMORY[0x24BDD16E0];
      if (v22)
      {
LABEL_29:
        v34 = 2;
        v15 = 1;
        goto LABEL_30;
      }
      v15 = 0;
    }
    else
    {
      v15 = 0;
      v32 = self->mNameCircularReferenceTestCache;
      v33 = (void *)MEMORY[0x24BDD16E0];
    }
    v34 = 1;
LABEL_30:
    objc_msgSend(v33, "numberWithInt:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v38);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v35, v36);

    return v15;
  }
  return v14 == 2;
}

@end
