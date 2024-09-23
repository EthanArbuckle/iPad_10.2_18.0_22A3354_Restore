@implementation REClassLoader

- (void)enumerateClassesWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  id v7;
  NSArray *v8;
  NSArray *cachedDataSources;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_loadingLock);
    if (!self->_cachedDataSources)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[REClassLoaderConfiguration desiredClassForLoader](self->_configuration, "desiredClassForLoader");
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __43__REClassLoader_enumerateClassesWithBlock___block_invoke;
      v19[3] = &unk_24CF8BBD8;
      v20 = v5;
      v21 = v6;
      v7 = v5;
      -[REClassLoader _enumerateClassesWithBlock:](self, "_enumerateClassesWithBlock:", v19);
      v8 = (NSArray *)objc_msgSend(v7, "copy");
      cachedDataSources = self->_cachedDataSources;
      self->_cachedDataSources = v8;

    }
    os_unfair_lock_unlock(&self->_loadingLock);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = self->_cachedDataSources;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
      }
      while (v12);
    }

  }
}

- (REClassLoaderConfiguration)configuration
{
  return self->_configuration;
}

void __43__REClassLoader_enumerateClassesWithBlock___block_invoke(uint64_t a1, Class aClass)
{
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(aClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40) && (-[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:") & 1) == 0)
  {
    RELogForDomain(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __43__REClassLoader_enumerateClassesWithBlock___block_invoke_cold_1((uint64_t)v4, (Class *)(a1 + 40), v5);
    goto LABEL_9;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", aClass))
  {
    RELogForDomain(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_INFO, "Skipping %@ - Already loaded", (uint8_t *)&v6, 0xCu);
    }
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", aClass);
LABEL_10:

}

- (void)enumerateBundleConfigurations:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  NSArray *v7;
  NSArray *cachedBundleConfigurations;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_loadingLock);
    if (!self->_cachedBundleConfigurations)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __47__REClassLoader_enumerateBundleConfigurations___block_invoke;
      v18[3] = &unk_24CF8BC00;
      v19 = v5;
      v6 = v5;
      -[REClassLoader _enumerateBundleConfigurations:](self, "_enumerateBundleConfigurations:", v18);
      v7 = (NSArray *)objc_msgSend(v6, "copy");
      cachedBundleConfigurations = self->_cachedBundleConfigurations;
      self->_cachedBundleConfigurations = v7;

    }
    os_unfair_lock_unlock(&self->_loadingLock);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = self->_cachedBundleConfigurations;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v11);
    }

  }
}

uint64_t __47__REClassLoader_enumerateBundleConfigurations___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (id)groupLoaderWithLoaders:(id)a3
{
  id v3;
  REGroupClassLoader *v4;

  v3 = a3;
  v4 = -[REGroupClassLoader initWithLoaders:]([REGroupClassLoader alloc], "initWithLoaders:", v3);

  return v4;
}

+ (REClassLoader)loaderWithBlock:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  REBlockClassLoader *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[REBlockClassLoader initWithBlock:configuration:]([REBlockClassLoader alloc], "initWithBlock:configuration:", v6, v5);

  return (REClassLoader *)v7;
}

- (REClassLoader)initWithConfiguration:(id)a3
{
  id v5;
  REClassLoader *v6;
  REClassLoader *v7;

  v5 = a3;
  v6 = -[REClassLoader init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (REClassLoader)init
{
  REClassLoader *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REClassLoader;
  result = -[REClassLoader init](&v3, sel_init);
  if (result)
    result->_loadingLock._os_unfair_lock_opaque = 0;
  return result;
}

+ (REClassLoader)loaderWithObjects:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  REObjectClassLoader *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[REObjectClassLoader initWithObjects:configuration:]([REObjectClassLoader alloc], "initWithObjects:configuration:", v6, v5);

  return (REClassLoader *)v7;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

+ (REClassLoader)loaderWithDirectories:(id)a3 dataSourceKey:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  id v9;
  REDirectoryClassLoader *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[REDirectoryClassLoader initWithDirectories:dataSourceKey:configuration:]([REDirectoryClassLoader alloc], "initWithDirectories:dataSourceKey:configuration:", v9, v8, v7);

  return (REClassLoader *)v10;
}

- (void)prewarm
{
  -[REClassLoader enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", &__block_literal_global_14);
  -[REClassLoader enumerateBundleConfigurations:](self, "enumerateBundleConfigurations:", &__block_literal_global_5);
  -[REClassLoader enumerateClassesWithBlock:](self, "enumerateClassesWithBlock:", &__block_literal_global_7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_cachedBundleConfigurations, 0);
  objc_storeStrong((id *)&self->_cachedDataSources, 0);
}

void __43__REClassLoader_enumerateClassesWithBlock___block_invoke_cold_1(uint64_t a1, Class *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(*a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_2132F7000, a3, OS_LOG_TYPE_ERROR, "Skipping %@ - Unsupported class, expecting %@", (uint8_t *)&v6, 0x16u);

}

@end
