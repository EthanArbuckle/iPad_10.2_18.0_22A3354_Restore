@implementation EMWorksheetMapper

- (EMWorksheetMapper)initWithEDWorksheet:(id)a3 parent:(id)a4
{
  id v7;
  id v8;
  EMWorksheetMapper *v9;
  EMWorksheetMapper *v10;
  CMStyle *v11;
  CMStyle *mStyle;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMWorksheetMapper;
  v9 = -[CMMapper initWithParent:](&v14, sel_initWithParent_, v8);
  v10 = v9;
  if (v9)
  {
    v9->mHeight = 0;
    v9->mWidth = 0;
    v9->mMaxPopulatedColumn = -1;
    v9->mMaxPopulatedRow = -1;
    objc_storeStrong((id *)&v9->edWorksheet, a3);
    v11 = objc_alloc_init(CMStyle);
    mStyle = v10->mStyle;
    v10->mStyle = v11;

  }
  return v10;
}

- (CGSize)preprocessSizeWithState:(id)a3
{
  id v4;
  int v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v4 = a3;
  v5 = -[EMWorksheetMapper preprocessWidthWithState:](self, "preprocessWidthWithState:", v4);
  v6 = -[EMWorksheetMapper preprocessHeightWithState:](self, "preprocessHeightWithState:", v4);
  -[EMWorksheetMapper preprocessDrawableSizeWithState:](self, "preprocessDrawableSizeWithState:", v4);
  if (v7 < (double)v5)
    v7 = (double)v5;
  if (v8 < (double)v6)
    v8 = (double)v6;
  if (v7 > 0.0 || v8 > 0.0)
  {
    if (v7 > 0.0)
    {
      if (v8 <= 0.0)
        v8 = v7 * 3.0 * 0.25;
    }
    else
    {
      v7 = v8 * 4.0 / 3.0;
    }
    v10 = v7 + 20.0;
    v9 = v8 + 20.0;
  }
  else
  {
    v9 = 600.0;
    v10 = 980.0;
  }
  if (v10 >= 300.0)
    v11 = v10;
  else
    v11 = 300.0;
  if (v9 >= 200.0)
    v12 = v9;
  else
    v12 = 200.0;

  v13 = v11;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (int)preprocessWidthWithState:(id)a3
{
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  EMColumnInfoMapper *v16;
  double v17;
  int v18;
  double *v19;
  double v20;
  EMColumnInfoMapper *v21;
  double v22;
  int64_t v23;
  int64_t mMaxPopulatedColumn;
  int v25;
  int v26;
  EMColumnInfoMapper *v27;
  double v28;
  int64_t v29;
  int64_t v30;
  double *mColumnGrid;
  uint64_t v33;
  void *v34;

  -[EMWorksheetMapper _initWithState:](self, "_initWithState:", a3);
  if (!self->mColumnGrid)
    return 0;
  -[EDWorksheet defaultColumnWidth](self->edWorksheet, "defaultColumnWidth");
  v5 = v4;
  -[EDWorksheet columnInfos](self->edWorksheet, "columnInfos");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v34, "count");
  if (v6)
  {
    v33 = v6;
    v7 = 0;
    v8 = -1;
    v9 = 0.0;
    while (v8 <= SLODWORD(self->mMaxPopulatedColumn))
    {
      objc_msgSend(v34, "objectAtIndex:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "range");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "firstColumn");
        v14 = objc_msgSend(v12, "lastColumn");
        if (v13 < 0 || (v15 = v14, v14 < 0) || self->mMaxPopulatedColumn < v13)
        {

          break;
        }
        if (v8 + 1 < v13)
        {
          v16 = -[EMColumnInfoMapper initWithDefaultWidth:span:parent:]([EMColumnInfoMapper alloc], "initWithDefaultWidth:span:parent:", v13 + ~v8, self, v5);
          -[EMColumnInfoMapper columnWidth](v16, "columnWidth");
          v18 = ~v8 + v13;
          v19 = &self->mColumnGrid[v8 + 1];
          do
          {
            *v19++ = v17;
            v9 = v17 + v9;
            --v18;
          }
          while (v18);

        }
        v20 = 0.0;
        if ((objc_msgSend(v11, "isHidden") & 1) == 0)
        {
          v21 = -[EMColumnInfoMapper initWithEDColumnInfo:maxSpan:parent:]([EMColumnInfoMapper alloc], "initWithEDColumnInfo:maxSpan:parent:", v11, self->mMaxPopulatedColumn - v8, self);
          -[EMColumnInfoMapper columnWidth](v21, "columnWidth");
          v20 = v22;

        }
        if (v13 <= v15)
        {
          v23 = v13;
          mMaxPopulatedColumn = self->mMaxPopulatedColumn;
          v25 = v15 - v13 + 1;
          do
          {
            if (mMaxPopulatedColumn < v23)
              break;
            self->mColumnGrid[v23] = v20;
            v9 = v20 + v9;
            ++v23;
            --v25;
          }
          while (v25);
        }

        v8 = v15;
      }
      else
      {
        v15 = v8;
      }
      if (++v7 == v33)
        goto LABEL_27;
    }
    v15 = v8;
  }
  else
  {
    v9 = 0.0;
    v15 = -1;
  }
LABEL_27:
  if (self->mMaxPopulatedColumn > v15)
  {
    v27 = -[EMColumnInfoMapper initWithDefaultWidth:span:parent:]([EMColumnInfoMapper alloc], "initWithDefaultWidth:span:parent:", self->mMaxPopulatedColumn - v15, self, v5);
    -[EMColumnInfoMapper columnWidth](v27, "columnWidth");
    v29 = self->mMaxPopulatedColumn;
    LODWORD(v30) = v15 + 1;
    if (v29 >= v15 + 1)
    {
      v30 = (int)v30;
      mColumnGrid = self->mColumnGrid;
      do
      {
        mColumnGrid[v30] = v28;
        v9 = v28 + v9;
        ++v30;
      }
      while (v29 >= v30);
    }

  }
  v26 = (int)v9;

  return v26;
}

