@implementation SXDOMModifierManager

- (SXDOMModifierManager)initWithDOMFactory:(id)a3 contextFactory:(id)a4 cacheKeyFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXDOMModifierManager *v12;
  SXDOMModifierManager *v13;
  uint64_t v14;
  NSMutableArray *modifiers;
  NSCache *v16;
  NSCache *cache;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SXDOMModifierManager;
  v12 = -[SXDOMModifierManager init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_DOMFactory, a3);
    objc_storeStrong((id *)&v13->_contextFactory, a4);
    objc_storeStrong((id *)&v13->_cacheKeyFactory, a5);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    modifiers = v13->_modifiers;
    v13->_modifiers = (NSMutableArray *)v14;

    v16 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cache = v13->_cache;
    v13->_cache = v16;

  }
  return v13;
}

- (void)addModifier:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SXDOMModifierManager modifiers](self, "modifiers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)processLayoutTask:(id)a3 layoutBlueprint:(id)a4 DOMObjectProvider:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (!objc_msgSend(v7, "type"))
  {
    -[SXDOMModifierManager cacheKeyFactory](self, "cacheKeyFactory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createCacheKeyForLayoutOptions:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXDOMModifierManager cache](self, "cache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v14 = (void *)SXLayoutLog;
    v15 = os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (!v15)
      {
LABEL_20:
        objc_msgSend(v8, "setDOM:", v13);

        goto LABEL_21;
      }
      v16 = v14;
      objc_msgSend(v7, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDOMModifierManager cache](self, "cache");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v17;
      v40 = 2048;
      v41 = v18;
      _os_log_impl(&dword_217023000, v16, OS_LOG_TYPE_DEFAULT, "Using cached DOM for layout, task-identifier=%{public}@, cache=%p", buf, 0x16u);
    }
    else
    {
      if (v15)
      {
        v19 = v14;
        objc_msgSend(v7, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v20;
        _os_log_impl(&dword_217023000, v19, OS_LOG_TYPE_DEFAULT, "Creating new DOM for layout, task-identifier=%{public}@", buf, 0xCu);

      }
      -[SXDOMModifierManager DOMFactory](self, "DOMFactory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "createDOM");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v22, "mutableCopy");

      -[SXDOMModifierManager contextFactory](self, "contextFactory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "options");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "createModificationContextWithLayoutOptions:", v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[SXDOMModifierManager modifiers](self, "modifiers", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v35;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v35 != v28)
              objc_enumerationMutation(v25);
            objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v29++), "modifyDOM:context:", v16, v17);
          }
          while (v27 != v29);
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v27);
      }

      v13 = -[NSObject copy](v16, "copy");
      if (!v13)
        goto LABEL_19;
      v30 = (void *)SXLayoutLog;
      if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        objc_msgSend(v7, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXDOMModifierManager cache](self, "cache");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v32;
        v40 = 2048;
        v41 = v33;
        _os_log_impl(&dword_217023000, v31, OS_LOG_TYPE_DEFAULT, "Caching DOM for layout, task-identifier=%{public}@, cache=%p", buf, 0x16u);

      }
      -[SXDOMModifierManager cache](self, "cache");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v13, v11);
    }

LABEL_19:
    goto LABEL_20;
  }
LABEL_21:

}

- (SXDOMFactory)DOMFactory
{
  return self->_DOMFactory;
}

- (SXDOMModificationContextFactory)contextFactory
{
  return self->_contextFactory;
}

- (SXDOMCacheKeyFactory)cacheKeyFactory
{
  return self->_cacheKeyFactory;
}

- (NSMutableArray)modifiers
{
  return self->_modifiers;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_modifiers, 0);
  objc_storeStrong((id *)&self->_cacheKeyFactory, 0);
  objc_storeStrong((id *)&self->_contextFactory, 0);
  objc_storeStrong((id *)&self->_DOMFactory, 0);
}

@end
