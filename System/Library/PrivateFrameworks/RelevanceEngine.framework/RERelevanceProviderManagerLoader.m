@implementation RERelevanceProviderManagerLoader

+ (id)disabledRelevanceProviderManagerLoader
{
  if (disabledRelevanceProviderManagerLoader_onceToken != -1)
    dispatch_once(&disabledRelevanceProviderManagerLoader_onceToken, &__block_literal_global_73);
  return (id)disabledRelevanceProviderManagerLoader_DisabledLoader;
}

- (void)enumerationDataSourceClassesWithBlock:(id)a3
{
  -[REClassLoader enumerateClassesWithBlock:](self->_loader, "enumerateClassesWithBlock:", a3);
}

+ (RERelevanceProviderManagerLoader)relevanceProviderManagerLoaderWithBlock:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  +[RERelevanceProviderManagerLoaderConfiguration sharedInstance](RERelevanceProviderManagerLoaderConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REClassLoader loaderWithBlock:configuration:](REClassLoader, "loaderWithBlock:configuration:", v3, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v4[1];
  v4[1] = v6;

  return (RERelevanceProviderManagerLoader *)v4;
}

- (BOOL)isEqual:(id)a3
{
  RERelevanceProviderManagerLoader *v4;
  REClassLoader *loader;
  REClassLoader *v6;
  REClassLoader *v7;
  REClassLoader *v8;
  char v9;

  v4 = (RERelevanceProviderManagerLoader *)a3;
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

void __74__RERelevanceProviderManagerLoader_disabledRelevanceProviderManagerLoader__block_invoke()
{
  uint64_t v0;
  void *v1;
  REClassLoader *v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)disabledRelevanceProviderManagerLoader_DisabledLoader;
  disabledRelevanceProviderManagerLoader_DisabledLoader = v0;

  v2 = objc_alloc_init(REClassLoader);
  v3 = *(void **)(disabledRelevanceProviderManagerLoader_DisabledLoader + 8);
  *(_QWORD *)(disabledRelevanceProviderManagerLoader_DisabledLoader + 8) = v2;

}

+ (RERelevanceProviderManagerLoader)relevanceProviderManagerLoaderWithDirectories:(id)a3
{
  return (RERelevanceProviderManagerLoader *)objc_msgSend(a1, "relevanceProviderManagerLoaderWithDirectories:relevanceProviderManagerKey:", a3, 0);
}

+ (RERelevanceProviderManagerLoader)relevanceProviderManagerLoaderWithDirectories:(id)a3 relevanceProviderManagerKey:(id)a4
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
  +[RERelevanceProviderManagerLoaderConfiguration sharedInstance](RERelevanceProviderManagerLoaderConfiguration, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[REClassLoader loaderWithDirectories:dataSourceKey:configuration:](REClassLoader, "loaderWithDirectories:dataSourceKey:configuration:", v6, v5, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v7[1];
  v7[1] = v9;

  return (RERelevanceProviderManagerLoader *)v7;
}

+ (id)aggregateRelevanceProviderManagerLoaderWithrelevanceProviderManagerLoaders:(id)a3
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

- (void)prewarm
{
  -[REClassLoader prewarm](self->_loader, "prewarm");
}

- (void)enumerateBundleConfigurations:(id)a3
{
  -[REClassLoader enumerateBundleConfigurations:](self->_loader, "enumerateBundleConfigurations:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_loader);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loader, 0);
}

@end