- (void)_initWithState:(id)a3
{
  unint64_t mMaxPopulatedColumn;
  unint64_t v5;
  double *v6;
  id v7;

  v7 = a3;
  if (self->mMaxPopulatedRow < 0 && self->mMaxPopulatedColumn < 0 && !self->mColumnGrid)
  {
    -[EMWorksheetMapper countRowsAndColumnsWithState:](self, "countRowsAndColumnsWithState:", v7);
    mMaxPopulatedColumn = self->mMaxPopulatedColumn;
    if (mMaxPopulatedColumn <= 0x4000 && (v5 = mMaxPopulatedColumn + 1, 8 * (int)v5 / v5 == 8))
      v6 = (double *)malloc_type_malloc(8 * v5, 0xD809582AuLL);
    else
      v6 = 0;
    self->mColumnGrid = v6;
    -[EMWorksheetMapper setRowGrid](self, "setRowGrid");
  }

}

- (void)countRowsAndColumnsWithState:(id)a3
{
  void *v4;
  int v5;
  objc_class *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  EDCellHeader *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  EDResources *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t mMaxPopulatedColumn;
  BOOL v26;
  uint64_t v27;
  objc_class *v28;
  void *v29;
  id v30;
  char v31;
  EMWorksheetMapper *v32;
  void *v33;

  v30 = a3;
  if (self->mMaxPopulatedRow < 0 && self->mMaxPopulatedColumn < 0)
  {
    -[EDWorksheet rowBlocks](self->edWorksheet, "rowBlocks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->mMaxPopulatedColumn = 0;
    v29 = v4;
    v5 = objc_msgSend(v4, "maxPopulatedRow");
    self->mMaxPopulatedRow = 0;
    -[EDWorksheet mergedCells](self->edWorksheet, "mergedCells");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)(v5 + 1);
    if (v5 != -1)
    {
      v27 = 72;
      v28 = (objc_class *)(v5 + 1);
      v32 = self;
      v7 = 0;
      v8 = 0;
      do
      {
        v9 = v8;
        objc_msgSend(v4, "rowBlockForRowNumber:currentRowBlock:createIfNil:", v7, v8, 0, v27);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v10 = objc_msgSend(v8, "rowInfoWithRowNumber:", v7);
          v11 = v10;
          if (v10)
          {
            if (*(_DWORD *)(v10 + 8))
            {
              v12 = 0;
              v31 = 1;
              do
              {
                v13 = (EDCellHeader *)objc_msgSend(v8, "cellAtIndex:rowInfo:", v12, v11);
                v14 = columnNumberForEDCell(v13);
                objc_msgSend(v33, "referenceContainingRow:column:", v7, v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "lastColumn");
                if (v16 == 0x3FFF && (_DWORD)v14 == 0)
                  v18 = 0;
                else
                  v18 = v16;
                v19 = typeForEDCell(v13);
                if (v19)
                {
                  if (v19 != 3)
                    goto LABEL_18;
                  objc_msgSend(v30, "document");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "resources");
                  v21 = (EDResources *)objc_claimAutoreleasedReturnValue();
                  stringValueForEDCell(v13, v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v22, "string");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "length");

                  if (v24)
                  {
LABEL_18:
                    mMaxPopulatedColumn = v32->mMaxPopulatedColumn;
                    v26 = mMaxPopulatedColumn < v14;
                    if (mMaxPopulatedColumn <= v14)
                      mMaxPopulatedColumn = v14;
                    if (v26 || mMaxPopulatedColumn < v18)
                    {
                      v31 = 0;
                      if (mMaxPopulatedColumn <= v18)
                        mMaxPopulatedColumn = v18;
                      v32->mMaxPopulatedColumn = mMaxPopulatedColumn;
                    }
                    else
                    {
                      v31 = 0;
                    }
                  }
                }

                v12 = (v12 + 1);
              }
              while (v12 < *(_DWORD *)(v11 + 8));
              v6 = v28;
              v4 = v29;
              if ((v31 & 1) == 0 && (uint64_t)*(Class *)((char *)&v32->super.super.super.isa + v27) < (uint64_t)v7)
                *(Class *)((char *)&v32->super.super.super.isa + v27) = v7;
            }
          }
        }
        v7 = (objc_class *)((char *)v7 + 1);
      }
      while (v7 != v6);

    }
  }

}

