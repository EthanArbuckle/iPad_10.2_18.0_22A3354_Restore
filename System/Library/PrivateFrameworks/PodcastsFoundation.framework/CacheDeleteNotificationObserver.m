@implementation CacheDeleteNotificationObserver

- (CacheDeleteNotificationObserver)initWithDelegate:(id)a3 observedPaths:(id)a4 notificationQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  CacheDeleteNotificationObserver *v11;
  CacheDeleteNotificationObserver *v12;
  NSDateFormatter *v13;
  NSDateFormatter *formatter;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CacheDeleteNotificationObserver;
  v11 = -[CacheDeleteNotificationObserver init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_notificationQueue, a5);
    objc_storeStrong((id *)&v12->_observedPaths, a4);
    v13 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    formatter = v12->_formatter;
    v12->_formatter = v13;

    -[NSDateFormatter setDateFormat:](v12->_formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSSSS"));
  }

  return v12;
}

- (BOOL)beginObserving
{
  void *v3;
  NSObject *notificationQueue;
  _QWORD v6[4];
  id v7;
  id location;

  -[NSArray firstObject](self->_observedPaths, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak(&location, self);
    notificationQueue = self->_notificationQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__CacheDeleteNotificationObserver_beginObserving__block_invoke;
    v6[3] = &unk_1E54D1E18;
    objc_copyWeak(&v7, &location);
    dispatch_async(notificationQueue, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v3 != 0;
}

void __49__CacheDeleteNotificationObserver_beginObserving__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_onQueueBeginObserving");
    WeakRetained = v2;
  }

}

- (void)_onQueueBeginObserving
{
  id v3;

  -[NSArray mt_compactMap:](self->_observedPaths, "mt_compactMap:", &__block_literal_global_7);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CacheDeleteNotificationObserver _onQueueConfigurePurgeMarkerForVolume:](self, "_onQueueConfigurePurgeMarkerForVolume:", v3);
  -[CacheDeleteNotificationObserver _onQueueSubscribeToNotificationsForVolume:](self, "_onQueueSubscribeToNotificationsForVolume:", v3);

}

uint64_t __57__CacheDeleteNotificationObserver__onQueueBeginObserving__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "path");
}

- (void)_onQueueConfigurePurgeMarkerForVolume:(__CFArray *)a3
{
  CFIndex Count;
  CFIndex i;
  id v6;
  id location;

  objc_initWeak(&location, self);
  Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      CFArrayGetValueAtIndex(a3, i);
      CacheDeleteInitPurgeMarker();
    }
  }
  objc_copyWeak(&v6, &location);
  CacheDeleteEnumerateRemovedFilesInDirectories();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __73__CacheDeleteNotificationObserver__onQueueConfigurePurgeMarkerForVolume___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_onQueueProcessNotifications:", a2);
    WeakRetained = v4;
  }

}

- (void)_onQueueSubscribeToNotificationsForVolume:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = v4;
  objc_copyWeak(&v6, &location);
  CacheDeleteRegisterPurgeNotification();
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

void __77__CacheDeleteNotificationObserver__onQueueSubscribeToNotificationsForVolume___block_invoke(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 40));
  CacheDeleteEnumerateRemovedFilesInDirectories();
  objc_destroyWeak(&v1);
}

void __77__CacheDeleteNotificationObserver__onQueueSubscribeToNotificationsForVolume___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_onQueueProcessNotifications:", a2);
    WeakRetained = v4;
  }

}

- (void)_onQueueProcessNotifications:(__CFArray *)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *WeakRetained;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  __CFArray *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  NSObject *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v4 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v23;
    *(_QWORD *)&v5 = 138412802;
    v20 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("historyDone"), v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          -[NSObject cacheDeleteObserverBecameSynchronizedWithFileSystem:](WeakRetained, "cacheDeleteObserverBecameSynchronizedWithFileSystem:", self);
        }
        else
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("path"));
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12
            && (v13 = (void *)v12,
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timestamp")),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v14,
                v13,
                v14))
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("path"));
            WeakRetained = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timestamp"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDateFormatter dateFromString:](self->_formatter, "dateFromString:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            _MTLogCategoryDownload();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v20;
              v27 = v15;
              v28 = 2112;
              v29 = v16;
              v30 = 2112;
              v31 = WeakRetained;
              _os_log_impl(&dword_1A904E000, v17, OS_LOG_TYPE_DEFAULT, "Found cache deleted file ('%@' => %@): (%@)", buf, 0x20u);
            }

            v18 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v18, "cacheDeleteObserver:didIdentifyCacheDeletedPath:deletedAtDate:", self, WeakRetained, v16);

          }
          else
          {
            _MTLogCategoryDownload();
            WeakRetained = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v9;
              _os_log_impl(&dword_1A904E000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Unhandled CacheDeleteEvent: %@", buf, 0xCu);
            }
          }
        }

        ++v8;
      }
      while (v6 != v8);
      v19 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      v6 = v19;
    }
    while (v19);
  }

}

- (CacheDeleteNotificationObserverDelegate)delegate
{
  return (CacheDeleteNotificationObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)observedPaths
{
  return self->_observedPaths;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_observedPaths, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
