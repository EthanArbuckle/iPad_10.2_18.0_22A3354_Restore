@implementation APCacheableAssociatedObject

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
  v6.super_class = (Class)APCacheableAssociatedObject;
  v4 = a3;
  -[APCacheableBaseObject encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableAssociatedObject masterId](self, "masterId", v6.receiver, v6.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_master_id"));

}

- (APCacheableAssociatedObject)initWithCoder:(id)a3
{
  id v4;
  APCacheableAssociatedObject *v5;
  id v6;
  uint64_t v7;
  NSString *masterId;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APCacheableAssociatedObject;
  v5 = -[APCacheableSynchronizedObject initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("_master_id"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    masterId = v5->_masterId;
    v5->_masterId = (NSString *)v7;

  }
  return v5;
}

- (APCacheableAssociatedObject)initWithMaster:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  APCacheableAssociatedObject *v8;
  void *v9;
  NSString *v10;
  NSString *masterId;

  v4 = a3;
  if (!v4)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ master cannot be nil"), objc_opt_class(self));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    APSimulateCrash(5, v6, 1);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentStore"));
  v8 = -[APCacheableObject initInPersistentStore:](self, "initInPersistentStore:", v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v10 = (NSString *)objc_msgSend(v9, "copy");
    masterId = v8->_masterId;
    v8->_masterId = v10;

    v8->_isNewObject = 1;
  }

  return v8;
}

+ (BOOL)isMasterObject
{
  return 0;
}

- (APCacheableMasterObject)masterObject
{
  APCacheableMasterObject **p_masterObject;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  p_masterObject = &self->_masterObject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_masterObject);
  if (!WeakRetained)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableAssociatedObject masterId](self, "masterId"));
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableAssociatedObject masterId](self, "masterId"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObject persistentStore](self, "persistentStore"));
      WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[APCacheableObject findCacheableObjectForId:inPersistentStore:](APCacheableMasterObject, "findCacheableObjectForId:inPersistentStore:", v7, v8));

      if (!WeakRetained)
      {
        v9 = APLogForCategory(32);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableAssociatedObject masterId](self, "masterId"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
          v14 = 138478083;
          v15 = v11;
          v16 = 2113;
          v17 = v12;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to reconstitute master object with id: '%{private}@' for associated object: '%{private}@'. Data consistency is broken.", (uint8_t *)&v14, 0x16u);

        }
      }
      objc_storeWeak((id *)p_masterObject, WeakRetained);
    }
    else
    {
      WeakRetained = 0;
    }
  }
  return (APCacheableMasterObject *)WeakRetained;
}

- (BOOL)save
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  int v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableAssociatedObject masterObject](self, "masterObject"));
  if (!v3)
  {
    v4 = APLogForCategory(32);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v11 = 138477827;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Master object is not available while saving '%{private}@'.", (uint8_t *)&v11, 0xCu);

    }
    goto LABEL_11;
  }
  -[APCacheableSynchronizedObject lockObject](self, "lockObject");
  if (!-[APCacheableAssociatedObject isNewObject](self, "isNewObject"))
  {
    -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
    objc_msgSend(v3, "touch");
    goto LABEL_9;
  }
  if ((objc_msgSend(v3, "addAssociatedObject:", self) & 1) == 0)
  {
    -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v3, "save");
  -[APCacheableAssociatedObject setIsNewObject:](self, "setIsNewObject:", 0);
  -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
LABEL_9:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObject persistentStore](self, "persistentStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObject fileName](self, "fileName"));
  objc_msgSend(v7, "setObject:forKey:", self, v8);

  v9 = 1;
LABEL_12:

  return v9;
}

- (void)remove
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableAssociatedObject masterObject](self, "masterObject"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "removeAssociatedObject:", self);
    objc_msgSend(v4, "save");
  }
  else
  {
    v5 = APLogForCategory(32);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v10 = 138477827;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Master object is not available while removing '%{private}@'.", (uint8_t *)&v10, 0xCu);

    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObject persistentStore](self, "persistentStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObject fileName](self, "fileName"));
  objc_msgSend(v8, "removeObjectForKey:", v9);

}

- (NSString)masterId
{
  return self->_masterId;
}

- (BOOL)isNewObject
{
  return self->_isNewObject;
}

- (void)setIsNewObject:(BOOL)a3
{
  self->_isNewObject = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterId, 0);
  objc_destroyWeak((id *)&self->_masterObject);
}

@end
