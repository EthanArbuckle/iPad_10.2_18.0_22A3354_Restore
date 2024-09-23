@implementation UNCSpotlightDaemonClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1)
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_instance;
}

void __42__UNCSpotlightDaemonClient_sharedInstance__block_invoke()
{
  UNCSpotlightDaemonClient *v0;
  void *v1;

  v0 = objc_alloc_init(UNCSpotlightDaemonClient);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (UNCSpotlightDaemonClient)init
{
  UNCSpotlightDaemonClient *v2;
  uint64_t v3;
  NSHashTable *observers;
  UNCSpotlightDaemonClient *v5;
  void (*v6)(const __CFString *, UNCSpotlightDaemonClient *);
  NSObject *v7;
  _Unwind_Exception *v9;
  _Unwind_Exception *v10;
  objc_super v11;
  uint8_t buf[8];
  uint64_t v13;
  void *(*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;

  v11.receiver = self;
  v11.super_class = (Class)UNCSpotlightDaemonClient;
  v2 = -[UNCSpotlightDaemonClient init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = v2;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v6 = (void (*)(const __CFString *, UNCSpotlightDaemonClient *))getSpotlightDaemonClientRegisterSymbolLoc_ptr;
    v20 = getSpotlightDaemonClientRegisterSymbolLoc_ptr;
    if (!getSpotlightDaemonClientRegisterSymbolLoc_ptr)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      v13 = 3221225472;
      v14 = __getSpotlightDaemonClientRegisterSymbolLoc_block_invoke;
      v15 = &unk_251AE0138;
      v16 = &v17;
      __getSpotlightDaemonClientRegisterSymbolLoc_block_invoke((uint64_t)buf);
      v6 = (void (*)(const __CFString *, UNCSpotlightDaemonClient *))v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (!v6)
    {
      -[UNCSpotlightDaemonClient init].cold.1();
      v10 = v9;
      _Block_object_dispose(&v17, 8);
      _Unwind_Resume(v10);
    }
    v6(CFSTR("com.apple.corespotlight.daemon.notifications"), v5);

    v7 = *MEMORY[0x24BDF8A00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A00], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "Registered as Spotlight client", buf, 2u);
    }
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  if (a8)
    (*((void (**)(id, _QWORD, _QWORD))a8 + 2))(a8, 0, 0);
}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  if (a8)
    (*((void (**)(id, _QWORD, _QWORD))a8 + 2))(a8, 0, 0);
}

- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
}

- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
  if (a6)
    (*((void (**)(id))a6 + 2))(a6);
}

- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSHashTable *v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  int64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BDF8A00];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A00], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v19 = a4;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "SpotlightDaemonClient searchableItemsDidUpdate: %lu, %@", buf, 0x16u);
  }
  if ((a4 & 1) != 0)
  {
    v8 = self->_observers;
    objc_sync_enter(v8);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = self->_observers;
    v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "searchableItemsDidUpdate:", v6, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    objc_sync_exit(v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)init
{
  dlerror();
  abort_report_np();
  -[UNCRemoteNotificationServer _queue_connection:didReceiveToken:forTopic:identifier:].cold.1();
}

@end
