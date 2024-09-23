@implementation RMXPCNotifications

+ (RMXPCNotifications)sharedNotifier
{
  if (sharedNotifier_onceToken != -1)
    dispatch_once(&sharedNotifier_onceToken, &__block_literal_global_4_2);
  return (RMXPCNotifications *)(id)sharedNotifier_notifier;
}

void __36__RMXPCNotifications_sharedNotifier__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[RMXPCNotifications initPrivate]([RMXPCNotifications alloc], "initPrivate");
  v1 = (void *)sharedNotifier_notifier;
  sharedNotifier_notifier = (uint64_t)v0;

}

- (id)initPrivate
{
  RMXPCNotifications *v2;
  RMXPCNotifications *v3;
  uint64_t v4;
  NSMutableSet *pendingNotifications;
  uint64_t v6;
  NSMutableDictionary *notificationObservers;
  id v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *modificationQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RMXPCNotifications;
  v2 = -[RMXPCNotifications init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_registered = 0;
    v4 = objc_opt_new();
    pendingNotifications = v3->_pendingNotifications;
    v3->_pendingNotifications = (NSMutableSet *)v4;

    v6 = objc_opt_new();
    notificationObservers = v3->_notificationObservers;
    v3->_notificationObservers = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.remotemanagementd.xpcNotificationsQueue"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4), 0);
    modificationQueue = v3->_modificationQueue;
    v3->_modificationQueue = (OS_dispatch_queue *)v9;

  }
  return v3;
}

- (void)registerForEvents:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[RMXPCNotifications registered](self, "registered"))
  {
    +[RMLog xpcNotifications](RMLog, "xpcNotifications");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[RMXPCNotifications registerForEvents:].cold.1(v5);
  }
  else
  {
    -[RMXPCNotifications setRegistered:](self, "setRegistered:", 1);
    v5 = objc_opt_new();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "streamName", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((-[NSObject containsObject:](v5, "containsObject:", v11) & 1) == 0)
          {
            -[RMXPCNotifications _setupEventStreamHandlerForStream:](self, "_setupEventStreamHandlerForStream:", v11);
            -[NSObject addObject:](v5, "addObject:", v11);
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)hasObserverForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[RMXPCNotifications notificationObservers](self, "notificationObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

- (void)addObserverForEvent:(id)a3 observer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[RMXPCNotifications modificationQueue](self, "modificationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__RMXPCNotifications_addObserverForEvent_observer___block_invoke;
  v11[3] = &unk_24D967EE8;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __51__RMXPCNotifications_addObserverForEvent_observer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "notificationObservers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[RMLog xpcNotifications](RMLog, "xpcNotifications");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __51__RMXPCNotifications_addObserverForEvent_observer___block_invoke_cold_2();
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __51__RMXPCNotifications_addObserverForEvent_observer___block_invoke_cold_1();

      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(WeakRetained, "notificationObservers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v3);

      objc_msgSend(WeakRetained, "_addXPCEvent:", *(_QWORD *)(a1 + 32));
      objc_msgSend(WeakRetained, "pendingNotifications");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = objc_msgSend(v10, "containsObject:", v3);

      if (!(_DWORD)v9)
        goto LABEL_10;
      objc_msgSend(*(id *)(a1 + 32), "streamName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "notificationName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_didReceiveNotificationForStream:notificationName:", v11, v12);

      objc_msgSend(WeakRetained, "pendingNotifications");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v3);
    }

LABEL_10:
  }

}

- (void)removeObserverForEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[RMXPCNotifications modificationQueue](self, "modificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__RMXPCNotifications_removeObserverForEvent___block_invoke;
  block[3] = &unk_24D967F10;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__RMXPCNotifications_removeObserverForEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "notificationObservers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[RMLog xpcNotifications](RMLog, "xpcNotifications");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7)
        __45__RMXPCNotifications_removeObserverForEvent___block_invoke_cold_2();

      objc_msgSend(WeakRetained, "notificationObservers");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectForKey:](v6, "removeObjectForKey:", v3);
    }
    else if (v7)
    {
      __45__RMXPCNotifications_removeObserverForEvent___block_invoke_cold_1();
    }

    objc_msgSend(WeakRetained, "_removeXPCEvent:", *(_QWORD *)(a1 + 32));
  }

}

