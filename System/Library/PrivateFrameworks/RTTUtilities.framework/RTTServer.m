@implementation RTTServer

void __27__RTTServer_sharedInstance__block_invoke()
{
  RTTServer *v0;
  void *v1;

  v0 = objc_alloc_init(RTTServer);
  v1 = (void *)sharedInstance_Server;
  sharedInstance_Server = (uint64_t)v0;

}

- (RTTServer)init
{
  RTTServer *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *databaseResponseBlocks;
  NSLock *v5;
  NSLock *dataResponseBlocksLock;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *commonRequestQueue;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *messageProcessingQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RTTServer;
  v2 = -[HCServer init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    databaseResponseBlocks = v2->_databaseResponseBlocks;
    v2->_databaseResponseBlocks = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    dataResponseBlocksLock = v2->_dataResponseBlocksLock;
    v2->_dataResponseBlocksLock = v5;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("tty_common_queue", v7);
    commonRequestQueue = v2->_commonRequestQueue;
    v2->_commonRequestQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("tty_msg_processing_queue", v10);
    messageProcessingQueue = v2->_messageProcessingQueue;
    v2->_messageProcessingQueue = (OS_dispatch_queue *)v11;

    -[RTTServer _registerForServerSettingsUpdates](v2, "_registerForServerSettingsUpdates");
  }
  return v2;
}

- (void)handleMessageWithPayload:(id)a3 forIdentifier:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *messageProcessingQueue;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  RTTServer *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  void *v22;
  RTTServer *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if ((uint64_t)a4 > 0xFFFFFFFFFFLL)
  {
    if (a4 == 0x10000000000 || a4 == 0x20000000000)
      goto LABEL_9;
    v8 = 0x40000000000;
  }
  else
  {
    if (a4 == 0x800000000)
    {
LABEL_9:
      AXLogRTT();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = a4;
        _os_log_impl(&dword_21473C000, v9, OS_LOG_TYPE_INFO, "Handling message update: %d", buf, 8u);
      }

      messageProcessingQueue = self->_messageProcessingQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __52__RTTServer_handleMessageWithPayload_forIdentifier___block_invoke_31;
      block[3] = &unk_24D203F48;
      v15 = v7;
      v16 = self;
      v17 = a4;
      dispatch_async(messageProcessingQueue, block);
      v11 = v15;
LABEL_12:

      goto LABEL_13;
    }
    if (a4 == 0x1000000000)
    {
      objc_msgSend(v6, "valueForKey:", CFSTR("result"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AXLogRTT();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v7;
        _os_log_impl(&dword_21473C000, v13, OS_LOG_TYPE_INFO, "Got result for action sheet: %@", buf, 0xCu);
      }

      v18 = MEMORY[0x24BDAC760];
      v19 = 3221225472;
      v20 = __52__RTTServer_handleMessageWithPayload_forIdentifier___block_invoke;
      v21 = &unk_24D203A08;
      v22 = v12;
      v23 = self;
      v11 = v12;
      AXPerformBlockAsynchronouslyOnMainThread();

      goto LABEL_12;
    }
    v8 = 0x4000000000;
  }
  if (a4 == v8)
    goto LABEL_9;
LABEL_13:

}

void __52__RTTServer_handleMessageWithPayload_forIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void (**)(_QWORD, _QWORD))objc_msgSend(v7, "copy");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "unlock");
  AXLogRTT();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)MEMORY[0x2199D4874](v8);
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_21473C000, v9, OS_LOG_TYPE_INFO, "Handling response for %@ with %@", (uint8_t *)&v11, 0x16u);

  }
  if (v8)
    ((void (**)(_QWORD, id))v8)[2](v8, v6);

}

intptr_t __33__RTTServer_contactIsTTYContact___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "objectForKey:", CFSTR("axtty_result"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "BOOLValue");

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_Server;
}

