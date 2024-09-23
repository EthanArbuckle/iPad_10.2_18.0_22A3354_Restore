@implementation SSSoftwareUpdatesStore

- (SSSoftwareUpdatesStore)init
{
  SSSoftwareUpdatesStore *v2;
  void *v3;
  SSXPCConnection *v4;
  SSXPCConnection *connection;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *dispatchQueue;
  void *v9;
  id v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *calloutQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SSSoftwareUpdatesStore;
  v2 = -[SSSoftwareUpdatesStore init](&v14, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.SSSoftwareUpdatesStore.%p"), v2);
    v4 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    connection = v2->_connection;
    v2->_connection = v4;

    v6 = objc_retainAutorelease(v3);
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.SSSoftwareUpdatesStore.callout.%p"), v2);
    v10 = objc_retainAutorelease(v9);
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.itunesstored.updatesstorechanged"), 0);
  v4.receiver = self;
  v4.super_class = (Class)SSSoftwareUpdatesStore;
  -[SSSoftwareUpdatesStore dealloc](&v4, sel_dealloc);
}

- (void)clearExpiredUpdateHistoryWithCompletionBlock:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)getUpdatesWithCompletionBlock:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, MEMORY[0x1E0C9AA60]);
}

- (void)hideApplicationBadgeForPendingUpdates
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  xpc_object_t v15;
  uint64_t v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!SSIsInternalBuild() || !_os_feature_enabled_impl())
    goto LABEL_16;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    v7 = v5;
  else
    v7 = v5 & 2;
  if (!v7)
    goto LABEL_14;
  v17 = 136446210;
  v18 = "-[SSSoftwareUpdatesStore hideApplicationBadgeForPendingUpdates]";
  LODWORD(v16) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v17, v16);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
LABEL_14:

  }
LABEL_16:
  if (self->_connection)
  {
    v15 = SSXPCCreateMessageDictionary(118);
    -[SSXPCConnection sendMessage:](self->_connection, "sendMessage:", v15);

  }
}

- (void)reloadFromServerWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *dispatchQueue;
  id v18;
  uint64_t v19;
  _QWORD block[5];
  id v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v22 = 136446210;
      v23 = "-[SSSoftwareUpdatesStore reloadFromServerWithCompletionBlock:]";
      LODWORD(v19) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v22, v19);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SSSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke;
  block[3] = &unk_1E47B8AC0;
  block[4] = self;
  v21 = v4;
  v18 = v4;
  dispatch_async(dispatchQueue, block);

}

void __62__SSSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v2 = SSXPCCreateMessageDictionary(106);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SSSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_2;
  v6[3] = &unk_1E47BADA8;
  v6[4] = v3;
  v7 = v4;
  objc_msgSend(v5, "sendMessage:withReply:", v2, v6);

}

void __62__SSSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v4 = v3;
  if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
  {
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    xpc_dictionary_get_value(v4, "1");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithXPCEncoding:", v7);

  }
  else
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 111, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__SSSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_3;
  v11[3] = &unk_1E47B8A98;
  v12 = v5;
  v13 = v8;
  v10 = v5;
  dispatch_async(v9, v11);

}

uint64_t __62__SSSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
}

- (void)removeUpdateBulletins
{
  id v3;

  if (self->_connection)
  {
    v3 = SSXPCCreateMessageDictionary(121);
    -[SSXPCConnection sendMessage:](self->_connection, "sendMessage:", v3);

  }
}

- (void)showApplicationBadgeForPendingUpdates
{
  id v3;

  if (self->_connection)
  {
    v3 = SSXPCCreateMessageDictionary(119);
    -[SSXPCConnection sendMessage:](self->_connection, "sendMessage:", v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

@end
