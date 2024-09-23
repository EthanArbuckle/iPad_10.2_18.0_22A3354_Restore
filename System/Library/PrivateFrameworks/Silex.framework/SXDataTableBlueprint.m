@implementation SXDataTableBlueprint

- (SXDataTableBlueprint)initWithNumberOfRows:(unint64_t)a3 numberOfColumns:(unint64_t)a4 withTableInsets:(UIEdgeInsets)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  SXDataTableBlueprint *v11;
  SXDataTableBlueprint *v12;
  uint64_t v13;
  SXDataTableDictionary *blueprint;
  uint64_t v15;
  SXDataTableDictionary *contentBlueprint;
  uint64_t v17;
  SXDataTableDictionary *rowDividers;
  uint64_t v19;
  SXDataTableDictionary *columnDividers;
  objc_super v22;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v22.receiver = self;
  v22.super_class = (Class)SXDataTableBlueprint;
  v11 = -[SXDataTableBlueprint init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_numberOfRows = a3;
    v11->_numberOfColumns = a4;
    v11->_tableInsets.top = top;
    v11->_tableInsets.left = left;
    v11->_tableInsets.bottom = bottom;
    v11->_tableInsets.right = right;
    +[SXDataTableDictionary dataTableDictionaryWithRows:andColumns:](SXDataTableDictionary, "dataTableDictionaryWithRows:andColumns:", a3, a4);
    v13 = objc_claimAutoreleasedReturnValue();
    blueprint = v12->_blueprint;
    v12->_blueprint = (SXDataTableDictionary *)v13;

    +[SXDataTableDictionary dataTableDictionaryWithRows:andColumns:](SXDataTableDictionary, "dataTableDictionaryWithRows:andColumns:", a3, a4);
    v15 = objc_claimAutoreleasedReturnValue();
    contentBlueprint = v12->_contentBlueprint;
    v12->_contentBlueprint = (SXDataTableDictionary *)v15;

    +[SXDataTableDictionary dataTableDictionaryWithRows:andColumns:](SXDataTableDictionary, "dataTableDictionaryWithRows:andColumns:", a3, a4);
    v17 = objc_claimAutoreleasedReturnValue();
    rowDividers = v12->_rowDividers;
    v12->_rowDividers = (SXDataTableDictionary *)v17;

    +[SXDataTableDictionary dataTableDictionaryWithRows:andColumns:](SXDataTableDictionary, "dataTableDictionaryWithRows:andColumns:", a3, a4);
    v19 = objc_claimAutoreleasedReturnValue();
    columnDividers = v12->_columnDividers;
    v12->_columnDividers = (SXDataTableDictionary *)v19;

  }
  return v12;
}

- (void)addCellRect:(CGRect)a3 forIndexPath:(id)a4
{
  unint64_t var1;
  unint64_t var0;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  id v11;

  var1 = a4.var1;
  var0 = a4.var0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SXDataTableBlueprint blueprint](self, "blueprint");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forIndexPath:", v10, var0, var1);

}

- (void)addCellContentRect:(CGRect)a3 forIndexPath:(id)a4
{
  unint64_t var1;
  unint64_t var0;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  id v11;

  var1 = a4.var1;
  var0 = a4.var0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SXDataTableBlueprint contentBlueprint](self, "contentBlueprint");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forIndexPath:", v10, var0, var1);

}

- (void)addColumnDividerRect:(CGRect)a3 forIndexPath:(id)a4
{
  unint64_t var1;
  unint64_t var0;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  id v11;

  var1 = a4.var1;
  var0 = a4.var0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SXDataTableBlueprint columnDividers](self, "columnDividers");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forIndexPath:", v10, var0, var1);

}

- (void)addRowDividerRect:(CGRect)a3 forIndexPath:(id)a4
{
  unint64_t var1;
  unint64_t var0;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  id v11;

  var1 = a4.var1;
  var0 = a4.var0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SXDataTableBlueprint rowDividers](self, "rowDividers");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forIndexPath:", v10, var0, var1);

}

