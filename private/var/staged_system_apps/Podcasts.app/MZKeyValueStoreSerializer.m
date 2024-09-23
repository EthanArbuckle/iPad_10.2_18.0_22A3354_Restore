@implementation MZKeyValueStoreSerializer

- (MZKeyValueStoreSerializer)initWithTransaction:(id)a3
{
  id v5;
  MZKeyValueStoreSerializer *v6;
  MZKeyValueStoreSerializer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MZKeyValueStoreSerializer;
  v6 = -[MZKeyValueStoreSerializer init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transaction, a3);

  return v7;
}

- (id)payload
{
  void *v2;
  void *v3;
  unsigned int v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  id obj;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer keys](self, "keys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  v4 = objc_msgSend(v3, "type");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v2;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v9 = objc_autoreleasePoolPush();
        v10 = -[MZKeyValueStoreSerializer objectVersionPairForKey:](self, "objectVersionPairForKey:", v8);
        v12 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v8, CFSTR("key"), v11, CFSTR("base-version"), 0));
        if (v10)
          v14 = v4 == 2;
        else
          v14 = 0;
        v15 = v14;
        if (v4 == 3 || v15)
        {
          v16 = v10;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "MZDataByDeflatingWithGZip"));

          if (v17)
            objc_msgSend(v13, "setValue:forKey:", v17, CFSTR("value"));
          objc_msgSend(v21, "addObject:", v13);

        }
        else if (v4 == 1)
        {
          objc_msgSend(v21, "addObject:", v13);
        }

        objc_autoreleasePoolPop(v9);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer dataWithNodes:](self, "dataWithNodes:", v21));
  return v18;
}

- (id)sinceDomainVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sinceDomainVersion"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "processor"));
  v7 = objc_opt_respondsToSelector(v6, "sinceDomainVersionForTransaction:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "processor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sinceDomainVersionForTransaction:", v10));

    v4 = (void *)v11;
  }
  return v4;
}

- (BOOL)_isGetAllSinceDomainVersionRequest
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  if (objc_msgSend(v3, "type") == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer sinceDomainVersion](self, "sinceDomainVersion"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isRemoveAllSinceDomainVersion
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  if (objc_msgSend(v3, "type") == 3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer sinceDomainVersion](self, "sinceDomainVersion"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)baseDictionary
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("domain"));

  if (-[MZKeyValueStoreSerializer _isGetAllSinceDomainVersionRequest](self, "_isGetAllSinceDomainVersionRequest")
    || -[MZKeyValueStoreSerializer _isRemoveAllSinceDomainVersion](self, "_isRemoveAllSinceDomainVersion"))
  {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer sinceDomainVersion](self, "sinceDomainVersion"));
    if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("0")))
    {

      v6 = CFSTR("0");
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("since-domain-version"));

  }
  return v3;
}

- (id)dataWithNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count")
    || -[MZKeyValueStoreSerializer _isGetAllSinceDomainVersionRequest](self, "_isGetAllSinceDomainVersionRequest")
    || -[MZKeyValueStoreSerializer _isRemoveAllSinceDomainVersion](self, "_isRemoveAllSinceDomainVersion"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer baseDictionary](self, "baseDictionary"));
    if (!v4)
      v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("keys"));
    if (v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v5, 200, 0, 0));
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)keys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keys"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "processor"));
  v7 = objc_opt_respondsToSelector(v6, "keysForTransaction:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "processor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keysForTransaction:", v10));

    v4 = (void *)v11;
  }
  return v4;
}

- (MZKeyValueStoreDataVerionPair)objectVersionPairForKey:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  __CFString *v18;
  id v19;
  MZKeyValueStoreDataVerionPair result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
  v6 = objc_msgSend(v5, "type");

  if (v6 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "processor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "versionForGetTransaction:key:", v9, v4));

    v11 = 0;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = CFSTR("0");
  }
  else if ((v6 & 0xFFFFFFFE) == 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "processor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
    v19 = 0;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataForSetTransaction:key:version:", v15, v4, &v19));
    v16 = (const __CFString *)v19;

    if (v16)
      v12 = v16;
    else
      v12 = CFSTR("1");
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }

  v17 = (void *)v11;
  v18 = (__CFString *)v12;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (MZKeyValueStoreTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
