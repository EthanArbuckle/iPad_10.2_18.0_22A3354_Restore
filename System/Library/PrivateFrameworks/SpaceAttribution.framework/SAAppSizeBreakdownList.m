@implementation SAAppSizeBreakdownList

- (SAAppSizeBreakdownList)init
{
  SAAppSizeBreakdownList *v2;
  uint64_t v3;
  NSMutableDictionary *appSizeBreakdownList;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SAAppSizeBreakdownList;
  v2 = -[SAAppSizeBreakdownList init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    appSizeBreakdownList = v2->_appSizeBreakdownList;
    v2->_appSizeBreakdownList = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)addPath:(id)a3 fixedPath:(BOOL)a4 size:(unint64_t)a5 bundleId:(id)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  id v12;

  v8 = a4;
  v12 = a3;
  v10 = a6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appSizeBreakdownList, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appSizeBreakdownList, "setObject:forKeyedSubscript:", v11, v10);
  }
  objc_msgSend(v11, "addPath:fixedPath:size:", v12, v8, a5);

}

- (void)addTagSize:(unint64_t)a3 bundleId:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appSizeBreakdownList, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appSizeBreakdownList, "setObject:forKeyedSubscript:", v6, v7);
  }
  objc_msgSend(v6, "addTagSize:", a3);

}

- (void)updatePath:(id)a3 cacheSize:(unint64_t)a4 bundleId:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appSizeBreakdownList, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appSizeBreakdownList, "setObject:forKeyedSubscript:", v9, v8);
  }
  objc_msgSend(v9, "updatePath:cacheSize:", v10, a4);

}

- (void)addPluginSize:(unint64_t)a3 bundleId:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appSizeBreakdownList, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appSizeBreakdownList, "setObject:forKeyedSubscript:", v6, v7);
  }
  objc_msgSend(v6, "addPluginCacheSize:", a3);

}

- (void)updateBundleId:(id)a3 newId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appSizeBreakdownList, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_appSizeBreakdownList, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "mergeWithAppSizeBreakdown:", v7);
    else
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appSizeBreakdownList, "setObject:forKeyedSubscript:", v7, v6);
    -[NSMutableDictionary removeObjectForKey:](self->_appSizeBreakdownList, "removeObjectForKey:", v10);

  }
}

- (void)mergeBundleId:(id)a3 withBundleId:(id)a4 newBundleId:(id)a5
{
  NSMutableDictionary *appSizeBreakdownList;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  appSizeBreakdownList = self->_appSizeBreakdownList;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](appSizeBreakdownList, "objectForKeyedSubscript:", v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appSizeBreakdownList, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mergeWithAppSizeBreakdown:", v12);
  -[NSMutableDictionary removeObjectForKey:](self->_appSizeBreakdownList, "removeObjectForKey:", v10);

  -[SAAppSizeBreakdownList updateBundleId:newId:](self, "updateBundleId:newId:", v11, v9);
}

- (void)updatePath:(id)a3 cloneSize:(unint64_t)a4 bundleId:(id)a5
{
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appSizeBreakdownList, "objectForKeyedSubscript:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "updatePath:cloneSize:", v10, a4);

}

- (void)updateTagsWithCloneSize:(unint64_t)a3 bundleId:(id)a4
{
  void *v5;
  id v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_appSizeBreakdownList, "objectForKeyedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "addTagSize:", a3);
    v5 = v6;
  }

}

- (id)generateDictionary
{
  void *v3;
  NSMutableDictionary *appSizeBreakdownList;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  appSizeBreakdownList = self->_appSizeBreakdownList;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__SAAppSizeBreakdownList_generateDictionary__block_invoke;
  v7[3] = &unk_2518F35F0;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appSizeBreakdownList, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __44__SAAppSizeBreakdownList_generateDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "generateDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (void)removeBundleId:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_appSizeBreakdownList, "removeObjectForKey:", a3);
}

- (NSMutableDictionary)appSizeBreakdownList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAppSizeBreakdownList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSizeBreakdownList, 0);
}

@end
