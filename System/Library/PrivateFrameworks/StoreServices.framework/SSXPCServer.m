@implementation SSXPCServer

- (void)_dispatchMessage:(id)a3 connection:(id)a4
{
  int v4;
  int v5;
  id v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *entitlementName;
  NSObject *dispatchQueue;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSString *v27;
  id v28;
  int v29;
  int v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  objc_class *v34;
  NSString *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  NSString *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int *v60;
  uint64_t v61;
  id obj;
  void *v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD block[7];
  int v72;
  uint64_t v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  NSString *v77;
  __int16 v78;
  NSString *v79;
  _BYTE v80[128];
  _OWORD v81[2];
  void (*v82)(uint64_t);
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  memset(v81, 0, sizeof(v81));
  xpc_connection_get_audit_token();
  v65 = (void *)CPCopyBundleIdentifierFromAuditToken();
  v4 = MKBDeviceUnlockedSinceBoot();
  v5 = v4;
  if (v4 != 1)
  {
    if (v4)
    {
      v6 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v6)
        v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = objc_msgSend(v6, "shouldLog");
      if (objc_msgSend(v6, "shouldLogToDisk"))
        v11 = v10 | 2;
      else
        v11 = v10;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_FAULT))
        v12 = v11;
      else
        v12 = v11 & 2;
      if (!v12)
        goto LABEL_25;
      LODWORD(v81[0]) = 138543618;
      *(_QWORD *)((char *)v81 + 4) = objc_opt_class();
      WORD6(v81[0]) = 1024;
      *(_DWORD *)((char *)v81 + 14) = v5;
      LODWORD(v61) = 18;
      v60 = (int *)v81;
    }
    else
    {
      v6 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v6)
        v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = objc_msgSend(v6, "shouldLog");
      if (objc_msgSend(v6, "shouldLogToDisk"))
        v8 = v7 | 2;
      else
        v8 = v7;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v9 = v8;
      else
        v9 = v8 & 2;
      if (!v9)
        goto LABEL_25;
      LODWORD(v81[0]) = 138543362;
      *(_QWORD *)((char *)v81 + 4) = objc_opt_class();
      LODWORD(v61) = 12;
      v60 = (int *)v81;
    }
    v13 = (void *)_os_log_send_and_compose_impl();
    if (v13)
    {
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, v81, v61);
      free(v13);
      SSFileLog(v6, CFSTR("%@"), v15, v16, v17, v18, v19, v20, v14);
    }
LABEL_25:
    -[SSXPCServer _recordCoreAnalyticsEventForClient:andSelector:](self, "_recordCoreAnalyticsEventForClient:andSelector:", v65, CFSTR("beforeFirstUnlockClient"), v60);
    xpc_connection_cancel((xpc_connection_t)a4);
  }
  entitlementName = (const __CFString *)self->_entitlementName;
  if (entitlementName && !SSXPCConnectionHasEntitlement((uint64_t)a4, entitlementName))
  {
    v45 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v45)
      v45 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v46 = objc_msgSend(v45, "shouldLog");
    if (objc_msgSend(v45, "shouldLogToDisk"))
      v47 = v46 | 2;
    else
      v47 = v46;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v45, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v48 = v47;
    else
      v48 = v47 & 2;
    if (v48)
    {
      v49 = objc_opt_class();
      v50 = self->_entitlementName;
      LODWORD(v81[0]) = 138412546;
      *(_QWORD *)((char *)v81 + 4) = v49;
      WORD6(v81[0]) = 2112;
      *(_QWORD *)((char *)v81 + 14) = v50;
      LODWORD(v61) = 22;
      v60 = (int *)v81;
      v51 = _os_log_send_and_compose_impl();
      if (v51)
      {
        v52 = (void *)v51;
        v53 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v51, 4, v81, v61);
        free(v52);
        SSFileLog(v45, CFSTR("%@"), v54, v55, v56, v57, v58, v59, v53);
      }
    }
    -[SSXPCServer _recordCoreAnalyticsEventForClient:andSelector:](self, "_recordCoreAnalyticsEventForClient:andSelector:", v65, CFSTR("unentitledClient"), v60);
  }
  else
  {
    *(_QWORD *)&v81[0] = 0;
    *((_QWORD *)&v81[0] + 1) = v81;
    *(_QWORD *)&v81[1] = 0x3052000000;
    *((_QWORD *)&v81[1] + 1) = __Block_byref_object_copy__37;
    v82 = __Block_byref_object_dispose__37;
    v83 = 0;
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__SSXPCServer__dispatchMessage_connection___block_invoke;
    block[3] = &unk_1E47BD6E8;
    block[5] = self;
    block[6] = v81;
    block[4] = a3;
    dispatch_sync(dispatchQueue, block);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = *(id *)(*((_QWORD *)&v81[0] + 1) + 40);
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v68 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          v27 = NSStringFromSelector((SEL)objc_msgSend(v26, "selector"));
          v28 = +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
          if (!v28)
            v28 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v29 = objc_msgSend(v28, "shouldLog");
          v30 = objc_msgSend(v28, "shouldLogToDisk");
          v31 = objc_msgSend(v28, "OSLogObject");
          if (v30)
            v29 |= 2u;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            v32 = v29;
          else
            v32 = v29 & 2;
          if (v32)
          {
            v33 = objc_opt_class();
            objc_msgSend(v26, "observer");
            v34 = (objc_class *)objc_opt_class();
            v35 = NSStringFromClass(v34);
            v72 = 138544130;
            v73 = v33;
            v74 = 2114;
            v75 = v65;
            v76 = 2112;
            v77 = v35;
            v78 = 2112;
            v79 = v27;
            LODWORD(v61) = 42;
            v60 = &v72;
            v36 = _os_log_send_and_compose_impl();
            if (v36)
            {
              v37 = (void *)v36;
              v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v36, 4, &v72, v61);
              free(v37);
              SSFileLog(v28, CFSTR("%@"), v39, v40, v41, v42, v43, v44, v38);
            }
          }
          objc_msgSend((id)objc_msgSend(v26, "observer", v60), (SEL)objc_msgSend(v26, "selector"), a3, a4);
          -[SSXPCServer _recordCoreAnalyticsEventForClient:andSelector:](self, "_recordCoreAnalyticsEventForClient:andSelector:", v65, v27);
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
      }
      while (v23);
    }

    _Block_object_dispose(v81, 8);
  }

}

