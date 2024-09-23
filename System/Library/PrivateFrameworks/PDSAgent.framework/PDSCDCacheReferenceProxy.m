@implementation PDSCDCacheReferenceProxy

- (PDSCDCacheReferenceProxy)initWithCacheContainer:(id)a3 persistentContainer:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_cacheContainer, a3);
    objc_storeStrong((id *)&self->_persistentContainer, a4);
  }

  return self;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PDSCDCacheReferenceProxy cacheContainer](self, "cacheContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", v4);

  return v6;
}

- (PDSCDCacheContainer)cacheContainer
{
  return self->_cacheContainer;
}

- (void)setCacheContainer:(id)a3
{
  objc_storeStrong((id *)&self->_cacheContainer, a3);
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_persistentContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_cacheContainer, 0);
}

@end
