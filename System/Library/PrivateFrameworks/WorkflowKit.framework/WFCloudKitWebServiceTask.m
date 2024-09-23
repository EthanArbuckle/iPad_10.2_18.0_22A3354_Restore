@implementation WFCloudKitWebServiceTask

- (WFCloudKitWebServiceTask)init
{
  WFCloudKitWebServiceTask *v2;
  void *v3;
  WFCloudKitWebServiceTask *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFCloudKitWebServiceTask;
  v2 = -[WFCloudKitWebServiceTask init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[WFCloudKitWebServiceTask setOperationQueue:](v2, "setOperationQueue:", v3);

    v4 = v2;
  }

  return v2;
}

- (void)cancel
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WFCloudKitWebServiceTask dataTask](self, "dataTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[WFCloudKitWebServiceTask operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllOperations");

  v5.receiver = self;
  v5.super_class = (Class)WFCloudKitWebServiceTask;
  -[WFCloudKitTask cancel](&v5, sel_cancel);
}

- (NSURLSessionTask)dataTask
{
  return self->_dataTask;
}

- (void)setDataTask:(id)a3
{
  objc_storeStrong((id *)&self->_dataTask, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
}

@end
