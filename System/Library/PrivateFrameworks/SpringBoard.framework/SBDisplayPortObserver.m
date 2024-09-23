@implementation SBDisplayPortObserver

- (SBDisplayPortObserver)init
{
  SBDisplayPortObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableDictionary *transportNotifiers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBDisplayPortObserver;
  v2 = -[SBDisplayPortObserver init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("SBDisplayPortObserver", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_ioNotificationPort = 0;
    v2->_ioServiceAddedIterator = 0;
    v2->_matchingNotificationsStarted = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    transportNotifiers = v2->_transportNotifiers;
    v2->_transportNotifiers = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogVideoOut();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[SBDisplayPortObserver] Deallocating %{public}@...", buf, 0xCu);

  }
  -[SBDisplayPortObserver stopMatchingNotifications](self, "stopMatchingNotifications");
  v6.receiver = self;
  v6.super_class = (Class)SBDisplayPortObserver;
  -[SBDisplayPortObserver dealloc](&v6, sel_dealloc);
}

- (BOOL)startMatchingNotifications
{
  NSObject *v3;
  NSObject *v4;
  char v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  SBLogVideoOut();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[SBDisplayPortObserver] Adding transport matching notifications...", buf, 2u);
  }

  -[SBDisplayPortObserver queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SBDisplayPortObserver_startMatchingNotifications__block_invoke;
  v7[3] = &unk_1E8E9E868;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(v4, v7);

  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __51__SBDisplayPortObserver_startMatchingNotifications__block_invoke(uint64_t a1)
{
  IONotificationPort *v2;
  NSObject *v3;
  CFMutableDictionaryRef v4;
  CFMutableDictionaryRef v5;
  IONotificationPort *v6;
  const __CFDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (objc_msgSend(*(id *)(a1 + 32), "matchingNotificationsStarted"))
    objc_msgSend(*(id *)(a1 + 32), "stopMatchingNotifications");
  objc_msgSend(*(id *)(a1 + 32), "setIONotificationPort:", IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]));
  v2 = (IONotificationPort *)objc_msgSend(*(id *)(a1 + 32), "ioNotificationPort");
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  IONotificationPortSetDispatchQueue(v2, v3);

  v4 = IOServiceMatching("IOPortTransportState");
  -[__CFDictionary setObject:forKey:](v4, "setObject:forKey:", &unk_1E91D25A8, CFSTR("IOPropertyMatch"));
  v5 = IOServiceMatching("IOPort");
  -[__CFDictionary setObject:forKey:](v5, "setObject:forKey:", &unk_1E91D25D0, CFSTR("IOPropertyMatch"));
  -[__CFDictionary setObject:forKey:](v4, "setObject:forKey:", v5, CFSTR("IOParentMatch"));
  NSLog(CFSTR("matchingDict: %@"), v4);
  v6 = (IONotificationPort *)objc_msgSend(*(id *)(a1 + 32), "ioNotificationPort");
  v7 = v4;
  v8 = IOServiceAddMatchingNotification(v6, "IOServiceMatched", v7, (IOServiceMatchingCallback)_serviceAdded, *(void **)(a1 + 32), (io_iterator_t *)(*(_QWORD *)(a1 + 32) + 12));
  if ((_DWORD)v8)
  {
    v9 = v8;
    SBLogVideoOut();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __51__SBDisplayPortObserver_startMatchingNotifications__block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
  else
  {
    _serviceAdded(*(void **)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "ioServiceAddedIterator"));
    objc_msgSend(*(id *)(a1 + 32), "setMatchingNotificationsStarted:", 1);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)stopMatchingNotifications
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  SBLogVideoOut();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[SBDisplayPortObserver] Removing transport matching notifications...", buf, 2u);
  }

  -[SBDisplayPortObserver queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SBDisplayPortObserver_stopMatchingNotifications__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_sync(v4, block);

}