- (CGRect)cellRectForIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  var1 = a3.var1;
  var0 = a3.var0;
  -[SXDataTableBlueprint blueprint](self, "blueprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForIndexPath:", var0, var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)cellContentRectForIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  var1 = a3.var1;
  var0 = a3.var0;
  -[SXDataTableBlueprint contentBlueprint](self, "contentBlueprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForIndexPath:", var0, var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)rectForColumnDividerAtIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  var1 = a3.var1;
  var0 = a3.var0;
  -[SXDataTableBlueprint columnDividers](self, "columnDividers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForIndexPath:", var0, var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)rectForRowDividerAtIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  var1 = a3.var1;
  var0 = a3.var0;
  -[SXDataTableBlueprint rowDividers](self, "rowDividers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForIndexPath:", var0, var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)rectForRowAtIndex:(unint64_t)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MaxX;
  double MinY;
  double Height;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double MinX;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  -[SXDataTableBlueprint cellRectForIndexPath:](self, "cellRectForIndexPath:", a3, 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SXDataTableBlueprint cellRectForIndexPath:](self, "cellRectForIndexPath:", a3, -[SXDataTableBlueprint numberOfColumns](self, "numberOfColumns") - 1);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v33.origin.x = v6;
  v33.origin.y = v8;
  v33.size.width = v10;
  v33.size.height = v12;
  MinX = CGRectGetMinX(v33);
  v34.origin.x = v14;
  v34.origin.y = v16;
  v34.size.width = v18;
  v34.size.height = v20;
  MaxX = CGRectGetMaxX(v34);
  v35.origin.x = v6;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = v12;
  MinY = CGRectGetMinY(v35);
  v36.origin.x = v6;
  v36.origin.y = v8;
  v36.size.width = v10;
  v36.size.height = v12;
  Height = CGRectGetHeight(v36);
  -[SXDataTableBlueprint rectForRowDividerAtIndexPath:](self, "rectForRowDividerAtIndexPath:", a3, 0);
  v24 = Height + CGRectGetHeight(v37);
  if (!a3)
  {
    -[SXDataTableBlueprint tableInsets](self, "tableInsets");
    MinY = MinY - v25;
    -[SXDataTableBlueprint tableInsets](self, "tableInsets");
    v24 = v24 + v26;
  }
  if (-[SXDataTableBlueprint numberOfRows](self, "numberOfRows") - 1 == a3)
  {
    -[SXDataTableBlueprint tableInsets](self, "tableInsets");
    v24 = v24 + v27;
  }
  v28 = MinX;
  v29 = MaxX - MinX;
  v30 = MinY;
  v31 = v24;
  result.size.height = v31;
  result.size.width = v29;
  result.origin.y = v30;
  result.origin.x = v28;
  return result;
}

