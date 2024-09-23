@implementation SSDownloadQueue

- (id)_initWithDownloadManagerOptions:(id)a3
{
  SSDownloadQueue *v4;
  SSDownloadQueue *v5;
  SSDownloadManager *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD block[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSDownloadQueue;
  v4 = -[SSDownloadQueue init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_autoFinishDownloads = 1;
    v6 = -[SSDownloadManager initWithManagerOptions:]([SSDownloadManager alloc], "initWithManagerOptions:", a3);
    v5->_downloadManager = v6;
    -[SSDownloadManager addObserver:](v6, "addObserver:", v5);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SSDownloadQueue__initWithDownloadManagerOptions___block_invoke;
    block[3] = &unk_1E47B8B68;
    block[4] = v5;
    dispatch_after(0, MEMORY[0x1E0C80D38], block);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)__DaemonLaunchNotification, CFSTR("com.apple.iTunesStore.daemon.launched"), 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v5;
}

uint64_t __51__SSDownloadQueue__initWithDownloadManagerOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDownloadsDidChange:", 0);
}

- (SSDownloadQueue)init
{
  return -[SSDownloadQueue initWithDownloadKinds:](self, "initWithDownloadKinds:", 0);
}

- (SSDownloadQueue)initWithDownloadKinds:(id)a3
{
  SSDownloadManagerOptions *v5;
  objc_class *v6;
  SSDownloadQueue *v7;

  if (objc_msgSend(a3, "count"))
  {
    v5 = objc_alloc_init(SSDownloadManagerOptions);
    -[SSDownloadManagerOptions setDownloadKinds:](v5, "setDownloadKinds:", objc_msgSend(a3, "allObjects"));
    v6 = (objc_class *)objc_opt_class();
    -[SSDownloadManagerOptions setPersistenceIdentifier:](v5, "setPersistenceIdentifier:", NSStringFromClass(v6));
    -[SSDownloadManagerOptions setPrefetchedDownloadExternalProperties:](v5, "setPrefetchedDownloadExternalProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("0"), CFSTR("1"), CFSTR("4"), CFSTR("9"), CFSTR("A"), 0));
    -[SSDownloadManagerOptions setPrefetchedDownloadProperties:](v5, "setPrefetchedDownloadProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("K"), CFSTR("I"), CFSTR("J"), CFSTR("M"), CFSTR("P"), CFSTR("9"), 0));
    v7 = -[SSDownloadQueue _initWithDownloadManagerOptions:](self, "_initWithDownloadManagerOptions:", v5);

    return v7;
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A download queue must have download kinds"));
    return 0;
  }
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFSet *observers;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.iTunesStore.daemon.launched"), 0);
  -[SSDownloadManager removeObserver:](self->_downloadManager, "removeObserver:", self);

  observers = self->_observers;
  if (observers)
    CFRelease(observers);
  v5.receiver = self;
  v5.super_class = (Class)SSDownloadQueue;
  -[SSDownloadQueue dealloc](&v5, sel_dealloc);
}

+ (id)mediaDownloadKinds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("book"), CFSTR("coached-audio"), CFSTR("document"), CFSTR("feature-movie"), CFSTR("song"), CFSTR("music-video"), CFSTR("podcast"), CFSTR("ringtone"), CFSTR("tv-episode"), CFSTR("tone"), CFSTR("videoPodcast"), 0);
}

+ (id)softwareApplicationDownloadKinds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("software"), 0);
}

- (BOOL)addDownload:(id)a3
{
  NSObject *v5;
  SSDownloadManager *downloadManager;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = dispatch_semaphore_create(0);
  downloadManager = self->_downloadManager;
  v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__SSDownloadQueue_addDownload___block_invoke;
  v9[3] = &unk_1E47B8B90;
  v9[4] = v5;
  v9[5] = &v10;
  -[SSDownloadManager addDownloads:completionBlock:](downloadManager, "addDownloads:completionBlock:", v7, v9);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v5);
  LOBYTE(v5) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v5;
}

