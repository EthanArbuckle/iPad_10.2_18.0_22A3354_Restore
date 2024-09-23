@implementation SUQueueSessionManager

- (id)beginDownloadManagerSessionWithManagerOptions:(id)a3
{
  NSObject *dispatchQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__48;
  v11 = __Block_byref_object_dispose__48;
  v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__SUQueueSessionManager_beginDownloadManagerSessionWithManagerOptions___block_invoke;
  block[3] = &unk_24DE7CA58;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __71__SUQueueSessionManager_beginDownloadManagerSessionWithManagerOptions___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  SUClientQueueSession *v6;
  id v7;

  v2 = (_QWORD *)a1[4];
  v3 = v2[2];
  if (!v3)
  {
    *(_QWORD *)(a1[4] + 16) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2 = (_QWORD *)a1[4];
    v3 = v2[2];
  }
  v4 = (void *)objc_msgSend(v2, "_queueSessionWithManagerOptions:fromArray:", a1[5], v3);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setCount:", objc_msgSend(v4, "count") + 1);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = objc_msgSend(v5, "queue");
  }
  else
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    {
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = objc_alloc(MEMORY[0x24BEB1E18]);
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "initWithManagerOptions:", a1[5]);
    }
    v6 = -[SUClientQueueSession initWithQueue:]([SUClientQueueSession alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
    -[SUClientQueueSession setManagerOptions:](v6, "setManagerOptions:", a1[5]);
    objc_msgSend(*(id *)(a1[4] + 16), "addObject:", v6);

    v7 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
  }
  return *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
}

- (id)_queueSessionWithManagerOptions:(id)a3 fromArray:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(a4);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if ((objc_msgSend((id)objc_msgSend(v10, "managerOptions"), "isEqual:", a3) & 1) != 0)
      return v10;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  objc_super v4;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  v4.receiver = self;
  v4.super_class = (Class)SUQueueSessionManager;
  -[SUQueueSessionManager dealloc](&v4, sel_dealloc);
}

- (SUQueueSessionManager)init
{
  SUQueueSessionManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUQueueSessionManager;
  v2 = -[SUQueueSessionManager init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.iTunesStoreUI.SUQueueSessionManager.%p"), v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);

  }
  return v2;
}

- (id)beginDownloadManagerSessionForDownloadKind:(id)a3
{
  NSObject *dispatchQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__48;
  v11 = __Block_byref_object_dispose__48;
  v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__SUQueueSessionManager_beginDownloadManagerSessionForDownloadKind___block_invoke;
  block[3] = &unk_24DE7CA58;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __68__SUQueueSessionManager_beginDownloadManagerSessionForDownloadKind___block_invoke(_QWORD *a1)
{
  void *v2;
  id result;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(a1[4] + 16);
  result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_msgSend(v7, "downloadKinds");
        if (!objc_msgSend(v8, "count"))
          v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "managerOptions"), "downloadKinds");
        if (objc_msgSend(v8, "containsObject:", a1[5]))
        {
          objc_msgSend(v7, "setCount:", objc_msgSend(v7, "count") + 1);
          result = (id)objc_msgSend(v7, "queue");
          *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
          return result;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (id)beginDownloadManagerSessionWithDownloadKinds:(id)a3
{
  id v5;
  id v6;

  v5 = objc_alloc_init(MEMORY[0x24BEB1E20]);
  objc_msgSend(v5, "setDownloadKinds:", a3);
  objc_msgSend(v5, "setPrefetchedDownloadProperties:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", *MEMORY[0x24BEB2360], *MEMORY[0x24BEB2410], 0));
  objc_msgSend(v5, "setPrefetchedDownloadExternalProperties:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", *MEMORY[0x24BEB2270], 0));
  v6 = -[SUQueueSessionManager beginDownloadManagerSessionWithManagerOptions:](self, "beginDownloadManagerSessionWithManagerOptions:", v5);

  return v6;
}

- (id)beginPreorderManagerSessionWithItemKinds:(id)a3
{
  NSObject *dispatchQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__48;
  v11 = __Block_byref_object_dispose__48;
  v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__SUQueueSessionManager_beginPreorderManagerSessionWithItemKinds___block_invoke;
  block[3] = &unk_24DE7CA58;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __66__SUQueueSessionManager_beginPreorderManagerSessionWithItemKinds___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  SUClientQueueSession *v6;

  v2 = (_QWORD *)a1[4];
  v3 = v2[3];
  if (!v3)
  {
    *(_QWORD *)(a1[4] + 24) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2 = (_QWORD *)a1[4];
    v3 = v2[3];
  }
  v4 = (void *)objc_msgSend(v2, "_queueSessionWithDownloadKinds:fromArray:", a1[5], v3);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setCount:", objc_msgSend(v4, "count") + 1);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = (id)objc_msgSend(v5, "queue");
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x24BEB1F58]), "initWithItemKinds:", a1[5]);
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    {
      v6 = -[SUClientQueueSession initWithQueue:]([SUClientQueueSession alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
      -[SUClientQueueSession setDownloadKinds:](v6, "setDownloadKinds:", a1[5]);
      objc_msgSend(*(id *)(a1[4] + 24), "addObject:", v6);

    }
  }
}

- (void)endDownloadManagerSessionForManager:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__SUQueueSessionManager_endDownloadManagerSessionForManager___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __61__SUQueueSessionManager_endDownloadManagerSessionForManager___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queueSessionWithQueue:fromArray:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "_endQueueSession:fromArray:", result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return result;
}

- (void)endPreorderManagerSessionWithManager:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__SUQueueSessionManager_endPreorderManagerSessionWithManager___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __62__SUQueueSessionManager_endPreorderManagerSessionWithManager___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queueSessionWithQueue:fromArray:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "_endQueueSession:fromArray:", result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  return result;
}

- (void)_endQueueSession:(id)a3 fromArray:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend(a3, "count");
  if (v6 < 2)
    objc_msgSend(a4, "removeObject:", a3);
  else
    objc_msgSend(a3, "setCount:", v6 - 1);
}

- (id)_queueSessionWithDownloadKinds:(id)a3 fromArray:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(a4);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if ((objc_msgSend((id)objc_msgSend(v10, "downloadKinds"), "isEqualToArray:", a3) & 1) != 0)
      return v10;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)_queueSessionWithQueue:(id)a3 fromArray:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(a4);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if ((id)objc_msgSend(v10, "queue") == a3)
      return v10;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

@end
