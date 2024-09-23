@implementation SCWAsyncSerialQueue

- (void)setSuspended:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SCWAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuspended:", v3);

}

- (void)enqueueBlock:(id)a3
{
  id v4;
  void *v5;
  SCWAsyncBlockOperation *v6;

  if (a3)
  {
    v4 = a3;
    v6 = -[SCWAsyncBlockOperation initWithBlock:]([SCWAsyncBlockOperation alloc], "initWithBlock:", v4);

    -[SCWAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addOperation:", v6);

  }
}

- (NSOperationQueue)serialOperationQueue
{
  return self->_serialOperationQueue;
}

- (SCWAsyncSerialQueue)initWithQualityOfService:(int64_t)a3
{
  SCWAsyncSerialQueue *v4;
  NSOperationQueue *v5;
  NSOperationQueue *serialOperationQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCWAsyncSerialQueue;
  v4 = -[SCWAsyncSerialQueue init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    serialOperationQueue = v4->_serialOperationQueue;
    v4->_serialOperationQueue = v5;

    -[NSOperationQueue setName:](v4->_serialOperationQueue, "setName:", CFSTR("SCWAsyncSerialQueue.operationQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v4->_serialOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v4->_serialOperationQueue, "setQualityOfService:", a3);
  }
  return v4;
}

- (void)waitUntilEmpty
{
  id v2;

  -[SCWAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitUntilAllOperationsAreFinished");

}

- (BOOL)isSuspended
{
  void *v2;
  char v3;

  -[SCWAsyncSerialQueue serialOperationQueue](self, "serialOperationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuspended");

  return v3;
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
