@implementation PXSelectedItemsStack

- (PXSelectedItemsStack)initWithDepth:(int64_t)a3
{
  PXSelectedItemsStack *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSelectedItemsStack;
  result = -[PXSelectedItemsStack init](&v5, sel_init);
  if (result)
    result->_depth = a3;
  return result;
}

- (PXSelectedItemsStack)init
{
  return -[PXSelectedItemsStack initWithDepth:](self, "initWithDepth:", 3);
}

- (void)setTopItems:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *topItems;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_topItems;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      topItems = self->_topItems;
      self->_topItems = v6;

      -[PXSelectedItemsStack signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSelectedItemsStack;
  -[PXSelectedItemsStack performChanges:](&v3, sel_performChanges_, a3);
}

- (void)updateWithSelectedItemsSnapshot:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v4 = -[PXSelectedItemsStack depth](self, "depth");
  -[PXSelectedItemsStack topItemReferences](self, "topItemReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  -[PXSelectedItemsStack topItems](self, "topItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  if (objc_msgSend(v9, "count"))
  {
    v15 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "containsItemReference:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v15++, v17);
      }
      else
      {
        objc_msgSend(v9, "removeObjectAtIndex:", v15);
        objc_msgSend(v14, "removeObjectAtIndex:", v15);
      }

    }
    while (v15 < objc_msgSend(v9, "count"));
  }
  v18 = objc_msgSend(v24, "count");
  if (v18 >= 1)
  {
    v19 = v18;
    for (i = 0; i != v19; ++i)
    {
      if (objc_msgSend(v14, "count") >= v4)
        break;
      objc_msgSend(v24, "itemReferenceAtIndex:", i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "containsObject:", v21) & 1) == 0)
      {
        objc_msgSend(v24, "itemForItemReference:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 != v23)
        {
          objc_msgSend(v9, "addObject:", v21);
          objc_msgSend(v14, "addObject:", v22);
        }

      }
    }
  }
  -[PXSelectedItemsStack setTopItemReferences:](self, "setTopItemReferences:", v9);
  -[PXSelectedItemsStack setTopItems:](self, "setTopItems:", v14);

}

- (int64_t)depth
{
  return self->_depth;
}

- (NSArray)topItems
{
  return self->_topItems;
}

- (NSArray)topItemReferences
{
  return self->_topItemReferences;
}

- (void)setTopItemReferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topItemReferences, 0);
  objc_storeStrong((id *)&self->_topItems, 0);
}

@end
