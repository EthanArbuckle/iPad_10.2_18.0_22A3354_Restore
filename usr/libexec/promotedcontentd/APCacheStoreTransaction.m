@implementation APCacheStoreTransaction

- (BOOL)_commit
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  BOOL v12;
  _QWORD v14[4];
  BOOL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreTransaction operations](self, "operations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreTransaction operations](self, "operations"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "execute");
        objc_msgSend(v4, "addObject:", v10);
        if (!v11)
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000269C;
  v14[3] = &unk_100218630;
  v15 = v12;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v14);

  return v12;
}

- (void)addOperation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[APCacheStoreTransaction operations](self, "operations"));
  objc_msgSend(v5, "addObject:", v4);

}

- (NSMutableArray)operations
{
  return self->_operations;
}

- (APCacheStoreTransaction)initWithCacheStore:(id)a3
{
  id v4;
  APCacheStoreTransaction *v5;
  uint64_t v6;
  NSMutableArray *operations;

  v4 = a3;
  v5 = -[APCacheStoreTransaction init](self, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    operations = v5->_operations;
    v5->_operations = (NSMutableArray *)v6;

    objc_storeWeak((id *)&v5->_cacheStore, v4);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_destroyWeak((id *)&self->_cacheStore);
}

- (BOOL)commit
{
  APCacheStoreTransaction *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreTransaction cacheStore](self, "cacheStore"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F008;
  v5[3] = &unk_100218610;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "executeBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (APCacheStore)cacheStore
{
  return (APCacheStore *)objc_loadWeakRetained((id *)&self->_cacheStore);
}

- (unint64_t)count
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheStoreTransaction operations](self, "operations"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

@end
