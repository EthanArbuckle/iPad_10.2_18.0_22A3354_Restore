@implementation TPSOperationQueue

- (void)setCompletionBlock:(id)a3
{
  void *v4;
  TPSOperationQueueCountObserver *observer;
  TPSOperationQueueCountObserver *v6;
  TPSOperationQueueCountObserver *v7;
  id v8;

  v8 = a3;
  -[TPSOperationQueueCountObserver completionBlock](self->_observer, "completionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[TPSOperationQueue removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self->_observer, CFSTR("operationCount"));
  if (v8)
  {
    observer = self->_observer;
    if (!observer)
    {
      v6 = -[TPSOperationQueueCountObserver initWithQueue:]([TPSOperationQueueCountObserver alloc], "initWithQueue:", self);
      v7 = self->_observer;
      self->_observer = v6;

      observer = self->_observer;
    }
    -[TPSOperationQueue addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", observer, CFSTR("operationCount"), 1, 0);
  }
  -[TPSOperationQueueCountObserver setCompletionBlock:](self->_observer, "setCompletionBlock:", v8);

}

- (id)completionBlock
{
  return -[TPSOperationQueueCountObserver completionBlock](self->_observer, "completionBlock");
}

- (void)addOperationWithAsyncBlock:(id)a3
{
  id v4;
  TPSAsyncBlockOperation *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[TPSAsyncBlockOperation initWithAsyncBlock:]([TPSAsyncBlockOperation alloc], "initWithAsyncBlock:", v4);

    -[TPSOperationQueue addOperation:](self, "addOperation:", v5);
  }
}

- (TPSOperationQueueCountObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
