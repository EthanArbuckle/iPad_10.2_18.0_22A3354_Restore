@implementation SOSCoordinator

+ (SOSCoordinator)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SOSCoordinator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (SOSCoordinator *)(id)sharedInstance_inst;
}

void __32__SOSCoordinator_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_inst;
  sharedInstance_inst = (uint64_t)v1;

}

- (SOSCoordinator)init
{
  SOSCoordinator *v2;
  NSObject *v3;
  void *v4;
  IDSService *idsService;
  id v6;
  NSMutableArray *v7;
  NSMutableArray *processingEventUUIDs;
  dispatch_queue_t v9;
  OS_dispatch_queue *eventUUIDArrayQueue;
  dispatch_queue_t v11;
  OS_dispatch_queue *pendingMessagesQueue;
  NSMutableDictionary *v13;
  NSMutableDictionary *pendingMessagesById;
  NSMutableDictionary *v15;
  NSMutableDictionary *pendingMessageRetriesById;
  uint64_t v17;
  NSHashTable *observers;
  uint64_t v19;
  SOSCoreAnalyticsReporting *coreAnalyticsReporter;
  uint8_t v22[16];
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SOSCoordinator;
  v2 = -[SOSCoordinator init](&v23, sel_init);
  if (v2)
  {
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, init", v22, 2u);
    }

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.soscoordination"));
    objc_msgSend(v4, "addDelegate:queue:", v2, MEMORY[0x1E0C80D38]);
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v4;
    v6 = v4;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    processingEventUUIDs = v2->_processingEventUUIDs;
    v2->_processingEventUUIDs = v7;

    v9 = dispatch_queue_create("com.apple.private.coordination.eventUUIDArrayQueue", 0);
    eventUUIDArrayQueue = v2->_eventUUIDArrayQueue;
    v2->_eventUUIDArrayQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_create("com.apple.private.coordination.pendingMessagesQueue", 0);
    pendingMessagesQueue = v2->_pendingMessagesQueue;
    v2->_pendingMessagesQueue = (OS_dispatch_queue *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingMessagesById = v2->_pendingMessagesById;
    v2->_pendingMessagesById = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingMessageRetriesById = v2->_pendingMessageRetriesById;
    v2->_pendingMessageRetriesById = v15;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v17 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v17;

    +[SOSCoreAnalyticsReporter sharedInstance](SOSCoreAnalyticsReporter, "sharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    coreAnalyticsReporter = v2->_coreAnalyticsReporter;
    v2->_coreAnalyticsReporter = (SOSCoreAnalyticsReporting *)v19;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[IDSService removeDelegate:](self->_idsService, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)SOSCoordinator;
  -[SOSCoordinator dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SOSCoordinator observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SOSCoordinator observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (BOOL)shouldHandoffToPairedDevice:(int64_t)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;

  if (a3 == 7)
  {
    -[SOSCoordinator effectivePairedDevice](self, "effectivePairedDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      if ((objc_msgSend(v4, "isNearby") & 1) != 0)
      {
        v6 = 1;
LABEL_9:

        return v6;
      }
      v7 = 3;
    }
    else
    {
      v7 = 2;
    }
    -[SOSCoordinator reportHandoff:result:](self, "reportHandoff:result:", 7, v7);
    v6 = 0;
    goto LABEL_9;
  }
  -[SOSCoordinator reportHandoff:result:](self, "reportHandoff:result:", a3, 6);
  return 0;
}

- (BOOL)tryPushToPairedDeviceWithUUID:(id)a3 triggerMechanism:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  sos_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, New event, Trigger ID: %@", (uint8_t *)&v11, 0xCu);

  }
  v9 = -[SOSCoordinator processEventWithUUID:triggerMechanism:](self, "processEventWithUUID:triggerMechanism:", v6, a4);

  return v9;
}

- (BOOL)processEventWithUUID:(id)a3 triggerMechanism:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  OS_dispatch_semaphore *v10;
  OS_dispatch_semaphore *eventProcessingSemaphore;
  uint64_t v12;
  NSObject *eventUUIDArrayQueue;
  id v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  NSObject *v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  SOSCoordinator *v25;
  id v26;
  uint8_t buf[16];
  _QWORD block[5];
  id v29;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  SOSStringForSOSTriggerMechanism(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("SOSCoordinationTriggerKey"));

  objc_msgSend(v7, "setObject:forKey:", CFSTR("SOSCoordinationMessageTypeHandoffSOS"), CFSTR("SOSCoordinationMessageTypeKey"));
  objc_msgSend(v6, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("SOSEventUUIDKey"));

  v10 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  eventProcessingSemaphore = self->_eventProcessingSemaphore;
  self->_eventProcessingSemaphore = v10;

  if (-[SOSCoordinator sendUrgentMessageToPairedDevice:](self, "sendUrgentMessageToPairedDevice:", v7))
  {
    v12 = MEMORY[0x1E0C809B0];
    eventUUIDArrayQueue = self->_eventUUIDArrayQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__SOSCoordinator_processEventWithUUID_triggerMechanism___block_invoke;
    block[3] = &unk_1E5F76A08;
    block[4] = self;
    v14 = v6;
    v29 = v14;
    dispatch_sync(eventUUIDArrayQueue, block);
    v15 = self->_eventProcessingSemaphore;
    v16 = dispatch_time(0, 8000000000);
    if (dispatch_semaphore_wait(v15, v16))
    {
      sos_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF4DC000, v17, OS_LOG_TYPE_DEFAULT, "SOSCoordinator,handoff unsuccessful, timed out before received ack", buf, 2u);
      }

      v18 = self->_eventUUIDArrayQueue;
      v21 = v12;
      v22 = 3221225472;
      v23 = __56__SOSCoordinator_processEventWithUUID_triggerMechanism___block_invoke_222;
      v24 = &unk_1E5F76A08;
      v25 = self;
      v26 = v14;
      dispatch_sync(v18, &v21);
      -[SOSCoordinator reportHandoff:result:](self, "reportHandoff:result:", a4, 5, v21, v22, v23, v24, v25);

    }
    else
    {
      if (self->_ackSuccess)
      {
        v19 = 1;
        -[SOSCoordinator reportHandoff:result:](self, "reportHandoff:result:", a4, 1);
        goto LABEL_10;
      }
      -[SOSCoordinator reportHandoff:result:](self, "reportHandoff:result:", a4, 4);
    }
    v19 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v19 = 0;
