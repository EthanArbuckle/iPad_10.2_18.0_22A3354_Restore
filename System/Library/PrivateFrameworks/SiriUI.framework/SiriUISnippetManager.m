@implementation SiriUISnippetManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_7);
  return (id)sharedInstance_sharedInstance_0;
}

void __38__SiriUISnippetManager_sharedInstance__block_invoke()
{
  SiriUISnippetManager *v0;
  void *v1;

  v0 = objc_alloc_init(SiriUISnippetManager);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (SiriUISnippetManager)init
{
  SiriUISnippetManager *v2;
  uint64_t v3;
  AFClientPluginManager *pluginManager;
  NSDictionary *snippetExtensionsCache;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *snippetExtensionsQueue;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *pluginBundlesQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SiriUISnippetManager;
  v2 = -[SiriUISnippetManager init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE09138], "clientPluginManagerWithFactoryInitializationBlock:", &__block_literal_global_5);
    v3 = objc_claimAutoreleasedReturnValue();
    pluginManager = v2->_pluginManager;
    v2->_pluginManager = (AFClientPluginManager *)v3;

    snippetExtensionsCache = v2->_snippetExtensionsCache;
    v2->_snippetExtensionsCache = 0;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("SnippetExtensionsQueue", v6);
    snippetExtensionsQueue = v2->_snippetExtensionsQueue;
    v2->_snippetExtensionsQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("PluginBundlesQueue", v9);
    pluginBundlesQueue = v2->_pluginBundlesQueue;
    v2->_pluginBundlesQueue = (OS_dispatch_queue *)v10;

  }
  return v2;
}

id __28__SiriUISnippetManager_init__block_invoke(uint64_t a1, objc_class *a2)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(a2);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setOrientationDelegate:", v3);

  }
  return v2;
}

- (void)prewarmSnippetExtensionsCache
{
  NSObject *snippetExtensionsQueue;
  _QWORD block[5];

  snippetExtensionsQueue = self->_snippetExtensionsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SiriUISnippetManager_prewarmSnippetExtensionsCache__block_invoke;
  block[3] = &unk_24D7D91F8;
  block[4] = self;
  dispatch_async(snippetExtensionsQueue, block);
}

uint64_t __53__SiriUISnippetManager_prewarmSnippetExtensionsCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prewarmSnippetExtensionsCacheSynchronously");
}

- (id)extensionForSnippet:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SiriUISnippetManager _snippetExtensionsCache](self, "_snippetExtensionsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();

  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_prewarmSnippetExtensionsCacheSynchronously
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SiriUISnippetManager__prewarmSnippetExtensionsCacheSynchronously__block_invoke;
  block[3] = &unk_24D7D91F8;
  block[4] = self;
  if (_prewarmSnippetExtensionsCacheSynchronously_onceToken != -1)
    dispatch_once(&_prewarmSnippetExtensionsCacheSynchronously_onceToken, block);
}

void __67__SiriUISnippetManager__prewarmSnippetExtensionsCacheSynchronously__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD v6[5];
  NSObject *v7;

  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = (void *)MEMORY[0x24BDD1550];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__SiriUISnippetManager__prewarmSnippetExtensionsCacheSynchronously__block_invoke_2;
  v6[3] = &unk_24D7D99D8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v2;
  v4 = v2;
  objc_msgSend(v3, "_intents_matchSiriUISnippetExtensionsWithCompletion:", v6);
  v5 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v4, v5);

}

void __67__SiriUISnippetManager__prewarmSnippetExtensionsCacheSynchronously__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a3)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = MEMORY[0x24BDBD1B8];

  }
  else
  {
    v25 = a1;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v24 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v13, "attributes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("SAUISnippetSubclassNames"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v16 = v15;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v28 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v18);
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v10);
    }

    v21 = objc_msgSend(v8, "copy");
    a1 = v25;
    v22 = *(_QWORD *)(v25 + 32);
    v23 = *(void **)(v22 + 16);
    *(_QWORD *)(v22 + 16) = v21;

    v5 = v24;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (id)_snippetExtensionsCache
{
  NSObject *snippetExtensionsQueue;
  _QWORD block[5];

  snippetExtensionsQueue = self->_snippetExtensionsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SiriUISnippetManager__snippetExtensionsCache__block_invoke;
  block[3] = &unk_24D7D91F8;
  block[4] = self;
  dispatch_sync(snippetExtensionsQueue, block);
  return self->_snippetExtensionsCache;
}