- (void)setRowGrid
{
  int64_t mMaxPopulatedRow;
  unint64_t v4;
  double *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  BOOL v12;
  id v13;

  if ((self->mMaxPopulatedRow & 0x8000000000000000) == 0)
  {
    -[EDWorksheet rowBlocks](self->edWorksheet, "rowBlocks");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    mMaxPopulatedRow = self->mMaxPopulatedRow;
    v4 = mMaxPopulatedRow + 1;
    if (mMaxPopulatedRow == -1)
    {
      self->mRowGrid = 0;
    }
    else
    {
      if (8 * v4 / v4 == 8)
      {
        v5 = (double *)malloc_type_malloc(8 * v4, 0xD809582AuLL);
        mMaxPopulatedRow = self->mMaxPopulatedRow;
      }
      else
      {
        v5 = 0;
      }
      self->mRowGrid = v5;
      if ((mMaxPopulatedRow & 0x8000000000000000) == 0)
      {
        v6 = 0;
        v7 = 0;
        v8 = 1;
        do
        {
          objc_msgSend(v13, "rowBlockForRowNumber:currentRowBlock:createIfNil:", v8 - 1, v7, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = objc_msgSend(v9, "rowInfoWithRowNumber:", v8 - 1);
          if (!v10 || (v11 = *(unsigned __int16 *)(v10 + 20)) == 0)
            v11 = -[EDWorksheet defaultRowHeight](self->edWorksheet, "defaultRowHeight");
          self->mRowGrid[v6] = (double)v11;
          v6 = v8;
          v12 = self->mMaxPopulatedRow < v8++;
          v7 = v9;
        }
        while (!v12);

      }
    }

  }
}

- (id)columnWidthConvertor
{
  ECColumnWidthConvertor *mColumnWidthConvertor;
  ECColumnWidthConvertor *v4;
  ECColumnWidthConvertor *v5;
  ECColumnWidthConvertor *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  mColumnWidthConvertor = self->mColumnWidthConvertor;
  if (!mColumnWidthConvertor)
  {
    v4 = objc_alloc_init(ECColumnWidthConvertor);
    v5 = self->mColumnWidthConvertor;
    self->mColumnWidthConvertor = v4;

    v6 = self->mColumnWidthConvertor;
    WeakRetained = objc_loadWeakRetained((id *)&self->super.super.mParent);
    objc_msgSend(WeakRetained, "document");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "styles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultWorkbookStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECColumnWidthConvertor setupWithEDFont:state:](v6, "setupWithEDFont:state:", v12, 0);

    mColumnWidthConvertor = self->mColumnWidthConvertor;
  }
  return mColumnWidthConvertor;
}

- (int)preprocessHeightWithState:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  int v14;
  int v15;
  BOOL v16;

  -[EMWorksheetMapper _initWithState:](self, "_initWithState:", a3);
  -[EDWorksheet rowBlocks](self->edWorksheet, "rowBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maxPopulatedRow");
  if (v5 == -1)
  {
    v8 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = -1;
    do
    {
      v10 = v7;
      objc_msgSend(v4, "rowBlockForRowNumber:currentRowBlock:createIfNil:", v6, v7, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v11 = objc_msgSend(v7, "rowInfoWithRowNumber:", v6);
        v13 = v11;
        if (v11)
        {
          v14 = *(_DWORD *)(v11 + 4);
          if (v14 > SLODWORD(self->mMaxPopulatedRow))
            break;
          if (v9 + 1 < v14)
          {
            v15 = ~v9 + v14;
            do
            {
              v12 = (double)-[EDWorksheet defaultRowHeight](self->edWorksheet, "defaultRowHeight") / 20.0 + (double)v8;
              v8 = (int)v12;
              --v15;
            }
            while (v15);
          }
          LOWORD(v12) = *(_WORD *)(v13 + 20);
          v8 = (int)((double)*(unint64_t *)&v12 / 20.0 + (double)v8);
          v9 = v14;
        }
      }
      v16 = (_DWORD)v6 == v5;
      v6 = (v6 + 1);
    }
    while (!v16);

  }
  return v8;
}

