@implementation ICQQuotaRequestManager

+ (id)sharedManager
{
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, &__block_literal_global_13);
  return (id)sharedManager_manager;
}

void __39__ICQQuotaRequestManager_sharedManager__block_invoke()
{
  ICQQuotaRequestManager *v0;
  void *v1;

  v0 = objc_alloc_init(ICQQuotaRequestManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

+ (id)noAccountError
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("No Primary Account"), *MEMORY[0x24BDD0FC8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ICQQuotaRequestManager)init
{
  ICQQuotaRequestManager *v2;
  NSOperationQueue *v3;
  NSOperationQueue *requestQueue;
  NSMutableDictionary *v5;
  NSMutableDictionary *appDetailsCache;
  dispatch_queue_t v7;
  OS_dispatch_queue *quota_info_queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICQQuotaRequestManager;
  v2 = -[ICQQuotaRequestManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    appDetailsCache = v2->_appDetailsCache;
    v2->_appDetailsCache = v5;

    v7 = dispatch_queue_create("com.apple.preferences.quota_info_queue", 0);
    quota_info_queue = v2->_quota_info_queue;
    v2->_quota_info_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)clearCachedQuotaInfo
{
  NSObject *quota_info_queue;
  _QWORD block[5];

  quota_info_queue = self->_quota_info_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ICQQuotaRequestManager_clearCachedQuotaInfo__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(quota_info_queue, block);
}

void __46__ICQQuotaRequestManager_clearCachedQuotaInfo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (void)noteQuotaInfoChanged
{
  id v2;

  -[ICQQuotaRequestManager clearCachedQuotaInfo](self, "clearCachedQuotaInfo");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("QuotaInformationChanged"), 0);

}

- (id)_sendSynchronousAARequest:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = objc_alloc(MEMORY[0x24BE04A18]);
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __52__ICQQuotaRequestManager__sendSynchronousAARequest___block_invoke;
  v15 = &unk_24E3F47F8;
  v17 = &v18;
  v7 = v5;
  v16 = v7;
  v8 = (void *)objc_msgSend(v6, "initWithRequest:handler:", v4, &v12);
  -[NSOperationQueue addOperation:](self->_requestQueue, "addOperation:", v8, v12, v13, v14, v15);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (void *)v19[5];
  if (!v9)
    __assert_rtn("-[ICQQuotaRequestManager _sendSynchronousAARequest:]", "ICQQuotaRequestManager.m", 77, "response");
  v10 = v9;

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __52__ICQQuotaRequestManager__sendSynchronousAARequest___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)quotaInfoDetailed:(BOOL)a3 error:(id *)a4
{
  NSObject *quota_info_queue;
  void *v6;
  id v7;
  _QWORD v9[7];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  quota_info_queue = self->_quota_info_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__ICQQuotaRequestManager_quotaInfoDetailed_error___block_invoke;
  v9[3] = &unk_24E3F4820;
  v10 = a3;
  v9[4] = self;
  v9[5] = &v11;
  v9[6] = &v17;
  dispatch_sync(quota_info_queue, v9);
  if (a4)
  {
    v6 = (void *)v12[5];
    if (v6)
      *a4 = objc_retainAutorelease(v6);
  }
  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __50__ICQQuotaRequestManager_quotaInfoDetailed_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  ICQQuotaInfoRequest *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (!v3 || *(_BYTE *)(a1 + 56) && !*(_BYTE *)(v2 + 32))
  {
    *(_QWORD *)(v2 + 24) = 0;

    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_primaryAppleAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[ICQQuotaInfoRequest initWithAccount:accountStore:detailed:]([ICQQuotaInfoRequest alloc], "initWithAccount:accountStore:detailed:", v5, v4, *(unsigned __int8 *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 32), "_sendSynchronousAARequest:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v7, "error");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

      }
      else
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v7);
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = *(_BYTE *)(a1 + 56);
      }

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "noAccountError");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(ICQQuotaInfoRequest **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;
    }

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);
}

- (void)getQuotaInfoDetailed:(BOOL)a3 handler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ICQQuotaRequestManager_getQuotaInfoDetailed_handler___block_invoke;
  block[3] = &unk_24E3F4870;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __55__ICQQuotaRequestManager_getQuotaInfoDetailed_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 48);
  v10 = 0;
  objc_msgSend(v2, "quotaInfoDetailed:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (*(_QWORD *)(a1 + 40))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __55__ICQQuotaRequestManager_getQuotaInfoDetailed_handler___block_invoke_2;
    v6[3] = &unk_24E3F4848;
    v9 = *(id *)(a1 + 40);
    v7 = v4;
    v8 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
}

uint64_t __55__ICQQuotaRequestManager_getQuotaInfoDetailed_handler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)clearCachedAppDetails
{
  NSMutableDictionary *obj;

  obj = self->_appDetailsCache;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](self->_appDetailsCache, "removeAllObjects");
  objc_sync_exit(obj);

}

- (id)appDetailsForBundleIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  ICQQuotaAppDetailsRequest *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableDictionary *appDetailsCache;
  void *v21;
  ICQQuotaAppDetailsRequest *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *v27;
  ICQQuotaAppDetailsResponse *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v27 = self->_appDetailsCache;
  objc_sync_enter(v27);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_appDetailsCache, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v8, "removeObject:", v12);
          objc_msgSend(v7, "addObject:", v13);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v9);
  }

  if (!objc_msgSend(v8, "count"))
    goto LABEL_26;
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "aa_primaryAppleAccount");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "noAccountError");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_26;
  }
  -[ICQQuotaRequestManager quotaInfoDetailed:error:](self, "quotaInfoDetailed:error:", 0, a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v14 = -[ICQQuotaAppDetailsRequest initWithAccount:accountStore:bundleIDs:quotaInfo:]([ICQQuotaAppDetailsRequest alloc], "initWithAccount:accountStore:bundleIDs:quotaInfo:", v25, v26, v8, v24);
    -[ICQQuotaRequestManager _sendSynchronousAARequest:](self, "_sendSynchronousAARequest:", v14);
    v23 = v14;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = (ICQQuotaAppDetailsResponse *)objc_claimAutoreleasedReturnValue();
    -[ICQQuotaAppDetailsResponse apps](v28, "apps");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          appDetailsCache = self->_appDetailsCache;
          objc_msgSend(v19, "bundleID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](appDetailsCache, "setObject:forKey:", v19, v21);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v16);
    }

  }
  else
  {
    v28 = 0;
  }

  if (!v28)
LABEL_26:
    v28 = objc_alloc_init(ICQQuotaAppDetailsResponse);
  -[ICQQuotaAppDetailsResponse addApps:](v28, "addApps:", v7);

  objc_sync_exit(v27);
  return v28;
}

- (void)getAppDetailsForBundleIDs:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__ICQQuotaRequestManager_getAppDetailsForBundleIDs_handler___block_invoke;
  block[3] = &unk_24E3F3FD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __60__ICQQuotaRequestManager_getAppDetailsForBundleIDs_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  objc_msgSend(v2, "appDetailsForBundleIDs:error:", v3, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__ICQQuotaRequestManager_getAppDetailsForBundleIDs_handler___block_invoke_2;
  v9[3] = &unk_24E3F4848;
  v6 = *(id *)(a1 + 48);
  v11 = v5;
  v12 = v6;
  v10 = v4;
  v7 = v5;
  v8 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __60__ICQQuotaRequestManager_getAppDetailsForBundleIDs_handler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDetailsCache, 0);
  objc_storeStrong((id *)&self->_quotaInfo, 0);
  objc_storeStrong((id *)&self->_quota_info_queue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

@end
