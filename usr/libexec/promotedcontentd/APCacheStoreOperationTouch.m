@implementation APCacheStoreOperationTouch

- (APCacheStoreOperationTouch)initWithCacheStore:(id)a3 key:(id)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  id v10;
  APCacheStoreOperationTouch *v11;
  APCacheStoreOperationTouch *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[APCacheStoreOperationTouch init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_cacheStore, v8);
    objc_storeStrong((id *)&v12->_key, a4);
    objc_storeStrong((id *)&v12->_timestamp, a5);
  }

  return v12;
}

- (BOOL)execute
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  BOOL v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationTouch cacheStore](self, "cacheStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "memoryCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationTouch key](self, "key"));
  v6 = objc_msgSend(v4, "objectForKey:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationTouch cacheStore](self, "cacheStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fileStorage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationTouch timestamp](self, "timestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationTouch key](self, "key"));
  v18 = 0;
  v11 = objc_msgSend(v8, "setLastModifiedDate:toFile:error:", v9, v10, &v18);
  v12 = v18;

  if (v12)
    v13 = 0;
  else
    v13 = v11;
  if (!v13)
  {
    v14 = APLogForCategory(32);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationTouch key](self, "key"));
      *(_DWORD *)buf = 138543619;
      v20 = v16;
      v21 = 2113;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unable set last modified date to file %{public}@. Error: %{private}@", buf, 0x16u);

    }
  }

  return v13;
}

- (APCacheStore)cacheStore
{
  return (APCacheStore *)objc_loadWeakRetained((id *)&self->_cacheStore);
}

- (NSString)key
{
  return self->_key;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_cacheStore);
}

@end
