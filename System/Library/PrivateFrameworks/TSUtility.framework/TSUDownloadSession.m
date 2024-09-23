@implementation TSUDownloadSession

- (TSUDownloadSession)init
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDownloadSession init]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDownloadSession.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 49, CFSTR("Do not call method"));

  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSUDownloadSession init]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (!self->_didFinishInitialization)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDownloadSession dealloc]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDownloadSession.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_didFinishInitialization);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 57, CFSTR("%@ was not called."), v6);

    dispatch_group_leave((dispatch_group_t)self->_initializationGroup);
  }
  -[TSUDownloadSession cancelRemainingTasksNotifyingDelegate:](self, "cancelRemainingTasksNotifyingDelegate:", 0);
  v7.receiver = self;
  v7.super_class = (Class)TSUDownloadSession;
  -[TSUDownloadSession dealloc](&v7, sel_dealloc);
}

- (BOOL)isActive
{
  BOOL v3;
  NSObject *accessQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  dispatch_group_wait((dispatch_group_t)self->_initializationGroup, 0xFFFFFFFFFFFFFFFFLL);
  v3 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (!self->_isCancelled)
  {
    accessQueue = self->_accessQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __30__TSUDownloadSession_isActive__block_invoke;
    v6[3] = &unk_24D61B618;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(accessQueue, v6);
    v3 = *((_BYTE *)v8 + 24) != 0;
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __30__TSUDownloadSession_isActive__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)notifyCompletionWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *initializationGroup;
  NSObject *accessQueue;
  _QWORD block[5];
  id v13;
  _QWORD aBlock[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__TSUDownloadSession_notifyCompletionWithQueue_completionHandler___block_invoke;
    aBlock[3] = &unk_24D61B640;
    aBlock[4] = self;
    v15 = v6;
    v16 = v7;
    v9 = _Block_copy(aBlock);
    if (dispatch_group_wait((dispatch_group_t)self->_initializationGroup, 0))
    {
      initializationGroup = self->_initializationGroup;
      accessQueue = self->_accessQueue;
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __66__TSUDownloadSession_notifyCompletionWithQueue_completionHandler___block_invoke_3;
      block[3] = &unk_24D61B668;
      block[4] = self;
      v13 = v9;
      dispatch_group_notify(initializationGroup, accessQueue, block);

    }
    else
    {
      dispatch_group_notify((dispatch_group_t)self->_completionGroup, (dispatch_queue_t)self->_accessQueue, v9);
    }

  }
}

void __66__TSUDownloadSession_notifyCompletionWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__TSUDownloadSession_notifyCompletionWithQueue_completionHandler___block_invoke_2;
  v6[3] = &unk_24D61B4B0;
  v3 = *(NSObject **)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  dispatch_async(v3, v6);

}

uint64_t __66__TSUDownloadSession_notifyCompletionWithQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__TSUDownloadSession_notifyCompletionWithQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  if (dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 88), 0))
    dispatch_group_notify(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 88), *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 48), *(dispatch_block_t *)(a1 + 40));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)waitUntilTimeout:(unint64_t)a3
{
  id v5;
  NSObject *accessQueue;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (dispatch_group_wait((dispatch_group_t)self->_initializationGroup, a3)
    || dispatch_group_wait((dispatch_group_t)self->_completionGroup, a3))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -1001, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__4;
    v13 = __Block_byref_object_dispose__4;
    v14 = 0;
    accessQueue = self->_accessQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __39__TSUDownloadSession_waitUntilTimeout___block_invoke;
    v8[3] = &unk_24D61B618;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(accessQueue, v8);
    v5 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  return v5;
}

void __39__TSUDownloadSession_waitUntilTimeout___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

- (void)cancel
{
  NSObject *initializationGroup;
  NSObject *accessQueue;
  _QWORD block[5];

  self->_isCancelled = 1;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_taskProgress, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_7);
  initializationGroup = self->_initializationGroup;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__TSUDownloadSession_cancel__block_invoke_2;
  block[3] = &unk_24D61B6D0;
  block[4] = self;
  dispatch_group_async(initializationGroup, accessQueue, block);
}

uint64_t __28__TSUDownloadSession_cancel__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setIsActive:", 0);
}