- (void)_recordCoreAnalyticsEventForClient:(id)a3 andSelector:(id)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  if (+[SSDevice deviceIsInternalBuild](SSDevice, "deviceIsInternalBuild"))
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SSXPCServer__recordCoreAnalyticsEventForClient_andSelector___block_invoke;
    block[3] = &unk_1E47B9E88;
    block[4] = a3;
    block[5] = a4;
    block[6] = self;
    dispatch_sync(dispatchQueue, block);
  }
}

void __43__SSXPCServer__dispatchMessage_connection___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "0"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", v2), "copy");

}

uint64_t __20__SSXPCServer_start__block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if (a2 != MEMORY[0x1E0C81260])
  {
    v3 = result;
    result = MEMORY[0x1A85863E4](a2);
    if (result == MEMORY[0x1E0C812F8])
      return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 40), "_dispatchMessage:connection:", a2, *(_QWORD *)(v3 + 32));
  }
  return result;
}

uint64_t __20__SSXPCServer_start__block_invoke(uint64_t a1, _xpc_connection_s *a2)
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[6];

  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812E0])
  {
    xpc_connection_set_target_queue(a2, *(dispatch_queue_t *)(a1 + 32));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __20__SSXPCServer_start__block_invoke_2;
    v8[3] = &unk_1E47BD0D8;
    v6 = *(_QWORD *)(a1 + 40);
    v8[4] = a2;
    v8[5] = v6;
    xpc_connection_set_event_handler(a2, v8);
    xpc_connection_resume(a2);
  }

  return objc_msgSend(v4, "drain");
}

uint64_t __62__SSXPCServer__recordCoreAnalyticsEventForClient_andSelector___block_invoke(_QWORD *a1)
{
  const __CFString *v2;
  const __CFString *v3;
  uint64_t v4;
  uint64_t result;

  if (a1[4])
    v2 = (const __CFString *)a1[4];
  else
    v2 = CFSTR("No Client");
  if (a1[5])
    v3 = (const __CFString *)a1[5];
  else
    v3 = CFSTR("No Selector");
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v2, v3);
  result = objc_msgSend(*(id *)(a1[6] + 56), "containsObject:", v4);
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1[6] + 56), "addObject:", v4);
    return AnalyticsSendEventLazy();
  }
  return result;
}

- (SSXPCServer)init
{
  return -[SSXPCServer initWithServiceName:](self, "initWithServiceName:", 0);
}

- (SSXPCServer)initWithServiceName:(id)a3
{
  return -[SSXPCServer initWithServiceName:entitlement:queue:](self, "initWithServiceName:entitlement:queue:", a3, 0, 0);
}

