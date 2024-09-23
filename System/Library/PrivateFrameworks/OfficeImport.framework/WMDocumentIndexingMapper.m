@implementation WMDocumentIndexingMapper

- (void)_indexBlock:(id)a3 intoString:(id)a4
{
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v23 = a4;
  objc_msgSend(a3, "runs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v21;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          v12 = objc_msgSend(v11, "fieldMarkerType");
          if ((v12 - 20) < 2)
          {

            goto LABEL_14;
          }
          if (v12 == 19)
          {
            v7 = 1;
            goto LABEL_26;
          }

        }
        if ((v7 & 1) != 0)
        {
          v7 = 1;
          goto LABEL_27;
        }
LABEL_14:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "string");
          v11 = (id)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v24, "addObject:", v11);
          goto LABEL_25;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "drawable");
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "clientData");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v11, "clientData");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "textBox");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16)
            {
              objc_msgSend(v16, "text");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[WMDocumentIndexingMapper _indexText:intoString:](self, "_indexText:intoString:", v18, v23);

            }
LABEL_24:

          }
LABEL_25:
          v7 = 0;
LABEL_26:

          goto LABEL_27;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "text");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[WMDocumentIndexingMapper _indexText:intoString:](self, "_indexText:intoString:", v15, v23);
          goto LABEL_24;
        }
        v7 = 0;
LABEL_27:
        ++v9;
      }
      while (v6 != v9);
      v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v6 = v19;
    }
    while (v19);
  }

  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(v24, "componentsJoinedByString:", &stru_24F3BFFF8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "appendString:", v20);

    objc_msgSend(v23, "appendString:", CFSTR("\n"));
  }

}

- (void)_indexTable:(id)a3 intoString:(id)a4
{
  id v6;
  unint64_t i;
  void *v8;
  unint64_t j;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  for (i = 0; objc_msgSend(v12, "rowCount") > i; ++i)
  {
    objc_msgSend(v12, "rowAt:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    for (j = 0; objc_msgSend(v8, "cellCount") > j; ++j)
    {
      objc_msgSend(v8, "cellAt:", j);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WMDocumentIndexingMapper _indexText:intoString:](self, "_indexText:intoString:", v11, v6);

    }
  }

}

- (void)_indexText:(id)a3 intoString:(id)a4
{
  id v6;
  unint64_t i;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  for (i = 0; objc_msgSend(v9, "blockCount") > i; ++i)
  {
    objc_msgSend(v9, "blockAt:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "blockType"))
    {
      if (objc_msgSend(v8, "blockType") == 1)
        -[WMDocumentIndexingMapper _indexTable:intoString:](self, "_indexTable:intoString:", v8, v6);
    }
    else
    {
      -[WMDocumentIndexingMapper _indexBlock:intoString:](self, "_indexBlock:intoString:", v8, v6);
    }

  }
}

- (void)mapWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMMapper document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; objc_msgSend(v6, "sectionCount") > i; ++i)
  {
    objc_msgSend(v6, "sectionAt:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstPageHeader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMDocumentIndexingMapper _indexText:intoString:](self, "_indexText:intoString:", v9, v5);

    objc_msgSend(v8, "oddPageHeader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMDocumentIndexingMapper _indexText:intoString:](self, "_indexText:intoString:", v10, v5);

    objc_msgSend(v8, "evenPageHeader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMDocumentIndexingMapper _indexText:intoString:](self, "_indexText:intoString:", v11, v5);

    objc_msgSend(v8, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMDocumentIndexingMapper _indexText:intoString:](self, "_indexText:intoString:", v12, v5);

    objc_msgSend(v8, "firstPageFooter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMDocumentIndexingMapper _indexText:intoString:](self, "_indexText:intoString:", v13, v5);

    objc_msgSend(v8, "oddPageFooter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMDocumentIndexingMapper _indexText:intoString:](self, "_indexText:intoString:", v14, v5);

    objc_msgSend(v8, "evenPageFooter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMDocumentIndexingMapper _indexText:intoString:](self, "_indexText:intoString:", v15, v5);

  }
  objc_msgSend(v4, "textContent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendString:", v5);

  v17.receiver = self;
  v17.super_class = (Class)WMDocumentIndexingMapper;
  -[CMIndexingMapper mapWithState:](&v17, sel_mapWithState_, v4);

}

@end
