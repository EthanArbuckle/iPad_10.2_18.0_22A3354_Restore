@implementation PCSDelayedAction

- (PCSDelayedAction)initWithLabel:(id)a3 delay:(unint64_t)a4 operationQueue:(id)a5
{
  id v8;
  id v9;
  PCSDelayedAction *v10;
  PCSDelayedAction *v11;
  id v12;
  NSObject *v13;
  dispatch_source_t v14;
  OS_dispatch_source *waitSource;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v8 = a3;
  v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PCSDelayedAction;
  v10 = -[PCSDelayedAction init](&v21, "init");
  v11 = v10;
  if (v10)
  {
    -[PCSDelayedAction setLabel:](v10, "setLabel:", v8);
    objc_initWeak(&location, v11);
    objc_storeStrong((id *)&v11->_operationQueue, a5);
    v11->_delayInSeconds = a4;
    v12 = sub_10000FDD4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_add, 0, 0, v13);
    waitSource = v11->_waitSource;
    v11->_waitSource = (OS_dispatch_source *)v14;

    v16 = v11->_waitSource;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000FE14;
    v18[3] = &unk_100018960;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v16, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)setAction:(id)a3
{
  id v4;
  id actionOnTrigger;

  if (!self->_running)
  {
    v4 = objc_retainBlock(a3);
    actionOnTrigger = self->_actionOnTrigger;
    self->_actionOnTrigger = v4;

  }
}

- (void)run
{
  self->_running = 1;
  dispatch_resume((dispatch_object_t)self->_waitSource);
}

- (void)setHoldTransaction:(BOOL)a3
{
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  v5 = sub_10000FDD4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000100E4;
  v7[3] = &unk_100018E28;
  v7[4] = self;
  v8 = a3;
  dispatch_sync(v6, v7);

}

- (void)trigger
{
  id v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = sub_10000FDD4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000101A4;
  block[3] = &unk_100018D10;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)actionOnTrigger
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setActionOnTrigger:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (unint64_t)delayInSeconds
{
  return self->_delayInSeconds;
}

- (void)setDelayInSeconds:(unint64_t)a3
{
  self->_delayInSeconds = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_source)waitSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWaitSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_os_transaction)pendingTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPendingTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (int64_t)noTransaction
{
  return self->_noTransaction;
}

- (void)setNoTransaction:(int64_t)a3
{
  self->_noTransaction = a3;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTransaction, 0);
  objc_storeStrong((id *)&self->_waitSource, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_actionOnTrigger, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
