@implementation REDirectoryClassLoader

- (BOOL)isEqual:(id)a3
{
  REDirectoryClassLoader *v4;
  id *v5;
  NSArray *urls;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  int v10;
  char v11;
  NSString *key;
  NSString *v13;
  NSString *v14;
  NSString *v15;

  v4 = (REDirectoryClassLoader *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      urls = self->_urls;
      v7 = (NSArray *)v5[5];
      if (urls == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = urls;
        v10 = -[NSArray isEqual:](v9, "isEqual:", v8);

        if (!v10)
        {
          v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      key = self->_key;
      v13 = (NSString *)v5[5];
      v14 = key;
      v15 = v14;
      if (v14 == v13)
        v11 = 1;
      else
        v11 = -[NSString isEqual:](v14, "isEqual:", v13);

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (REDirectoryClassLoader)initWithDirectories:(id)a3 dataSourceKey:(id)a4 configuration:(id)a5
{
  id v8;
  id v9;
  REDirectoryClassLoader *v10;
  uint64_t v11;
  NSArray *urls;
  uint64_t v13;
  NSString *key;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)REDirectoryClassLoader;
  v10 = -[REClassLoader initWithConfiguration:](&v16, sel_initWithConfiguration_, a5);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    urls = v10->_urls;
    v10->_urls = (NSArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    key = v10->_key;
    v10->_key = (NSString *)v13;

  }
  return v10;
}

- (void)_enumerateBundles:(id)a3
{
  void (**v4)(id, void *);
  NSArray *urls;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSArray *obj;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  urls = self->_urls;
  if (urls)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = urls;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v20)
    {
      v19 = *(_QWORD *)v26;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(obj);
          v7 = (void *)MEMORY[0x24BDD1488];
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v6), "path");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "bundleWithPath:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "pathsForResourcesOfType:inDirectory:", CFSTR("bundle"), CFSTR("."));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v22;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v22 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
                +[REBundleCache sharedInstance](REBundleCache, "sharedInstance");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "bundleAtPath:", v15);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if (v17)
                  v4[2](v4, v17);

                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v12);
          }

          ++v6;
        }
        while (v6 != v20);
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v20);
    }

  }
}

- (void)_enumerateClassesWithBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  REDirectoryClassLoader *v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  -[REClassLoader configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "desiredClassForLoader");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__REDirectoryClassLoader__enumerateClassesWithBlock___block_invoke;
  v9[3] = &unk_24CF8BC50;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v13 = v6;
  v7 = v4;
  v8 = v5;
  -[REDirectoryClassLoader _enumerateBundles:](self, "_enumerateBundles:", v9);

}

void __53__REDirectoryClassLoader__enumerateClassesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "principalClass");
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "isSubclassOfClass:", *(_QWORD *)(a1 + 56)))
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || objc_msgSend(*(id *)(a1 + 32), "shouldLoadBundleClass:forKey:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48)))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
    }
    else
    {
      REBundleConfiguraitonFromBundle(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 40), "configuration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "desiredClassFromBundle:forKey:", v7, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));

        if (v9)
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }

    }
  }
  else
  {
    RELogForDomain(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __53__REDirectoryClassLoader__enumerateClassesWithBlock___block_invoke_cold_1((uint64_t)v3, v6);

  }
}

- (void)_enumerateBundleConfigurations:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__REDirectoryClassLoader__enumerateBundleConfigurations___block_invoke;
  v6[3] = &unk_24CF8BC78;
  v7 = v4;
  v5 = v4;
  -[REDirectoryClassLoader _enumerateBundles:](self, "_enumerateBundles:", v6);

}

void __57__REDirectoryClassLoader__enumerateBundleConfigurations___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  REBundleConfiguraitonFromBundle(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = v4;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  id *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[REClassLoader configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id *)objc_msgSend(v4, "initWithConfiguration:", v5);

  objc_storeStrong(v6 + 5, self->_urls);
  objc_storeStrong(v6 + 6, self->_key);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_urls, 0);
}

void __53__REDirectoryClassLoader__enumerateClassesWithBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "No principal class provided for bundle: %@", (uint8_t *)&v2, 0xCu);
}

@end