- (CGSize)preprocessDrawableSizeWithState:(id)a3
{
  double v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  EMDrawableMapper *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v5 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v6 = -[EDSheet drawableCount](self->edWorksheet, "drawableCount", a3);
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      -[EDSheet drawableAtIndex:](self->edWorksheet, "drawableAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[EMDrawableMapper initWithOADDrawable:parent:]([EMDrawableMapper alloc], "initWithOADDrawable:parent:", v9, self);
      -[EMDrawableMapper getImageRect](v10, "getImageRect");
      v15 = v13 + v14;
      if (v15 > v5)
        v5 = v15;
      if (v11 + v12 > v4)
        v4 = v11 + v12;

    }
  }
  v16 = v5;
  v17 = v4;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[EMWorksheetMapper _initWithState:](self, "_initWithState:", v6);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMWorksheetMapper readHyperlinksWithState:](self, "readHyperlinksWithState:", v6);
  -[EMWorksheetMapper mapTableAt:withState:](self, "mapTableAt:withState:", v7, v6);
  -[EMWorksheetMapper mapDrawablesAt:withState:](self, "mapDrawablesAt:withState:", v7, v6);
  if (objc_msgSend(v7, "childrenCount") >= 1)
    objc_msgSend(v8, "addChild:", v7);

}

