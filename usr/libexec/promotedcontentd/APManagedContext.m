@implementation APManagedContext

- (id)addContentDataOnly:(id)a3
{
  id v4;
  APContentDataInternal *v5;
  void *v6;

  v4 = a3;
  v5 = -[APContentDataInternal initWithContent:]([APContentDataInternal alloc], "initWithContent:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext addContentData:](self, "addContentData:", v5));
  return v6;
}

+ (id)createManagedContextWithContext:(id)a3 idAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  APManagedContext *v10;
  void *v11;
  NSObject *v12;
  APContextWrapper *v13;
  void *v14;
  APContextWrapper *v15;
  void *v16;
  APPersistentCachedStoreTransactionalProtocol *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  int v29;
  void *v30;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fingerprint"));
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = [APManagedContext alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fingerprint"));
    v12 = -[APManagedContext initWithIdentifier:](v10, "initWithIdentifier:", v11);

    v13 = [APContextWrapper alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fingerprint"));
    v15 = -[APCacheableObjectWrapper initWithObject:identifier:](v13, "initWithObject:identifier:", v6, v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject proxy](v15, "proxy"));
    -[NSObject setContextWrapper:](v12, "setContextWrapper:", v16);

    -[NSObject setIdAccount:](v12, "setIdAccount:", v7);
    v17 = sub_100012918((uint64_t)a1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "createTransaction"));

    sub_10000E19C(v15, v19);
    sub_10000E19C(v12, v19);
    v20 = objc_msgSend(v19, "commit");
    v21 = APLogForCategory(9);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = v22;
    if ((v20 & 1) != 0)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fingerprint"));
        v29 = 138543362;
        v30 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Created new managed context for fingerprint '%{public}@'.", (uint8_t *)&v29, 0xCu);

      }
      v25 = v12;
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fingerprint"));
        v29 = 138543362;
        v30 = v27;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to create managed context for fingerprint '%{public}@'.", (uint8_t *)&v29, 0xCu);

      }
      v25 = 0;
    }

  }
  else
  {
    v26 = APLogForCategory(9);
    v12 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to create managed context. Fingerprint is empty.", (uint8_t *)&v29, 2u);
    }
    v25 = 0;
  }

  return v25;
}

+ (id)kind
{
  return CFSTR("b");
}

- (void)setIdAccount:(id)a3
{
  id v4;
  APIDAccount *v5;
  APIDAccount *idAccount;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[APIDAccountsWeakContainer sharedInstance](APIDAccountsWeakContainer, "sharedInstance"));
  v5 = (APIDAccount *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addIDAccount:", v4));

  idAccount = self->_idAccount;
  self->_idAccount = v5;

}

- (void)setContextWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_contextWrapper, a3);
}

