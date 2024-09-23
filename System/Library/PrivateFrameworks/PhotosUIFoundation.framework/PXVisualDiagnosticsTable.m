@implementation PXVisualDiagnosticsTable

- (PXVisualDiagnosticsTable)init
{
  PXVisualDiagnosticsTable *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXVisualDiagnosticsTable;
  result = -[PXVisualDiagnosticsTable init](&v4, sel_init);
  if (result)
  {
    result->_defaultRowHeight = 30.0;
    v3 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    result->_nextRowAvailableFrame.origin = (CGPoint)*MEMORY[0x24BDBF070];
    result->_nextRowAvailableFrame.size = v3;
  }
  return result;
}

- (void)configureColumnsWithConfiguration:(id)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary *mutableColumns;
  NSMutableArray *v7;
  NSMutableArray *mutableColumnIdentifiers;
  _PXVisualDiagnosticsTableRow *v9;
  _PXVisualDiagnosticsTableRow *headerRow;
  NSDictionary *v11;
  NSDictionary *columns;
  NSMutableDictionary *v13;
  NSMutableArray *v14;
  void *v15;
  void (**v16)(id, PXVisualDiagnosticsTable *);

  v16 = (void (**)(id, PXVisualDiagnosticsTable *))a3;
  if (self->_mutableColumns)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVisualDiagnosticsTable.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_mutableColumns == nil"));

  }
  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mutableColumns = self->_mutableColumns;
  self->_mutableColumns = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  mutableColumnIdentifiers = self->_mutableColumnIdentifiers;
  self->_mutableColumnIdentifiers = v7;

  v9 = -[_PXVisualDiagnosticsTableRow initWithTable:availableColumnIdentifiers:]([_PXVisualDiagnosticsTableRow alloc], "initWithTable:availableColumnIdentifiers:", self, 0);
  headerRow = self->_headerRow;
  self->_headerRow = v9;

  v16[2](v16, self);
  v11 = (NSDictionary *)-[NSMutableDictionary copy](self->_mutableColumns, "copy");
  columns = self->_columns;
  self->_columns = v11;

  objc_storeStrong((id *)&self->_columnIdentifiers, self->_mutableColumnIdentifiers);
  v13 = self->_mutableColumns;
  self->_mutableColumns = 0;

  v14 = self->_mutableColumnIdentifiers;
  self->_mutableColumnIdentifiers = 0;

}

- (void)renderInContext:(id)a3 withRowsConfiguration:(id)a4
{
  PXVisualDiagnosticsContext *v7;
  PXVisualDiagnosticsContext *context;
  PXVisualDiagnosticsContext *v9;
  PXVisualDiagnosticsContext *v10;
  void *v11;
  void (**v12)(id, PXVisualDiagnosticsTable *);

  v7 = (PXVisualDiagnosticsContext *)a3;
  v12 = (void (**)(id, PXVisualDiagnosticsTable *))a4;
  if (self->_context)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVisualDiagnosticsTable.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_context == nil"));

    context = self->_context;
  }
  else
  {
    context = 0;
  }
  self->_context = v7;
  v9 = v7;

  -[PXVisualDiagnosticsContext beginPage](self->_context, "beginPage");
  v12[2](v12, self);
  -[PXVisualDiagnosticsContext endPage](self->_context, "endPage");
  v10 = self->_context;
  self->_context = 0;

}

