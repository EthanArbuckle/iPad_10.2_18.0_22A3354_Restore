@implementation PGConfiguration

- (PGConfiguration)initWithSources:(id)a3 version:(double)a4
{
  id v6;
  PGConfiguration *v7;
  PGConfiguration *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PGConfiguration;
  v7 = -[PGConfiguration init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_version = a4;
    -[PGConfiguration propertyKeys](v7, "propertyKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          -[PGConfiguration _configureWithSource:propertyKeys:](v8, "_configureWithSource:propertyKeys:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), v9, (_QWORD)v16);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v12);
    }

  }
  return v8;
}

- (id)propertyKeys
{
  id v3;
  objc_class *v4;
  objc_property_t *v5;
  void *v6;
  unsigned int outCount;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (objc_class *)objc_opt_class();
  while (-[objc_class isSubclassOfClass:](v4, "isSubclassOfClass:", objc_opt_class()))
  {
    outCount = 0;
    v5 = class_copyPropertyList(v4, &outCount);
    -[PGConfiguration propertyNamesForProperties:propertyCount:](self, "propertyNamesForProperties:propertyCount:", v5, outCount);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);
    free(v5);
    v4 = (objc_class *)-[objc_class superclass](v4, "superclass");

  }
  return v3;
}

- (id)propertyNamesForProperties:(objc_property *)a3 propertyCount:(unsigned int)a4
{
  void *v6;
  uint64_t v7;
  objc_property *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v7 = a4;
    do
    {
      v8 = *a3++;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      --v7;
    }
    while (v7);
  }
  return v6;
}

- (void)_configureWithSource:(id)a3 propertyKeys:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          -[PGConfiguration setValue:forKey:](self, "setValue:forKey:", v13, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend((id)objc_opt_class(), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGConfiguration version](self, "version");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (version: %.2f):"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PGConfiguration propertyKeys](self, "propertyKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[PGConfiguration valueForKey:](self, "valueForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@: %@"), v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)persistConfiguration
{
  id v3;
  id v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v4 = 0;
  if ((objc_msgSend(v3, "fileExistsAtPath:isDirectory:", CFSTR("/var/mobile/Media/PhotoData/Configuration"), 0) & 1) != 0
    || (v14 = 0,
        v5 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Media/PhotoData/Configuration"), 1, 0, &v14), v4 = v14, (v5 & 1) != 0))
  {
    objc_msgSend((id)objc_opt_class(), "_persistedConfigurationPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGConfiguration _configurationDictionary](self, "_configurationDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "writeToFile:atomically:", v6, 1);

    if ((v8 & 1) != 0)
      goto LABEL_11;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "[PGConfiguration] Failed to create Configuration directory (%@)", buf, 0xCu);
    }

  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "loggingConnection");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend((id)objc_opt_class(), "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v13;
    _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "[PGConfiguration] Failed to persist configuration dictionary for class %@", buf, 0xCu);

  }
LABEL_11:

}

- (id)_configurationDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PGConfiguration propertyKeys](self, "propertyKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[PGConfiguration valueForKey:](self, "valueForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)deletePersistedConfiguration
{
  void *v2;
  id v3;
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_persistedConfigurationPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, 0))
  {
    v8 = 0;
    v4 = objc_msgSend(v3, "removeItemAtPath:error:", v2, &v8);
    v5 = v8;
    if ((v4 & 1) == 0)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "loggingConnection");
      v7 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v5;
        _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "[PGConfiguration] Failed to delete persisted configuration dictionary (%@)", buf, 0xCu);
      }

    }
  }

}

- (double)version
{
  return self->_version;
}

+ (id)persistedConfiguration
{
  void *v2;
  void *v3;
  PGDictionaryConfigurationSource *v4;
  void *v5;
  double v6;
  double v7;
  PGConfiguration *v8;
  void *v9;
  PGConfiguration *v10;
  void *v11;
  int v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_persistedConfigurationPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v2);
  if (v3)
  {
    v4 = -[PGDictionaryConfigurationSource initWithDictionary:]([PGDictionaryConfigurationSource alloc], "initWithDictionary:", v3);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    v8 = [PGConfiguration alloc];
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PGConfiguration initWithSources:version:](v8, "initWithSources:version:", v9, v7);

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v4 = (PGDictionaryConfigurationSource *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v2;
      _os_log_error_impl(&dword_1CA237000, &v4->super, OS_LOG_TYPE_ERROR, "[PGConfiguration] No persisted configuration found at path %@", (uint8_t *)&v13, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

+ (id)_persistedConfigurationPath
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/mobile/Media/PhotoData/Configuration"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
