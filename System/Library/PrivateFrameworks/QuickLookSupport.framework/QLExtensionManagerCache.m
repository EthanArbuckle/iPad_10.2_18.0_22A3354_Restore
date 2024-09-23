@implementation QLExtensionManagerCache

void __123__QLExtensionManagerCache_extensionWithMatchingAttributes_allowExtensionsForParentTypes_extensionPath_firstPartyExtension___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v2);
    v2 = v3;
  }

}

- (id)extensionWithMatchingAttributes:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 extensionPath:(id)a5 firstPartyExtension:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v10;
  id v11;
  QLExtensionManagerCacheKey *v12;
  uint64_t v13;
  NSObject *queryCacheQueue;
  QLExtensionManagerCacheKey *v15;
  id v16;
  NSObject *accessMatchingExtensionsQueue;
  NSObject *v18;
  _QWORD v20[5];
  QLExtensionManagerCacheKey *v21;
  uint64_t *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t *v26;
  BOOL v27;
  BOOL v28;
  _QWORD block[5];
  QLExtensionManagerCacheKey *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v6 = a6;
  v8 = a4;
  v10 = a3;
  v11 = a5;
  if (objc_msgSend(v10, "count"))
  {
    v12 = -[QLExtensionManagerCacheKey initWithAttributes:allowParentTypes:wantsFirstPartyExtension:extensionPath:]([QLExtensionManagerCacheKey alloc], "initWithAttributes:allowParentTypes:wantsFirstPartyExtension:extensionPath:", v10, v8, v6, v11);
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__0;
    v36 = __Block_byref_object_dispose__0;
    v37 = 0;
    v13 = MEMORY[0x24BDAC760];
    queryCacheQueue = self->_queryCacheQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __123__QLExtensionManagerCache_extensionWithMatchingAttributes_allowExtensionsForParentTypes_extensionPath_firstPartyExtension___block_invoke;
    block[3] = &unk_24C71AF60;
    block[4] = self;
    v15 = v12;
    v30 = v15;
    v31 = &v32;
    dispatch_sync(queryCacheQueue, block);
    if (v33[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = 0;
      else
        v16 = (id)v33[5];
    }
    else
    {
      -[QLExtensionManagerCache _synchronouslyWaitForExtensionListIfNeeded](self, "_synchronouslyWaitForExtensionListIfNeeded");
      accessMatchingExtensionsQueue = self->_accessMatchingExtensionsQueue;
      v23[0] = v13;
      v23[1] = 3221225472;
      v23[2] = __123__QLExtensionManagerCache_extensionWithMatchingAttributes_allowExtensionsForParentTypes_extensionPath_firstPartyExtension___block_invoke_2;
      v23[3] = &unk_24C71AF88;
      v23[4] = self;
      v27 = v6;
      v24 = v10;
      v28 = v8;
      v25 = v11;
      v26 = &v32;
      dispatch_sync(accessMatchingExtensionsQueue, v23);
      v18 = self->_queryCacheQueue;
      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __123__QLExtensionManagerCache_extensionWithMatchingAttributes_allowExtensionsForParentTypes_extensionPath_firstPartyExtension___block_invoke_3;
      v20[3] = &unk_24C71AFB0;
      v22 = &v32;
      v20[4] = self;
      v21 = v15;
      dispatch_sync(v18, v20);
      v16 = (id)v33[5];

    }
    _Block_object_dispose(&v32, 8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (QLExtensionManagerCache)initWithMatchingAttributes:(id)a3
{
  id v4;
  QLExtensionManagerCache *v5;
  uint64_t v6;
  NSDictionary *matchingAttributes;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *accessMatchingExtensionsQueue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *waitForExtensionListQueue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queryCacheQueue;
  uint64_t v17;
  NSMutableDictionary *queryCache;
  QLExtensionManagerCache *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)QLExtensionManagerCache;
  v5 = -[QLExtensionManagerCache init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    matchingAttributes = v5->_matchingAttributes;
    v5->_matchingAttributes = (NSDictionary *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.quicklook.extensionmanager.accessextensions", v8);
    accessMatchingExtensionsQueue = v5->_accessMatchingExtensionsQueue;
    v5->_accessMatchingExtensionsQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.quicklook.extensionmanager.waitforextensions", v11);
    waitForExtensionListQueue = v5->_waitForExtensionListQueue;
    v5->_waitForExtensionListQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.quicklook.extensionmanager.querycache", v14);
    queryCacheQueue = v5->_queryCacheQueue;
    v5->_queryCacheQueue = (OS_dispatch_queue *)v15;

    v17 = objc_opt_new();
    queryCache = v5->_queryCache;
    v5->_queryCache = (NSMutableDictionary *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)beginMatchingExtensions
{
  void *v3;
  NSDictionary *matchingAttributes;
  void *v5;
  id matchingContext;
  _QWORD v7[4];
  id v8;
  id location;

  self->_isMatchingExtensions = 1;
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BDD1550];
  matchingAttributes = self->_matchingAttributes;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__QLExtensionManagerCache_beginMatchingExtensions__block_invoke;
  v7[3] = &unk_24C71AEE8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "beginMatchingExtensionsWithAttributes:completion:", matchingAttributes, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  matchingContext = self->_matchingContext;
  self->_matchingContext = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__QLExtensionManagerCache_beginMatchingExtensions__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didReceiveNewMatchingExtensionList:", v3);

}

- (void)endMatchingExtensions
{
  NSObject *accessMatchingExtensionsQueue;
  _QWORD block[5];

  accessMatchingExtensionsQueue = self->_accessMatchingExtensionsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__QLExtensionManagerCache_endMatchingExtensions__block_invoke;
  block[3] = &unk_24C71AF10;
  block[4] = self;
  dispatch_sync(accessMatchingExtensionsQueue, block);
}

void __48__QLExtensionManagerCache_endMatchingExtensions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "matchingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD1550];
    objc_msgSend(*(id *)(a1 + 32), "matchingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endMatchingExtensions:", v4);

    objc_msgSend(*(id *)(a1 + 32), "setMatchingContext:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setMatchingExtensions:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setIsMatchingExtensions:", 0);
  }
}

- (void)_didReceiveNewMatchingExtensionList:(id)a3
{
  id v4;
  NSObject *accessMatchingExtensionsQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessMatchingExtensionsQueue = self->_accessMatchingExtensionsQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__QLExtensionManagerCache__didReceiveNewMatchingExtensionList___block_invoke;
  v7[3] = &unk_24C71AF38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessMatchingExtensionsQueue, v7);

}

void __63__QLExtensionManagerCache__didReceiveNewMatchingExtensionList___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  QLExtension *v17;
  QLExtension *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  NSObject *v27;
  _QWORD block[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "matchingExtensions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setMatchingExtensions:", v3);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v9, "_plugIn");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "userElection") & 0xFE;

        if (!v11)
        {
          objc_msgSend(v9, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "extension");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", v9);

          if (v15)
          {
            objc_msgSend(v9, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "removeObjectForKey:", v16);

            v17 = v13;
          }
          else
          {
            v17 = -[QLExtension initWithExtension:]([QLExtension alloc], "initWithExtension:", v9);
          }
          v18 = v17;
          objc_msgSend(*(id *)(a1 + 32), "matchingExtensions");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v6);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v2, "objectEnumerator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "invalidateAndCancelExtensionRequest");
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v23);
  }

  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(NSObject **)(v26 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__QLExtensionManagerCache__didReceiveNewMatchingExtensionList___block_invoke_2;
  block[3] = &unk_24C71AF10;
  block[4] = v26;
  dispatch_sync(v27, block);

}

