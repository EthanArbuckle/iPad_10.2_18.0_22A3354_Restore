@implementation APCacheableObjectProxy

+ (BOOL)objectIsLoaded:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_opt_class(v3);
  if (objc_msgSend(v4, "isEqual:", objc_opt_class(APCacheableObjectProxy)))
    v5 = objc_msgSend(v3, "_proxiedObjectIsAlive");
  else
    v5 = 0;

  return v5;
}

+ (id)proxyWithCacheKey:(id)a3 object:(id)a4 inPersistentStore:(id)a5
{
  return objc_msgSend(a1, "proxyWithCacheKey:object:identifier:inPersistentStore:", a3, a4, 0, a5);
}

+ (id)proxyWithCacheKey:(id)a3 object:(id)a4 identifier:(id)a5 inPersistentStore:(id)a6
{
  NSString *v9;
  APCacheableBaseObject *v10;
  id v11;
  id v12;
  APCacheableObjectProxy *v13;
  NSString *cacheKey;
  NSString *v15;
  APCacheableBaseObject *proxyObject;
  APCacheableBaseObject *v17;
  NSString *v18;
  NSString *identifier;

  v9 = (NSString *)a3;
  v10 = (APCacheableBaseObject *)a4;
  v11 = a6;
  v12 = a5;
  v13 = [APCacheableObjectProxy alloc];
  cacheKey = v13->_cacheKey;
  v13->_cacheKey = v9;
  v15 = v9;

  proxyObject = v13->_proxyObject;
  v13->_proxyObject = v10;
  v17 = v10;

  objc_storeWeak((id *)&v13->_persistentStore, v11);
  v18 = (NSString *)objc_msgSend(v12, "copy");

  identifier = v13->_identifier;
  v13->_identifier = v18;

  return v13;
}

- (NSString)identifier
{
  NSString *identifier;
  NSString *v3;
  void *v4;

  identifier = self->_identifier;
  if (identifier)
  {
    v3 = identifier;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObjectProxy proxyObject](self, "proxyObject"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  }
  return v3;
}

- (APCacheableBaseObject)proxyObject
{
  APCacheableBaseObject **p_proxyObject;
  APCacheableBaseObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t (**v9)(void);
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;

  p_proxyObject = &self->_proxyObject;
  v4 = self->_proxyObject;
  if (!v4)
  {
    v5 = APLogForCategory(34);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObjectProxy cacheKey](self, "cacheKey"));
      v17 = 138543362;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Cacheable proxy is loading object %{public}@.", (uint8_t *)&v17, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObjectProxy provideIgnorableKeyNamesBlock](self, "provideIgnorableKeyNamesBlock"));

    if (v8)
    {
      v9 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[APCacheableObjectProxy provideIgnorableKeyNamesBlock](self, "provideIgnorableKeyNamesBlock"));
      v10 = v9[2]();
      v8 = (void *)objc_claimAutoreleasedReturnValue(v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObjectProxy persistentStore](self, "persistentStore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObjectProxy cacheKey](self, "cacheKey"));
    v4 = (APCacheableBaseObject *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:ignoreKeys:", v12, v8));

    if (!v4)
    {
      v13 = APLogForCategory(34);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObjectProxy cacheKey](self, "cacheKey"));
        v17 = 138543362;
        v18 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Cacheable proxy failed to get object %{public}@ from cache.", (uint8_t *)&v17, 0xCu);

      }
    }

  }
  objc_storeStrong((id *)p_proxyObject, v4);
  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_persistentStore);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong(&self->_provideIgnorableKeyNamesBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_proxyObject, 0);
}

+ (id)proxyWithCacheKey:(id)a3 inPersistentStore:(id)a4
{
  return objc_msgSend(a1, "proxyWithCacheKey:object:identifier:inPersistentStore:", a3, 0, 0, a4);
}

- (void)forwardInvocation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObjectProxy proxyObject](self, "proxyObject"));
  if (v4)
  {
    objc_msgSend(v5, "setTarget:", v4);
    objc_msgSend(v5, "invoke");
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObjectProxy proxyObject](self, "proxyObject"));
  v5 = v4;
  if (!v4
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "methodSignatureForSelector:", a3))) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", "C@:"));
  }

  return v6;
}

- (BOOL)_proxiedObjectIsAlive
{
  return self->_proxyObject != 0;
}

- (id)provideIgnorableKeyNamesBlock
{
  return self->_provideIgnorableKeyNamesBlock;
}

- (void)setProvideIgnorableKeyNamesBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (APPersistentCachedStoreProtocol)persistentStore
{
  return (APPersistentCachedStoreProtocol *)objc_loadWeakRetained((id *)&self->_persistentStore);
}

@end
