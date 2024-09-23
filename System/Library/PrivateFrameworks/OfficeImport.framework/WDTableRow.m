@implementation WDTableRow

- (WDTableRow)initWithTable:(id)a3 at:(unint64_t)a4
{
  id v6;
  WDTableRow *v7;
  WDTableRow *v8;
  NSMutableArray *v9;
  NSMutableArray *mCells;
  WDTableRowProperties *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  WDTableRowProperties *mProperties;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WDTableRow;
  v7 = -[WDTableRow init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->mTable, v6);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mCells = v8->mCells;
    v8->mCells = v9;

    v11 = [WDTableRowProperties alloc];
    objc_msgSend(v6, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "document");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WDTableRowProperties initWithDocument:](v11, "initWithDocument:", v13);
    mProperties = v8->mProperties;
    v8->mProperties = (WDTableRowProperties *)v14;

    v8->mIndex = a4;
  }

  return v8;
}

- (id)properties
{
  return self->mProperties;
}

- (WDTable)table
{
  return (WDTable *)objc_loadWeakRetained((id *)&self->mTable);
}

- (id)addCell
{
  WDTableCell *v3;

  v3 = -[WDTableCell initWithRow:at:]([WDTableCell alloc], "initWithRow:at:", self, -[NSMutableArray count](self->mCells, "count"));
  -[NSMutableArray addObject:](self->mCells, "addObject:", v3);
  return v3;
}

- (unint64_t)cellCount
{
  return -[NSMutableArray count](self->mCells, "count");
}

- (id)cellAt:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mCells, "objectAtIndex:", a3);
}

- (void)setIndex:(unint64_t)a3
{
  self->mIndex = a3;
}

- (unint64_t)index
{
  return self->mIndex;
}

- (id)addCellWithIndex:(unint64_t)a3
{
  WDTableCell *v4;

  v4 = -[WDTableCell initWithRow:at:]([WDTableCell alloc], "initWithRow:at:", self, a3);
  -[NSMutableArray addObject:](self->mCells, "addObject:", v4);
  -[NSMutableArray sortUsingSelector:](self->mCells, "sortUsingSelector:", sel_compareIndex_);
  return v4;
}

- (id)cellIterator
{
  return -[WDArrayIterator initWithArray:]([WDArrayIterator alloc], "initWithArray:", self->mCells);
}

- (id)newCellIterator
{
  return -[WDArrayIterator initWithArray:]([WDArrayIterator alloc], "initWithArray:", self->mCells);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDTableRow;
  -[WDTableRow description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mTable);
  objc_storeStrong((id *)&self->mCells, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
}

@end
