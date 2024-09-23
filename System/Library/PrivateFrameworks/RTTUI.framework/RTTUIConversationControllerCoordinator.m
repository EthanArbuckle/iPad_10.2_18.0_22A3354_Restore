@implementation RTTUIConversationControllerCoordinator

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__RTTUIConversationControllerCoordinator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_Coordinator;
}

void __56__RTTUIConversationControllerCoordinator_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_Coordinator;
  sharedInstance_Coordinator = v0;

}

- (RTTUIConversationControllerCoordinator)init
{
  RTTUIConversationControllerCoordinator *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *utteranceRequestQueue;
  uint64_t v6;
  NSPointerArray *conversationControllers;
  uint64_t v8;
  NSPointerArray *recentMessageControllers;
  uint64_t v10;
  NSMutableArray *utteranceBuffer;
  NSLock *v12;
  NSLock *realtimeSendLock;
  uint64_t v14;
  NSMutableSet *registeredCalls;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)RTTUIConversationControllerCoordinator;
  v2 = -[RTTUIConversationControllerCoordinator init](&v18, sel_init);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("rtt_send_queue", v3);
  utteranceRequestQueue = v2->_utteranceRequestQueue;
  v2->_utteranceRequestQueue = (OS_dispatch_queue *)v4;

  objc_msgSend(MEMORY[0x24BDD1748], "pointerArrayWithOptions:", 5);
  v6 = objc_claimAutoreleasedReturnValue();
  conversationControllers = v2->_conversationControllers;
  v2->_conversationControllers = (NSPointerArray *)v6;

  objc_msgSend(MEMORY[0x24BDD1748], "pointerArrayWithOptions:", 5);
  v8 = objc_claimAutoreleasedReturnValue();
  recentMessageControllers = v2->_recentMessageControllers;
  v2->_recentMessageControllers = (NSPointerArray *)v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = objc_claimAutoreleasedReturnValue();
  utteranceBuffer = v2->_utteranceBuffer;
  v2->_utteranceBuffer = (NSMutableArray *)v10;

  v12 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
  realtimeSendLock = v2->_realtimeSendLock;
  v2->_realtimeSendLock = v12;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14 = objc_claimAutoreleasedReturnValue();
  registeredCalls = v2->_registeredCalls;
  v2->_registeredCalls = (NSMutableSet *)v14;

  objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startServerWithDelegate:", v2);

  return v2;
}

- (void)addConversationController:(id)a3
{
  -[NSPointerArray addPointer:](self->_conversationControllers, "addPointer:", a3);
}

- (void)addRecentMessageController:(id)a3
{
  -[NSPointerArray addPointer:](self->_recentMessageControllers, "addPointer:", a3);
}

- (id)conversationControllers
{
  return -[NSPointerArray allObjects](self->_conversationControllers, "allObjects");
}

- (id)recentMessageControllers
{
  return -[NSPointerArray allObjects](self->_recentMessageControllers, "allObjects");
}

- (void)sendNewUtteranceString:(id)a3 controller:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *utteranceRequestQueue;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  RTTUIConversationControllerCoordinator *v25;
  id v26;
  id v27;
  __int128 *p_buf;
  uint8_t v29[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "call");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogRTT();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_216E9C000, v9, OS_LOG_TYPE_INFO, "Sending utterance |%@|", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend(v6, "length"))
  {
    v10 = (void *)objc_msgSend(v6, "copy");
    v11 = (void *)MEMORY[0x24BE7CB78];
    objc_msgSend(v7, "currentContactPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "utteranceWithContactPath:andText:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addUtterance:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "utteranceCellAtIndexPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy_;
    v38 = __Block_byref_object_dispose_;
    objc_msgSend(v15, "utterance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (id)objc_msgSend(v17, "copy");

    AXLogRTT();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v15, "utterance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v29 = 138412802;
      v30 = v15;
      v31 = 2112;
      v32 = v14;
      v33 = 2112;
      v34 = v19;
      _os_log_impl(&dword_216E9C000, v18, OS_LOG_TYPE_INFO, "Got cell %@[%@] with utterance %@", v29, 0x20u);

    }
    utteranceRequestQueue = self->_utteranceRequestQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__RTTUIConversationControllerCoordinator_sendNewUtteranceString_controller___block_invoke;
    block[3] = &unk_24D657868;
    v24 = v10;
    v25 = self;
    p_buf = &buf;
    v26 = v14;
    v27 = v8;
    v21 = v14;
    v22 = v10;
    dispatch_async(utteranceRequestQueue, block);

    _Block_object_dispose(&buf, 8);
  }

}

