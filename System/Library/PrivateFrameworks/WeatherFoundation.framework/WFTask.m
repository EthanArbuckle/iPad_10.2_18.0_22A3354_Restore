@implementation WFTask

+ (WFServiceConnection)sharedServiceConnection
{
  if (sharedServiceConnection_onceToken != -1)
    dispatch_once(&sharedServiceConnection_onceToken, &__block_literal_global_26);
  return (WFServiceConnection *)(id)sharedServiceConnection_serviceConnection;
}

void __33__WFTask_sharedServiceConnection__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedServiceConnection_serviceConnection;
  sharedServiceConnection_serviceConnection = v0;

}

- (WFTask)init
{
  WFTask *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WFTask;
  v3 = -[WFTask init](&v13, sel_init);
  if (v3 == self)
  {
    +[WFTaskIdentifier defaultIdentifier](WFTaskIdentifier, "defaultIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_identifier, v4);
    self->_requiresResponse = 1;
    v5 = (void *)objc_opt_new();
    -[WFTask setProgress:](self, "setProgress:", v5);

    -[WFTask progress](self, "progress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInfoObject:forKey:", self->_identifier, CFSTR("taskIdentifier"));

    -[WFTask progress](self, "progress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCancellable:", 1);

    -[WFTask progress](self, "progress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __14__WFTask_init__block_invoke;
    v11[3] = &unk_24CCA06F8;
    v12 = v4;
    v9 = v4;
    objc_msgSend(v8, "setCancellationHandler:", v11);

  }
  return v3;
}

void __14__WFTask_init__block_invoke(uint64_t a1)
{
  id v2;

  +[WFTask sharedServiceConnection](WFTask, "sharedServiceConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelRequestWithIdentifier:", *(_QWORD *)(a1 + 32));

}

- (WFTask)initWithResponseRequired:(BOOL)a3
{
  WFTask *result;

  result = -[WFTask init](self, "init");
  if (result)
    result->_requiresResponse = a3;
  return result;
}

- (void)start
{
  id v3;

  objc_msgSend((id)objc_opt_class(), "sharedServiceConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueRequest:", self);

}

- (void)executeSynchronously
{
  id v3;

  objc_msgSend((id)objc_opt_class(), "sharedServiceConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueRequest:waitUntilDone:", self, 1);

}

- (BOOL)isCancelled
{
  void *v2;
  char v3;

  -[WFTask progress](self, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCancelled");

  return v3;
}

- (void)cancel
{
  id v3;

  if (!-[WFTask isCancelled](self, "isCancelled"))
  {
    -[WFTask progress](self, "progress");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

  }
}

- (WFTaskIdentifier)identifier
{
  return self->_identifier;
}

- (BOOL)requiresResponse
{
  return self->_requiresResponse;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