uint64_t __63__QLExtensionManagerCache__didReceiveNewMatchingExtensionList___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
}

- (BOOL)hasExtensionWithMatchingAttributes:(id)a3
{
  void *v3;
  BOOL v4;

  -[QLExtensionManagerCache extensionWithMatchingAttributes:allowExtensionsForParentTypes:extensionPath:](self, "extensionWithMatchingAttributes:allowExtensionsForParentTypes:extensionPath:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

void __123__QLExtensionManagerCache_extensionWithMatchingAttributes_allowExtensionsForParentTypes_extensionPath_firstPartyExtension___block_invoke_2(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id obj;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v53 = (void *)objc_opt_new();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "matchingExtensions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
  if (v56)
  {
    v55 = *(_QWORD *)v71;
    v60 = *MEMORY[0x24BDD0C00];
    v59 = a1;
    while (2)
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v71 != v55)
          objc_enumerationMutation(obj);
        v3 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "matchingExtensions");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (!*(_BYTE *)(a1 + 64)
          || (objc_msgSend(v5, "extension"),
              v6 = (void *)objc_claimAutoreleasedReturnValue(),
              v7 = objc_msgSend(v6, "QL_isAppleExtension"),
              v6,
              v7))
        {
          v57 = i;
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          objc_msgSend(*(id *)(a1 + 40), "allKeys");
          v58 = (id)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
          if (v8)
          {
            v9 = v8;
            v61 = *(_QWORD *)v67;
            while (2)
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v67 != v61)
                  objc_enumerationMutation(v58);
                v11 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
                objc_msgSend(v5, "extension");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "attributes");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "objectForKeyedSubscript:", v11);
                v14 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v11);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v11, "isEqualToString:", v60))
                {
                  objc_msgSend(v5, "extension");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "_plugIn");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "containingUrl");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "path");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v15, "isEqualToString:", v19);

                  a1 = v59;
                  if ((v20 & 1) == 0)
                    goto LABEL_49;
                }
                else if (objc_msgSend(v11, "isEqualToString:", CFSTR("QLSupportedContentTypes")))
                {
                  v21 = *(void **)(a1 + 32);
                  objc_msgSend(v5, "extension");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v21) = objc_msgSend(v21, "_supportedContentTypesFromExtension:matches:allowMatchingWithParentTypes:", v22, v15, *(unsigned __int8 *)(a1 + 65));

                  if ((v21 & 1) == 0)
                    goto LABEL_49;
                }
                else if (objc_msgSend(v11, "isEqualToString:", CFSTR("kQLExtensionFrameworkPath")))
                {
                  objc_msgSend(v5, "extension");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "_plugIn");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "url");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "path");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v26, "containsString:", v15);

                  a1 = v59;
                  if ((v27 & 1) == 0)
                    goto LABEL_49;
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    if ((objc_msgSend(v15, "isEqualToString:", v14) & 1) == 0)
                      goto LABEL_49;
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v28 = objc_msgSend(v15, "integerValue");
                      if (v28 != objc_msgSend(v14, "integerValue"))
                        goto LABEL_49;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                        goto LABEL_49;
                      if (objc_msgSend(v11, "isEqualToString:", CFSTR("QLSupportedContentTypes")))
                      {
                        v64 = 0u;
                        v65 = 0u;
                        v62 = 0u;
                        v63 = 0u;
                        v29 = v14;
                        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
                        if (v30)
                        {
                          v31 = v30;
                          v32 = *(_QWORD *)v63;
                          while (2)
                          {
                            for (k = 0; k != v31; ++k)
                            {
                              if (*(_QWORD *)v63 != v32)
                                objc_enumerationMutation(v29);
                              v34 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * k);
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0
                                && !objc_msgSend(v15, "caseInsensitiveCompare:", v34))
                              {

                                a1 = v59;
                                goto LABEL_45;
                              }
                            }
                            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
                            if (v31)
                              continue;
                            break;
                          }
                        }

                        a1 = v59;
