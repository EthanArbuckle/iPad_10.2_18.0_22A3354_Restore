@implementation SPDaemonConnection

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_116);
  return (id)sharedConnection_gDaemonConnection;
}

- (void)activate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__SPDaemonConnection_activate___block_invoke;
  v7[3] = &unk_24CF63DD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __31__SPDaemonConnection_activate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  qos_class_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 67109120;
    v9 = qos_class_self();
    _os_log_impl(&dword_213202000, v2, v3, "SPDC Activate QOS: %d", buf, 8u);
  }

  v4 = _os_activity_create(&dword_213202000, "activation", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__SPDaemonConnection_activate___block_invoke_88;
  v6[3] = &unk_24CF63DD8;
  v5 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  os_activity_apply(v4, v6);

}

void __50__SPDaemonConnection_sendSFFeedback_type_queryId___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *activity;
  _QWORD block[5];
  id v5;
  __int128 v6;

  activity = _os_activity_create(&dword_213202000, "sendFeedback", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SPDaemonConnection_sendSFFeedback_type_queryId___block_invoke_2;
  block[3] = &unk_24CF63E70;
  v6 = *(_OWORD *)(a1 + 48);
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  os_activity_apply(activity, block);

}

void __50__SPDaemonConnection_sendSFFeedback_type_queryId___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 48))
  {
    v7[0] = CFSTR("QID");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7[1] = CFSTR("FBT");
    v8[0] = v2;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("FBT");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(*(id *)(a1 + 32), "_sendFeedbackMessage:object:info:reply:", CFSTR("SendSFFeedback"), *(_QWORD *)(a1 + 40), v4, 0);
}

- (void)_sendInteractiveMessage:(id)a3 object:(id)a4 info:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SPXPCMessage *v14;
  NSObject *v15;
  os_log_type_t v16;
  OS_dispatch_queue *connectionQueue;
  NSObject *v18;
  SPXPCMessage *v19;
  id v20;
  qos_class_t v21;
  dispatch_block_t v22;
  void *v23;
  _QWORD block[5];
  SPXPCMessage *v25;
  id v26;
  uint8_t buf[4];
  qos_class_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[SPXPCMessage initWithName:]([SPXPCMessage alloc], "initWithName:", v13);

  -[SPXPCMessage setRootObject:](v14, "setRootObject:", v12);
  -[SPXPCMessage setInfo:](v14, "setInfo:", v11);

  SPLogForSPLogCategoryDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 67109120;
    v28 = qos_class_self();
    _os_log_impl(&dword_213202000, v15, v16, "SPDC _sendMessage QOS: %d", buf, 8u);
  }

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SPDaemonConnection__sendInteractiveMessage_object_info_reply___block_invoke;
  block[3] = &unk_24CF63CE0;
  v25 = v14;
  v26 = v10;
  block[4] = self;
  v18 = connectionQueue;
  v19 = v14;
  v20 = v10;
  v21 = qos_class_self();
  if (v21 < 0x1A)
    v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  else
    v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v21, 0, block);
  v23 = v22;
  dispatch_async(v18, v22);

}

void __48__SPDaemonConnection_sharedBackgroundConnection__block_invoke()
{
  SPDaemonConnection *v0;
  void *v1;

  v0 = -[SPDaemonConnection initWithDaemonName:qos:]([SPDaemonConnection alloc], "initWithDaemonName:qos:", CFSTR("com.apple.searchd.background"), 9);
  v1 = (void *)sharedBackgroundConnection_gDaemonConnection;
  sharedBackgroundConnection_gDaemonConnection = (uint64_t)v0;

}

void __38__SPDaemonConnection_sharedConnection__block_invoke()
{
  SPDaemonConnection *v0;
  void *v1;

  v0 = objc_alloc_init(SPDaemonConnection);
  v1 = (void *)sharedConnection_gDaemonConnection;
  sharedConnection_gDaemonConnection = (uint64_t)v0;

}

