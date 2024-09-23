@implementation AXSupportDefaultsObserver

- (AXSupportDefaultsObserver)init
{
  AXSupportDefaultsObserver *v2;
  id v3;
  uint64_t v4;
  NSUserDefaults *axDomain;
  NSMutableSet *v6;
  NSMutableSet *observedPrefs;
  NSMutableArray *v8;
  NSMutableArray *actions;
  NSMutableDictionary *v10;
  NSMutableDictionary *actionLastNotifications;
  dispatch_queue_t v12;
  OS_dispatch_queue *lastNotificationsQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AXSupportDefaultsObserver;
  v2 = -[AXSupportDefaultsObserver init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v4 = objc_msgSend(v3, "initWithSuiteName:", kAXSAccessibilityPreferenceDomain);
    axDomain = v2->_axDomain;
    v2->_axDomain = (NSUserDefaults *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    observedPrefs = v2->_observedPrefs;
    v2->_observedPrefs = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actions = v2->_actions;
    v2->_actions = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    actionLastNotifications = v2->_actionLastNotifications;
    v2->_actionLastNotifications = v10;

    v12 = dispatch_queue_create("com.apple.AccessibilitySupport.lastNotificationsQueue", 0);
    lastNotificationsQueue = v2->_lastNotificationsQueue;
    v2->_lastNotificationsQueue = (OS_dispatch_queue *)v12;

  }
  return v2;
}

- (void)dealloc
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_observedPrefs;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSUserDefaults removeObserver:forKeyPath:](self->_axDomain, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)AXSupportDefaultsObserver;
  -[AXSupportDefaultsObserver dealloc](&v8, sel_dealloc);
}

- (void)startObservingPreference:(__CFString *)a3 andBroadcastDarwinNotification:(__CFString *)a4
{
  NSMutableSet *observedPrefs;
  __CFString *v7;
  AXDefaultsObserverPostDarwinNotificationAction *v8;

  observedPrefs = self->_observedPrefs;
  v7 = a3;
  -[NSMutableSet addObject:](observedPrefs, "addObject:", v7);
  v8 = -[AXDefaultsObserverPostDarwinNotificationAction initWithDarwinNotification:]([AXDefaultsObserverPostDarwinNotificationAction alloc], "initWithDarwinNotification:", a4);
  -[NSMutableArray addObject:](self->_actions, "addObject:", v8);
  -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_axDomain, "addObserver:forKeyPath:options:context:", self, v7, 3, v8);

}

- (void)startObservingPreference:(__CFString *)a3 andPerformBlock:(id)a4
{
  NSMutableSet *observedPrefs;
  __CFString *v7;
  id v8;
  AXDefaultsObserverExecuteBlockNotificationAction *v9;

  observedPrefs = self->_observedPrefs;
  v7 = a3;
  v8 = a4;
  -[NSMutableSet addObject:](observedPrefs, "addObject:", v7);
  v9 = -[AXDefaultsObserverExecuteBlockNotificationAction initWithBlock:]([AXDefaultsObserverExecuteBlockNotificationAction alloc], "initWithBlock:", v8);

  -[NSMutableArray addObject:](self->_actions, "addObject:", v9);
  -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_axDomain, "addObserver:forKeyPath:options:context:", self, v7, 3, v9);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *lastNotificationsQueue;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    v31 = 0;
    lastNotificationsQueue = self->_lastNotificationsQueue;
    v15 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__AXSupportDefaultsObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E2938840;
    v25 = &v26;
    block[4] = self;
    v16 = v13;
    v24 = v16;
    dispatch_sync(lastNotificationsQueue, block);
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)v27[5], "isEqual:", v12) & 1) == 0 && (objc_msgSend(v17, "isEqual:", v18) & 1) == 0)
    {
      objc_msgSend(a6, "performForChangedDefault:", v10);
      if (v12)
      {
        v19 = self->_lastNotificationsQueue;
        v20[0] = v15;
        v20[1] = 3221225472;
        v20[2] = __76__AXSupportDefaultsObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v20[3] = &unk_1E2938868;
        v20[4] = self;
        v21 = v12;
        v22 = v16;
        dispatch_sync(v19, v20);

      }
    }

    _Block_object_dispose(&v26, 8);
  }

}

void __76__AXSupportDefaultsObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __76__AXSupportDefaultsObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKey:", a1[5], a1[6]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNotificationsQueue, 0);
  objc_storeStrong((id *)&self->_actionLastNotifications, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_observedPrefs, 0);
  objc_storeStrong((id *)&self->_axDomain, 0);
}

@end