uint64_t __76__RTTUIConversationControllerCoordinator_sendNewUtteranceString_controller___block_invoke(uint64_t a1)
{
  NSUInteger v2;
  NSUInteger v3;
  NSUInteger v4;
  NSObject *v5;
  void *v6;
  NSUInteger v7;
  int v9;
  void *v10;
  uint64_t v11;
  NSRange v12;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "length"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "rangeOfString:options:", *(_QWORD *)(a1 + 32), 4);
  v4 = v3;
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12.location = v2;
    v12.length = v4;
    NSStringFromRange(v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_216E9C000, v5, OS_LOG_TYPE_INFO, "Found range of existing utterance: %@", (uint8_t *)&v9, 0xCu);

  }
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = v2;
  return objc_msgSend(*(id *)(a1 + 40), "_sendNewUtteranceString:atIndex:forCellPath:call:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)conversationControllerForCallUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
    -[RTTUIConversationControllerCoordinator conversationControllerForCallUUID:].cold.1();
  -[RTTUIConversationControllerCoordinator conversationControllers](self, "conversationControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__RTTUIConversationControllerCoordinator_conversationControllerForCallUUID___block_invoke;
  v10[3] = &unk_24D657890;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "ax_filteredArrayUsingBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __76__RTTUIConversationControllerCoordinator_conversationControllerForCallUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "call");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "callUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)recentMessageControllerForCallUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
    -[RTTUIConversationControllerCoordinator recentMessageControllerForCallUUID:].cold.1();
  -[RTTUIConversationControllerCoordinator recentMessageControllers](self, "recentMessageControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __77__RTTUIConversationControllerCoordinator_recentMessageControllerForCallUUID___block_invoke;
  v10[3] = &unk_24D6578B8;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "ax_filteredArrayUsingBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __77__RTTUIConversationControllerCoordinator_recentMessageControllerForCallUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "call");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "callUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)registerForCallUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  __int128 buf;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[NSMutableSet containsObject:](self->_registeredCalls, "containsObject:", v4))
  {
    -[NSMutableSet addObject:](self->_registeredCalls, "addObject:", v4);
    objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke;
    v23[3] = &unk_24D657908;
    v23[4] = self;
    v8 = v4;
    v24 = v8;
    objc_msgSend(v6, "registerForUpdates:forCallUID:", v23, v8);

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v26 = 0x2020000000;
    v9 = getAXProcessIsInCallServiceSymbolLoc_ptr;
    v27 = getAXProcessIsInCallServiceSymbolLoc_ptr;
    if (!getAXProcessIsInCallServiceSymbolLoc_ptr)
    {
      v10 = (void *)AccessibilityUtilitiesLibrary();
      v9 = dlsym(v10, "AXProcessIsInCallService");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v9;
      getAXProcessIsInCallServiceSymbolLoc_ptr = v9;
    }
    _Block_object_dispose(&buf, 8);
    if (v9)
    {
      if (((unsigned int (*)(void))v9)())
      {
        objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v7;
        v21[1] = 3221225472;
        v21[2] = __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_52;
        v21[3] = &unk_24D657958;
        v21[4] = self;
        v22 = v8;
        objc_msgSend(v11, "registerForRemoteUpdates:forCallUID:", v21, v22);

LABEL_18:
        objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v7;
        v17[1] = 3221225472;
        v17[2] = __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_57;
        v17[3] = &unk_24D6579A8;
        v17[4] = self;
        v18 = v8;
        objc_msgSend(v16, "registerForServiceUpdates:forCallUID:", v17, v18);

        goto LABEL_19;
      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v26 = 0x2020000000;
      v12 = getAXProcessIsRTTNotificationContentExtensionSymbolLoc_ptr;
      v27 = getAXProcessIsRTTNotificationContentExtensionSymbolLoc_ptr;
      if (!getAXProcessIsRTTNotificationContentExtensionSymbolLoc_ptr)
      {
        v13 = (void *)AccessibilityUtilitiesLibrary();
        v12 = dlsym(v13, "AXProcessIsRTTNotificationContentExtension");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v12;
        getAXProcessIsRTTNotificationContentExtensionSymbolLoc_ptr = v12;
      }
      _Block_object_dispose(&buf, 8);
      if (v12)
      {
        if (((unsigned int (*)(void))v12)())
        {
          objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = v7;
          v19[1] = 3221225472;
          v19[2] = __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_55;
          v19[3] = &unk_24D657958;
          v19[4] = self;
          v20 = v8;
          objc_msgSend(v14, "registerForRemoteUpdates:forCallUID:", v19, v20);

        }
        else
        {
          AXLogRTT();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_216E9C000, v15, OS_LOG_TYPE_INFO, "Not registering for remote updates", (uint8_t *)&buf, 2u);
          }

        }
        goto LABEL_18;
      }
    }
    -[RTTUIConversationControllerCoordinator registerForCallUpdates:].cold.1();
    __break(1u);
  }
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_216E9C000, v5, OS_LOG_TYPE_INFO, "Already registered to listen for updates from %@", (uint8_t *)&buf, 0xCu);
  }

