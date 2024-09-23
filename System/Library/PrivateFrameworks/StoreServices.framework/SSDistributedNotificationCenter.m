@implementation SSDistributedNotificationCenter

- (SSDistributedNotificationCenter)init
{
  return -[SSDistributedNotificationCenter initWithNamedPort:](self, "initWithNamedPort:", 0);
}

- (SSDistributedNotificationCenter)initWithNamedPort:(id)a3
{
  id v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SSDistributedNotificationCenter *v18;
  int *v20;
  uint64_t v21;
  objc_super v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v5)
      v5 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v8 = v7;
    else
      v8 = v7 & 2;
    if (v8)
    {
      v23 = 136446210;
      v24 = "-[SSDistributedNotificationCenter initWithNamedPort:]";
      LODWORD(v21) = 12;
      v20 = &v23;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v23, v21);
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  if (objc_msgSend(a3, "length", v20))
  {
    v22.receiver = self;
    v22.super_class = (Class)SSDistributedNotificationCenter;
    v18 = -[SSDistributedNotificationCenter init](&v22, sel_init);
    if (v18)
    {
      v18->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSDistributedNotificationCenter", 0);
      v18->_observers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v18->_portName = (NSString *)objc_msgSend(a3, "copy");
    }
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid port name"));
    return 0;
  }
  return v18;
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  objc_super v4;

  -[SSXPCServer removeObserver:selector:forMessage:](self->_server, "removeObserver:selector:forMessage:", self, sel__distributedNotificationMessage_connection_, 1009);

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  v4.receiver = self;
  v4.super_class = (Class)SSDistributedNotificationCenter;
  -[SSDistributedNotificationCenter dealloc](&v4, sel_dealloc);
}

- (id)addObserverForName:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  SSDistributedNotificationCenterObserver *v22;
  NSObject *dispatchQueue;
  __int128 *v25;
  uint64_t v26;
  _QWORD block[8];
  __int128 v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v9 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v9)
      v9 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v12 = v11;
    else
      v12 = v11 & 2;
    if (v12)
    {
      LODWORD(v28) = 136446210;
      *(_QWORD *)((char *)&v28 + 4) = "-[SSDistributedNotificationCenter addObserverForName:queue:usingBlock:]";
      LODWORD(v26) = 12;
      v25 = &v28;
      v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v28, v26);
        free(v14);
        SSFileLog(v9, CFSTR("%@"), v16, v17, v18, v19, v20, v21, v15);
      }
    }
  }
  if (!objc_msgSend(a3, "length", v25))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid name"));
LABEL_21:
    v22 = 0;
    return v22;
  }
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid block"));
    goto LABEL_21;
  }
  *(_QWORD *)&v28 = 0;
  *((_QWORD *)&v28 + 1) = &v28;
  v29 = 0x2020000000;
  v30 = 1;
  v22 = -[SSDistributedNotificationCenterObserver initWithName:queue:block:]([SSDistributedNotificationCenterObserver alloc], "initWithName:queue:block:", a3, a4, a5);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SSDistributedNotificationCenter_addObserverForName_queue_usingBlock___block_invoke;
  block[3] = &unk_1E47BD738;
  block[4] = self;
  block[5] = a3;
  block[6] = v22;
  block[7] = &v28;
  dispatch_sync(dispatchQueue, block);
  if (*(_BYTE *)(*((_QWORD *)&v28 + 1) + 24))
    -[SSDistributedNotificationCenter _sendRegistrationMessage:name:](self, "_sendRegistrationMessage:name:", 42, a3);
  _Block_object_dispose(&v28, 8);
  return v22;
}