_QWORD *__47__SiriUISnippetManager__snippetExtensionsCache__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[2])
    return (_QWORD *)objc_msgSend(result, "_prewarmSnippetExtensionsCacheSynchronously");
  return result;
}

- (id)_createDebugViewControllerForAceObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = (void *)MEMORY[0x24BDD17C8];
  MEMORY[0x219A0F5F4]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = CFSTR("AppleInternal");
  v13[2] = CFSTR("/Library/Assistant/UIPlugins");
  v13[3] = CFSTR("Debug.siriUIBundle");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathWithComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (objc_msgSend(v9, "loadAndReturnError:", 0))
  {
    v11 = objc_alloc_init((Class)objc_msgSend(v9, "principalClass"));
    objc_msgSend(v11, "viewControllerForSnippet:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (BOOL)_listItem:(id)a3 isEqualToListItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__SiriUISnippetManager__listItem_isEqualToListItem___block_invoke;
  v13[3] = &unk_24D7D9A00;
  v14 = v6;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  LOBYTE(self) = -[SiriUISnippetManager _compareObject:toObject:usingBlock:](self, "_compareObject:toObject:usingBlock:", v8, v9, v13);

  return (char)self;
}

BOOL __52__SiriUISnippetManager__listItem_isEqualToListItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "listItem:isEqualToListItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)) & 1) != 0;

  return v4;
}

- (BOOL)_listItem:(id)a3 isPreferredOverListItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "object");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "object");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v8 | v9)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__SiriUISnippetManager__listItem_isPreferredOverListItem___block_invoke;
    v12[3] = &unk_24D7D9A00;
    v13 = v6;
    v14 = v7;
    v10 = -[SiriUISnippetManager _compareObject:toObject:usingBlock:](self, "_compareObject:toObject:usingBlock:", v8, v9, v12);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

BOOL __58__SiriUISnippetManager__listItem_isPreferredOverListItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "listItem:isPreferredOverListItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)) & 1) != 0;

  return v4;
}

- (BOOL)_compareObject:(id)a3 toObject:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  AFClientPluginManager *pluginManager;
  void *v15;
  void *v16;
  uint64_t v17;
  AFClientPluginManager *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, _BYTE *);
  void *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v10 && v8 && v9)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __59__SiriUISnippetManager__compareObject_toObject_usingBlock___block_invoke;
    v25 = &unk_24D7D9A28;
    v27 = &v28;
    v26 = v10;
    v13 = (void *)MEMORY[0x219A0F948](&v22);
    pluginManager = self->_pluginManager;
    objc_msgSend(v8, "groupIdentifier", v22, v23, v24, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodedClassName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x24BE08BD8];
    -[AFClientPluginManager enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:](pluginManager, "enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:", *MEMORY[0x24BE08BD8], v15, v16, v13);

    if (*((_BYTE *)v29 + 24))
    {
      v12 = 1;
    }
    else
    {
      v18 = self->_pluginManager;
      objc_msgSend(v9, "groupIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "encodedClassName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFClientPluginManager enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:](v18, "enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:", v17, v19, v20, v13);

      v12 = *((_BYTE *)v29 + 24) != 0;
    }

    _Block_object_dispose(&v28, 8);
  }

  return v12;
}

uint64_t __59__SiriUISnippetManager__compareObject_toObject_usingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
  return result;
}

- (id)transcriptItemForObject:(id)a3
{
  return -[SiriUISnippetManager transcriptItemForObject:sizeClass:](self, "transcriptItemForObject:sizeClass:", a3, 0);
}

- (id)transcriptItemForObject:(id)a3 sizeClass:(int64_t)a4
{
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  SiriUIErrorSnippetViewController *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  SiriUISnippetManager *v21;
  uint64_t *v22;
  int64_t v23;
  SEL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v7 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  v30 = 0;
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __58__SiriUISnippetManager_transcriptItemForObject_sizeClass___block_invoke;
  v19[3] = &unk_24D7D9A78;
  v9 = v7;
  v22 = &v25;
  v23 = a4;
  v20 = v9;
  v21 = self;
  v24 = a2;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __58__SiriUISnippetManager_transcriptItemForObject_sizeClass___block_invoke_3;
  v18[3] = &unk_24D7D9460;
  v18[4] = &v31;
  SiriUIBlockExecuteMonitored(v19, v18);
  if (objc_msgSend((id)v26[5], "conformsToProtocol:", &unk_254F220D8))
    objc_msgSend((id)v26[5], "configureContentWithSizeClass:", a4);
  if (!v26[5])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !*((_BYTE *)v32 + 24))
    {
      v10 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        -[SiriUISnippetManager transcriptItemForObject:sizeClass:].cold.2((uint64_t)v9, v10);
      -[SiriUISnippetManager _createDebugViewControllerForAceObject:](self, "_createDebugViewControllerForAceObject:", v9);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v26[5];
      v26[5] = v11;

    }
  }
  if (!v26[5])
  {
    v13 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SiriUISnippetManager transcriptItemForObject:sizeClass:].cold.1((uint64_t)v9, v13);
    v14 = -[SiriUIErrorSnippetViewController initWithError:]([SiriUIErrorSnippetViewController alloc], "initWithError:", 0);
    v15 = (void *)v26[5];
    v26[5] = (uint64_t)v14;

  }
  objc_msgSend(MEMORY[0x24BEA6288], "transcriptItemWithAceObject:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setViewController:", v26[5]);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