LABEL_19:
}

void __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  v9 = *(id *)(a1 + 40);
  v10 = v6;
  v7 = v6;
  v8 = v5;
  AXPerformBlockAsynchronouslyOnMainThread();

}

void __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "conversationControllerForCallUUID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recentMessageControllerForCallUUID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceDidReceiveString:forUtterance:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v2;
    _os_log_impl(&dword_216E9C000, v4, OS_LOG_TYPE_INFO, "Got local update callback: %@ %@ for %@", (uint8_t *)&v7, 0x20u);
  }

  objc_msgSend(v2, "deviceDidReceiveString:forUtterance:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  v9 = *(id *)(a1 + 40);
  v10 = v6;
  v7 = v6;
  v8 = v5;
  AXPerformBlockAsynchronouslyOnMainThread();

}

void __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_2_53(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "conversationControllerForCallUUID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recentMessageControllerForCallUUID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v20 = 138413058;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v2;
    v26 = 2112;
    v27 = v3;
    _os_log_impl(&dword_216E9C000, v4, OS_LOG_TYPE_INFO, "Got remote update callback: %@ %@ for vc %@, %@", (uint8_t *)&v20, 0x2Au);
  }

  v7 = *(_QWORD *)(a1 + 64);
  switch(v7)
  {
    case 3:
      v15 = (id)objc_msgSend(v2, "addTranscriptionText:isNew:", *(_QWORD *)(a1 + 56), 0);
      v16 = *(_QWORD *)(a1 + 56);
      v17 = v3;
      v18 = 0;
LABEL_9:
      objc_msgSend(v17, "addTranscriptionText:isNew:", v16, v18);
      break;
    case 2:
      v19 = (id)objc_msgSend(v2, "addTranscriptionText:isNew:", *(_QWORD *)(a1 + 56), 1);
      v16 = *(_QWORD *)(a1 + 56);
      v17 = v3;
      v18 = 1;
      goto LABEL_9;
    case 1:
      v8 = (void *)MEMORY[0x24BE7CB78];
      objc_msgSend(v2, "currentContactPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "utteranceWithContactPath:andText:", v9, *(_QWORD *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v2, "addUtterance:", v10);

      v12 = (void *)MEMORY[0x24BE7CB78];
      objc_msgSend(v3, "currentContactPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "utteranceWithContactPath:andText:", v13, *(_QWORD *)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addUtterance:", v14);

      break;
  }

}

