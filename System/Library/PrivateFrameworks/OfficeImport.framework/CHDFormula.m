@implementation CHDFormula

- (void)setWorkbook:(id)a3
{
  objc_storeWeak((id *)&self->mWorkbook, a3);
}

- (id)references
{
  EDReferenceCollection *mReferences;
  EDReferenceCollection *v3;
  void *v5;

  mReferences = self->mReferences;
  if (!mReferences)
  {
    if (!-[EDFormula isSupportedFormula](self, "isSupportedFormula") || !-[EDFormula isCleaned](self, "isCleaned"))
    {
      v3 = 0;
      return v3;
    }
    -[CHDFormula referencesFromFormula](self, "referencesFromFormula");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      -[CHDFormula setReferences:](self, "setReferences:", v5);
    }
    else
    {
      -[EDFormula removeAllTokens](self, "removeAllTokens");
      -[EDFormula setWarning:](self, "setWarning:", 1);
    }

    mReferences = self->mReferences;
  }
  v3 = mReferences;
  return v3;
}

- (id)referencesFromFormula
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  void *v10;
  id v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  unsigned int v21;

  if (!-[EDFormula isSupportedFormula](self, "isSupportedFormula") || !-[EDFormula tokenCount](self, "tokenCount"))
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->mWorkbook);
  objc_msgSend(WeakRetained, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "links");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDReferenceCollection noCoalesceCollection](EDReferenceCollection, "noCoalesceCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EDFormula tokenCount](self, "tokenCount");
  if (v7)
  {
    v8 = 0;
    do
    {
      v9 = -[EDFormula tokenTypeAtIndex:](self, "tokenTypeAtIndex:", v8);
      if (v9 != 16)
      {
        v20 = 0;
        v21 = -1;
        v18 = -1;
        v19 = -1;
        v16 = -1;
        v17 = -1;
        if (v9 > 68)
        {
          if (v9 <= 99)
          {
            if (v9 == 69)
              goto LABEL_25;
            if (v9 != 90)
            {
              if (v9 != 91)
                goto LABEL_30;
              goto LABEL_28;
            }
          }
          else
          {
            if (v9 <= 121)
            {
              if (v9 != 100)
              {
                if (v9 == 101)
                  goto LABEL_25;
                goto LABEL_30;
              }
              goto LABEL_24;
            }
            if (v9 != 122)
            {
              if (v9 != 123)
                goto LABEL_30;
              goto LABEL_28;
            }
          }
          goto LABEL_29;
        }
        if (v9 > 57)
        {
          if (v9 != 58)
          {
            if (v9 != 59)
            {
              if (v9 != 68)
                goto LABEL_30;
              goto LABEL_24;
            }
LABEL_28:
            extractDataFromPtgArea3DBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self, "lastExtendedDataForTokenAtIndex:length:", v8, &v20), &v21, &v19, &v17, &v18, &v16);
            goto LABEL_30;
          }
LABEL_29:
          extractDataFromPtgRef3DBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self, "lastExtendedDataForTokenAtIndex:length:", v8, &v20), &v21, &v19, &v18);
          goto LABEL_30;
        }
        if (v9 > 35)
        {
          if (v9 != 36)
          {
            if (v9 != 37)
              goto LABEL_30;
LABEL_25:
            extractDataFromPtgAreaBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self, "lastExtendedDataForTokenAtIndex:length:", v8, &v20), &v19, &v17, &v18, &v16);
LABEL_30:
            v14 = 0;
            v15 = 0;
            if (objc_msgSend(v5, "convertLinkReferenceIndex:firstSheetIndex:lastSheetIndex:", v21, &v15, &v14)&& v15 == v14)
            {
              if (v17 < 0)
                v17 = v19;
              if (v16 < 0)
                v16 = v18;
              +[EDSheetReference referenceWithSheetIndex:firstRow:lastRow:firstColumn:lastColumn:](EDSheetReference, "referenceWithSheetIndex:firstRow:lastRow:firstColumn:lastColumn:");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v10, "isValidAreaReference") & 1) != 0)
                objc_msgSend(v6, "addObject:", v10);

            }
            goto LABEL_40;
          }
LABEL_24:
          extractDataFromPtgRefBuffer((unsigned __int16 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self, "lastExtendedDataForTokenAtIndex:length:", v8, &v20), &v19, &v18);
          goto LABEL_30;
        }
        if (v9 != 21)
        {
          if (v9 == 23 || v9 == 30)
          {
            v11 = 0;
            goto LABEL_50;
          }
          goto LABEL_30;
        }
      }