- (void)addColumnWithIdentifier:(id)a3 configuration:(id)a4
{
  id v7;
  void (**v8)(id, _PXVisualDiagnosticsTableColumn *);
  NSMutableDictionary *mutableColumns;
  void *v10;
  _PXVisualDiagnosticsTableColumn *v11;
  _PXVisualDiagnosticsTableRow *headerRow;
  _PXVisualDiagnosticsTableColumn *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  _PXVisualDiagnosticsTableColumn *v17;

  v7 = a3;
  v8 = (void (**)(id, _PXVisualDiagnosticsTableColumn *))a4;
  mutableColumns = self->_mutableColumns;
  if (!mutableColumns)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVisualDiagnosticsTable.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_mutableColumns != nil"));

    mutableColumns = self->_mutableColumns;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](mutableColumns, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVisualDiagnosticsTable.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_mutableColumns[columnIdentifier] == nil"));

  }
  -[NSMutableArray addObject:](self->_mutableColumnIdentifiers, "addObject:", v7);
  v11 = objc_alloc_init(_PXVisualDiagnosticsTableColumn);
  v8[2](v8, v11);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableColumns, "setObject:forKeyedSubscript:", v11, v7);
  headerRow = self->_headerRow;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __66__PXVisualDiagnosticsTable_addColumnWithIdentifier_configuration___block_invoke;
  v16[3] = &unk_2514CFF40;
  v17 = v11;
  v13 = v11;
  -[_PXVisualDiagnosticsTableRow addCellForColumnWithIdentifier:rendering:](headerRow, "addCellForColumnWithIdentifier:rendering:", v7, v16);

}

- (void)addRowWithConfiguration:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _PXVisualDiagnosticsTableRow *v8;
  CGFloat v9;
  void (**v10)(id, _PXVisualDiagnosticsTableRow *);

  v10 = (void (**)(id, _PXVisualDiagnosticsTableRow *))a3;
  v4 = (void *)MEMORY[0x24950CD7C]();
  v5 = objc_alloc(MEMORY[0x24BDBCF20]);
  -[PXVisualDiagnosticsTable columnIdentifiers](self, "columnIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  v8 = -[_PXVisualDiagnosticsTableRow initWithTable:availableColumnIdentifiers:]([_PXVisualDiagnosticsTableRow alloc], "initWithTable:availableColumnIdentifiers:", self, v7);
  v10[2](v10, v8);
  if (!CGRectIsNull(self->_nextRowAvailableFrame))
  {
    -[_PXVisualDiagnosticsTableRow height](v8, "height");
    if (v9 > CGRectGetHeight(self->_nextRowAvailableFrame))
      -[PXVisualDiagnosticsTable _insertPageBreak](self, "_insertPageBreak");
  }
  -[PXVisualDiagnosticsTable _renderTitleIfNeeded](self, "_renderTitleIfNeeded");
  -[PXVisualDiagnosticsTable _renderRow:](self, "_renderRow:", v8);

  objc_autoreleasePoolPop(v4);
}

- (void)_insertPageBreak
{
  PXVisualDiagnosticsContext *context;
  CGSize v4;
  void *v6;

  context = self->_context;
  if (!context)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVisualDiagnosticsTable.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_context != nil"));

    context = self->_context;
  }
  -[PXVisualDiagnosticsContext endPage](context, "endPage");
  -[PXVisualDiagnosticsContext beginPage](self->_context, "beginPage");
  ++self->_pageIndex;
  v4 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
  self->_nextRowAvailableFrame.origin = (CGPoint)*MEMORY[0x24BDBF070];
  self->_nextRowAvailableFrame.size = v4;
}

