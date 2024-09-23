@implementation STKAlertSessionEventQueue

- (STKAlertSessionEventQueue)init
{
  STKAlertSessionEventQueue *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STKAlertSessionEventQueue;
  v2 = -[STKAlertSessionEventQueue init](&v6, sel_init);
  if (v2)
  {
    v3 = BSDispatchQueueCreateWithQualityOfService();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)acquireEventQueueHaltingAssertionForReason:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *queue;
  id v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v15;
  _QWORD v16[5];

  v4 = (objc_class *)MEMORY[0x24BE0BE98];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __72__STKAlertSessionEventQueue_acquireEventQueueHaltingAssertionForReason___block_invoke;
  v16[3] = &unk_24D563388;
  v16[4] = self;
  v8 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("stk.telephony.eventQueueHaltingAssertion"), v5, v16);

  queue = self->_queue;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __72__STKAlertSessionEventQueue_acquireEventQueueHaltingAssertionForReason___block_invoke_3;
  block[3] = &unk_24D563120;
  block[4] = self;
  v10 = v8;
  v15 = v10;
  dispatch_async(queue, block);
  v11 = v15;
  v12 = v10;

  return v12;
}

void __72__STKAlertSessionEventQueue_acquireEventQueueHaltingAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__STKAlertSessionEventQueue_acquireEventQueueHaltingAssertionForReason___block_invoke_2;
  v7[3] = &unk_24D563120;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __72__STKAlertSessionEventQueue_acquireEventQueueHaltingAssertionForReason___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_queue_dequeueEventsIfPossible");
  return result;
}

uint64_t __72__STKAlertSessionEventQueue_acquireEventQueueHaltingAssertionForReason___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)enqueue:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__STKAlertSessionEventQueue_enqueue___block_invoke;
  v7[3] = &unk_24D5633B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __37__STKAlertSessionEventQueue_enqueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_enqueueEvent:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_enqueueEvent:(id)a3
{
  void *v4;
  NSMutableArray *queue_eventQueue;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v9 = a3;
  BSDispatchQueueAssert();
  v4 = v9;
  if (v9)
  {
    queue_eventQueue = self->_queue_eventQueue;
    if (!queue_eventQueue)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_queue_eventQueue;
      self->_queue_eventQueue = v6;

      queue_eventQueue = self->_queue_eventQueue;
    }
    v8 = (void *)MEMORY[0x2199F8930](v9);
    -[NSMutableArray addObject:](queue_eventQueue, "addObject:", v8);

    -[STKAlertSessionEventQueue _queue_dequeueEventsIfPossible](self, "_queue_dequeueEventsIfPossible");
    v4 = v9;
  }

}

- (void)_queue_dequeueEventsIfPossible
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *queue_eventQueue;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSMutableArray copy](self->_queue_eventQueue, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if (!-[NSMutableArray count](self->_queue_haltingAssertions, "count"))
        {
          (*(void (**)(uint64_t))(v8 + 16))(v8);
          queue_eventQueue = self->_queue_eventQueue;
          v10 = (void *)MEMORY[0x2199F8930](v8);
          -[NSMutableArray removeObject:](queue_eventQueue, "removeObject:", v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_eventQueue, 0);
  objc_storeStrong((id *)&self->_queue_haltingAssertions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
