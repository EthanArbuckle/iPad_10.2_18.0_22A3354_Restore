@implementation WFCloudKitItemTask

- (void)setCloudOperation:(id)a3
{
  objc_storeStrong((id *)&self->_cloudOperation, a3);
}

- (WFCloudKitItemTask)init
{
  WFCloudKitItemTask *v2;
  id v3;
  void *v4;
  WFCloudKitItemTask *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFCloudKitItemTask;
  v2 = -[WFCloudKitItemTask init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[WFCloudKitItemTask setOperationQueue:](v2, "setOperationQueue:", v3);

    -[WFCloudKitItemTask operationQueue](v2, "operationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setQualityOfService:", 25);

    v5 = v2;
  }

  return v2;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cloudOperation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)cancel
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WFCloudKitItemTask operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  -[WFCloudKitItemTask cloudOperation](self, "cloudOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  v5.receiver = self;
  v5.super_class = (Class)WFCloudKitItemTask;
  -[WFCloudKitTask cancel](&v5, sel_cancel);
}

- (CKOperation)cloudOperation
{
  return self->_cloudOperation;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

@end
