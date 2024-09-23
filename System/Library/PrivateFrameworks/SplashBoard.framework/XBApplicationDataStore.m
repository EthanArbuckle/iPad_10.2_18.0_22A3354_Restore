@implementation XBApplicationDataStore

- (void)endAccessBlockForBundleIdentifier:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__XBApplicationDataStore_endAccessBlockForBundleIdentifier___block_invoke;
  block[3] = &unk_24D7F4660;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_sync(queue, block);

}

- (void)beginAccessBlockForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__XBApplicationDataStore_beginAccessBlockForBundleIdentifier___block_invoke;
  block[3] = &unk_24D7F45F0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)_loadCompatibilityInfoForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[XBApplicationDataStore _storeForBundleIdentifier:](self, "_storeForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArchivedObjectForKey:ofType:", XBApplicationLaunchCompatibilityInfoPersistenceKey, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_storeForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__XBApplicationDataStore__storeForBundleIdentifier___block_invoke;
  block[3] = &unk_24D7F4638;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  return (id)sharedInstance___sharedInstance;
}

void __62__XBApplicationDataStore_beginAccessBlockForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD14E0]), "initWithObjects:count:", a1 + 40, 1);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

  }
}

- (void)persistManifestData:(id)a3 forBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a3;
  v8 = a4;
  v11 = v7;
  if (v11 && (NSClassFromString(CFSTR("NSData")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDataClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[XBApplicationDataStore persistManifestData:forBundleIdentifier:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    -[XBApplicationDataStore _storeForBundleIdentifier:](self, "_storeForBundleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("XBApplicationSnapshotManifest"));

  }
}

void __60__XBApplicationDataStore_endAccessBlockForBundleIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if ((objc_msgSend(*(id *)(a1[4] + 16), "containsObject:", a1[5]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], "-[XBApplicationDataStore endAccessBlockForBundleIdentifier:]_block_invoke", a1[5], *(_QWORD *)(a1[4] + 16));

  }
  objc_msgSend(*(id *)(a1[4] + 16), "removeObject:", a1[5]);
  if ((objc_msgSend(*(id *)(a1[4] + 16), "containsObject:", a1[5]) & 1) == 0)
  {
    if (!objc_msgSend(*(id *)(a1[4] + 16), "count"))
    {
      v2 = a1[4];
      v3 = *(void **)(v2 + 16);
      *(_QWORD *)(v2 + 16) = 0;

    }
    v4 = *(void **)(a1[4] + 24);
    if (v4)
    {
      objc_msgSend(v4, "removeObjectForKey:", a1[5]);
      if (!objc_msgSend(*(id *)(a1[4] + 24), "count"))
      {
        v5 = a1[4];
        v6 = *(void **)(v5 + 24);
        *(_QWORD *)(v5 + 24) = 0;

      }
    }
  }
}

void __52__XBApplicationDataStore__storeForBundleIdentifier___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = a1 + 5;
  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE383E0], "storeForApplication:", *v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v4;
    if (v4)
    {
      v5 = v4;
      if (objc_msgSend(*(id *)(a1[4] + 16), "containsObject:", a1[5]))
      {
        v6 = *(void **)(a1[4] + 24);
        if (v6)
        {
          objc_msgSend(v6, "setObject:forKey:", v5, *v2);
        }
        else
        {
          v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjects:forKeys:count:", &v10, v2, 1);
          v8 = a1[4];
          v9 = *(void **)(v8 + 24);
          *(_QWORD *)(v8 + 24) = v7;

          v5 = v10;
        }
      }
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v5);

    }
  }

}

void __40__XBApplicationDataStore_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[XBApplicationDataStore _init]([XBApplicationDataStore alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (XBApplicationDataStore)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationDataStore.m"), 39, CFSTR("init is not allowed"));

  return (XBApplicationDataStore *)-[XBApplicationDataStore _init](self, "_init");
}

- (id)_init
{
  XBApplicationDataStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)XBApplicationDataStore;
  v2 = -[XBApplicationDataStore init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.splashboard.application-data-store", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)_persistCompatibilityInfo:(id)a3 forBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a3;
  v8 = a4;
  v11 = v7;
  if (v11
    && (NSClassFromString(CFSTR("XBApplicationLaunchCompatibilityInfo")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:XBApplicationLaunchCompatibilityInfoClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[XBApplicationDataStore _persistCompatibilityInfo:forBundleIdentifier:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    -[XBApplicationDataStore _storeForBundleIdentifier:](self, "_storeForBundleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setArchivedObject:forKey:", v11, XBApplicationLaunchCompatibilityInfoPersistenceKey);

  }
}

- (void)_clearCompatibilityInfoForBundleIdentifier:(id)a3
{
  id v3;

  -[XBApplicationDataStore _storeForBundleIdentifier:](self, "_storeForBundleIdentifier:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", XBApplicationLaunchCompatibilityInfoPersistenceKey);

}

- (BOOL)_bundleIdentifierHasDeniedLaunchInterface:(id)a3
{
  void *v3;
  char v4;

  -[XBApplicationDataStore _loadCompatibilityInfoForBundleIdentifier:](self, "_loadCompatibilityInfoForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasKnownBadLaunchImage");

  return v4;
}

- (int64_t)_bundleIdentifierDeniedLaunchInterfaceCount:(id)a3
{
  void *v3;
  int64_t v4;

  -[XBApplicationDataStore _loadCompatibilityInfoForBundleIdentifier:](self, "_loadCompatibilityInfoForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "badLaunchImageCandidateCount");

  return v4;
}

- (void)_addBundleIdentifierToLaunchInterfaceDenyList:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[XBApplicationDataStore _loadCompatibilityInfoForBundleIdentifier:](self, "_loadCompatibilityInfoForBundleIdentifier:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasKnownBadLaunchImage:", 1);
  -[XBApplicationDataStore _persistCompatibilityInfo:forBundleIdentifier:](self, "_persistCompatibilityInfo:forBundleIdentifier:", v5, v4);

}

- (void)_removeBundleIdentifierFromLaunchInterfaceDenyList:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[XBApplicationDataStore _loadCompatibilityInfoForBundleIdentifier:](self, "_loadCompatibilityInfoForBundleIdentifier:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasKnownBadLaunchImage"))
  {
    objc_msgSend(v4, "setHasKnownBadLaunchImage:", 0);
    objc_msgSend(v4, "setBadLaunchImageCandidateCount:", 0);
    -[XBApplicationDataStore _persistCompatibilityInfo:forBundleIdentifier:](self, "_persistCompatibilityInfo:forBundleIdentifier:", v4, v5);
  }

}

- (void)clearManifestDataForBundleIdentifier:(id)a3
{
  id v3;

  -[XBApplicationDataStore _storeForBundleIdentifier:](self, "_storeForBundleIdentifier:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("XBApplicationSnapshotManifest"));

}

- (id)loadManifestDataForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[XBApplicationDataStore _storeForBundleIdentifier:](self, "_storeForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeObjectForKey:ofType:", CFSTR("XBApplicationSnapshotManifest"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)synchronizeForBundleIdentifier:(id)a3 withCompletion:(id)a4
{
  objc_msgSend(MEMORY[0x24BE383E0], "synchronizeWithCompletion:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStoresByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheableBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_persistCompatibilityInfo:(const char *)a1 forBundleIdentifier:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_217702000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)persistManifestData:(const char *)a1 forBundleIdentifier:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_217702000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