uint64_t __50__SBDisplayPortObserver_stopMatchingNotifications__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  io_object_t v4;
  IONotificationPort *v5;

  objc_msgSend(*(id *)(a1 + 32), "transportNotifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_7);

  objc_msgSend(*(id *)(a1 + 32), "transportNotifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4 = objc_msgSend(*(id *)(a1 + 32), "ioServiceAddedIterator");
  if (v4)
    IOObjectRelease(v4);
  v5 = (IONotificationPort *)objc_msgSend(*(id *)(a1 + 32), "ioNotificationPort");
  if (v5)
    IONotificationPortDestroy(v5);
  return objc_msgSend(*(id *)(a1 + 32), "setMatchingNotificationsStarted:", 0);
}

void __50__SBDisplayPortObserver_stopMatchingNotifications__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  io_object_t v5;
  id v6;

  v6 = a2;
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(v4, "unsignedIntValue");
      if (v5)
        IOObjectRelease(v5);
    }
  }

}

- (BOOL)isDisplayPortConnected
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SBDisplayPortObserver transportNotifiers](self, "transportNotifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)_handleServiceAdded:(unsigned int)a3
{
  uint64_t v3;
  uint64_t RegistryEntryID;
  uint64_t v6;
  NSObject *CFProperty;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t entryID;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v3 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x1E0C80C00];
  entryID = 0;
  RegistryEntryID = IORegistryEntryGetRegistryEntryID(a3, &entryID);
  if ((_DWORD)RegistryEntryID)
  {
    v6 = RegistryEntryID;
    SBLogVideoOut();
    CFProperty = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(CFProperty, OS_LOG_TYPE_ERROR))
      -[SBDisplayPortObserver _handleServiceAdded:].cold.3(v6, CFProperty, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    -[SBDisplayPortObserver transportNotifiers](self, "transportNotifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", entryID);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      SBLogVideoOut();
      CFProperty = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(CFProperty, OS_LOG_TYPE_DEBUG))
        -[SBDisplayPortObserver _handleServiceAdded:].cold.2((uint64_t *)&entryID, CFProperty);
    }
    else
    {
      CFProperty = IORegistryEntryCreateCFProperty(v3, CFSTR("TransportDescription"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      SBLogVideoOut();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v21 = entryID;
        _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[SBDisplayPortObserver] Adding transport interest notifications... (registryEntryID: %llu)", buf, 0xCu);
      }

      SBLogVideoOut();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[SBDisplayPortObserver _handleServiceAdded:].cold.1((uint64_t)CFProperty, (uint64_t *)&entryID, v18);

      -[SBDisplayPortObserver _addTransportNotificationForService:andRegistryEntryID:](self, "_addTransportNotificationForService:andRegistryEntryID:", v3, entryID);
    }
  }

}

- (void)_handleNotificationForService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5
{
  uint64_t RegistryEntryID;
  uint64_t v9;
  NSObject *CFProperty;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  NSObject *v21;
  uint64_t entryID;
  uint8_t buf[4];
  NSObject *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  entryID = 0;
  RegistryEntryID = IORegistryEntryGetRegistryEntryID(a3, &entryID);
  if ((_DWORD)RegistryEntryID)
  {
    v9 = RegistryEntryID;
    SBLogVideoOut();
    CFProperty = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(CFProperty, OS_LOG_TYPE_ERROR))
      -[SBDisplayPortObserver _handleServiceAdded:].cold.3(v9, CFProperty, v11, v12, v13, v14, v15, v16);
    goto LABEL_15;
  }
  CFProperty = IORegistryEntryCreateCFProperty(a3, CFSTR("TransportDescription"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (a4 != -536870896)
  {
    if (a4 == -536870608)
    {
      SBLogVideoOut();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = CFProperty;
        v25 = 2048;
        v26 = entryID;
        v18 = "[SBDisplayPortObserver] messageType: kIOMessageServicePropertyChange, transportDescription: %@, registryEntryID: %llu";
        v19 = v17;
        v20 = 22;
LABEL_13:
        _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
    else
    {
      SBLogVideoOut();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = a4;
        v18 = "[SBDisplayPortObserver] messageType: %u";
        v19 = v17;
        v20 = 8;
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }
  SBLogVideoOut();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = CFProperty;
    v25 = 2048;
    v26 = entryID;
    _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "[SBDisplayPortObserver] messageType: kIOMessageServiceIsTerminated, transportDescription: %@, registryEntryID: %llu)", buf, 0x16u);
  }

  -[SBDisplayPortObserver _removeTransportNotificationForRegistryEntryID:](self, "_removeTransportNotificationForRegistryEntryID:", entryID);
LABEL_15:

}

- (void)_addTransportNotificationForService:(unsigned int)a3 andRegistryEntryID:(unint64_t)a4
{
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  io_object_t notification;

  v7 = -[SBDisplayPortObserver isDisplayPortConnected](self, "isDisplayPortConnected");
  notification = 0;
  IOServiceAddInterestNotification(-[SBDisplayPortObserver ioNotificationPort](self, "ioNotificationPort"), a3, "IOGeneralInterest", (IOServiceInterestCallback)_serviceNotification, self, &notification);
  if (notification)
  {
    -[SBDisplayPortObserver transportNotifiers](self, "transportNotifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", notification);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v10);

    if (v7 != -[SBDisplayPortObserver isDisplayPortConnected](self, "isDisplayPortConnected"))
      -[SBDisplayPortObserver _notifyDelegate](self, "_notifyDelegate");
  }
}

