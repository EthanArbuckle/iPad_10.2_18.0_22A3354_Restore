@implementation SSApplicationManager

void __28__SSApplicationManager_init__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = objc_alloc(MEMORY[0x1E0D1D1D8]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__SSApplicationManager_init__block_invoke_2;
  v4[3] = &unk_1E6E42FD8;
  v5 = *(id *)(a1 + 32);
  v3 = (void *)objc_msgSend(v2, "initWithPolicyChangeHandler:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setMonitor:", v3);

  objc_msgSend(*(id *)(a1 + 32), "purgeCache");
}

- (void)setMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_34);
  return (id)sharedInstance_sApplicationManager;
}

void __38__SSApplicationManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sApplicationManager;
  sharedInstance_sApplicationManager = v0;

}

- (SSApplicationManager)init
{
  SSApplicationManager *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  NSObject *v7;
  _QWORD block[4];
  SSApplicationManager *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSApplicationManager;
  v2 = -[SSApplicationManager init](&v11, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SSApplicationManager setDefinitelyCorrectCache:](v2, "setDefinitelyCorrectCache:", v3);

    v4 = (void *)objc_opt_new();
    -[SSApplicationManager setPossiblyCorrectCache:](v2, "setPossiblyCorrectCache:", v4);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("screenTimeFetchingQueue", v5);
    -[SSApplicationManager setSerialQueue:](v2, "setSerialQueue:", v6);

    -[SSApplicationManager serialQueue](v2, "serialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__SSApplicationManager_init__block_invoke;
    block[3] = &unk_1E6E42FD8;
    v10 = v2;
    dispatch_async(v7, block);

  }
  return v2;
}

- (void)setSerialQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setPossiblyCorrectCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setDefinitelyCorrectCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (id)currentApplications
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (id)SBSCopyDisplayIdentifiers();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.downloadingicon-"), (_QWORD)v12))
        {
          objc_msgSend(v8, "substringFromIndex:", 26);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v9);

        }
        else
        {
          objc_msgSend(v2, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)purgeCache
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[SSApplicationManager possiblyCorrectCache](self, "possiblyCorrectCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[SSApplicationManager definitelyCorrectCache](self, "definitelyCorrectCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[SSApplicationManager currentApplications](self, "currentApplications");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v9, 1, 0);
        objc_msgSend(v10, "compatibilityObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "deviceManagementPolicy") != 0;

        -[SSApplicationManager possiblyCorrectCache](self, "possiblyCorrectCache");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v14, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  -[SSApplicationManager monitor](self, "monitor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __34__SSApplicationManager_purgeCache__block_invoke;
  v17[3] = &unk_1E6E451F0;
  v17[4] = self;
  objc_msgSend(v15, "requestPoliciesForBundleIdentifiers:completionHandler:", obj, v17);

}

- (NSCache)possiblyCorrectCache
{
  return (NSCache *)objc_getProperty(self, a2, 16, 1);
}

void __34__SSApplicationManager_purgeCache__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "definitelyCorrectCache");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v10, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (NSCache)definitelyCorrectCache
{
  return (NSCache *)objc_getProperty(self, a2, 8, 1);
}

- (DMFApplicationPolicyMonitor)monitor
{
  return (DMFApplicationPolicyMonitor *)objc_getProperty(self, a2, 32, 1);
}

uint64_t __28__SSApplicationManager_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "purgeCache");
}

- (BOOL)cachedScreenTimeValueForBundleIdentifier:(id)a3
{
  return -[SSApplicationManager bundleIdIsScreenTimeBlocked:completion:](self, "bundleIdIsScreenTimeBlocked:completion:", a3, 0);
}

- (BOOL)bundleIdIsScreenTimeBlocked:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  SSApplicationManager *v27;
  id v28;
  void (**v29)(_QWORD, _QWORD);
  _QWORD v30[4];
  id v31;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __63__SSApplicationManager_bundleIdIsScreenTimeBlocked_completion___block_invoke;
  v30[3] = &unk_1E6E45218;
  v9 = v7;
  v31 = v9;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1BCCB38DC](v30);
  if (objc_msgSend(v6, "length"))
  {
    -[SSApplicationManager definitelyCorrectCache](self, "definitelyCorrectCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_msgSend(v12, "BOOLValue");
      v10[2](v10, v13);
    }
    else
    {
      -[SSApplicationManager serialQueue](self, "serialQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      v23 = v8;
      v24 = 3221225472;
      v25 = __63__SSApplicationManager_bundleIdIsScreenTimeBlocked_completion___block_invoke_2;
      v26 = &unk_1E6E45240;
      v27 = self;
      v15 = v6;
      v28 = v15;
      v29 = v10;
      dispatch_async(v14, &v23);

      -[SSApplicationManager possiblyCorrectCache](self, "possiblyCorrectCache", v23, v24, v25, v26, v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        LOBYTE(v13) = objc_msgSend(v17, "BOOLValue");
      }
      else
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v15, 1, 0);
        objc_msgSend(v18, "compatibilityObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v19, "deviceManagementPolicy") != 0;

        -[SSApplicationManager possiblyCorrectCache](self, "possiblyCorrectCache");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v21, v15);

      }
    }

  }
  else
  {
    v10[2](v10, 0);
    LOBYTE(v13) = 0;
  }

  return v13;
}

uint64_t __63__SSApplicationManager_bundleIdIsScreenTimeBlocked_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __63__SSApplicationManager_bundleIdIsScreenTimeBlocked_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "definitelyCorrectCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(v3, "BOOLValue"));
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", *(_QWORD *)(a1 + 40), 1, 0);
    v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v5, "monitor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "requestPoliciesForBundleIdentifiers:withError:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue") != 0;

      objc_msgSend(*(id *)(a1 + 32), "definitelyCorrectCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, *(_QWORD *)(a1 + 40));

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      objc_msgSend(v5, "definitelyCorrectCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v14, *(_QWORD *)(a1 + 40));

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_possiblyCorrectCache, 0);
  objc_storeStrong((id *)&self->_definitelyCorrectCache, 0);
}

@end
