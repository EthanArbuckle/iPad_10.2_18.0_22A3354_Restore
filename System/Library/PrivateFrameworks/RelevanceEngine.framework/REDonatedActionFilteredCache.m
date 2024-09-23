@implementation REDonatedActionFilteredCache

- (REDonatedActionFilteredCache)init
{
  REDonatedActionFilteredCache *v2;
  uint64_t v3;
  NSMapTable *actions;
  uint64_t v5;
  NSMapTable *countsByActionType;
  uint64_t v7;
  NSMapTable *countPerformedTodayByActionType;
  void *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  void *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)REDonatedActionFilteredCache;
  v2 = -[REDonatedActionFilteredCache init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    actions = v2->_actions;
    v2->_actions = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    countsByActionType = v2->_countsByActionType;
    v2->_countsByActionType = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    countPerformedTodayByActionType = v2->_countPerformedTodayByActionType;
    v2->_countPerformedTodayByActionType = (NSMapTable *)v7;

    +[RESingleton sharedInstance](REDonatedActionStore, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "callbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

    +[RESingleton sharedInstance](REDonatedActionStore, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:", v2);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)REDonatedActionFilteredCacheReset, CFSTR("com.apple.relevanceengine.resetpredictedactions"), 0, CFNotificationSuspensionBehaviorCoalesce);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__refreshAllDonations_, CFSTR("REShowRecentDeveloperDonationsChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    RESignificantTimeChangeNotification();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__refreshAllDonations_, v16, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  +[RESingleton sharedInstance](REDonatedActionStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.relevanceengine.resetpredictedactions"), 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("REShowRecentDeveloperDonationsChangedNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  RESignificantTimeChangeNotification();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, v7, 0);

  v8.receiver = self;
  v8.super_class = (Class)REDonatedActionFilteredCache;
  -[REDonatedActionFilteredCache dealloc](&v8, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  REDonatedActionFilteredCacheDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

- (void)fetchAllUniqueActions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__REDonatedActionFilteredCache_fetchAllUniqueActions_completion___block_invoke;
    block[3] = &unk_24CF8CD88;
    block[4] = self;
    v11 = v6;
    v12 = v8;
    dispatch_async(queue, block);

  }
  else if (v7)
  {
    dispatch_async((dispatch_queue_t)self->_queue, v7);
  }

}

uint64_t __65__REDonatedActionFilteredCache_fetchAllUniqueActions_completion___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1[4] + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6), (_QWORD)v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = a1[5];
        objc_msgSend(v7, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchCountForAction:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__REDonatedActionFilteredCache_fetchCountForAction_usingBlock___block_invoke;
    block[3] = &unk_24CF8AA00;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(queue, block);

  }
}

void __63__REDonatedActionFilteredCache_fetchCountForAction_usingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_keyForAction:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "uuids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, objc_msgSend(v4, "count"));

}

- (void)fetchDonationWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[RESingleton sharedInstance](REDonatedActionStore, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchDonationWithIdentifier:completion:", v6, v5);

}

- (void)fetchPerformedCountForAction:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__REDonatedActionFilteredCache_fetchPerformedCountForAction_usingBlock___block_invoke;
    block[3] = &unk_24CF8C290;
    v12 = v7;
    block[4] = self;
    v11 = v6;
    dispatch_async(queue, block);

  }
}

uint64_t __72__REDonatedActionFilteredCache_fetchPerformedCountForAction_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "_queue_performedCountForDonation:", *(_QWORD *)(a1 + 40)));
}

- (void)fetchPerformedTodayCountForActionWithBundleIdentifer:(id)a3 actionIdentifier:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *queue;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __113__REDonatedActionFilteredCache_fetchPerformedTodayCountForActionWithBundleIdentifer_actionIdentifier_completion___block_invoke;
    v12[3] = &unk_24CF90118;
    v14 = v9;
    v12[4] = self;
    v13 = v8;
    v15 = a4;
    dispatch_async(queue, v12);

  }
}

uint64_t __113__REDonatedActionFilteredCache_fetchPerformedTodayCountForActionWithBundleIdentifer_actionIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "_queue_performedTodayCountForBundleIdentifer:actionIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)));
}

- (void)fetchFirstPerformedActionDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__REDonatedActionFilteredCache_fetchFirstPerformedActionDate___block_invoke;
    v7[3] = &unk_24CF8B2E0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

uint64_t __62__REDonatedActionFilteredCache_fetchFirstPerformedActionDate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__REDonatedActionFilteredCache_reset__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__REDonatedActionFilteredCache_reset__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllData");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "donatedActionFilteredCacheDonationRemoved");

}

