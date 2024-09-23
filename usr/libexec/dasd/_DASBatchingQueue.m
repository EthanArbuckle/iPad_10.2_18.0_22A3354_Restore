@implementation _DASBatchingQueue

- (void)addWorkItem:(id)a3
{
  id v4;
  OS_dispatch_queue *syncQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008338;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)syncQueue, block);

}

- (_DASBatchingQueue)initWithName:(id)a3 maxBatchingDelay:(double)a4 maxQueueDepth:(unint64_t)a5 queue:(id)a6 workItemsHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  _DASBatchingQueue *v15;
  _DASBatchingQueue *v16;
  unint64_t v17;
  id v18;
  id workHandler;
  uint64_t v20;
  NSMutableArray *workItems;
  dispatch_queue_attr_t v22;
  NSObject *v23;
  dispatch_queue_t v24;
  id v25;
  const char *v26;
  OS_dispatch_queue *executionQueue;
  id v28;
  const char *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *syncQueue;
  dispatch_source_t v32;
  OS_dispatch_source *timer;
  NSObject *v34;
  NSObject *v35;
  dispatch_time_t v36;
  _QWORD handler[4];
  _DASBatchingQueue *v39;
  objc_super v40;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v40.receiver = self;
  v40.super_class = (Class)_DASBatchingQueue;
  v15 = -[_DASBatchingQueue init](&v40, "init");
  v16 = v15;
  if (v15)
  {
    v15->_maxDelay = a4;
    v17 = 4;
    if (a5)
      v17 = a5;
    v15->_maxQueueDepth = v17;
    v18 = objc_retainBlock(v14);
    workHandler = v16->_workHandler;
    v16->_workHandler = v18;

    v20 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    workItems = v16->_workItems;
    v16->_workItems = (NSMutableArray *)v20;

    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (v13)
    {
      v24 = (dispatch_queue_t)v13;
    }
    else
    {
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.dasbatchingqueue.executionqueue.%s"), objc_msgSend(objc_retainAutorelease(v12), "UTF8String"))));
      v26 = (const char *)objc_msgSend(v25, "UTF8String");

      v24 = dispatch_queue_create(v26, v23);
    }
    executionQueue = v16->_executionQueue;
    v16->_executionQueue = (OS_dispatch_queue *)v24;

    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.dasbatchingqueue.syncqueue.%s"), objc_msgSend(objc_retainAutorelease(v12), "UTF8String"))));
    v29 = (const char *)objc_msgSend(v28, "UTF8String");

    v30 = dispatch_queue_create(v29, v23);
    syncQueue = v16->_syncQueue;
    v16->_syncQueue = (OS_dispatch_queue *)v30;

    v32 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v16->_syncQueue);
    timer = v16->_timer;
    v16->_timer = (OS_dispatch_source *)v32;

    dispatch_set_qos_class_fallback(v16->_timer, 17);
    v34 = v16->_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000351CC;
    handler[3] = &unk_10015D4E0;
    v39 = v16;
    dispatch_source_set_event_handler(v34, handler);
    v35 = v16->_timer;
    v36 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    dispatch_source_set_timer(v35, v36, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a4 / 10.0 * 1000000000.0));

  }
  return v16;
}

+ (id)queueWithName:(id)a3 maxBatchingDelay:(double)a4 maxQueueDepth:(unint64_t)a5 queue:(id)a6 workItemsHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;

  v12 = a7;
  v13 = a6;
  v14 = a3;
  v15 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:", v14, a5, v13, v12, a4);

  return v15;
}

- (void)unprotectedExecuteWorkItems
{
  void *v3;
  void *v4;
  OS_dispatch_queue *executionQueue;
  _QWORD block[4];
  id v7;
  _DASBatchingQueue *v8;
  id v9;

  v3 = (void *)os_transaction_create("com.apple.dasd.batchingQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->_workItems));
  if (objc_msgSend(v4, "count"))
  {
    executionQueue = self->_executionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100035338;
    block[3] = &unk_10015D530;
    v7 = v3;
    v8 = self;
    v9 = v4;
    dispatch_async((dispatch_queue_t)executionQueue, block);
    -[NSMutableArray removeAllObjects](self->_workItems, "removeAllObjects");
    dispatch_suspend((dispatch_object_t)self->_timer);

  }
}

- (void)addWorkItems:(id)a3
{
  id v4;
  OS_dispatch_queue *syncQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000353C4;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)syncQueue, block);

}

- (double)maxDelay
{
  return self->_maxDelay;
}

- (void)setMaxDelay:(double)a3
{
  self->_maxDelay = a3;
}

- (unint64_t)maxQueueDepth
{
  return self->_maxQueueDepth;
}

- (void)setMaxQueueDepth:(unint64_t)a3
{
  self->_maxQueueDepth = a3;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_executionQueue, a3);
}

- (id)workHandler
{
  return self->_workHandler;
}

- (void)setWorkHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableArray)workItems
{
  return self->_workItems;
}

- (void)setWorkItems:(id)a3
{
  objc_storeStrong((id *)&self->_workItems, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_workItems, 0);
  objc_storeStrong(&self->_workHandler, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end
