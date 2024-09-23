@implementation SKUIShelfLayoutData

- (SKUIShelfLayoutData)initWithNumberOfRows:(int64_t)a3 columnSpacing:(double)a4
{
  SKUIShelfLayoutData *v7;
  SKUIShelfLayoutData *v8;
  NSMutableArray *v9;
  NSMutableArray *columnWidths;
  objc_super v12;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIShelfLayoutData initWithNumberOfRows:columnSpacing:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIShelfLayoutData;
  v7 = -[SKUIShelfLayoutData init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_columnSpacing = a4;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    columnWidths = v8->_columnWidths;
    v8->_columnWidths = v9;

    v8->_numberOfRows = a3;
    v8->_rowHeights = (double *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
  }
  return v8;
}

- (void)dealloc
{
  double *rowHeights;
  objc_super v4;

  rowHeights = self->_rowHeights;
  if (rowHeights)
    free(rowHeights);
  v4.receiver = self;
  v4.super_class = (Class)SKUIShelfLayoutData;
  -[SKUIShelfLayoutData dealloc](&v4, sel_dealloc);
}

- (double)columnWidthForIndex:(int64_t)a3
{
  void *v3;
  float v4;
  double v5;

  -[NSMutableArray objectAtIndex:](self->_columnWidths, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)enumerateColumnsUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *columnWidths;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  columnWidths = self->_columnWidths;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SKUIShelfLayoutData_enumerateColumnsUsingBlock___block_invoke;
  v7[3] = &unk_1E73A60B0;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](columnWidths, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __50__SKUIShelfLayoutData_enumerateColumnsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  float v7;

  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "floatValue");
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, double))(v6 + 16))(v6, a3, a4, v7);
}

- (void)enumerateRowsUsingBlock:(id)a3
{
  int64_t v5;
  char v6;

  if (self->_numberOfRows >= 1)
  {
    v5 = 0;
    do
    {
      v6 = 0;
      (*((void (**)(id, int64_t, char *, double))a3 + 2))(a3, v5, &v6, self->_rowHeights[v5]);
      if (v6)
        break;
      ++v5;
    }
    while (v5 < self->_numberOfRows);
  }
}

- (int64_t)numberOfColumns
{
  return -[NSMutableArray count](self->_columnWidths, "count");
}

- (void)reloadWithItemCount:(int64_t)a3 sizeBlock:(id)a4
{
  int64_t v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double *rowHeights;
  int64_t numberOfRows;
  double v16;
  id v17;
  double v18;
  void *v19;
  double (**v20)(id, _QWORD);

  v20 = (double (**)(id, _QWORD))a4;
  -[NSMutableArray removeAllObjects](self->_columnWidths, "removeAllObjects");
  bzero(self->_rowHeights, 8 * self->_numberOfRows);
  if (a3 >= 1)
  {
    v6 = 0;
    do
    {
      v7 = (void *)MEMORY[0x1BCCE6C7C]();
      if (self->_numberOfRows < 1)
      {
        v11 = 0.0;
      }
      else
      {
        v8 = 0;
        if (v6 <= a3)
          v9 = a3;
        else
          v9 = v6;
        v10 = v9 - v6;
        v11 = 0.0;
        do
        {
          if (v10 == v8)
            break;
          v12 = v20[2](v20, v6 + v8);
          if (v11 < v12)
            v11 = v12;
          numberOfRows = self->_numberOfRows;
          rowHeights = self->_rowHeights;
          v16 = rowHeights[v8];
          if (v16 < v13)
            v16 = v13;
          rowHeights[v8++] = v16;
        }
        while (v8 < numberOfRows);
      }
      v17 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v18 = v11;
      v19 = (void *)objc_msgSend(v17, "initWithFloat:", v18);
      -[NSMutableArray addObject:](self->_columnWidths, "addObject:", v19);

      objc_autoreleasePoolPop(v7);
      v6 += self->_numberOfRows;
    }
    while (v6 < a3);
  }

}

- (double)rowHeightForIndex:(int64_t)a3
{
  return self->_rowHeights[a3];
}

- (CGSize)sizeForItemAtIndex:(int64_t)a3
{
  int64_t numberOfRows;
  int64_t v5;
  void *v6;
  float v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  numberOfRows = self->_numberOfRows;
  v5 = a3 % numberOfRows;
  -[NSMutableArray objectAtIndex:](self->_columnWidths, "objectAtIndex:", a3 / numberOfRows);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;
  v9 = self->_rowHeights[v5];

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)totalContentSize
{
  double v3;
  int64_t numberOfRows;
  double *rowHeights;
  double v6;
  double v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGSize result;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  numberOfRows = self->_numberOfRows;
  if (numberOfRows >= 1)
  {
    rowHeights = self->_rowHeights;
    do
    {
      v6 = *rowHeights++;
      v3 = v3 + v6;
      --numberOfRows;
    }
    while (numberOfRows);
  }
  v7 = *MEMORY[0x1E0C9D820];
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_columnWidths;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "floatValue", (_QWORD)v17);
        v7 = v7 + v13;
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v14 = -[NSMutableArray count](self->_columnWidths, "count");
  if (v14 >= 2)
    v7 = v7 + (double)(v14 - 1) * self->_columnSpacing;
  v15 = v3 + self->_contentInset.bottom + self->_contentInset.top;
  v16 = v7 + self->_contentInset.left + self->_contentInset.right;
  result.height = v15;
  result.width = v16;
  return result;
}

- (double)columnSpacing
{
  return self->_columnSpacing;
}

- (int64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnWidths, 0);
}

- (void)initWithNumberOfRows:columnSpacing:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIShelfLayoutData initWithNumberOfRows:columnSpacing:]";
}

@end