- (APManagedContext)initWithIdentifier:(id)a3
{
  APManagedContext *v3;
  NSArray *v4;
  NSArray *contentDataItems;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)APManagedContext;
  v3 = -[APCacheableSynchronizedObject initWithIdentifier:](&v7, "initWithIdentifier:", a3);
  if (v3)
  {
    v4 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    contentDataItems = v3->_contentDataItems;
    v3->_contentDataItems = v4;

  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APManagedContext;
  v4 = a3;
  -[APCacheableBaseObject encodeWithCoder:](&v8, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext contentDataItems](self, "contentDataItems", v8.receiver, v8.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("contentDataItemIds"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext idAccount](self, "idAccount"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("idAccount"));

}

- (APIDAccount)idAccount
{
  return self->_idAccount;
}

- (NSArray)contentDataItems
{
  return self->_contentDataItems;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)addContentData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  APManagedContentData *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  APManagedContentData *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));

  if (objc_msgSend(v6, "length"))
  {
    v7 = sub_10001869C(self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "createTransaction"));

    v10 = -[APManagedContentData initWithManagedContext:contentData:transaction:]([APManagedContentData alloc], "initWithManagedContext:contentData:transaction:", self, v4, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject proxy](v10, "proxy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](v10, "identifier"));
    -[APManagedContext setContentData:forIdentifier:](self, "setContentData:forIdentifier:", v11, v12);

    sub_10000E19C(self, v9);
    if ((-[NSObject commit](v9, "commit") & 1) != 0)
    {
      v13 = APLogForCategory(9);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
        v24 = 138543618;
        v25 = v6;
        v26 = 2114;
        v27 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Added content data '%{public}@' to managed context '%{public}@'.", (uint8_t *)&v24, 0x16u);

      }
      v16 = v10;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](v10, "identifier"));
      -[APManagedContext setContentData:forIdentifier:](self, "setContentData:forIdentifier:", 0, v19);

      v20 = APLogForCategory(9);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
        v24 = 138543618;
        v25 = v6;
        v26 = 2114;
        v27 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to add content data '%{public}@' to managed context '%{public}@'.", (uint8_t *)&v24, 0x16u);

      }
      v16 = 0;
    }

  }
  else
  {
    v17 = APLogForCategory(9);
    v9 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v24 = 138543362;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to add content data to managed context '%{public}@'. Content data identifier is empty.", (uint8_t *)&v24, 0xCu);

    }
    v16 = 0;
  }

  return v16;
}

- (void)setContentData:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[APCacheableSynchronizedObject lockObject](self, "lockObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext contentDataItems](self, "contentDataItems"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObject:forIdentifier:", v7, v6));

  -[APManagedContext setContentDataItems:](self, "setContentDataItems:", v9);
  -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
}

- (void)setContentDataItems:(id)a3
{
  objc_storeStrong((id *)&self->_contentDataItems, a3);
}

+ (id)findManagedContextByFingerprint:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  id v11;

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
    v8 = APLogForCategory(9);
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to find managed context. Fingerprint is empty.", (uint8_t *)&v10, 2u);
    }
    v5 = 0;
    goto LABEL_8;
  }
  v4 = sub_10001EAB0((uint64_t)APManagedContext, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v6 = APLogForCategory(9);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found managed context '%{public}@' in a cache.", (uint8_t *)&v10, 0xCu);
    }
LABEL_8:

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDataItems, 0);
  objc_storeStrong((id *)&self->_contextWrapper, 0);
  objc_storeStrong((id *)&self->_idAccount, 0);
}

- (APManagedContext)initWithCoder:(id)a3
{
  id v4;
  APManagedContext *v5;
  void *v6;
  uint64_t v7;
  APContextWrapper *contextWrapper;
  id v9;
  void *v10;
  uint64_t v11;
  NSSet *v12;
  void *v13;
  uint64_t v14;
  NSArray *contentDataItems;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *context;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)APManagedContext;
  v5 = -[APCacheableSynchronizedObject initWithCoder:](&v32, "initWithCoder:", v4);
  if (v5)
  {
    context = objc_autoreleasePoolPush();
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](v5, "identifier"));
    v7 = objc_claimAutoreleasedReturnValue(+[APCacheableBaseObject proxyForIdentifier:](APContextWrapper, "proxyForIdentifier:", v6));
    contextWrapper = v5->_contextWrapper;
    v5->_contextWrapper = (APContextWrapper *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(APIDAccount), CFSTR("idAccount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[APManagedContext setIdAccount:](v5, "setIdAccount:", v10);

    v11 = objc_opt_class(NSString);
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(NSArray), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:"));
    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v13, "count")));
    contentDataItems = v5->_contentDataItems;
    v5->_contentDataItems = (NSArray *)v14;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[APCacheableBaseObject proxyForIdentifier:](APManagedContentData, "proxyForIdentifier:", v21));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext contentDataItems](v5, "contentDataItems"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "arrayByAddingObject:forIdentifier:", v22, v21));
          -[APManagedContext setContentDataItems:](v5, "setContentDataItems:", v24);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v18);
    }

    objc_autoreleasePoolPop(context);
  }

  return v5;
}

