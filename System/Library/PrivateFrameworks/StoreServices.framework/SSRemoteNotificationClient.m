@implementation SSRemoteNotificationClient

- (SSRemoteNotificationClient)init
{
  SSRemoteNotificationClient *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSRemoteNotificationClient;
  v2 = -[SSRemoteNotificationClient init](&v4, sel_init);
  if (v2)
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.storeservices.SSRemoteNotificationClient", 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)SSRemoteNotificationClient;
  -[SSRemoteNotificationClient dealloc](&v3, sel_dealloc);
}

+ (id)sharedClient
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SSRemoteNotificationClient_sharedClient__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = a1;
  if (sharedClient_sOnce != -1)
    dispatch_once(&sharedClient_sOnce, block);
  return (id)sharedClient_sSharedClient;
}

id __42__SSRemoteNotificationClient_sharedClient__block_invoke()
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  sharedClient_sSharedClient = (uint64_t)result;
  return result;
}

- (id)popQueuedNotifications
{
  id v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SSXPCConnection *v15;
  xpc_object_t v16;
  id v17;
  uint64_t v19;
  _QWORD v20[5];
  __int128 v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v2 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v2)
      v2 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v5 = v4;
    else
      v5 = v4 & 2;
    if (v5)
    {
      LODWORD(v21) = 136446210;
      *(_QWORD *)((char *)&v21 + 4) = "-[SSRemoteNotificationClient popQueuedNotifications]";
      LODWORD(v19) = 12;
      v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v6, 4, &v21, v19);
        free(v7);
        SSFileLog(v2, CFSTR("%@"), v9, v10, v11, v12, v13, v14, v8);
      }
    }
  }
  *(_QWORD *)&v21 = 0;
  *((_QWORD *)&v21 + 1) = &v21;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__27;
  v24 = __Block_byref_object_dispose__27;
  v25 = 0;
  v15 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v16 = SSXPCCreateMessageDictionary(79);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __52__SSRemoteNotificationClient_popQueuedNotifications__block_invoke;
  v20[3] = &unk_1E47BC6E0;
  v20[4] = &v21;
  -[SSXPCConnection sendSynchronousMessage:withReply:](v15, "sendSynchronousMessage:withReply:", v16, v20);
  xpc_release(v16);

  v17 = *(id *)(*((_QWORD *)&v21 + 1) + 40);
  _Block_object_dispose(&v21, 8);
  return v17;
}

_QWORD *__52__SSRemoteNotificationClient_popQueuedNotifications__block_invoke(_QWORD *result, void *a2)
{
  _QWORD *v3;
  xpc_object_t value;
  uint64_t v5;

  if (a2)
  {
    v3 = result;
    result = (_QWORD *)MEMORY[0x1A85863E4](a2);
    if (result == (_QWORD *)MEMORY[0x1E0C812F8])
    {
      value = xpc_dictionary_get_value(a2, "0");
      v5 = objc_opt_class();
      result = SSXPCCreateNSArrayFromXPCEncodedArray(value, v5);
      *(_QWORD *)(*(_QWORD *)(v3[4] + 8) + 40) = result;
    }
  }
  return result;
}

- (void)registerForRemoteNotifications
{
  id v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *dispatchQueue;
  uint64_t v17;
  _QWORD block[5];
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v3)
      v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v6 = v5;
    else
      v6 = v5 & 2;
    if (v6)
    {
      v19 = 136446210;
      v20 = "-[SSRemoteNotificationClient registerForRemoteNotifications]";
      LODWORD(v17) = 12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v19, v17);
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SSRemoteNotificationClient_registerForRemoteNotifications__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __60__SSRemoteNotificationClient_registerForRemoteNotifications__block_invoke(uint64_t a1)
{
  uint64_t v1;
  int *v2;
  NSObject *global_queue;
  SSXPCConnection *v4;
  xpc_object_t v5;
  _QWORD handler[5];
  _QWORD v7[6];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (int *)(v1 + 16);
  if (!*(_DWORD *)(v1 + 16))
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3052000000;
    v7[3] = __Block_byref_object_copy__27;
    v7[4] = __Block_byref_object_dispose__27;
    v7[5] = v1;
    global_queue = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __60__SSRemoteNotificationClient_registerForRemoteNotifications__block_invoke_2;
    handler[3] = &unk_1E47BC708;
    handler[4] = v7;
    notify_register_dispatch("com.apple.itunesstored.aps.received", v2, global_queue, handler);
    _Block_object_dispose(v7, 8);
  }
  v4 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v5 = SSXPCCreateMessageDictionary(80);
  -[SSXPCConnection sendSynchronousMessage:withReply:](v4, "sendSynchronousMessage:withReply:", v5, &__block_literal_global_14);
  xpc_release(v5);

}

void __60__SSRemoteNotificationClient_registerForRemoteNotifications__block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SSRemoteNotificationClientDidReceiveNotifications"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

- (void)unregisterForRemoteNotifications
{
  id v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *dispatchQueue;
  uint64_t v17;
  _QWORD block[5];
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v3)
      v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v6 = v5;
    else
      v6 = v5 & 2;
    if (v6)
    {
      v19 = 136446210;
      v20 = "-[SSRemoteNotificationClient unregisterForRemoteNotifications]";
      LODWORD(v17) = 12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v19, v17);
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SSRemoteNotificationClient_unregisterForRemoteNotifications__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __62__SSRemoteNotificationClient_unregisterForRemoteNotifications__block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  SSXPCConnection *v3;

  notify_cancel(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  v3 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v2 = SSXPCCreateMessageDictionary(81);
  -[SSXPCConnection sendSynchronousMessage:withReply:](v3, "sendSynchronousMessage:withReply:", v2, &__block_literal_global_19);
  xpc_release(v2);

}

@end
