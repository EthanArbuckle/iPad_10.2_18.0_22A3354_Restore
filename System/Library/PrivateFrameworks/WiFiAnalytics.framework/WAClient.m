@implementation WAClient

- (void)_wakeUpNotificationForThisClientReceived:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__WAClient__wakeUpNotificationForThisClientReceived___block_invoke;
  v6[3] = &unk_24CDDE2F8;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __53__WAClient__wakeUpNotificationForThisClientReceived___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "daemonConnectionValid");
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = 136446466;
      v8 = "-[WAClient _wakeUpNotificationForThisClientReceived:]_block_invoke";
      v9 = 1024;
      v10 = 1189;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: Received 'wake up' notification, but this client has no indication the connection is dead (daemonConnectionValid == true). Not starting connection recovery", (uint8_t *)&v7, 0x12u);
    }

  }
  else
  {
    if (v6)
    {
      v7 = 136446466;
      v8 = "-[WAClient _wakeUpNotificationForThisClientReceived:]_block_invoke";
      v9 = 1024;
      v10 = 1186;
      _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: Received 'wake up' notification, establishing a connection to the daemon now...", (uint8_t *)&v7, 0x12u);
    }

    objc_msgSend(WeakRetained, "_startConnectionRecovery");
  }

  objc_autoreleasePoolPop(v2);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unsigned)daemonConnectionValid
{
  return self->_daemonConnectionValid;
}

+ (id)sharedClient
{
  return +[WAClient sharedClientWithIdentifier:](WAClient, "sharedClientWithIdentifier:", 0);
}

+ (id)sharedClientWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__WAClient_sharedClientWithIdentifier___block_invoke;
  block[3] = &unk_24CDDCCF8;
  v11 = v3;
  v4 = qword_253D3A4C0;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_253D3A4C0, block);
    v7 = v11;
  }
  v8 = (id)_MergedGlobals_4;

  return v8;
}

void __39__WAClient_sharedClientWithIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  __CFString *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (WAInitLogging_onceToken != -1)
    dispatch_once(&WAInitLogging_onceToken, &__block_literal_global_1);
  v2 = *(id *)(a1 + 32);
  +[WAUtil getValueForEntitlementForCurrentProcess:](WAUtil, "getValueForEntitlementForCurrentProcess:", CFSTR("keychain-access-groups"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446466;
      v15 = "+[WAClient sharedClientWithIdentifier:]_block_invoke";
      v16 = 1024;
      v17 = 112;
      v9 = "%{public}s::%d:XPC: no keychain-access-groups entries for this client";
      v10 = v8;
      v11 = 18;
LABEL_17:
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v14, v11);
    }
LABEL_18:

    goto LABEL_8;
  }
  if ((objc_msgSend(v3, "containsObject:", CFSTR("wifianalyticsd")) & 1) == 0)
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446722;
      v15 = "+[WAClient sharedClientWithIdentifier:]_block_invoke";
      v16 = 1024;
      v17 = 113;
      v18 = 2112;
      v19 = CFSTR("wifianalyticsd");
      v9 = "%{public}s::%d:XPC: keychain-access-groups entries do NOT contain %@ for this client. WiFiAnalytics will be u"
           "nusable until the required entitlement is added";
      v10 = v8;
      v11 = 28;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (v2
    || (objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "bundleIdentifier"),
        v2 = objc_claimAutoreleasedReturnValue(),
        v4,
        v2))
  {
    v5 = -[WAClient _initPrivate]([WAClient alloc], "_initPrivate");
    v6 = (void *)_MergedGlobals_4;
    _MergedGlobals_4 = (uint64_t)v5;

    objc_msgSend((id)_MergedGlobals_4, "setIdentifierForThisClient:", v2);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "infoDictionary");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 136446722;
      v15 = "+[WAClient sharedClientWithIdentifier:]_block_invoke";
      v16 = 1024;
      v17 = 116;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't determine an identify for this client, so access token can't be stored. WiFiAnalytics is disabled. :%@", (uint8_t *)&v14, 0x1Cu);

    }
  }
LABEL_8:

  if (!_MergedGlobals_4)
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446466;
      v15 = "+[WAClient sharedClientWithIdentifier:]_block_invoke";
      v16 = 1024;
      v17 = 121;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to get WAClient sharedClient instance. Check for logged errors above this one", (uint8_t *)&v14, 0x12u);
    }

  }
}

- (WAClient)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("-[WAClient init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WAClient;
  -[WAClient dealloc](&v4, sel_dealloc);
}

- (void)registerMessageGroup:(int64_t)a3 andReply:(id)a4
{
  -[WAClient _registerMessageGroup:andReply:queuedInvocation:](self, "_registerMessageGroup:andReply:queuedInvocation:", a3, a4, 0);
}

- (void)_registerMessageGroup:(int64_t)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  WAClient *v16;
  id v17;
  id v18[3];
  id location;

  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WAClient__registerMessageGroup_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_24CDDE0B8;
  objc_copyWeak(v18, &location);
  v18[1] = (id)a3;
  v18[2] = (id)a2;
  v15 = v10;
  v16 = self;
  v17 = v9;
  v12 = v9;
  v13 = v10;
  dispatch_async(v11, block);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __60__WAClient__registerMessageGroup_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  WAQueuedInvocation *v6;
  InvokeMakerInfo *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void (**v15)(void);
  NSObject *v16;
  _QWORD v17[4];
  WAQueuedInvocation *v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "registeredGroupTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  v6 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!v6)
  {
    v6 = objc_alloc_init(WAQueuedInvocation);
    v7 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
    v8 = *(_QWORD *)(a1 + 64);
    v9 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 48));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v7, v8, v9, v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v6, "setInvocation:", v10);
    -[WAQueuedInvocation setReply:](v6, "setReply:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v6);

  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 64);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __60__WAClient__registerMessageGroup_andReply_queuedInvocation___block_invoke_66;
    v17[3] = &unk_24CDDE090;
    v19 = v14;
    v18 = v6;
    objc_msgSend(v13, "registerMessageGroup:andReply:", v14, v17);

    v15 = (void (**)(void))v18;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[WAClient _registerMessageGroup:andReply:queuedInvocation:]_block_invoke";
      v22 = 1024;
      v23 = 163;
      _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v15[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __60__WAClient__registerMessageGroup_andReply_queuedInvocation___block_invoke_64(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _registerMessageGroup:andReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 167;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - registerMessageGroup - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __60__WAClient__registerMessageGroup_andReply_queuedInvocation___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    +[WAUtil groupTypeToString:](WAUtil, "groupTypeToString:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446722;
    v18 = "-[WAClient _registerMessageGroup:andReply:queuedInvocation:]_block_invoke";
    v19 = 1024;
    v20 = 170;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_INFO, "%{public}s::%d:XPC: WAClient - registerMessageGroup - %@ - DONE", buf, 0x1Cu);

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "replyQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WAClient__registerMessageGroup_andReply_queuedInvocation___block_invoke_67;
  block[3] = &unk_24CDDE068;
  v14 = *(id *)(a1 + 32);
  v15 = v5;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v10, block);

}

void __60__WAClient__registerMessageGroup_andReply_queuedInvocation___block_invoke_67(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 andReply:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "numberWithBool:", 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[WAClient _getNewMessageForKey:groupType:withCopy:andReply:queuedInvocation:](self, "_getNewMessageForKey:groupType:withCopy:andReply:queuedInvocation:", v10, a4, v11, v9, 0);

}

- (void)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(id)a5 andReply:(id)a6
{
  -[WAClient _getNewMessageForKey:groupType:withCopy:andReply:queuedInvocation:](self, "_getNewMessageForKey:groupType:withCopy:andReply:queuedInvocation:", a3, a4, a5, a6, 0);
}

- (void)_getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(id)a5 andReply:(id)a6 queuedInvocation:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  WAClient *v24;
  id v25;
  id v26;
  id v27;
  id v28[3];
  id location;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__WAClient__getNewMessageForKey_groupType_withCopy_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_24CDDE128;
  objc_copyWeak(v28, &location);
  v23 = v16;
  v24 = self;
  v28[1] = (id)a2;
  v28[2] = (id)a4;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v16;
  dispatch_async(v17, block);

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

void __78__WAClient__getNewMessageForKey_groupType_withCopy_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  InvokeMakerInfo *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(void);
  NSObject *v18;
  _QWORD v19[4];
  WAQueuedInvocation *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!v4)
  {
    v4 = objc_alloc_init(WAQueuedInvocation);
    v5 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 88);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 64));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v5, v7, v6, v8, v9, v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v4, "setInvocation:", v10);
    -[WAQueuedInvocation setReply:](v4, "setReply:", *(_QWORD *)(a1 + 64));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v4);

  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_70);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 88);
    v16 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __78__WAClient__getNewMessageForKey_groupType_withCopy_andReply_queuedInvocation___block_invoke_71;
    v19[3] = &unk_24CDDE100;
    v20 = v4;
    objc_msgSend(v13, "getNewMessageForKey:groupType:withCopy:andReply:", v16, v14, v15, v19);

    v17 = (void (**)(void))v20;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v22 = "-[WAClient _getNewMessageForKey:groupType:withCopy:andReply:queuedInvocation:]_block_invoke";
      v23 = 1024;
      v24 = 210;
      _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v17[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __78__WAClient__getNewMessageForKey_groupType_withCopy_andReply_queuedInvocation___block_invoke_69(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _getNewMessageForKey:groupType:withCopy:andReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 215;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - getNewMessageForKey - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __78__WAClient__getNewMessageForKey_groupType_withCopy_andReply_queuedInvocation___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replyQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__WAClient__getNewMessageForKey_groupType_withCopy_andReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_24CDDE068;
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

}

void __78__WAClient__getNewMessageForKey_groupType_withCopy_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)_dequeueInvocation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[WAClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__WAClient__dequeueInvocation___block_invoke;
  block[3] = &unk_24CDDCCF8;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __31__WAClient__dequeueInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "setInvocation:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setReply:", 0);
  +[WAClient sharedClient](WAClient, "sharedClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queuedInvocations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)submitMessage:(id)a3 groupType:(int64_t)a4 andReply:(id)a5
{
  -[WAClient _submitMessage:groupType:andReply:queuedInvocation:](self, "_submitMessage:groupType:andReply:queuedInvocation:", a3, a4, a5, 0);
}

- (void)_submitMessage:(id)a3 groupType:(int64_t)a4 andReply:(id)a5 queuedInvocation:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  WAClient *v19;
  id v20;
  id v21;
  id v22[3];
  id location;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  if (v11)
  {
    -[WAClient queue](self, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __63__WAClient__submitMessage_groupType_andReply_queuedInvocation___block_invoke;
    v17[3] = &unk_24CDDE170;
    objc_copyWeak(v22, &location);
    v15 = v13;
    v22[1] = (id)a2;
    v18 = v15;
    v19 = self;
    v20 = v11;
    v22[2] = (id)a4;
    v21 = v12;
    dispatch_async(v14, v17);

    objc_destroyWeak(v22);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v25 = "-[WAClient _submitMessage:groupType:andReply:queuedInvocation:]";
      v26 = 1024;
      v27 = 247;
      _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:message argument is null, bailing", buf, 0x12u);
    }

  }
  objc_destroyWeak(&location);

}

void __63__WAClient__submitMessage_groupType_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(void);
  NSObject *v17;
  _QWORD v18[4];
  void (**v19)(void);
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 80);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 56));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v8, v7, v9, v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v10);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 56));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_73);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 80);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __63__WAClient__submitMessage_groupType_andReply_queuedInvocation___block_invoke_74;
    v18[3] = &unk_24CDDE100;
    v19 = v4;
    objc_msgSend(v13, "submitMessage:groupType:andReply:", v14, v15, v18);

    v16 = v19;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[WAClient _submitMessage:groupType:andReply:queuedInvocation:]_block_invoke";
      v22 = 1024;
      v23 = 262;
      _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v16[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __63__WAClient__submitMessage_groupType_andReply_queuedInvocation___block_invoke_72(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _submitMessage:groupType:andReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 268;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - submitMessage - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __63__WAClient__submitMessage_groupType_andReply_queuedInvocation___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replyQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__WAClient__submitMessage_groupType_andReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_24CDDE068;
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

}

void __63__WAClient__submitMessage_groupType_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (id)wifianalyticsTmpDirectory
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/tmp/com.apple.wifianalyticsd/wifianalytics"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
LABEL_11:
    v9 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, 0);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v12);
    v7 = v12;

    if (v7)
    {
      WALogCategoryDefaultHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v14 = "-[WAClient wifianalyticsTmpDirectory]";
        v15 = 1024;
        v16 = 304;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to create wifianalytics tmp directory with error %@", buf, 0x1Cu);
      }

      goto LABEL_11;
    }
  }
  WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v14 = "-[WAClient wifianalyticsTmpDirectory]";
    v15 = 1024;
    v16 = 306;
    v17 = 2112;
    v18 = v2;
    _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:wifianalyticsDirectory: %@", buf, 0x1Cu);
  }

  v9 = v2;
