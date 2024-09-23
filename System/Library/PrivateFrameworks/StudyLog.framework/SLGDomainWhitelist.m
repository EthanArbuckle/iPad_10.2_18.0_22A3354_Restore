@implementation SLGDomainWhitelist

- (SLGDomainWhitelist)init
{
  SLGDomainWhitelist *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *lockQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SLGDomainWhitelist;
  v2 = -[SLGDomainWhitelist init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("SLGDomainWhitelistLock", v3);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v4;

    -[SLGDomainWhitelist _reloadSettings](v2, "_reloadSettings");
    -[SLGDomainWhitelist _beginObservingSettings](v2, "_beginObservingSettings");

  }
  return v2;
}

- (NSSet)whitelist
{
  NSObject *lockQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_lockQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  lockQueue = self->_lockQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__SLGDomainWhitelist_whitelist__block_invoke;
  v6[3] = &unk_1E81F31D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(lockQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __31__SLGDomainWhitelist_whitelist__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (BOOL)allowUnspecifiedDomains
{
  SLGDomainWhitelist *v2;
  NSObject *lockQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_lockQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  lockQueue = v2->_lockQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__SLGDomainWhitelist_allowUnspecifiedDomains__block_invoke;
  v5[3] = &unk_1E81F31D0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __45__SLGDomainWhitelist_allowUnspecifiedDomains__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (void)setAllowUnspecifiedDomains:(BOOL)a3
{
  NSObject *lockQueue;
  _QWORD v6[5];
  BOOL v7;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_lockQueue);
  lockQueue = self->_lockQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__SLGDomainWhitelist_setAllowUnspecifiedDomains___block_invoke;
  v6[3] = &unk_1E81F31F8;
  v7 = a3;
  v6[4] = self;
  dispatch_sync(lockQueue, v6);
}

void __49__SLGDomainWhitelist_setAllowUnspecifiedDomains___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  __CFNotificationCenter *DarwinNotifyCenter;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = v1;
    CFPreferencesSetAppValue(CFSTR("SLGAllowUnspecifiedDomains"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24)), CFSTR("com.apple.UIKit"));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.studylog.whitelistDidChange"), 0, 0, 0);
  }
}

- (BOOL)isDomainWhitelisted:(id)a3
{
  id v4;
  NSObject *lockQueue;
  id v6;
  _QWORD block[4];
  id v9;
  SLGDomainWhitelist *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_lockQueue);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SLGDomainWhitelist_isDomainWhitelisted___block_invoke;
  block[3] = &unk_1E81F3220;
  v9 = v4;
  v10 = self;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(lockQueue, block);
  LOBYTE(v4) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

uint64_t __42__SLGDomainWhitelist_isDomainWhitelisted___block_invoke(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)result;
  v2 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32))
  {
    result = objc_msgSend(*(id *)(v2 + 16), "count");
    if (result)
    {
      result = objc_msgSend(*(id *)(v1[5] + 16), "containsObject:", v1[4]);
      if ((result & 1) == 0)
        goto LABEL_4;
    }
  }
  else if (!*(_BYTE *)(v2 + 24))
  {
LABEL_4:
    *(_BYTE *)(*(_QWORD *)(v1[6] + 8) + 24) = 0;
  }
  return result;
}

- (void)addDomain:(id)a3
{
  id v4;
  NSObject *lockQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_lockQueue);
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SLGDomainWhitelist_addDomain___block_invoke;
  block[3] = &unk_1E81F3248;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lockQueue, block);

}

void __32__SLGDomainWhitelist_addDomain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setByAddingObject:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("SLGDomainWhitelist"), v6, CFSTR("com.apple.UIKit"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.studylog.whitelistDidChange"), 0, 0, 0);

}

- (void)removeDomain:(id)a3
{
  id v4;
  NSObject *lockQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_lockQueue);
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SLGDomainWhitelist_removeDomain___block_invoke;
  block[3] = &unk_1E81F3248;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lockQueue, block);

}

void __35__SLGDomainWhitelist_removeDomain___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *value;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "mutableCopy");
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;
  v5 = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allObjects");
  value = (void *)objc_claimAutoreleasedReturnValue();

  CFPreferencesSetAppValue(CFSTR("SLGDomainWhitelist"), value, CFSTR("com.apple.UIKit"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.studylog.whitelistDidChange"), 0, 0, 0);

}

- (void)dealloc
{
  objc_super v3;

  -[SLGDomainWhitelist _stopObservingSettings](self, "_stopObservingSettings");
  v3.receiver = self;
  v3.super_class = (Class)SLGDomainWhitelist;
  -[SLGDomainWhitelist dealloc](&v3, sel_dealloc);
}

- (void)_reloadSettings
{
  NSObject *lockQueue;
  _QWORD block[5];

  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SLGDomainWhitelist__reloadSettings__block_invoke;
  block[3] = &unk_1E81F3270;
  block[4] = self;
  dispatch_async(lockQueue, block);
}

uint64_t __37__SLGDomainWhitelist__reloadSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lockQueue_loadSettings");
}

- (void)_lockQueue_loadSettings
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lockQueue);
  -[SLGDomainWhitelist _lockQueue_loadWhitelist](self, "_lockQueue_loadWhitelist");
  -[SLGDomainWhitelist _lockQueue_loadUnspecifiedDomains](self, "_lockQueue_loadUnspecifiedDomains");
}

- (void)_lockQueue_loadWhitelist
{
  void *v3;
  id v4;
  NSSet *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *whitelist;
  NSSet *v12;
  NSSet *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lockQueue);
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("SLGDomainWhitelist"), CFSTR("com.apple.UIKit"));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          -[NSSet addObject:](v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10++), (_QWORD)v14);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    whitelist = self->_whitelist;
    self->_whitelist = v5;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v13 = self->_whitelist;
    self->_whitelist = v12;

  }
}

- (void)_lockQueue_loadUnspecifiedDomains
{
  void *v3;
  char v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_lockQueue);
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("SLGAllowUnspecifiedDomains"), CFSTR("com.apple.UIKit"));
  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;
  self->_allowUnspecifiedDomains = v4;
}

- (void)_beginObservingSettings
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)SLGDomainWhitelistSettingsDidChange, CFSTR("com.apple.studylog.whitelistDidChange"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopObservingSettings
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.studylog.whitelistDidChange"), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelist, 0);
  objc_storeStrong((id *)&self->_lockQueue, 0);
}

@end
