@implementation APCacheableMasterObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APCacheableMasterObject;
  v4 = a3;
  -[APCacheableBaseObject encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableMasterObject associatedObjects](self, "associatedObjects", v6.receiver, v6.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_associated_objects"));

}

- (APCacheableMasterObject)initWithCoder:(id)a3
{
  id v4;
  APCacheableMasterObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *associatedObjects;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APCacheableMasterObject;
  v5 = -[APCacheableSynchronizedObject initWithCoder:](&v13, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_opt_class(NSMutableDictionary);
    v7 = objc_opt_class(NSDictionary);
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(NSString), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_associated_objects")));
    associatedObjects = v5->_associatedObjects;
    v5->_associatedObjects = (NSMutableDictionary *)v10;

  }
  return v5;
}

- (APCacheableMasterObject)initWithIdentifier:(id)a3 inPersistentStore:(id)a4
{
  APCacheableMasterObject *v4;
  uint64_t v5;
  NSMutableDictionary *associatedObjects;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APCacheableMasterObject;
  v4 = -[APCacheableObject initWithIdentifier:inPersistentStore:](&v8, "initWithIdentifier:inPersistentStore:", a3, a4);
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    associatedObjects = v4->_associatedObjects;
    v4->_associatedObjects = (NSMutableDictionary *)v5;

  }
  return v4;
}

+ (BOOL)isMasterObject
{
  return 1;
}

- (id)findAssociatedObjectOfKind:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (!v4)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ kind cannot be nil"), objc_opt_class(self));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    APSimulateCrash(5, v6, 1);

  }
  -[APCacheableSynchronizedObject lockObject](self, "lockObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableMasterObject associatedObjects](self, "associatedObjects"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v4));

  -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObject persistentStore](self, "persistentStore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[APCacheableObject findCacheableObjectForId:inPersistentStore:](APCacheableAssociatedObject, "findCacheableObjectForId:inPersistentStore:", v8, v9));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)addAssociatedObject:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  BOOL v16;
  void *v17;
  uint8_t buf[4];
  id v20;

  v4 = a3;
  if (!v4)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ childObject cannot be nil"), objc_opt_class(self));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    APSimulateCrash(5, v6, 1);

  }
  v7 = objc_msgSend((id)objc_opt_class(v4), "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (objc_msgSend(v8, "length"))
  {
    -[APCacheableSynchronizedObject lockObject](self, "lockObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableMasterObject associatedObjects](self, "associatedObjects"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));

    if (!v10)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_associatedObjects, "setObject:forKeyedSubscript:", v17, v8);

      -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
      v16 = 1;
      goto LABEL_13;
    }
    v11 = APLogForCategory(32);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Master object already contains object of kind '%{private}@'", buf, 0xCu);
    }

    -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
  }
  else
  {
    v13 = APLogForCategory(32);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v20 = (id)objc_opt_class(v4);
      v15 = v20;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Associated object '%{private}@' kind is empty.", buf, 0xCu);

    }
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (void)removeAssociatedObject:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  if (!v4)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ associatedObject cannot be nil"), objc_opt_class(self));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    APSimulateCrash(5, v6, 1);

  }
  v7 = objc_msgSend((id)objc_opt_class(v4), "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (objc_msgSend(v8, "length"))
  {
    -[APCacheableSynchronizedObject lockObject](self, "lockObject");
    -[NSMutableDictionary removeObjectForKey:](self->_associatedObjects, "removeObjectForKey:", v8);
    -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
  }
  else
  {
    v9 = APLogForCategory(32);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v13 = (id)objc_opt_class(v4);
      v11 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Associated object '%{private}@' kind is empty.", buf, 0xCu);

    }
  }

}

- (void)touch
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APCacheableObject persistentStore](self, "persistentStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObject fileName](self, "fileName"));
  objc_msgSend(v4, "touchObjectForKey:", v3);

}

- (void)save
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APCacheableObject persistentStore](self, "persistentStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObject fileName](self, "fileName"));
  objc_msgSend(v4, "setObject:forKey:", self, v3);

}

- (void)remove
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  -[APCacheableSynchronizedObject lockObject](self, "lockObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableMasterObject associatedObjects](self, "associatedObjects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  -[NSMutableDictionary removeAllObjects](self->_associatedObjects, "removeAllObjects");
  -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[APCacheableObject associatedObjectFileNameForIdentifier:](APCacheableObject, "associatedObjectFileNameForIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObject persistentStore](self, "persistentStore"));
        objc_msgSend(v11, "removeObjectForKey:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObject persistentStore](self, "persistentStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObject fileName](self, "fileName"));
  objc_msgSend(v12, "removeObjectForKey:", v13);

}

- (NSMutableDictionary)associatedObjects
{
  return self->_associatedObjects;
}

- (void)setAssociatedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_associatedObjects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedObjects, 0);
}

@end