- (id)managedContentDataForId:(id)a3
{
  return -[APManagedContext contentDataItemForIdentifier:](self, "contentDataItemForIdentifier:", a3);
}

- (id)contentDataItemForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[APCacheableSynchronizedObject lockObject](self, "lockObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext contentDataItems](self, "contentDataItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForIdentifier:", v4));

  -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
  return v6;
}

- (BOOL)removeManagedContentDataForId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  void *v18;

  v4 = a3;
  -[APCacheableSynchronizedObject lockObject](self, "lockObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext contentDataItems](self, "contentDataItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForIdentifier:", v4));

  if (!v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Managed content data %@ is not in %@ managed context."), v4, v12));

    v14 = APLogForCategory(33);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
    }

    -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
    APSimulateCrash(5, v13, 0);

    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext contentDataItems](self, "contentDataItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByRemovingObjectForIdentifier:", v4));
  -[APManagedContext setContentDataItems:](self, "setContentDataItems:", v8);

  -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
  if ((sub_10016B95C(self) & 1) != 0)
  {
LABEL_7:
    v11 = 1;
    goto LABEL_8;
  }
  -[APCacheableSynchronizedObject lockObject](self, "lockObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext contentDataItems](self, "contentDataItems"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObject:forIdentifier:", v6, v4));
  -[APManagedContext setContentDataItems:](self, "setContentDataItems:", v10);

  -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
  v11 = 0;
LABEL_8:

  return v11;
}

- (int64_t)garbageCollect
{
  void *v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  int64_t v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext contentDataItems](self, "contentDataItems"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
  v6 = sub_10016B8D8((uint64_t)APContextWrapper, v5);

  if ((v6 & 1) != 0)
    return 0;
  v9 = sub_10001869C(self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "createTransaction"));

  sub_10016BA60(self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
  sub_10016BAE0((uint64_t)APContextWrapper, v12, v11);

  if ((objc_msgSend(v11, "commit") & 1) != 0)
  {
    v7 = (int64_t)objc_msgSend(v11, "count");
  }
  else
  {
    v13 = APLogForCategory(33);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v16 = 138543362;
      v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to remove managed context '%{public}@'.", (uint8_t *)&v16, 0xCu);

    }
    v7 = -1;
  }

  return v7;
}

- (APContext)context
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext contextWrapper](self, "contextWrapper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "object"));

  if (!v4)
  {
    v5 = APLogForCategory(9);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v9 = 138543362;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to load associated Context object for '%{public}@'.", (uint8_t *)&v9, 0xCu);

    }
  }
  return (APContext *)v4;
}

- (id)managedContentDataEnumerator
{
  void *v3;
  void *v4;
  APManagedContendDataEnumerator *v5;

  -[APCacheableSynchronizedObject lockObject](self, "lockObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext contentDataItems](self, "contentDataItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allIdentifiers"));

  -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
  v5 = -[APManagedContendDataEnumerator initWithManagedContext:contentDataItemIds:]([APManagedContendDataEnumerator alloc], "initWithManagedContext:contentDataItemIds:", self, v4);

  return v5;
}

- (id)toJSONObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APJSONArchiver JSONObjectWithObject:](APJSONArchiver, "JSONObjectWithObject:", self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APJSONArchiver JSONObjectWithObject:](APJSONArchiver, "JSONObjectWithObject:", v5));

  if (v6)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("context"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("context"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext contentDataItems](self, "contentDataItems"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("contentDataItems"));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContext contentDataItems](self, "contentDataItems", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      v15 = v6;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v14), "toJSONObject"));

        if (v6)
          objc_msgSend(v9, "addObject:", v6);
        v14 = (char *)v14 + 1;
        v15 = v6;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  objc_autoreleasePoolPop(v3);
  return v4;
}

- (APContextWrapper)contextWrapper
{
  return self->_contextWrapper;
}

@end