void __33__RTTServer_contactIsTTYContact___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  _QWORD v26[4];
  __int128 v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x24BDBA348];
  v38[0] = *MEMORY[0x24BDBA348];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "areKeysAvailable:", v5);

  v6 = MEMORY[0x24BDAC760];
  if ((_DWORD)v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "phoneNumbers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v6;
    v30[1] = 3221225472;
    v30[2] = __33__RTTServer_contactIsTTYContact___block_invoke_2;
    v30[3] = &unk_24D203FE8;
    v8 = &v31;
    v31 = v2;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v30);
  }
  else
  {
    +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDBACA0];
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateForContactsWithIdentifiers:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unifiedContactsMatchingPredicate:keysToFetch:error:", v13, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v6;
    v28[1] = 3221225472;
    v28[2] = __33__RTTServer_contactIsTTYContact___block_invoke_3;
    v28[3] = &unk_24D204010;
    v8 = &v29;
    v29 = v2;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v28);

  }
  if (objc_msgSend(v2, "count"))
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("axtty_contact_path_search_action"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *(void **)(a1 + 40);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __33__RTTServer_contactIsTTYContact___block_invoke_5;
    v26[3] = &unk_24D204038;
    v25 = *(_OWORD *)(a1 + 48);
    v20 = (id)v25;
    v27 = v25;
    objc_msgSend(v19, "registerResponseBlock:forUUID:", v26, v18);
    v34 = CFSTR("axtty_contact_path_search_action");
    v32[0] = CFSTR("axtty_contactID");
    v21 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = CFSTR("axtty_value");
    v33[0] = v22;
    v33[1] = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendMessageWithPayload:andIdentifier:", v24, 0x800000000);

  }
}

- (void)registerResponseBlock:(id)a3 forUUID:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *databaseResponseBlocks;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10 && objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_msgSend(v10, "copy");
    -[NSLock lock](self->_dataResponseBlocksLock, "lock");
    databaseResponseBlocks = self->_databaseResponseBlocks;
    v9 = (void *)MEMORY[0x2199D4874](v7);
    -[NSMutableDictionary setObject:forKey:](databaseResponseBlocks, "setObject:forKey:", v9, v6);

    -[NSLock unlock](self->_dataResponseBlocksLock, "unlock");
  }

}

- (void)sendMessageWithPayload:(id)a3 andIdentifier:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  objc_super v8;

  v6 = a3;
  if (a4 == 0x200000000000)
  {
    -[RTTServer _createSandboxUrlForVoicemailMessage:](self, "_createSandboxUrlForVoicemailMessage:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)RTTServer;
  -[HCServer sendMessageWithPayload:andIdentifier:](&v8, sel_sendMessageWithPayload_andIdentifier_, v6, a4);

}

- (BOOL)contactIsTTYContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  dispatch_semaphore_t v7;
  NSObject *commonRequestQueue;
  NSObject *v9;
  dispatch_time_t v10;
  char v11;
  _QWORD v13[4];
  id v14;
  RTTServer *v15;
  dispatch_semaphore_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = dispatch_semaphore_create(0);
    commonRequestQueue = self->_commonRequestQueue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __33__RTTServer_contactIsTTYContact___block_invoke;
    v13[3] = &unk_24D204060;
    v14 = v4;
    v15 = self;
    v16 = v7;
    v17 = &v18;
    v9 = v7;
    dispatch_async(commonRequestQueue, v13);
    v10 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v9, v10);

  }
  v11 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __33__RTTServer_contactIsTTYContact___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_registerForServerSettingsUpdates
{
  -[RTTServer registerResponseBlock:forUUID:](self, "registerResponseBlock:forUUID:", &__block_literal_global_14, CFSTR("axtty_server_settings_upate_action"));
}

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v8;

  -[RTTServer setActionCompletionBlock:](self, "setActionCompletionBlock:", 0);
  -[RTTServer assertionInCallService](self, "assertionInCallService");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[RTTServer assertionInCallService](self, "assertionInCallService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isValid");

    if (v6)
    {
      -[RTTServer assertionInCallService](self, "assertionInCallService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "invalidate");

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)RTTServer;
  -[HCServer dealloc](&v8, sel_dealloc);
}

- (void)terminateConnectionAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  _BOOL4 v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)RTTServer;
  -[HCServer terminateConnectionAndNotify:](&v6, sel_terminateConnectionAndNotify_);
  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v8 = v3;
    _os_log_impl(&dword_21473C000, v4, OS_LOG_TYPE_INFO, "Terminate and notify about heard: %d", buf, 8u);
  }

  if (!v3)
  {
    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clearAllServerSettingsCache");

  }
}