void __28__TSUDownloadSession_cancel__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
  {
    v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
    objc_msgSend(*(id *)(a1 + 32), "cancelRemainingTasksNotifyingDelegate:", 1);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(WeakRetained, "cancelTasksWithDescriptions:forDownloadSession:", v3, *(_QWORD *)(a1 + 32));

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)TSUDownloadSession;
  -[TSUDownloadSession description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \"%@\"), v4, self->_sessionDescription);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (TSUDownloadSession)initWithManager:(id)a3 downloadItems:(id)a4 description:(id)a5 willRequestDownload:(BOOL)a6 delegate:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  TSUDownloadSession *v16;
  TSUDownloadSession *v17;
  uint64_t v18;
  NSString *sessionDescription;
  dispatch_group_t v20;
  OS_dispatch_group *initializationGroup;
  dispatch_queue_t v22;
  OS_dispatch_queue *accessQueue;
  uint64_t v24;
  OS_dispatch_queue *delegateQueue;
  id *p_delegateQueue;
  NSMutableSet *v27;
  NSMutableSet *remainingTasks;
  NSMutableDictionary *v29;
  NSMutableDictionary *taskProgress;
  dispatch_group_t v31;
  OS_dispatch_group *completionGroup;
  TSUBasicProgress *v33;
  TSUBasicProgress *progress;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;
  id v52;
  id v53;
  id v54;
  TSUDownloadSession *v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  _BYTE v62[128];
  uint64_t v63;

  v8 = a6;
  v63 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v61.receiver = self;
  v61.super_class = (Class)TSUDownloadSession;
  v16 = -[TSUDownloadSession init](&v61, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_manager, v12);
    objc_storeWeak((id *)&v17->_delegate, v15);
    v18 = objc_msgSend(v14, "copy");
    sessionDescription = v17->_sessionDescription;
    v17->_sessionDescription = (NSString *)v18;

    v20 = dispatch_group_create();
    initializationGroup = v17->_initializationGroup;
    v17->_initializationGroup = (OS_dispatch_group *)v20;

    dispatch_group_enter((dispatch_group_t)v17->_initializationGroup);
    v22 = dispatch_queue_create("TSUDownloadManager.Access", 0);
    accessQueue = v17->_accessQueue;
    v17->_accessQueue = (OS_dispatch_queue *)v22;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v15, "delegateQueueForDownloadSession:", v17);
      v24 = objc_claimAutoreleasedReturnValue();
      p_delegateQueue = (id *)&v17->_delegateQueue;
      delegateQueue = v17->_delegateQueue;
      v17->_delegateQueue = (OS_dispatch_queue *)v24;
    }
    else
    {
      p_delegateQueue = (id *)&v17->_delegateQueue;
      delegateQueue = v17->_delegateQueue;
      v17->_delegateQueue = 0;
    }

    if (!*p_delegateQueue)
      objc_storeStrong(p_delegateQueue, MEMORY[0x24BDAC9B8]);
    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    remainingTasks = v17->_remainingTasks;
    v17->_remainingTasks = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    taskProgress = v17->_taskProgress;
    v17->_taskProgress = v29;

    v31 = dispatch_group_create();
    completionGroup = v17->_completionGroup;
    v17->_completionGroup = (OS_dispatch_group *)v31;

    v33 = -[TSUBasicProgress initWithMaxValue:]([TSUBasicProgress alloc], "initWithMaxValue:", 1.0);
    progress = v17->_progress;
    v17->_progress = v33;

    v54 = v12;
    v51 = v15;
    v52 = v14;
    if ((_DWORD)v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = objc_msgSend(v15, "downloadSessionShouldSendHeadRequestForEstimatedTotalBytes:", v17);
      else
        v8 = 0;
    }
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v53 = v13;
    obj = v13;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v35)
    {
      v36 = v35;
      v37 = 0x24D619000uLL;
      v38 = *(_QWORD *)v58;
      v55 = v17;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v58 != v38)
            objc_enumerationMutation(obj);
          v40 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          v41 = objc_alloc_init(*(Class *)(v37 + 4072));
          objc_msgSend(v41, "setIsActive:", 1);
          objc_msgSend(v41, "setTotalBytesExpectedToBeDownloaded:", objc_msgSend(v40, "totalBytesExpectedToBeDownloaded"));
          if ((_DWORD)v8 && !objc_msgSend(v41, "totalBytesExpectedToBeDownloaded"))
            -[TSUDownloadSession headRequestForDownloadItem:taskProgress:](v17, "headRequestForDownloadItem:taskProgress:", v40, v41);
          v17->_totalBytesExpectedToBeDownloaded += objc_msgSend(v41, "totalBytesExpectedToBeDownloaded");
          objc_msgSend(v40, "downloadTaskDescription");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v42)
          {
            +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
            v43 = v36;
            v44 = v38;
            v45 = v8;
            v46 = v37;
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDownloadSession initWithManager:downloadItems:description:willRequestDownload:delegate:]");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDownloadSession.m");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, v49, 208, CFSTR("invalid nil value for '%s'"), "taskDescription");

            v37 = v46;
            v8 = v45;
            v38 = v44;
            v36 = v43;
            v17 = v55;
          }
          -[NSMutableSet addObject:](v17->_remainingTasks, "addObject:", v42);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v17->_taskProgress, "setObject:forKeyedSubscript:", v41, v42);
          dispatch_group_enter((dispatch_group_t)v17->_completionGroup);

        }
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v36);
    }

    v13 = v53;
    v12 = v54;
    v15 = v51;
    v14 = v52;
  }

  return v17;
}