void __58__SiriUISnippetManager_transcriptItemForObject_sizeClass___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = *(id *)(a1 + 32);
    +[SiriUIPrivateViewControllerOverrides viewControllerForSnippet:sizeClass:](SiriUIPrivateViewControllerOverrides, "viewControllerForSnippet:sizeClass:");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 40), "snippetViewControllerForSnippet:", v14);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *MEMORY[0x24BE08BE0];
      objc_msgSend(*(id *)(a1 + 32), "groupIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "encodedClassName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __58__SiriUISnippetManager_transcriptItemForObject_sizeClass___block_invoke_2;
      v15[3] = &unk_24D7D9A50;
      v18 = *(_QWORD *)(a1 + 48);
      v12 = *(id *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 64);
      v13 = *(_QWORD *)(a1 + 40);
      v16 = v12;
      v17 = v13;
      objc_msgSend(v8, "enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:", v9, v10, v11, v15);

    }
  }
}

void __58__SiriUISnippetManager_transcriptItemForObject_sizeClass___block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "viewControllerForAceObject:", a1[4]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  v8 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v9 = v13;
  if (v8 == v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[5], CFSTR("SiriUISnippetManager.m"), 207, CFSTR("Plugin factory %@ must return an new allocated instance of SiriUIAceObjectViewController from viewControllerForAceObject:"), objc_opt_class());

    v9 = v13;
    v8 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
    if (!v8)
      goto LABEL_7;
  }
  else if (!v8)
  {
    goto LABEL_7;
  }
  v10 = objc_msgSend(v8, "conformsToProtocol:", &unk_254F12660);
  v9 = v13;
  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[5], CFSTR("SiriUISnippetManager.m"), 208, CFSTR("viewControllerForAceObject must conform to the SiriSharedUIViewControlling protocol, %@"), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

    v9 = v13;
  }
LABEL_7:
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    *a3 = 1;

}

uint64_t __58__SiriUISnippetManager_transcriptItemForObject_sizeClass___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (id)snippetViewControllerForSnippet:(id)a3
{
  id v5;
  AFClientPluginManager *pluginManager;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  SiriUISnippetManager *v15;
  uint64_t *v16;
  _QWORD *v17;
  _QWORD *v18;
  SEL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;

  v5 = a3;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__0;
  v28[4] = __Block_byref_object_dispose__0;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__0;
  v26[4] = __Block_byref_object_dispose__0;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  pluginManager = self->_pluginManager;
  objc_msgSend(v5, "groupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodedClassName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE08BE0];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__SiriUISnippetManager_snippetViewControllerForSnippet___block_invoke;
  v13[3] = &unk_24D7D9AA0;
  v16 = &v20;
  v10 = v5;
  v14 = v10;
  v15 = self;
  v17 = v26;
  v18 = v28;
  v19 = a2;
  -[AFClientPluginManager enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:](pluginManager, "enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:", v9, v7, v8, v13);

  v11 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

  return v11;
}

void __56__SiriUISnippetManager_snippetViewControllerForSnippet___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  id v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = a1[4];
    v7 = *(_QWORD *)(a1[7] + 8);
    obj = *(id *)(v7 + 40);
    objc_msgSend(v5, "viewControllerForSnippet:error:", v6, &obj);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), obj);
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_6;
    objc_msgSend(v5, "viewControllerForSnippet:", a1[4]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }

LABEL_6:
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "isSiriUISnippetPluginError"))
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "code") == 100;
  else
    v13 = 0;
  v14 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v14 == v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a1[9], a1[5], CFSTR("SiriUISnippetManager.m"), 255, CFSTR("Plugin factory %@ must return an new allocated instance of SiriUIBaseSnippetViewController from viewControllerForSnippet:"), objc_opt_class());

    if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
      goto LABEL_13;
  }
  else if (!v14)
  {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a1[9], a1[5], CFSTR("SiriUISnippetManager.m"), 256, CFSTR("viewControllerForSnippet must be a subclass of SiriUIBaseSnippetViewController, %@"), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  }