void __46__RTTServer__registerForServerSettingsUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v2;
    _os_log_impl(&dword_21473C000, v3, OS_LOG_TYPE_INFO, "Received server settings update for %@", (uint8_t *)&v11, 0xCu);
  }

  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("preferenceKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearServerSettingsCacheForKey:", v5);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("preferenceKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationForSelector:", objc_msgSend(v8, "selectorForPreferenceKey:", v9));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v10, 0, 0, 1u);

}

- (void)resetConnection
{
  NSObject *v3;
  void *v4;
  NSMutableDictionary *databaseResponseBlocks;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  RTTServer *v12;
  id v13;
  objc_super v14;
  uint8_t buf[16];

  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21473C000, v3, OS_LOG_TYPE_INFO, "Connection reset", buf, 2u);
  }

  v14.receiver = self;
  v14.super_class = (Class)RTTServer;
  -[HCServer resetConnection](&v14, sel_resetConnection);
  -[NSLock lock](self->_dataResponseBlocksLock, "lock");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  databaseResponseBlocks = self->_databaseResponseBlocks;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __28__RTTServer_resetConnection__block_invoke;
  v11 = &unk_24D203EF8;
  v12 = self;
  v13 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](databaseResponseBlocks, "enumerateKeysAndObjectsUsingBlock:", &v8);
  -[NSMutableDictionary removeObjectsForKeys:](self->_databaseResponseBlocks, "removeObjectsForKeys:", v6, v8, v9, v10, v11, v12);
  -[NSLock unlock](self->_dataResponseBlocksLock, "unlock");
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearAllServerSettingsCache");

}

void __28__RTTServer_resetConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("axtty_conversation_updates")))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_"), CFSTR("axtty_conversation_updates"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", v4, &stru_24D204B08);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(void **)(a1 + 32);
    v10 = v5;
    v11 = CFSTR("axtty_conversation_updates");
    v9 = CFSTR("axtty_callID");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessageWithPayload:andIdentifier:", v8, 0x800000000);

  }
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("axtty_settings_key")))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (void)_managerAXPIDState:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (_AXSVoiceOverTouchEnabled() || _AXSAssistiveTouchScannerEnabled())
    CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x24BDBD5A0], 0.25, 0);
  getpid();
  if (v3)
    AXPidSuspend();
  else
    AXPidUnsuspend();
}

void __52__RTTServer_handleMessageWithPayload_forIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "actionCompletionBlock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 40), "_managerAXPIDState:", 0);
      objc_msgSend(*(id *)(a1 + 40), "actionCompletionBlock");
      v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v3[2](v3, objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"));

      objc_msgSend(*(id *)(a1 + 40), "setActionCompletionBlock:", 0);
    }
  }
}

uint64_t __52__RTTServer_handleMessageWithPayload_forIdentifier___block_invoke_31(uint64_t a1)
{
  void *v2;
  uint64_t result;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__RTTServer_handleMessageWithPayload_forIdentifier___block_invoke_2;
  v6[3] = &unk_24D203F20;
  v2 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  result = objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v6);
  if (*(_QWORD *)(a1 + 48) == 0x4000000000)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "lock");
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsForKeys:", v5);

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "unlock");
  }
  return result;
}

- (void)handleMessageError:(id)a3 destructive:(BOOL)a4
{
  id v4;
  NSObject *v5;

  v4 = a3;
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[RTTServer handleMessageError:destructive:].cold.1();

}

- (void)shouldRestartOnInterruption:(id)a3
{
  void *v3;
  void (**v4)(id, uint64_t);

  v3 = (void *)MEMORY[0x24BE4BD98];
  v4 = (void (**)(id, uint64_t))a3;
  v4[2](v4, objc_msgSend(v3, "currentProcessIsInCallService"));

}