- (void)headRequestForDownloadItem:(id)a3 taskProgress:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  objc_msgSend(a3, "downloadURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isFileURL") & 1) == 0)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v7);
    objc_msgSend(v8, "setHTTPMethod:", CFSTR("HEAD"));
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("close"), CFSTR("Connection"));
    objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62__TSUDownloadSession_headRequestForDownloadItem_taskProgress___block_invoke;
    v11[3] = &unk_24D61B6F8;
    v12 = v5;
    v10 = (id)objc_msgSend(v9, "dataTaskWithRequest:completionHandler:", v8, v11);

  }
}

void __62__TSUDownloadSession_headRequestForDownloadItem_taskProgress___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = v6;
  if (!a4)
  {
    v9 = v6;
    v8 = objc_msgSend(v6, "expectedContentLength");
    v7 = v9;
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "setTotalBytesExpectedToBeDownloaded:", objc_msgSend(v9, "expectedContentLength"));
      v7 = v9;
    }
  }

}

- (void)didFinishInitialization
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_didFinishInitialization)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDownloadSession didFinishInitialization]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDownloadSession.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 238, CFSTR("%@ was invoked more than once."), v7);

  }
  self->_didFinishInitialization = 1;
  dispatch_group_leave((dispatch_group_t)self->_initializationGroup);
}

- (BOOL)hasActiveTaskWithDescription:(id)a3
{
  void *v3;
  char v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_taskProgress, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  return v4;
}

- (void)taskWithDescription:(id)a3 didCompleteWithError:(id)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *accessQueue;
  _QWORD block[5];
  id v15;
  id v16;

  v10 = a3;
  v11 = a4;
  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_taskProgress, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[TSUDownloadSession updateTaskProgress:withTotalBytesWritten:totalBytesExpectedToWrite:](self, "updateTaskProgress:withTotalBytesWritten:totalBytesExpectedToWrite:", v12, a5, a6);
      objc_msgSend(v12, "setIsActive:", 0);
      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __107__TSUDownloadSession_taskWithDescription_didCompleteWithError_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
      block[3] = &unk_24D61B748;
      block[4] = self;
      v15 = v10;
      v16 = v11;
      dispatch_async(accessQueue, block);

    }
  }

}

void __107__TSUDownloadSession_taskWithDescription_didCompleteWithError_totalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  char v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v2 + 104))
    {
      objc_storeStrong((id *)(v2 + 104), *(id *)(a1 + 48));
      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v2 + 64), "removeObject:", *(_QWORD *)(a1 + 40));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
      v4 = objc_opt_respondsToSelector();

      if ((v4 & 1) != 0)
      {
        v5 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(NSObject **)(v6 + 88);
        v8 = *(NSObject **)(v6 + 56);
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __107__TSUDownloadSession_taskWithDescription_didCompleteWithError_totalBytesWritten_totalBytesExpectedToWrite___block_invoke_2;
        v10[3] = &unk_24D61B720;
        v10[4] = v6;
        v11 = v5;
        v9 = v5;
        dispatch_group_async(v7, v8, v10);

      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 88));
  }
}

void __107__TSUDownloadSession_taskWithDescription_didCompleteWithError_totalBytesWritten_totalBytesExpectedToWrite___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "downloadSession:didCompleteWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)taskWithDescription:(id)a3 didWriteData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  id v9;

  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_taskProgress, "objectForKeyedSubscript:", a3, a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[TSUDownloadSession updateTaskProgress:withTotalBytesWritten:totalBytesExpectedToWrite:](self, "updateTaskProgress:withTotalBytesWritten:totalBytesExpectedToWrite:", v9, a5, a6);

  }
}