LABEL_11:

  return v19;
}

void __56__SOSCoordinator_processEventWithUUID_triggerMechanism___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

void __56__SOSCoordinator_processEventWithUUID_triggerMechanism___block_invoke_222(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObject:", v2);

}

- (void)syncProgressionWithPairedDevice:(int64_t)a3 sosStatus:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  SOSMessagingStatus *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[SOSCoordinator isPairedDeviceNearby](self, "isPairedDeviceNearby"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", CFSTR("SOSMessageTypeProgressionSync"), CFSTR("SOSCoordinationMessageTypeKey"));
    SOSStringForSOSProgression(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("SOSProgressionKey"));

    v9 = -[SOSMessagingStatus initWithSOSStatus:]([SOSMessagingStatus alloc], "initWithSOSStatus:", v6);
    sos_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[SOSMessagingStatus description](v9, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1AF4DC000, v10, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, sending messaging status %@", (uint8_t *)&v14, 0xCu);

    }
    if (v9)
    {
      -[SOSMessagingStatus data](v9, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v7, "setObject:forKey:", v12, CFSTR("SOSStatusKey"));

      -[SOSCoordinator sendUrgentMessageToPairedDevice:](self, "sendUrgentMessageToPairedDevice:", v7);
    }
    else
    {
      sos_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SOSCoordinator syncProgressionWithPairedDevice:sosStatus:].cold.1();

    }
  }
  else
  {
    sos_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, no paired device, not syncing SOSProgression", (uint8_t *)&v14, 2u);
    }
  }

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v7;
  void *v8;
  int64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  v7 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SOSCoordinationMessageTypeKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SOSCoordinator SOSCoordinationMessageTypeForString:](self, "SOSCoordinationMessageTypeForString:", v8);

  switch(v9)
  {
    case 0:
      sos_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1AF4DC000, v10, OS_LOG_TYPE_DEFAULT, "SOSCoordinator,cannot handle SOSMessageTypeUnspecified!", v11, 2u);
      }

      break;
    case 1:
      -[SOSCoordinator handleSOSMessageTypeHandoffSOS:](self, "handleSOSMessageTypeHandoffSOS:", v7);
      break;
    case 2:
      -[SOSCoordinator handleSOSMessageTypeHandoffSOSAck:](self, "handleSOSMessageTypeHandoffSOSAck:", v7);
      break;
    case 4:
      -[SOSCoordinator handleSOSMessageTypeProgressionSync:](self, "handleSOSMessageTypeProgressionSync:", v7);
      break;
    default:
      break;
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  void *v23;
  NSObject *pendingMessagesQueue;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  sos_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SOSCoordinator service:account:identifier:didSendWithSuccess:error:].cold.2((uint64_t)v14, (uint64_t)v15, v17);
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v14;
    _os_log_impl(&dword_1AF4DC000, v17, OS_LOG_TYPE_DEFAULT, "IDS didSendWithSuccess identifier=%@ Success!", buf, 0xCu);
  }

  if (v14)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingMessagesById, "objectForKeyedSubscript:", v14);
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingMessageRetriesById, "objectForKeyedSubscript:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!a6
      && objc_msgSend(v19, "integerValue") >= 1
      && -[SOSCoordinator shouldRetryMessage:](self, "shouldRetryMessage:", v18))
    {
      sos_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_msgSend(v20, "integerValue");
        *(_DWORD *)buf = 138412546;
        v28 = v14;
        v29 = 1024;
        v30 = v22;
        _os_log_impl(&dword_1AF4DC000, v21, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, retrying failed message with id %@ and %d retries", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "integerValue") - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOSCoordinator _sendUrgentMessageToPairedDevice:retries:](self, "_sendUrgentMessageToPairedDevice:retries:", v18, v23);

    }
    pendingMessagesQueue = self->_pendingMessagesQueue;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __70__SOSCoordinator_service_account_identifier_didSendWithSuccess_error___block_invoke;
    v25[3] = &unk_1E5F76A08;
    v25[4] = self;
    v26 = v14;
    dispatch_sync(pendingMessagesQueue, v25);

  }
  else
  {
    sos_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SOSCoordinator service:account:identifier:didSendWithSuccess:error:].cold.1();
  }

}

