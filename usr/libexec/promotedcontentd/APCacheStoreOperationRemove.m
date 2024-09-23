@implementation APCacheStoreOperationRemove

- (APCacheStoreOperationRemove)initWithCacheStore:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  APCacheStoreOperationRemove *v8;
  APCacheStoreOperationRemove *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[APCacheStoreOperationRemove init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_cacheStore, v6);
    objc_storeStrong((id *)&v9->_key, a4);
  }

  return v9;
}

- (BOOL)execute
{
  APCacheStoreOperationRemove *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationRemove key](self, "key"));
  LOBYTE(v2) = -[APCacheStoreOperationRemove _removeObjectForKey:](v2, "_removeObjectForKey:", v3);

  return (char)v2;
}

- (BOOL)_removeObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSErrorDomain v8;
  NSErrorDomain v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationRemove cacheStore](self, "cacheStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileStorage"));
  v21 = 0;
  objc_msgSend(v6, "removeFile:error:", v4, &v21);
  v7 = v21;

  if (v7)
  {
    v8 = (NSErrorDomain)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    v9 = v8;
    if (v8 != NSCocoaErrorDomain)
    {

LABEL_10:
      v15 = APLogForCategory(32);
      v11 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543619;
        v23 = v4;
        v24 = 2113;
        v25 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to remove file %{public}@. Error: %{private}@", buf, 0x16u);
      }
      v12 = 0;
      goto LABEL_13;
    }
    v13 = objc_msgSend(v7, "code");

    if (v13 != (id)4)
      goto LABEL_10;
    v14 = APLogForCategory(32);
    v11 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to remove file %{public}@. File does not exist.", buf, 0xCu);
    }
    v12 = 1;
  }
  else
  {
    v10 = APLogForCategory(32);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = 1;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Removed file %{public}@.", buf, 0xCu);
    }
  }
LABEL_13:

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationRemove cacheStore](self, "cacheStore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "memoryCache"));
  objc_msgSend(v17, "removeObjectForKey:", v4);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationRemove cacheStore](self, "cacheStore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "liveObjectsTracker"));
  objc_msgSend(v19, "removeObjectForKey:", v4);

  return v12;
}

- (APCacheStore)cacheStore
{
  return (APCacheStore *)objc_loadWeakRetained((id *)&self->_cacheStore);
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_cacheStore);
}

@end