- (SPDaemonConnection)initWithDaemonName:(id)a3 qos:(unsigned int)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SPDaemonConnection;
  v7 = -[SPDaemonConnection init](&v19, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)*((_QWORD *)v7 + 4);
    *((_QWORD *)v7 + 4) = v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, (dispatch_qos_class_t)a4, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.search.daemonQueue", v11);
    v13 = (void *)*((_QWORD *)v7 + 2);
    *((_QWORD *)v7 + 2) = v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v14, (dispatch_qos_class_t)a4, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.search.XPCQueue", v15);
    v17 = (void *)*((_QWORD *)v7 + 3);
    *((_QWORD *)v7 + 3) = v16;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v7 + 3), "com.apple.search.XPCQueue", v7, 0);
    *((_QWORD *)v7 + 5) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, MEMORY[0x24BDBD6B0]);
  }

  return (SPDaemonConnection *)v7;
}

- (SPDaemonConnection)init
{
  return -[SPDaemonConnection initWithDaemonName:qos:](self, "initWithDaemonName:qos:", CFSTR("com.apple.searchd"), 33);
}

void __64__SPDaemonConnection__sendInteractiveMessage_object_info_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  qos_class_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 67109120;
    v11 = qos_class_self();
    _os_log_impl(&dword_213202000, v2, v3, "SPDC QOS: %d", buf, 8u);
  }

  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__SPDaemonConnection__sendInteractiveMessage_object_info_reply___block_invoke_15;
    v8[3] = &unk_24CF63CB8;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "sendInteractiveMessage:withReply:", v7, v8);

    v6 = v9;
  }
  else
  {
    objc_msgSend(v5, "sendMessage:", *(_QWORD *)(a1 + 40));
  }

}

void __61__SPDaemonConnection__sendFeedbackMessage_object_info_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    v5[0] = 67109120;
    v5[1] = qos_class_self();
    _os_log_impl(&dword_213202000, v2, v3, "SPDC feedback QOS: %d", (uint8_t *)v5, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMessage:", *(_QWORD *)(a1 + 40));

}

- (id)_connection
{
  SPXPCConnection *connection;
  SPXPCConnection *v4;
  SPXPCConnection *v5;
  SPXPCConnection *v6;
  uint64_t v7;
  SPXPCConnection *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    v4 = -[SPXPCConnection initWithServiceName:onQueue:]([SPXPCConnection alloc], "initWithServiceName:onQueue:", self->_daemonName, self->_connectionQueue);
    v5 = self->_connection;
    self->_connection = v4;

    location = 0;
    objc_initWeak(&location, self);
    v6 = self->_connection;
    v7 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __33__SPDaemonConnection__connection__block_invoke;
    v12[3] = &unk_24CF63C40;
    objc_copyWeak(&v13, &location);
    -[SPXPCConnection setDisconnectHandler:](v6, "setDisconnectHandler:", v12);
    v8 = self->_connection;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __33__SPDaemonConnection__connection__block_invoke_2;
    v10[3] = &unk_24CF63C68;
    objc_copyWeak(&v11, &location);
    -[SPXPCConnection setMessageHandler:](v8, "setMessageHandler:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (void)_sendFeedbackMessage:(id)a3 object:(id)a4 info:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  id v11;
  SPXPCMessage *v12;
  NSObject *connectionQueue;
  SPXPCMessage *v14;
  _QWORD v15[5];
  SPXPCMessage *v16;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[SPXPCMessage initWithName:]([SPXPCMessage alloc], "initWithName:", v11);

  -[SPXPCMessage setRootObjectForFeedback:](v12, "setRootObjectForFeedback:", v10);
  -[SPXPCMessage setInfo:](v12, "setInfo:", v9);

  connectionQueue = self->_connectionQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__SPDaemonConnection__sendFeedbackMessage_object_info_reply___block_invoke;
  v15[3] = &unk_24CF63C90;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  dispatch_async(connectionQueue, v15);

}

+ (id)sharedBackgroundConnection
{
  if (sharedBackgroundConnection_onceToken != -1)
    dispatch_once(&sharedBackgroundConnection_onceToken, &__block_literal_global_118);
  return (id)sharedBackgroundConnection_gDaemonConnection;
}

- (void)sendSFFeedback:(id)a3 type:(int64_t)a4 queryId:(unint64_t)a5
{
  id v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int64_t v14;

  v8 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__SPDaemonConnection_sendSFFeedback_type_queryId___block_invoke;
  v11[3] = &unk_24CF63E70;
  v13 = a5;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v9 = v8;
  v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, v11);
  dispatch_async((dispatch_queue_t)self->_queue, v10);

}