- (BOOL)isEmergencyNumber:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4950]), "init");
  objc_msgSend(v4, "telephonyProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prioritizedSenderIdentities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4A30]), "init");
  if (objc_msgSend(v6, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "UUID", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v7, "isEmergencyNumberForDigits:senderIdentityUUID:", v3, v13);

          if ((v14 & 1) != 0)
          {

            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }

    goto LABEL_14;
  }
  if ((objc_msgSend(v7, "isEmergencyNumberForDigits:senderIdentityUUID:", v3, 0) & 1) == 0)
  {
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
LABEL_13:
  v15 = 1;
LABEL_15:

  return v15;
}

- (void)displayCallPromptForContact:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[4];
  void (**v30)(id, uint64_t);
  id v31;
  id v32;
  id location;
  _QWORD v34[2];
  _QWORD v35[2];
  void *v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (-[RTTServer isEmergencyNumber:](self, "isEmergencyNumber:", v6))
  {
    AXLogRTT();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v6;
      _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_DEFAULT, "Contact matching emergency number, dialing through RTT immediately: %@", buf, 0xCu);
    }

    if (+[RTTTelephonyUtilities shouldUseRTT](RTTTelephonyUtilities, "shouldUseRTT"))
      v9 = 2;
    else
      v9 = 1;
    v7[2](v7, v9);
  }
  else
  {
    -[RTTServer _managerAXPIDState:](self, "_managerAXPIDState:", 1);
    AXLogRTT();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v6;
      _os_log_impl(&dword_21473C000, v10, OS_LOG_TYPE_INFO, "Display call prompt for %@", buf, 0xCu);
    }

    v11 = (__CFString *)v6;
    if (v11)
      v12 = v11;
    else
      v12 = &stru_24D204B08;
    objc_initWeak(&location, self);
    -[RTTServer assertionInCallService](self, "assertionInCallService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[RTTServer assertionInCallService](self, "assertionInCallService");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isValid");

      if (v15)
      {
        -[RTTServer assertionInCallService](self, "assertionInCallService");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "invalidate");

      }
    }
    objc_msgSend(MEMORY[0x24BE80D38], "targetWithPid:", getpid());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.Accessibility"), CFSTR("CallTypeSelection"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x24BE80B10]);
    v36 = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithExplanation:target:attributes:", CFSTR("Prevent InCallService from sleeping to receive call type selection"), v17, v20);
    -[RTTServer setAssertionInCallService:](self, "setAssertionInCallService:", v21);

    -[RTTServer assertionInCallService](self, "assertionInCallService");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v23 = objc_msgSend(v22, "acquireWithError:", &v32);
    v24 = v32;

    if (v23)
    {
      AXLogRTT();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        -[RTTServer assertionInCallService](self, "assertionInCallService");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v26;
        _os_log_impl(&dword_21473C000, v25, OS_LOG_TYPE_INFO, "Took out assertion so that InCallService doesn't go to sleep on us: %@", buf, 0xCu);

      }
    }
    else
    {
      AXLogRTT();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[RTTServer displayCallPromptForContact:withCompletion:].cold.1();

      -[RTTServer assertionInCallService](self, "assertionInCallService");
      v25 = objc_claimAutoreleasedReturnValue();
      -[NSObject invalidate](v25, "invalidate");
    }

    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __56__RTTServer_displayCallPromptForContact_withCompletion___block_invoke;
    v29[3] = &unk_24D203F70;
    v30 = v7;
    objc_copyWeak(&v31, &location);
    -[RTTServer setActionCompletionBlock:](self, "setActionCompletionBlock:", v29);
    v34[0] = CFSTR("shouldShow");
    v34[1] = CFSTR("title");
    v35[0] = MEMORY[0x24BDBD1C8];
    v35[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v28, 0x1000000000);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
}

void __56__RTTServer_displayCallPromptForContact_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "assertionInCallService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)cancelCallPromptDisplay
{
  -[RTTServer _managerAXPIDState:](self, "_managerAXPIDState:", 0);
  -[RTTServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_24D209BE0, 0x1000000000);
}

- (void)setShouldSuppressIncomingNotification:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("shouldSuppress");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v5, 0x8000000000);

}

- (id)_createSandboxUrlForVoicemailMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v21;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("axtty_voicemail_message_url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4A28]), "initWithURL:withExtensionType:", v5, 0);
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v21;
    if (v8)
    {
      AXLogRTT();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[RTTServer _createSandboxUrlForVoicemailMessage:].cold.2();

      v10 = v3;
    }
    else
    {
      objc_msgSend(v4, "setValue:forKey:", v7, CFSTR("axtty_voicemail_message_url"));
      v10 = v4;
    }
    v19 = v10;

  }
  else
  {
    AXLogRTT();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[RTTServer _createSandboxUrlForVoicemailMessage:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    v19 = v3;
  }

  return v19;
}

