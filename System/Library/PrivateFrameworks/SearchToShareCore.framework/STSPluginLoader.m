@implementation STSPluginLoader

- (STSPluginLoader)init
{
  STSPluginLoader *v2;
  NSCache *v3;
  NSCache *pluginCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSPluginLoader;
  v2 = -[STSPluginLoader init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    pluginCache = v2->_pluginCache;
    v2->_pluginCache = v3;

  }
  return v2;
}

- (id)pluginWithName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSCache *pluginCache;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSCache *v17;
  void *v18;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "builtInPlugInsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("SearchToShareAppKitHelpers.bundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "resourceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("SearchToShareAppKitHelpers.bundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    pluginCache = self->_pluginCache;
    objc_msgSend(v6, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](pluginCache, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13
        && (objc_msgSend(v13, "load"), (v15 = objc_alloc_init((Class)objc_msgSend(v14, "principalClass"))) != 0))
      {
        v16 = v15;
        v17 = self->_pluginCache;
        objc_msgSend(v6, "absoluteString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache setObject:forKey:](v17, "setObject:forKey:", v16, v18);

        v12 = v16;
      }
      else
      {
        v12 = 0;
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSCache)pluginCache
{
  return self->_pluginCache;
}

- (void)setPluginCache:(id)a3
{
  objc_storeStrong((id *)&self->_pluginCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginCache, 0);
}

@end
