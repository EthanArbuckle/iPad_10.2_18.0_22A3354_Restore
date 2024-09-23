@implementation SXDataTableComponentStyleFactory

- (SXDataTableComponentStyleFactory)initWithRecordStore:(id)a3 tableStyle:(id)a4 dataOrientation:(unint64_t)a5 rowStyleMerger:(id)a6 columnStyleMerger:(id)a7 cellStyleMerger:(id)a8
{
  id v15;
  id v16;
  id v17;
  SXDataTableComponentStyleFactory *v18;
  SXDataTableComponentStyleFactory *v19;
  SXDataTableSelectorValidator *v20;
  SXDataTableSelectorValidator *selectorValidator;
  id v23;
  id v24;
  objc_super v25;

  v15 = a3;
  v24 = a4;
  v23 = a6;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SXDataTableComponentStyleFactory;
  v18 = -[SXDataTableComponentStyleFactory init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_tableStyle, a4);
    objc_storeStrong((id *)&v19->_recordStore, a3);
    v19->_dataOrientation = a5;
    v20 = -[SXDataTableSelectorValidator initWithRecordStore:dataOrientation:]([SXDataTableSelectorValidator alloc], "initWithRecordStore:dataOrientation:", v15, a5, v23, v24);
    selectorValidator = v19->_selectorValidator;
    v19->_selectorValidator = v20;

    objc_storeStrong((id *)&v19->_rowStyleMerger, a6);
    objc_storeStrong((id *)&v19->_columnStyleMerger, a7);
    objc_storeStrong((id *)&v19->_cellStyleMerger, a8);
  }

  return v19;
}

- (id)headerRowStyleForRowIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  -[SXDataTableComponentStyleFactory tableStyle](self, "tableStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXDataTableComponentStyleFactory rowStyleForRowIndex:](self, "rowStyleForRowIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    -[SXDataTableComponentStyleFactory rowStyleMerger](self, "rowStyleMerger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mergeObjects:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v7;
  }
  -[SXDataTableComponentStyleFactory rowStyleForRowIndex:usingBaseStyle:](self, "rowStyleForRowIndex:usingBaseStyle:", a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)headerColumnStyleForColumnIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  -[SXDataTableComponentStyleFactory tableStyle](self, "tableStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerColumns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXDataTableComponentStyleFactory columnStyleForColumnIndex:](self, "columnStyleForColumnIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    -[SXDataTableComponentStyleFactory columnStyleMerger](self, "columnStyleMerger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mergeObjects:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v7;
  }
  -[SXDataTableComponentStyleFactory columnStyleForColumnIndex:usingBaseStyle:](self, "columnStyleForColumnIndex:usingBaseStyle:", a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)headerCellStyleForIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[3];

  var1 = a3.var1;
  var0 = a3.var0;
  v15[2] = *MEMORY[0x24BDAC8D0];
  -[SXDataTableComponentStyleFactory tableStyle](self, "tableStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerCells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXDataTableComponentStyleFactory cellStyleForIndexPath:](self, "cellStyleForIndexPath:", var0, var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    -[SXDataTableComponentStyleFactory cellStyleMerger](self, "cellStyleMerger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mergeObjects:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v8;
  }
  -[SXDataTableComponentStyleFactory cellStyleForIndexPath:usingBaseStyle:](self, "cellStyleForIndexPath:usingBaseStyle:", var0, var1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)rowStyleForRowIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[SXDataTableComponentStyleFactory tableStyle](self, "tableStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentStyleFactory rowStyleForRowIndex:usingBaseStyle:](self, "rowStyleForRowIndex:usingBaseStyle:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)columnStyleForColumnIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[SXDataTableComponentStyleFactory tableStyle](self, "tableStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentStyleFactory columnStyleForColumnIndex:usingBaseStyle:](self, "columnStyleForColumnIndex:usingBaseStyle:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)cellStyleForIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v6;
  void *v7;
  void *v8;

  var1 = a3.var1;
  var0 = a3.var0;
  -[SXDataTableComponentStyleFactory tableStyle](self, "tableStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentStyleFactory cellStyleForIndexPath:usingBaseStyle:](self, "cellStyleForIndexPath:usingBaseStyle:", var0, var1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)rowStyleForRowIndex:(unint64_t)a3 usingBaseStyle:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = v6;
  objc_msgSend(v6, "conditional");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v32;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(obj);
        v25 = v7;
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v7);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v8, "selectors");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v28;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v28 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v13);
              -[SXDataTableComponentStyleFactory selectorValidator](self, "selectorValidator");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "validateRowSelector:forRowIndex:", v14, a3);

              if (v16)
              {
                +[SXDataTableStyleMatch matchWithStyle:andSelector:](SXDataTableStyleMatch, "matchWithStyle:andSelector:", v8, v14);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addObject:", v17);

              }
              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v11);
        }

        v7 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v24);
  }

  -[SXDataTableComponentStyleFactory rowStyleMerger](self, "rowStyleMerger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentStyleFactory styleByMergingStyleMatches:forBaseStyle:merger:](self, "styleByMergingStyleMatches:forBaseStyle:merger:", v26, v21, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)columnStyleForColumnIndex:(unint64_t)a3 usingBaseStyle:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = v6;
  objc_msgSend(v6, "conditional");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v32;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(obj);
        v25 = v7;
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v7);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v8, "selectors");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v28;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v28 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v13);
              -[SXDataTableComponentStyleFactory selectorValidator](self, "selectorValidator");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "validateColumnSelector:forColumnIndex:", v14, a3);

              if (v16)
              {
                +[SXDataTableStyleMatch matchWithStyle:andSelector:](SXDataTableStyleMatch, "matchWithStyle:andSelector:", v8, v14);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addObject:", v17);

              }
              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v11);
        }

        v7 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v24);
  }

  -[SXDataTableComponentStyleFactory columnStyleMerger](self, "columnStyleMerger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentStyleFactory styleByMergingStyleMatches:forBaseStyle:merger:](self, "styleByMergingStyleMatches:forBaseStyle:merger:", v26, v21, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)cellStyleForIndexPath:(id)a3 usingBaseStyle:(id)a4
{
  unint64_t var1;
  unint64_t var0;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  var1 = a3.var1;
  var0 = a3.var0;
  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v22 = v7;
  objc_msgSend(v7, "conditional");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v34;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(obj);
        v26 = v8;
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v8);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v28 = v9;
        objc_msgSend(v9, "selectors");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v30;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v30 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v14);
              -[SXDataTableComponentStyleFactory selectorValidator](self, "selectorValidator");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "validateCellSelector:forIndexPath:", v15, var0, var1);

              if (v17)
              {
                +[SXDataTableStyleMatch matchWithStyle:andSelector:](SXDataTableStyleMatch, "matchWithStyle:andSelector:", v28, v15);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "addObject:", v18);

              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v12);
        }

        v8 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v25);
  }

  -[SXDataTableComponentStyleFactory cellStyleMerger](self, "cellStyleMerger");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentStyleFactory styleByMergingStyleMatches:forBaseStyle:merger:](self, "styleByMergingStyleMatches:forBaseStyle:merger:", v27, v22, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (unint64_t)isOddNumber:(int64_t)a3
{
  if ((a3 & 1) != 0)
    return 2;
  else
    return 1;
}

- (unint64_t)isEvenNumber:(int64_t)a3
{
  if ((a3 == 0) | a3 & 1)
    return 1;
  else
    return 2;
}

- (id)styleByMergingStyleMatches:(id)a3 forBaseStyle:(id)a4 merger:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[SXDataTableComponentStyleFactory filterDuplicateSequentialStyles:](self, "filterDuplicateSequentialStyles:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableComponentStyleFactory sortStylesMatchesBySelectorWeight:](self, "sortStylesMatchesBySelectorWeight:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
    objc_msgSend(v12, "addObject:", v8);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "style", (_QWORD)v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  objc_msgSend(v9, "mergeObjects:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)filterDuplicateSequentialStyles:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6 + 1;
      while (v8 < objc_msgSend(v4, "count"))
      {
        objc_msgSend(v4, "objectAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "style");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "style");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v11)
          goto LABEL_11;
        objc_msgSend(v7, "selector");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "selector");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[SXDataTableComponentStyleFactory compareSelector:withOtherSelector:](self, "compareSelector:withOtherSelector:", v12, v13);

        if ((unint64_t)(v14 + 1) <= 1)
        {
          objc_msgSend(v5, "addObject:", v7);
LABEL_11:

          break;
        }
        if (v14 == 1)
        {
          objc_msgSend(v5, "addObject:", v9);
          v6 = ++v8;
        }

      }
      ++v6;
    }
    while (v6 < objc_msgSend(v4, "count"));
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v4;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", v21, (_QWORD)v24) & 1) == 0)
          objc_msgSend(v15, "addObject:", v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v18);
  }

  v22 = (void *)objc_msgSend(v15, "copy");
  return v22;
}