- (void)_resetConnection
{
  SPXPCConnection *connection;
  SPXPCConnection *v4;

  connection = self->_connection;
  if (connection)
  {
    -[SPXPCConnection setMessageHandler:](connection, "setMessageHandler:", 0);
    -[SPXPCConnection setDisconnectHandler:](self->_connection, "setDisconnectHandler:", 0);
    -[SPXPCConnection shutdown](self->_connection, "shutdown");
    v4 = self->_connection;
    self->_connection = 0;

  }
}

void __33__SPDaemonConnection__connection__block_invoke(uint64_t a1)
{
  CFDictionaryRef *WeakRetained;
  CFDictionaryRef *v2;
  CFIndex Count;
  CFDictionaryRef *context;

  WeakRetained = (CFDictionaryRef *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    context = WeakRetained;
    -[CFDictionaryRef _resetConnection](WeakRetained, "_resetConnection");
    Count = CFDictionaryGetCount(context[5]);
    v2 = context;
    if (Count)
    {
      CFDictionaryApplyFunction(context[5], (CFDictionaryApplierFunction)queryReissueFunction, context);
      v2 = context;
    }
  }

}

void __33__SPDaemonConnection__connection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  CFDictionaryRef *WeakRetained;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SPLogForSPLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v4, v5))
  {
    v11[0] = 67109120;
    v11[1] = qos_class_self();
    _os_log_impl(&dword_213202000, v4, v5, "SPDC message QOS: %d", (uint8_t *)v11, 8u);
  }

  WeakRetained = (CFDictionaryRef *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "info");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("QID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntValue");

    CFDictionaryGetValue(WeakRetained[5], (const void *)v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleMessage:", v3);

  }
}

- (void)_sendMessage:(id)a3 object:(id)a4 info:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SPXPCMessage *v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *connectionQueue;
  SPXPCMessage *v18;
  id v19;
  dispatch_block_t v20;
  _QWORD block[5];
  SPXPCMessage *v22;
  id v23;
  uint8_t buf[4];
  qos_class_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[SPXPCMessage initWithName:]([SPXPCMessage alloc], "initWithName:", v13);

  -[SPXPCMessage setRootObject:](v14, "setRootObject:", v12);
  -[SPXPCMessage setInfo:](v14, "setInfo:", v11);

  SPLogForSPLogCategoryDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 67109120;
    v25 = qos_class_self();
    _os_log_impl(&dword_213202000, v15, v16, "SPDC _sendMessage QOS: %d", buf, 8u);
  }

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SPDaemonConnection__sendMessage_object_info_reply___block_invoke;
  block[3] = &unk_24CF63CE0;
  v22 = v14;
  v23 = v10;
  block[4] = self;
  v18 = v14;
  v19 = v10;
  v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(connectionQueue, v20);

}

void __53__SPDaemonConnection__sendMessage_object_info_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  qos_class_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 67109120;
    v11 = qos_class_self();
    _os_log_impl(&dword_213202000, v2, v3, "SPDC QOS: %d", buf, 8u);
  }

  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__SPDaemonConnection__sendMessage_object_info_reply___block_invoke_14;
    v8[3] = &unk_24CF63CB8;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "sendMessage:withReply:", v7, v8);

    v6 = v9;
  }
  else
  {
    objc_msgSend(v5, "sendMessage:", *(_QWORD *)(a1 + 40));
  }

}

