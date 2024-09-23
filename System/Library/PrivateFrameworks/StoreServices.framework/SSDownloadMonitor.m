@implementation SSDownloadMonitor

- (SSDownloadMonitor)init
{
  SSDownloadMonitor *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *global_queue;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSDownloadMonitor;
  v2 = -[SSDownloadMonitor init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.SSDownloadMonitor.%p"), v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.SSDownloadMonitor.%p.delegate"), v2);
    v5 = dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), 0);
    v2->_delegateQueue = (OS_dispatch_queue *)v5;
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v5, global_queue);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__DownloadMonitorChanged, CFSTR("com.apple.itunesstored.downloadmonitorchanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *delegateQueue;
  NSObject *dispatchQueue;
  objc_super v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.itunesstored.downloadmonitorchanged"), 0);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
    dispatch_release(delegateQueue);
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  v6.receiver = self;
  v6.super_class = (Class)SSDownloadMonitor;
  -[SSDownloadMonitor dealloc](&v6, sel_dealloc);
}

- (SSDownloadMonitorDelegate)delegate
{
  NSObject *dispatchQueue;
  SSDownloadMonitorDelegate *v3;
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
  v9 = __Block_byref_object_copy__83;
  v10 = __Block_byref_object_dispose__83;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__SSDownloadMonitor_delegate__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSDownloadMonitorDelegate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __29__SSDownloadMonitor_delegate__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)getMonitorItemsWithCompletionBlock:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SSDownloadMonitor_getMonitorItemsWithCompletionBlock___block_invoke;
  v4[3] = &unk_1E47BBC58;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void __56__SSDownloadMonitor_getMonitorItemsWithCompletionBlock___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  _QWORD v4[4];
  __int128 v5;

  v2 = SSXPCCreateMessageDictionary(109);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_connection");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SSDownloadMonitor_getMonitorItemsWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E47B8EE0;
  v5 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "sendMessage:withReply:", v2, v4);
  xpc_release(v2);
}

void __56__SSDownloadMonitor_getMonitorItemsWithCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[7];
  uint64_t v7;

  if (*(_QWORD *)(a1 + 40))
  {
    v7 = 0;
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyItemsWithReply:error:", a2, &v7);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__SSDownloadMonitor_getMonitorItemsWithCompletionBlock___block_invoke_3;
    v6[3] = &unk_1E47B9E60;
    v6[4] = v3;
    v6[5] = v7;
    v6[6] = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __56__SSDownloadMonitor_getMonitorItemsWithCompletionBlock___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setDelegate:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SSDownloadMonitor_setDelegate___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __33__SSDownloadMonitor_setDelegate___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = *(_QWORD *)(result + 40);
  return result;
}

- (id)_connection
{
  id result;
  SSXPCConnection *v4;

  result = self->_connection;
  if (!result)
  {
    v4 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    self->_connection = v4;
    -[SSXPCConnection setReplyQueue:](v4, "setReplyQueue:", self->_dispatchQueue);
    return self->_connection;
  }
  return result;
}

- (id)_copyItemsWithReply:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  CFArrayRef v8;
  id v9;
  xpc_object_t value;
  uint64_t v12;
  const __CFArray *v13;

  if (a3 == (id)MEMORY[0x1E0C81258])
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = 121;
LABEL_6:
    v8 = (CFArrayRef)objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("SSErrorDomain"), v7, 0);
    v9 = 0;
    if (!a4)
      return v9;
    goto LABEL_7;
  }
  if (!a3 || MEMORY[0x1A85863E4](a3, a2) != MEMORY[0x1E0C812F8])
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = 111;
    goto LABEL_6;
  }
  value = xpc_dictionary_get_value(a3, "0");
  v9 = value;
  if (value)
  {
    if (MEMORY[0x1A85863E4](value) == MEMORY[0x1E0C812C8])
    {
      v12 = objc_opt_class();
      v9 = SSXPCCreateNSArrayFromXPCEncodedArray(v9, v12);
    }
    else
    {
      v9 = 0;
    }
  }
  objc_opt_class();
  v8 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
  v13 = v8;
  if (a4)
  {
LABEL_7:
    if (!v9)
      *a4 = v8;
  }
  return v9;
}

- (void)_reloadForChangeNotification
{
  xpc_object_t v3;
  id v4;
  _QWORD v5[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = SSXPCCreateMessageDictionary(109);
    v4 = -[SSDownloadMonitor _connection](self, "_connection");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__SSDownloadMonitor__reloadForChangeNotification__block_invoke;
    v5[3] = &unk_1E47BBC08;
    v5[4] = self;
    objc_msgSend(v4, "sendMessage:withReply:", v3, v5);
    xpc_release(v3);
  }
}

void __49__SSDownloadMonitor__reloadForChangeNotification__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];

  v3 = objc_msgSend(*(id *)(a1 + 32), "_copyItemsWithReply:error:", a2, 0);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 24);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__SSDownloadMonitor__reloadForChangeNotification__block_invoke_2;
    v7[3] = &unk_1E47B8BB8;
    v7[4] = v5;
    v7[5] = v4;
    dispatch_async(v6, v7);

  }
}

uint64_t __49__SSDownloadMonitor__reloadForChangeNotification__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;
  id v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    v4 = *(id *)(a1 + 32);
    return objc_msgSend(v2, "downloadMonitor:didReloadWithItems:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  return result;
}

@end
