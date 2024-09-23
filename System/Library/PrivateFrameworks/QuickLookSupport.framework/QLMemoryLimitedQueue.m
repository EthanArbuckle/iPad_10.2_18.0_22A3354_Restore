@implementation QLMemoryLimitedQueue

- (QLMemoryLimitedQueue)initWithMaximumMemoryConsumption:(unint64_t)a3 maximumConcurrentTasks:(int)a4
{
  QLMemoryLimitedQueue *v6;
  QLMemoryLimitedQueue *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *serialQueue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *concurrentQueue;
  NSMutableArray *v14;
  NSMutableArray *tasks;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)QLMemoryLimitedQueue;
  v6 = -[QLMemoryLimitedQueue init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_maxSize = a3;
    v6->_currentTaskCount = 0;
    v6->_maxTaskCount = a4;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.quicklook.memorylimitedqueue.serial", v8);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.quicklook.memorylimitedqueue.concurrent", v11);
    concurrentQueue = v7->_concurrentQueue;
    v7->_concurrentQueue = (OS_dispatch_queue *)v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    tasks = v7->_tasks;
    v7->_tasks = v14;

  }
  return v7;
}

- (void)addTask:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__QLMemoryLimitedQueue_addTask___block_invoke;
  v7[3] = &unk_24C71AF38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

uint64_t __32__QLMemoryLimitedQueue_addTask___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "dequeueIfPossible");
}

- (void)executeTask:(id)a3
{
  id v4;
  uint64_t v5;
  int currentTaskCount;
  uint64_t v7;
  NSObject *v8;
  NSObject *concurrentQueue;
  id v10;
  _QWORD v11[4];
  id v12;
  QLMemoryLimitedQueue *v13;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v5 = objc_msgSend(v4, "expectedMemoryConsumption");
  currentTaskCount = self->_currentTaskCount;
  self->_currentSize += v5;
  self->_currentTaskCount = currentTaskCount + 1;
  v7 = MEMORY[0x24BDE5F50];
  v8 = *(NSObject **)(MEMORY[0x24BDE5F50] + 112);
  if (!v8)
  {
    QLTInitLogging();
    v8 = *(NSObject **)(v7 + 112);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[QLMemoryLimitedQueue executeTask:].cold.1(&self->_currentTaskCount, (uint64_t *)&self->_currentSize, v8);
  concurrentQueue = self->_concurrentQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __36__QLMemoryLimitedQueue_executeTask___block_invoke;
  v11[3] = &unk_24C71AF38;
  v12 = v4;
  v13 = self;
  v10 = v4;
  dispatch_async(concurrentQueue, v11);

}

void __36__QLMemoryLimitedQueue_executeTask___block_invoke(uint64_t a1)
{
  void (**v2)(void);
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "block");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(NSObject **)(v3 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__QLMemoryLimitedQueue_executeTask___block_invoke_2;
  v6[3] = &unk_24C71AF38;
  v6[4] = v3;
  v7 = v4;
  dispatch_async(v5, v6);

}

uint64_t __36__QLMemoryLimitedQueue_executeTask___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) -= objc_msgSend(*(id *)(a1 + 40), "expectedMemoryConsumption");
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
  return objc_msgSend(*(id *)(a1 + 32), "dequeueIfPossible");
}

- (void)dequeueIfPossible
{
  uint64_t v3;
  int v4;
  void *v5;
  unint64_t currentSize;
  uint64_t v7;
  unint64_t maxSize;
  _BOOL4 v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_currentTaskCount < self->_maxTaskCount && -[NSMutableArray count](self->_tasks, "count"))
  {
    v3 = 0;
    v4 = 0;
    do
    {
      if (self->_currentTaskCount >= self->_maxTaskCount)
        break;
      -[NSMutableArray objectAtIndex:](self->_tasks, "objectAtIndex:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      currentSize = self->_currentSize;
      v7 = objc_msgSend(v5, "expectedMemoryConsumption");
      maxSize = self->_maxSize;
      v9 = objc_msgSend(v5, "expectedMemoryConsumption") > maxSize && self->_currentTaskCount == 0;
      if (v7 + currentSize >= maxSize && !v9)
      {
        ++v4;
      }
      else
      {
        -[QLMemoryLimitedQueue executeTask:](self, "executeTask:", v5);
        -[NSMutableArray removeObjectAtIndex:](self->_tasks, "removeObjectAtIndex:", v3);
      }

      v3 = v4;
    }
    while (-[NSMutableArray count](self->_tasks, "count") > (unint64_t)v4);
  }
}

- (int)currentTaskCount
{
  NSObject *serialQueue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__QLMemoryLimitedQueue_currentTaskCount__block_invoke;
  v5[3] = &unk_24C71B2A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__QLMemoryLimitedQueue_currentTaskCount__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (unint64_t)currentSize
{
  NSObject *serialQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__QLMemoryLimitedQueue_currentSize__block_invoke;
  v5[3] = &unk_24C71B2A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__QLMemoryLimitedQueue_currentSize__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
}

- (void)executeTask:(os_log_t)log .cold.1(int *a1, uint64_t *a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 2048;
  v7 = v4;
  _os_log_debug_impl(&dword_20D4C7000, log, OS_LOG_TYPE_DEBUG, "Executing task, tasks in flight: %d, budget in flight: %zu bytes", (uint8_t *)v5, 0x12u);
}

@end