- (void)_removeTransportNotificationForRegistryEntryID:(unint64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  io_object_t v10;
  id v11;

  v5 = -[SBDisplayPortObserver isDisplayPortConnected](self, "isDisplayPortConnected");
  -[SBDisplayPortObserver transportNotifiers](self, "transportNotifiers");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SBDisplayPortObserver transportNotifiers](self, "transportNotifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

    v10 = objc_msgSend(v7, "unsignedIntValue");
    if (v10)
      IOObjectRelease(v10);
    if (v5 != -[SBDisplayPortObserver isDisplayPortConnected](self, "isDisplayPortConnected"))
      -[SBDisplayPortObserver _notifyDelegate](self, "_notifyDelegate");
  }

}

- (void)_notifyDelegate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "displayPortObserver:connectionStateChanged:", self, -[SBDisplayPortObserver isDisplayPortConnected](self, "isDisplayPortConnected"));

}

- (SBDisplayPortObserverDelegate)delegate
{
  return (SBDisplayPortObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IONotificationPort)ioNotificationPort
{
  return self->_ioNotificationPort;
}

- (void)setIONotificationPort:(IONotificationPort *)a3
{
  self->_ioNotificationPort = a3;
}

- (unsigned)ioServiceAddedIterator
{
  return self->_ioServiceAddedIterator;
}

- (void)setIoServiceAddedIterator:(unsigned int)a3
{
  self->_ioServiceAddedIterator = a3;
}

- (BOOL)matchingNotificationsStarted
{
  return self->_matchingNotificationsStarted;
}

- (void)setMatchingNotificationsStarted:(BOOL)a3
{
  self->_matchingNotificationsStarted = a3;
}

- (NSMutableDictionary)transportNotifiers
{
  return self->_transportNotifiers;
}

- (void)setTransportNotifiers:(id)a3
{
  objc_storeStrong((id *)&self->_transportNotifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportNotifiers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__SBDisplayPortObserver_startMatchingNotifications__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1D0540000, a2, a3, "[SBDisplayPortObserver] IOServiceAddMatchingNotification failed: %08x", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_handleServiceAdded:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = v3;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "[SBDisplayPortObserver] Transport matched! (transportDescription: %@, registryEntryID: %llu)", (uint8_t *)&v4, 0x16u);
}

- (void)_handleServiceAdded:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "[SBDisplayPortObserver] Port object already exists for service, ignoring... (registryEntryID: %llu)", (uint8_t *)&v3, 0xCu);
}

- (void)_handleServiceAdded:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1D0540000, a2, a3, "[SBDisplayPortObserver] IORegistryEntryGetRegistryEntryID failed: %08x", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