LABEL_49:

                        v35 = 1;
                        goto LABEL_50;
                      }
                      if (!objc_msgSend(v14, "containsObject:", v15))
                        goto LABEL_49;
                    }
                  }
                }
LABEL_45:

              }
              v9 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
              if (v9)
                continue;
              break;
            }
          }
          v35 = 0;
LABEL_50:

          v36 = *(void **)(a1 + 48);
          if (v36)
          {
            objc_msgSend(v5, "extension");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "_extensionBundle");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "bundlePath");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v36, "isEqualToString:", v39);

          }
          else
          {
            v40 = 1;
          }
          v41 = v35 | v40 ^ 1;
          i = v57;
          if ((v41 & 1) == 0)
          {
            objc_msgSend(v53, "addObject:", v5);
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("QLSupportedContentTypes"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v42)
            {

              goto LABEL_59;
            }
          }
        }

      }
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      if (v56)
        continue;
      break;
    }
  }
LABEL_59:

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("QLSupportedContentTypes"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v44 = (void *)objc_opt_class();
    v45 = *(unsigned __int8 *)(a1 + 65);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("QLSupportedContentTypes"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v53;
    objc_msgSend(v44, "bestMatchingExtensionsFromSupportingExtensions:includingExtensionsWithSupportingParentTypes:byContentType:", v53, v45, v46);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v50 = *(void **)(v49 + 40);
    *(_QWORD *)(v49 + 40) = v48;

  }
  else
  {
    v47 = v53;
    objc_msgSend(v53, "firstObject");
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v46 = *(void **)(v52 + 40);
    *(_QWORD *)(v52 + 40) = v51;
  }

}