void __53__SPDaemonConnection__sendMessage_object_info_reply___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SPLogForSPLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v4, v5))
  {
    v8[0] = 67109120;
    v8[1] = qos_class_self();
    _os_log_impl(&dword_213202000, v4, v5, "SPDC reply QOS: %d", (uint8_t *)v8, 8u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

void __64__SPDaemonConnection__sendInteractiveMessage_object_info_reply___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SPLogForSPLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v4, v5))
  {
    v8[0] = 67109120;
    v8[1] = qos_class_self();
    _os_log_impl(&dword_213202000, v4, v5, "SPDC reply QOS: %d", (uint8_t *)v8, 8u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

- (void)sendMessageForToken:(id)a3
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v69[4];
  id v70;
  _QWORD v71[28];
  _QWORD v72[28];
  uint8_t buf[4];
  qos_class_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  SPLogForSPLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)buf = 67109120;
    v74 = qos_class_self();
    _os_log_impl(&dword_213202000, v4, v5, "SPDC sendMessageForToken QOS: %d", buf, 8u);
  }

  objc_msgSend(v3, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchEntities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v7, "searchEntities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && objc_msgSend(v11, "count"))
      objc_msgSend(v10, "encodeObject:forKey:", v12, CFSTR("entities"));
    objc_msgSend(v10, "encodedData");
    v13 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v71[0] = CFSTR("BA");
  objc_msgSend(v6, "disabledBundles");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDBD1A8];
  v66 = (void *)v14;
  if (v14)
    v16 = v14;
  else
    v16 = MEMORY[0x24BDBD1A8];
  v72[0] = v16;
  v71[1] = CFSTR("AA");
  objc_msgSend(v6, "disabledApps");
  v17 = objc_claimAutoreleasedReturnValue();
  v65 = (void *)v17;
  if (v17)
    v18 = v17;
  else
    v18 = v15;
  v72[1] = v18;
  v71[2] = CFSTR("DA");
  objc_msgSend(v7, "searchDomains");
  v19 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)v19;
  if (v19)
    v20 = v19;
  else
    v20 = v15;
  v72[2] = v20;
  v71[3] = CFSTR("IP");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "infinitePatience"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v63;
  v71[4] = CFSTR("DAS");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "deviceAuthenticationState"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v72[4] = v62;
  v71[5] = CFSTR("WS");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "isWideScreen"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v72[5] = v61;
  v71[6] = CFSTR("FC");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "contentFilters"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v72[6] = v60;
  v71[7] = CFSTR("KL");
  objc_msgSend(v7, "keyboardLanguage");
  v21 = objc_claimAutoreleasedReturnValue();
  v59 = (void *)v21;
  if (v21)
    v22 = (const __CFString *)v21;
  else
    v22 = &stru_24CF64BB0;
  v72[7] = v22;
  v71[8] = CFSTR("KPL");
  objc_msgSend(v7, "keyboardPrimaryLanguage");
  v23 = objc_claimAutoreleasedReturnValue();
  v58 = (void *)v23;
  if (v23)
    v24 = (const __CFString *)v23;
  else
    v24 = &stru_24CF64BB0;
  v72[8] = v24;
  v71[9] = CFSTR("SCF");
  v25 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "scaleFactor");
  objc_msgSend(v25, "numberWithDouble:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v72[9] = v57;
  v71[10] = CFSTR("QC");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v6, "maxCount"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v72[10] = v56;
  v71[11] = CFSTR("QI");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "queryIdent"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v72[11] = v55;
  v71[12] = CFSTR("QID");
  v67 = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v3, "queryID"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v72[12] = v54;
  v71[13] = CFSTR("QS");
  objc_msgSend(v7, "searchString");
  v26 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v26;
  if (v26)
    v27 = (const __CFString *)v26;
  else
    v27 = &stru_24CF64BB0;
  v72[13] = v27;
  v71[14] = CFSTR("DDA");
  objc_msgSend(v7, "disabledDomains");
  v28 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v28;
  if (v28)
    v29 = v28;
  else
    v29 = v15;
  v72[14] = v29;
  v71[15] = CFSTR("QSMRA");
  objc_msgSend(v7, "markedTextArray");
  v30 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v13;
  v51 = (void *)v30;
  if (v30)
    v31 = v30;
  else
    v31 = v15;
  v72[15] = v31;
  v71[16] = CFSTR("EA");
  v32 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v32;
  v72[16] = v32;
  v71[17] = CFSTR("WHY");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "whyQuery"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v72[17] = v49;
  v71[18] = CFSTR("QK");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "queryKind"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v72[18] = v48;
  v71[19] = CFSTR("NT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "noTokenize"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v72[19] = v47;
  v71[20] = CFSTR("RPP");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "promoteParsecResults"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v72[20] = v33;
  v71[21] = CFSTR("RPL");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "promoteLocalResults"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v72[21] = v34;
  v71[22] = CFSTR("InternalValidation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "internalValidation"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v72[22] = v35;
  v71[23] = CFSTR("InternalDebug");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "internalDebug"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v72[23] = v36;
  v71[24] = CFSTR("CT");
  v37 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "currentTime");
  objc_msgSend(v37, "numberWithDouble:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v72[24] = v38;
  v71[25] = CFSTR("DOCR");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "disableOCR"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v72[25] = v39;
  v71[26] = CFSTR("FL2S");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "fetchL2Signals"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v72[26] = v40;
  v71[27] = CFSTR("QU");
  objc_msgSend(v7, "queryUnderstandingOutput");
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v41;
  v43 = MEMORY[0x24BDBD1B8];
  if (v41)
    v43 = v41;
  v72[27] = v43;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 28);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v50)
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __42__SPDaemonConnection_sendMessageForToken___block_invoke;
  v69[3] = &unk_24CF63D08;
  v70 = v67;
  v44 = v67;
  -[SPDaemonConnection _sendInteractiveMessage:object:info:reply:](self, "_sendInteractiveMessage:object:info:reply:", CFSTR("OpenQuery"), 0, v46, v69);

}