- (void)updateTaskProgress:(id)a3 withTotalBytesWritten:(int64_t)a4 totalBytesExpectedToWrite:(int64_t)a5
{
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "isActive"))
  {
    if (a4 == a5)
    {
      a5 = a4;
      if (objc_msgSend(v9, "totalBytesExpectedToBeDownloaded") >= a4)
      {
        a4 = objc_msgSend(v9, "totalBytesExpectedToBeDownloaded");
        a5 = a4;
      }
    }
    else
    {
      v8 = v9;
      if (!a4)
      {
LABEL_7:
        objc_msgSend(v8, "setTotalBytesExpectedToBeDownloaded:", a5);
        -[TSUDownloadSession updateProgressAndNotifyDelegate](self, "updateProgressAndNotifyDelegate");
        goto LABEL_8;
      }
    }
    objc_msgSend(v9, "setTotalBytesDownloaded:", a4);
    v8 = v9;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)updateProgressAndNotifyDelegate
{
  NSMutableDictionary *taskProgress;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  double v8;
  id WeakRetained;
  char v10;
  NSObject *delegateQueue;
  _QWORD block[7];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  taskProgress = self->_taskProgress;
  v4 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__TSUDownloadSession_updateProgressAndNotifyDelegate__block_invoke;
  v13[3] = &unk_24D61B770;
  v13[4] = &v18;
  v13[5] = &v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](taskProgress, "enumerateKeysAndObjectsUsingBlock:", v13);
  v5 = v19;
  self->_totalBytesDownloaded = v19[3];
  v6 = v15;
  self->_totalBytesExpectedToBeDownloaded = v15[3];
  v7 = v6[3];
  if (v7 < 1)
    v8 = 0.0;
  else
    v8 = (double)v5[3] / (double)v7;
  if (self->_lastProgressValue < v8)
  {
    self->_lastProgressValue = v8;
    -[TSUBasicProgress setValue:](self->_progress, "setValue:");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __53__TSUDownloadSession_updateProgressAndNotifyDelegate__block_invoke_2;
    block[3] = &unk_24D61B798;
    block[4] = self;
    block[5] = &v18;
    block[6] = &v14;
    dispatch_async(delegateQueue, block);
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

void __53__TSUDownloadSession_updateProgressAndNotifyDelegate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;

  v4 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v4, "totalBytesDownloaded");
  v5 = objc_msgSend(v4, "totalBytesExpectedToBeDownloaded");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v5;
}

void __53__TSUDownloadSession_updateProgressAndNotifyDelegate__block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_msgSend(WeakRetained, "downloadSession:didDownloadData:totalBytesExpectedToBeDownloaded:", a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));

}

- (void)cancelRemainingTasksNotifyingDelegate:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  NSError *v7;
  NSError *error;
  id WeakRetained;
  char v10;
  NSError *v11;
  NSObject *completionGroup;
  NSObject *delegateQueue;
  NSError *v14;
  NSMutableSet *remainingTasks;
  _QWORD v16[5];
  NSError *v17;

  v3 = a3;
  v5 = -[NSMutableSet count](self->_remainingTasks, "count");
  if (v5)
  {
    v6 = v5;
    if (self->_error)
    {
      if (v3)
      {
LABEL_6:
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v10 = objc_opt_respondsToSelector();

        if ((v10 & 1) != 0)
        {
          v11 = self->_error;
          completionGroup = self->_completionGroup;
          delegateQueue = self->_delegateQueue;
          v16[0] = MEMORY[0x24BDAC760];
          v16[1] = 3221225472;
          v16[2] = __60__TSUDownloadSession_cancelRemainingTasksNotifyingDelegate___block_invoke;
          v16[3] = &unk_24D61B720;
          v16[4] = self;
          v17 = v11;
          v14 = v11;
          dispatch_group_async(completionGroup, delegateQueue, v16);

        }
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -999, 0);
      v7 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v7;

      if (v3)
        goto LABEL_6;
    }
    do
    {
LABEL_8:
      dispatch_group_leave((dispatch_group_t)self->_completionGroup);
      --v6;
    }
    while (v6);
  }
  remainingTasks = self->_remainingTasks;
  self->_remainingTasks = 0;

}

void __60__TSUDownloadSession_cancelRemainingTasksNotifyingDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "downloadSession:didCompleteWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (NSString)sessionDescription
{
  return self->_sessionDescription;
}

- (TSUProgress)progress
{
  return &self->_progress->super;
}

- (int64_t)totalBytesDownloaded
{
  return self->_totalBytesDownloaded;
}

- (int64_t)totalBytesExpectedToBeDownloaded
{
  return self->_totalBytesExpectedToBeDownloaded;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDescription, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong((id *)&self->_taskProgress, 0);
  objc_storeStrong((id *)&self->_remainingTasks, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_initializationGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_manager);
}

@end
