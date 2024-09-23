@implementation CHRemoteRequestHandlerBase

- (CHRemoteRequestHandlerBase)initWithServerQueue:(id)a3 lowPriorityQueue:(id)a4 highPriorityQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  CHRemoteRequestHandlerBase *v12;
  CHRemoteRequestHandlerBase *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CHRemoteRequestHandlerBase;
  v12 = -[CHRemoteRequestHandlerBase init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serverQueue, a3);
    objc_storeStrong((id *)&v13->_lowPriorityQueue, a4);
    objc_storeStrong((id *)&v13->_highPriorityQueue, a5);
  }

  return v13;
}

- (void)setDirty
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;

  if (!self->_transaction)
  {
    v3 = (OS_os_transaction *)os_transaction_create("com.apple.handwritingd.requestHandling", a2);
    transaction = self->_transaction;
    self->_transaction = v3;

  }
}

- (void)setIdle
{
  OS_os_transaction *transaction;

  transaction = self->_transaction;
  self->_transaction = 0;

}

+ (BOOL)_hasIdleLifetimeElapsed:(double)a3 targetIdleLifetime:(double)a4
{
  double v6;

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  return v6 - a3 > a4 + -1.0;
}

- (void)_stageEvictionOfResourceWithTargetLifetime:(double)a3 block:(id)a4
{
  id v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v6 = a4;
  v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v8 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase serverQueue](self, "serverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BEA4;
  block[3] = &unk_100024AE8;
  v11 = v6;
  v9 = v6;
  dispatch_after(v7, v8, block);

}

- (OS_dispatch_queue)serverQueue
{
  return self->_serverQueue;
}

- (OS_dispatch_queue)lowPriorityQueue
{
  return self->_lowPriorityQueue;
}

- (OS_dispatch_queue)highPriorityQueue
{
  return self->_highPriorityQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highPriorityQueue, 0);
  objc_storeStrong((id *)&self->_lowPriorityQueue, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
