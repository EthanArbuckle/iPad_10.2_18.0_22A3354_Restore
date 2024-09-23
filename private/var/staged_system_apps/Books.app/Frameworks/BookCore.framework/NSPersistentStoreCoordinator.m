@implementation NSPersistentStoreCoordinator

- (BOOL)bkspi_destroyPersistentStoreAtURL:(id)a3 withType:(id)a4 error:(id *)a5
{
  return -[NSPersistentStoreCoordinator _destroyPersistentStoreAtURL:withType:options:error:](self, "_destroyPersistentStoreAtURL:withType:options:error:", a3, a4, 0, a5);
}

- (BOOL)hasStoreInCommonWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPersistentStoreCoordinator persistentStores](self, "persistentStores"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("URL")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentStores"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("URL")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));

  LOBYTE(v9) = objc_msgSend(v7, "intersectsSet:", v10);
  return (char)v9;
}

@end
