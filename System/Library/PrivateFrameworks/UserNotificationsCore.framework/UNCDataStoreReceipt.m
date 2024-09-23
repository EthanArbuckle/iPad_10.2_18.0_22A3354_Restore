@implementation UNCDataStoreReceipt

+ (id)receiptWithAddedObjects:(id)a3 replacedObjects:(id)a4 replacementObjects:(id)a5 removedObjects:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAddedObjects:replacedObjects:replacementObjects:removedObjects:", v12, v11, v10, v9);

  return v13;
}

- (UNCDataStoreReceipt)initWithAddedObjects:(id)a3 replacedObjects:(id)a4 replacementObjects:(id)a5 removedObjects:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  UNCDataStoreReceipt *v14;
  uint64_t v15;
  NSArray *addedObjects;
  uint64_t v17;
  NSArray *replacedObjects;
  uint64_t v19;
  NSArray *replacementObjects;
  uint64_t v21;
  NSArray *removedObjects;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)UNCDataStoreReceipt;
  v14 = -[UNCDataStoreReceipt init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    addedObjects = v14->_addedObjects;
    v14->_addedObjects = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    replacedObjects = v14->_replacedObjects;
    v14->_replacedObjects = (NSArray *)v17;

    v19 = objc_msgSend(v12, "copy");
    replacementObjects = v14->_replacementObjects;
    v14->_replacementObjects = (NSArray *)v19;

    v21 = objc_msgSend(v13, "copy");
    removedObjects = v14->_removedObjects;
    v14->_removedObjects = (NSArray *)v21;

  }
  return v14;
}

- (BOOL)hasChanges
{
  return -[NSArray count](self->_addedObjects, "count")
      || -[NSArray count](self->_replacedObjects, "count")
      || -[NSArray count](self->_removedObjects, "count") != 0;
}

- (NSArray)addedObjects
{
  return self->_addedObjects;
}

- (NSArray)replacedObjects
{
  return self->_replacedObjects;
}

- (NSArray)replacementObjects
{
  return self->_replacementObjects;
}

- (NSArray)removedObjects
{
  return self->_removedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedObjects, 0);
  objc_storeStrong((id *)&self->_replacementObjects, 0);
  objc_storeStrong((id *)&self->_replacedObjects, 0);
  objc_storeStrong((id *)&self->_addedObjects, 0);
}

@end