uint64_t __42__SPDaemonConnection_sendMessageForToken___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    v5[0] = 67109120;
    v5[1] = qos_class_self();
    _os_log_impl(&dword_213202000, v2, v3, "SPDC query did complete reply QOS: %d", (uint8_t *)v5, 8u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "queryDidComplete");
}

- (id)startQuery:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  SPDaemonQueryToken *v11;
  NSObject *v12;
  SPDaemonQueryToken *v13;
  SPDaemonQueryToken *v14;
  SPDaemonQueryToken *v15;
  _QWORD v17[5];
  SPDaemonQueryToken *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SPDaemonQueryToken initWithQuery:queue:delegate:]([SPDaemonQueryToken alloc], "initWithQuery:queue:delegate:", v10, v9, v8);
  CFDictionarySetValue(self->_runningQueries, (const void *)-[SPDaemonQueryToken queryID](v11, "queryID"), v11);

  v12 = _os_activity_create(&dword_213202000, "query", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __48__SPDaemonConnection_startQuery_queue_delegate___block_invoke;
  v17[3] = &unk_24CF63C90;
  v17[4] = self;
  v13 = v11;
  v18 = v13;
  os_activity_apply(v12, v17);
  v14 = v18;
  v15 = v13;

  return v15;
}

uint64_t __48__SPDaemonConnection_startQuery_queue_delegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendMessageForToken:", *(_QWORD *)(a1 + 40));
}

- (void)cancelQuery:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *connectionQueue;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SPDaemonConnection_cancelQuery___block_invoke;
  block[3] = &unk_24CF63C90;
  block[4] = self;
  v7 = v4;
  v13 = v7;
  dispatch_sync(connectionQueue, block);
  v8 = _os_activity_create(&dword_213202000, "queryCancel", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __34__SPDaemonConnection_cancelQuery___block_invoke_2;
  v10[3] = &unk_24CF63C90;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  os_activity_apply(v8, v10);

}

