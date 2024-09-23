@implementation _PXMapStoreChange

- (_PXMapStoreChange)initWithAddedItems:(id)a3 removedItems:(id)a4 updatedItems:(id)a5
{
  _PXMapStoreChange *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_PXMapStoreChange;
  v8 = -[_PXMapStoreChange init](&v10, sel_init);
  if (v8)
  {
    v8->_addedItems = (NSSet *)a3;
    v8->_removedItems = (NSSet *)a4;
    v8->_updatedItems = (NSSet *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PXMapStoreChange;
  -[_PXMapStoreChange dealloc](&v3, sel_dealloc);
}

- (void)updateWithChange:(id)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend(a3, "addedItems"))
  {
    if (self->_addedItems)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:");
      objc_msgSend(v5, "unionSet:", objc_msgSend(a3, "addedItems"));

    }
    else
    {
      v5 = (void *)objc_msgSend(a3, "addedItems");
    }
    self->_addedItems = (NSSet *)v5;
  }
  if (objc_msgSend(a3, "removedItems"))
  {
    if (self->_removedItems)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:");
      objc_msgSend(v6, "unionSet:", objc_msgSend(a3, "removedItems"));

    }
    else
    {
      v6 = (void *)objc_msgSend(a3, "removedItems");
    }
    self->_removedItems = (NSSet *)v6;
  }
  if (objc_msgSend(a3, "updatedItems"))
  {
    if (self->_updatedItems)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:");
      objc_msgSend(v7, "unionSet:", objc_msgSend(a3, "updatedItems"));

    }
    else
    {
      v7 = (void *)objc_msgSend(a3, "updatedItems");
    }
    self->_updatedItems = (NSSet *)v7;
  }
}

- (BOOL)hasChanges
{
  NSSet *addedItems;
  NSSet *removedItems;
  NSSet *updatedItems;

  addedItems = self->_addedItems;
  if (addedItems && -[NSSet count](addedItems, "count")
    || (removedItems = self->_removedItems) != 0 && -[NSSet count](removedItems, "count"))
  {
    LOBYTE(updatedItems) = 1;
  }
  else
  {
    updatedItems = self->_updatedItems;
    if (updatedItems)
      LOBYTE(updatedItems) = -[NSSet count](updatedItems, "count") != 0;
  }
  return (char)updatedItems;
}

- (NSSet)addedItems
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAddedItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSSet)removedItems
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRemovedItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSSet)updatedItems
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUpdatedItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
