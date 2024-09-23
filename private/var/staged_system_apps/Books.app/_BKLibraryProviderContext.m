@implementation _BKLibraryProviderContext

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

+ (id)sharedInstance
{
  if (qword_1009F4FC0 != -1)
    dispatch_once(&qword_1009F4FC0, &stru_1008EB010);
  return (id)qword_1009F4FB8;
}

- (void)_mocDidSaveNotification:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *moc;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  moc = self->_moc;
  if (moc != v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext persistentStoreCoordinator](moc, "persistentStoreCoordinator"));
    v8 = objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext persistentStoreCoordinator](v5, "persistentStoreCoordinator"));
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext persistentStoreCoordinator](self->_moc, "persistentStoreCoordinator"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext persistentStoreCoordinator](v5, "persistentStoreCoordinator"));
      v12 = objc_msgSend(v10, "hasStoreInCommonWith:", v11);

      if (!v12)
        goto LABEL_7;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_BKLibraryProviderContext moc](self, "moc"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10010AF04;
    v14[3] = &unk_1008E7338;
    v14[4] = self;
    v15 = v4;
    objc_msgSend(v13, "performBlock:", v14);

  }
LABEL_7:

}

- (id)initSingleton
{
  _BKLibraryProviderContext *v2;
  void *v3;
  NSManagedObjectContext *v4;
  NSManagedObjectContext *moc;
  NSManagedObjectContext *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_BKLibraryProviderContext;
  v2 = -[_BKLibraryProviderContext init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v4 = (NSManagedObjectContext *)objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
    moc = v2->_moc;
    v2->_moc = v4;

    v6 = v2->_moc;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentStoreCoordinator"));
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v6, "setPersistentStoreCoordinator:", v7);

    -[NSManagedObjectContext setUndoManager:](v2->_moc, "setUndoManager:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "_mocDidSaveNotification:", NSManagedObjectContextDidSaveNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, NSManagedObjectContextDidSaveNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)_BKLibraryProviderContext;
  -[_BKLibraryProviderContext dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moc, 0);
}

@end
