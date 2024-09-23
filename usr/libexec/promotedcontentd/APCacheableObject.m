@implementation APCacheableObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)masterObjectFileNameForIdentifier:(id)a3
{
  return objc_msgSend(a3, "stringByAppendingPathExtension:", CFSTR("mo"));
}

+ (id)associatedObjectFileNameForIdentifier:(id)a3
{
  return objc_msgSend(a3, "stringByAppendingPathExtension:", CFSTR("ao"));
}

+ (id)fileNameForIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(a1, "isMasterObject"))
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "masterObjectFileNameForIdentifier:", v4));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "associatedObjectFileNameForIdentifier:", v4));
  v6 = (void *)v5;

  return v6;
}

- (id)fileName
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileNameForIdentifier:", v4));

  return v5;
}

- (id)initInPersistentStore:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  APCacheableObject *v9;

  v4 = a3;
  if (!v4)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ persistentStore cannot be nil"), objc_opt_class(self));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    APSimulateCrash(5, v6, 1);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  v9 = -[APCacheableObject initWithIdentifier:inPersistentStore:](self, "initWithIdentifier:inPersistentStore:", v8, v4);

  return v9;
}

- (APCacheableObject)initWithIdentifier:(id)a3 inPersistentStore:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  APCacheableObject *v13;
  APCacheableObject *v14;
  APCacheableObject *v15;
  NSString *v17;
  void *v18;
  NSString *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ identifier cannot be nil"), objc_opt_class(self));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    APSimulateCrash(5, v18, 1);

    if (v7)
      goto LABEL_3;
  }
  v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ persistentStore cannot be nil"), objc_opt_class(self));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  APSimulateCrash(5, v20, 1);

LABEL_3:
  v8 = objc_msgSend((id)objc_opt_class(self), "fileNameForIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v7, "hasObjectForKey:", v9);

  if (v10)
  {
    v11 = APLogForCategory(32);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Item %{public}@ already exists.", buf, 0xCu);
    }

    v13 = 0;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)APCacheableObject;
    v14 = -[APCacheableSynchronizedObject initWithIdentifier:](&v21, "initWithIdentifier:", v6);
    v15 = v14;
    if (v14)
      objc_storeWeak((id *)&v14->_persistentStore, v7);
    self = v15;
    v13 = self;
  }

  return v13;
}

+ (id)findCacheableObjectForId:(id)a3 inPersistentStore:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ persistentStore cannot be nil"), objc_opt_class(a1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    APSimulateCrash(5, v9, 1);

  }
  if (objc_msgSend(v6, "length"))
  {
    v10 = objc_msgSend((id)objc_opt_class(a1), "fileNameForIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v11));

    v13 = v12;
    objc_msgSend(v13, "setPersistentStore:", v7);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (APPersistentCachedStoreProtocol)persistentStore
{
  return (APPersistentCachedStoreProtocol *)objc_loadWeakRetained((id *)&self->_persistentStore);
}

- (void)setPersistentStore:(id)a3
{
  objc_storeWeak((id *)&self->_persistentStore, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_persistentStore);
}

@end