LABEL_7:

  return v9;
}

- (int64_t)_writeWiFiAnalyticsMessageToJSONFile:(id)a3 metricInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  __uint64_t v18;
  void *v19;
  int v20;
  __uint64_t v21;
  id v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  int *v27;
  char *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int64_t v36;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  char *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v7) & 1) != 0)
  {
    v48 = v6;
    v8 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd-HHmmssSSS"));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v47 = (void *)v10;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("wifianalytics_%@.json"), v10);
    v11 = objc_claimAutoreleasedReturnValue();
    -[WAClient wifianalyticsTmpDir](self, "wifianalyticsTmpDir");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v7, 3, &v54);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v54;
    v46 = (void *)v14;
    if (v15)
    {
      v16 = v15;
      WALogCategoryDefaultHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v56 = "-[WAClient _writeWiFiAnalyticsMessageToJSONFile:metricInfo:]";
        v57 = 1024;
        v58 = 360;
        v59 = 2112;
        v60 = (uint64_t)v11;
        v61 = 2112;
        v62 = v16;
        _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to write to file %@ error %@", buf, 0x26u);
      }
    }
    else
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v14, 4);
      v53 = 0;
      -[NSObject writeToURL:atomically:encoding:error:](v17, "writeToURL:atomically:encoding:error:", v13, 1, 4, &v53);
      v16 = v53;
      v18 = clock_gettime_nsec_np(_CLOCK_REALTIME);
      -[WAClient identifierForThisClient](self, "identifierForThisClient");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("xctests"));

      if (v20)
        v21 = clock_gettime_nsec_np(_CLOCK_REALTIME) + 10000000000;
      else
        v21 = v18 + 172800000000000;
      v49 = xmmword_21267AA70;
      v50 = xmmword_21267AA80;
      v51 = v21;
      v52 = 0;
      objc_msgSend(v13, "path");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = fsctl((const char *)objc_msgSend(v22, "cStringUsingEncoding:", 4), 0xC0304A6FuLL, &v49, 0);

      WALogCategoryDefaultHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v23)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "path");
          v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v38 = objc_msgSend(v44, "cStringUsingEncoding:", 4);
          v40 = (void *)v49;
          v42 = v50;
          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(v21 / 0x3B9ACA00));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = __error();
          v28 = strerror(*v27);
          *(_DWORD *)buf = 136448002;
          v56 = "-[WAClient _writeWiFiAnalyticsMessageToJSONFile:metricInfo:]";
          v57 = 1024;
          v58 = 357;
          v59 = 2080;
          v60 = v38;
          v61 = 2048;
          v62 = v40;
          v63 = 2048;
          v64 = v42;
          v65 = 2112;
          v66 = v26;
          v67 = 1024;
          v68 = v23;
          v69 = 2080;
          v70 = v28;
          _os_log_impl(&dword_212581000, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to mark %s as purgeable with flags 0x%llx, supplemental 0x%llx, notBeforeDate:%@: (%d) %s\n", buf, 0x4Au);

        }
      }
      else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "path");
        v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v39 = objc_msgSend(v45, "cStringUsingEncoding:", 4);
        v41 = (void *)v49;
        v43 = v50;
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(v21 / 0x3B9ACA00));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136447490;
        v56 = "-[WAClient _writeWiFiAnalyticsMessageToJSONFile:metricInfo:]";
        v57 = 1024;
        v58 = 353;
        v59 = 2080;
        v60 = v39;
        v61 = 2048;
        v62 = v41;
        v63 = 2048;
        v64 = v43;
        v65 = 2112;
        v66 = v29;
        _os_log_impl(&dword_212581000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Marked %s purgeable with flags 0x%llx (supplemental 0x%llx notBeforeDate:%@)\n", buf, 0x3Au);

      }
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAClient wifianalyticsTmpDir](self, "wifianalyticsTmpDir");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "path");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "contentsOfDirectoryAtPath:error:", v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF EndsWith '.json'"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "filteredArrayUsingPredicate:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_msgSend(v35, "count");
    v6 = v48;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v56 = "-[WAClient _writeWiFiAnalyticsMessageToJSONFile:metricInfo:]";
      v57 = 1024;
      v58 = 326;
      v59 = 2112;
      v60 = (uint64_t)v6;
      _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:Invalid data passed to JSON serialization for %@", buf, 0x1Cu);
    }
    v36 = -1;
  }

  return v36;
}

- (int64_t)_processWAMessageForJSONDump:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int64_t v41;
  void *v42;
  NSObject *v43;
  WAClient *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  _BYTE v57[24];
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_processWAMessageForJSONDump", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v55 = "-[WAClient _processWAMessageForJSONDump:]";
      v56 = 1024;
      *(_DWORD *)v57 = 379;
      _os_log_impl(&dword_212581000, v38, OS_LOG_TYPE_ERROR, "%{public}s::%d:Null jsonDict", buf, 0x12u);
    }
    v41 = 0;
LABEL_36:

    goto LABEL_38;
  }
  v45 = self;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v4, "metricInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (!v9)
    goto LABEL_33;
  v10 = v9;
  v11 = *(_QWORD *)v51;
  v46 = v6;
  v47 = v8;
  v49 = *(_QWORD *)v51;
  do
  {
    v12 = 0;
    v48 = v10;
    do
    {
      if (*(_QWORD *)v51 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v12);
      objc_msgSend(v4, "metricInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("options"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      if ((v17 & 2) != 0)
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("value"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("value"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if ((isKindOfClass & 1) != 0)
        {
          v22 = objc_retainAutorelease(v20);
          v23 = objc_msgSend(v22, "bytes");
          if (v23)
          {
            v24 = v23;
            v25 = v4;
            objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 2 * objc_msgSend(v22, "length"));
            v26 = objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "length"))
            {
              v27 = 0;
              while (1)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02lx"), *(unsigned __int8 *)(v24 + v27));
                v28 = objc_claimAutoreleasedReturnValue();
                if (!v28)
                  break;
                v29 = (void *)v28;
                -[NSObject appendString:](v26, "appendString:", v28);

                if (++v27 >= (unint64_t)objc_msgSend(v22, "length"))
                  goto LABEL_16;
              }
              WALogCategoryDefaultHandle();
              v32 = objc_claimAutoreleasedReturnValue();
              v4 = v25;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v25, "metricName");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("value"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136447234;
                v55 = "-[WAClient _processWAMessageForJSONDump:]";
                v56 = 1024;
                *(_DWORD *)v57 = 397;
                *(_WORD *)&v57[4] = 2112;
                *(_QWORD *)&v57[6] = v33;
                *(_WORD *)&v57[14] = 2112;
                *(_QWORD *)&v57[16] = v13;
                v58 = 2112;
                v59 = v34;
                _os_log_impl(&dword_212581000, v32, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to convert to hex %@ field %@ with value %@", buf, 0x30u);

              }
              v6 = v46;
              v10 = v48;
LABEL_25:
              WALogCategoryDefaultHandle();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v4, "metricName");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("value"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136447234;
                v55 = "-[WAClient _processWAMessageForJSONDump:]";
                v56 = 1024;
                *(_DWORD *)v57 = 405;
                *(_WORD *)&v57[4] = 2112;
                *(_QWORD *)&v57[6] = v36;
                *(_WORD *)&v57[14] = 2112;
                *(_QWORD *)&v57[16] = v13;
                v58 = 2112;
                v59 = v37;
                _os_log_impl(&dword_212581000, v35, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to convert %@ field %@ with value %@", buf, 0x30u);

                v10 = v48;
              }

            }
            else
            {
LABEL_16:
              v4 = v25;
              v6 = v46;
              v10 = v48;
              if (!v26)
                goto LABEL_25;
              objc_msgSend(v46, "setObject:forKey:", v26, v13);
            }
            v8 = v47;
          }
          else
          {
            WALogCategoryDefaultHandle();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v4, "metricName");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("value"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136447234;
              v55 = "-[WAClient _processWAMessageForJSONDump:]";
              v56 = 1024;
              *(_DWORD *)v57 = 408;
              *(_WORD *)&v57[4] = 2112;
              *(_QWORD *)&v57[6] = v30;
              *(_WORD *)&v57[14] = 2112;
              *(_QWORD *)&v57[16] = v13;
              v58 = 2112;
              v59 = v31;
              _os_log_impl(&dword_212581000, v26, OS_LOG_TYPE_ERROR, "%{public}s::%d:Invalid data - %@ field %@ with value %@", buf, 0x30u);

              v8 = v47;
            }
            v10 = v48;
          }

        }
        else
        {
          objc_msgSend(v6, "setObject:forKey:", v20, v13);
        }

        v11 = v49;
      }

      ++v12;
    }
    while (v12 != v10);
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  }
  while (v10);
LABEL_33:

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v38 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metricName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setValue:forKey:](v38, "setValue:forKey:", v6, v39);

    objc_msgSend(v4, "metricName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[WAClient _writeWiFiAnalyticsMessageToJSONFile:metricInfo:](v45, "_writeWiFiAnalyticsMessageToJSONFile:metricInfo:", v40, v38);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "metricName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v55 = "-[WAClient _processWAMessageForJSONDump:]";
      v56 = 2112;
      *(_QWORD *)v57 = v42;
      *(_WORD *)&v57[8] = 2048;
      *(_QWORD *)&v57[10] = v41;
      _os_log_impl(&dword_212581000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "{ADAPTIVE-ROAM} %s: metric name: %@ (current files on disk:%ld)", buf, 0x20u);

    }
    goto LABEL_36;
  }
  v41 = 0;
LABEL_38:
  WALogCategoryDefaultHandle();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v43, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_processWAMessageForJSONDump", ", buf, 2u);
  }

  return v41;
}

- (void)_processWAMessageForCoreAnalytics:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_processWAMessageForCoreAnalytics", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v28 = "-[WAClient _processWAMessageForCoreAnalytics:]";
      v29 = 1024;
      v30 = 435;
      v31 = 2080;
      v32 = "-[WAClient _processWAMessageForCoreAnalytics:]";
      _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: Null coreAnalyticsDict", buf, 0x1Cu);
    }
    goto LABEL_15;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v20, "metricInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v20, "metricInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("options"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");

        if ((v14 & 1) != 0)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("value"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", v15, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v20, "metricName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    AnalyticsSendEventLazy();

    v17 = v21;
LABEL_15:

  }
  WALogCategoryDefaultHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_processWAMessageForCoreAnalytics", ", buf, 2u);
  }

}

id __46__WAClient__processWAMessageForCoreAnalytics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)submitWiFiAnalyticsMessageAdvanced:(id)a3
{
  -[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:](self, "_submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:", a3, 0, 0);
}

- (void)_submitWiFiAnalyticsMessageAdvanced:(id)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  _QWORD block[4];
  NSObject *v19;
  WAClient *v20;
  id v21;
  id v22;
  id v23[2];
  id location;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_initWeak(&location, self);
  if (!v9)
  {
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_DWORD *)buf = 136446466;
    v26 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]";
    v27 = 1024;
    v28 = 466;
    v17 = "%{public}s::%d:message argument is null, bailing";
    goto LABEL_7;
  }
  objc_msgSend(v9, "metricName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12
    || (objc_msgSend(v9, "metricInfo"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = v13 == 0,
        v13,
        v12,
        v14))
  {
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_DWORD *)buf = 136446466;
    v26 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]";
    v27 = 1024;
    v28 = 467;
    v17 = "%{public}s::%d:NULL metricName or NULL metricInfo";
LABEL_7:
    _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x12u);
    goto LABEL_8;
  }
  -[WAClient queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_24CDDE390;
  v19 = v9;
  v20 = self;
  objc_copyWeak(v23, &location);
  v21 = v11;
  v23[1] = (id)a2;
  v22 = v10;
  dispatch_async(v15, block);

  objc_destroyWeak(v23);
  v16 = v19;
LABEL_8:

  objc_destroyWeak(&location);
}