- (void)mapTableAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  EMRowMapper *v18;
  unint64_t v19;
  char v20;
  char v21;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;

  v24 = a3;
  v6 = a4;
  v25 = v6;
  if (-[EMWorksheetMapper isVisible](self, "isVisible"))
  {
    -[EDWorksheet rowBlocks](self->edWorksheet, "rowBlocks");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((self->mMaxPopulatedRow & 0x8000000000000000) == 0)
    {
      +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addChild:", v7);
      -[EMWorksheetMapper mapColumnInfosAt:withState:](self, "mapColumnInfosAt:withState:", v7, v6);
      -[CMStyle cssStyleString](self->mStyle, "cssStyleString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("style"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "addAttribute:", v9);
      -[EMWorksheetMapper mapWorksheetClassesAtTableNode:](self, "mapWorksheetClassesAtTableNode:", v7);
      if ((self->mMaxPopulatedRow & 0x8000000000000000) == 0)
      {
        v23 = v9;
        v10 = 0;
        v11 = 0;
        v12 = -1;
        do
        {
          objc_msgSend(v27, "rowBlockForRowNumber:currentRowBlock:createIfNil:", v10, v11, 0, v23);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v14 = objc_msgSend(v13, "rowInfoWithRowNumber:", v10);
            v15 = v14;
            if (v14)
            {
              v16 = *(_DWORD *)(v14 + 4);
              if (v16 > SLODWORD(self->mMaxPopulatedRow))
                break;
              v26 = *(_DWORD *)(v14 + 4);
              if (v12 + 1 < v16)
              {
                v17 = ~v12 + v16;
                do
                {
                  +[EMRowMapper mapEmptyRowAt:colspan:height:](EMRowMapper, "mapEmptyRowAt:colspan:height:", v7, self->mMaxPopulatedColumn + 1, (double)-[EDWorksheet defaultRowHeight](self->edWorksheet, "defaultRowHeight"));
                  self->mHeight = (int)((double)-[EDWorksheet defaultRowHeight](self->edWorksheet, "defaultRowHeight")
                                      / 20.0
                                      + (double)self->mHeight);
                  --v17;
                }
                while (v17);
              }
              v18 = -[EMRowMapper initWithEDRowBlock:rowInfo:parent:]([EMRowMapper alloc], "initWithEDRowBlock:rowInfo:parent:", v13, v15, self);
              LOWORD(v19) = *(_WORD *)(v15 + 20);
              self->mHeight = (int)((double)v19 / 20.0 + (double)self->mHeight);
              v6 = v25;
              -[EMRowMapper mapAt:withState:](v18, "mapAt:withState:", v7, v25);
              v20 = objc_msgSend(v25, "isThumbnail");
              v21 = v10 > 0xC8 ? v20 : 0;

              v12 = v26;
              if ((v21 & 1) != 0)
                break;
            }
          }
          if (v10 > 0xFFE)
            break;
          v11 = v13;
        }
        while (self->mMaxPopulatedRow > (uint64_t)v10++);

        v9 = v23;
      }

    }
  }

}

- (BOOL)isVisible
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[EDSheet isHidden](self->edWorksheet, "isHidden"))
    return 0;
  -[EDWorksheet rowBlocks](self->edWorksheet, "rowBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "rowBlockCount"))
  {
    v3 = 1;
  }
  else
  {
    -[EDWorksheet columnInfos](self->edWorksheet, "columnInfos");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v3 = 1;
    }
    else
    {
      -[EDWorksheet maxCellReferencedInFormulas](self->edWorksheet, "maxCellReferencedInFormulas");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v6 != 0;

    }
  }

  return v3;
}

