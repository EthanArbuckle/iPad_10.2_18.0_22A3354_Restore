@implementation SSEventMonitor

uint64_t __30__SSEventMonitor_setDelegate___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 8) = *(_QWORD *)(result + 40);
  return result;
}

void __41__SSEventMonitor__connectEventConnection__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "_handleMessage:fromServerConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4
{
  CFArrayRef v6;
  CFArrayRef v7;
  NSObject *delegateQueue;
  _QWORD block[7];

  objc_opt_class();
  v6 = SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__SSEventMonitor__handleMessage_fromServerConnection___block_invoke;
    block[3] = &unk_1E47B9E88;
    block[4] = self;
    block[5] = v6;
    block[6] = v7;
    dispatch_async(delegateQueue, block);

  }
}

- (SSEventMonitor)init
{
  SSEventMonitor *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSEventMonitor;
  v2 = -[SSEventMonitor init](&v5, sel_init);
  if (v2)
  {
    v2->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSEventMonitor.delegate", 0);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSEventMonitor", 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__DaemonLaunchNotification_2, CFSTR("com.apple.iTunesStore.daemon.launched"), 0, CFNotificationSuspensionBehaviorCoalesce);
    -[SSEventMonitor _connectEventConnection](v2, "_connectEventConnection");
  }
  return v2;
}

- (void)_connectEventConnection
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
  SSXPCConnection *v16;
  SSXPCConnection *v17;
  xpc_object_t v18;
  id v19;
  uint64_t v20;
  _QWORD v21[6];
  __int128 v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  SSEventMonitor *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
    if (os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v6 = v5;
    else
      v6 = v5 & 2;
    if (v6)
    {
      LODWORD(v22) = 136446210;
      *(_QWORD *)((char *)&v22 + 4) = "-[SSEventMonitor _connectEventConnection]";
      LODWORD(v20) = 12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v22, v20);
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  if (!self->_eventConnection)
  {
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = &v22;
    v23 = 0x3052000000;
    v24 = __Block_byref_object_copy__41;
    v25 = __Block_byref_object_dispose__41;
    v26 = self;
    v16 = objc_alloc_init(SSXPCConnection);
    self->_eventConnection = v16;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __41__SSEventMonitor__connectEventConnection__block_invoke;
    v21[3] = &unk_1E47BD5A8;
    v21[4] = self;
    v21[5] = &v22;
    -[SSXPCConnection setMessageBlock:](v16, "setMessageBlock:", v21);
    _Block_object_dispose(&v22, 8);
  }
  v17 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v18, "0", 50);
  v19 = -[SSXPCConnection createXPCEndpoint](self->_eventConnection, "createXPCEndpoint");
  xpc_dictionary_set_value(v18, "1", v19);
  xpc_release(v19);
  -[SSXPCConnection sendMessage:](v17, "sendMessage:", v18);
  xpc_release(v18);

}

- (void)setDelegate:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__SSEventMonitor_setDelegate___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

void __41__SSEventMonitor__connectEventConnection__block_invoke(uint64_t a1, void *a2, xpc_object_t object)
{
  uint64_t v6;
  NSObject *v7;
  _QWORD block[7];

  xpc_retain(object);
  xpc_retain(a2);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SSEventMonitor__connectEventConnection__block_invoke_2;
  block[3] = &unk_1E47BA7E8;
  block[5] = object;
  block[6] = v6;
  block[4] = a2;
  dispatch_async(v7, block);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *delegateQueue;
  NSObject *dispatchQueue;
  objc_super v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.iTunesStore.daemon.launched"), 0);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
    dispatch_release(delegateQueue);
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_sync(dispatchQueue, &__block_literal_global_19);
    dispatch_release((dispatch_object_t)self->_dispatchQueue);
  }
  -[SSXPCConnection setMessageBlock:](self->_eventConnection, "setMessageBlock:", 0);

  v6.receiver = self;
  v6.super_class = (Class)SSEventMonitor;
  -[SSEventMonitor dealloc](&v6, sel_dealloc);
}

- (SSEventMonitorDelegate)delegate
{
  NSObject *dispatchQueue;
  SSEventMonitorDelegate *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__41;
  v10 = __Block_byref_object_dispose__41;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__SSEventMonitor_delegate__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSEventMonitorDelegate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __26__SSEventMonitor_delegate__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __54__SSEventMonitor__handleMessage_fromServerConnection___block_invoke(_QWORD *a1)
{
  id v2;

  v2 = *(id *)(a1[4] + 8);
  objc_msgSend(v2, "eventMonitor:receivedEventWithName:userInfo:", a1[4], a1[5], a1[6]);

}

@end