uint64_t __71__SSDistributedNotificationCenter_addObserverForName_queue_usingBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (!*(_QWORD *)(v2 + 32))
  {
    *(_QWORD *)(a1[4] + 32) = -[SSXPCServer initWithServiceName:entitlement:queue:]([SSXPCServer alloc], "initWithServiceName:entitlement:queue:", *(_QWORD *)(a1[4] + 24), 0, *(_QWORD *)(a1[4] + 8));
    objc_msgSend(*(id *)(a1[4] + 32), "addObserver:selector:forMessage:", a1[4], sel__distributedNotificationMessage_connection_, 1009);
    v2 = a1[4];
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(void **)(v2 + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "name"), "isEqualToString:", a1[5]))
        {
          *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
          return objc_msgSend(*(id *)(a1[4] + 16), "addObject:", a1[6]);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
  return objc_msgSend(*(id *)(a1[4] + 16), "addObject:", a1[6]);
}

- (NSString)namedPort
{
  return self->_portName;
}

- (void)removeObserver:(id)a3
{
  id v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *dispatchQueue;
  uint64_t v19;
  _QWORD block[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v5)
      v5 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v8 = v7;
    else
      v8 = v7 & 2;
    if (v8)
    {
      LODWORD(v25) = 136446210;
      *(_QWORD *)((char *)&v25 + 4) = "-[SSDistributedNotificationCenter removeObserver:]";
      LODWORD(v19) = 12;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v25, v19);
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  *(_QWORD *)&v25 = 0;
  *((_QWORD *)&v25 + 1) = &v25;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__38;
  v28 = __Block_byref_object_dispose__38;
  v29 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SSDistributedNotificationCenter_removeObserver___block_invoke;
  block[3] = &unk_1E47BD760;
  block[4] = self;
  block[5] = a3;
  block[6] = &v25;
  block[7] = &v21;
  dispatch_sync(dispatchQueue, block);
  if (*((_BYTE *)v22 + 24))
    -[SSDistributedNotificationCenter _sendRegistrationMessage:name:](self, "_sendRegistrationMessage:name:", 43, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 40));

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

uint64_t __50__SSDistributedNotificationCenter_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "indexOfObjectIdenticalTo:", *(_QWORD *)(a1 + 40));
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = result;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = (id)objc_msgSend(*(id *)(a1 + 40), "name");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectAtIndex:", v3);
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (result)
    {
      v5 = result;
      v6 = *(_QWORD *)v9;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          result = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "name"), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
          if ((_DWORD)result)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
            return result;
          }
          ++v7;
        }
        while (v5 != v7);
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v5 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (void)_distributedNotificationMessage:(id)a3 connection:(id)a4
{
  CFArrayRef v6;
  SSDistributedNotificationCenter *v7;
  NSMutableArray *observers;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *global_queue;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  v6 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
  if (-[__CFArray length](v6, "length"))
  {
    v7 = self;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    observers = self->_observers;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](observers, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(observers);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v13, "name"), "isEqualToString:", v6))
          {
            global_queue = objc_msgSend(v13, "dispatchQueue");
            if (global_queue || (global_queue = dispatch_get_global_queue(0, 0)) != 0)
              dispatch_async(global_queue, (dispatch_block_t)objc_msgSend(v13, "block"));
          }
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](observers, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
  }

}

- (void)_sendRegistrationMessage:(int64_t)a3 name:(id)a4
{
  SSXPCConnection *v7;
  xpc_object_t v8;
  NSObject *v9;
  _QWORD v10[5];

  v7 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v8, "0", a3);
  SSXPCDictionarySetCFObject(v8, "1", (__CFString *)self->_portName);
  SSXPCDictionarySetCFObject(v8, "2", (__CFString *)a4);
  v9 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SSDistributedNotificationCenter__sendRegistrationMessage_name___block_invoke;
  v10[3] = &unk_1E47BBC08;
  v10[4] = v9;
  -[SSXPCConnection sendMessage:withReply:](v7, "sendMessage:withReply:", v8, v10);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  xpc_release(v8);

}

intptr_t __65__SSDistributedNotificationCenter__sendRegistrationMessage_name___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
