@implementation PAAccessPruner

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_instance;
}

void __32__PAAccessPruner_sharedInstance__block_invoke()
{
  PAAccessPruner *v0;
  void *v1;

  v0 = -[PAAccessPruner initWithQueue:]([PAAccessPruner alloc], "initWithQueue:", 0);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (PAAccessPruner)initWithQueue:(id)a3
{
  id v4;
  void *v5;
  PAAccessPruner *v6;
  PAAccessPruner *v7;

  v4 = a3;
  if (_os_feature_enabled_impl())
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.privacyaccountingd"), 4096);
  else
    v5 = 0;
  v6 = -[PAAccessPruner initWithConnection:queue:](self, "initWithConnection:queue:", v5, v4);
  v7 = v6;
  if (v6)
    -[NSXPCConnection resume](v6->_connection, "resume");

  return v7;
}

- (PAAccessPruner)initWithConnection:(id)a3 queue:(id)a4
{
  id v7;
  dispatch_queue_t v8;
  PAAccessPruner *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = (dispatch_queue_t)a4;
  v14.receiver = self;
  v14.super_class = (Class)PAAccessPruner;
  v9 = -[PAAccessPruner init](&v14, sel_init);
  if (v9)
  {
    PARegisterUserInfoValueProviderForPAErrorDomain();
    if (!v8)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(21, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v8 = dispatch_queue_create_with_target_V2("com.apple.privacyaccounting.PAAccessPruner", v10, v11);

    }
    objc_storeStrong((id *)&v9->_queue, v8);
    objc_msgSend(v7, "_setQueue:", v9->_queue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE80FD48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v12);
    objc_storeStrong((id *)&v9->_connection, a3);

  }
  return v9;
}

- (void)pruneEventsFromStartTime:(double)a3 toEndTime:(double)a4 completionHandler:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  void (**v10)(id, void *);
  _QWORD activity_block[5];
  void (**v12)(id, void *);
  double v13;
  double v14;

  v8 = (void (**)(id, void *))a5;
  v10 = v8;
  if (self->_connection)
  {
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __71__PAAccessPruner_pruneEventsFromStartTime_toEndTime_completionHandler___block_invoke;
    activity_block[3] = &unk_1E4FA4CC0;
    activity_block[4] = self;
    v12 = v8;
    v13 = a3;
    v14 = a4;
    _os_activity_initiate(&dword_1A5DE1000, "PAAccessPruner -pruneEventsFromStartTime:toEndTime:completionHandler:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAErrorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v9);

  }
}

void __71__PAAccessPruner_pruneEventsFromStartTime_toEndTime_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__PAAccessPruner_pruneEventsFromStartTime_toEndTime_completionHandler___block_invoke_2;
  v5[3] = &unk_1E4FA4C98;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pruneEventsFromStartTime:toEndTime:reply:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

}

uint64_t __71__PAAccessPruner_pruneEventsFromStartTime_toEndTime_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PAAccessPruner;
  -[PAAccessPruner dealloc](&v3, sel_dealloc);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