- (id)sortStylesMatchesBySelectorWeight:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__SXDataTableComponentStyleFactory_sortStylesMatchesBySelectorWeight___block_invoke;
  v4[3] = &unk_24D68A160;
  v4[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __70__SXDataTableComponentStyleFactory_sortStylesMatchesBySelectorWeight___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "selector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "compareSelector:withOtherSelector:", v6, v7);
  return v8;
}

- (int64_t)compareSelector:(id)a3 withOtherSelector:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "selectorWeight");
  v8 = objc_msgSend(v5, "selectorWeight");
  v9 = objc_msgSend(v6, "numberOfConditions");

  v10 = objc_msgSend(v5, "numberOfConditions");
  v11 = 1;
  v12 = -1;
  if (v9 >= v10)
    v12 = v9 > v10;
  if (v7 <= v8)
    v11 = v12;
  if (v7 >= v8)
    return v11;
  else
    return -1;
}

- (id)descriptorForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SXDataTableComponentStyleFactory recordStore](self, "recordStore", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (SXDataRecordStore)recordStore
{
  return self->_recordStore;
}

- (SXDataTableStyle)tableStyle
{
  return self->_tableStyle;
}

- (unint64_t)dataOrientation
{
  return self->_dataOrientation;
}

- (SXDataTableSelectorValidator)selectorValidator
{
  return self->_selectorValidator;
}

- (SXJSONObjectMerger)rowStyleMerger
{
  return self->_rowStyleMerger;
}

- (SXJSONObjectMerger)columnStyleMerger
{
  return self->_columnStyleMerger;
}

- (SXJSONObjectMerger)cellStyleMerger
{
  return self->_cellStyleMerger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellStyleMerger, 0);
  objc_storeStrong((id *)&self->_columnStyleMerger, 0);
  objc_storeStrong((id *)&self->_rowStyleMerger, 0);
  objc_storeStrong((id *)&self->_selectorValidator, 0);
  objc_storeStrong((id *)&self->_tableStyle, 0);
  objc_storeStrong((id *)&self->_recordStore, 0);
}

@end