LABEL_40:
      v8 = (v8 + 1);
    }
    while (v7 != (_DWORD)v8);
  }
  if (objc_msgSend(v6, "count"))
    v13 = v6;
  else
    v13 = 0;
  v11 = v13;
LABEL_50:

  return v11;
}

- (void)setReferences:(id)a3
{
  EDReferenceCollection **p_mReferences;
  EDReferenceCollection *v6;

  p_mReferences = &self->mReferences;
  v6 = (EDReferenceCollection *)a3;
  if (*p_mReferences != v6)
  {
    objc_storeStrong((id *)&self->mReferences, a3);
    if (*p_mReferences)
      -[EDFormula removeAllTokens](self, "removeAllTokens");
  }

}

- (unint64_t)countOfCellsBeingReferenced
{
  void *v2;
  unint64_t v3;

  -[CHDFormula references](self, "references");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countOfCellsBeingReferenced");

  return v3;
}

+ (CHDFormula)formulaWithReferences:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithReferences:", v3);

  return (CHDFormula *)v4;
}

- (CHDFormula)initWithReferences:(id)a3
{
  id v5;
  CHDFormula *v6;
  CHDFormula *v7;

  v5 = a3;
  v6 = -[EDFormula init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mReferences, a3);

  return v7;
}

+ (CHDFormula)formulaWithReference:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithReference:", v3);

  return (CHDFormula *)v4;
}

- (CHDFormula)initWithReference:(id)a3
{
  id v4;
  CHDFormula *v5;
  EDReferenceCollection *v6;
  EDReferenceCollection *mReferences;

  v4 = a3;
  v5 = -[EDFormula init](self, "init");
  if (v5)
  {
    v6 = -[EDCollection initWithObject:]([EDReferenceCollection alloc], "initWithObject:", v4);
    mReferences = v5->mReferences;
    v5->mReferences = v6;

  }
  return v5;
}

- (CHDFormula)initWithWorkbook:(id)a3
{
  id v4;
  CHDFormula *v5;
  CHDFormula *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDFormula;
  v5 = -[EDFormula init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->mWorkbook, v4);

  return v6;
}

- (void)prepareTokens
{
  EDReferenceCollection *mReferences;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  id WeakRetained;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  int v22;
  _BOOL4 v23;
  uint64_t v24;
  __int16 v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  EDReferenceCollection *v32;
  unint64_t v33;
  id v34;
  id v35;

  mReferences = self->mReferences;
  if (mReferences)
  {
    if (!-[EDCollection count](mReferences, "count"))
    {
      v35 = self->mReferences;
      self->mReferences = 0;
LABEL_47:

      return;
    }
    v33 = -[EDCollection count](self->mReferences, "count");
    if (v33)
    {
      v4 = 0;
      v5 = 0;
      v6 = 0;
      v7 = 0;
      v8 = 0;
      do
      {
        -[EDCollection objectAtIndex:](self->mReferences, "objectAtIndex:", v6, v33);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v34 = v9;
          v10 = objc_msgSend(v9, "isCellReference");
          v11 = objc_msgSend(v34, "isSheedIndexValid");
          v12 = v34;
          if (v10)
            v13 = 6;
          else
            v13 = 10;
          if (v10)
            v14 = 4;
          else
            v14 = 8;
          if (!v11)
            v13 = v14;
          v7 = (v13 + v7);
          v5 = (v5 + 1);
          v8 = (v8 + 1);
          if (v6)
            v15 = 2;
          else
            v15 = 1;
          v4 = (v4 + v15);
        }
        else
        {
          v12 = 0;
        }

        ++v6;
      }
      while (v33 != v6);
      if ((_DWORD)v4)
      {
        -[EDFormula removeAllTokens](self, "removeAllTokens");
        WeakRetained = objc_loadWeakRetained((id *)&self->mWorkbook);
        objc_msgSend(WeakRetained, "resources");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "links");
        v35 = (id)objc_claimAutoreleasedReturnValue();

        -[EDFormula setupTokensWithTokensCount:tokensWithDataCount:extendedDataLength:extendedDataCount:](self, "setupTokensWithTokensCount:tokensWithDataCount:extendedDataLength:extendedDataCount:", v4, v5, v7, v8);
        if (v33)
        {
          for (i = 0; i != v33; ++i)
          {
            -[EDCollection objectAtIndex:](self->mReferences, "objectAtIndex:", i);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19)
            {
              v21 = objc_msgSend(v19, "firstRow");
              if (v21 == objc_msgSend(v20, "lastRow"))
              {
                v22 = objc_msgSend(v20, "firstColumn");
                v23 = v22 != objc_msgSend(v20, "lastColumn");
              }
              else
              {
                v23 = 1;
              }
              v24 = objc_msgSend(v20, "sheetIndex");
              if (objc_msgSend(v20, "isSheedIndexValid"))
                v25 = objc_msgSend(v35, "addOrEquivalentInternalLinkReferenceWithFirstSheetIndex:lastSheetIndex:", v24, v24);
              else
                v25 = -1;
              if (objc_msgSend(v20, "isSheedIndexValid"))
              {
                if (v23)
                {
                  v26 = -[EDFormula addToken:extendedDataLength:](self, "addToken:extendedDataLength:", 59, 10);
                  v27 = v26;
                  if (v26)
                  {
                    *(_WORD *)v26 = v25;
                    *((_WORD *)v26 + 1) = objc_msgSend(v20, "firstRow");
                    *((_WORD *)v27 + 2) = objc_msgSend(v20, "lastRow");
                    *((_WORD *)v27 + 3) = objc_msgSend(v20, "firstColumn");
                    *((_WORD *)v27 + 4) = objc_msgSend(v20, "lastColumn");
                  }
                }
                else
                {
                  v29 = -[EDFormula addToken:extendedDataLength:](self, "addToken:extendedDataLength:", 58, 6);
                  v30 = v29;
                  if (v29)
                  {
                    *(_WORD *)v29 = v25;
                    *((_WORD *)v29 + 1) = objc_msgSend(v20, "firstRow");
                    *((_WORD *)v30 + 2) = objc_msgSend(v20, "firstColumn");
                  }
                }
              }
              else if (v23)
              {
                v28 = -[EDFormula addToken:extendedDataLength:](self, "addToken:extendedDataLength:", 37, 8);
                if (v28)
                {
                  *(_WORD *)v28 = objc_msgSend(v20, "firstRow");
                  *((_WORD *)v28 + 1) = objc_msgSend(v20, "lastRow");
                  *((_WORD *)v28 + 2) = objc_msgSend(v20, "firstColumn");
                  *((_WORD *)v28 + 3) = objc_msgSend(v20, "lastColumn");
                }
              }
              else
              {
                v31 = -[EDFormula addToken:extendedDataLength:](self, "addToken:extendedDataLength:", 36, 4);
                if (v31)
                {
                  *(_WORD *)v31 = objc_msgSend(v20, "firstRow");
                  *((_WORD *)v31 + 1) = objc_msgSend(v20, "firstColumn");
                }
              }
              if (i)
                -[EDFormula addToken:extendedDataLength:](self, "addToken:extendedDataLength:", 16, 0);
            }

          }
        }
        v32 = self->mReferences;
        self->mReferences = 0;

        goto LABEL_47;
      }
    }
  }
}

