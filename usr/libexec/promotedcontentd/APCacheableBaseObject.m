@implementation APCacheableBaseObject

- (id)proxy
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject cacheKey](self, "cacheKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APPersistentCacheStoreProvider persistentCacheStore](APPersistentCacheStoreProvider, "persistentCacheStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APCacheableObjectProxy proxyWithCacheKey:object:inPersistentStore:](APCacheableObjectProxy, "proxyWithCacheKey:object:inPersistentStore:", v3, self, v4));

  return v5;
}

- (APCacheableBaseObject)initWithIdentifier:(id)a3
{
  id v4;
  APCacheableBaseObject *v5;
  NSString *v6;
  NSString *identifier;

  v4 = a3;
  v5 = -[APCacheableBaseObject init](self, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = v6;

  }
  return v5;
}

- (id)serialize
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  id AssociatedObject;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;

  -[APCacheableBaseObject lockObject](self, "lockObject");
  v11 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_APKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](_APKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v11));
  v4 = v11;
  -[APCacheableBaseObject unlockObject](self, "unlockObject");
  if (v4 || !objc_msgSend(v3, "length"))
  {
    v5 = APLogForCategory(32);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      *(_DWORD *)buf = 138543619;
      v13 = v7;
      v14 = 2113;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to serialize object %{public}@. Error: %{private}@", buf, 0x16u);

    }
    v8 = 0;
  }
  else
  {
    AssociatedObject = objc_getAssociatedObject(v3, "_memorySize");
    v6 = objc_claimAutoreleasedReturnValue(AssociatedObject);
    -[APCacheableBaseObject setObjectSize:](self, "setObjectSize:", -[NSObject unsignedIntegerValue](v6, "unsignedIntegerValue"));
    v8 = v3;
  }

  return v8;
}

- (void)setObjectSize:(unint64_t)a3
{
  self->_objectSize = a3;
}

- (unint64_t)objectSize
{
  return self->_objectSize;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_identifier"));

}

- (NSString)cacheKey
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cacheKeyForIdentifier:", v4));

  return (NSString *)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (id)cacheKeyForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathExtension:", v5));

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APCacheableBaseObject)initWithCoder:(id)a3
{
  id v4;
  APCacheableBaseObject *v5;
  id v6;
  uint64_t v7;
  NSString *identifier;

  v4 = a3;
  v5 = -[APCacheableBaseObject init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("_identifier"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

  }
  return v5;
}

+ (id)deserializeFromData:(id)a3
{
  return objc_msgSend(a1, "deserializeFromData:ignoreKeys:", a3, 0);
}

+ (id)deserializeFromData:(id)a3 ignoreKeys:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSSet *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v5 = a4;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v20 = 0;
    v7 = -[_APKeyedUnarchiver initForReadingFromData:error:]([_APKeyedUnarchiver alloc], "initForReadingFromData:error:", v6, &v20);

    v8 = v20;
    if (v7)
    {
      objc_msgSend(v7, "setIgnoreKeys:", v5);
      objc_msgSend(v7, "setRequiresSecureCoding:", 1);
      objc_msgSend(v7, "setDecodingFailurePolicy:", 1);
      v9 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(APCacheableBaseObject));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v19 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "decodeTopLevelObjectOfClasses:forKey:error:", v10, NSKeyedArchiveRootObjectKey, &v19));
      v12 = v19;

      v8 = v12;
    }
    else
    {
      v11 = 0;
    }

    if (v8)
      goto LABEL_10;
  }
  else
  {
    v18 = 0;
    v13 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(APCacheableBaseObject), v6, &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v13);

    v8 = v18;
    if (v8)
      goto LABEL_10;
  }
  if (v11)
  {
    v14 = v11;
    goto LABEL_13;
  }
LABEL_10:
  v15 = APLogForCategory(32);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to deserialize object. Error: %{private}@", buf, 0xCu);
  }

  v14 = 0;
LABEL_13:

  return v14;
}

- (int64_t)garbageCollect
{
  return 0;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

+ (id)proxyForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheKeyForIdentifier:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APPersistentCacheStoreProvider persistentCacheStore](APPersistentCacheStoreProvider, "persistentCacheStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APCacheableObjectProxy proxyWithCacheKey:object:identifier:inPersistentStore:](APCacheableObjectProxy, "proxyWithCacheKey:object:identifier:inPersistentStore:", v5, 0, v4, v6));

  return v7;
}

@end
