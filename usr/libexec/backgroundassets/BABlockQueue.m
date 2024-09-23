@implementation BABlockQueue

- (BABlockQueue)initWithIdentifier:(id)a3
{
  id v5;
  BABlockQueue *v6;
  BABlockQueue *v7;
  NSMutableOrderedSet *v8;
  NSMutableOrderedSet *blockQueue;
  NSLock *v10;
  NSLock *blockQueueLock;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BABlockQueue;
  v6 = -[BABlockQueue init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = objc_opt_new(NSMutableOrderedSet);
    blockQueue = v7->_blockQueue;
    v7->_blockQueue = v8;

    v10 = objc_opt_new(NSLock);
    blockQueueLock = v7->_blockQueueLock;
    v7->_blockQueueLock = v10;

    v7->_awaitingBlockCompletion = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[BABlockQueue drain](self, "drain");
  v3.receiver = self;
  v3.super_class = (Class)BABlockQueue;
  -[BABlockQueue dealloc](&v3, "dealloc");
}

- (id)__enqueue:(id)a3
{
  id v4;
  BABlock *v5;
  BABlock *v6;
  BABlock *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = 0;
  do
  {
    v6 = v5;
    v7 = [BABlock alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v5 = -[BABlock initWithToken:block:](v7, "initWithToken:block:", v8, v4);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueue](self, "blockQueue"));
    LOBYTE(v6) = objc_msgSend(v9, "containsObject:", v5);

  }
  while ((v6 & 1) != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueue](self, "blockQueue"));
  objc_msgSend(v10, "addObject:", v5);

  return v5;
}

- (void)enqueue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueueLock](self, "blockQueueLock"));
  objc_msgSend(v4, "lock");

  v5 = -[BABlockQueue __enqueue:](self, "__enqueue:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueueLock](self, "blockQueueLock"));
  objc_msgSend(v6, "unlock");

  -[BABlockQueue _dequeueNext](self, "_dequeueNext");
}

- (void)enqueue:(id)a3 waitLimitDate:(id)a4
{
  void (**v6)(id, _QWORD, id);
  double v7;
  double v8;
  qos_class_t v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD handler[5];
  id v21;
  NSObject *v22;

  v6 = (void (**)(id, _QWORD, id))a3;
  objc_msgSend(a4, "timeIntervalSinceNow");
  if (v7 <= 0.0)
  {
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v6[2](v6, 0, v19);

  }
  else
  {
    v8 = v7;
    v9 = qos_class_self();
    global_queue = dispatch_get_global_queue(v9, 0);
    v11 = objc_claimAutoreleasedReturnValue(global_queue);
    v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueueLock](self, "blockQueueLock"));
    objc_msgSend(v13, "lock");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue __enqueue:](self, "__enqueue:", v6));
    objc_msgSend(v14, "setFireByTimer:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueueLock](self, "blockQueueLock"));
    objc_msgSend(v15, "unlock");

    v16 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    dispatch_source_set_timer(v12, v16, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001317C;
    handler[3] = &unk_100058E30;
    handler[4] = self;
    v21 = v14;
    v22 = v12;
    v17 = v12;
    v18 = v14;
    dispatch_source_set_event_handler(v17, handler);
    dispatch_resume(v17);
    -[BABlockQueue _dequeueNext](self, "_dequeueNext");

  }
}

- (void)_dequeueNext
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueueLock](self, "blockQueueLock"));
  objc_msgSend(v3, "lock");

  if (!-[BABlockQueue awaitingBlockCompletion](self, "awaitingBlockCompletion")
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueue](self, "blockQueue")),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5)
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueue](self, "blockQueue")),
        v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 0)),
        v6,
        v8))
  {
    -[BABlockQueue setAwaitingBlockCompletion:](self, "setAwaitingBlockCompletion:", 1);
    objc_msgSend(v8, "executeWithSuccessfulDequeue:", 1);
  }
  else
  {
    v8 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueueLock](self, "blockQueueLock"));
  objc_msgSend(v7, "unlock");

}

- (BOOL)consumeToken:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v6 = objc_opt_class(NSUUID, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_1000134A0;
    v23 = sub_1000134B0;
    v24 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueueLock](self, "blockQueueLock"));
    objc_msgSend(v7, "lock");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueue](self, "blockQueue"));
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1000134B8;
    v16 = &unk_100058E58;
    v17 = v4;
    v18 = &v19;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v13);

    if (v20[5])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueue](self, "blockQueue", v13, v14, v15, v16));
      objc_msgSend(v9, "removeObject:", v20[5]);

    }
    if (-[BABlockQueue awaitingBlockCompletion](self, "awaitingBlockCompletion", v13, v14, v15, v16))
      -[BABlockQueue setAwaitingBlockCompletion:](self, "setAwaitingBlockCompletion:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueueLock](self, "blockQueueLock"));
    objc_msgSend(v10, "unlock");

    -[BABlockQueue _dequeueNext](self, "_dequeueNext");
    v11 = v20[5] != 0;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    -[BABlockQueue _dequeueNext](self, "_dequeueNext");
    v11 = 0;
  }

  return v11;
}

- (BOOL)drainSpecificWithToken:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, _BYTE *);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v6 = objc_opt_class(NSUUID, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = sub_1000134A0;
    v24 = sub_1000134B0;
    v25 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueueLock](self, "blockQueueLock"));
    objc_msgSend(v7, "lock");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueue](self, "blockQueue"));
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_100013700;
    v17 = &unk_100058E58;
    v18 = v4;
    v19 = &v20;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v14);

    v9 = v21[5];
    v10 = v9 != 0;
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueue](self, "blockQueue", v14, v15, v16, v17));
      objc_msgSend(v11, "removeObject:", v21[5]);

      if (-[BABlockQueue awaitingBlockCompletion](self, "awaitingBlockCompletion"))
        -[BABlockQueue setAwaitingBlockCompletion:](self, "setAwaitingBlockCompletion:", 0);
      objc_msgSend((id)v21[5], "executeWithSuccessfulDequeue:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueueLock](self, "blockQueueLock"));
      objc_msgSend(v12, "unlock");
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueueLock](self, "blockQueueLock", v14, v15, v16, v17));
      objc_msgSend(v12, "unlock");
    }

    -[BABlockQueue _dequeueNext](self, "_dequeueNext");
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)drain
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueueLock](self, "blockQueueLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueue](self, "blockQueue"));
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &stru_100058E98);

  -[BABlockQueue setAwaitingBlockCompletion:](self, "setAwaitingBlockCompletion:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueue](self, "blockQueue"));
  objc_msgSend(v5, "removeAllObjects");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BABlockQueue blockQueueLock](self, "blockQueueLock"));
  objc_msgSend(v6, "unlock");

}

- (void)_increment
{
  ++self->_queueRetainCount;
}

- (void)_decrement
{
  unint64_t queueRetainCount;
  id v3;

  queueRetainCount = self->_queueRetainCount;
  if (!queueRetainCount)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("BABlockQueue retain count is being decremented past 0."), 0));
    objc_exception_throw(v3);
  }
  self->_queueRetainCount = queueRetainCount - 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)queueRetainCount
{
  return self->_queueRetainCount;
}

- (NSLock)blockQueueLock
{
  return self->_blockQueueLock;
}

- (NSMutableOrderedSet)blockQueue
{
  return self->_blockQueue;
}

- (BOOL)awaitingBlockCompletion
{
  return self->_awaitingBlockCompletion;
}

- (void)setAwaitingBlockCompletion:(BOOL)a3
{
  self->_awaitingBlockCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockQueue, 0);
  objc_storeStrong((id *)&self->_blockQueueLock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