void __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id WeakRetained;
  WAQueuedInvocation *v6;
  WAQueuedInvocation *v7;
  InvokeMakerInfo *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void (**v16)(void);
  NSObject *v17;
  NSObject *v18;
  int8x16_t v19;
  _QWORD v20[4];
  void (**v21)(void);
  _QWORD block[4];
  int8x16_t v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  if ((objc_msgSend(*(id *)(a1 + 32), "options") & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "_processWAMessageForCoreAnalytics:", *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(*(id *)(a1 + 32), "options") & 2) != 0
    && +[WAUtil isWritingWAMessageToJsonAllowed](WAUtil, "isWritingWAMessageToJsonAllowed")
    && +[WAUtil isAnalyticsProcessorAllowed](WAUtil, "isAnalyticsProcessorAllowed"))
  {
    objc_msgSend(*(id *)(a1 + 40), "fileHandlingQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_2;
    block[3] = &unk_24CDDE348;
    v19 = *(int8x16_t *)(a1 + 32);
    v4 = (id)v19.i64[0];
    v23 = vextq_s8(v19, v19, 8uLL);
    objc_copyWeak(&v24, (id *)(a1 + 64));
    dispatch_async(v3, block);

    objc_destroyWeak(&v24);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "options") & 0x10) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v6 = (WAQueuedInvocation *)*(id *)(a1 + 48);
    if (!*(_QWORD *)(a1 + 48))
    {
      v7 = objc_alloc_init(WAQueuedInvocation);

      v8 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
      v9 = *(_QWORD *)(a1 + 32);
      v10 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 56));
      +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v8, v9, v10, v7, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[WAQueuedInvocation setInvocation:](v7, "setInvocation:", v11);
      -[WAQueuedInvocation setReply:](v7, "setReply:", *(_QWORD *)(a1 + 56));
      objc_msgSend(WeakRetained, "queuedInvocations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v7);

      v6 = v7;
    }
    if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
    {
      objc_msgSend(WeakRetained, "conn");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_108);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_109;
      v20[3] = &unk_24CDDE100;
      v21 = v6;
      objc_msgSend(v14, "submitWiFiAnalyticsMessageAdvanced:andReply:", v15, v20);

      v16 = v21;
    }
    else
    {
      WALogCategoryDefaultHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v26 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke";
        v27 = 1024;
        v28 = 544;
        _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
      }

      objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
      v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v16[2]();
    }

    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke_3";
      v27 = 1024;
      v28 = 563;
      _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: WAClient - submitWiFiAnalyticsMessageAdvanced - done", buf, 0x12u);
    }

  }
  objc_autoreleasePoolPop(v2);
}

void __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_2(id *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  int v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  NSObject *v27;
  id WeakRetained;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void (**v33)(void);
  NSObject *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  void (**v39)(void);
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  const __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  v3 = objc_msgSend(a1[4], "_processWAMessageForJSONDump:", a1[5]);
  objc_msgSend(a1[5], "metricInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metricProcessImmediately"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      if ((v9 & 1) != 0)
        goto LABEL_9;
    }
  }
  if (+[WAUtil shouldProcessAnalyticsImmediately](WAUtil, "shouldProcessAnalyticsImmediately") || v3 > 49)
    goto LABEL_8;
  objc_msgSend(a1[4], "deviceAnalyticsConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("WA_DEVICE_ANALYTICS_PROCESSING_INTERVAL"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v21 = 0;
    goto LABEL_14;
  }
  v12 = (void *)v11;
  objc_msgSend(a1[4], "deviceAnalyticsConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("WA_DEVICE_ANALYTICS_PROCESSING_INTERVAL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  if (v16 < 1.0)
  {
LABEL_8:
    if (!v5)
    {
LABEL_12:
      v22 = a1[5];
      v21 = 1;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addFieldForKey:value:options:", CFSTR("metricProcessImmediately"), v10, 2);
LABEL_14:

      goto LABEL_15;
    }
LABEL_9:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");

      if ((v20 & 1) != 0)
      {
        v21 = 1;
        goto LABEL_15;
      }
    }
    goto LABEL_12;
  }
  v21 = 0;
LABEL_15:
  WALogCategoryDefaultHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[5], "metricName");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    *(_DWORD *)buf = 136447234;
    v41 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke_2";
    v26 = CFSTR("NO");
    v42 = 1024;
    v43 = 498;
    if (v21)
      v26 = CFSTR("YES");
    v44 = 2112;
    v45 = v24;
    v46 = 2112;
    v47 = CFSTR("metricProcessImmediately");
    v48 = 2112;
    v49 = v26;
    _os_log_impl(&dword_212581000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:message(%@)[%@]:%@", buf, 0x30u);

  }
  if (v21)
  {
    WALogCategoryDefaultHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke";
      v42 = 1024;
      v43 = 502;
      _os_log_impl(&dword_212581000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:ProcessJournalImmediately", buf, 0x12u);
    }

    WeakRetained = objc_loadWeakRetained(a1 + 6);
    if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
    {
      objc_msgSend(WeakRetained, "conn");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x24BDAC760];
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_105;
      v38[3] = &unk_24CDDE198;
      v39 = (void (**)(void))a1[5];
      objc_msgSend(v29, "remoteObjectProxyWithErrorHandler:", v38);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = a1[5];
      v36[0] = v30;
      v36[1] = 3221225472;
      v36[2] = __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_106;
      v36[3] = &unk_24CDDE100;
      v37 = v32;
      objc_msgSend(v31, "submitWiFiAnalyticsMessageAdvanced:andReply:", v37, v36);

      v33 = v39;
    }
    else
    {
      WALogCategoryDefaultHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(a1[5], "metricName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v41 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke";
        v42 = 1024;
        v43 = 509;
        v44 = 2112;
        v45 = (uint64_t)v35;
        _os_log_impl(&dword_212581000, v34, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, connection establishment about to be initiated... (%@ has been written on disk but XPC won't be called)", buf, 0x1Cu);

      }
      objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
      v33 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v33[2]();
    }

  }
  objc_autoreleasePoolPop(v2);
}

void __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "metricName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136446978;
    v7 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke";
    v8 = 1024;
    v9 = 516;
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - submitWiFiAnalyticsMessageAdvanced:%@ - error: %@", (uint8_t *)&v6, 0x26u);

  }
}

void __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_106(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_reregister");

  }
  WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "metricName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136446978;
      v14 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke";
      v15 = 1024;
      v16 = 521;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v4;
      v9 = "%{public}s::%d:WAClient - FAILED to submitWiFiAnalyticsMessageAdvanced:%@ - error: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 38;
LABEL_8:
      _os_log_impl(&dword_212581000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "metricName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136446722;
    v14 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke";
    v15 = 1024;
    v16 = 523;
    v17 = 2112;
    v18 = v8;
    v9 = "%{public}s::%d:Successfully Sent %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 28;
    goto LABEL_8;
  }

}

void __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_107(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _submitWiFiAnalyticsMessageAdvanced:andReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 550;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - submitWiFiAnalyticsMessageAdvanced - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_109(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replyQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_2_110;
  block[3] = &unk_24CDDE068;
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

}

void __74__WAClient__submitWiFiAnalyticsMessageAdvanced_andReply_queuedInvocation___block_invoke_2_110(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)triggerQueryForNWActivity:(int64_t)a3 andReply:(id)a4
{
  -[WAClient _triggerQueryForNWActivity:andReply:queuedInvocation:](self, "_triggerQueryForNWActivity:andReply:queuedInvocation:", a3, a4, 0);
}

- (void)_triggerQueryForNWActivity:(int64_t)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  WAClient *v16;
  id v17;
  id v18[3];
  id location;

  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__WAClient__triggerQueryForNWActivity_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_24CDDE0B8;
  objc_copyWeak(v18, &location);
  v15 = v10;
  v16 = self;
  v18[1] = (id)a2;
  v18[2] = (id)a3;
  v17 = v9;
  v12 = v9;
  v13 = v10;
  dispatch_async(v11, block);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __65__WAClient__triggerQueryForNWActivity_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  InvokeMakerInfo *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void (**v13)(void);
  NSObject *v14;
  _QWORD v15[4];
  WAQueuedInvocation *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!v4)
  {
    v4 = objc_alloc_init(WAQueuedInvocation);
    v5 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 72);
    v7 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 48));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v5, v6, v7, v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v4, "setInvocation:", v8);
    -[WAQueuedInvocation setReply:](v4, "setReply:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v4);

  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_112);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 72);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __65__WAClient__triggerQueryForNWActivity_andReply_queuedInvocation___block_invoke_113;
    v15[3] = &unk_24CDDE100;
    v16 = v4;
    objc_msgSend(v11, "triggerQueryForNWActivity:andReply:", v12, v15);

    v13 = (void (**)(void))v16;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[WAClient _triggerQueryForNWActivity:andReply:queuedInvocation:]_block_invoke";
      v19 = 1024;
      v20 = 624;
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v13[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __65__WAClient__triggerQueryForNWActivity_andReply_queuedInvocation___block_invoke_111(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _triggerQueryForNWActivity:andReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 628;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - triggerQueryForNWActivity - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __65__WAClient__triggerQueryForNWActivity_andReply_queuedInvocation___block_invoke_113(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)buf = 136446722;
    v24 = "-[WAClient _triggerQueryForNWActivity:andReply:queuedInvocation:]_block_invoke";
    v25 = 1024;
    v26 = 632;
    v27 = 2112;
    v28 = v6;
    v9 = "%{public}s::%d:XPC: WAClient - triggerQueryForNWActivity - error: %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 28;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 136446466;
    v24 = "-[WAClient _triggerQueryForNWActivity:andReply:queuedInvocation:]_block_invoke";
    v25 = 1024;
    v26 = 634;
    v9 = "%{public}s::%d:WAClient - triggerQueryForNWActivity - success";
    v10 = v8;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 18;
  }
  _os_log_impl(&dword_212581000, v10, v11, v9, buf, v12);
LABEL_7:

  v13 = v6;
  if (objc_msgSend(v13, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "replyQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__WAClient__triggerQueryForNWActivity_andReply_queuedInvocation___block_invoke_114;
  block[3] = &unk_24CDDE068;
  v20 = *(id *)(a1 + 32);
  v21 = v5;
  v22 = v13;
  v17 = v13;
  v18 = v5;
  dispatch_async(v16, block);

}

void __65__WAClient__triggerQueryForNWActivity_andReply_queuedInvocation___block_invoke_114(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)convertWiFiStatsIntoPercentile:(id)a3 analysisGroup:(int64_t)a4 groupTarget:(id)a5 andReply:(id)a6
{
  -[WAClient convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:andReply:queuedInvocation:](self, "convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:andReply:queuedInvocation:", a3, a4, a5, a6, 0);
}

- (void)convertWiFiStatsIntoPercentile:(id)a3 analysisGroup:(int64_t)a4 groupTarget:(id)a5 andReply:(id)a6 queuedInvocation:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  WAClient *v24;
  id v25;
  id v26;
  id v27;
  id v28[3];
  id location;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__WAClient_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_24CDDE128;
  objc_copyWeak(v28, &location);
  v23 = v16;
  v24 = self;
  v28[1] = (id)a2;
  v28[2] = (id)a4;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v16;
  dispatch_async(v17, block);

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

void __95__WAClient_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(void);
  NSObject *v19;
  _QWORD v20[4];
  void (**v21)(void);
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 88);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 64));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v8, v7, v9, v10, v5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v11);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 64));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_116);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 88);
    v17 = *(_QWORD *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 56);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __95__WAClient_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply_queuedInvocation___block_invoke_117;
    v20[3] = &unk_24CDDE100;
    v21 = v4;
    objc_msgSend(v14, "convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:andReply:", v17, v15, v16, v20);

    v18 = v21;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v23 = "-[WAClient convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:andReply:queuedInvocation:]_block_invoke";
      v24 = 1024;
      v25 = 672;
      _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v18[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __95__WAClient_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply_queuedInvocation___block_invoke_115(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:andReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 680;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - convertWiFiStatsIntoPercentile - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __95__WAClient_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply_queuedInvocation___block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)buf = 136446722;
    v24 = "-[WAClient convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:andReply:queuedInvocation:]_block_invoke";
    v25 = 1024;
    v26 = 684;
    v27 = 2112;
    v28 = v6;
    v9 = "%{public}s::%d:XPC: WAClient - convertWiFiStatsIntoPercentile - error: %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 28;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 136446466;
    v24 = "-[WAClient convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:andReply:queuedInvocation:]_block_invoke";
    v25 = 1024;
    v26 = 686;
    v9 = "%{public}s::%d:WAClient - convertWiFiStatsIntoPercentile - success";
    v10 = v8;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 18;
  }
  _os_log_impl(&dword_212581000, v10, v11, v9, buf, v12);
