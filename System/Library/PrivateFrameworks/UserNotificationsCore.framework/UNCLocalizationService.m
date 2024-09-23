@implementation UNCLocalizationService

- (UNCLocalizationService)init
{
  UNCLocalizationService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *bundleIdentifierToBundle;
  NSMutableDictionary *v8;
  NSMutableDictionary *bundleIdentifierToBundleURL;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UNCLocalizationService;
  v2 = -[UNCLocalizationService init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.usernotifications.UNCLocalizationService", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    bundleIdentifierToBundle = v2->_bundleIdentifierToBundle;
    v2->_bundleIdentifierToBundle = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    bundleIdentifierToBundleURL = v2->_bundleIdentifierToBundleURL;
    v2->_bundleIdentifierToBundleURL = v8;

  }
  return v2;
}

- (id)bundleWithIdentifier:(id)a3
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
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__UNCLocalizationService_bundleWithIdentifier___block_invoke;
  block[3] = &unk_251AE0278;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __47__UNCLocalizationService_bundleWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_bundleWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)unloadBundleWithIdentifier:(id)a3
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
  block[2] = __53__UNCLocalizationService_unloadBundleWithIdentifier___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __53__UNCLocalizationService_unloadBundleWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unloadBundleWithIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)notificationSourcesDidInstall:(id)a3
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
  block[2] = __56__UNCLocalizationService_notificationSourcesDidInstall___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __56__UNCLocalizationService_notificationSourcesDidInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidInstall:", *(_QWORD *)(a1 + 40));
}

- (void)notificationSourcesDidUninstall:(id)a3
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
  block[2] = __58__UNCLocalizationService_notificationSourcesDidUninstall___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __58__UNCLocalizationService_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidUninstall:", *(_QWORD *)(a1 + 40));
}

- (id)_queue_bundleWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToBundle, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToBundleURL, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BDC8]), "initWithURL:", v6);
        if (v5)
          -[NSMutableDictionary setObject:forKey:](self->_bundleIdentifierToBundle, "setObject:forKey:", v5, v4);
      }
      else
      {
        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_queue_unloadBundleWithIdentifier:(id)a3
{
  if (a3)
    -[NSMutableDictionary removeObjectForKey:](self->_bundleIdentifierToBundle, "removeObjectForKey:");
}

- (void)_queue_notificationSourcesDidInstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSMutableDictionary *bundleIdentifierToBundleURL;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        bundleIdentifierToBundleURL = self->_bundleIdentifierToBundleURL;
        objc_msgSend(v9, "bundleURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](bundleIdentifierToBundleURL, "setObject:forKey:", v12, v10);

        -[NSMutableDictionary removeObjectForKey:](self->_bundleIdentifierToBundle, "removeObjectForKey:", v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)_queue_notificationSourcesDidUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](self->_bundleIdentifierToBundleURL, "removeObjectForKey:", v9);
        -[NSMutableDictionary removeObjectForKey:](self->_bundleIdentifierToBundle, "removeObjectForKey:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifierToBundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToBundle, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
