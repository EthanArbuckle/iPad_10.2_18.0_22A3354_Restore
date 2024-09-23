@implementation ICFixCorruptDatabaseLaunchTask

- (void)runLaunchTask
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICPaths persistentStoreURL](ICPaths, "persistentStoreURL"));
  v3 = os_log_create("com.apple.notes", "LaunchTask");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_1004047A8(v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v6 = objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Fix Corrupt Database"), &stru_100550B58);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICPersistentContainer standardStoreOptions](ICPersistentContainer, "standardStoreOptions"));
    v4 = objc_msgSend(v7, "mutableCopy");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", NSSQLitePragmasOption));
    v9 = objc_msgSend(v8, "mutableCopy");

    if (!v9)
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("integrity_check"));
    -[NSObject setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, NSSQLitePragmasOption);
    v10 = objc_msgSend(objc_alloc((Class)ICPersistentContainer), "initWithStoreURL:storeType:options:mergePolicy:", v2, NSSQLiteStoreType, v4, 0);
    objc_msgSend(v10, "setAbortAfterReplacingDatabase:", 1);
    v15 = 0;
    v11 = objc_msgSend(v10, "loadPersistentStore:", &v15);
    v12 = v15;
    if ((v11 & 1) == 0)
    {
      v13 = os_log_create("com.apple.notes", "LaunchTask");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_100404734((uint64_t)v12, v13);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v14, "endBackgroundTask:", v6);

  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_1004046F4(v4);
  }

}

@end