LABEL_7:

  v13 = v6;
  if (objc_msgSend(v13, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "replyQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__WAClient_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply_queuedInvocation___block_invoke_118;
  block[3] = &unk_24CDDE068;
  v20 = *(id *)(a1 + 32);
  v21 = v5;
  v22 = v13;
  v17 = v13;
  v18 = v5;
  dispatch_async(v16, block);

}

void __95__WAClient_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply_queuedInvocation___block_invoke_118(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a3 waMessage:(id)a4 andReply:(id)a5
{
  -[WAClient _triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:queuedInvocation:](self, "_triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:queuedInvocation:", a3, a4, a5, 0);
}

- (void)_triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a3 waMessage:(id)a4 andReply:(id)a5 queuedInvocation:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  WAClient *v20;
  id v21;
  id v22;
  id v23[3];
  id location;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __93__WAClient__triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply_queuedInvocation___block_invoke;
  v18[3] = &unk_24CDDE170;
  objc_copyWeak(v23, &location);
  v19 = v13;
  v20 = self;
  v23[1] = (id)a2;
  v23[2] = (id)a3;
  v21 = v11;
  v22 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  dispatch_async(v14, v18);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

void __93__WAClient__triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  InvokeMakerInfo *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(void);
  NSObject *v16;
  _QWORD v17[4];
  WAQueuedInvocation *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!v4)
  {
    v4 = objc_alloc_init(WAQueuedInvocation);
    v5 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 80);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 56));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v5, v6, v7, v8, v4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v4, "setInvocation:", v9);
    -[WAQueuedInvocation setReply:](v4, "setReply:", *(_QWORD *)(a1 + 56));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v4);

  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_120);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 80);
    v14 = *(_QWORD *)(a1 + 48);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __93__WAClient__triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply_queuedInvocation___block_invoke_121;
    v17[3] = &unk_24CDDE100;
    v18 = v4;
    objc_msgSend(v12, "triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:", v13, v14, v17);

    v15 = (void (**)(void))v18;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v20 = "-[WAClient _triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:queuedInvocation:]_block_invoke";
      v21 = 1024;
      v22 = 727;
      _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v15[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __93__WAClient__triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply_queuedInvocation___block_invoke_119(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 731;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - triggerDatapathDiagnosticsAndCollectUpdates - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __93__WAClient__triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply_queuedInvocation___block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)buf = 136446722;
    v24 = "-[WAClient _triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:queuedInvocation:]_block_invoke";
    v25 = 1024;
    v26 = 735;
    v27 = 2112;
    v28 = v6;
    v9 = "%{public}s::%d:XPC: WAClient - triggerDatapathDiagnosticsAndCollectUpdates - error: %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 28;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 136446466;
    v24 = "-[WAClient _triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:queuedInvocation:]_block_invoke";
    v25 = 1024;
    v26 = 737;
    v9 = "%{public}s::%d:WAClient - triggerDatapathDiagnosticsAndCollectUpdates - success";
    v10 = v8;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 18;
  }
  _os_log_impl(&dword_212581000, v10, v11, v9, buf, v12);
LABEL_7:

  v13 = v6;
  if (objc_msgSend(v13, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "replyQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__WAClient__triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply_queuedInvocation___block_invoke_122;
  block[3] = &unk_24CDDE068;
  v20 = *(id *)(a1 + 32);
  v21 = v5;
  v22 = v13;
  v17 = v13;
  v18 = v5;
  dispatch_async(v16, block);

}

void __93__WAClient__triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply_queuedInvocation___block_invoke_122(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)getDpsStatsandReply:(id)a3
{
  -[WAClient _getDpsStatsandReply:queuedInvocation:](self, "_getDpsStatsandReply:queuedInvocation:", a3, 0);
}

- (void)_getDpsStatsandReply:(id)a3 queuedInvocation:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  WAClient *v14;
  id v15;
  id v16[2];
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__WAClient__getDpsStatsandReply_queuedInvocation___block_invoke;
  v12[3] = &unk_24CDDDD90;
  objc_copyWeak(v16, &location);
  v13 = v8;
  v14 = self;
  v16[1] = (id)a2;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __50__WAClient__getDpsStatsandReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(void);
  NSObject *v13;
  _QWORD v14[4];
  void (**v15)(void);
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v7 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 48));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v8);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_124);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __50__WAClient__getDpsStatsandReply_queuedInvocation___block_invoke_125;
    v14[3] = &unk_24CDDE100;
    v15 = v4;
    objc_msgSend(v11, "getDpsStatsandReply:", v14);

    v12 = v15;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[WAClient _getDpsStatsandReply:queuedInvocation:]_block_invoke";
      v18 = 1024;
      v19 = 771;
      _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v12[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __50__WAClient__getDpsStatsandReply_queuedInvocation___block_invoke_123(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _getDpsStatsandReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 776;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - getDpsStatsandReply - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __50__WAClient__getDpsStatsandReply_queuedInvocation___block_invoke_125(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "-[WAClient _getDpsStatsandReply:queuedInvocation:]_block_invoke";
      v20 = 1024;
      v21 = 780;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - _getDpsStatsandReply - error: %@", buf, 0x1Cu);
    }

  }
  v8 = v6;
  if (objc_msgSend(v8, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "replyQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__WAClient__getDpsStatsandReply_queuedInvocation___block_invoke_126;
  block[3] = &unk_24CDDE068;
  v15 = *(id *)(a1 + 32);
  v16 = v5;
  v17 = v8;
  v12 = v8;
  v13 = v5;
  dispatch_async(v11, block);

}

void __50__WAClient__getDpsStatsandReply_queuedInvocation___block_invoke_126(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)killDaemonAndReply:(id)a3
{
  -[WAClient _killDaemonAndReply:queuedInvocation:](self, "_killDaemonAndReply:queuedInvocation:", a3, 0);
}

- (void)_killDaemonAndReply:(id)a3 queuedInvocation:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  WAClient *v14;
  id v15;
  id v16[2];
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke;
  v12[3] = &unk_24CDDDD90;
  objc_copyWeak(v16, &location);
  v13 = v8;
  v14 = self;
  v16[1] = (id)a2;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  void *v17;
  void (**v18)(void);
  NSObject *v19;
  _QWORD v20[4];
  WAQueuedInvocation *v21;
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v7 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 48));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v8);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v5);

    v4 = v5;
  }
  if (!objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    WALogCategoryDefaultHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "-[WAClient _killDaemonAndReply:queuedInvocation:]_block_invoke";
      v27 = 1024;
      v28 = 819;
      _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v18[2]();
    goto LABEL_6;
  }
  v10 = dispatch_semaphore_create(0);
  objc_msgSend(WeakRetained, "conn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke_127;
  v23[3] = &unk_24CDDE198;
  v13 = v10;
  v24 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke_128;
  v20[3] = &unk_24CDDE260;
  v21 = v4;
  v22 = v13;
  v15 = v13;
  objc_msgSend(v14, "killDaemonAndReply:", v20);

  v16 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v15, v16);

  objc_msgSend(WeakRetained, "setDaemonConnectionValid:", 0);
  objc_msgSend(WeakRetained, "conn");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(WeakRetained, "conn");
    v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "invalidate");
LABEL_6:

  }
  objc_autoreleasePoolPop(v2);
}

void __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke_127(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136446722;
    v6 = "-[WAClient _killDaemonAndReply:queuedInvocation:]_block_invoke";
    v7 = 1024;
    v8 = 827;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - killDaemonAndReply - error: %@", (uint8_t *)&v5, 0x1Cu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replyQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_24CDDE068;
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __49__WAClient__killDaemonAndReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)clearMessageStoreAndReply:(id)a3
{
  -[WAClient _clearMessageStoreAndReply:queuedInvocation:](self, "_clearMessageStoreAndReply:queuedInvocation:", a3, 0);
}

- (void)_clearMessageStoreAndReply:(id)a3 queuedInvocation:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  WAClient *v14;
  id v15;
  id v16[2];
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke;
  v12[3] = &unk_24CDDDD90;
  objc_copyWeak(v16, &location);
  v13 = v8;
  v14 = self;
  v16[1] = (id)a2;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD v18[4];
  WAQueuedInvocation *v19;
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v7 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 48));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v8);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    v10 = dispatch_semaphore_create(0);
    objc_msgSend(WeakRetained, "conn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke_129;
    v21[3] = &unk_24CDDE198;
    v13 = v10;
    v22 = v13;
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke_130;
    v18[3] = &unk_24CDDE260;
    v19 = v4;
    v20 = v13;
    v15 = v13;
    objc_msgSend(v14, "clearMessageStoreAndReply:", v18);

    v16 = dispatch_time(0, 15000000000);
    dispatch_semaphore_wait(v15, v16);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "-[WAClient _clearMessageStoreAndReply:queuedInvocation:]_block_invoke";
      v25 = 1024;
      v26 = 874;
      _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v15 = objc_claimAutoreleasedReturnValue();
    ((void (*)(void))v15[2].isa)();
  }

  objc_autoreleasePoolPop(v2);
}

void __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke_129(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136446722;
    v6 = "-[WAClient _clearMessageStoreAndReply:queuedInvocation:]_block_invoke";
    v7 = 1024;
    v8 = 882;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - clearMessageStoreAndReply - error: %@", (uint8_t *)&v5, 0x1Cu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke_130(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replyQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_24CDDE068;
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __56__WAClient__clearMessageStoreAndReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)getMessagesModelForGroupType:(int64_t)a3 andReply:(id)a4
{
  -[WAClient _getMessagesModelForGroupType:andReply:queuedInvocation:](self, "_getMessagesModelForGroupType:andReply:queuedInvocation:", a3, a4, 0);
}

- (void)_getMessagesModelForGroupType:(int64_t)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  WAClient *v16;
  id v17;
  id v18[3];
  id location;

  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__WAClient__getMessagesModelForGroupType_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_24CDDE0B8;
  objc_copyWeak(v18, &location);
  v15 = v10;
  v16 = self;
  v18[1] = (id)a2;
  v18[2] = (id)a3;
  v17 = v9;
  v12 = v9;
  v13 = v10;
  dispatch_async(v11, block);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __68__WAClient__getMessagesModelForGroupType_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (**v14)(void);
  NSObject *v15;
  _QWORD v16[4];
  void (**v17)(void);
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 72);
    v8 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 48));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v8, v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v9);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_132);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 72);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __68__WAClient__getMessagesModelForGroupType_andReply_queuedInvocation___block_invoke_133;
    v16[3] = &unk_24CDDE100;
    v17 = v4;
    objc_msgSend(v12, "getMessagesModelForGroupType:andReply:", v13, v16);

    v14 = v17;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "-[WAClient _getMessagesModelForGroupType:andReply:queuedInvocation:]_block_invoke";
      v20 = 1024;
      v21 = 926;
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v14[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __68__WAClient__getMessagesModelForGroupType_andReply_queuedInvocation___block_invoke_131(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _getMessagesModelForGroupType:andReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 932;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - getMessagesModelAndReply - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __68__WAClient__getMessagesModelForGroupType_andReply_queuedInvocation___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replyQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__WAClient__getMessagesModelForGroupType_andReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_24CDDE068;
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

}

void __68__WAClient__getMessagesModelForGroupType_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)sendMemoryPressureRequestAndReply:(id)a3
{
  -[WAClient _sendMemoryPressureRequestAndReply:queuedInvocation:](self, "_sendMemoryPressureRequestAndReply:queuedInvocation:", a3, 0);
}

- (void)_sendMemoryPressureRequestAndReply:(id)a3 queuedInvocation:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  WAClient *v14;
  id v15;
  id v16[2];
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke;
  v12[3] = &unk_24CDDDD90;
  objc_copyWeak(v16, &location);
  v13 = v8;
  v14 = self;
  v16[1] = (id)a2;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD v18[4];
  WAQueuedInvocation *v19;
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v7 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 48));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v8);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    v10 = dispatch_semaphore_create(0);
    objc_msgSend(WeakRetained, "conn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke_134;
    v21[3] = &unk_24CDDE198;
    v13 = v10;
    v22 = v13;
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke_135;
    v18[3] = &unk_24CDDE260;
    v19 = v4;
    v20 = v13;
    v15 = v13;
    objc_msgSend(v14, "sendMemoryPressureRequestAndReply:", v18);

    v16 = dispatch_time(0, 15000000000);
    dispatch_semaphore_wait(v15, v16);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "-[WAClient _sendMemoryPressureRequestAndReply:queuedInvocation:]_block_invoke";
      v25 = 1024;
      v26 = 972;
      _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v15 = objc_claimAutoreleasedReturnValue();
    ((void (*)(void))v15[2].isa)();
  }

  objc_autoreleasePoolPop(v2);
}

