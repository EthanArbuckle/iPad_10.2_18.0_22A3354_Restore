@implementation BCManagedObjectIDChanges

- (BCManagedObjectIDChanges)initWithAdded:(id)a3 updated:(id)a4 deleted:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BCManagedObjectIDChanges *v14;
  NSArray *v15;
  NSArray *addedObjects;
  NSArray *v17;
  NSArray *updatedObjects;
  NSArray *v19;
  NSArray *deletedObjects;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BCManagedObjectIDChanges;
  v14 = -[BCManagedObjectIDChanges init](&v22, "init");
  if (v14)
  {
    v15 = (NSArray *)objc_msgSend(v10, "copy");
    addedObjects = v14->_addedObjects;
    v14->_addedObjects = v15;

    v17 = (NSArray *)objc_msgSend(v11, "copy");
    updatedObjects = v14->_updatedObjects;
    v14->_updatedObjects = v17;

    v19 = (NSArray *)objc_msgSend(v12, "copy");
    deletedObjects = v14->_deletedObjects;
    v14->_deletedObjects = v19;

    objc_storeStrong((id *)&v14->_context, a6);
  }

  return v14;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSArray)addedObjects
{
  return self->_addedObjects;
}

- (NSArray)updatedObjects
{
  return self->_updatedObjects;
}

- (NSArray)deletedObjects
{
  return self->_deletedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedObjects, 0);
  objc_storeStrong((id *)&self->_updatedObjects, 0);
  objc_storeStrong((id *)&self->_addedObjects, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
