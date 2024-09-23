@implementation WPAdvertisingRequestsQueue

- (WPAdvertisingRequestsQueue)init
{
  WPAdvertisingRequestsQueue *v2;
  uint64_t v3;
  NSMutableArray *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WPAdvertisingRequestsQueue;
  v2 = -[WPAdvertisingRequestsQueue init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)add:(id)a3
{
  WPAdvertisingRequestsQueue *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[WPAdvertisingRequestsQueue queue](v4, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[WPAdvertisingRequestsQueue queue](v4, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[WPAdvertisingRequestsQueue queue](v4, "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, objc_msgSend(v8, "count"), 1024, &__block_literal_global_8);

    -[WPAdvertisingRequestsQueue queue](v4, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertObject:atIndex:", v10, v9);
  }
  else
  {
    objc_msgSend(v7, "addObject:", v10);
  }

  objc_sync_exit(v4);
}

uint64_t __34__WPAdvertisingRequestsQueue_add___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)remove:(id)a3
{
  WPAdvertisingRequestsQueue *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[WPAdvertisingRequestsQueue queue](v4, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_sync_exit(v4);
}

- (void)removeRequestsOfClientType:(unsigned __int8)a3
{
  void *v4;
  WPAdvertisingRequestsQueue *obj;
  _QWORD v6[5];
  unsigned __int8 v7;

  obj = self;
  objc_sync_enter(obj);
  -[WPAdvertisingRequestsQueue queue](obj, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__WPAdvertisingRequestsQueue_removeRequestsOfClientType___block_invoke;
  v6[3] = &unk_24D7C4120;
  v7 = a3;
  v6[4] = obj;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  objc_sync_exit(obj);
}

void __57__WPAdvertisingRequestsQueue_removeRequestsOfClientType___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  if (objc_msgSend(a2, "clientType") == *(unsigned __int8 *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectAtIndex:", a3);

  }
}

- (BOOL)isAdvertisingForClientType:(unsigned __int8)a3
{
  WPAdvertisingRequestsQueue *v4;
  void *v5;
  _QWORD v7[5];
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v4 = self;
  objc_sync_enter(v4);
  -[WPAdvertisingRequestsQueue queue](v4, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__WPAdvertisingRequestsQueue_isAdvertisingForClientType___block_invoke;
  v7[3] = &unk_24D7C4148;
  v8 = a3;
  v7[4] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  objc_sync_exit(v4);
  LOBYTE(v4) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v4;
}

uint64_t __57__WPAdvertisingRequestsQueue_isAdvertisingForClientType___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "clientType");
  if ((_DWORD)result == *(unsigned __int8 *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)removeAll
{
  void *v2;
  WPAdvertisingRequestsQueue *obj;

  obj = self;
  objc_sync_enter(obj);
  -[WPAdvertisingRequestsQueue queue](obj, "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_sync_exit(obj);
}

- (id)allRequests
{
  WPAdvertisingRequestsQueue *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[WPAdvertisingRequestsQueue queue](v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  return v4;
}

- (unint64_t)count
{
  WPAdvertisingRequestsQueue *v2;
  void *v3;
  unint64_t v4;

  v2 = self;
  objc_sync_enter(v2);
  -[WPAdvertisingRequestsQueue queue](v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_sync_exit(v2);
  return v4;
}

- (NSMutableArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableSet)clientTypes
{
  return self->_clientTypes;
}

- (void)setClientTypes:(id)a3
{
  objc_storeStrong((id *)&self->_clientTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientTypes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