- (SSXPCServer)initWithServiceName:(id)a3 entitlement:(id)a4 queue:(id)a5
{
  SSXPCServer *v8;
  objc_super v10;

  if (a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)SSXPCServer;
    v8 = -[SSXPCServer init](&v10, sel_init);
    if (v8)
    {
      v8->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSXPCServer", 0);
      v8->_entitlementName = (NSString *)objc_msgSend(a4, "copy");
      v8->_observers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8->_serviceName = (NSString *)objc_msgSend(a3, "copy");
      v8->_xpcRequestsCache = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      if (a5)
      {
        v8->_observerQueue = (OS_dispatch_queue *)a5;
        dispatch_retain((dispatch_object_t)a5);
      }
    }
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid service name"));
    return 0;
  }
  return v8;
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  OS_xpc_object *listener;
  NSObject *observerQueue;
  objc_super v6;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);
  listener = self->_listener;
  if (listener)
    xpc_release(listener);
  observerQueue = self->_observerQueue;
  if (observerQueue)
    dispatch_release(observerQueue);

  v6.receiver = self;
  v6.super_class = (Class)SSXPCServer;
  -[SSXPCServer dealloc](&v6, sel_dealloc);
}

+ (id)mainServer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__SSXPCServer_mainServer__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = a1;
  if (mainServer_sOnce != -1)
    dispatch_once(&mainServer_sOnce, block);
  return (id)mainServer_sMainServer;
}

uint64_t __25__SSXPCServer_mainServer__block_invoke()
{
  uint64_t result;

  mainServer_sMainServerQueue = (uint64_t)dispatch_queue_create("com.apple.StoreServices.SSXPCServer.main", 0);
  result = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithServiceName:entitlement:queue:", CFSTR("com.apple.itunesstored.xpc"), 0, mainServer_sMainServerQueue);
  mainServer_sMainServer = result;
  return result;
}

- (void)addObserver:(id)a3 selector:(SEL)a4 forMessage:(int64_t)a5
{
  NSObject *dispatchQueue;
  _QWORD v6[8];

  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SSXPCServer_addObserver_selector_forMessage___block_invoke;
  v6[3] = &unk_1E47BD6C0;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a5;
  v6[7] = a4;
  dispatch_sync(dispatchQueue, v6);
}

void __47__SSXPCServer_addObserver_selector_forMessage___block_invoke(_QWORD *a1)
{
  id v2;
  id v3;
  SSXPCServerObserver *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", a1[6]);
  v2 = (id)objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:");
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1[4] + 40), "setObject:forKey:", v2, v5);
    v3 = v2;
  }
  v4 = objc_alloc_init(SSXPCServerObserver);
  -[SSXPCServerObserver setObserver:](v4, "setObserver:", a1[5]);
  -[SSXPCServerObserver setSelector:](v4, "setSelector:", a1[7]);
  objc_msgSend(v2, "addObject:", v4);

}

- (void)removeObserver:(id)a3 selector:(SEL)a4 forMessage:(int64_t)a5
{
  NSObject *dispatchQueue;
  _QWORD v6[8];

  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SSXPCServer_removeObserver_selector_forMessage___block_invoke;
  v6[3] = &unk_1E47BD6C0;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a5;
  v6[7] = a4;
  dispatch_sync(dispatchQueue, v6);
}

void __50__SSXPCServer_removeObserver_selector_forMessage___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  SSXPCServerObserver *v4;
  uint64_t v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", a1[6]);
  v2 = objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:");
  if (v2)
  {
    v3 = (void *)v2;
    v4 = objc_alloc_init(SSXPCServerObserver);
    -[SSXPCServerObserver setObserver:](v4, "setObserver:", a1[5]);
    -[SSXPCServerObserver setSelector:](v4, "setSelector:", a1[7]);
    v5 = objc_msgSend(v3, "indexOfObject:", a1[5]);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v3, "removeObjectAtIndex:", v5);

  }
}

- (void)start
{
  NSObject *observerQueue;
  OS_xpc_object *mach_service;
  _QWORD v5[6];
  _QWORD v6[6];

  observerQueue = self->_observerQueue;
  if (!observerQueue)
    observerQueue = dispatch_get_global_queue(0, 0);
  mach_service = xpc_connection_create_mach_service(-[NSString UTF8String](self->_serviceName, "UTF8String"), observerQueue, 1uLL);
  self->_listener = mach_service;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = __Block_byref_object_copy__37;
  v6[4] = __Block_byref_object_dispose__37;
  v6[5] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __20__SSXPCServer_start__block_invoke;
  v5[3] = &unk_1E47BD0D8;
  v5[4] = observerQueue;
  v5[5] = v6;
  xpc_connection_set_event_handler(mach_service, v5);
  xpc_connection_resume(self->_listener);
  _Block_object_dispose(v6, 8);
}

uint64_t __62__SSXPCServer__recordCoreAnalyticsEventForClient_andSelector___block_invoke_2(uint64_t a1)
{
  _QWORD v2[2];
  __int128 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Client");
  v2[1] = CFSTR("Selector");
  v3 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v3, v2, 2);
}

@end
