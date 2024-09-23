@implementation ISURLBagCache

- (ISURLBagCache)init
{
  ISURLBagCache *v2;
  uint64_t v3;
  SSLRUCache *cachedBags;
  id v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *dispatchQueue;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ISURLBagCache;
  v2 = -[ISURLBagCache init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BEB1E88]), "initWithMaxSize:", 5);
    cachedBags = v2->_cachedBags;
    v2->_cachedBags = (SSLRUCache *)v3;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.iTunesStore.ISURLBagCache.%p"), v2);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__storeFrontChangedNotification_, *MEMORY[0x24BEB21E8], 0);
    if ((SSIsDaemon() & 1) == 0)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__InvalidateBagsNotification, (CFStringRef)*MEMORY[0x24BEB2C70], 0, CFNotificationSuspensionBehaviorCoalesce);
    }

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB21E8], 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BEB2C70], 0);

  v5.receiver = self;
  v5.super_class = (Class)ISURLBagCache;
  -[ISURLBagCache dealloc](&v5, sel_dealloc);
}

+ (id)sharedCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__ISURLBagCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache_sOnce != -1)
    dispatch_once(&sharedCache_sOnce, block);
  return (id)sharedCache_sCache;
}

void __28__ISURLBagCache_sharedCache__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedCache_sCache;
  sharedCache_sCache = (uint64_t)v1;

}

+ (id)URLWithBagContext:(id)a3
{
  uint64_t v3;
  const __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v33;
  uint64_t v34;
  _BYTE v35[22];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a3, "bagType");
  v4 = (const __CFString *)*MEMORY[0x24BEB2C88];
  if (v3 == 1)
  {
    v5 = (__CFString *)CFPreferencesCopyAppValue(CFSTR("SandboxSessionURL"), v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CFSTR("https://sandbox.itunes.apple.com/bag.xml?ix=6");
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v5 = (__CFString *)CFPreferencesCopyAppValue(CFSTR("InitiateSessionURL"), v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_5:
    v6 = v5;
    goto LABEL_7;
  }
  v6 = CFSTR("https://init.itunes.apple.com/bag.xml?ix=6");
LABEL_7:
  v7 = (void *)-[__CFString mutableCopy](v6, "mutableCopy");

  objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "productVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("."));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("&%@=%@"), CFSTR("os"), v11);

  }
  v12 = objc_msgSend(MEMORY[0x24BEB1DE8], "deviceIsAudioAccessory");
  v13 = (const __CFString *)*MEMORY[0x24BDBD568];
  v14 = (const __CFString *)*MEMORY[0x24BDBD590];
  v15 = (const __CFString *)*MEMORY[0x24BDBD570];
  if (!v12)
    goto LABEL_35;
  v16 = (void *)CFPreferencesCopyValue(CFSTR("AppleLocaleSetup"), (CFStringRef)*MEMORY[0x24BDBD568], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v16)
  {
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = objc_msgSend(v18, "shouldLog");
    if (objc_msgSend(v18, "shouldLogToDisk"))
      v20 = v19 | 2;
    else
      v20 = v19;
    objc_msgSend(v18, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      v20 &= 2u;
    if (v20)
    {
      v22 = (void *)objc_opt_class();
      v23 = v22;
      SSHashIfNeeded();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v35 = 138543618;
      *(_QWORD *)&v35[4] = v22;
      *(_WORD *)&v35[12] = 2114;
      *(_QWORD *)&v35[14] = v24;
      LODWORD(v34) = 22;
      v33 = v35;
      v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_22:

        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v25, 4, v35, v34);
      v21 = objc_claimAutoreleasedReturnValue();
      free(v25);
      v33 = v21;
      SSFileLog();
    }

    goto LABEL_22;
  }
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = objc_msgSend(v18, "shouldLog");
  if (objc_msgSend(v18, "shouldLogToDisk"))
    v27 = v26 | 2;
  else
    v27 = v26;
  objc_msgSend(v18, "OSLogObject");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    v27 &= 2u;
  if (!v27)
    goto LABEL_33;
  *(_DWORD *)v35 = 138543362;
  *(_QWORD *)&v35[4] = objc_opt_class();
  v29 = *(id *)&v35[4];
  LODWORD(v34) = 12;
  v33 = v35;
  v30 = (void *)_os_log_send_and_compose_impl();

  if (v30)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v30, 4, v35, v34, *(_OWORD *)v35);
    v28 = objc_claimAutoreleasedReturnValue();
    free(v30);
    v33 = v28;
    SSFileLog();
LABEL_33:

  }
LABEL_35:
  v16 = (void *)CFPreferencesCopyValue(CFSTR("AppleLocale"), v13, v14, v15);
