@implementation EPMergedRegionScanner

- (BOOL)isObjectSupported:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "mergedCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        -[EPMergedRegionScanner processMergedRegion:inWorksheet:](self, "processMergedRegion:inWorksheet:", v8, v9);

      ++v7;
    }
    while (v6 != v7);
  }

}

- (BOOL)processMergedRegion:(id)a3 inWorksheet:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  int v30;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "firstRow");
  v8 = objc_msgSend(v5, "lastRow");
  v9 = objc_msgSend(v5, "firstColumn");
  v30 = objc_msgSend(v5, "lastColumn");
  if ((int)v7 >= (int)v8)
  {
    v14 = 0;
  }
  else
  {
    v28 = v6;
    v29 = v5;
    objc_msgSend(v6, "rowBlocks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "expectedIndexOfRowBlockForRowNumber:", v7);
    v12 = objc_msgSend(v10, "expectedIndexOfRowBlockForRowNumber:", v8);
    if (v11 <= v12)
    {
      v13 = 0;
      do
      {
        objc_msgSend(v10, "rowBlockAtIndex:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = objc_msgSend(v15, "rowCount");
          if (v17)
          {
            v18 = 0;
            do
            {
              v19 = objc_msgSend(v16, "rowInfoAtIndex:", v18);
              if (v19)
              {
                v20 = *(_DWORD *)(v19 + 4);
                if (v20 >= (int)v7)
                {
                  if (v20 > (int)v8)
                    break;
                  if ((*(_BYTE *)(v19 + 23) & 2) != 0)
                  {
                    *(_BYTE *)(v19 + 23) &= ~2u;
                    v13 = 1;
                  }
                }
              }
              v18 = (v18 + 1);
            }
            while (v17 != (_DWORD)v18);
          }
        }

        ++v11;
      }
      while (v11 <= v12);
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v10, "unlock");

    v14 = v13 & 1;
    v6 = v28;
    v5 = v29;
  }
  if (v9 >= v30)
    goto LABEL_29;
  objc_msgSend(v6, "columnInfos");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");
  if (!v22)
    goto LABEL_28;
  v23 = 0;
  while (1)
  {
    objc_msgSend(v21, "objectAtIndex:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "range");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      if (v9 <= (int)objc_msgSend(v25, "lastColumn"))
        break;
    }
LABEL_25:

    if (v22 == ++v23)
      goto LABEL_28;
  }
  if (v30 >= (int)objc_msgSend(v26, "firstColumn"))
  {
    if (objc_msgSend(v24, "isHidden"))
    {
      objc_msgSend(v24, "setHidden:", 0);
      v14 = 1;
    }
    goto LABEL_25;
  }

LABEL_28:
LABEL_29:

  return v14 & 1;
}

@end
