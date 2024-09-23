@implementation BKSeriesDatabase

- (BKSeriesDatabase)init
{
  id v3;
  void *v4;
  BKSeriesDatabase *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  objc_super v13;

  v3 = objc_msgSend((id)objc_opt_class(self), "persistentStoreURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v13.receiver = self;
  v13.super_class = (Class)BKSeriesDatabase;
  v5 = -[IMCoreDataSource initWithPersistentStoreURL:](&v13, "initWithPersistentStoreURL:", v4);

  if (v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(v5), "persistentStoreURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByDeletingLastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    v11 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v10, 0);

    if ((v11 & 1) == 0)
      objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);
    -[IMCoreDataSource loadCoreData](v5, "loadCoreData");

  }
  return v5;
}

+ (id)managedObjectModelName
{
  return CFSTR("BKSeries");
}

+ (id)persistentStoreURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication applicationDocumentsDirectory](UIApplication, "applicationDocumentsDirectory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "persistentStoreName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("BKSeriesDatabase")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
  return v7;
}

+ (id)persistentStoreNameSeed
{
  return CFSTR("012820141020");
}

+ (id)persistentStoreVersion
{
  return CFSTR("1");
}

- (id)newPrivateQueueManagedObjectContext
{
  uint64_t v3;
  objc_super v5;

  v3 = objc_opt_class(BKSeriesDatabaseManagedObjectContext, a2);
  v5.receiver = self;
  v5.super_class = (Class)BKSeriesDatabase;
  return -[IMCoreDataSource newPrivateQueueManagedObjectContextWithClass:](&v5, "newPrivateQueueManagedObjectContextWithClass:", v3);
}

- (id)newManagedObjectContext
{
  uint64_t v3;
  objc_super v5;

  v3 = objc_opt_class(BKSeriesDatabaseManagedObjectContext, a2);
  v5.receiver = self;
  v5.super_class = (Class)BKSeriesDatabase;
  return -[IMCoreDataSource newManagedObjectContextWithClass:](&v5, "newManagedObjectContextWithClass:", v3);
}

@end