void __123__QLExtensionManagerCache_extensionWithMatchingAttributes_allowExtensionsForParentTypes_extensionPath_firstPartyExtension___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1[4] + 72), "setObject:forKeyedSubscript:", v2, a1[5]);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 72), "setObject:forKeyedSubscript:", v3, a1[5]);

  }
}

- (id)extensionWithMatchingAttributes:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 extensionPath:(id)a5
{
  return -[QLExtensionManagerCache extensionWithMatchingAttributes:allowExtensionsForParentTypes:extensionPath:firstPartyExtension:](self, "extensionWithMatchingAttributes:allowExtensionsForParentTypes:extensionPath:firstPartyExtension:", a3, a4, a5, 0);
}

+ (id)bestMatchingExtensionsFromSupportingExtensions:(id)a3 includingExtensionsWithSupportingParentTypes:(BOOL)a4 byContentType:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  char v36;
  void *v37;
  int v38;
  NSObject *v39;
  id v41;
  id v42;
  id obj;
  int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  const __CFString *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v42 = a5;
  objc_msgSend(v42, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[QLUTIManager typesForWhichExternalGeneratorsArePreferred](QLUTIManager, "typesForWhichExternalGeneratorsArePreferred");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v8);

  if (a4)
  {
    v48 = (id)objc_opt_new();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v11 = v7;
    v47 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
    if (!v47)
    {

LABEL_42:
      v39 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        v39 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v62 = CFSTR("extension");
        v63 = 2112;
        v64 = v42;
        v65 = 2048;
        v66 = v48;
        _os_log_impl(&dword_20D4C7000, v39, OS_LOG_TYPE_INFO, "Retrieving %@ for type %@ from dictionary %p #UTI", buf, 0x20u);
      }
      +[QLUTIManager valueInTypeKeyedDictionary:forType:](QLUTIManager, "valueInTypeKeyedDictionary:forType:", v48, v42);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    }
    obj = v11;
    v41 = v7;
    v12 = 0;
    v46 = *(_QWORD *)v54;
    v44 = v10;
    v45 = v10 ^ 1;
    while (2)
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v54 != v46)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v14, "extension", v41);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        objc_msgSend(v15, "attributes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("QLSupportedContentTypes"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v50;
          while (2)
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v50 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "lowercaseString");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v22, "isEqualToString:", v8) & 1) != 0)
              {
                v24 = v14;

                v12 = v24;
                goto LABEL_22;
              }
              if (!v12)
              {
                objc_msgSend(v48, "objectForKeyedSubscript:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23)
                {

                }
                else if (objc_msgSend(v15, "QL_isAppleExtension"))
                {
                  objc_msgSend(v48, "setObject:forKeyedSubscript:", v14, v22);
                }
              }

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
            if (v19)
              continue;
            break;
          }
LABEL_22:
          LODWORD(v10) = v44;
        }

        objc_msgSend(v12, "extension");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "QL_isAppleExtension");

        if (((v26 ^ 1 | v10) & 1) == 0)
        {

          goto LABEL_41;
        }
        objc_msgSend(v12, "extension");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "QL_isAppleExtension");

        if ((v28 | v45) != 1)
          goto LABEL_41;
      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
      if (v47)
        continue;
      break;
    }
LABEL_41:

    v7 = v41;
    if (!v12)
      goto LABEL_42;
  }
  else
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v48 = v7;
    v29 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    if (v29)
    {
      v30 = v29;
      v12 = 0;
      v31 = *(_QWORD *)v58;
LABEL_30:
      v32 = 0;
      v33 = v12;
      while (1)
      {
        if (*(_QWORD *)v58 != v31)
          objc_enumerationMutation(v48);
        v12 = *(id *)(*((_QWORD *)&v57 + 1) + 8 * v32);

        objc_msgSend(v12, "extension");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v10;
        v36 = v10 & ~objc_msgSend(v34, "QL_isAppleExtension");

        if ((v36 & 1) != 0)
          break;
        objc_msgSend(v12, "extension");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "QL_isAppleExtension");

        if ((v38 ^ 1 | v35) != 1)
          break;
        v10 = v35;
        ++v32;
        v33 = v12;
        if (v30 == v32)
        {
          v30 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
          if (v30)
            goto LABEL_30;
          break;
        }
      }
    }
    else
    {
      v12 = 0;
    }
  }
LABEL_47:

  return v12;
}