- (void)donationActionStoreReceivedDonation:(id)a3 isNewDonation:(BOOL)a4
{
  NSObject *queue;
  id v6;

  queue = self->_queue;
  v6 = a3;
  dispatch_assert_queue_V2(queue);
  -[REDonatedActionFilteredCache _queue_storeDonation:](self, "_queue_storeDonation:", v6);

}

- (void)donationActionStoreRemovedDonation:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[REDonatedActionFilteredCache _queue_removeDonation:](self, "_queue_removeDonation:", v5);

}

- (void)donationActionStoreRemovedDonationsFor:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[REDonatedActionFilteredCache _queue_removeDonationsForBundleIdentifier:](self, "_queue_removeDonationsForBundleIdentifier:", v5);

}

- (void)donationActionStoreRemoveAllDonations
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[REDonatedActionFilteredCache _queue_removeAllData](self, "_queue_removeAllData");
}

- (void)_queue_removeAllData
{
  void *v3;
  NSDate *firstDonationDate;

  v3 = (void *)MEMORY[0x2199B223C](self, a2);
  -[NSMapTable removeAllObjects](self->_actions, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_countsByActionType, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_countPerformedTodayByActionType, "removeAllObjects");
  firstDonationDate = self->_firstDonationDate;
  self->_firstDonationDate = 0;

  objc_autoreleasePoolPop(v3);
}

- (id)_keyForAction:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _REActionKey *v7;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") != 2 && (REShowRecentDeveloperDonations() & 1) == 0)
  {
    objc_msgSend(v3, "bundleIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if (objc_msgSend(v3, "type") == 1)
    objc_msgSend(v3, "simplifiedActionTypeIdentifier");
  else
    objc_msgSend(v3, "actionTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_REActionKey initWithIdentifier:actionType:relevanceProvidersHash:]([_REActionKey alloc], "initWithIdentifier:actionType:relevanceProvidersHash:", v4, v6, objc_msgSend(v3, "relevanceProvidersHash"));

  return v7;
}

- (void)_queue_storeDonation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _REActionValue *v13;
  _REActionValue *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (objc_msgSend(v16, "type") == 1)
  {
    -[REDonatedActionFilteredCache _queue_incrementPerformedCountForDonation:](self, "_queue_incrementPerformedCountForDonation:", v16);
    +[RESiriActionsDonationsWhitelist sharedInstance](RESiriActionsDonationsWhitelist, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "intentTypeName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "intentIsWhitelistedForBundleID:andTypeName:", v5, v6);

    if ((v7 & 1) == 0)
      goto LABEL_10;
  }
  else if (!objc_msgSend(v16, "type"))
  {
    -[REDonatedActionFilteredCache _queue_incrementPerformedCountForDonation:](self, "_queue_incrementPerformedCountForDonation:", v16);
    +[RESiriActionsDonationsWhitelist sharedInstance](RESiriActionsDonationsWhitelist, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activityType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "userActivityIsWhitelistedForBundleID:andActivityType:", v9, v10);

    if (!v11)
      goto LABEL_10;
  }
  -[REDonatedActionFilteredCache _keyForAction:](self, "_keyForAction:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_actions, "objectForKey:", v12);
  v13 = (_REActionValue *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = v13;
    -[_REActionValue addAction:](v13, "addAction:", v16);
    -[REDonatedActionFilteredCache delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "donatedActionFilteredCacheCountDidChange");
  }
  else
  {
    v14 = -[_REActionValue initWithAction:]([_REActionValue alloc], "initWithAction:", v16);
    -[NSMapTable setObject:forKey:](self->_actions, "setObject:forKey:", v14, v12);
    -[REDonatedActionFilteredCache delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "donatedActionFilteredCacheDidAddDonation:", v16);
  }

LABEL_10:
}

- (void)_queue_removeDonation:(id)a3
{
  void *v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = self->_actions;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
      -[NSMapTable objectForKey:](self->_actions, "objectForKey:", v10, (_QWORD)v24);
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject uuids](v11, "uuids");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v4);

      if ((v13 & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v10;

    if (!v11)
      goto LABEL_13;
    -[NSObject removeActionWithUUID:](v11, "removeActionWithUUID:", v4);
    -[NSObject uuids](v11, "uuids");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      -[REDonatedActionFilteredCache delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "donatedActionFilteredCacheCountDidChange");
    }
    else
    {
      -[NSMapTable removeObjectForKey:](self->_actions, "removeObjectForKey:", v14);
      -[REDonatedActionFilteredCache delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "donatedActionFilteredCacheDonationRemoved");
    }

  }
  else
  {
LABEL_9:

    v14 = 0;
LABEL_13:
    RELogForDomain(14);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[REDonatedActionFilteredCache _queue_removeDonation:].cold.1((uint64_t)v4, v11, v18, v19, v20, v21, v22, v23);
  }

}

- (void)_queue_removeDonationsForBundleIdentifier:(id)a3
{
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = self->_actions;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
      -[NSMapTable objectForKey:](self->_actions, "objectForKey:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject action](v10, "action");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v23, "isEqualToString:", v12);

      if ((v13 & 1) != 0)
        break;

      if (v6 == ++v8)
      {
        v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v9;

    if (!v10)
      goto LABEL_14;
    RELogForDomain(14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[REDonatedActionFilteredCache _queue_removeDonationsForBundleIdentifier:].cold.2(v10, (uint64_t)v23, v15);

    -[NSMapTable removeObjectForKey:](self->_actions, "removeObjectForKey:", v14);
    -[REDonatedActionFilteredCache delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "donatedActionFilteredCacheDonationRemoved");

  }
  else
  {
LABEL_9:

    v14 = 0;
LABEL_14:
    RELogForDomain(14);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[REDonatedActionFilteredCache _queue_removeDonationsForBundleIdentifier:].cold.1((uint64_t)v23, v10, v17, v18, v19, v20, v21, v22);
  }

}

- (unint64_t)_queue_performedTodayCountForBundleIdentifer:(id)a3 actionIdentifier:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  if (!a3)
    return 0;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_REPerformedActionKey keyForBundleIdentifier:identifier:](_REPerformedActionKey, "keyForBundleIdentifier:identifier:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_countPerformedTodayByActionType, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  return v11;
}

- (unint64_t)_queue_performedCountForDonation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "simplifiedActionTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_REPerformedActionKey keyForBundleIdentifier:identifier:](_REPerformedActionKey, "keyForBundleIdentifier:identifier:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMapTable objectForKey:](self->_countsByActionType, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_queue_incrementPerformedCountForDonation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDate *firstDonationDate;
  NSDate *v9;
  NSDate *v10;
  void *v11;
  uint64_t v12;
  NSMapTable *countsByActionType;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSMapTable *countPerformedTodayByActionType;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "simplifiedActionTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v23, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_REPerformedActionKey keyForBundleIdentifier:identifier:](_REPerformedActionKey, "keyForBundleIdentifier:identifier:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "creationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    firstDonationDate = self->_firstDonationDate;
    if (firstDonationDate)
    {
      -[NSDate earlierDate:](firstDonationDate, "earlierDate:", v7);
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v7;
    }
    v10 = self->_firstDonationDate;
    self->_firstDonationDate = v9;

    -[NSMapTable objectForKey:](self->_countsByActionType, "objectForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    countsByActionType = self->_countsByActionType;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12 + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](countsByActionType, "setObject:forKey:", v14, v6);

    if (REDateOccursToday(v7))
    {
      objc_msgSend(v23, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "re_actionIdentifierHashValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[_REPerformedActionKey keyForBundleIdentifier:identifier:](_REPerformedActionKey, "keyForBundleIdentifier:identifier:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMapTable objectForKey:](self->_countPerformedTodayByActionType, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "unsignedIntegerValue");

      countPerformedTodayByActionType = self->_countPerformedTodayByActionType;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19 + 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](countPerformedTodayByActionType, "setObject:forKey:", v21, v17);

    }
    -[REDonatedActionFilteredCache delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "donatedActionFilteredCacheCountDidChange");

  }
}

