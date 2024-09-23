@implementation STStorageDataNotifier

+ (id)sharedNotifier
{
  if (sharedNotifier_onceToken != -1)
    dispatch_once(&sharedNotifier_onceToken, &__block_literal_global_15);
  return (id)sharedNotifier__notifier;
}

void __39__STStorageDataNotifier_sharedNotifier__block_invoke()
{
  STStorageDataNotifier *v0;
  void *v1;

  v0 = objc_alloc_init(STStorageDataNotifier);
  v1 = (void *)sharedNotifier__notifier;
  sharedNotifier__notifier = (uint64_t)v0;

}

- (STStorageDataNotifier)init
{
  STStorageDataNotifier *v2;
  STStorageDataNotifier *v3;
  NSMutableDictionary *changes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStorageDataNotifier;
  v2 = -[STStorageDataNotifier init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_changesLock._os_unfair_lock_opaque = 0;
    changes = v2->_changes;
    v2->_changes = 0;

  }
  return v3;
}

- (void)_notify:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  STStorageDataNotifier *v18;

  v4 = a3;
  STLog(1, CFSTR("STStorageNotification: _notify: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  os_unfair_lock_lock(&self->_changesLock);
  -[NSMutableDictionary objectForKey:](self->_changes, "objectForKey:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[NSMutableDictionary removeObjectForKey:](self->_changes, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_changesLock);
  dispatch_get_global_queue(17, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__STStorageDataNotifier__notify___block_invoke;
  block[3] = &unk_24C75FCD0;
  v16 = v11;
  v17 = v4;
  v18 = self;
  v13 = v4;
  v14 = v11;
  dispatch_async(v12, block);

}

void __33__STStorageDataNotifier__notify___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("APPS"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);

}

- (void)notify:(id)a3 forBundleIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    os_unfair_lock_lock(&self->_changesLock);
    -[NSMutableDictionary objectForKey:](self->_changes, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "addObjectsFromArray:", v7);
    -[NSMutableDictionary setObject:forKey:](self->_changes, "setObject:forKey:", v8, v6);
    os_unfair_lock_unlock(&self->_changesLock);

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__STStorageDataNotifier_notify_forBundleIDs___block_invoke;
  v10[3] = &unk_24C75F680;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

uint64_t __45__STStorageDataNotifier_notify_forBundleIDs___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__notify_, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__notify_, *(_QWORD *)(a1 + 40), 0.1);
}

- (void)notify:(id)a3
{
  -[STStorageDataNotifier notify:forBundleIDs:](self, "notify:forBundleIDs:", a3, 0);
}

- (void)postAppsAdded:(id)a3
{
  -[STStorageDataNotifier notify:forBundleIDs:](self, "notify:forBundleIDs:", CFSTR("STNotify_AppsAdded"), a3);
}

- (void)postAppsRemoved:(id)a3
{
  -[STStorageDataNotifier notify:forBundleIDs:](self, "notify:forBundleIDs:", CFSTR("STNotify_AppsRemoved"), a3);
}

- (void)postAppsStateChanged:(id)a3
{
  -[STStorageDataNotifier notify:forBundleIDs:](self, "notify:forBundleIDs:", CFSTR("STNotify_AppsStateChanged"), a3);
}

- (void)postAppSizesChanged:(id)a3
{
  -[STStorageDataNotifier notify:forBundleIDs:](self, "notify:forBundleIDs:", CFSTR("STNotify_AppsSizesChanged"), a3);
}

- (void)postTipsChanged
{
  -[STStorageDataNotifier notify:](self, "notify:", CFSTR("STNotify_TipsChanged"));
}

- (void)postMediaSizesChanged
{
  -[STStorageDataNotifier notify:](self, "notify:", CFSTR("STNotify_MediaSizesChanged"));
}

- (void)postLoadingComplete
{
  -[STStorageDataNotifier notify:](self, "notify:", CFSTR("STNotify_LoadingComplete"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
}

@end