void __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke_134(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136446722;
    v6 = "-[WAClient _sendMemoryPressureRequestAndReply:queuedInvocation:]_block_invoke";
    v7 = 1024;
    v8 = 980;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - _sendMemoryPressureRequestAndReply - error: %@", (uint8_t *)&v5, 0x1Cu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke_135(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replyQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_24CDDE068;
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __64__WAClient__sendMemoryPressureRequestAndReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (id)_initPrivate
{
  WAClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *replyQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *propertyQueue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queryableQueue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *fileHandlingQueue;
  uint64_t v17;
  NSMutableArray *queuedInvocations;
  uint64_t v19;
  NSMutableDictionary *configuredMessageIdentifiers;
  uint64_t v21;
  NSMutableDictionary *interestedMessageIdentifiers;
  uint64_t v23;
  NSMutableSet *registeredGroupTypes;
  uint64_t v25;
  NSURL *wifianalyticsTmpDir;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)WAClient;
  v2 = -[WAClient init](&v28, sel_init);
  if (!v2)
    goto LABEL_9;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.wifianalytics.clientQueue", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  if (!v2->_queue)
    goto LABEL_9;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create("com.apple.wifianalytics.clientReplyQueue", v6);
  replyQueue = v2->_replyQueue;
  v2->_replyQueue = (OS_dispatch_queue *)v7;

  if (!v2->_replyQueue)
    goto LABEL_9;
  v9 = dispatch_queue_create("com.apple.wifianalytics.clientPropertyQueue", MEMORY[0x24BDAC9C0]);
  propertyQueue = v2->_propertyQueue;
  v2->_propertyQueue = (OS_dispatch_queue *)v9;

  if (!v2->_propertyQueue)
    goto LABEL_9;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("com.apple.wifianalytics.queryableConcurrentQueue", v11);
  queryableQueue = v2->_queryableQueue;
  v2->_queryableQueue = (OS_dispatch_queue *)v12;

  if (!v2->_queryableQueue)
    goto LABEL_9;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_queue_create("com.apple.wifianalytics.fileHandlingQueue", v14);
  fileHandlingQueue = v2->_fileHandlingQueue;
  v2->_fileHandlingQueue = (OS_dispatch_queue *)v15;

  if (!v2->_fileHandlingQueue)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = objc_claimAutoreleasedReturnValue();
  queuedInvocations = v2->_queuedInvocations;
  v2->_queuedInvocations = (NSMutableArray *)v17;

  if (!v2->_queuedInvocations)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v19 = objc_claimAutoreleasedReturnValue();
  configuredMessageIdentifiers = v2->_configuredMessageIdentifiers;
  v2->_configuredMessageIdentifiers = (NSMutableDictionary *)v19;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v21 = objc_claimAutoreleasedReturnValue();
  interestedMessageIdentifiers = v2->_interestedMessageIdentifiers;
  v2->_interestedMessageIdentifiers = (NSMutableDictionary *)v21;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v23 = objc_claimAutoreleasedReturnValue();
  registeredGroupTypes = v2->_registeredGroupTypes;
  v2->_registeredGroupTypes = (NSMutableSet *)v23;

  v2->_blockDaemonConnection = 0;
  -[WAClient wifianalyticsTmpDirectory](v2, "wifianalyticsTmpDirectory");
  v25 = objc_claimAutoreleasedReturnValue();
  wifianalyticsTmpDir = v2->_wifianalyticsTmpDir;
  v2->_wifianalyticsTmpDir = (NSURL *)v25;

  if (!v2->_wifianalyticsTmpDir)
  {
LABEL_9:

    return 0;
  }
  return v2;
}

- (void)_establishDaemonConnection
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  _QWORD v7[5];
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__WAClient__establishDaemonConnection__block_invoke;
  v7[3] = &unk_24CDDCCF8;
  v7[4] = self;
  if (_establishDaemonConnection_tokenLookupOnceToken != -1)
    dispatch_once(&_establishDaemonConnection_tokenLookupOnceToken, v7);
  -[WAClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __38__WAClient__establishDaemonConnection__block_invoke_2;
  block[3] = &unk_24CDDE2F8;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __38__WAClient__establishDaemonConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "tokenForThisClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifierForThisClient");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[WAUtil getTokenForIdentifier:](WAUtil, "getTokenForIdentifier:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTokenForThisClient:", v3);

  }
}

void __38__WAClient__establishDaemonConnection__block_invoke_2(uint64_t a1)
{
  void *v2;
  id *v3;
  id WeakRetained;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  char v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  char v35;
  _QWORD v36[4];
  NSObject *v37;
  id v38;
  char v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_msgSend(WeakRetained, "blockDaemonConnection");
  WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v41 = "-[WAClient _establishDaemonConnection]_block_invoke_2";
      v42 = 1024;
      v43 = 1071;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Connection to daemon blocked, this should only happen during testing.", buf, 0x12u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "tokenForThisClient");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[WAUtil trimTokenForLogging:](WAUtil, "trimTokenForLogging:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v41 = "-[WAClient _establishDaemonConnection]_block_invoke";
      v42 = 1024;
      v43 = 1075;
      v44 = 2112;
      v45 = v9;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: establishing connection to daemon with token ending in: %@...", buf, 0x1Cu);

    }
    v10 = dispatch_semaphore_create(0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.wifianalyticsd"), 4096);
    objc_msgSend(WeakRetained, "setConn:", v11);

    WAXPCRequestDelegateInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "conn");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRemoteObjectInterface:", v12);

    v14 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __38__WAClient__establishDaemonConnection__block_invoke_149;
    v36[3] = &unk_24CDDE2A8;
    objc_copyWeak(&v38, v3);
    v39 = 0;
    v15 = v10;
    v37 = v15;
    objc_msgSend(WeakRetained, "conn");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInvalidationHandler:", v36);

    v32[0] = v14;
    v32[1] = 3221225472;
    v32[2] = __38__WAClient__establishDaemonConnection__block_invoke_151;
    v32[3] = &unk_24CDDE2A8;
    objc_copyWeak(&v34, v3);
    v35 = 0;
    v17 = v15;
    v33 = v17;
    objc_msgSend(WeakRetained, "conn");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setInterruptionHandler:", v32);

    objc_msgSend(WeakRetained, "conn");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v14;
    v30[1] = 3221225472;
    v30[2] = __38__WAClient__establishDaemonConnection__block_invoke_153;
    v30[3] = &unk_24CDDE198;
    v20 = v17;
    v31 = v20;
    objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "tokenForThisClient");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = __38__WAClient__establishDaemonConnection__block_invoke_154;
    v26[3] = &unk_24CDDE2D0;
    objc_copyWeak(&v28, v3);
    v29 = 0;
    v7 = v20;
    v27 = v7;
    objc_msgSend(v21, "establishConnectionWithToken:andReply:", v22, v26);

    objc_msgSend(WeakRetained, "conn");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "resume");

    v24 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(v7, v24))
    {
      WALogCategoryDefaultHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v41 = "-[WAClient _establishDaemonConnection]_block_invoke";
        v42 = 1024;
        v43 = 1142;
        _os_log_impl(&dword_212581000, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: gave up waiting to establish connection. Bailing to avoid a hang", buf, 0x12u);
      }

    }
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v38);
  }

  objc_autoreleasePoolPop(v2);
}

void __38__WAClient__establishDaemonConnection__block_invoke_149(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__WAClient__establishDaemonConnection__block_invoke_2_150;
  block[3] = &unk_24CDDE2A8;
  objc_copyWeak(&v7, v2);
  v8 = *(_BYTE *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  dispatch_sync(v4, block);

  objc_destroyWeak(&v7);
}

void __38__WAClient__establishDaemonConnection__block_invoke_2_150(uint64_t a1)
{
  void *v1;
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDaemonConnectionValid:", 0);
  objc_msgSend(WeakRetained, "queuedInvocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
    {
      v11 = 136446466;
      v12 = "-[WAClient _establishDaemonConnection]_block_invoke_2";
      v13 = 1024;
      v14 = 1088;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Client invalidation handler, but there are queued invocations! removing them", (uint8_t *)&v11, 0x12u);
    }

    objc_msgSend(WeakRetained, "_removeAllQueuedInvocations");
  }
  else
  {
    if (v8)
    {
      objc_msgSend(WeakRetained, "queuedInvocations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(WeakRetained, "queuedInvocations");
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v1, "count");
      }
      else
      {
        v10 = 99;
      }
      v11 = 136446722;
      v12 = "-[WAClient _establishDaemonConnection]_block_invoke";
      v13 = 1024;
      v14 = 1091;
      v15 = 2048;
      v16 = v10;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Client invalidation handler, won't try to reestablish connection as the daemon could have been told to idle-exit. Queued invocations count: %ld", (uint8_t *)&v11, 0x1Cu);
      if (v9)

    }
  }
  if (!*(_BYTE *)(a1 + 48))
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  objc_autoreleasePoolPop(v3);
}

void __38__WAClient__establishDaemonConnection__block_invoke_151(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__WAClient__establishDaemonConnection__block_invoke_2_152;
  block[3] = &unk_24CDDE2A8;
  objc_copyWeak(&v7, v2);
  v8 = *(_BYTE *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  dispatch_sync(v4, block);

  objc_destroyWeak(&v7);
}

void __38__WAClient__establishDaemonConnection__block_invoke_2_152(uint64_t a1)
{
  void *v1;
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDaemonConnectionValid:", 0);
  objc_msgSend(WeakRetained, "queuedInvocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
    {
      v11 = 136446466;
      v12 = "-[WAClient _establishDaemonConnection]_block_invoke_2";
      v13 = 1024;
      v14 = 1102;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Client interruption handler, but there are queued invocations! removing them", (uint8_t *)&v11, 0x12u);
    }

    objc_msgSend(WeakRetained, "_removeAllQueuedInvocations");
  }
  else
  {
    if (v8)
    {
      objc_msgSend(WeakRetained, "queuedInvocations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(WeakRetained, "queuedInvocations");
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v1, "count");
      }
      else
      {
        v10 = 99;
      }
      v11 = 136446722;
      v12 = "-[WAClient _establishDaemonConnection]_block_invoke";
      v13 = 1024;
      v14 = 1105;
      v15 = 2048;
      v16 = v10;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Client interruption handler, won't try to reestablish connection as the daemon could have been told to idle-exit. Queued invocations count: %ld", (uint8_t *)&v11, 0x1Cu);
      if (v9)

    }
  }
  if (!*(_BYTE *)(a1 + 48))
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  objc_autoreleasePoolPop(v3);
}

void __38__WAClient__establishDaemonConnection__block_invoke_153(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136446722;
    v6 = "-[WAClient _establishDaemonConnection]_block_invoke";
    v7 = 1024;
    v8 = 1113;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: WA XPC API error: %@", (uint8_t *)&v5, 0x1Cu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __38__WAClient__establishDaemonConnection__block_invoke_154(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (!a3)
  {
    objc_msgSend(WeakRetained, "setDaemonConnectionValid:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", v7);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tokenForThisClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel__wakeUpNotificationForThisClientReceived_, v10, 0);

    objc_msgSend(v7, "tokenForThisClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      if (v5)
      {
        objc_msgSend(v7, "setTokenForThisClient:", v5);
        objc_msgSend(v7, "identifierForThisClient");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAUtil storeToken:withIdentifier:](WAUtil, "storeToken:withIdentifier:", v5, v12);

      }
      else
      {
        WALogCategoryDefaultHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = 136446466;
          v18 = "-[WAClient _establishDaemonConnection]_block_invoke";
          v19 = 1024;
          v20 = 1128;
          _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Didn't supply a previously received token to WA daemon and didn't receive one back! Persistence *is* broken for this client", (uint8_t *)&v17, 0x12u);
        }

      }
    }
  }
  WALogCategoryDefaultHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "tokenForThisClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifierForThisClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136446978;
    v18 = "-[WAClient _establishDaemonConnection]_block_invoke";
    v19 = 1024;
    v20 = 1134;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Connection established (token:%@ identifier:%@)", (uint8_t *)&v17, 0x26u);

  }
  if (!*(_BYTE *)(a1 + 48))
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_reregister
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__WAClient__reregister__block_invoke;
  block[3] = &unk_24CDDE320;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __23__WAClient__reregister__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *context;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x212BEF45C]();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "registeredGroupTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v9 = *(void **)(a1 + 32);
        v10 = objc_msgSend(v8, "unsignedIntegerValue");
        v13[0] = v6;
        v13[1] = 3221225472;
        v13[2] = __23__WAClient__reregister__block_invoke_2;
        v13[3] = &unk_24CDDE100;
        v13[4] = v8;
        objc_msgSend(v9, "_registerMessageGroup:andReply:queuedInvocation:", v10, v13, 0);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  objc_autoreleasePoolPop(context);
}

