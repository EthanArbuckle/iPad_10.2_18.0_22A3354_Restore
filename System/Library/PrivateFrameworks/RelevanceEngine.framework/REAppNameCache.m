@implementation REAppNameCache

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REAppNameCache;
  v2 = -[RESingleton _init](&v8, sel__init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[1];
    v2[1] = v3;

    v5 = objc_opt_new();
    v6 = (void *)v2[2];
    v2[2] = v5;

  }
  return v2;
}

- (id)localizedNameForApplicationWithIdentifier:(id)a3
{
  id v4;
  uint64_t IsRemote;
  _REAppKey *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v16;
  _QWORD v17[5];
  dispatch_semaphore_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE buf[24];
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  IsRemote = REApplicationIsRemote(v4);
  v6 = -[_REAppKey initWithIdentifier:remote:]([_REAppKey alloc], "initWithIdentifier:remote:", v4, IsRemote);
  -[NSLock lock](self->_lock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_nameCache, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_lock, "unlock");
  if (!v7)
  {
    if ((_DWORD)IsRemote)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2050000000;
      v8 = (void *)getCSLPRFDefaultAppDataProviderClass_softClass_0;
      v22 = getCSLPRFDefaultAppDataProviderClass_softClass_0;
      v9 = MEMORY[0x24BDAC760];
      if (!getCSLPRFDefaultAppDataProviderClass_softClass_0)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getCSLPRFDefaultAppDataProviderClass_block_invoke_0;
        v24 = &unk_24CF8AC38;
        v25 = &v19;
        __getCSLPRFDefaultAppDataProviderClass_block_invoke_0((uint64_t)buf);
        v8 = (void *)v20[3];
      }
      v10 = objc_retainAutorelease(v8);
      _Block_object_dispose(&v19, 8);
      v11 = objc_alloc_init(v10);
      dispatch_get_global_queue(33, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        v24 = v12;
        _os_log_impl(&dword_2132F7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, ">>>> %@ is loading apps using %@, completionQueue %@", buf, 0x20u);
      }
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __60__REAppNameCache_localizedNameForApplicationWithIdentifier___block_invoke;
      v17[3] = &unk_24CF8EC78;
      v17[4] = self;
      v18 = dispatch_semaphore_create(0);
      v13 = v18;
      objc_msgSend(v11, "loadAppsWithCompletion:completionQueue:", v17, v12);
      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      -[NSLock lock](self->_lock, "lock");
      -[NSMutableDictionary objectForKeyedSubscript:](self->_nameCache, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSLock unlock](self->_lock, "unlock");

    }
    else
    {
      v16 = 0;
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v16);
      v12 = v16;
      objc_msgSend(v11, "localizedName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSLock lock](self->_lock, "lock");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nameCache, "setObject:forKeyedSubscript:", v7, v6);
      -[NSLock unlock](self->_lock, "unlock");
    }

  }
  v14 = v7;

  return v14;
}

void __60__REAppNameCache_localizedNameForApplicationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  _REAppKey *v12;
  void *v13;
  _REAppKey *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v23 = v4;
    v24 = 1024;
    v25 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_2132F7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, ">>>> %@ loaded %d apps, processing", buf, 0x12u);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "allValues", v3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "name");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
          v11 = (__CFString *)v10;
        else
          v11 = &stru_24CF92178;
        v12 = [_REAppKey alloc];
        objc_msgSend(v9, "bundleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[_REAppKey initWithIdentifier:remote:](v12, "initWithIdentifier:remote:", v13, 1);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lock");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v11, v14);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unlock");

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_nameCache, 0);
}

@end
