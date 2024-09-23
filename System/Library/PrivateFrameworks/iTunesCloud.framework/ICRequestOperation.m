@implementation ICRequestOperation

- (void)finishWithError:(id)a3
{
  id v4;
  void (**completionHandler)(id, id);
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICRequestOperation;
  -[ICAsyncOperation finishWithError:](&v7, sel_finishWithError_, v4);
  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, v4);
    v6 = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

- (void)performRequestOnOperationQueue:(id)a3 withCompletionHandler:(id)a4
{
  void *v6;
  id completionHandler;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void *)MEMORY[0x1A1AFA8D0](a4);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v6;

  if (v9)
  {
    objc_msgSend(v9, "addOperation:", self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3828], "ic_sharedRequestOperationQueueWithQualityOfService:", -1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addOperation:", self);

  }
}

- (ICRequestOperation)init
{
  ICRequestOperation *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICRequestOperation;
  v2 = -[ICAsyncOperation init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICRequestOperation setProgress:](v2, "setProgress:", v3);

  }
  return v2;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)performRequestWithCompletionHandler:(id)a3
{
  -[ICRequestOperation performRequestOnOperationQueue:withCompletionHandler:](self, "performRequestOnOperationQueue:withCompletionHandler:", 0, a3);
}

- (NSProgress)progress
{
  return self->_progress;
}

@end