- (BOOL)_supportedContentTypesFromExtension:(id)a3 matches:(id)a4 allowMatchingWithParentTypes:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v5 = a5;
  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "QL_isAppleExtension") && v5)
  {
    objc_msgSend(v7, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("QLSupportedContentTypes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v13)
    {
      v14 = v13;
      v33 = v7;
      v15 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            if (objc_msgSend(v9, "conformsToType:", v18))
              goto LABEL_31;
          }
          else
          {
            _log();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v33, "identifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v44 = v17;
              v45 = 2112;
              v46 = v31;
              _os_log_error_impl(&dword_20D4C7000, v19, OS_LOG_TYPE_ERROR, "Invalid content type identifier %@ specified in extension %@", buf, 0x16u);

            }
            if (!objc_msgSend(v8, "compare:options:", v17, 1))
            {
LABEL_31:

              v20 = 1;
              goto LABEL_32;
            }
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v14)
          continue;
        break;
      }
      v20 = 0;
LABEL_32:
      v22 = v12;
LABEL_33:
      v7 = v33;
    }
    else
    {
      v20 = 0;
      v22 = v12;
    }

  }
  else
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v7, "attributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("QLSupportedContentTypes"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v23)
    {
      v24 = v23;
      v33 = v7;
      v25 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v28;
          if (v28)
          {
            if ((objc_msgSend(v28, "isEqual:", v9) & 1) != 0)
            {
              v20 = 1;
              goto LABEL_33;
            }
          }
          else
          {
            _log();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v33, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v44 = v27;
              v45 = 2112;
              v46 = v32;
              _os_log_error_impl(&dword_20D4C7000, v29, OS_LOG_TYPE_ERROR, "Invalid content type identifier %@ specified in extension %@", buf, 0x16u);

            }
            v20 = 1;
            if (!objc_msgSend(v27, "compare:options:", v8, 1))
              goto LABEL_33;
          }

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v24);
      v20 = 0;
      v7 = v33;
    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (void)_synchronouslyWaitForExtensionListIfNeeded
{
  NSDictionary *matchingAttributes;
  void *v4;
  uint64_t v5;

  if (!self->_matchingExtensions && self->_isMatchingExtensions)
  {
    matchingAttributes = self->_matchingAttributes;
    v5 = 0;
    objc_msgSend(MEMORY[0x24BDD1550], "extensionsWithMatchingAttributes:error:", matchingAttributes, &v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLExtensionManagerCache _didReceiveNewMatchingExtensionList:](self, "_didReceiveNewMatchingExtensionList:", v4);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[QLExtensionManagerCache endMatchingExtensions](self, "endMatchingExtensions");
  v3.receiver = self;
  v3.super_class = (Class)QLExtensionManagerCache;
  -[QLExtensionManagerCache dealloc](&v3, sel_dealloc);
}

- (NSDictionary)matchingAttributes
{
  return self->_matchingAttributes;
}

- (void)setMatchingAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_matchingAttributes, a3);
}

- (id)matchingContext
{
  return self->_matchingContext;
}

- (void)setMatchingContext:(id)a3
{
  objc_storeStrong(&self->_matchingContext, a3);
}

- (NSMutableDictionary)matchingExtensions
{
  return self->_matchingExtensions;
}

- (void)setMatchingExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_matchingExtensions, a3);
}

- (NSMapTable)qlExtensions
{
  return self->_qlExtensions;
}

- (void)setQlExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_qlExtensions, a3);
}

- (NSMutableDictionary)queryCache
{
  return self->_queryCache;
}

- (void)setQueryCache:(id)a3
{
  objc_storeStrong((id *)&self->_queryCache, a3);
}

- (BOOL)isMatchingExtensions
{
  return self->_isMatchingExtensions;
}

- (void)setIsMatchingExtensions:(BOOL)a3
{
  self->_isMatchingExtensions = a3;
}

- (OS_dispatch_semaphore)waitForExtensionsSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWaitForExtensionsSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForExtensionsSemaphore, 0);
  objc_storeStrong((id *)&self->_queryCache, 0);
  objc_storeStrong((id *)&self->_qlExtensions, 0);
  objc_storeStrong((id *)&self->_matchingExtensions, 0);
  objc_storeStrong(&self->_matchingContext, 0);
  objc_storeStrong((id *)&self->_matchingAttributes, 0);
  objc_storeStrong((id *)&self->_queryCacheQueue, 0);
  objc_storeStrong((id *)&self->_waitForExtensionListQueue, 0);
  objc_storeStrong((id *)&self->_accessMatchingExtensionsQueue, 0);
}

@end