- (void)mapColumnInfosAt:(id)a3 withState:(id)a4
{
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  EMColumnInfoMapper *v19;
  double v20;
  int v21;
  double *v22;
  double v23;
  EMColumnInfoMapper *v24;
  double v25;
  int64_t v26;
  int64_t mMaxPopulatedColumn;
  int v28;
  EMColumnInfoMapper *v29;
  double v30;
  int64_t v31;
  uint64_t v32;
  double *mColumnGrid;
  uint64_t v34;
  CMLengthProperty *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;

  v39 = a3;
  v38 = a4;
  if ((self->mMaxPopulatedColumn & 0x8000000000000000) == 0)
  {
    -[EDWorksheet defaultColumnWidth](self->edWorksheet, "defaultColumnWidth");
    v7 = v6;
    -[EDWorksheet columnInfos](self->edWorksheet, "columnInfos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v8;
    v9 = objc_msgSend(v8, "count");
    if (v9)
    {
      v37 = v9;
      v10 = 0;
      v11 = -1;
      v12 = 0.0;
      while (v11 < SLODWORD(self->mMaxPopulatedColumn))
      {
        objc_msgSend(v8, "objectAtIndex:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "range");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "firstColumn");
          v17 = objc_msgSend(v15, "lastColumn");
          if (v16 < 0 || (v18 = v17, v17 < 0) || self->mMaxPopulatedColumn < v16 || !self->mColumnGrid)
          {

            v18 = v11;
            v8 = v36;
            goto LABEL_27;
          }
          if (v11 + 1 < v16)
          {
            v19 = -[EMColumnInfoMapper initWithDefaultWidth:span:parent:]([EMColumnInfoMapper alloc], "initWithDefaultWidth:span:parent:", v16 + ~v11, self, v7);
            -[EMColumnInfoMapper mapAt:withState:](v19, "mapAt:withState:", v39, v38);
            -[EMColumnInfoMapper columnWidth](v19, "columnWidth");
            v21 = ~v11 + v16;
            v22 = &self->mColumnGrid[v11 + 1];
            do
            {
              *v22++ = v20;
              v12 = v20 + v12;
              --v21;
            }
            while (v21);

          }
          v23 = 0.0;
          if ((objc_msgSend(v14, "isHidden") & 1) == 0)
          {
            v24 = -[EMColumnInfoMapper initWithEDColumnInfo:maxSpan:parent:]([EMColumnInfoMapper alloc], "initWithEDColumnInfo:maxSpan:parent:", v14, self->mMaxPopulatedColumn - v11, self);
            -[EMColumnInfoMapper mapAt:withState:](v24, "mapAt:withState:", v39, v38);
            -[EMColumnInfoMapper columnWidth](v24, "columnWidth");
            v23 = v25;

          }
          if (v16 <= v18)
          {
            v26 = v16;
            mMaxPopulatedColumn = self->mMaxPopulatedColumn;
            v28 = v18 - v16 + 1;
            do
            {
              if (mMaxPopulatedColumn < v26)
                break;
              self->mColumnGrid[v26] = v23;
              v12 = v23 + v12;
              ++v26;
              --v28;
            }
            while (v28);
          }

          v11 = v18;
          v8 = v36;
        }
        else
        {
          v18 = v11;
        }
        if (++v10 == v37)
          goto LABEL_27;
      }
      v18 = v11;
    }
    else
    {
      v12 = 0.0;
      v18 = -1;
    }
LABEL_27:
    if (v18 < SLODWORD(self->mMaxPopulatedColumn) && self->mColumnGrid)
    {
      v29 = -[EMColumnInfoMapper initWithDefaultWidth:span:parent:]([EMColumnInfoMapper alloc], "initWithDefaultWidth:span:parent:", self->mMaxPopulatedColumn - v18, self, v7);
      -[EMColumnInfoMapper mapAt:withState:](v29, "mapAt:withState:", v39, v38);
      -[EMColumnInfoMapper columnWidth](v29, "columnWidth");
      v31 = self->mMaxPopulatedColumn;
      if (v31 >= v18 + 1)
      {
        v32 = v18 + 1;
        mColumnGrid = self->mColumnGrid;
        v34 = v18 + 1;
        do
        {
          mColumnGrid[v32] = v30;
          v12 = v30 + v12;
          v32 = ++v34;
        }
        while (v31 >= v34);
      }

    }
    v35 = -[CMLengthProperty initWithNumber:]([CMLengthProperty alloc], "initWithNumber:", v12);
    -[CMStyle addProperty:forKey:](self->mStyle, "addProperty:forKey:", v35, CFSTR("width"));
    self->mWidth = (int)v12;

  }
}

- (double)columnGrid
{
  return self->mColumnGrid;
}

- (unint64_t)columnCount
{
  return self->mMaxPopulatedColumn + 1;
}

- (void)mapDrawablesAt:(id)a3 withState:(id)a4
{
  id v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  EMDrawableMapper *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  int v16;
  id v17;

  v17 = a3;
  v6 = a4;
  v7 = -[EDSheet drawableCount](self->edWorksheet, "drawableCount");
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      -[EDSheet drawableAtIndex:](self->edWorksheet, "drawableAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[EMDrawableMapper initWithOADDrawable:parent:]([EMDrawableMapper alloc], "initWithOADDrawable:parent:", v9, self);
      -[EMDrawableMapper mapAt:withState:](v10, "mapAt:withState:", v17, v6);
      -[CMDrawableMapper box](v10, "box");
      v15 = (int)(v13 + v14);
      if (self->mWidth < v15)
        self->mWidth = v15;
      v16 = (int)(v11 + v12);
      if (self->mHeight < v16)
        self->mHeight = v16;

    }
  }

}

