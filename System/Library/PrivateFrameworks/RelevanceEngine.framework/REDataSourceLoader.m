@implementation REDataSourceLoader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loader, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_loader);
  return v4;
}

- (void)enumerateDataSourceObjectsWithBlock:(id)a3
{
  -[REClassLoader enumerateObjectsWithBlock:](self->_loader, "enumerateObjectsWithBlock:", a3);
}

- (void)enumerateDataSourceClassesWithBlock:(id)a3
{
  -[REClassLoader enumerateClassesWithBlock:](self->_loader, "enumerateClassesWithBlock:", a3);
}

- (void)enumerateBundleConfigurations:(id)a3
{
  -[REClassLoader enumerateBundleConfigurations:](self->_loader, "enumerateBundleConfigurations:", a3);
}

+ (id)aggregateDataSourceLoaderWithDataSourceLoaders:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
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
        if (*(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9) + 8))
          objc_msgSend(v4, "addObject:", (_QWORD)v14);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v10 = (_QWORD *)objc_opt_new();
  +[REClassLoader groupLoaderWithLoaders:](REClassLoader, "groupLoaderWithLoaders:", v4);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v10[1];
  v10[1] = v11;

  return v10;
}

+ (id)dataSourceLoaderWithDataSources:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  +[REDataSourceLoaderConfiguration sharedInstance](REDataSourceLoaderConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REClassLoader loaderWithObjects:configuration:](REClassLoader, "loaderWithObjects:configuration:", v3, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v4[1];
  v4[1] = v6;

  return v4;
}

+ (id)dataSourceLoaderWithBlock:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  +[REDataSourceLoaderConfiguration sharedInstance](REDataSourceLoaderConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REClassLoader loaderWithBlock:configuration:](REClassLoader, "loaderWithBlock:configuration:", v3, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v4[1];
  v4[1] = v6;

  return v4;
}

+ (id)defaultDataSourceLoader
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__REDataSourceLoader_defaultDataSourceLoader__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultDataSourceLoader_onceToken != -1)
    dispatch_once(&defaultDataSourceLoader_onceToken, block);
  return (id)defaultDataSourceLoader_BundleLoader;
}

- (BOOL)isEqual:(id)a3
{
  REDataSourceLoader *v4;
  REClassLoader *loader;
  REClassLoader *v6;
  REClassLoader *v7;
  REClassLoader *v8;
  char v9;

  v4 = (REDataSourceLoader *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      loader = self->_loader;
      v6 = v4->_loader;
      v7 = loader;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[REClassLoader isEqual:](v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)disabledDataSourceLoader
{
  if (disabledDataSourceLoader_onceToken != -1)
    dispatch_once(&disabledDataSourceLoader_onceToken, &__block_literal_global_0);
  return (id)disabledDataSourceLoader_DisabledLoader;
}

void __46__REDataSourceLoader_disabledDataSourceLoader__block_invoke()
{
  uint64_t v0;
  void *v1;
  REClassLoader *v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)disabledDataSourceLoader_DisabledLoader;
  disabledDataSourceLoader_DisabledLoader = v0;

  v2 = objc_alloc_init(REClassLoader);
  v3 = *(void **)(disabledDataSourceLoader_DisabledLoader + 8);
  *(_QWORD *)(disabledDataSourceLoader_DisabledLoader + 8) = v2;

}

void __45__REDataSourceLoader_defaultDataSourceLoader__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builtInPlugInsURL");
  v2 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByDeletingPathExtension");
  v7 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)v7;
  v21 = (void *)v4;
  v23 = (void *)v2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v2, v4, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("RelevanceEngine"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URLByAppendingPathComponent:", CFSTR("DataSources"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "addObject:", v15);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  v16 = *(void **)(a1 + 32);
  v17 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v16, "dataSourceLoaderWithDirectories:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)defaultDataSourceLoader_BundleLoader;
  defaultDataSourceLoader_BundleLoader = v18;

}

+ (id)dataSourceLoaderWithDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dataSourceLoaderWithDirectories:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "dataSourceLoaderWithDirectories:", MEMORY[0x24BDBD1A8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)dataSourceLoaderWithDirectories:(id)a3
{
  return (id)objc_msgSend(a1, "dataSourceLoaderWithDirectories:dataSourceKey:", a3, 0);
}

+ (id)dataSourceLoaderWithDirectories:(id)a3 dataSourceKey:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = (_QWORD *)objc_opt_new();
  +[REDataSourceLoaderConfiguration sharedInstance](REDataSourceLoaderConfiguration, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[REClassLoader loaderWithDirectories:dataSourceKey:configuration:](REClassLoader, "loaderWithDirectories:dataSourceKey:configuration:", v6, v5, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v7[1];
  v7[1] = v9;

  return v7;
}

- (void)prewarm
{
  -[REClassLoader prewarm](self->_loader, "prewarm");
}

@end