void __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_55(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = a2;
  v8 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v9 = *(id *)(a1 + 40);
    v10 = v7;
    v11 = v8;
    AXPerformBlockAsynchronouslyOnMainThread();

  }
}

void __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_2_56(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "conversationControllerForCallUUID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v7 = 138412802;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v2;
    _os_log_impl(&dword_216E9C000, v3, OS_LOG_TYPE_INFO, "Got remote update callback: %@ %@ for vc %@", (uint8_t *)&v7, 0x20u);
  }

  v6 = (id)objc_msgSend(v2, "addTranscriptionText:isNew:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64) == 2);
}

void __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_57(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  v9 = *(id *)(a1 + 40);
  v10 = v6;
  v7 = v6;
  v8 = v5;
  AXPerformBlockAsynchronouslyOnMainThread();

}

void __65__RTTUIConversationControllerCoordinator_registerForCallUpdates___block_invoke_2_58(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "conversationControllerForCallUUID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 64);
  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 48);
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v2;
      _os_log_impl(&dword_216E9C000, v4, OS_LOG_TYPE_INFO, "Adding service update %@ for vc: %@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(v2, "addServiceCellWithUpdate:options:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v2;
      _os_log_impl(&dword_216E9C000, v4, OS_LOG_TYPE_INFO, "Removing service update %@ for vc: %@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(v2, "removeServiceCellWithUpdate:", *(_QWORD *)(a1 + 48));
  }

}