- (void)findConversationForCallUID:(id)a3 andResult:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  RTTServer *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v7 && v8)
  {
    dispatch_get_global_queue(17, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__RTTServer_findConversationForCallUID_andResult___block_invoke;
    block[3] = &unk_24D203FC0;
    v11 = v6;
    v12 = self;
    v13 = v7;
    dispatch_async(v9, block);

  }
}

void __50__RTTServer_findConversationForCallUID_andResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("axtty_read_action"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__RTTServer_findConversationForCallUID_andResult___block_invoke_2;
  v8[3] = &unk_24D203F98;
  v3 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "registerResponseBlock:forUUID:", v8, v2);
  v12 = CFSTR("axtty_read_action");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v10 = CFSTR("axtty_callID");
  v11 = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessageWithPayload:andIdentifier:", v7, 0x800000000);

}

void __50__RTTServer_findConversationForCallUID_andResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("axtty_conversation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    v11 = 0;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDD1620]);
    objc_msgSend(v3, "objectForKey:", CFSTR("axtty_conversation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v8 = (void *)objc_msgSend(v6, "initForReadingFromData:error:", v7, &v13);
    v9 = v13;

    if (v9)
    {
      AXLogRTT();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __39__RTTController_handleDatabaseRequest___block_invoke_cold_2();

      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v12, *MEMORY[0x24BDD0E88]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setSystemOutputAudioMuted:(BOOL)a3 withCallID:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  const __CFString *v13;
  void *v14;
  uint8_t buf[4];
  _BOOL4 v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v16 = v4;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_21473C000, v7, OS_LOG_TYPE_INFO, "requesting server to toggle mute: %d %@", buf, 0x12u);
  }

  v13 = CFSTR("axtty_media_action");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4, CFSTR("axtty_value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("axtty_callID");
  v12[0] = v8;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v10, 0x80000000000);

}

- (void)setViewControllerIsVisible:(BOOL)a3 withCallID:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];
  uint8_t buf[4];
  _BOOL4 v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v13 = v4;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Requesting server to toggle view visibility: %d %@", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4, CFSTR("axtty_callID"), CFSTR("axtty_is_viewcontrollervisible_key"), v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v11[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v9, 0x100000000000);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[RTTServer setViewControllerIsVisible:withCallID:].cold.1();
  }

}

- (void)sendString:(id)a3 forCallUID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[4];
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BE4BD98];
  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v6, "currentProcessIsRTTExternsion");
  v15 = CFSTR("axtty_conversation_updates");
  v13[0] = CFSTR("axtty_callID");
  v13[1] = CFSTR("axtty_value");
  v14[0] = v7;
  v14[1] = v8;
  v10 = &unk_24D209CE0;
  if (!v9)
    v10 = &unk_24D209CF8;
  v13[2] = CFSTR("axtty_sender_type");
  v13[3] = CFSTR("axtty_message_type");
  v14[2] = v10;
  v14[3] = &unk_24D209CF8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v12, 0x800000000);
}

- (void)sendTranscription:(id)a3 forCallUUID:(id)a4 isNew:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[4];
  const __CFString *v18;
  _QWORD v19[2];

  v5 = a5;
  v19[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BE4BD98];
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v8, "currentProcessIsRTTExternsion");
  v18 = CFSTR("axtty_conversation_updates");
  v16[0] = CFSTR("axtty_callID");
  v16[1] = CFSTR("axtty_value");
  v17[0] = v9;
  v17[1] = v10;
  v12 = &unk_24D209CF8;
  if (v11)
    v12 = &unk_24D209CE0;
  v16[2] = CFSTR("axtty_sender_type");
  v16[3] = CFSTR("axtty_message_type");
  v13 = &unk_24D209D10;
  if (v5)
    v13 = &unk_24D209CE0;
  v17[2] = v12;
  v17[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v15, 0x800000000);
}

- (void)sendConversationUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
  {
    AXLogRTT();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[RTTServer sendConversationUpdate:].cold.1();
  }
  else
  {
    v11 = v5;
    v12 = CFSTR("axtty_write_action");
    v10 = CFSTR("axtty_conversation");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v8, 0x800000000);

  }
}