void __23__WAClient__reregister__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446722;
      v12 = "-[WAClient _reregister]_block_invoke_2";
      v13 = 1024;
      v14 = 1160;
      v15 = 2112;
      v16 = (uint64_t)v4;
      v7 = "%{public}s::%d:XPC: Error ensuring registration is intact: %@";
      v8 = v6;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_212581000, v8, v9, v7, (uint8_t *)&v11, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "unsignedLongValue");
    v11 = 136446722;
    v12 = "-[WAClient _reregister]_block_invoke";
    v13 = 1024;
    v14 = 1162;
    v15 = 2048;
    v16 = v10;
    v7 = "%{public}s::%d:XPC: Successfully reregistered for group type: %lu";
    v8 = v6;
    v9 = OS_LOG_TYPE_DEBUG;
    goto LABEL_6;
  }

}

- (id)_getConnectionIssueHandlerBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__WAClient__getConnectionIssueHandlerBlock__block_invoke;
  v4[3] = &unk_24CDDE2F8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x212BEF618](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __43__WAClient__getConnectionIssueHandlerBlock__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startConnectionRecovery");

}

- (void)_removeAllQueuedInvocations
{
  dispatch_block_t v3;
  dispatch_time_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  -[WAClient setDaemonConnectionValid:](self, "setDaemonConnectionValid:", 0);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __39__WAClient__removeAllQueuedInvocations__block_invoke;
  v9 = &unk_24CDDE2F8;
  objc_copyWeak(&v10, &location);
  v3 = dispatch_block_create(DISPATCH_BLOCK_BARRIER, &v6);
  v4 = dispatch_time(0, 500000000);
  -[WAClient queue](self, "queue", v6, v7, v8, v9);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v4, v5, v3);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __39__WAClient__removeAllQueuedInvocations__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446466;
    v5 = "-[WAClient _removeAllQueuedInvocations]_block_invoke";
    v6 = 1024;
    v7 = 1204;
    _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: replying with WAErrorCodeDaemonContactTimeout error to all requests and removing them", (uint8_t *)&v4, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_replyAllWithTimeoutErrorAndRemove");

}

- (void)_startConnectionRecovery
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  dispatch_block_t v11;
  dispatch_time_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  -[WAClient connectionRecoveryStartTime](self, "connectionRecoveryStartTime");
  if (v3 >= 1.0)
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v23 = "-[WAClient _startConnectionRecovery]";
      v24 = 1024;
      v25 = 1215;
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: connection recovery already in progress, won't start another.", buf, 0x12u);
    }

  }
  else
  {
    -[WAClient setDaemonConnectionValid:](self, "setDaemonConnectionValid:", 0);
    -[WAClient conn](self, "conn");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[WAClient conn](self, "conn");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "invalidate");

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    -[WAClient setConnectionRecoveryStartTime:](self, "setConnectionRecoveryStartTime:");

    -[WAClient recoveryTickBlock](self, "recoveryTickBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[WAClient recoveryTickBlock](self, "recoveryTickBlock");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = dispatch_block_testcancel(v8) == 0;

      if (v9)
      {
        -[WAClient recoveryTickBlock](self, "recoveryTickBlock");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_block_cancel(v10);

      }
    }
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __36__WAClient__startConnectionRecovery__block_invoke;
    v19 = &unk_24CDDE2F8;
    objc_copyWeak(&v20, &location);
    v11 = dispatch_block_create(DISPATCH_BLOCK_BARRIER, &v16);
    -[WAClient setRecoveryTickBlock:](self, "setRecoveryTickBlock:", v11, v16, v17, v18, v19);

    v12 = dispatch_time(0, 500000000);
    -[WAClient queue](self, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    -[WAClient recoveryTickBlock](self, "recoveryTickBlock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_after(v12, v13, v14);

    objc_destroyWeak(&v20);
  }
  objc_destroyWeak(&location);
}

void __36__WAClient__startConnectionRecovery__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionRecoveryTick");

}

- (void)_connectionRecoveryTick
{
  void *v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  dispatch_time_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[WAClient connectionRecoveryStartTime](self, "connectionRecoveryStartTime");
    v6 = v5;
    -[WAClient connectionRecoveryStartTime](self, "connectionRecoveryStartTime");
    v8 = v7;
    if (v7 < 2.22507386e-308)
    {
      v12 = -1.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "timeIntervalSince1970");
      v10 = v9;
      -[WAClient connectionRecoveryStartTime](self, "connectionRecoveryStartTime");
      v12 = v10 - v11;
    }
    v22 = 136446978;
    v23 = "-[WAClient _connectionRecoveryTick]";
    v24 = 1024;
    v25 = 1240;
    v26 = 2048;
    v27 = v6;
    v28 = 2048;
    v29 = v12;
    _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: connectionRecoveryStartTime:%f delta:%f", (uint8_t *)&v22, 0x26u);
    if (v8 >= 2.22507386e-308)

  }
  if (-[WAClient daemonConnectionValid](self, "daemonConnectionValid"))
  {
    -[WAClient _connectionRecovered](self, "_connectionRecovered");
  }
  else
  {
    -[WAClient connectionRecoveryStartTime](self, "connectionRecoveryStartTime");
    if (v13 >= 2.22507386e-308
      && (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "timeIntervalSince1970"),
          v16 = v15,
          -[WAClient connectionRecoveryStartTime](self, "connectionRecoveryStartTime"),
          v18 = v16 - v17,
          v14,
          v18 >= 60.0))
    {
      -[WAClient _connectionTimedOut](self, "_connectionTimedOut");
    }
    else
    {
      -[WAClient _establishDaemonConnection](self, "_establishDaemonConnection");
      v19 = dispatch_time(0, 500000000);
      -[WAClient queue](self, "queue");
      v20 = objc_claimAutoreleasedReturnValue();
      -[WAClient recoveryTickBlock](self, "recoveryTickBlock");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_after(v19, v20, v21);

    }
  }
}

- (void)_connectionTimedOut
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446466;
    v5 = "-[WAClient _connectionTimedOut]";
    v6 = 1024;
    v7 = 1253;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: connection recovery timed out, replying with WAErrorCodeDaemonContactTimeout error to all requests", (uint8_t *)&v4, 0x12u);
  }

  -[WAClient _replyAllWithTimeoutErrorAndRemove](self, "_replyAllWithTimeoutErrorAndRemove");
}

- (void)_replyAllWithTimeoutErrorAndRemove
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char isKindOfClass;
  NSObject *v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  _QWORD block[5];
  NSObject *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id location;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = objc_loadWeakRetained(&location);
  objc_msgSend(v3, "queuedInvocations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "reply");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSClassFromString(CFSTR("NSBlock"));
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          dispatch_group_enter(v2);
          -[WAClient replyQueue](self, "replyQueue");
          v11 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __46__WAClient__replyAllWithTimeoutErrorAndRemove__block_invoke;
          block[3] = &unk_24CDDE348;
          block[4] = v8;
          objc_copyWeak(&v18, &location);
          v17 = v2;
          dispatch_async(v11, block);

          objc_destroyWeak(&v18);
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  -[WAClient queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__WAClient__replyAllWithTimeoutErrorAndRemove__block_invoke_3;
  v14[3] = &unk_24CDDE2F8;
  objc_copyWeak(&v15, &location);
  dispatch_group_notify(v2, v12, v14);

  dispatch_group_leave(v2);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __46__WAClient__replyAllWithTimeoutErrorAndRemove__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0FD8];
    v14[0] = CFSTR("WAErrorCodeDaemonContactTimeout");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9014, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v7);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WAClient__replyAllWithTimeoutErrorAndRemove__block_invoke_2;
  block[3] = &unk_24CDDCCD0;
  v10 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v10;
  dispatch_sync(v9, block);

  objc_autoreleasePoolPop(v2);
}

void __46__WAClient__replyAllWithTimeoutErrorAndRemove__block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "setInvocation:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setReply:", 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void __46__WAClient__replyAllWithTimeoutErrorAndRemove__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queuedInvocations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446466;
    v5 = "-[WAClient _replyAllWithTimeoutErrorAndRemove]_block_invoke_3";
    v6 = 1024;
    v7 = 1278;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: Removed all queuedInvocations", (uint8_t *)&v4, 0x12u);
  }

  objc_msgSend(WeakRetained, "setConnectionRecoveryStartTime:", 0.0);
}

- (void)_connectionRecovered
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id location;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  WALogCategoryDefaultHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[WAClient _connectionRecovered]";
    v22 = 1024;
    v23 = 1288;
    _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: CONNECTION RECOVERED", buf, 0x12u);
  }

  +[WAClient sharedClient](WAClient, "sharedClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queuedInvocations");
  obj = (id)objc_claimAutoreleasedReturnValue();

  objc_sync_enter(obj);
  v13 = objc_loadWeakRetained(&location);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v13, "queuedInvocations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        WALogCategoryDefaultHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v8, "invocation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector((SEL)objc_msgSend(v10, "selector"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446722;
          v21 = "-[WAClient _connectionRecovered]";
          v22 = 1024;
          v23 = 1292;
          v24 = 2112;
          v25 = v11;
          _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Connection recovery invoke iteration... selector: %@", buf, 0x1Cu);

        }
        objc_msgSend(v8, "invocation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "invoke");

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
    }
    while (v5);
  }

  objc_msgSend(v13, "setConnectionRecoveryStartTime:", 0.0);
  objc_sync_exit(obj);

  objc_destroyWeak(&location);
}

- (NSMutableDictionary)interestedMessageIdentifiers
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[WAClient propertyQueue](self, "propertyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__WAClient_interestedMessageIdentifiers__block_invoke;
  v6[3] = &unk_24CDDDEF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableDictionary *)v4;
}

void __40__WAClient_interestedMessageIdentifiers__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_autoreleasePoolPop(v2);
}

- (NSMutableDictionary)configuredMessageIdentifiers
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[WAClient propertyQueue](self, "propertyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__WAClient_configuredMessageIdentifiers__block_invoke;
  v6[3] = &unk_24CDDDEF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableDictionary *)v4;
}

void __40__WAClient_configuredMessageIdentifiers__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_autoreleasePoolPop(v2);
}