LABEL_13:
  if (!v13 && (v15 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) | v15))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), (id)v15);
    v20 = *(_QWORD *)(a1[7] + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = 0;

    *a3 = 1;
  }
  else
  {
    v16 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v17 = a1[4];
      *(_DWORD *)buf = 136315650;
      v26 = "-[SiriUISnippetManager snippetViewControllerForSnippet:]_block_invoke";
      v27 = 2112;
      v28 = v5;
      v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_21764F000, v16, OS_LOG_TYPE_DEFAULT, "%s Plugin:%@ does not support snippet:%@. Trying next plugin.", buf, 0x20u);
    }
    v18 = *(_QWORD *)(a1[7] + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = 0;

  }
}

- (id)filteredDisambiguationListItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AFClientPluginManager *pluginManager;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    v7 = v4;
    v22 = v7;
    pluginManager = self->_pluginManager;
    objc_msgSend(v6, "groupIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodedClassName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BE08BD8];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __56__SiriUISnippetManager_filteredDisambiguationListItems___block_invoke;
    v14[3] = &unk_24D7D9AC8;
    v16 = &v17;
    v15 = v7;
    -[AFClientPluginManager enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:](pluginManager, "enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:", v11, v9, v10, v14);

    v12 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

  }
  else
  {
    v12 = v4;
  }

  return v12;
}

void __56__SiriUISnippetManager_filteredDisambiguationListItems___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "filteredDisambiguationListItems:", *(_QWORD *)(a1 + 32));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    *a3 = 1;
  }

}

- (id)disambiguationItemForListItem:(id)a3 disambiguationKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  AFClientPluginManager *pluginManager;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(_QWORD *, void *, _BYTE *);
  void *v39;
  id v40;
  id v41;
  id v42;
  SiriUISnippetManager *v43;
  uint64_t *v44;
  SEL v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__0;
  v50 = __Block_byref_object_dispose__0;
  v51 = 0;
  if (!v9)
  {
    objc_msgSend(v7, "title");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27 == 0;

    if (!v28)
    {
      +[SiriUIDisambiguationItem disambiguationItem](SiriUIDisambiguationItem, "disambiguationItem");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v47[5];
      v47[5] = v29;

      v31 = (void *)v47[5];
      objc_msgSend(v7, "title");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setTitle:", v32);

      v25 = (id)v47[5];
      goto LABEL_14;
    }
  }
  objc_msgSend(v9, "groupIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "encodedClassName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (!v12)
    {
      pluginManager = self->_pluginManager;
      objc_msgSend(v9, "groupIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "encodedClassName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x24BE08BD8];
      v36 = MEMORY[0x24BDAC760];
      v37 = 3221225472;
      v38 = __72__SiriUISnippetManager_disambiguationItemForListItem_disambiguationKey___block_invoke;
      v39 = &unk_24D7D9AF0;
      v44 = &v46;
      v17 = v7;
      v40 = v17;
      v41 = v8;
      v45 = a2;
      v42 = v9;
      v43 = self;
      -[AFClientPluginManager enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:](pluginManager, "enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:", v16, v14, v15, &v36);

      objc_msgSend(v17, "label");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length"))
      {
        objc_msgSend(v17, "labelValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length") == 0;

        if (v20)
        {
LABEL_8:
          v25 = (id)v47[5];

          goto LABEL_14;
        }
        objc_msgSend((id)v47[5], "setHeadingText:", 0);
        v21 = (void *)v47[5];
        v22 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v17, "label");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "labelValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ %@"), v18, v23, v36, v37, v38, v39, v40, v41);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setSubtitle:", v24);

      }
      goto LABEL_8;
    }
  }
  v26 = (id)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v9, "groupIdentifier");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodedClassName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v53 = "-[SiriUISnippetManager disambiguationItemForListItem:disambiguationKey:]";
    v54 = 2112;
    v55 = v34;
    v56 = 2112;
    v57 = v35;
    v58 = 2112;
    v59 = v7;
    _os_log_error_impl(&dword_21764F000, v26, OS_LOG_TYPE_ERROR, "%s No disambiguation item can be found with empty groupIdentifier  (%@) or classname (%@). ListItem: %@", buf, 0x2Au);

  }
  v25 = 0;
LABEL_14:
  _Block_object_dispose(&v46, 8);

  return v25;
}

