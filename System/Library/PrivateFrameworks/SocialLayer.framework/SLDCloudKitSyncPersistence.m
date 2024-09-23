@implementation SLDCloudKitSyncPersistence

- (SLDCloudKitSyncPersistence)initWithName:(id)a3
{
  id v4;
  SLDCloudKitSyncPersistence *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *suiteName;
  uint64_t v10;
  NSUserDefaults *defaults;
  uint64_t v12;
  NSMutableDictionary *cache;
  uint64_t v14;
  id nilValue;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SLDCloudKitSyncPersistence;
  v5 = -[SLDCloudKitSyncPersistence init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(CFSTR("com.apple.sociallayerd.CloudKit."), "stringByAppendingString:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    suiteName = v5->_suiteName;
    v5->_suiteName = (NSString *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v5->_suiteName);
    defaults = v5->_defaults;
    v5->_defaults = (NSUserDefaults *)v10;

    v12 = objc_opt_new();
    cache = v5->_cache;
    v5->_cache = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    nilValue = v5->_nilValue;
    v5->_nilValue = (id)v14;

  }
  return v5;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == self->_nilValue)
    {
      v7 = 0;
    }
    else
    {
      if (!v6)
      {
        -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", v5);
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      v6 = v6;
      v7 = v6;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id nilValue;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(v10, "copy");
    nilValue = v8;
    if (!v8)
      nilValue = self->_nilValue;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", nilValue, v7);

    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v10, v7);
  }

}

- (void)reset
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SLDaemonLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "#SLDCK !!! PERSISTENCE RESET !!!", buf, 2u);
  }

  -[NSUserDefaults removePersistentDomainForName:](self->_defaults, "removePersistentDomainForName:", self->_suiteName);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allKeys](self->_cache, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", self->_nilValue, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nilValue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_suiteName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