- (void)_refreshAllDonations:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *queue;
  _QWORD v10[5];
  char v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RELogForDomain(14);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received.", buf, 0xCu);

  }
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(CFSTR("REShowRecentDeveloperDonationsChangedNotification"), "isEqualToString:", v7);

  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__REDonatedActionFilteredCache__refreshAllDonations___block_invoke;
  v10[3] = &unk_24CF8B678;
  v10[4] = self;
  v11 = v8;
  dispatch_async(queue, v10);

}

void __53__REDonatedActionFilteredCache__refreshAllDonations___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllData");
  +[RESingleton sharedInstance](REDonatedActionStore, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerDistributeAllDonatedActions:", *(unsigned __int8 *)(a1 + 40));

}

- (REDonatedActionFilteredCacheDelegate)delegate
{
  return (REDonatedActionFilteredCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_firstDonationDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_countPerformedTodayByActionType, 0);
  objc_storeStrong((id *)&self->_countsByActionType, 0);
}

- (void)_queue_removeDonation:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, a2, a3, "filtered action cache didn't contain action value with uuid: %@", a5, a6, a7, a8, 2u);
}

- (void)_queue_removeDonationsForBundleIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, a2, a3, "Attempted to remove %{public}@ actions, but none were found in filtered action cache.", a5, a6, a7, a8, 2u);
}

- (void)_queue_removeDonationsForBundleIdentifier:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "uuids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = objc_msgSend(v5, "count");
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_2132F7000, a3, OS_LOG_TYPE_ERROR, "Remove %lu actions for %{public}@.", (uint8_t *)&v6, 0x16u);

}

@end