intptr_t __31__SSDownloadQueue_addDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)addObserver:(id)a3
{
  __CFSet *observers;

  observers = self->_observers;
  if (!observers)
  {
    observers = CFSetCreateMutable(0, 0, 0);
    self->_observers = observers;
  }
  CFSetAddValue(observers, a3);
}

- (BOOL)cancelDownload:(id)a3
{
  NSObject *v5;
  SSDownloadManager *downloadManager;
  uint64_t v7;
  char v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (-[SSDownloadQueue canCancelDownload:](self, "canCancelDownload:"))
  {
    v5 = dispatch_semaphore_create(0);
    downloadManager = self->_downloadManager;
    v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __34__SSDownloadQueue_cancelDownload___block_invoke;
    v10[3] = &unk_1E47B8B90;
    v10[4] = v5;
    v10[5] = &v11;
    -[SSDownloadManager cancelDownloads:completionBlock:](downloadManager, "cancelDownloads:completionBlock:", v7, v10);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
  }
  v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

intptr_t __34__SSDownloadQueue_cancelDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)canCancelDownload:(id)a3
{
  return -[SSDownloadManager canCancelDownload:](self->_downloadManager, "canCancelDownload:", a3);
}

- (NSSet)downloadKinds
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[SSDownloadManagerOptions downloadKinds](-[SSDownloadManager managerOptions](self->_downloadManager, "managerOptions"), "downloadKinds"));
}

- (SSDownloadManager)downloadManager
{
  return self->_downloadManager;
}

- (NSArray)downloads
{
  return -[SSDownloadManager downloads](self->_downloadManager, "downloads");
}

- (void)getDownloadsUsingBlock:(id)a3
{
  -[SSDownloadManager getDownloadsUsingBlock:](self->_downloadManager, "getDownloadsUsingBlock:", a3);
}

- (BOOL)isUsingNetwork
{
  return -[SSDownloadManager isUsingNetwork](self->_downloadManager, "isUsingNetwork");
}

- (BOOL)reloadFromServer
{
  -[SSDownloadManager reloadFromServer](self->_downloadManager, "reloadFromServer");
  return 1;
}

- (void)removeObserver:(id)a3
{
  __CFSet *observers;

  observers = self->_observers;
  if (observers)
    CFSetRemoveValue(observers, a3);
}

- (id)downloadForItemIdentifier:(unint64_t)a3
{
  NSArray *v4;
  id result;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = -[SSDownloadManager downloads](self->_downloadManager, "downloads");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  result = (id)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8);
        if (SSGetItemIdentifierFromValue(objc_msgSend(v9, "valueForProperty:", CFSTR("7"))) == a3)
          return v9;
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      result = (id)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (NSArray)placeholderDownloads
{
  return 0;
}

- (NSArray)preorders
{
  return 0;
}

- (BOOL)startPreOrderDownload:(id)a3
{
  return 0;
}

- (void)downloadManager:(id)a3 downloadsDidChange:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__SSDownloadQueue_downloadManager_downloadsDidChange___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

uint64_t __54__SSDownloadQueue_downloadManager_downloadsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDownloadsDidChange:", *(_QWORD *)(a1 + 40));
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SSDownloadQueue_downloadManager_downloadStatesDidChange___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

void __59__SSDownloadQueue_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "downloads");
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(void **)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (SSDownloadPhaseIsFinishedPhase((void *)objc_msgSend(v9, "downloadPhaseIdentifier")))
        {
          objc_msgSend(v3, "addObject:", v9);
        }
        else
        {
          v10 = objc_msgSend(v2, "indexOfObject:", v9);
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(*(id *)(a1 + 32), "_sendDownloadStatusChangedAtIndex:", v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_handleDownloadsRemoved:", v3);

}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SSDownloadQueue_downloadManagerDownloadsDidChange___block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __53__SSDownloadQueue_downloadManagerDownloadsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDownloadsDidChange:", 0);
}

- (void)downloadManagerNetworkUsageDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SSDownloadQueue_downloadManagerNetworkUsageDidChange___block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __56__SSDownloadQueue_downloadManagerNetworkUsageDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendQueueNetworkUsageChanged");
}

- (void)_messageObserversWithFunction:(void *)a3 context:(void *)a4
{
  __CFSet *observers;
  CFSetRef Copy;
  const __CFSet *v9;
  SSDownloadQueue *v10;

  observers = self->_observers;
  if (observers)
  {
    Copy = CFSetCreateCopy(0, observers);
    if (Copy)
    {
      v9 = Copy;
      v10 = self;
      CFSetApplyFunction(v9, (CFSetApplierFunction)a3, a4);
      CFRelease(v9);
    }
  }
}

- (void)_sendDownloadStatusChangedAtIndex:(int64_t)a3
{
  _QWORD v3[2];

  v3[0] = self;
  v3[1] = a3;
  -[SSDownloadQueue _messageObserversWithFunction:context:](self, "_messageObserversWithFunction:context:", __SendDownloadStatusChanged, v3);
}

- (void)_sendQueueChangedWithRemovals:(id)a3
{
  _QWORD v3[2];

  v3[0] = self;
  v3[1] = a3;
  -[SSDownloadQueue _messageObserversWithFunction:context:](self, "_messageObserversWithFunction:context:", __SendQueueChanged, v3);
}

- (void)_sendQueueNetworkUsageChanged
{
  _QWORD v2[2];

  v2[0] = self;
  v2[1] = 0;
  -[SSDownloadQueue _messageObserversWithFunction:context:](self, "_messageObserversWithFunction:context:", __SendNetworkUsageChanged, v2);
}

- (void)_sendQueuePreOrdersChanged
{
  _QWORD v2[2];

  v2[0] = self;
  v2[1] = 0;
  -[SSDownloadQueue _messageObserversWithFunction:context:](self, "_messageObserversWithFunction:context:", __SendPreOrdersChanged, v2);
}

- (void)_handleDownloadsDidChange:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = -[SSDownloadManager downloads](self->_downloadManager, "downloads");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if (!a3 || objc_msgSend(a3, "containsObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10)))
        {
          if (SSDownloadPhaseIsFinishedPhase((void *)objc_msgSend(v11, "downloadPhaseIdentifier")))
            objc_msgSend(v5, "addObject:", v11);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  -[SSDownloadQueue _handleDownloadsRemoved:](self, "_handleDownloadsRemoved:", v5);

}

- (void)_handleDownloadsRemoved:(id)a3
{
  void *v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_autoFinishDownloads)
  {
    v5 = (void *)objc_msgSend(a3, "allObjects");
    if (objc_msgSend(v5, "count"))
      -[SSDownloadManager _willFinishDownloads:](self->_downloadManager, "_willFinishDownloads:", v5);
  }
  else
  {
    v5 = 0;
  }
  v6 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v6)
    v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_INFO))
    v8 &= 2u;
  if (v8)
  {
    v20 = 138412546;
    v21 = objc_opt_class();
    v22 = 2048;
    v23 = objc_msgSend(a3, "count");
    LODWORD(v19) = 22;
    v18 = &v20;
    v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v20, v19);
      free(v10);
      SSFileLog(v6, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
    }
  }
  -[SSDownloadQueue _sendQueueChangedWithRemovals:](self, "_sendQueueChangedWithRemovals:", a3, v18);
  if (objc_msgSend(a3, "count"))
  {
    if (self->_autoFinishDownloads)
      -[SSDownloadManager _finishDownloads:](self->_downloadManager, "_finishDownloads:", v5);
  }
}

- (BOOL)shouldAutomaticallyFinishDownloads
{
  return self->_autoFinishDownloads;
}

- (void)setShouldAutomaticallyFinishDownloads:(BOOL)a3
{
  self->_autoFinishDownloads = a3;
}

@end