- (CGRect)rectForColumnAtIndex:(unint64_t)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double MinY;
  double MaxY;
  double MinX;
  double Width;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  -[SXDataTableBlueprint cellRectForIndexPath:](self, "cellRectForIndexPath:", -[SXDataTableBlueprint numberOfRows](self, "numberOfRows") - 1, a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SXDataTableBlueprint cellRectForIndexPath:](self, "cellRectForIndexPath:", 0, 0);
  MinY = CGRectGetMinY(v25);
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  MaxY = CGRectGetMaxY(v26);
  v27.origin.x = v6;
  v27.origin.y = v8;
  v27.size.width = v10;
  v27.size.height = v12;
  MinX = CGRectGetMinX(v27);
  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  Width = CGRectGetWidth(v28);
  -[SXDataTableBlueprint rectForColumnDividerAtIndexPath:](self, "rectForColumnDividerAtIndexPath:", 0, a3);
  v17 = Width + CGRectGetWidth(v29);
  if (!a3)
  {
    -[SXDataTableBlueprint tableInsets](self, "tableInsets");
    MinX = MinX - v18;
    -[SXDataTableBlueprint tableInsets](self, "tableInsets");
    v17 = v17 + v19;
  }
  if (-[SXDataTableBlueprint numberOfColumns](self, "numberOfColumns") - 1 == a3)
  {
    -[SXDataTableBlueprint tableInsets](self, "tableInsets");
    v17 = v17 + v20;
  }
  v21 = MaxY - MinY;
  v22 = MinX;
  v23 = MinY;
  v24 = v17;
  result.size.height = v21;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)isRectValid:(CGRect)a3
{
  BOOL v3;

  v3 = a3.origin.x != 1.79769313e308;
  if (a3.origin.y == 1.79769313e308)
    v3 = 0;
  if (a3.size.width == 1.79769313e308)
    v3 = 0;
  return a3.size.height != 1.79769313e308 && v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  void *v35;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>\n\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" - Cells -\n"));
  if (-[SXDataTableBlueprint numberOfRows](self, "numberOfRows"))
  {
    v7 = 0;
    do
    {
      if (-[SXDataTableBlueprint numberOfRows](self, "numberOfRows"))
      {
        v8 = 0;
        do
        {
          -[SXDataTableBlueprint blueprint](self, "blueprint");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForIndexPath:", v7, v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "CGRectValue");
          v12 = v11;
          v14 = v13;
          v16 = v15;
          v18 = v17;

          -[SXDataTableBlueprint contentBlueprint](self, "contentBlueprint");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForIndexPath:", v7, v8);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "CGRectValue");
          v22 = v21;
          v24 = v23;
          v26 = v25;
          v28 = v27;

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{row: %lu, column: %lu}"), v7, v8);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v37.origin.x = v12;
          v37.origin.y = v14;
          v37.size.width = v16;
          v37.size.height = v18;
          NSStringFromCGRect(v37);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v38.origin.x = v22;
          v38.origin.y = v24;
          v38.size.width = v26;
          v38.size.height = v28;
          NSStringFromCGRect(v38);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("%@; cell: %@; content: %@ \n"), v29, v30, v31);

          ++v8;
        }
        while (v8 < -[SXDataTableBlueprint numberOfRows](self, "numberOfRows"));
      }
      ++v7;
    }
    while (v7 < -[SXDataTableBlueprint numberOfRows](self, "numberOfRows"));
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("\n - Rows -\n"));
  if (-[SXDataTableBlueprint numberOfRows](self, "numberOfRows"))
  {
    v32 = 0;
    do
    {
      -[SXDataTableBlueprint rectForRowAtIndex:](self, "rectForRowAtIndex:", v32);
      NSStringFromCGRect(v39);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("{row: %lu}; %@\n"), v32, v33);

      ++v32;
    }
    while (v32 < -[SXDataTableBlueprint numberOfRows](self, "numberOfRows"));
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("\n - Columns -\n"));
  if (-[SXDataTableBlueprint numberOfColumns](self, "numberOfColumns"))
  {
    v34 = 0;
    do
    {
      -[SXDataTableBlueprint rectForColumnAtIndex:](self, "rectForColumnAtIndex:", v34);
      NSStringFromCGRect(v40);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("{column: %lu}; %@\n"), v34, v35);

      ++v34;
    }
    while (v34 < -[SXDataTableBlueprint numberOfColumns](self, "numberOfColumns"));
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("\n --- END --- "));
  return v6;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (UIEdgeInsets)tableInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_tableInsets.top;
  left = self->_tableInsets.left;
  bottom = self->_tableInsets.bottom;
  right = self->_tableInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)tableSize
{
  double width;
  double height;
  CGSize result;

  width = self->_tableSize.width;
  height = self->_tableSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTableSize:(CGSize)a3
{
  self->_tableSize = a3;
}

- (SXDataTableDictionary)blueprint
{
  return self->_blueprint;
}

- (SXDataTableDictionary)contentBlueprint
{
  return self->_contentBlueprint;
}

- (SXDataTableDictionary)rowDividers
{
  return self->_rowDividers;
}

- (SXDataTableDictionary)columnDividers
{
  return self->_columnDividers;
}

- (unint64_t)dataOrientation
{
  return self->_dataOrientation;
}

- (void)setDataOrientation:(unint64_t)a3
{
  self->_dataOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnDividers, 0);
  objc_storeStrong((id *)&self->_rowDividers, 0);
  objc_storeStrong((id *)&self->_contentBlueprint, 0);
  objc_storeStrong((id *)&self->_blueprint, 0);
}

@end