- (BOOL)realtimeTextDidChange:(id)a3 forUtterance:(id)a4 lastRowPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  void *v17;
  void *v18;
  void *v19;
  RTTUtterance *v20;
  RTTUtterance *inProgressRealTimeUtterance;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *utteranceRequestQueue;
  id v33;
  void *v34;
  void *v35;
  _QWORD block[5];
  id v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  __int128 *p_buf;
  uint8_t v47[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int128 buf;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "call");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSLock tryLock](self->_realtimeSendLock, "tryLock");
  if (v11)
  {
    if (objc_msgSend(v9, "isMe") && (objc_msgSend(v9, "hasTimedOut") & 1) == 0)
    {
      objc_msgSend(v9, "text");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textViewUtterance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateText:", v18);
      objc_msgSend(v35, "callUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTTUIConversationControllerCoordinator recentMessageControllerForCallUUID:](self, "recentMessageControllerForCallUUID:", v19);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "didSendString:", v18);
      objc_storeStrong((id *)&self->_inProgressRealTimeIndexPath, a5);
      v20 = (RTTUtterance *)objc_msgSend(v9, "copy");
      inProgressRealTimeUtterance = self->_inProgressRealTimeUtterance;
      self->_inProgressRealTimeUtterance = v20;

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v52 = 0x2020000000;
      v53 = 0x7FFFFFFFFFFFFFFFLL;
      AXLogRTT();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v47 = 138740227;
        v48 = v17;
        v49 = 2117;
        v50 = v18;
        _os_log_impl(&dword_216E9C000, v22, OS_LOG_TYPE_INFO, "KNOWN |%{sensitive}@| NEW |%{sensitive}@|", v47, 0x16u);
      }

      v23 = objc_msgSend(v17, "length");
      v24 = MEMORY[0x24BDAC760];
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __89__RTTUIConversationControllerCoordinator_realtimeTextDidChange_forUtterance_lastRowPath___block_invoke;
      v44[3] = &unk_24D6579D0;
      v25 = v18;
      v45 = v25;
      p_buf = &buf;
      objc_msgSend(v17, "enumerateSubstringsInRange:options:usingBlock:", 0, v23, 2, v44);
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24) == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v25, "substringFromIndex:", objc_msgSend(v17, "length"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "appendString:", v27);
      }
      else
      {
        v28 = objc_msgSend(v17, "length");
        v29 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
        v30 = v28 - v29;
        if (v28 != v29)
        {
          do
          {
            objc_msgSend(v26, "appendFormat:", CFSTR("%c"), 8);
            --v30;
          }
          while (v30);
          v28 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
        }
        objc_msgSend(v25, "substringFromIndex:", v28);
        v31 = objc_claimAutoreleasedReturnValue();
        v24 = MEMORY[0x24BDAC760];
        v27 = (void *)v31;
        objc_msgSend(v26, "appendString:", v31);
      }

      utteranceRequestQueue = self->_utteranceRequestQueue;
      v40[0] = v24;
      v40[1] = 3221225472;
      v40[2] = __89__RTTUIConversationControllerCoordinator_realtimeTextDidChange_forUtterance_lastRowPath___block_invoke_64;
      v40[3] = &unk_24D6578E0;
      v40[4] = self;
      v33 = v26;
      v41 = v33;
      v42 = v10;
      v43 = v35;
      dispatch_async(utteranceRequestQueue, v40);
      if (!objc_msgSend(v33, "length"))
        -[NSLock unlock](self->_realtimeSendLock, "unlock");

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      AXLogRTT();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_216E9C000, v12, OS_LOG_TYPE_INFO, "Nothing to send. Releasing lock", (uint8_t *)&buf, 2u);
      }

      -[NSLock unlock](self->_realtimeSendLock, "unlock");
    }
  }
  else
  {
    AXLogRTT();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "textViewUtterance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_216E9C000, v13, OS_LOG_TYPE_INFO, "Collision, trying again |%@|", (uint8_t *)&buf, 0xCu);

    }
    v15 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __89__RTTUIConversationControllerCoordinator_realtimeTextDidChange_forUtterance_lastRowPath___block_invoke_65;
    block[3] = &unk_24D6578E0;
    block[4] = self;
    v37 = v8;
    v38 = v9;
    v39 = v10;
    dispatch_after(v15, MEMORY[0x24BDAC9B8], block);

  }
  return v11;
}

void __89__RTTUIConversationControllerCoordinator_realtimeTextDidChange_forUtterance_lastRowPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  int v19;
  _BYTE v20[10];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  if (a3 + a4 > (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length")
    || (objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "caseInsensitiveCompare:", v11),
        v12,
        v13))
  {
    v14 = objc_msgSend(*(id *)(a1 + 32), "length");
    AXLogRTT();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (a3 + a4 <= v14)
    {
      if (v16)
      {
        objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412546;
        *(_QWORD *)v20 = v18;
        *(_WORD *)&v20[8] = 2112;
        v21 = v11;
        _os_log_impl(&dword_216E9C000, v15, OS_LOG_TYPE_INFO, "NOT EQUAL |%@| = |%@|", (uint8_t *)&v19, 0x16u);

      }
    }
    else if (v16)
    {
      v17 = objc_msgSend(*(id *)(a1 + 32), "length");
      v19 = 67109376;
      *(_DWORD *)v20 = a3;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = v17;
      _os_log_impl(&dword_216E9C000, v15, OS_LOG_TYPE_INFO, "NOT EQUAL %d, %d", (uint8_t *)&v19, 0xEu);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a7 = 1;
  }

}

