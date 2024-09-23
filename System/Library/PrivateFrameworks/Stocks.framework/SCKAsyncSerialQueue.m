@implementation SCKAsyncSerialQueue

- (SCKAsyncSerialQueue)init
{
  SCKAsyncSerialQueue *v2;
  NSOperationQueue *v3;
  NSOperationQueue *serialOperationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCKAsyncSerialQueue;
  v2 = -[SCKAsyncSerialQueue init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    serialOperationQueue = v2->_serialOperationQueue;
    v2->_serialOperationQueue = v3;

    -[NSOperationQueue setName:](v2->_serialOperationQueue, "setName:", CFSTR("SCKAsyncSerialQueue.operationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_serialOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v2->_serialOperationQueue, "setQualityOfService:", 17);
  }
  return v2;
}

- (void)enqueueBlock:(id)a3
{
  id v4;
  void *v5;
  SCKAsyncBlockOperation *v6;

  if (a3)
  {
    v4 = a3;
    v6 = -[SCKAsyncBlockOperation initWithBlock:]([SCKAsyncBlockOperation alloc], "initWithBlock:", v4);

    -[SCKAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addOperation:", v6);

  }
}

- (void)waitUntilEmpty
{
  id v2;

  -[SCKAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitUntilAllOperationsAreFinished");

}

- (BOOL)isSuspended
{
  void *v2;
  char v3;

  -[SCKAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuspended");

  return v3;
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SCKAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuspended:", v3);

}

- (NSOperationQueue)serialOperationQueue
{
  return self->_serialOperationQueue;
}

- (void)setSerialOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialOperationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialOperationQueue, 0);
}

@end
