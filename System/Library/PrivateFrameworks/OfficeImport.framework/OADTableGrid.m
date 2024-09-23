@implementation OADTableGrid

- (OADTableGrid)init
{
  OADTableGrid *v2;
  NSMutableArray *v3;
  NSMutableArray *mColumns;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADTableGrid;
  v2 = -[OADTableGrid init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mColumns = v2->mColumns;
    v2->mColumns = v3;

  }
  return v2;
}

- (id)addColumn
{
  OADTableColumn *v3;

  v3 = objc_alloc_init(OADTableColumn);
  -[NSMutableArray addObject:](self->mColumns, "addObject:", v3);
  return v3;
}

- (unint64_t)columnCount
{
  return -[NSMutableArray count](self->mColumns, "count");
}

- (id)columnAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mColumns, "objectAtIndex:", a3);
}

- (void)flipColumnsRTL
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[OADTableGrid columnCount](self, "columnCount");
  v4 = v3 - 1;
  if (v3 != 1)
  {
    v5 = 1;
    do
      -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self->mColumns, "exchangeObjectAtIndex:withObjectAtIndex:", v5 - 1, v4--);
    while (v5++ < v4);
  }
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTableGrid;
  -[OADTableGrid description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColumns, 0);
}

@end
