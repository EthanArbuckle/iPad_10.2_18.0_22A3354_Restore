@implementation RDPersistentStoreLookupForREMCDObject

- (id)init:(id)a3
{
  id v4;
  RDPersistentStoreLookupForREMCDObject *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RDPersistentStoreLookupForREMCDObject;
  v5 = -[RDPersistentStoreLookupForREMCDObject init](&v9, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentStore"));
    -[RDPersistentStoreLookupForREMCDObject setPersistentStore:](v5, "setPersistentStore:", v7);

  }
  return v5;
}

- (NSPersistentStore)persistentStore
{
  return (NSPersistentStore *)objc_loadWeakRetained((id *)&self->_persistentStore);
}

- (void)setPersistentStore:(id)a3
{
  objc_storeWeak((id *)&self->_persistentStore, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_persistentStore);
}

@end
