@implementation TraceRouteLoadingTask

- (TraceRouteLoadingTask)initWithTracePath:(id)a3
{
  id v5;
  TraceRouteLoadingTask *v6;
  TraceRouteLoadingTask *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  id v12;
  const char *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *isolationQueue;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TraceRouteLoadingTask;
  v6 = -[TraceRouteLoadingTask init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tracePath, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.isolationQueue.%p"), v9, objc_opt_class(v7), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    v12 = objc_retainAutorelease(v11);
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create(v13, v15);
    isolationQueue = v7->_isolationQueue;
    v7->_isolationQueue = (OS_dispatch_queue *)v16;

  }
  return v7;
}

- (BOOL)inProgress
{
  TraceRouteLoadingTask *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  v3 = objc_claimAutoreleasedReturnValue(-[TraceRouteLoadingTask isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_not_V2(v3);

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v4 = objc_claimAutoreleasedReturnValue(-[TraceRouteLoadingTask isolationQueue](v2, "isolationQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C3C5CC;
  v6[3] = &unk_1011ADF48;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (Result)result
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = objc_claimAutoreleasedReturnValue(-[TraceRouteLoadingTask isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100C3C6FC;
  v12 = sub_100C3C70C;
  v13 = 0;
  v4 = objc_claimAutoreleasedReturnValue(-[TraceRouteLoadingTask isolationQueue](self, "isolationQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100C3C714;
  v7[3] = &unk_1011ADF48;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (Result *)v5;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[TraceRouteLoadingTask isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_not_V2(v5);

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v6 = objc_claimAutoreleasedReturnValue(-[TraceRouteLoadingTask isolationQueue](self, "isolationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C3C890;
  block[3] = &unk_1011ADF48;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v6, block);

  if (!*((_BYTE *)v12 + 24))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[TraceRouteLoadingTask isolationQueue](self, "isolationQueue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100C3C8EC;
    v8[3] = &unk_1011AE240;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
  _Block_object_dispose(&v11, 8);

}

- (void)cancel
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[TraceRouteLoadingTask isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_not_V2(v3);

  v4 = objc_claimAutoreleasedReturnValue(-[TraceRouteLoadingTask isolationQueue](self, "isolationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C3CE84;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (unint64_t)taskState
{
  return self->_taskState;
}

- (void)setTaskState:(unint64_t)a3
{
  self->_taskState = a3;
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (Result)resultOnIsolationQueue
{
  return self->_resultOnIsolationQueue;
}

- (void)setResultOnIsolationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultOnIsolationQueue, a3);
}

- (MNNavigationServiceDirectionsRequestTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
  objc_storeStrong((id *)&self->_ticket, a3);
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (void)setTracePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_resultOnIsolationQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