- (void)registerForUpdates:(id)a3 forCallUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  const __CFString *v20;
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("axtty_conversation_updates"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __43__RTTServer_registerForUpdates_forCallUID___block_invoke;
    v18[3] = &unk_24D203F98;
    v19 = v6;
    -[RTTServer registerResponseBlock:forUUID:](self, "registerResponseBlock:forUUID:", v18, v8);
    v21 = v7;
    v22 = CFSTR("axtty_conversation_updates");
    v20 = CFSTR("axtty_callID");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v10, 0x800000000);

  }
  else
  {
    AXLogRTT();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[RTTServer registerForUpdates:forCallUID:].cold.1(v8, v11, v12, v13, v14, v15, v16, v17);
  }

}

void __43__RTTServer_registerForUpdates_forCallUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("axtty_result"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("axtty_value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerForRemoteUpdates:(id)a3 forCallUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  const __CFString *v21;
  id v22;
  const __CFString *v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("axtty_remote_conversation_updates"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __49__RTTServer_registerForRemoteUpdates_forCallUID___block_invoke;
    v19[3] = &unk_24D203F98;
    v20 = v6;
    -[RTTServer registerResponseBlock:forUUID:](self, "registerResponseBlock:forUUID:", v19, v8);
    AXLogRTT();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl(&dword_21473C000, v9, OS_LOG_TYPE_INFO, "Registered for remote updates for: %@", buf, 0xCu);
    }

    v22 = v7;
    v23 = CFSTR("axtty_remote_conversation_updates");
    v21 = CFSTR("axtty_callID");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v11, 0x10000000000);

  }
  else
  {
    AXLogRTT();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[RTTServer registerForUpdates:forCallUID:].cold.1(v8, v12, v13, v14, v15, v16, v17, v18);
  }

}

void __49__RTTServer_registerForRemoteUpdates_forCallUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("axtty_result"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("axtty_value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("axtty_message_type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "integerValue");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)registerForServiceUpdates:(id)a3 forCallUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  const __CFString *v15;
  id v16;
  const __CFString *v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("axtty_service_message_updates"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__RTTServer_registerForServiceUpdates_forCallUID___block_invoke;
  v13[3] = &unk_24D203F98;
  v14 = v6;
  v9 = v6;
  -[RTTServer registerResponseBlock:forUUID:](self, "registerResponseBlock:forUUID:", v13, v8);
  AXLogRTT();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_21473C000, v10, OS_LOG_TYPE_INFO, "Registered for service updates for: %@", buf, 0xCu);
  }

  v16 = v7;
  v17 = CFSTR("axtty_service_message_updates");
  v15 = CFSTR("axtty_callID");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v12, 0x20000000000);

}

void __50__RTTServer_registerForServiceUpdates_forCallUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("axtty_result"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("axtty_value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("axtty_set_visible_service_update"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "BOOLValue");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)deleteConversationWithCallUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = CFSTR("axtty_delete_action");
  v9 = CFSTR("axtty_callID");
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v7, 0x800000000);
  return 1;
}

void __33__RTTServer_contactIsTTYContact___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "phoneNumbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__RTTServer_contactIsTTYContact___block_invoke_4;
  v4[3] = &unk_24D203FE8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __33__RTTServer_contactIsTTYContact___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)valueForTTYSetting:(id)a3
{
  id v4;
  NSObject *v5;
  void *specific;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *commonRequestQueue;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  RTTServer *v20;
  id v21;
  NSObject *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  if (objc_msgSend(v4, "length"))
  {
    dispatch_get_current_queue();
    v5 = objc_claimAutoreleasedReturnValue();
    specific = dispatch_queue_get_specific(v5, &valueForTTYSetting__SemaphoreKey);
    if (specific)
    {
      v7 = specific;
    }
    else
    {
      v7 = dispatch_semaphore_create(0);
      dispatch_queue_set_specific(v5, &valueForTTYSetting__SemaphoreKey, v7, (dispatch_function_t)destructor);
      AXLogRTT();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v4;
        _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Making new semaphore for this request: %@", buf, 0xCu);
      }

    }
    AXLogRTT();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v4;
      _os_log_impl(&dword_21473C000, v9, OS_LOG_TYPE_INFO, "Requesting value remotely: %@", buf, 0xCu);
    }

    commonRequestQueue = self->_commonRequestQueue;
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __32__RTTServer_valueForTTYSetting___block_invoke;
    v19 = &unk_24D2040B0;
    v20 = self;
    v23 = &v24;
    v21 = v4;
    v11 = v7;
    v22 = v11;
    dispatch_async(commonRequestQueue, &v16);
    v12 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v11, v12))
    {
      AXLogRTT();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[RTTServer valueForTTYSetting:].cold.1();

      dispatch_queue_set_specific(v5, &valueForTTYSetting__SemaphoreKey, 0, (dispatch_function_t)destructor);
      if (objc_msgSend(MEMORY[0x24BE4BD98], "isInternalInstall", v16, v17, v18, v19, v20, v21))
        -[RTTServer _takeStackshot](self, "_takeStackshot");
    }

  }
  v14 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __32__RTTServer_valueForTTYSetting___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%lld"), CFSTR("axtty_settings_key"), ++valueForTTYSetting__AtomicCount);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__RTTServer_valueForTTYSetting___block_invoke_2;
  v7[3] = &unk_24D204088;
  v10 = *(_QWORD *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "registerResponseBlock:forUUID:", v7, v2);
  v13[0] = CFSTR("axtty_uuid");
  v13[1] = CFSTR("axtty_settings_key");
  v4 = *(_QWORD *)(a1 + 40);
  v14[0] = v2;
  v14[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogRTT();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_21473C000, v6, OS_LOG_TYPE_INFO, "Dispatch requesting: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "sendMessageWithPayload:andIdentifier:", v5, 0x4000000000);
}