uint64_t __89__RTTUIConversationControllerCoordinator_realtimeTextDidChange_forUtterance_lastRowPath___block_invoke_64(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendNewUtteranceString:atIndex:forCellPath:call:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __89__RTTUIConversationControllerCoordinator_realtimeTextDidChange_forUtterance_lastRowPath___block_invoke_65(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "realtimeTextDidChange:forUtterance:lastRowPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_sendNewUtteranceString:(id)a3 atIndex:(unint64_t)a4 forCellPath:(id)a5 call:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  RTTUIConversationControllerCoordinator *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  AXLogRTT();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v10;
    v31 = 1024;
    v32 = a4;
    v33 = 2112;
    v34 = v11;
    _os_log_impl(&dword_216E9C000, v13, OS_LOG_TYPE_INFO, "_sending new utterance: %@ at index: %d for path: %@", buf, 0x1Cu);
  }

  v14 = objc_msgSend(v10, "length");
  if (v14 > a4)
  {
    v15 = v14;
    do
    {
      -[RTTUIConversationControllerCoordinator utteranceBuffer](self, "utteranceBuffer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTTUtteranceRequest utteranceRequestWithIndex:forString:inCellPath:call:](RTTUtteranceRequest, "utteranceRequestWithIndex:forString:inCellPath:call:", a4, v10, v11, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

      v18 = objc_msgSend(v10, "rangeOfComposedCharacterSequencesForRange:", a4, 1);
      a4 = v18 + v19;
    }
    while (v18 + v19 < v15);
  }
  if (+[RTTUIUtilities ttyShouldBeRealtimeForCall:](RTTUIUtilities, "ttyShouldBeRealtimeForCall:", v12))
  {
    -[NSLock unlock](self->_realtimeSendLock, "unlock");
  }
  else
  {
    AXLogRTT();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E9C000, v20, OS_LOG_TYPE_INFO, "Sending trailing space", buf, 2u);
    }

    -[RTTUIConversationControllerCoordinator utteranceBuffer](self, "utteranceBuffer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTTUtteranceRequest utteranceRequestWithIndex:forString:inCellPath:call:](RTTUtteranceRequest, "utteranceRequestWithIndex:forString:inCellPath:call:", 0, CFSTR(" "), 0, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v22);

    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __91__RTTUIConversationControllerCoordinator__sendNewUtteranceString_atIndex_forCellPath_call___block_invoke;
    v26 = &unk_24D6579F8;
    v27 = self;
    v28 = v11;
    dispatch_async(MEMORY[0x24BDAC9B8], &v23);

  }
  if (!-[RTTUIConversationControllerCoordinator processingUtteranceBuffer](self, "processingUtteranceBuffer", v23, v24, v25, v26, v27))-[RTTUIConversationControllerCoordinator processUtteranceQueue](self, "processUtteranceQueue");

}

void __91__RTTUIConversationControllerCoordinator__sendNewUtteranceString_atIndex_forCellPath_call___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "conversationControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v16;
    *(_QWORD *)&v4 = 138412546;
    v14 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "utteranceCellAtIndexPath:", *(_QWORD *)(a1 + 40), v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        AXLogRTT();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v14;
          v20 = v8;
          v21 = 2112;
          v22 = v9;
          _os_log_impl(&dword_216E9C000, v10, OS_LOG_TYPE_INFO, "Updated controller with text: %@ -> %@", buf, 0x16u);
        }

        objc_msgSend(v9, "utterance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAppendingString:", CFSTR(" "));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateText:", v13);

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v5);
  }

}

