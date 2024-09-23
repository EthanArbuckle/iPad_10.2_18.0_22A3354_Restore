@implementation PGRemoteConfiguration

- (PGRemoteConfiguration)init
{
  id v3;
  PGTrialConfigurationSource *v4;
  void *v5;
  PGRemoteConfiguration *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = +[PGTrialSession newTrialSession](PGTrialSession, "newTrialSession");
  v4 = -[PGTrialConfigurationSource initWithTrialSession:namespaceType:]([PGTrialConfigurationSource alloc], "initWithTrialSession:namespaceType:", v3, 1);
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGRemoteConfiguration initWithConfigurationSources:](self, "initWithConfigurationSources:", v5);

  return v6;
}

- (PGRemoteConfiguration)initWithTrialNamespace:(unsigned __int16)a3 onDiskResourceFile:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  PGPlistFileConfigurationSource *v9;
  PGTrialConfigurationSource *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  PGRemoteConfiguration *v15;
  uint8_t v17[16];

  v4 = a3;
  v6 = a4;
  v7 = +[PGTrialSession newTrialSession](PGTrialSession, "newTrialSession");
  if (v6)
  {
    -[PGRemoteConfiguration onDiskConfigurationPathForResourceFileName:](self, "onDiskConfigurationPathForResourceFileName:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PGPlistFileConfigurationSource initWithPlistFileURL:]([PGPlistFileConfigurationSource alloc], "initWithPlistFileURL:", v8);

  }
  else
  {
    v9 = 0;
  }
  v10 = -[PGTrialConfigurationSource initWithTrialSession:namespaceType:]([PGTrialConfigurationSource alloc], "initWithTrialSession:namespaceType:", v7, v4);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = v11;
  if (v10)
    objc_msgSend(v11, "addObject:", v10);
  if (v9)
    objc_msgSend(v12, "addObject:", v9);
  if (!objc_msgSend(v12, "count"))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "[RemoteConfiguration] ConfigurationSources array is empty. No remote configuration values will be used", v17, 2u);
    }

  }
  v15 = -[PGRemoteConfiguration initWithConfigurationSources:](self, "initWithConfigurationSources:", v12);

  return v15;
}

- (PGRemoteConfiguration)initWithConfigurationSources:(id)a3
{
  id v5;
  PGRemoteConfiguration *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *remoteConfigurationCache;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGRemoteConfiguration;
  v6 = -[PGRemoteConfiguration init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    remoteConfigurationCache = v6->_remoteConfigurationCache;
    v6->_remoteConfigurationCache = v7;

    objc_storeStrong((id *)&v6->_configurationSources, a3);
  }

  return v6;
}

- (id)onDiskConfigurationPathForResourceFileName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", v3, CFSTR("remoteconfig.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v3;
      _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "[PGRemoteConfiguration] Failed to find resourceFilePath:%@ for resourceFileName:%@", (uint8_t *)&v12, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)BOOLValueForKey:(id)a3 withFallbackValue:(BOOL)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGRemoteConfiguration _configValueForKey:withFallbackValue:](self, "_configValueForKey:withFallbackValue:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    LOBYTE(v4) = objc_msgSend(v9, "BOOLValue");

  return v4;
}

- (id)stringValueForKey:(id)a3 withFallbackValue:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[PGRemoteConfiguration _configValueForKey:withFallbackValue:](self, "_configValueForKey:withFallbackValue:", a3, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

- (int64_t)longValueForKey:(id)a3 withFallbackValue:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGRemoteConfiguration _configValueForKey:withFallbackValue:](self, "_configValueForKey:withFallbackValue:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    a4 = objc_msgSend(v9, "longValue");

  return a4;
}

- (double)doubleValueForKey:(id)a3 withFallbackValue:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGRemoteConfiguration _configValueForKey:withFallbackValue:](self, "_configValueForKey:withFallbackValue:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    a4 = v10;
  }

  return a4;
}

- (id)arrayValueForKey:(id)a3 withFallbackValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PGRemoteConfiguration _configValueForKey:withFallbackValue:](self, "_configValueForKey:withFallbackValue:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[PGRemoteConfiguration _isValidFilePath:](self, "_isValidFilePath:", v7))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithContentsOfFile:", v7);
    v9 = v8;
    if (!v8)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "loggingConnection");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412290;
        v16 = v7;
        _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "[RemoteConfiguration] failed to load array from Trial at filepath %@", (uint8_t *)&v15, 0xCu);
      }

      v9 = v6;
    }
    v12 = v9;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v7;
    else
      v13 = v6;
    v12 = v13;
  }

  return v12;
}

- (id)dictionaryValueForKey:(id)a3 withFallbackValue:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PGRemoteConfiguration _configValueForKey:withFallbackValue:](self, "_configValueForKey:withFallbackValue:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[PGRemoteConfiguration _isValidFilePath:](self, "_isValidFilePath:", v7))
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v7);
    if (v8)
      goto LABEL_11;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "[RemoteConfiguration] failed to load dictionary from Trial at filepath %@", (uint8_t *)&v13, 0xCu);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v7;
  else
    v11 = v6;
  v8 = v11;
LABEL_11:

  return v8;
}

- (BOOL)_isValidFilePath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  return v6;
}

- (id)fileValueForKey:(id)a3 withFallbackValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;

  v6 = a4;
  -[PGRemoteConfiguration _configValueForKey:withFallbackValue:](self, "_configValueForKey:withFallbackValue:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v6;
  }
  v11 = v10;

  return v11;
}

- (id)_configValueForKey:(id)a3 withFallbackValue:(id)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PGRemoteConfiguration _cacheFallbackValueForKey:withValue:](self, "_cacheFallbackValueForKey:withValue:", v6, a4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_configurationSources;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "objectForKey:", v6, (_QWORD)v15);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)_cacheFallbackValueForKey:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_remoteConfigurationCache, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v7) & 1) == 0)
  {
    if (v8)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "loggingConnection");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412802;
        v12 = v6;
        v13 = 2112;
        v14 = v8;
        v15 = 2112;
        v16 = v7;
        _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "[PGRemoteConfiguration] fallback value for Key: %@ is given multiple unequal values: %@, %@", (uint8_t *)&v11, 0x20u);
      }

    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteConfigurationCache, "setObject:forKeyedSubscript:", v7, v6);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationSources, 0);
  objc_storeStrong((id *)&self->_remoteConfigurationCache, 0);
}

@end