LABEL_36:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "appendFormat:", CFSTR("&%@=%@"), CFSTR("locale"), v16);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7, v33);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (void)addURLBag:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ISURLBagCache *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __27__ISURLBagCache_addURLBag___block_invoke;
  v7[3] = &unk_24C43C178;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __27__ISURLBagCache_addURLBag___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "URLBagContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cacheKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", *(_QWORD *)(a1 + 32), v3);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    objc_msgSend(v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      v6 &= 2u;
    if (v6)
    {
      *(_DWORD *)v11 = 138412546;
      *(_QWORD *)&v11[4] = objc_opt_class();
      *(_WORD *)&v11[12] = 2112;
      *(_QWORD *)&v11[14] = v3;
      v8 = *(id *)&v11[4];
      LODWORD(v10) = 22;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, v11, v10, *(_OWORD *)v11, *(_QWORD *)&v11[16]);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (void)invalidateAllURLBags
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__ISURLBagCache_invalidateAllURLBags__block_invoke;
  block[3] = &unk_24C43C128;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __37__ISURLBagCache_invalidateAllURLBags__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjectsAndKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __37__ISURLBagCache_invalidateAllURLBags__block_invoke_2;
  v3[3] = &unk_24C43CF98;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __37__ISURLBagCache_invalidateAllURLBags__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setInvalidationTime:", -1.79769313e308);
  else
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", 0, v6);

}

- (void)invalidateURLBagForContext:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[4];
  id v13;
  ISURLBagCache *v14;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__ISURLBagCache_invalidateURLBagForContext___block_invoke;
  block[3] = &unk_24C43C178;
  v7 = v4;
  v13 = v7;
  v14 = self;
  dispatch_async(dispatchQueue, block);
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __44__ISURLBagCache_invalidateURLBagForContext___block_invoke_2;
  v10[3] = &unk_24C43C178;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, v10);

}

void __44__ISURLBagCache_invalidateURLBagForContext___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cacheKey");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKey:", 0, v2);

}

void __44__ISURLBagCache_invalidateURLBagForContext___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_newRequestWithURLBagContext:", *(_QWORD *)(a1 + 40));
  if (+[ISURLOperation sharedCFURLCache](ISURLOperation, "sharedCFURLCache"))
  {
    objc_msgSend(objc_retainAutorelease(v1), "_CFURLRequest");
    CFURLCacheRemoveCachedResponseForRequest();
  }

}

- (id)URLBagForContext:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  ISURLBagCache *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__14;
  v17 = __Block_byref_object_dispose__14;
  v18 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ISURLBagCache_URLBagForContext___block_invoke;
  block[3] = &unk_24C43CFC0;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __34__ISURLBagCache_URLBagForContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "ignoresCaches") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cacheKey");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v6 || (objc_msgSend(v6, "isValid") & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "allowsExpiredBags") & 1) != 0)
      goto LABEL_17;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v9 &= 2u;
    if (v9)
    {
      LODWORD(v16) = 138412290;
      *(_QWORD *)((char *)&v16 + 4) = objc_opt_class();
      v11 = *(id *)((char *)&v16 + 4);
      LODWORD(v15) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_16:

        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = 0;

LABEL_17:
        return;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v16, v15, v16);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog();
    }

    goto LABEL_16;
  }
}

- (void)_storeFrontChangedNotification:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  LODWORD(v11) = 138412290;
  *(_QWORD *)((char *)&v11 + 4) = objc_opt_class();
  v8 = *(id *)((char *)&v11 + 4);
  LODWORD(v10) = 12;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v11, v10, v11);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog();
LABEL_11:

  }
  -[ISURLBagCache invalidateAllURLBags](self, "invalidateAllURLBags");
}

- (id)_newRequestWithURLBagContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "URLWithBagContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v4);
  objc_msgSend(v3, "allHTTPHeaders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "setAllHTTPHeaderFields:", v6);
  objc_msgSend(v3, "bagType");
  v7 = SSAccountScopeForURLBagType();
  objc_msgSend(v3, "userIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activeAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v13, "accountScope");

  }
  objc_msgSend(v3, "clientBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISStoreURLOperation _addiTunesStoreHeadersToRequest:withURLBag:accountIdentifier:appendAuthKitHeaders:appendStorefrontToURL:clientBundleIdentifier:](ISStoreURLOperation, "_addiTunesStoreHeadersToRequest:withURLBag:accountIdentifier:appendAuthKitHeaders:appendStorefrontToURL:clientBundleIdentifier:", v5, 0, v9, 1, 0, v14);

  objc_msgSend(MEMORY[0x24BEB2020], "sharedStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cookieHeadersForURL:userIdentifier:scope:", v4, v9, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __46__ISURLBagCache__newRequestWithURLBagContext___block_invoke;
  v23[3] = &unk_24C43CFE8;
  v17 = v5;
  v24 = v17;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v23);
  v18 = *MEMORY[0x24BEB2518];
  objc_msgSend(v17, "valueForHTTPHeaderField:", *MEMORY[0x24BEB2518]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    +[ISClient currentClient](ISClient, "currentClient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "userAgent");
    v21 = (id)objc_claimAutoreleasedReturnValue();

    if (v21 || (v21 = +[ISURLOperation copyUserAgent](ISURLOperation, "copyUserAgent")) != 0)
    {
      objc_msgSend(v17, "setValue:forHTTPHeaderField:", v21, v18);

    }
  }

  return v17;
}

uint64_t __46__ISURLBagCache__newRequestWithURLBagContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_cachedBags, 0);
}

@end
