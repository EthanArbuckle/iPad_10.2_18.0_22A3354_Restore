@implementation APCacheStoreOperationSet

- (APCacheStoreOperationSet)initWithCacheStore:(id)a3 key:(id)a4 object:(id)a5
{
  id v8;
  id v9;
  id v10;
  APCacheStoreOperationSet *v11;
  APCacheStoreOperationSet *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[APCacheStoreOperationSet init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_cacheStore, v8);
    objc_storeStrong((id *)&v12->_key, a4);
    objc_storeStrong((id *)&v12->_object, a5);
  }

  return v12;
}

- (BOOL)execute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationSet object](self, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serialize"));

  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationSet object](self, "object"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationSet key](self, "key"));
    v7 = -[APCacheStoreOperationSet _setObject:objectSerializedData:forKey:](self, "_setObject:objectSerializedData:forKey:", v5, v4, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (APCacheableBaseObject)object
{
  return self->_object;
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)_setObject:(id)a3 objectSerializedData:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationSet cacheStore](self, "cacheStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fileStorage"));
  v23 = 0;
  v13 = objc_msgSend(v12, "writeData:toFile:error:", v10, v9, &v23);

  v14 = v23;
  if (v14)
    v15 = 0;
  else
    v15 = v13;
  v16 = APLogForCategory(32);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Updated file %{public}@.", buf, 0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationSet cacheStore](self, "cacheStore"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "liveObjectsTracker"));
    objc_msgSend(v20, "setObject:forKey:", v8, v9);

    v18 = objc_claimAutoreleasedReturnValue(-[APCacheStoreOperationSet cacheStore](self, "cacheStore"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject memoryCache](v18, "memoryCache"));
    objc_msgSend(v21, "setObject:forKey:cost:", v8, v9, objc_msgSend(v8, "objectSize"));

  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543619;
    v25 = v9;
    v26 = 2113;
    v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unable to update file %{public}@. Error: %{private}@", buf, 0x16u);
  }

  return v15;
}

- (APCacheStore)cacheStore
{
  return (APCacheStore *)objc_loadWeakRetained((id *)&self->_cacheStore);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_cacheStore);
}

@end
