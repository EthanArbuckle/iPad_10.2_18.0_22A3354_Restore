@implementation EDTableFilterColumn

- (EDTableFilterColumn)init
{
  EDTableFilterColumn *v2;
  NSMutableArray *v3;
  NSMutableArray *mFilters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EDTableFilterColumn;
  v2 = -[EDTableFilterColumn init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mFilters = v2->mFilters;
    v2->mFilters = v3;

    v2->mColumnIndex = -1;
  }
  return v2;
}

- (unint64_t)filterCount
{
  return -[NSMutableArray count](self->mFilters, "count");
}

- (id)filterAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[EDTableFilterColumn filterCount](self, "filterCount") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->mFilters, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)addFilter:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[NSMutableArray addObject:](self->mFilters, "addObject:", v4);

}

- (unint64_t)columnIndex
{
  return self->mColumnIndex;
}

- (void)setColumnIndex:(unint64_t)a3
{
  self->mColumnIndex = a3;
}

- (int)filtersRelation
{
  return self->mFiltersRelation;
}

- (void)setFiltersRelation:(int)a3
{
  self->mFiltersRelation = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDTableFilterColumn;
  -[EDTableFilterColumn description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFilters, 0);
}

@end
