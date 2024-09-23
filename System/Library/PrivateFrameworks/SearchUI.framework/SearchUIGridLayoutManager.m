@implementation SearchUIGridLayoutManager

- (SearchUIGridLayoutManager)initWithHeaderSection:(id)a3 dataSections:(id)a4
{
  id v6;
  id v7;
  SearchUIGridLayoutManager *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)SearchUIGridLayoutManager;
  v8 = -[SearchUIGridLayoutManager init](&v38, sel_init);
  if (v8)
  {
    +[SearchUIUtilities pointerKeyMapTable](SearchUIUtilities, "pointerKeyMapTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIGridLayoutManager setTableMapping:](v8, "setTableMapping:", v9);

    objc_msgSend((id)objc_opt_class(), "alignmentsForSFHeaderRow:", v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    v32 = v6;
    v40[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v7;
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_opt_class();
          objc_opt_isKindOfClass();
          v18 = (void *)objc_opt_new();
          objc_msgSend(v18, "setIsSubHeader:", objc_msgSend(v17, "isSubHeader"));
          objc_msgSend(v17, "richData");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");
          v21 = (void *)objc_opt_class();
          if (v20)
          {
            objc_msgSend(v17, "richData");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "richTextForRichDataItems:", v22);
          }
          else
          {
            objc_msgSend(v17, "data");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "richTextForDataItems:", v22);
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setData:", v23, v30);

          -[SearchUIGridLayoutManager tableMapping](v8, "tableMapping");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKey:", v18, v17);

          objc_msgSend(v10, "addObject:", v18);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v14);
    }

    v25 = (void *)objc_opt_class();
    objc_msgSend(v10, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "data");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = objc_msgSend(v25, "shouldHideViewForRichData:", v27);

    v7 = v31;
    -[SearchUIGridLayoutManager setIsCompactTable:](v8, "setIsCompactTable:", -[SearchUIGridLayoutManager computeCompactTableForSections:](v8, "computeCompactTableForSections:", v31) & (v25 ^ 1));
    objc_msgSend(MEMORY[0x1E0DBD950], "gridManagerWithAlignments:rows:", v30, v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIGridLayoutManager setGridManager:](v8, "setGridManager:", v28);

    v6 = v32;
  }

  return v8;
}

+ (BOOL)shouldHideViewForRichData:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "hasContent", (_QWORD)v10) & 1) != 0)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)computeCompactTableForSections:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  SearchUIRowModel *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  BOOL v18;
  SearchUIGridLayoutManager *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    v20 = self;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v10 = -[SearchUIRowModel initWithCardSection:queryId:itemIdentifier:]([SearchUIRowModel alloc], "initWithCardSection:queryId:itemIdentifier:", v9, 0, 0);
        if (objc_msgSend(v9, "separatorStyle") == 1
          || !objc_msgSend(v9, "separatorStyle")
          && +[SearchUICardSectionView defaultSeparatorStyleForRowModel:](SearchUITableRowCardView, "defaultSeparatorStyleForRowModel:", v10) == 1)
        {
          v18 = 1;
LABEL_21:

          goto LABEL_23;
        }
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        -[SearchUIGridLayoutManager tableMapping](self, "tableMapping");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "data");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v22 != v16)
                objc_enumerationMutation(v13);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "hasOnlyImage") & 1) != 0)
              {

                v18 = 0;
                goto LABEL_21;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v15)
              continue;
            break;
          }
        }

        self = v20;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v18 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_23:

  return v18;
}

+ (id)alignmentsForSFHeaderRow:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = v3;
  objc_msgSend(v3, "alignmentSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableColumnAlignment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        v12 = (void *)objc_opt_new();
        v13 = objc_msgSend(v11, "columnAlignment");
        if (v13 <= 2)
          objc_msgSend(v12, "setColumnAlignment:", v13);
        v14 = objc_msgSend(v11, "dataAlignment");
        if (v14)
        {
          if (v14 == 2)
          {
            if (objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR"))
              v15 = 2;
            else
              v15 = 0;
          }
          else
          {
            if (v14 != 1)
              goto LABEL_17;
            v15 = 1;
          }
        }
        else
        {
          v15 = 4;
        }
        objc_msgSend(v12, "setDataAlignment:", v15);
LABEL_17:
        objc_msgSend(v12, "setIsEqualWidth:", objc_msgSend(v11, "isEqualWidth"));
        objc_msgSend(v4, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v4;
}

+ (id)richTextForDataItems:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void **v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v9, "glyph");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v9, "glyph");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setTlkImage:", v14);

          v24 = v12;
          v15 = &v24;
        }
        else
        {
          +[SearchUITLKMultilineTextConverter formattedTextForSearchUIText:](SearchUITLKMultilineTextConverter, "formattedTextForSearchUIText:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v12;
          v15 = &v23;
        }
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setFormattedTextItems:", v16);

        objc_msgSend(v10, "setMaxLines:", objc_msgSend(v9, "maxLines"));
        objc_msgSend(v4, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)richTextForRichDataItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)tableRowForTableRowCardSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SearchUIGridLayoutManager tableMapping](self, "tableMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (TLKGridLayoutManager)gridManager
{
  return self->_gridManager;
}

- (void)setGridManager:(id)a3
{
  objc_storeStrong((id *)&self->_gridManager, a3);
}

- (BOOL)isCompactTable
{
  return self->_isCompactTable;
}

- (void)setIsCompactTable:(BOOL)a3
{
  self->_isCompactTable = a3;
}

- (NSMapTable)tableMapping
{
  return self->_tableMapping;
}

- (void)setTableMapping:(id)a3
{
  objc_storeStrong((id *)&self->_tableMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableMapping, 0);
  objc_storeStrong((id *)&self->_gridManager, 0);
}

@end