void __34__SPDaemonConnection_cancelQuery___block_invoke(uint64_t a1)
{
  id v2;

  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 40), (const void *)objc_msgSend(*(id *)(a1 + 40), "queryID"));
  objc_msgSend(*(id *)(a1 + 40), "query");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

void __34__SPDaemonConnection_cancelQuery___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "queryID"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithObject:forKey:", v4, CFSTR("QID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sendMessage:object:info:reply:", CFSTR("CloseQuery"), 0, v3, &__block_literal_global_2);

}

- (void)activate
{
  OS_dispatch_queue *queue;
  NSObject *v3;
  qos_class_t v4;
  dispatch_block_t v5;
  void *v6;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__SPDaemonConnection_activate__block_invoke;
  block[3] = &unk_24CF63D90;
  block[4] = self;
  v3 = queue;
  v4 = qos_class_self();
  if (v4 < 0x1A)
    v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  else
    v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v4, 0, block);
  v6 = v5;
  dispatch_async(v3, v5);

}

void __30__SPDaemonConnection_activate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  qos_class_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 67109120;
    v7 = qos_class_self();
    _os_log_impl(&dword_213202000, v2, v3, "SPDC Activate QOS: %d", buf, 8u);
  }

  v4 = _os_activity_create(&dword_213202000, "activation", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__SPDaemonConnection_activate__block_invoke_84;
  block[3] = &unk_24CF63D90;
  block[4] = *(_QWORD *)(a1 + 32);
  os_activity_apply(v4, block);

}

uint64_t __30__SPDaemonConnection_activate__block_invoke_84(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendInteractiveMessage:object:info:reply:", CFSTR("Activate"), 0, 0, &__block_literal_global_87);
}

void __31__SPDaemonConnection_activate___block_invoke_88(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sendInteractiveMessage:object:info:reply:", CFSTR("Activate"), v2, 0, &__block_literal_global_89);

}

- (void)sendApps:(id)a3
{
  id v4;
  id v5;
  NSObject *activity;
  _QWORD block[5];
  id v8;

  v4 = a3;
  activity = _os_activity_create(&dword_213202000, "apps", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SPDaemonConnection_sendApps___block_invoke;
  block[3] = &unk_24CF63C90;
  block[4] = self;
  v8 = v4;
  v5 = v4;
  os_activity_apply(activity, block);

}

uint64_t __31__SPDaemonConnection_sendApps___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:object:info:reply:", CFSTR("Apps"), *(_QWORD *)(a1 + 40), MEMORY[0x24BDBD1B8], &__block_literal_global_92);
}

- (void)deactivate
{
  dispatch_block_t v3;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SPDaemonConnection_deactivate__block_invoke;
  block[3] = &unk_24CF63D90;
  block[4] = self;
  v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
  dispatch_async((dispatch_queue_t)self->_queue, v3);

}

void __32__SPDaemonConnection_deactivate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  v2 = _os_activity_create(&dword_213202000, "deactivation", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SPDaemonConnection_deactivate__block_invoke_2;
  block[3] = &unk_24CF63D90;
  block[4] = *(_QWORD *)(a1 + 32);
  os_activity_apply(v2, block);

}

uint64_t __32__SPDaemonConnection_deactivate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:object:info:reply:", CFSTR("Deactivate"), 0, 0, 0);
}

- (void)preheat
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__SPDaemonConnection_preheat__block_invoke;
  block[3] = &unk_24CF63D90;
  block[4] = self;
  dispatch_async(queue, block);
}

void __29__SPDaemonConnection_preheat__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  qos_class_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 67109120;
    v7 = qos_class_self();
    _os_log_impl(&dword_213202000, v2, v3, "SPDC preheat QOS: %d", buf, 8u);
  }

  v4 = _os_activity_create(&dword_213202000, "preheat", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__SPDaemonConnection_preheat__block_invoke_95;
  block[3] = &unk_24CF63D90;
  block[4] = *(_QWORD *)(a1 + 32);
  os_activity_apply(v4, block);

}

uint64_t __29__SPDaemonConnection_preheat__block_invoke_95(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:object:info:reply:", CFSTR("Preheat"), 0, 0, 0);
}

