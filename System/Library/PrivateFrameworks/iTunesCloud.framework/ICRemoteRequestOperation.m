@implementation ICRemoteRequestOperation

void __36__ICRemoteRequestOperation__execute__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v10 = v5;
  if (v5)
  {
    objc_msgSend(v5, "remoteRequestOperationResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setResponse:", v7);

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v10, "remoteRequestOperationError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithError:", v9);

  }
  else
  {
    objc_msgSend(v6, "finishWithError:", a3);
  }

}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSSecureCoding)response
{
  return self->_response;
}

- (ICRemoteRequestOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICRemoteRequestOperation;
  return -[ICRequestOperation init](&v4, sel_init, a3);
}

- (void)_execute
{
  void *v3;
  int v4;
  ICRemoteRequestOperationExecutionContext *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  if (-[ICRemoteRequestOperation _isShadowOperationForRemoteExecution](self, "_isShadowOperationForRemoteExecution")
    || (objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "ic_isCloudDaemon"),
        v3,
        v4))
  {
    v10.receiver = self;
    v10.super_class = (Class)ICRemoteRequestOperation;
    -[ICAsyncOperation _execute](&v10, sel__execute);
  }
  else
  {
    v5 = -[ICRemoteRequestOperationExecutionContext initWithRemoteRequestOperation:]([ICRemoteRequestOperationExecutionContext alloc], "initWithRemoteRequestOperation:", self);
    objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      -[ICRemoteRequestOperationExecutionContext setQualityOfService:](v5, "setQualityOfService:", objc_msgSend(v6, "qualityOfService"));
    +[ICRemoteRequestOperationController sharedRemoteRequestOperationController](ICRemoteRequestOperationController, "sharedRemoteRequestOperationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__ICRemoteRequestOperation__execute__block_invoke;
    v9[3] = &unk_1E438FD98;
    v9[4] = self;
    objc_msgSend(v8, "performRemoteRequestOperationWithExecutionContext:completionHandler:", v5, v9);

  }
}

- (BOOL)_isShadowOperationForRemoteExecution
{
  return self->__shadowOperationForRemoteExecution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
}

- (void)_setShadowOperationForRemoteExecution:(BOOL)a3
{
  self->__shadowOperationForRemoteExecution = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