- (void)setInterestedMessageIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WAClient propertyQueue](self, "propertyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WAClient_setInterestedMessageIdentifiers___block_invoke;
  v7[3] = &unk_24CDDCCD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

void __44__WAClient_setInterestedMessageIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)setConfiguredMessageIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WAClient propertyQueue](self, "propertyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WAClient_setConfiguredMessageIdentifiers___block_invoke;
  v7[3] = &unk_24CDDCCD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

void __44__WAClient_setConfiguredMessageIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a3 andReply:(id)a4
{
  -[WAClient _trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:queuedInvocation:](self, "_trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:queuedInvocation:", a3, a4, 0);
}

- (void)_trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  WAClient *v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__WAClient__trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_24CDDE390;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a2;
  v17 = v11;
  v18 = self;
  v19 = v9;
  v20 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __88__WAClient__trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (**v14)(void);
  NSObject *v15;
  _QWORD v16[4];
  void (**v17)(void);
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 48);
    v8 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 56));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v8, v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v9);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 56));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_168);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 48);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __88__WAClient__trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply_queuedInvocation___block_invoke_169;
    v16[3] = &unk_24CDDE100;
    v17 = v4;
    objc_msgSend(v12, "trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:", v13, v16);

    v14 = v17;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "-[WAClient _trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:queuedInvocation:]_block_invoke";
      v20 = 1024;
      v21 = 1352;
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v14[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __88__WAClient__trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply_queuedInvocation___block_invoke_167(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 1358;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - trapCrashMiniTracerDumpReady - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __88__WAClient__trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply_queuedInvocation___block_invoke_169(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  if (objc_msgSend(v4, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replyQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __88__WAClient__trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply_queuedInvocation___block_invoke_2;
  v9[3] = &unk_24CDDCCD0;
  v10 = *(id *)(a1 + 32);
  v11 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

void __88__WAClient__trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, *(_QWORD *)(a1 + 40));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)lqmCrashTracerNotifyForInterfaceWithName:(id)a3 andReply:(id)a4
{
  -[WAClient _lqmCrashTracerNotifyForInterfaceWithName:andReply:queuedInvocation:](self, "_lqmCrashTracerNotifyForInterfaceWithName:andReply:queuedInvocation:", a3, a4, 0);
}

- (void)_lqmCrashTracerNotifyForInterfaceWithName:(id)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  WAClient *v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__WAClient__lqmCrashTracerNotifyForInterfaceWithName_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_24CDDE390;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a2;
  v17 = v11;
  v18 = self;
  v19 = v9;
  v20 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __80__WAClient__lqmCrashTracerNotifyForInterfaceWithName_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (**v14)(void);
  NSObject *v15;
  _QWORD v16[4];
  void (**v17)(void);
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 48);
    v8 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 56));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v8, v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v9);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 56));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_171);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 48);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __80__WAClient__lqmCrashTracerNotifyForInterfaceWithName_andReply_queuedInvocation___block_invoke_172;
    v16[3] = &unk_24CDDE100;
    v17 = v4;
    objc_msgSend(v12, "lqmCrashTracerNotifyForInterfaceWithName:andReply:", v13, v16);

    v14 = v17;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "-[WAClient _lqmCrashTracerNotifyForInterfaceWithName:andReply:queuedInvocation:]_block_invoke";
      v20 = 1024;
      v21 = 1397;
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v14[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __80__WAClient__lqmCrashTracerNotifyForInterfaceWithName_andReply_queuedInvocation___block_invoke_170(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _lqmCrashTracerNotifyForInterfaceWithName:andReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 1403;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - lqmCrashTracerNotify - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __80__WAClient__lqmCrashTracerNotifyForInterfaceWithName_andReply_queuedInvocation___block_invoke_172(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  if (objc_msgSend(v4, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replyQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__WAClient__lqmCrashTracerNotifyForInterfaceWithName_andReply_queuedInvocation___block_invoke_2;
  v9[3] = &unk_24CDDCCD0;
  v10 = *(id *)(a1 + 32);
  v11 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

void __80__WAClient__lqmCrashTracerNotifyForInterfaceWithName_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, *(_QWORD *)(a1 + 40));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)lqmCrashTracerReceiveBlock:(id)a3 forInterfaceWithName:(id)a4 andReply:(id)a5
{
  -[WAClient _lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:queuedInvocation:](self, "_lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:queuedInvocation:", a3, a4, a5, 0);
}

- (void)_lqmCrashTracerReceiveBlock:(id)a3 forInterfaceWithName:(id)a4 andReply:(id)a5 queuedInvocation:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  WAClient *v22;
  id v23;
  id v24;
  id v25;
  id v26[2];
  id location;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __87__WAClient__lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply_queuedInvocation___block_invoke;
  v20[3] = &unk_24CDDE3F8;
  objc_copyWeak(v26, &location);
  v21 = v14;
  v22 = self;
  v23 = v11;
  v24 = v12;
  v26[1] = (id)a2;
  v25 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v14;
  dispatch_async(v15, v20);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

void __87__WAClient__lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(void);
  NSObject *v17;
  _QWORD v18[4];
  void (**v19)(void);
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 64));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v8, v9, v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v10);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 64));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_174);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __87__WAClient__lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply_queuedInvocation___block_invoke_175;
    v18[3] = &unk_24CDDE100;
    v19 = v4;
    objc_msgSend(v13, "lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:", v15, v14, v18);

    v16 = v19;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[WAClient _lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:queuedInvocation:]_block_invoke";
      v22 = 1024;
      v23 = 1443;
      _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v16[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __87__WAClient__lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply_queuedInvocation___block_invoke_173(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 1449;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - lqmCrashTracerReceiveBlock - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __87__WAClient__lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply_queuedInvocation___block_invoke_175(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  if (objc_msgSend(v4, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replyQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __87__WAClient__lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply_queuedInvocation___block_invoke_2;
  v9[3] = &unk_24CDDCCD0;
  v10 = *(id *)(a1 + 32);
  v11 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

void __87__WAClient__lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, *(_QWORD *)(a1 + 40));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)setDeviceAnalyticsConfiguration:(id)a3 andReply:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[WAClient setDeviceAnalyticsConfig:](self, "setDeviceAnalyticsConfig:", v7);
  -[WAClient _setDeviceAnalyticsConfiguration:andReply:queuedInvocation:](self, "_setDeviceAnalyticsConfiguration:andReply:queuedInvocation:", v7, v6, 0);

}

- (void)_setDeviceAnalyticsConfiguration:(id)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  WAClient *v17;
  id v18;
  id v19;
  id v20[2];
  id location;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_initWeak(&location, self);
  if (v9)
  {
    -[WAClient queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__WAClient__setDeviceAnalyticsConfiguration_andReply_queuedInvocation___block_invoke;
    block[3] = &unk_24CDDE390;
    objc_copyWeak(v20, &location);
    v13 = v11;
    v20[1] = (id)a2;
    v16 = v13;
    v17 = self;
    v18 = v9;
    v19 = v10;
    dispatch_async(v12, block);

    objc_destroyWeak(v20);
  }
  else
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v23 = "-[WAClient _setDeviceAnalyticsConfiguration:andReply:queuedInvocation:]";
      v24 = 1024;
      v25 = 1480;
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:configurationDict argument is null, bailing", buf, 0x12u);
    }

  }
  objc_destroyWeak(&location);

}

void __71__WAClient__setDeviceAnalyticsConfiguration_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (**v14)(void);
  NSObject *v15;
  _QWORD v16[4];
  void (**v17)(void);
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 48);
    v8 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 56));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v8, v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v9);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 56));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_177);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 48);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __71__WAClient__setDeviceAnalyticsConfiguration_andReply_queuedInvocation___block_invoke_178;
    v16[3] = &unk_24CDDE100;
    v17 = v4;
    objc_msgSend(v12, "setDeviceAnalyticsConfiguration:andReply:", v13, v16);

    v14 = v17;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "-[WAClient _setDeviceAnalyticsConfiguration:andReply:queuedInvocation:]_block_invoke";
      v20 = 1024;
      v21 = 1495;
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v14[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __71__WAClient__setDeviceAnalyticsConfiguration_andReply_queuedInvocation___block_invoke_176(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _setDeviceAnalyticsConfiguration:andReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 1501;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - setDeviceAnalyticsConfiguration - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __71__WAClient__setDeviceAnalyticsConfiguration_andReply_queuedInvocation___block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replyQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__WAClient__setDeviceAnalyticsConfiguration_andReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_24CDDE068;
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

}

void __71__WAClient__setDeviceAnalyticsConfiguration_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)getDeviceAnalyticsConfigurationAndReply:(id)a3
{
  -[WAClient _getDeviceAnalyticsConfigurationAndReply:queuedInvocation:](self, "_getDeviceAnalyticsConfigurationAndReply:queuedInvocation:", a3, 0);
}