- (void)clearInput:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SPDaemonConnection_clearInput___block_invoke;
  block[3] = &unk_24CF63D90;
  block[4] = self;
  dispatch_async(queue, block);
}

void __33__SPDaemonConnection_clearInput___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  v2 = _os_activity_create(&dword_213202000, "queryClear", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SPDaemonConnection_clearInput___block_invoke_2;
  block[3] = &unk_24CF63D90;
  block[4] = *(_QWORD *)(a1 + 32);
  os_activity_apply(v2, block);

}

uint64_t __33__SPDaemonConnection_clearInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:object:info:reply:", CFSTR("ClearInput"), 0, 0, 0);
}

- (void)retrieveFirstTimeExperienceTextWithReply:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__SPDaemonConnection_retrieveFirstTimeExperienceTextWithReply___block_invoke;
  v7[3] = &unk_24CF63E48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __63__SPDaemonConnection_retrieveFirstTimeExperienceTextWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *activity;
  _QWORD block[5];
  id v5;

  activity = _os_activity_create(&dword_213202000, "fte", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__SPDaemonConnection_retrieveFirstTimeExperienceTextWithReply___block_invoke_2;
  block[3] = &unk_24CF63E48;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  os_activity_apply(activity, block);

}

void __63__SPDaemonConnection_retrieveFirstTimeExperienceTextWithReply___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __63__SPDaemonConnection_retrieveFirstTimeExperienceTextWithReply___block_invoke_3;
  v2[3] = &unk_24CF63E20;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_sendMessage:object:info:reply:", CFSTR("RequestFTE"), 0, 0, v2);

}

void __63__SPDaemonConnection_retrieveFirstTimeExperienceTextWithReply___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKey:", CFSTR("FTE"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)requestParsecParametersWithReply:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SPDaemonConnection_requestParsecParametersWithReply___block_invoke;
  v7[3] = &unk_24CF63E48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __55__SPDaemonConnection_requestParsecParametersWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *activity;
  _QWORD block[5];
  id v5;

  activity = _os_activity_create(&dword_213202000, "parsecparams", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SPDaemonConnection_requestParsecParametersWithReply___block_invoke_2;
  block[3] = &unk_24CF63E48;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  os_activity_apply(activity, block);

}

void __55__SPDaemonConnection_requestParsecParametersWithReply___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __55__SPDaemonConnection_requestParsecParametersWithReply___block_invoke_3;
  v2[3] = &unk_24CF63E20;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_sendMessage:object:info:reply:", CFSTR("RequestParsecParameters"), 0, 0, v2);

}

void __55__SPDaemonConnection_requestParsecParametersWithReply___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKey:", CFSTR("PP"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)connectionQueue
{
  return self->_connectionQueue;
}

- (void)barrierOnXPC:(id)a3
{
  SPXPCConnection *connection;

  connection = self->_connection;
  if (connection)
    -[SPXPCConnection barrier:](connection, "barrier:", a3);
  else
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)dealloc
{
  NSObject *connectionQueue;
  __CFDictionary *runningQueries;
  objc_super v5;

  -[SPDaemonConnection _resetConnection](self, "_resetConnection");
  connectionQueue = self->_connectionQueue;
  if (connectionQueue && dispatch_get_specific("com.apple.search.XPCQueue") != self)
    dispatch_sync(connectionQueue, &__block_literal_global_121);
  runningQueries = self->_runningQueries;
  if (runningQueries)
    CFRelease(runningQueries);
  v5.receiver = self;
  v5.super_class = (Class)SPDaemonConnection;
  -[SPDaemonConnection dealloc](&v5, sel_dealloc);
}

- (NSString)daemonName
{
  return self->_daemonName;
}

- (void)setDaemonName:(id)a3
{
  objc_storeStrong((id *)&self->_daemonName, a3);
}

- (__CFDictionary)runningQueries
{
  return self->_runningQueries;
}

- (void)setRunningQueries:(__CFDictionary *)a3
{
  self->_runningQueries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonName, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