uint64_t __70__SOSCoordinator_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isIncomingMessageValidSOSHandoff:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint8_t v8[16];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SOSCoordinationTriggerKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SOSStringForSOSTriggerMechanism(7uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    sos_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSCoordinator,received SOS handoff message with unsupported SOSTriggerMechanism", v8, 2u);
    }

  }
  return v5;
}

- (BOOL)isIncomingMessageValidHandoffAck:(id)a3
{
  id v4;
  NSObject *eventUUIDArrayQueue;
  id v6;
  _QWORD block[4];
  id v9;
  SOSCoordinator *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  eventUUIDArrayQueue = self->_eventUUIDArrayQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SOSCoordinator_isIncomingMessageValidHandoffAck___block_invoke;
  block[3] = &unk_1E5F76AB8;
  v10 = self;
  v11 = &v12;
  v9 = v4;
  v6 = v4;
  dispatch_sync(eventUUIDArrayQueue, block);
  LOBYTE(eventUUIDArrayQueue) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)eventUUIDArrayQueue;
}

void __51__SOSCoordinator_isIncomingMessageValidHandoffAck___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SOSEventUUIDKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__SOSCoordinator_isIncomingMessageValidHandoffAck___block_invoke_cold_1();
    goto LABEL_8;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "containsObject:", v2) & 1) == 0)
  {
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSCoordinator,unrecognized event UUID", v5, 2u);
    }