- (void)_renderTitleIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  void *v19;
  PXVisualDiagnosticsContext *context;
  void *v22;
  _QWORD v23[5];
  id v24;
  CGRect slice;
  CGRect v26;

  if (!self->_context)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVisualDiagnosticsTable.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_context != nil"));

  }
  if (CGRectIsNull(self->_nextRowAvailableFrame))
  {
    -[PXVisualDiagnosticsContext currentPageBounds](self->_context, "currentPageBounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[PXVisualDiagnosticsTable margins](self, "margins");
    v12 = v4 + v11;
    v14 = v6 + v13;
    v16 = v8 - (v11 + v15);
    v18 = v10 - (v13 + v17);
    -[PXVisualDiagnosticsTable title](self, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
    {
      memset(&slice, 0, sizeof(slice));
      v26.origin.x = v12;
      v26.origin.y = v14;
      v26.size.width = v16;
      v26.size.height = v18;
      CGRectDivide(v26, &slice, &self->_nextRowAvailableFrame, 40.0, CGRectMinYEdge);
      context = self->_context;
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __48__PXVisualDiagnosticsTable__renderTitleIfNeeded__block_invoke;
      v23[3] = &unk_2514CFF68;
      v23[4] = self;
      v24 = v19;
      -[PXVisualDiagnosticsContext drawTextInRect:configuration:](context, "drawTextInRect:configuration:", v23, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);

    }
    else
    {
      self->_nextRowAvailableFrame.origin.x = v12;
      self->_nextRowAvailableFrame.origin.y = v14;
      self->_nextRowAvailableFrame.size.width = v16;
      self->_nextRowAvailableFrame.size.height = v18;
    }
    -[PXVisualDiagnosticsTable _renderRow:](self, "_renderRow:", self->_headerRow);

  }
}

- (void)_renderRow:(id)a3
{
  id v4;
  CGFloat v5;
  CGContext *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, double, double, double, double);
  id v18;
  void *v19;
  void *v20;
  id obj;
  CGRect v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CGRect slice;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_context)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVisualDiagnosticsTable.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_context != nil"));

  }
  memset(&slice, 0, sizeof(slice));
  objc_msgSend(v4, "height");
  CGRectDivide(self->_nextRowAvailableFrame, &slice, &self->_nextRowAvailableFrame, v5, CGRectMinYEdge);
  v6 = -[PXVisualDiagnosticsContext CGContext](self->_context, "CGContext");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[PXVisualDiagnosticsTable columnIdentifiers](self, "columnIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
        -[PXVisualDiagnosticsTable columns](self, "columns");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVisualDiagnosticsTable.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("column != nil"));

        }
        memset(&v23, 0, sizeof(v23));
        objc_msgSend(v13, "width");
        CGRectDivide(slice, &v23, &slice, v14, CGRectMinXEdge);
        objc_msgSend(v4, "cellsByColumnIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          CGContextSaveGState(v6);
          CGContextClipToRect(v6, v23);
          objc_msgSend(v16, "renderingBlock");
          v17 = (void (**)(_QWORD, _QWORD, double, double, double, double))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, PXVisualDiagnosticsContext *, double, double, double, double))v17)[2](v17, self->_context, v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);

          CGContextRestoreGState(v6);
        }
        CGContextSetLineWidth(v6, 1.0);
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.9, 1.0);
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetStrokeColorWithColor(v6, (CGColorRef)objc_msgSend(v18, "CGColor"));

        CGContextStrokeRect(v6, v23);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)defaultRowHeight
{
  return self->_defaultRowHeight;
}

- (void)setDefaultRowHeight:(double)a3
{
  self->_defaultRowHeight = a3;
}

- (double)defaultRowFontSize
{
  return self->_defaultRowFontSize;
}

- (void)setDefaultRowFontSize:(double)a3
{
  self->_defaultRowFontSize = a3;
}

- (UIEdgeInsets)margins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margins.top;
  left = self->_margins.left;
  bottom = self->_margins.bottom;
  right = self->_margins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (NSArray)columnIdentifiers
{
  return self->_columnIdentifiers;
}

- (NSDictionary)columns
{
  return self->_columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_columnIdentifiers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_headerRow, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_mutableColumnIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutableColumns, 0);
}

void __48__PXVisualDiagnosticsTable__renderTitleIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (continued)"), *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v3);

  }
  else
  {
    objc_msgSend(v5, "setText:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 18.0, *MEMORY[0x24BEBB5E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

void __66__PXVisualDiagnosticsTable_addColumnWithIdentifier_configuration___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11;
  CGContext *v12;
  id v13;
  CGContext *v14;
  _QWORD v15[4];
  id v16;
  CGRect v17;

  v11 = a2;
  v12 = (CGContext *)objc_msgSend(v11, "CGContext");
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.95, 1.0);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v12, (CGColorRef)objc_msgSend(v13, "CGColor"));

  v14 = (CGContext *)objc_msgSend(v11, "CGContext");
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  CGContextFillRect(v14, v17);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__PXVisualDiagnosticsTable_addColumnWithIdentifier_configuration___block_invoke_2;
  v15[3] = &unk_2514CFF18;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v11, "drawTextInRect:configuration:", v15, a3, a4, a5, a6);

}

void __66__PXVisualDiagnosticsTable_addColumnWithIdentifier_configuration___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v3);

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 0.0, *MEMORY[0x24BEBB610]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(v5, "setRelativePosition:", 0.5, 0.5);
}

@end