- (void)_getDeviceAnalyticsConfigurationAndReply:(id)a3 queuedInvocation:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  WAClient *v14;
  id v15;
  id v16[2];
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__WAClient__getDeviceAnalyticsConfigurationAndReply_queuedInvocation___block_invoke;
  v12[3] = &unk_24CDDDD90;
  objc_copyWeak(v16, &location);
  v13 = v8;
  v14 = self;
  v16[1] = (id)a2;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __70__WAClient__getDeviceAnalyticsConfigurationAndReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(void);
  NSObject *v13;
  _QWORD v14[4];
  void (**v15)(void);
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v7 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 48));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v8);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_180);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __70__WAClient__getDeviceAnalyticsConfigurationAndReply_queuedInvocation___block_invoke_181;
    v14[3] = &unk_24CDDE100;
    v15 = v4;
    objc_msgSend(v11, "getDeviceAnalyticsConfigurationAndReply:", v14);

    v12 = v15;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[WAClient _getDeviceAnalyticsConfigurationAndReply:queuedInvocation:]_block_invoke";
      v18 = 1024;
      v19 = 1541;
      _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v12[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __70__WAClient__getDeviceAnalyticsConfigurationAndReply_queuedInvocation___block_invoke_179(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _getDeviceAnalyticsConfigurationAndReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 1546;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - getDeviceAnalyticsConfigurationAndReply - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __70__WAClient__getDeviceAnalyticsConfigurationAndReply_queuedInvocation___block_invoke_181(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "-[WAClient _getDeviceAnalyticsConfigurationAndReply:queuedInvocation:]_block_invoke";
      v20 = 1024;
      v21 = 1550;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - _getDeviceAnalyticsConfigurationAndReply - error: %@", buf, 0x1Cu);
    }

  }
  v8 = v6;
  if (objc_msgSend(v8, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "replyQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__WAClient__getDeviceAnalyticsConfigurationAndReply_queuedInvocation___block_invoke_182;
  block[3] = &unk_24CDDE068;
  v15 = *(id *)(a1 + 32);
  v16 = v5;
  v17 = v8;
  v12 = v8;
  v13 = v5;
  dispatch_async(v11, block);

}

void __70__WAClient__getDeviceAnalyticsConfigurationAndReply_queuedInvocation___block_invoke_182(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)summarizeDeviceAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4 andReply:(id)a5
{
  -[WAClient summarizeDeviceAnalyticsForNetwork:maxAgeInDays:andReply:queuedInvocation:](self, "summarizeDeviceAnalyticsForNetwork:maxAgeInDays:andReply:queuedInvocation:", a3, a4, a5, 0);
}

- (void)summarizeDeviceAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4 andReply:(id)a5 queuedInvocation:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  WAClient *v20;
  id v21;
  id v22;
  id v23[3];
  id location;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __86__WAClient_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply_queuedInvocation___block_invoke;
  v18[3] = &unk_24CDDE170;
  objc_copyWeak(v23, &location);
  v19 = v13;
  v20 = self;
  v23[1] = (id)a2;
  v23[2] = (id)a4;
  v21 = v11;
  v22 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  dispatch_async(v14, v18);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

void __86__WAClient_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(void);
  NSObject *v17;
  _QWORD v18[4];
  void (**v19)(void);
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 80);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 56));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v8, v7, v9, v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v10);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 56));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_184);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 80);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __86__WAClient_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply_queuedInvocation___block_invoke_185;
    v18[3] = &unk_24CDDE100;
    v19 = v4;
    objc_msgSend(v13, "summarizeDeviceAnalyticsForNetwork:maxAgeInDays:andReply:", v14, v15, v18);

    v16 = v19;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[WAClient summarizeDeviceAnalyticsForNetwork:maxAgeInDays:andReply:queuedInvocation:]_block_invoke";
      v22 = 1024;
      v23 = 1585;
      _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v16[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __86__WAClient_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply_queuedInvocation___block_invoke_183(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient summarizeDeviceAnalyticsForNetwork:maxAgeInDays:andReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 1591;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - summarizeDeviceAnalyticsForNetwork - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __86__WAClient_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply_queuedInvocation___block_invoke_185(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replyQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__WAClient_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply_queuedInvocation___block_invoke_2;
  block[3] = &unk_24CDDE068;
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

}

void __86__WAClient_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply_queuedInvocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3
{
  -[WAClient _triggerDeviceAnalyticsStoreMigrationAndReply:queuedInvocation:](self, "_triggerDeviceAnalyticsStoreMigrationAndReply:queuedInvocation:", a3, 0);
}

- (void)_triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3 queuedInvocation:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  WAClient *v14;
  id v15;
  id v16[2];
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__WAClient__triggerDeviceAnalyticsStoreMigrationAndReply_queuedInvocation___block_invoke;
  v12[3] = &unk_24CDDDD90;
  objc_copyWeak(v16, &location);
  v13 = v8;
  v14 = self;
  v16[1] = (id)a2;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __75__WAClient__triggerDeviceAnalyticsStoreMigrationAndReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(void);
  NSObject *v13;
  _QWORD v14[4];
  void (**v15)(void);
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v7 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 48));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v8);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_187);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __75__WAClient__triggerDeviceAnalyticsStoreMigrationAndReply_queuedInvocation___block_invoke_188;
    v14[3] = &unk_24CDDE100;
    v15 = v4;
    objc_msgSend(v11, "triggerDeviceAnalyticsStoreMigrationAndReply:", v14);

    v12 = v15;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[WAClient _triggerDeviceAnalyticsStoreMigrationAndReply:queuedInvocation:]_block_invoke";
      v18 = 1024;
      v19 = 1628;
      _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v12[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __75__WAClient__triggerDeviceAnalyticsStoreMigrationAndReply_queuedInvocation___block_invoke_186(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _triggerDeviceAnalyticsStoreMigrationAndReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 1633;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - _triggerDeviceAnalyticsStoreMigrationAndReply - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __75__WAClient__triggerDeviceAnalyticsStoreMigrationAndReply_queuedInvocation___block_invoke_188(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "-[WAClient _triggerDeviceAnalyticsStoreMigrationAndReply:queuedInvocation:]_block_invoke";
      v20 = 1024;
      v21 = 1637;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - _triggerDeviceAnalyticsStoreMigrationAndReply - error: %@", buf, 0x1Cu);
    }

  }
  v8 = v6;
  if (objc_msgSend(v8, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "replyQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__WAClient__triggerDeviceAnalyticsStoreMigrationAndReply_queuedInvocation___block_invoke_189;
  block[3] = &unk_24CDDE068;
  v15 = *(id *)(a1 + 32);
  v16 = v5;
  v17 = v8;
  v12 = v8;
  v13 = v5;
  dispatch_async(v11, block);

}

void __75__WAClient__triggerDeviceAnalyticsStoreMigrationAndReply_queuedInvocation___block_invoke_189(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)issueIOReportManagementCommand:(unint64_t)a3 andReply:(id)a4
{
  -[WAClient _issueIOReportManagementCommand:andReply:queuedInvocation:](self, "_issueIOReportManagementCommand:andReply:queuedInvocation:", a3, a4, 0);
}

- (void)_issueIOReportManagementCommand:(unint64_t)a3 andReply:(id)a4 queuedInvocation:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  WAClient *v16;
  id v17;
  id v18[3];
  id location;

  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__WAClient__issueIOReportManagementCommand_andReply_queuedInvocation___block_invoke;
  block[3] = &unk_24CDDE0B8;
  objc_copyWeak(v18, &location);
  v15 = v10;
  v16 = self;
  v18[1] = (id)a2;
  v18[2] = (id)a3;
  v17 = v9;
  v12 = v9;
  v13 = v10;
  dispatch_async(v11, block);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __70__WAClient__issueIOReportManagementCommand_andReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (**v14)(void);
  NSObject *v15;
  _QWORD v16[4];
  void (**v17)(void);
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 72);
    v8 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 48));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v8, v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v9);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_191);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 72);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __70__WAClient__issueIOReportManagementCommand_andReply_queuedInvocation___block_invoke_192;
    v16[3] = &unk_24CDDE100;
    v17 = v4;
    objc_msgSend(v12, "issueIOReportManagementCommand:andReply:", v13, v16);

    v14 = v17;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "-[WAClient _issueIOReportManagementCommand:andReply:queuedInvocation:]_block_invoke";
      v20 = 1024;
      v21 = 1672;
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v14[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __70__WAClient__issueIOReportManagementCommand_andReply_queuedInvocation___block_invoke_190(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _issueIOReportManagementCommand:andReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 1677;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - _issueIOReportManagementCommand - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __70__WAClient__issueIOReportManagementCommand_andReply_queuedInvocation___block_invoke_192(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "-[WAClient _issueIOReportManagementCommand:andReply:queuedInvocation:]_block_invoke";
      v20 = 1024;
      v21 = 1681;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - issueIOReportManagementCommand - error: %@", buf, 0x1Cu);
    }

  }
  v8 = v6;
  if (objc_msgSend(v8, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "replyQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__WAClient__issueIOReportManagementCommand_andReply_queuedInvocation___block_invoke_193;
  block[3] = &unk_24CDDE068;
  v15 = *(id *)(a1 + 32);
  v16 = v5;
  v17 = v8;
  v12 = v8;
  v13 = v5;
  dispatch_async(v11, block);

}

void __70__WAClient__issueIOReportManagementCommand_andReply_queuedInvocation___block_invoke_193(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)getUsageStatsandReply:(id)a3
{
  -[WAClient _getUsageStatsandReply:queuedInvocation:](self, "_getUsageStatsandReply:queuedInvocation:", a3, 0);
}

- (void)_getUsageStatsandReply:(id)a3 queuedInvocation:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  WAClient *v14;
  id v15;
  id v16[2];
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__WAClient__getUsageStatsandReply_queuedInvocation___block_invoke;
  v12[3] = &unk_24CDDDD90;
  objc_copyWeak(v16, &location);
  v13 = v8;
  v14 = self;
  v16[1] = (id)a2;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __52__WAClient__getUsageStatsandReply_queuedInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  WAQueuedInvocation *v4;
  WAQueuedInvocation *v5;
  InvokeMakerInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(void);
  NSObject *v13;
  _QWORD v14[4];
  void (**v15)(void);
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = (WAQueuedInvocation *)*(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = objc_alloc_init(WAQueuedInvocation);

    v6 = -[InvokeMakerInfo initWithSel:andTarget:]([InvokeMakerInfo alloc], "initWithSel:andTarget:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v7 = (void *)MEMORY[0x212BEF618](*(_QWORD *)(a1 + 48));
    +[WAUtil _generateInvocationForMethod:](WAUtil, "_generateInvocationForMethod:", v6, v7, v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WAQueuedInvocation setInvocation:](v5, "setInvocation:", v8);
    -[WAQueuedInvocation setReply:](v5, "setReply:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "queuedInvocations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v5);

    v4 = v5;
  }
  if (objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_195);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __52__WAClient__getUsageStatsandReply_queuedInvocation___block_invoke_196;
    v14[3] = &unk_24CDDE100;
    v15 = v4;
    objc_msgSend(v11, "getUsageStatsandReply:", v14);

    v12 = v15;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[WAClient _getUsageStatsandReply:queuedInvocation:]_block_invoke";
      v18 = 1024;
      v19 = 1715;
      _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: Daemon connection not valid, invocation queued and connection establishment about to be initiated...", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "_getConnectionIssueHandlerBlock");
    v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v12[2]();
  }

  objc_autoreleasePoolPop(v2);
}

void __52__WAClient__getUsageStatsandReply_queuedInvocation___block_invoke_194(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446722;
    v5 = "-[WAClient _getUsageStatsandReply:queuedInvocation:]_block_invoke";
    v6 = 1024;
    v7 = 1720;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - getUsageStatsandReply - error: %@", (uint8_t *)&v4, 0x1Cu);
  }

}

void __52__WAClient__getUsageStatsandReply_queuedInvocation___block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "-[WAClient _getUsageStatsandReply:queuedInvocation:]_block_invoke";
      v20 = 1024;
      v21 = 1724;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: WAClient - getUsageStatsandReply - error: %@", buf, 0x1Cu);
    }

  }
  v8 = v6;
  if (objc_msgSend(v8, "code") == 9009)
  {
    +[WAClient sharedClient](WAClient, "sharedClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_reregister");

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "replyQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__WAClient__getUsageStatsandReply_queuedInvocation___block_invoke_197;
  block[3] = &unk_24CDDE068;
  v15 = *(id *)(a1 + 32);
  v16 = v5;
  v17 = v8;
  v12 = v8;
  v13 = v5;
  dispatch_async(v11, block);

}

void __52__WAClient__getUsageStatsandReply_queuedInvocation___block_invoke_197(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v2 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(*(id *)(a1 + 32), "reply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  +[WAClient sharedClient](WAClient, "sharedClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dequeueInvocation:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)fakeDaemonConnectionDead:(unsigned __int8)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7;
  unsigned __int8 v8;
  id location;

  objc_initWeak(&location, self);
  -[WAClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WAClient_fakeDaemonConnectionDead___block_invoke;
  block[3] = &unk_24CDDE4E0;
  v8 = a3;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __37__WAClient_fakeDaemonConnectionDead___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const __CFString *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BEF45C]();
  WALogCategoryDefaultHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = CFSTR("ACTIVE");
    else
      v4 = CFSTR("INACTIVE");
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136446978;
    v10 = "-[WAClient fakeDaemonConnectionDead:]_block_invoke";
    v11 = 1024;
    v12 = 1742;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_212581000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: Faking dead daemon connection is: %@ - stack: %@", (uint8_t *)&v9, 0x26u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setDaemonConnectionValid:", *(_BYTE *)(a1 + 40) == 0);
  if (!objc_msgSend(WeakRetained, "daemonConnectionValid"))
  {
    objc_msgSend(WeakRetained, "conn");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(WeakRetained, "conn");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invalidate");

    }
  }
  objc_msgSend(WeakRetained, "setBlockDaemonConnection:", *(unsigned __int8 *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 40))
    objc_msgSend(WeakRetained, "_establishDaemonConnection");

  objc_autoreleasePoolPop(v2);
}

- (NSXPCConnection)conn
{
  return self->_conn;
}

- (void)setConn:(id)a3
{
  objc_storeStrong((id *)&self->_conn, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)setReplyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_replyQueue, a3);
}

- (OS_dispatch_queue)propertyQueue
{
  return self->_propertyQueue;
}

- (void)setPropertyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_propertyQueue, a3);
}

- (OS_dispatch_queue)fileHandlingQueue
{
  return self->_fileHandlingQueue;
}

- (void)setFileHandlingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_fileHandlingQueue, a3);
}

- (OS_dispatch_queue)queryableQueue
{
  return self->_queryableQueue;
}

- (void)setQueryableQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queryableQueue, a3);
}

- (NSMutableArray)queuedInvocations
{
  return self->_queuedInvocations;
}

- (void)setQueuedInvocations:(id)a3
{
  objc_storeStrong((id *)&self->_queuedInvocations, a3);
}

- (double)connectionRecoveryStartTime
{
  return self->_connectionRecoveryStartTime;
}

- (void)setConnectionRecoveryStartTime:(double)a3
{
  self->_connectionRecoveryStartTime = a3;
}

- (void)setDaemonConnectionValid:(unsigned __int8)a3
{
  self->_daemonConnectionValid = a3;
}

- (unsigned)blockDaemonConnection
{
  return self->_blockDaemonConnection;
}

- (void)setBlockDaemonConnection:(unsigned __int8)a3
{
  self->_blockDaemonConnection = a3;
}

- (id)recoveryTickBlock
{
  return self->_recoveryTickBlock;
}

- (void)setRecoveryTickBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)tokenForThisClient
{
  return self->_tokenForThisClient;
}

- (void)setTokenForThisClient:(id)a3
{
  objc_storeStrong((id *)&self->_tokenForThisClient, a3);
}

- (NSString)identifierForThisClient
{
  return self->_identifierForThisClient;
}

- (void)setIdentifierForThisClient:(id)a3
{
  objc_storeStrong((id *)&self->_identifierForThisClient, a3);
}

- (NSMutableSet)registeredGroupTypes
{
  return self->_registeredGroupTypes;
}

- (void)setRegisteredGroupTypes:(id)a3
{
  objc_storeStrong((id *)&self->_registeredGroupTypes, a3);
}

- (NSURL)wifianalyticsTmpDir
{
  return self->_wifianalyticsTmpDir;
}

- (void)setWifianalyticsTmpDir:(id)a3
{
  objc_storeStrong((id *)&self->_wifianalyticsTmpDir, a3);
}

- (NSDictionary)deviceAnalyticsConfig
{
  return self->_deviceAnalyticsConfig;
}

- (void)setDeviceAnalyticsConfig:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAnalyticsConfig, a3);
}

- (double)allowPurgeJSONFilesAfterSec
{
  return self->_allowPurgeJSONFilesAfterSec;
}

- (void)setAllowPurgeJSONFilesAfterSec:(double)a3
{
  self->_allowPurgeJSONFilesAfterSec = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAnalyticsConfig, 0);
  objc_storeStrong((id *)&self->_wifianalyticsTmpDir, 0);
  objc_storeStrong((id *)&self->_registeredGroupTypes, 0);
  objc_storeStrong((id *)&self->_identifierForThisClient, 0);
  objc_storeStrong((id *)&self->_tokenForThisClient, 0);
  objc_storeStrong(&self->_recoveryTickBlock, 0);
  objc_storeStrong((id *)&self->_queuedInvocations, 0);
  objc_storeStrong((id *)&self->_queryableQueue, 0);
  objc_storeStrong((id *)&self->_fileHandlingQueue, 0);
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_conn, 0);
  objc_storeStrong((id *)&self->_configuredMessageIdentifiers, 0);
  objc_storeStrong((id *)&self->_interestedMessageIdentifiers, 0);
}

@end
