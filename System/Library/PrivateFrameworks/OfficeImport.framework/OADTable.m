@implementation OADTable

- (OADTable)init
{
  uint64_t v3;
  OADTable *v4;
  OADTableGrid *v5;
  OADTableGrid *mGrid;
  NSMutableArray *v7;
  NSMutableArray *mRows;
  objc_super v10;

  v3 = objc_opt_class();
  v10.receiver = self;
  v10.super_class = (Class)OADTable;
  v4 = -[OADDrawable initWithPropertiesClass:](&v10, sel_initWithPropertiesClass_, v3);
  if (v4)
  {
    v5 = objc_alloc_init(OADTableGrid);
    mGrid = v4->mGrid;
    v4->mGrid = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mRows = v4->mRows;
    v4->mRows = v7;

  }
  return v4;
}

- (id)tableProperties
{
  return self->super.mDrawableProperties;
}

- (id)grid
{
  return self->mGrid;
}

- (id)addRow
{
  OADTableRow *v3;

  v3 = objc_alloc_init(OADTableRow);
  -[NSMutableArray addObject:](self->mRows, "addObject:", v3);
  return v3;
}

- (void)setParentTextListStyle:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = -[OADTable rowCount](self, "rowCount");
  if (v4)
  {
    v5 = 0;
    do
    {
      -[OADTable rowAtIndex:](self, "rowAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "cellCount");
      if (v7)
      {
        v8 = 0;
        do
        {
          objc_msgSend(v6, "cellAtIndex:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "textBody");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setParentTextListStyle:", v11);

          ++v8;
        }
        while (v7 != v8);
      }

      ++v5;
    }
    while (v5 != v4);
  }

}

- (unint64_t)rowCount
{
  return -[NSMutableArray count](self->mRows, "count");
}

- (id)rowAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mRows, "objectAtIndex:", a3);
}

- (void)flipTableRTL
{
  unint64_t v3;
  unint64_t v4;
  uint64_t i;
  void *v6;

  -[OADTableGrid flipColumnsRTL](self->mGrid, "flipColumnsRTL");
  v3 = -[OADTable rowCount](self, "rowCount");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[OADTable rowAtIndex:](self, "rowAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "flipCellsRTL");

    }
  }
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTable;
  -[OADDrawable description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRows, 0);
  objc_storeStrong((id *)&self->mGrid, 0);
}

- (id)cellAtPos:(OADTMatrixPos)a3
{
  void *v4;
  void *v5;

  -[OADTable rowAtIndex:](self, "rowAtIndex:", a3.var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellAtIndex:", *(uint64_t *)&a3 >> 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (OADTMatrixPos)masterPosOfPos:(OADTMatrixPos)a3
{
  unsigned int v5;
  void *v6;
  char v7;
  unsigned int var0;
  unint64_t v9;
  uint64_t v10;
  OADTMatrixPos v11;
  void *v12;
  char v13;

  if (a3.var0 < 1)
  {
    var0 = a3.var0;
  }
  else
  {
    v5 = a3.var0;
    do
    {
      -[OADTable cellAtPos:](self, "cellAtPos:", *(_QWORD *)&a3 & 0xFFFFFFFF00000000 | v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "vertMerge");
      --v5;

    }
    while ((v7 & 1) != 0);
    var0 = v5 + 1;
  }
  v9 = HIDWORD(*(unint64_t *)&a3);
  if (*(uint64_t *)&a3 <= 0)
  {
    return (OADTMatrixPos)(*(_QWORD *)&a3 & 0xFFFFFFFF00000000 | var0);
  }
  else
  {
    v10 = var0;
    do
    {
      v11 = (OADTMatrixPos)(v10 | (v9 << 32));
      -[OADTable cellAtPos:](self, "cellAtPos:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "horzMerge");
      v9 = (v9 - 1);

    }
    while ((v13 & 1) != 0);
  }
  return v11;
}

- (id)masterCellOfPos:(OADTMatrixPos)a3
{
  return -[OADTable cellAtPos:](self, "cellAtPos:", -[OADTable masterPosOfPos:](self, "masterPosOfPos:", a3));
}

- (void)flattenStyle
{
  OADTableStyleFlattener *v2;

  v2 = -[OADTableStyleResolver initWithTable:]([OADTableStyleFlattener alloc], "initWithTable:", self);
  -[OADTableStyleResolver flatten](v2, "flatten");

}

+ (void)applyTextStyle:(id)a3 toParagraphProperties:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  OADSolidFill *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a4;
  objc_msgSend(v5, "parent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setParent:", 0);
  objc_msgSend(v14, "fontReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v14, "fontReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setColor:", 0);

    objc_msgSend(v14, "fontReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applyToParagraphProperties:", v5);

  }
  objc_msgSend(v14, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend(v5, "hasFill");

    if ((v11 & 1) == 0)
    {
      v12 = objc_alloc_init(OADSolidFill);
      objc_msgSend(v14, "color");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADSolidFill setColor:](v12, "setColor:", v13);

      objc_msgSend(v5, "setFill:", v12);
    }
  }
  if (objc_msgSend(v14, "bold") != 2 && (objc_msgSend(v5, "hasIsBold") & 1) == 0)
    objc_msgSend(v5, "setIsBold:", objc_msgSend(v14, "bold") == 0);
  if (objc_msgSend(v14, "italic") != 2 && (objc_msgSend(v5, "hasIsItalic") & 1) == 0)
    objc_msgSend(v5, "setIsItalic:", objc_msgSend(v14, "italic") == 0);
  objc_msgSend(v5, "setParent:", v6);

}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3
{
  void *v4;
  void *v5;
  OADTableUnnecessaryOverrideRemover *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[OADTable tableProperties](self, "tableProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[OADTableUnnecessaryOverrideRemover initWithTable:parentTextListStyle:]([OADTableUnnecessaryOverrideRemover alloc], "initWithTable:parentTextListStyle:", self, v14);
    -[OADTableStyleResolver flatten](v6, "flatten");

  }
  else
  {
    v7 = -[OADTable rowCount](self, "rowCount");
    if (v7)
    {
      v8 = 0;
      do
      {
        -[OADTable rowAtIndex:](self, "rowAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "cellCount");
        if (v10)
        {
          v11 = 0;
          do
          {
            objc_msgSend(v9, "cellAtIndex:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "textBody");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "changeParentTextListStylePreservingEffectiveValues:ownTextListStyle:", v14, 0);

            ++v11;
          }
          while (v10 != v11);
        }

        ++v8;
      }
      while (v8 != v7);
    }
  }

}

@end