- (void)processUtteranceQueue
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  int v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  int64_t v30;
  dispatch_time_t v31;
  NSObject *utteranceRequestQueue;
  RTTUtterance *inProgressRealTimeUtterance;
  NSIndexPath *inProgressRealTimeIndexPath;
  RTTUtterance *v35;
  NSIndexPath *v36;
  _QWORD v37[5];
  _QWORD block[5];
  id v39;
  uint8_t buf[4];
  const __CFString *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[RTTUIConversationControllerCoordinator utteranceBuffer](self, "utteranceBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[NSMutableArray ax_removeObjectsFromArrayUsingBlock:](self->_utteranceBuffer, "ax_removeObjectsFromArrayUsingBlock:", &__block_literal_global);
  -[RTTUIConversationControllerCoordinator utteranceBuffer](self, "utteranceBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 != v6)
  {
    AXLogRTT();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v41) = v4 - v6;
      _os_log_impl(&dword_216E9C000, v7, OS_LOG_TYPE_INFO, "Discarded %d utterance requests from disconnected calls", buf, 8u);
    }

  }
  if (!v6)
  {
    inProgressRealTimeUtterance = self->_inProgressRealTimeUtterance;
    self->_inProgressRealTimeUtterance = 0;

    inProgressRealTimeIndexPath = self->_inProgressRealTimeIndexPath;
    self->_inProgressRealTimeIndexPath = 0;

    -[RTTUIConversationControllerCoordinator setProcessingUtteranceBuffer:](self, "setProcessingUtteranceBuffer:", 0);
    return;
  }
  -[RTTUIConversationControllerCoordinator setProcessingUtteranceBuffer:](self, "setProcessingUtteranceBuffer:", 1);
  -[RTTUIConversationControllerCoordinator utteranceBuffer](self, "utteranceBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rangeOfComposedCharacterSequencesForRange:", objc_msgSend(v9, "index"), 1);
  v13 = v12;

  objc_msgSend(v9, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "substringWithRange:", v11, v13);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  AXLogRTT();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = -[__CFString characterAtIndex:](v15, "characterAtIndex:", 0);
    v18 = CFSTR("BACKSPACE");
    if (v17 != 8)
      v18 = v15;
    *(_DWORD *)buf = 138412546;
    v41 = v18;
    v42 = 2112;
    v43 = v9;
    _os_log_impl(&dword_216E9C000, v16, OS_LOG_TYPE_INFO, "Sending %@ - %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "call");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "callUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendString:forCallUID:", v15, v21);

  v22 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__RTTUIConversationControllerCoordinator_processUtteranceQueue__block_invoke_72;
  block[3] = &unk_24D6579F8;
  block[4] = self;
  v23 = v9;
  v39 = v23;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[RTTUIConversationControllerCoordinator utteranceBuffer](self, "utteranceBuffer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeObject:", v23);

  -[RTTUIConversationControllerCoordinator utteranceBuffer](self, "utteranceBuffer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "count"))
  {
    objc_msgSend(v23, "call");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "status");

    if (v27 == 1)
    {
      objc_msgSend(v23, "call");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isTTY");

      if (v29)
        v30 = 200000000;
      else
        v30 = 50000000;
      v31 = dispatch_time(0, v30);
      utteranceRequestQueue = self->_utteranceRequestQueue;
      v37[0] = v22;
      v37[1] = 3221225472;
      v37[2] = __63__RTTUIConversationControllerCoordinator_processUtteranceQueue__block_invoke_73;
      v37[3] = &unk_24D657A60;
      v37[4] = self;
      dispatch_after(v31, utteranceRequestQueue, v37);
      goto LABEL_19;
    }
  }
  else
  {

  }
  v35 = self->_inProgressRealTimeUtterance;
  self->_inProgressRealTimeUtterance = 0;

  v36 = self->_inProgressRealTimeIndexPath;
  self->_inProgressRealTimeIndexPath = 0;

  -[RTTUIConversationControllerCoordinator setProcessingUtteranceBuffer:](self, "setProcessingUtteranceBuffer:", 0);
LABEL_19:

}

BOOL __63__RTTUIConversationControllerCoordinator_processUtteranceQueue__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "call");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status") == 6;

  return v3;
}

void __63__RTTUIConversationControllerCoordinator_processUtteranceQueue__block_invoke_72(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "conversationControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v17;
    *(_QWORD *)&v4 = 134218499;
    v15 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "cellIndexPath", v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "utteranceCellAtIndexPath:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        AXLogRTT();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "utterance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "text");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(*(id *)(a1 + 40), "index");
          *(_DWORD *)buf = v15;
          v21 = v8;
          v22 = 2117;
          v23 = v13;
          v24 = 1024;
          v25 = v14;
          _os_log_impl(&dword_216E9C000, v11, OS_LOG_TYPE_INFO, "Process utterance queue: %p for cell %{sensitive}@ with index: %d", buf, 0x1Cu);

        }
        objc_msgSend(v10, "setSendProgressIndex:", objc_msgSend(*(id *)(a1 + 40), "index"));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v5);
  }

}