void __72__SiriUISnippetManager_disambiguationItemForListItem_disambiguationKey___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "disambiguationItemForListItem:disambiguationKey:", a1[4], a1[5]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[8] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(id *)(*(_QWORD *)(a1[8] + 8) + 40);
    if (v9)
    {
      if (v9 == v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a1[9], a1[7], CFSTR("SiriUISnippetManager.m"), 313, CFSTR("Plugin factory %@ must return an new allocated instance of id SiriUIDisambiguationItem from disambiguationItemForListItem:disambiguationKey:"), objc_opt_class());

      }
    }
    else
    {
      v11 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        __72__SiriUISnippetManager_disambiguationItemForListItem_disambiguationKey___block_invoke_cold_1(v11, (uint64_t)v5, (uint64_t)a1);
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
    *a3 = 1;

}

- (id)listItemToPickInAutodisambiguationForListItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  SiriUISnippetManager *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "firstObject");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 1;
      v13 = 0;
      v14 = &v13;
      v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__0;
      v17 = __Block_byref_object_dispose__0;
      objc_msgSend(v4, "firstObject");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __71__SiriUISnippetManager_listItemToPickInAutodisambiguationForListItems___block_invoke;
      v8[3] = &unk_24D7D9B18;
      v9 = v4;
      v10 = self;
      v11 = &v19;
      v12 = &v13;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v8);
      if (*((_BYTE *)v20 + 24))
        v6 = (void *)v14[5];
      else
        v6 = 0;
      v5 = v6;

      _Block_object_dispose(&v13, 8);
      _Block_object_dispose(&v19, 8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __71__SiriUISnippetManager_listItemToPickInAutodisambiguationForListItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_BYTE *)(v8 + 24))
    {
      v9 = objc_msgSend(*(id *)(a1 + 40), "_listItem:isEqualToListItem:", v13, v7);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    else
    {
      v9 = 0;
    }
    *(_BYTE *)(v8 + 24) = v9;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v10 = objc_msgSend(*(id *)(a1 + 40), "_listItem:isPreferredOverListItem:", v13, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = v13;
      if ((v10 & 1) == 0)
        v12 = *(void **)(v11 + 40);
      objc_storeStrong((id *)(v11 + 40), v12);
    }
    else
    {
      *a4 = 1;
    }

  }
}

- (id)speakableProviderForObject:(id)a3
{
  return (id)-[AFClientPluginManager speakableNamespaceProviderForAceObject:](self->_pluginManager, "speakableNamespaceProviderForAceObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginBundlesQueue, 0);
  objc_storeStrong((id *)&self->_snippetExtensionsQueue, 0);
  objc_storeStrong((id *)&self->_snippetExtensionsCache, 0);
  objc_storeStrong((id *)&self->_pluginManager, 0);
}

- (void)transcriptItemForObject:(uint64_t)a1 sizeClass:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = "-[SiriUISnippetManager transcriptItemForObject:sizeClass:]";
  v4 = 2114;
  v5 = 0;
  v6 = 2112;
  v7 = a1;
  _os_log_error_impl(&dword_21764F000, a2, OS_LOG_TYPE_ERROR, "%s unable to create view controller for ACE object. Falling back to error snippet view controller. Error=%{public}@; ACE object=%@",
    (uint8_t *)&v2,
    0x20u);
}

- (void)transcriptItemForObject:(uint64_t)a1 sizeClass:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[SiriUISnippetManager transcriptItemForObject:sizeClass:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_21764F000, a2, OS_LOG_TYPE_ERROR, "%s unable to find plugin capable of creating a view controller for ACE object. Falling back to the debug view controller. ACE object=%@", (uint8_t *)&v2, 0x16u);
}

void __72__SiriUISnippetManager_disambiguationItemForListItem_disambiguationKey___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v5 = (void *)objc_opt_class();
  v6 = *(void **)(a3 + 48);
  v7 = v5;
  objc_msgSend(v6, "groupIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 136315906;
  v11 = "-[SiriUISnippetManager disambiguationItemForListItem:disambiguationKey:]_block_invoke";
  v12 = 2114;
  v13 = v5;
  v14 = 2114;
  v15 = v8;
  v16 = 2114;
  v17 = (id)objc_opt_class();
  v9 = v17;
  _os_log_error_impl(&dword_21764F000, v4, OS_LOG_TYPE_ERROR, "%s Plugin factory %{public}@ returned a nil disambiguationItem for group id %{public}@ & item object class %{public}@", (uint8_t *)&v10, 0x2Au);

}

@end
