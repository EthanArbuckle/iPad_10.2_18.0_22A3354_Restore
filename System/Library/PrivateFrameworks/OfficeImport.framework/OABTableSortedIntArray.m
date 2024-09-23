@implementation OABTableSortedIntArray

- (OABTableSortedIntArray)initWithIntSet:(id)a3
{
  id v4;
  OABTableSortedIntArray *v5;
  void *v6;
  uint64_t v7;
  NSArray *mIntArray;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OABTableSortedIntArray;
  v5 = -[OABTableSortedIntArray init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
    v7 = objc_claimAutoreleasedReturnValue();
    mIntArray = v5->mIntArray;
    v5->mIntArray = (NSArray *)v7;

  }
  return v5;
}

- (int)indexOfInt:(int)a3
{
  NSArray *mIntArray;
  void *v4;
  uint64_t v5;

  mIntArray = self->mIntArray;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray indexOfObject:](mIntArray, "indexOfObject:", v4);

  TCVerifyInputMeetsCondition(v5 != 0x7FFFFFFFFFFFFFFFLL);
  return v5;
}

- (int)intAtIndex:(int)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndex:](self->mIntArray, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (int)dim
{
  return -[NSArray count](self->mIntArray, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mIntArray, 0);
}

@end
