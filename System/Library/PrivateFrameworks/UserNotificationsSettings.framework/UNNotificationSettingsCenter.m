@implementation UNNotificationSettingsCenter

- (void)settingsServiceConnection:(id)a3 didUpdateNotificationSourcesWithIdentifiers:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  UNNotificationSettingsCenter *v15;
  id v16;

  v5 = a4;
  queue = self->_queue;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __102__UNNotificationSettingsCenter_settingsServiceConnection_didUpdateNotificationSourcesWithIdentifiers___block_invoke;
  v14 = &unk_24C3C80A0;
  v15 = self;
  v7 = v5;
  v16 = v7;
  dispatch_async(queue, &v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "userNotificationSettingsCenter:didUpdateNotificationSourceIdentifiers:", self, v7, v11, v12, v13, v14, v15);

  }
}

+ (id)currentNotificationSettingsCenter
{
  if (currentNotificationSettingsCenter_onceToken != -1)
    dispatch_once(&currentNotificationSettingsCenter_onceToken, &__block_literal_global);
  return (id)currentNotificationSettingsCenter___sharedInstance;
}

void __65__UNNotificationSettingsCenter_currentNotificationSettingsCenter__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[UNNotificationSettingsCenter _init]([UNNotificationSettingsCenter alloc], "_init");
  v1 = (void *)currentNotificationSettingsCenter___sharedInstance;
  currentNotificationSettingsCenter___sharedInstance = (uint64_t)v0;

}

- (UNNotificationSettingsCenter)init
{

  return 0;
}

- (id)_init
{
  UNNotificationSettingsCenter *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSHashTable *observers;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UNNotificationSettingsCenter;
  v2 = -[UNNotificationSettingsCenter init](&v10, sel_init);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.usernotifications.UNNotificationSettingsCenter", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
  v6 = objc_claimAutoreleasedReturnValue();
  observers = v2->_observers;
  v2->_observers = (NSHashTable *)v6;

  +[UNUserNotificationSettingsServiceConnection sharedInstance](UNUserNotificationSettingsServiceConnection, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:", v2);

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[UNUserNotificationSettingsServiceConnection sharedInstance](UNUserNotificationSettingsServiceConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)UNNotificationSettingsCenter;
  -[UNNotificationSettingsCenter dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  UNNotificationSettingsCenterDelegate **p_delegate;
  id WeakRetained;
  id v6;
  void *v7;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (!obj || !WeakRetained)
  {

LABEL_6:
    objc_storeWeak((id *)p_delegate, obj);
    v7 = obj;
    goto LABEL_7;
  }
  v6 = objc_loadWeakRetained((id *)p_delegate);

  v7 = obj;
  if (v6 == obj)
    goto LABEL_6;
LABEL_7:

}

- (UNNotificationSettingsCenterDelegate)delegate
{
  return (UNNotificationSettingsCenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)addObserver:(id)a3
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
  block[2] = __44__UNNotificationSettingsCenter_addObserver___block_invoke;
  block[3] = &unk_24C3C80A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __44__UNNotificationSettingsCenter_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
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
  block[2] = __47__UNNotificationSettingsCenter_removeObserver___block_invoke;
  block[3] = &unk_24C3C80A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __47__UNNotificationSettingsCenter_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)sourceWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[UNUserNotificationSettingsServiceConnection sharedInstance](UNUserNotificationSettingsServiceConnection, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSourceWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)notificationSourceWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[UNUserNotificationSettingsServiceConnection sharedInstance](UNUserNotificationSettingsServiceConnection, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSourceWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)notificationSourcesWithIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[UNUserNotificationSettingsServiceConnection sharedInstance](UNUserNotificationSettingsServiceConnection, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSourcesWithIdentifiers:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allNotificationSources
{
  void *v2;
  void *v3;

  +[UNUserNotificationSettingsServiceConnection sharedInstance](UNUserNotificationSettingsServiceConnection, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allNotificationSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)authorizationWithOptions:(unint64_t)a3 forNotificationSourceIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  +[UNUserNotificationSettingsServiceConnection sharedInstance](UNUserNotificationSettingsServiceConnection, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authorizationWithOptions:forNotificationSourceIdentifier:withCompletionHandler:", a3, v8, v7);

}

- (void)replaceNotificationSettings:(id)a3 forNotificationSourceIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[UNUserNotificationSettingsServiceConnection sharedInstance](UNUserNotificationSettingsServiceConnection, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replaceNotificationSettings:forNotificationSourceIdentifier:", v6, v5);

}

- (void)replaceNotificationTopicSettings:(id)a3 forNotificationSourceIdentifier:(id)a4 topicIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[UNUserNotificationSettingsServiceConnection sharedInstance](UNUserNotificationSettingsServiceConnection, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "replaceNotificationTopicSettings:forNotificationSourceIdentifier:topicIdentifier:", v9, v8, v7);

}

- (id)notificationSystemSettings
{
  void *v2;
  void *v3;

  +[UNUserNotificationSettingsServiceConnection sharedInstance](UNUserNotificationSettingsServiceConnection, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationSystemSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setNotificationSystemSettings:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UNUserNotificationSettingsServiceConnection sharedInstance](UNUserNotificationSettingsServiceConnection, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotificationSystemSettings:", v3);

}

- (void)resetScheduledDeliverySetting
{
  id v2;

  +[UNUserNotificationSettingsServiceConnection sharedInstance](UNUserNotificationSettingsServiceConnection, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetScheduledDeliverySetting");

}

void __102__UNNotificationSettingsCenter_settingsServiceConnection_didUpdateNotificationSourcesWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "userNotificationSettingsCenter:didUpdateNotificationSourceIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)settingsServiceConnection:(id)a3 didUpdateNotificationSystemSettings:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  UNNotificationSettingsCenter *v15;
  id v16;

  v5 = a4;
  queue = self->_queue;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __94__UNNotificationSettingsCenter_settingsServiceConnection_didUpdateNotificationSystemSettings___block_invoke;
  v14 = &unk_24C3C80A0;
  v15 = self;
  v7 = v5;
  v16 = v7;
  dispatch_async(queue, &v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "userNotificationSettingsCenter:didUpdateNotificationSystemSettings:", self, v7, v11, v12, v13, v14, v15);

  }
}

void __94__UNNotificationSettingsCenter_settingsServiceConnection_didUpdateNotificationSystemSettings___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "userNotificationSettingsCenter:didUpdateNotificationSystemSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