- (void)_setupEventStreamHandlerForStream:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  RMXPCNotifications *v12;

  v4 = a3;
  +[RMLog xpcNotifications](RMLog, "xpcNotifications");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[RMXPCNotifications _setupEventStreamHandlerForStream:].cold.1();

  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4);
  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__RMXPCNotifications__setupEventStreamHandlerForStream___block_invoke;
  v10[3] = &unk_24D967F38;
  v11 = v6;
  v12 = self;
  v9 = v6;
  xpc_set_event_stream_handler(v7, v8, v10);

}

void __56__RMXPCNotifications__setupEventStreamHandlerForStream___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  void *v3;
  NSObject *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF50]));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMLog xpcNotifications](RMLog, "xpcNotifications");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __56__RMXPCNotifications__setupEventStreamHandlerForStream___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  objc_msgSend(*(id *)(a1 + 40), "_didReceiveNotificationForStream:notificationName:", *(_QWORD *)(a1 + 32), v3);
}

- (void)_addXPCEvent:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)_CFXPCCreateXPCObjectFromCFObject();

  objc_msgSend(v3, "streamName");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "cStringUsingEncoding:", 4);
  objc_msgSend(v3, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "cStringUsingEncoding:", 4);
  xpc_set_event();

}

- (void)_removeXPCEvent:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "streamName");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "cStringUsingEncoding:", 4);
  objc_msgSend(v3, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "cStringUsingEncoding:", 4);
  xpc_set_event();

}

- (void)_didReceiveNotificationForStream:(id)a3 notificationName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[RMXPCNotifications modificationQueue](self, "modificationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke;
  v11[3] = &unk_24D967EE8;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    +[RMXPCEvent eventKeyForStream:notificationName:](RMXPCEvent, "eventKeyForStream:notificationName:", a1[4], a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "notificationObservers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[RMLog xpcNotifications](RMLog, "xpcNotifications");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7)
        __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke_cold_2();

      dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke_13;
      block[3] = &unk_24D967F60;
      v11 = v5;
      v12 = a1[4];
      v13 = a1[5];
      dispatch_async(v8, block);

      v9 = v11;
    }
    else
    {
      if (v7)
        __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke_cold_1();

      objc_msgSend(WeakRetained, "pendingNotifications");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v3);
    }

  }
}

uint64_t __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveNotificationForStream:notificationName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_waitForQueue:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[RMXPCNotifications modificationQueue](self, "modificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__RMXPCNotifications__waitForQueue___block_invoke;
  block[3] = &unk_24D967F88;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __36__RMXPCNotifications__waitForQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (NSMutableSet)pendingNotifications
{
  return self->_pendingNotifications;
}

- (void)setPendingNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_pendingNotifications, a3);
}

- (NSMutableDictionary)notificationObservers
{
  return self->_notificationObservers;
}

- (void)setNotificationObservers:(id)a3
{
  objc_storeStrong((id *)&self->_notificationObservers, a3);
}

- (OS_dispatch_queue)modificationQueue
{
  return self->_modificationQueue;
}

- (void)setModificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_modificationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationQueue, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_pendingNotifications, 0);
}

- (void)registerForEvents:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21885E000, log, OS_LOG_TYPE_FAULT, "Cannot register after registration has been done.", v1, 2u);
}

void __51__RMXPCNotifications_addObserverForEvent_observer___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "Adding observer for notification: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__RMXPCNotifications_addObserverForEvent_observer___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21885E000, v0, OS_LOG_TYPE_ERROR, "Only one observer can be registered for notification: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __45__RMXPCNotifications_removeObserverForEvent___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "No observer registered for notification: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __45__RMXPCNotifications_removeObserverForEvent___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "Removing observer for notification: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_setupEventStreamHandlerForStream:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "Adding handler for stream: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__RMXPCNotifications__setupEventStreamHandlerForStream___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_debug_impl(&dword_21885E000, log, OS_LOG_TYPE_DEBUG, "Received XPC event stream: %{public}@, event name: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "Notification has no observer: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __72__RMXPCNotifications__didReceiveNotificationForStream_notificationName___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "Dispatching notification to observer: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
