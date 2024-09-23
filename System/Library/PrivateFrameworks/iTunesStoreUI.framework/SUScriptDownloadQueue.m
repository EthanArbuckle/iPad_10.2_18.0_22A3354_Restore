@implementation SUScriptDownloadQueue

- (SUScriptDownloadQueue)initWithQueueType:(id)a3 clientInterface:(id)a4
{
  SUScriptDownloadQueue *v6;
  NSObject *v7;
  _QWORD v9[8];

  v6 = -[SUScriptObject init](self, "init");
  if (v6)
  {
    v6->_clientInterface = (SUClientInterface *)a4;
    v6->_queueType = (NSString *)objc_msgSend(a3, "copy");
    v7 = dispatch_queue_create("com.apple.iTunesStoreUI.SUScriptDownloadQueue", 0);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__SUScriptDownloadQueue_initWithQueueType_clientInterface___block_invoke;
    v9[3] = &unk_24DE7BEF0;
    v9[4] = v6;
    v9[5] = a4;
    v9[6] = a3;
    v9[7] = v7;
    dispatch_async(v7, v9);
  }
  return v6;
}

void __59__SUScriptDownloadQueue_initWithQueueType_clientInterface___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupManagersWithClientInterface:queueType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
}

- (void)dealloc
{
  objc_super v3;

  -[SUScriptDownloadQueue _tearDownQueues](self, "_tearDownQueues");

  v3.receiver = self;
  v3.super_class = (Class)SUScriptDownloadQueue;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (void)checkQueue
{
  WebThreadRunOnMainThread();
}

void __35__SUScriptDownloadQueue_checkQueue__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "lock");
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "downloadManager");
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  objc_msgSend(v2, "reloadFromServer");
  objc_msgSend(v3, "reloadFromServer");

}

- (id)_className
{
  return CFSTR("iTunesDownloadQueue");
}

- (NSArray)downloads
{
  NSArray *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SUScriptDownload *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  -[SUScriptObject lock](self, "lock");
  v4 = -[SUDownloadManager downloads](self->_downloadManager, "downloads");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = -[SUScriptDownload initWithISUDownload:]([SUScriptDownload alloc], "initWithISUDownload:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        -[NSArray addObject:](v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSString)queueType
{
  return self->_queueType;
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SUScriptDownload *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a4);
        v10 = -[SUScriptDownload initWithSSDownload:]([SUScriptDownload alloc], "initWithSSDownload:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", v10, CFSTR("downloadstatechange"));

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  -[SUScriptObject lock](self, "lock", a3);
  -[SUDownloadManager reloadDownloadManager](self->_downloadManager, "reloadDownloadManager");
  -[SUScriptObject unlock](self, "unlock");
  -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("downloadschange"));
}

- (void)preorderManagerPreordersDidChange:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("downloadschange"));
}

- (void)_setupManagersWithClientInterface:(id)a3 queueType:(id)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SUDownloadManager *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("media")))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E18], "IPodDownloadKinds");
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB1F58], "musicStoreItemKinds");
    goto LABEL_9;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("software")))
  {
    v9 = objc_msgSend(MEMORY[0x24BEB1E18], "softwareDownloadKinds");
LABEL_7:
    v7 = (void *)v9;
    v8 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("ebooks")))
  {
    v9 = objc_msgSend(MEMORY[0x24BEB1E18], "EBookDownloadKinds");
    goto LABEL_7;
  }
  v8 = 0;
  v7 = 0;
LABEL_9:
  v10 = (void *)objc_msgSend(a3, "queueSessionManager");
  if (objc_msgSend(v7, "count"))
  {
    v11 = (void *)objc_msgSend(v10, "beginDownloadManagerSessionWithDownloadKinds:", v7);
    objc_msgSend(v11, "addObserver:", self);
    v12 = -[SUDownloadManager initWithDownloadManager:clientInterface:]([SUDownloadManager alloc], "initWithDownloadManager:clientInterface:", v11, a3);
    v13 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __69__SUScriptDownloadQueue__setupManagersWithClientInterface_queueType___block_invoke;
    v15[3] = &unk_24DE7AF90;
    v15[4] = v13;
    -[SUDownloadManager preflightWithCompletionBlock:](v12, "preflightWithCompletionBlock:", v15);
    -[SUScriptObject lock](self, "lock");
    self->_downloadManager = v12;
    -[SUScriptObject unlock](self, "unlock");

  }
  if (objc_msgSend(v8, "count"))
  {
    v14 = (id)objc_msgSend(v10, "beginPreorderManagerSessionWithItemKinds:", v8);
    objc_msgSend(v14, "addObserver:", self);
    -[SUScriptObject lock](self, "lock");
    self->_preorderManager = (SSPreorderManager *)v14;
    -[SUScriptObject unlock](self, "unlock");

  }
}

uint64_t __69__SUScriptDownloadQueue__setupManagersWithClientInterface_queueType___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "dispatchEvent:forName:", 0, CFSTR("downloadschange"));
}

- (void)_tearDownQueues
{
  SUQueueSessionManager *v3;
  SUDownloadManager *downloadManager;
  SSDownloadManager *v5;

  v3 = -[SUClientInterface queueSessionManager](self->_clientInterface, "queueSessionManager");
  downloadManager = self->_downloadManager;
  if (downloadManager)
  {
    v5 = -[SUDownloadManager downloadManager](downloadManager, "downloadManager");
    -[SUQueueSessionManager endDownloadManagerSessionForManager:](v3, "endDownloadManagerSessionForManager:", v5);
    -[SSDownloadManager removeObserver:](v5, "removeObserver:", self);

    self->_downloadManager = 0;
  }
  if (self->_preorderManager)
  {
    -[SUQueueSessionManager endPreorderManagerSessionWithManager:](v3, "endPreorderManagerSessionWithManager:");
    -[SSPreorderManager removeObserver:](self->_preorderManager, "removeObserver:", self);

    self->_preorderManager = 0;
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_15, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDownloadQueue;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_12, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDownloadQueue;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptDownloadQueue;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_15, "allKeys"));
  return v2;
}

- (void)finalizeForWebScript
{
  objc_super v3;

  -[SUScriptObject lock](self, "lock");
  -[SUScriptDownloadQueue _tearDownQueues](self, "_tearDownQueues");
  -[SUScriptObject unlock](self, "unlock");
  v3.receiver = self;
  v3.super_class = (Class)SUScriptDownloadQueue;
  -[SUScriptObject finalizeForWebScript](&v3, sel_finalizeForWebScript);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_12 = (uint64_t)sel_checkQueue;
    unk_2551862A0 = CFSTR("checkQueue");
    __KeyMapping_15 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("downloads"), CFSTR("queueType"), CFSTR("queueType"), 0);
  }
}

@end