- (int)width
{
  return self->mWidth;
}

- (int)height
{
  return self->mHeight;
}

- (void)dealloc
{
  double *mColumnGrid;
  double *mRowGrid;
  objc_super v5;

  mColumnGrid = self->mColumnGrid;
  if (mColumnGrid)
    free(mColumnGrid);
  mRowGrid = self->mRowGrid;
  if (mRowGrid)
    free(mRowGrid);
  v5.receiver = self;
  v5.super_class = (Class)EMWorksheetMapper;
  -[EMWorksheetMapper dealloc](&v5, sel_dealloc);
}

- (double)rowGrid
{
  return self->mRowGrid;
}

- (int64_t)maxRowNumber
{
  return self->mMaxPopulatedRow;
}

- (double)defaultColumnWidth
{
  double result;

  -[EDWorksheet defaultColumnWidth](self->edWorksheet, "defaultColumnWidth");
  -[EMWorksheetMapper xlColumnWidthToPoints:](self, "xlColumnWidthToPoints:");
  return result;
}

- (double)xlColumnWidthToPoints:(double)a3
{
  return a3 * 5.83300018;
}

- (double)defaultRowHeight
{
  return (double)-[EDWorksheet defaultRowHeight](self->edWorksheet, "defaultRowHeight");
}

- (void)readHyperlinksWithState:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  -[EDWorksheet hyperlinks](self->edWorksheet, "hyperlinks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      -[EDWorksheet hyperlinks](self->edWorksheet, "hyperlinks");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "reference");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "firstRow");
      objc_msgSend(v8, "reference");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHyperlink:forRow:column:", v8, v10, (int)objc_msgSend(v11, "firstColumn"));

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColumnWidthConvertor, 0);
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->edWorksheet, 0);
}

- (void)mapWorksheetClassesAtTableNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[EDSheet isDisplayGridlines](self->edWorksheet, "isDisplayGridlines"))
  {
    objc_msgSend(&unk_24F46A318, "arrayByAddingObject:", CFSTR("showGridlines"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &unk_24F46A318;
  }
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("class"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAttribute:", v6);
}

@end
