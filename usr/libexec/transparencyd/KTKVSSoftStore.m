@implementation KTKVSSoftStore

- (KTKVSSoftStore)initWithStore:(id)a3
{
  id v5;
  KTKVSSoftStore *v6;
  KTKVSSoftStore *v7;
  KTKVSSoftStore *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KTKVSSoftStore;
  v6 = -[KTKVSSoftStore init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    -[KTKVSSoftStore setLock:](v6, "setLock:", 0);
    objc_storeStrong((id *)&v7->_internalStore, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)sharedStore
{
  if (qword_1002A78F8 != -1)
    dispatch_once(&qword_1002A78F8, &stru_100248DE8);
  return (id)qword_1002A78F0;
}

- (KTKVSProtocol)store
{
  os_unfair_lock_s *p_lock;
  KTKVSProtocol **p_internalStore;
  KTKVSProtocol *internalStore;
  KTKVSProtocol *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  internalStore = self->_internalStore;
  p_internalStore = &self->_internalStore;
  v6 = internalStore;
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    v6 = (KTKVSProtocol *)objc_claimAutoreleasedReturnValue(+[KTKVSStore strictStore](KTKVSStore, "strictStore"));
    if (v6)
    {
      os_unfair_lock_lock(p_lock);
      objc_storeStrong((id *)p_internalStore, v6);
      os_unfair_lock_unlock(p_lock);
    }
  }
  return v6;
}

- (void)setStore:(id)a3
{
  KTKVSProtocol *v4;
  KTKVSProtocol *internalStore;

  v4 = (KTKVSProtocol *)a3;
  os_unfair_lock_lock(&self->_lock);
  internalStore = self->_internalStore;
  self->_internalStore = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)accountMetricID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTKVSSoftStore store](self, "store"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountMetricID"));

  return (NSString *)v3;
}

- (void)forceSync:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTKVSSoftStore store](self, "store"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "forceSync:", v4);
  }
  else
  {
    if (qword_1002A78D0 != -1)
      dispatch_once(&qword_1002A78D0, &stru_100248E08);
    v7 = qword_1002A78D8;
    if (os_log_type_enabled((os_log_t)qword_1002A78D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "ForceSyncKVS because it happened before first unlock", v9, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorAccount, -328, CFSTR("no KVS store yet")));
    v4[2](v4, v8);

  }
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTKVSSoftStore store](self, "store"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[KTKVSSoftStore store](self, "store"));
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[KTKVSSoftStore store](self, "store"));
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (BOOL)storeReady
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTKVSSoftStore store](self, "store"));
  v3 = objc_msgSend(v2, "storeReady");

  return v3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalStore, 0);
}

@end
