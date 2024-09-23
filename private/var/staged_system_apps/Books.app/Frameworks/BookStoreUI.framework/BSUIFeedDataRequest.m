@implementation BSUIFeedDataRequest

- (BSUIFeedDataRequest)init
{
  BSUIFeedDataRequest *v2;
  uint64_t v3;
  NSMutableArray *operationsArray;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BSUIFeedDataRequest;
  v2 = -[BSUIFeedDataRequest init](&v10, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    operationsArray = v2->_operationsArray;
    v2->_operationsArray = (NSMutableArray *)v3;

    LODWORD(v2->_priority) = TUIPriorityDefault;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("BSUIFeedDataRequest.accessQueue", v6);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)addOperation:(id)a3
{
  NSObject *accessQueue;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[BSUIFeedDataRequest priority](self, "priority");
    objc_msgSend(v5, "setPriority:");
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_326B4;
    block[3] = &unk_2E40C8;
    block[4] = self;
    v7 = v5;
    dispatch_barrier_sync(accessQueue, block);

  }
}

- (NSArray)operations
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_327A0;
  v11 = sub_327B0;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[BSUIFeedDataRequest accessQueue](self, "accessQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_327B8;
  v6[3] = &unk_2E42F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)cancelRequest
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedDataRequest operations](self, "operations", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "cancel");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setPriority:(float)a3
{
  void *v4;
  id v5;
  double v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  self->_priority = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedDataRequest operations](self, "operations", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v4);
        *(float *)&v6 = a3;
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setPriority:", v6);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (float)priority
{
  return self->_priority;
}

- (NSMutableArray)operationsArray
{
  return self->_operationsArray;
}

- (void)setOperationsArray:(id)a3
{
  objc_storeStrong((id *)&self->_operationsArray, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_operationsArray, 0);
}

@end