LABEL_8:

    v3 = 0;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", v2);
  v3 = 1;
LABEL_9:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;

}

- (void)handleSOSMessageTypeHandoffSOSAck:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, handleSOSMessageTypeHandoffSOSAck", v7, 2u);
  }

  if (-[SOSCoordinator isIncomingMessageValidHandoffAck:](self, "isIncomingMessageValidHandoffAck:", v4))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SOSHandoffAckSuccessKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_ackSuccess = objc_msgSend(v6, "BOOLValue");

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_eventProcessingSemaphore);
  }

}

- (void)handleSOSMessageTypeHandoffSOS:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, handleSOSMessageTypeHandoffSOS", buf, 2u);
  }

  if (-[SOSCoordinator isIncomingMessageValidSOSHandoff:](self, "isIncomingMessageValidSOSHandoff:", v4))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SOSEventUUIDKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SOSCoordinationTriggerKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[SOSUtilities SOSTriggerMechanismForString:](SOSUtilities, "SOSTriggerMechanismForString:", v9);

    +[SOSEngine sharedInstance](SOSEngine, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__SOSCoordinator_handleSOSMessageTypeHandoffSOS___block_invoke;
    v12[3] = &unk_1E5F76AE0;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v11, "triggerSOSWithUUID:triggerMechanism:source:completion:", v8, v10, 1, v12);

  }
  else
  {
    -[SOSCoordinator sendAckToHandoffMessage:success:](self, "sendAckToHandoffMessage:success:", v4, 0);
  }

}

uint64_t __49__SOSCoordinator_handleSOSMessageTypeHandoffSOS___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendAckToHandoffMessage:success:", *(_QWORD *)(a1 + 40), a2 == 0);
}

- (void)handleSOSMessageTypeProgressionSync:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  SOSMessagingStatus *v11;
  SOSMessagingStatus *v12;
  NSObject *v13;
  uint8_t v14[16];

  v4 = a3;
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, handleSOSMessageTypeProgressionSync", v14, 2u);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SOSProgressionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[SOSUtilities SOSProgressionForString:](SOSUtilities, "SOSProgressionForString:", v6);

  if (v7 == 2)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SOSCoordinationShouldHandleThirdPartyKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    if (!v7)
    {
      sos_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SOSCoordinator handleSOSMessageTypeProgressionSync:].cold.2();
      goto LABEL_14;
    }
    v10 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SOSStatusKey"));
  v8 = objc_claimAutoreleasedReturnValue();
  v11 = -[SOSMessagingStatus initWithData:]([SOSMessagingStatus alloc], "initWithData:", v8);
  v12 = v11;
  if (v11)
  {
    -[SOSMessagingStatus sosStatus](v11, "sosStatus");
    v13 = objc_claimAutoreleasedReturnValue();
    -[SOSCoordinator sendUpdateToObserversWithStatus:progression:shouldHandleThirdParty:](self, "sendUpdateToObserversWithStatus:progression:shouldHandleThirdParty:", v13, v7, v10);
  }
  else
  {
    sos_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SOSCoordinator handleSOSMessageTypeProgressionSync:].cold.1();
  }

LABEL_14:
}

