@implementation RBEventQueue

uint64_t __28__RBEventQueue_batchModify___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)batchModify:(id)a3
{
  NSObject *queue;
  _BOOL4 dirtyDuringModify;
  void (**v6)(void);

  queue = self->_queue;
  v6 = (void (**)(void))a3;
  dispatch_assert_queue_V2(queue);
  if (self->_inModifyBlock)
  {
    v6[2]();

  }
  else
  {
    self->_inModifyBlock = 1;
    v6[2]();

    dirtyDuringModify = self->_dirtyDuringModify;
    *(_WORD *)&self->_inModifyBlock = 0;
    if (dirtyDuringModify)
      -[NSMutableArray sortUsingComparator:](self->_eventQueue, "sortUsingComparator:", &__block_literal_global_4);
    -[RBEventQueue _queue_startEventTimer]((uint64_t)self);
  }
}

- (NSArray)events
{
  return &self->_eventQueue->super;
}

- (void)_queue_startEventTimer
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a3;
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Event queue more than 5 seconds late, expected to fire at %f and it's now %f", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_1();
}

uint64_t __26__RBEventQueue_addEvents___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) = 1;
  return result;
}

- (void)addEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBEventQueue addEvents:](self, "addEvents:", v6, v7, v8);
}

- (void)addEvents:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __26__RBEventQueue_addEvents___block_invoke;
    v5[3] = &unk_24DD45FF0;
    v5[4] = self;
    v6 = v4;
    -[RBEventQueue batchModify:](self, "batchModify:", v5);

  }
}

uint64_t __29__RBEventQueue_removeEvents___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectsInArray:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 50) = 1;
  return result;
}

- (void)removeEvents:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __29__RBEventQueue_removeEvents___block_invoke;
    v5[3] = &unk_24DD45FF0;
    v5[4] = self;
    v6 = v4;
    -[RBEventQueue batchModify:](self, "batchModify:", v5);

  }
}

- (void)removeEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBEventQueue removeEvents:](self, "removeEvents:", v6, v7, v8);
}

- (void)_queue_processEvents
{
  OUTLINED_FUNCTION_1_3(&dword_21A8B4000, a1, a3, "Skipping _queue_processEvents - already in progress", a5, a6, a7, a8, 0);
}

- (RBEventQueue)initWithQueue:(id)a3 timeProvider:(id)a4
{
  id v7;
  id v8;
  RBEventQueue *v9;
  RBEventQueue *v10;
  uint64_t v11;
  NSMutableArray *eventQueue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RBEventQueue;
  v9 = -[RBEventQueue init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    eventQueue = v10->_eventQueue;
    v10->_eventQueue = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v10->_timeProvider, a4);
  }

  return v10;
}

- (unint64_t)count
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[NSMutableArray count](self->_eventQueue, "count");
}

- (RBEventQueueEvent)nextEvent
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return (RBEventQueueEvent *)-[NSMutableArray firstObject](self->_eventQueue, "firstObject");
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSMutableArray count](self->_eventQueue, "count");
  -[NSMutableArray componentsJoinedByString:](self->_eventQueue, "componentsJoinedByString:", CFSTR(",\n\t"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| eventCount:%lu events:[\n\t%@\n\t]>"), v4, v5, v6);

  return v7;
}

void __38__RBEventQueue__queue_startEventTimer__block_invoke(uint64_t a1)
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __38__RBEventQueue__queue_startEventTimer__block_invoke_2;
  activity_block[3] = &unk_24DD46160;
  activity_block[4] = *(_QWORD *)(a1 + 32);
  _os_activity_initiate(&dword_21A8B4000, "timer", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __38__RBEventQueue__queue_startEventTimer__block_invoke_2(uint64_t a1)
{
  -[RBEventQueue _queue_processEvents](*(_QWORD *)(a1 + 32));
}

void __38__RBEventQueue__queue_startEventTimer__block_invoke_7(uint64_t a1)
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __38__RBEventQueue__queue_startEventTimer__block_invoke_2_8;
  activity_block[3] = &unk_24DD46160;
  activity_block[4] = *(_QWORD *)(a1 + 32);
  _os_activity_initiate(&dword_21A8B4000, "timer", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __38__RBEventQueue__queue_startEventTimer__block_invoke_2_8(uint64_t a1)
{
  -[RBEventQueue _queue_processEvents](*(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEvent, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

@end
