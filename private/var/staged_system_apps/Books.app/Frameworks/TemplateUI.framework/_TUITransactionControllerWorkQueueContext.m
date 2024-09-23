@implementation _TUITransactionControllerWorkQueueContext

- (_TUITransactionControllerWorkQueueContext)initWithQueue:(id)a3
{
  id v5;
  _TUITransactionControllerWorkQueueContext *v6;
  _TUITransactionControllerWorkQueueContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUITransactionControllerWorkQueueContext;
  v6 = -[_TUITransactionControllerWorkQueueContext init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (OS_dispatch_queue)workQueue
{
  return self->_queue;
}

- (OS_dispatch_queue)syncWorkQueue
{
  return self->_queue;
}

- (OS_dispatch_queue)foregroundWorkQueue
{
  return self->_queue;
}

- (OS_dispatch_queue)backgroundWorkQueue
{
  return self->_queue;
}

- (id)activeQueue
{
  return self->_queue;
}

- (id)activeCallbackQueue
{
  return dispatch_get_global_queue(2, 0);
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (BOOL)synchronousTransactionInProgress
{
  return self->_synchronousTransactionInProgress;
}

- (void)setSynchronousTransactionInProgress:(BOOL)a3
{
  self->_synchronousTransactionInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