- (BOOL)isConstantStringFormula
{
  unsigned int v3;
  unsigned int v4;
  BOOL v5;
  int v6;
  unsigned int v7;
  int v8;
  BOOL v9;

  v3 = -[EDFormula tokenCount](self, "tokenCount");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = -v3;
    v7 = 1;
    do
    {
      v8 = -[EDFormula tokenTypeAtIndex:](self, "tokenTypeAtIndex:", v7 - 1);
      v9 = v8 == 16 || v8 == 23;
      if (!v9 && (v8 != 21 || v6 + v7))
        break;
      v5 = v7++ >= v4;
    }
    while (v6 + v7 != 1);
  }
  else
  {
    return 0;
  }
  return v5;
}

- (id)constantValuesFromConstantStringFormula
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  int v7;
  OcText *OcTextFromPtgStrBuffer;
  void *v9;
  id v10;
  int v12;

  v3 = -[EDFormula tokenCount](self, "tokenCount");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = -[EDFormula tokenTypeAtIndex:](self, "tokenTypeAtIndex:", v5);
      if (v7 != 16)
      {
        if (v7 != 23)
        {
          v10 = 0;
          goto LABEL_14;
        }
        if (!v6)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v12 = 0;
        OcTextFromPtgStrBuffer = extractOcTextFromPtgStrBuffer((unsigned __int8 *)-[EDFormula lastExtendedDataForTokenAtIndex:length:](self, "lastExtendedDataForTokenAtIndex:length:", v5, &v12));
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", OcTextFromPtgStrBuffer);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v9);

        if (OcTextFromPtgStrBuffer)
          (*((void (**)(OcText *))OcTextFromPtgStrBuffer->var0 + 1))(OcTextFromPtgStrBuffer);
      }
      v5 = (v5 + 1);
      if (v4 == (_DWORD)v5)
        goto LABEL_12;
    }
  }
  v6 = 0;
LABEL_12:
  v10 = v6;
  v6 = v10;
LABEL_14:

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mWorkbook);
  objc_storeStrong((id *)&self->mReferences, 0);
}

@end
