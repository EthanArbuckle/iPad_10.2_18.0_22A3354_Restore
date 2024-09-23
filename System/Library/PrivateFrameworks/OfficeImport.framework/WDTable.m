@implementation WDTable

- (WDTable)initWithText:(id)a3
{
  id v4;
  WDTable *v5;
  WDTableProperties *v6;
  void *v7;
  uint64_t v8;
  WDTableProperties *mProperties;
  NSMutableArray *v10;
  NSMutableArray *mRows;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDTable;
  v5 = -[WDBlock initWithText:](&v13, sel_initWithText_, v4);
  if (v5)
  {
    v6 = [WDTableProperties alloc];
    objc_msgSend(v4, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WDTableProperties initWithDocument:](v6, "initWithDocument:", v7);
    mProperties = v5->mProperties;
    v5->mProperties = (WDTableProperties *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mRows = v5->mRows;
    v5->mRows = v10;

  }
  return v5;
}

- (id)properties
{
  return self->mProperties;
}

- (id)addRow
{
  WDTableRow *v3;

  v3 = -[WDTableRow initWithTable:at:]([WDTableRow alloc], "initWithTable:at:", self, -[WDTable rowCount](self, "rowCount"));
  -[NSMutableArray addObject:](self->mRows, "addObject:", v3);
  return v3;
}

- (unint64_t)rowCount
{
  return -[NSMutableArray count](self->mRows, "count");
}

- (int)nestingLevel
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;

  -[WDText tableCell](self->super.mText, "tableCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (-[WDBlock textType](self, "textType") != 4
     || (objc_msgSend(v3, "text"),
         v4 = (void *)objc_claimAutoreleasedReturnValue(),
         v5 = objc_msgSend(v4, "textType"),
         v4,
         v5 == 4)))
  {
    objc_msgSend(v3, "row");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "table");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "nestingLevel") + 1;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (int)blockType
{
  return 1;
}

- (id)rowAt:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mRows, "objectAtIndex:", a3);
}

- (void)clearProperties
{
  WDTableProperties *mProperties;

  mProperties = self->mProperties;
  self->mProperties = 0;

}

- (id)insertRowAtIndex:(unint64_t)a3
{
  WDTableRow *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  v5 = -[WDTableRow initWithTable:at:]([WDTableRow alloc], "initWithTable:at:", self, a3);
  -[NSMutableArray insertObject:atIndex:](self->mRows, "insertObject:atIndex:", v5, a3);
  v6 = -[NSMutableArray count](self->mRows, "count");
  v7 = a3 + 1;
  if (v7 < v6)
  {
    do
    {
      -[NSMutableArray objectAtIndex:](self->mRows, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setIndex:", v7);

      ++v7;
    }
    while (v6 != v7);
  }
  return v5;
}

- (void)clearRows
{
  NSMutableArray *mRows;

  mRows = self->mRows;
  self->mRows = 0;

}

- (id)rowIterator
{
  return -[WDArrayIterator initWithArray:]([WDArrayIterator alloc], "initWithArray:", self->mRows);
}

- (id)newRowIterator
{
  return -[WDArrayIterator initWithArray:]([WDArrayIterator alloc], "initWithArray:", self->mRows);
}

- (id)cellIterator
{
  WDTableRowCellIterator *v3;
  void *v4;
  WDTableRowCellIterator *v5;

  v3 = [WDTableRowCellIterator alloc];
  -[WDTable rowIterator](self, "rowIterator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WDCombinedIterator initWithParentIterator:](v3, "initWithParentIterator:", v4);

  return v5;
}

- (id)newCellIterator
{
  id v2;
  WDTableRowCellIterator *v3;

  v2 = -[WDTable newRowIterator](self, "newRowIterator");
  v3 = -[WDCombinedIterator initWithParentIterator:]([WDTableRowCellIterator alloc], "initWithParentIterator:", v2);

  return v3;
}

- (id)runIterator
{
  WDTableCellRunIterator *v3;
  void *v4;
  WDTableCellRunIterator *v5;

  v3 = [WDTableCellRunIterator alloc];
  -[WDTable cellIterator](self, "cellIterator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WDCombinedIterator initWithParentIterator:](v3, "initWithParentIterator:", v4);

  return v5;
}

- (id)newRunIterator
{
  id v2;
  WDTableCellRunIterator *v3;

  v2 = -[WDTable newCellIterator](self, "newCellIterator");
  v3 = -[WDCombinedIterator initWithParentIterator:]([WDTableCellRunIterator alloc], "initWithParentIterator:", v2);

  return v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDTable;
  -[WDBlock description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRows, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
}

@end