- (void)sendUpdateToObserversWithStatus:(id)a3 progression:(int64_t)a4 shouldHandleThirdParty:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SOSCoordinator observers](self, "observers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "pairedDeviceSOSStatusDidUpdate:progression:shouldHandleThirdParty:", v8, a4, v5);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (BOOL)sendUrgentMessageToPairedDevice:(id)a3
{
  return -[SOSCoordinator _sendUrgentMessageToPairedDevice:retries:](self, "_sendUrgentMessageToPairedDevice:retries:", a3, &unk_1E5F82EC8);
}

- (BOOL)_sendUrgentMessageToPairedDevice:(id)a3 retries:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  IDSService *idsService;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *pendingMessagesQueue;
  id v20;
  _QWORD block[4];
  id v23;
  SOSCoordinator *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0D34158];
  v29[0] = *MEMORY[0x1E0D341C8];
  v29[1] = v8;
  v30[0] = &unk_1E5F82EE0;
  v30[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSCoordinator effectivePairedDevice](self, "effectivePairedDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "destination");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      idsService = self->_idsService;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v28 = 0;
      v15 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](idsService, "sendMessage:toDestinations:priority:options:identifier:error:", v6, v14, 300, v9, &v28, &v27);
      v16 = v28;
      v17 = v27;

      if (v17)
      {
        sos_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[SOSCoordinator _sendUrgentMessageToPairedDevice:retries:].cold.3(v17, v18);

      }
      pendingMessagesQueue = self->_pendingMessagesQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__SOSCoordinator__sendUrgentMessageToPairedDevice_retries___block_invoke;
      block[3] = &unk_1E5F76B08;
      v23 = v16;
      v24 = self;
      v25 = v6;
      v26 = v7;
      v20 = v16;
      dispatch_sync(pendingMessagesQueue, block);

    }
    else
    {
      sos_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SOSCoordinator _sendUrgentMessageToPairedDevice:retries:].cold.2();
      v15 = 0;
    }

  }
  else
  {
    sos_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SOSCoordinator _sendUrgentMessageToPairedDevice:retries:].cold.1();
    v15 = 0;
  }

  return v15;
}

_QWORD *__59__SOSCoordinator__sendUrgentMessageToPairedDevice_retries___block_invoke(_QWORD *result)
{
  _QWORD *v1;

  if (result[4])
  {
    v1 = result;
    objc_msgSend(*(id *)(result[5] + 48), "setObject:forKeyedSubscript:", result[6]);
    return (_QWORD *)objc_msgSend(*(id *)(v1[5] + 56), "setObject:forKeyedSubscript:", v1[7], v1[4]);
  }
  return result;
}

- (BOOL)shouldRetryMessage:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SOSCoordinationMessageTypeKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SOSCoordinator SOSCoordinationMessageTypeForString:](self, "SOSCoordinationMessageTypeForString:", v4);

  return (v5 & 1) == 0 && v5 < 5;
}

- (void)sendAckToHandoffMessage:(id)a3 success:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  uint8_t *v14;
  __int16 v15;
  __int16 v16;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "setObject:forKey:", CFSTR("SOSCoordinationEventHandoffSOSAck"), CFSTR("SOSCoordinationMessageTypeKey"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SOSEventUUIDKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SOSEventUUIDKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("SOSEventUUIDKey"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("SOSHandoffAckSuccessKey"));

  -[SOSCoordinator sendUrgentMessageToPairedDevice:](self, "sendUrgentMessageToPairedDevice:", v7);
  sos_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v12)
    {
      v16 = 0;
      v13 = "SOSCoordinator,sending ack SOS event successfully handed off to watch";
      v14 = (uint8_t *)&v16;
LABEL_8:
      _os_log_impl(&dword_1AF4DC000, v11, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    }
  }
  else if (v12)
  {
    v15 = 0;
    v13 = "SOSCoordinator,sending ack SOS event NOT successfully handed off to watch";
    v14 = (uint8_t *)&v15;
    goto LABEL_8;
  }

}

- (id)effectivePairedDevice
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[IDSService devices](self->_idsService, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isDefaultPairedDevice") && objc_msgSend(v6, "relationship") == 1)
        {
          v3 = v6;
          goto LABEL_12;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (int64_t)SOSCoordinationMessageTypeForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSMessageTypeUnspecified")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSCoordinationMessageTypeHandoffSOS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOSCoordinationEventHandoffSOSAck")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SOSMessageTypeProgressionSync")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isPairedDeviceNearby
{
  void *v2;
  void *v3;
  char v4;

  -[SOSCoordinator effectivePairedDevice](self, "effectivePairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isNearby");
  else
    v4 = 0;

  return v4;
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a3;
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSCoordinator nearbyDevicesChanged", v7, 2u);
  }

  -[SOSCoordinator _handleServiceUpdate:](self, "_handleServiceUpdate:", v5);
}