uint64_t __63__RTTUIConversationControllerCoordinator_processUtteranceQueue__block_invoke_73(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processUtteranceQueue");
}

- (void)processCallScreeningTranscription:(id)a3 transcriptionID:(id)a4 callUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", self->_latestCallScreeningTranscriptionID) ^ 1;
  v13 = (void *)MEMORY[0x24BDD17C8];
  ttyLocString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_latestCallScreeningTranscriptionID, v11);
  AXLogRTT();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v17;
    _os_log_impl(&dword_216E9C000, v16, OS_LOG_TYPE_INFO, "Received call screening RTT transcript: %@ (id %@), callID: %@, isNew: %@", buf, 0x2Au);

  }
  v20 = v10;
  v18 = v15;
  v19 = v10;
  AXPerformBlockAsynchronouslyOnMainThread();

}

void __101__RTTUIConversationControllerCoordinator_processCallScreeningTranscription_transcriptionID_callUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "conversationControllerForCallUUID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "addTranscriptionText:isNew:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));

  objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendTranscription:forCallUUID:isNew:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

}

- (void)hearingServerDidDie:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E9C000, v4, OS_LOG_TYPE_INFO, "heard died, sending it the up-to-date conversations to save to database", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__RTTUIConversationControllerCoordinator_hearingServerDidDie___block_invoke;
  block[3] = &unk_24D657A60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __62__RTTUIConversationControllerCoordinator_hearingServerDidDie___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "conversationControllers", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v5);
        objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "conversation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sendConversationUpdate:", v8);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

}

- (NSIndexPath)inProgressRealTimeIndexPath
{
  return self->_inProgressRealTimeIndexPath;
}

- (RTTUtterance)inProgressRealTimeUtterance
{
  return self->_inProgressRealTimeUtterance;
}

- (NSMutableArray)utteranceBuffer
{
  return self->_utteranceBuffer;
}

- (void)setUtteranceBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_utteranceBuffer, a3);
}

- (BOOL)processingUtteranceBuffer
{
  return self->_processingUtteranceBuffer;
}

- (void)setProcessingUtteranceBuffer:(BOOL)a3
{
  self->_processingUtteranceBuffer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceBuffer, 0);
  objc_storeStrong((id *)&self->_latestCallScreeningTranscriptionID, 0);
  objc_storeStrong((id *)&self->_registeredCalls, 0);
  objc_storeStrong((id *)&self->_inProgressRealTimeUtterance, 0);
  objc_storeStrong((id *)&self->_inProgressRealTimeIndexPath, 0);
  objc_storeStrong((id *)&self->_realtimeSendLock, 0);
  objc_storeStrong((id *)&self->_recentMessageControllers, 0);
  objc_storeStrong((id *)&self->_conversationControllers, 0);
  objc_storeStrong((id *)&self->_utteranceRequestQueue, 0);
}

- (void)conversationControllerForCallUUID:.cold.1()
{
  __assert_rtn("-[RTTUIConversationControllerCoordinator conversationControllerForCallUUID:]", "RTTUIConversationCoordinator.m", 171, "NSThread.isMainThread");
}

- (void)recentMessageControllerForCallUUID:.cold.1()
{
  __assert_rtn("-[RTTUIConversationControllerCoordinator recentMessageControllerForCallUUID:]", "RTTUIConversationCoordinator.m", 181, "NSThread.isMainThread");
}

- (uint64_t)registerForCallUpdates:.cold.1()
{
  NSObject *v0;

  dlerror();
  v0 = abort_report_np();
  return -[RTTUIConversationViewController isCurrentCallReceivingOnHold].cold.1(v0);
}

@end