void __32__RTTServer_valueForTTYSetting___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("axtty_result"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_21473C000, v7, OS_LOG_TYPE_INFO, "Received remote RTT setting: %@={%@}", (uint8_t *)&v9, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_takeStackshot
{
  NSObject *v2;
  void (*v3)(const __CFString *, uint64_t);
  void *v4;
  void *v5;
  uint8_t v6[16];

  AXLogRTT();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21473C000, v2, OS_LOG_TYPE_INFO, "Writing out stackshot", v6, 2u);
  }

  v3 = (void (*)(const __CFString *, uint64_t))_takeStackshot___gWriteStackshotReportFunction;
  if (_takeStackshot___gWriteStackshotReportFunction)
    goto LABEL_7;
  v4 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
  if (v4)
  {
    v5 = v4;
    _takeStackshot___gWriteStackshotReportFunction = dlsym(v4, "WriteStackshotReport");
    dlclose(v5);
  }
  v3 = (void (*)(const __CFString *, uint64_t))_takeStackshot___gWriteStackshotReportFunction;
  if (_takeStackshot___gWriteStackshotReportFunction)
LABEL_7:
    v3(CFSTR("Timeout waiting for heard to respond"), 3131746989);
}

- (void)setTTYDictionaryAvailability:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("shouldBeAvailable");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v5, 0x2000000000);

}

- (void)primeRTTServer
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("axtty_uuid");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("axtty_settings_key");
  v7[0] = v4;
  v7[1] = kAXSRTTSettingsVersionPreference;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v5, 0x4000000000);

}

- (id)actionCompletionBlock
{
  return self->_actionCompletionBlock;
}

- (void)setActionCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (RBSAssertion)assertionInCallService
{
  return self->_assertionInCallService;
}

- (void)setAssertionInCallService:(id)a3
{
  objc_storeStrong((id *)&self->_assertionInCallService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionInCallService, 0);
  objc_storeStrong(&self->_actionCompletionBlock, 0);
  objc_storeStrong((id *)&self->_messageProcessingQueue, 0);
  objc_storeStrong((id *)&self->_commonRequestQueue, 0);
  objc_storeStrong((id *)&self->_databaseResponseBlocks, 0);
  objc_storeStrong((id *)&self->_dataResponseBlocksLock, 0);
}

- (void)handleMessageError:destructive:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21473C000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)displayCallPromptForContact:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21473C000, v0, v1, "Failed to aquire CallTypeSelection assertion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_createSandboxUrlForVoicemailMessage:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21473C000, a1, a3, "Failed to get voicemail URL from message payload", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_createSandboxUrlForVoicemailMessage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21473C000, v0, v1, "Failed to archive sandbox url data with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setViewControllerIsVisible:withCallID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21473C000, v0, v1, "No call id available to set view controller visible: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)sendConversationUpdate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_21473C000, v1, OS_LOG_TYPE_ERROR, "Failed to archive RTTConversation %@ with error %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)registerForUpdates:(uint64_t)a3 forCallUID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21473C000, a1, a3, "Registering for update with nil call id", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)valueForTTYSetting:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21473C000, v0, v1, "Timeout waiting for setting: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