- (void)_handleServiceUpdate:(id)a3
{
  id v4;

  -[SOSCoordinator effectivePairedDevice](self, "effectivePairedDevice", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SOSCoordinator _updateStateForPairedDevice:](self, "_updateStateForPairedDevice:", v4);

}

- (void)_updateStateForPairedDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  SOSCoordinator *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isNearby"))
  {
    +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sos_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, forcing SOS state sync", (uint8_t *)&v13, 2u);
      }

      if (objc_msgSend(v6, "flowState"))
      {
        v9 = self;
        v10 = 3;
      }
      else
      {
        v9 = self;
        v10 = 1;
      }
      -[SOSCoordinator syncProgressionWithPairedDevice:sosStatus:](v9, "syncProgressionWithPairedDevice:sosStatus:", v10, v6);
    }
    else
    {
      if (v8)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, no currentDeviceSOSStatus to sync with paired device", (uint8_t *)&v13, 2u);
      }

    }
  }
  else
  {
    +[SOSUtilities pairedDeviceSOSStatus](SOSUtilities, "pairedDeviceSOSStatus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (v11 && objc_msgSend(v11, "isFlowActive"))
    {
      sos_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, clearing out pairedDeviceSOSStatus: %@", (uint8_t *)&v13, 0xCu);
      }

      objc_msgSend(v6, "setFlowState:", 0);
      -[SOSCoordinator sendUpdateToObserversWithStatus:progression:shouldHandleThirdParty:](self, "sendUpdateToObserversWithStatus:progression:shouldHandleThirdParty:", v6, 3, 0);
    }
  }

}

- (int64_t)sourceDevice
{
  return 2;
}

- (void)reportHandoff:(int64_t)a3 result:(int64_t)a4
{
  id v7;

  -[SOSCoordinator coreAnalyticsReporter](self, "coreAnalyticsReporter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportSOSTriggerHandoff:source:destination:result:", a3, -[SOSCoordinator sourceDevice](self, "sourceDevice"), 1, a4);

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (SOSCoreAnalyticsReporting)coreAnalyticsReporter
{
  return self->_coreAnalyticsReporter;
}

- (void)setCoreAnalyticsReporter:(id)a3
{
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pendingMessageRetriesById, 0);
  objc_storeStrong((id *)&self->_pendingMessagesById, 0);
  objc_storeStrong((id *)&self->_pendingMessagesQueue, 0);
  objc_storeStrong((id *)&self->_eventUUIDArrayQueue, 0);
  objc_storeStrong((id *)&self->_eventProcessingSemaphore, 0);
  objc_storeStrong((id *)&self->_processingEventUUIDs, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

- (void)syncProgressionWithPairedDevice:sosStatus:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, v0, v1, "SOSCoordinator, messagingStatus was nil! Not sending update message to paired device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)service:account:identifier:didSendWithSuccess:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, v0, v1, "SOSCoordinator, indentifier for message is nil. Cannot retry.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)service:(os_log_t)log account:identifier:didSendWithSuccess:error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1AF4DC000, log, OS_LOG_TYPE_ERROR, "IDS didSendWithSuccess identifier=%@ error=%@", (uint8_t *)&v3, 0x16u);
}

void __51__SOSCoordinator_isIncomingMessageValidHandoffAck___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, v0, v1, "SOSCoordinator, incoming handoff message missing uuid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)handleSOSMessageTypeProgressionSync:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, v0, v1, "SOSCoordinator, incoming message missing SOSStatus!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)handleSOSMessageTypeProgressionSync:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, v0, v1, "SOSCoordinator, message has SOSProgressionUnknown!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sendUrgentMessageToPairedDevice:retries:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, v0, v1, "SOSCoordinator, no effectivePairedDevice to send message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sendUrgentMessageToPairedDevice:retries:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, v0, v1, "SOSCoordinator, pairedDevice does not have a destination", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sendUrgentMessageToPairedDevice:(void *)a1 retries:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1AF4DC000, a2, OS_LOG_TYPE_ERROR, "SOSCoordinator,sendUrgentMessageToPairedDevice failed with error: %@", (uint8_t *)&v4, 0xCu);

}

@end
