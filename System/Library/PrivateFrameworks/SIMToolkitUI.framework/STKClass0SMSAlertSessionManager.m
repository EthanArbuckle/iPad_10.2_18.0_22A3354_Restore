@implementation STKClass0SMSAlertSessionManager

- (STKClass0SMSAlertSessionManager)initWithSubscriptionMonitor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  STKClass0SMSAlertSessionManager *v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  STKIncomingCallUIStateMonitor *queue_incomingCallStateMonitor;
  uint64_t v13;
  CoreTelephonyClient *telephonyClient;
  objc_super v16;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  STKClass0SMSLog();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)STKClass0SMSAlertSessionManager;
  v8 = -[STKAlertSessionManager initWithEventQueue:logger:](&v16, sel_initWithEventQueue_logger_, v6, v7);

  if (v8)
  {
    v9 = BSDispatchQueueCreateWithQualityOfService();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v8->_subscriptionMonitor, a3);
    +[STKIncomingCallUIStateMonitor sharedInstance](STKIncomingCallUIStateMonitor, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    queue_incomingCallStateMonitor = v8->_queue_incomingCallStateMonitor;
    v8->_queue_incomingCallStateMonitor = (STKIncomingCallUIStateMonitor *)v11;

    -[STKIncomingCallUIStateMonitor addObserver:](v8->_queue_incomingCallStateMonitor, "addObserver:", v8);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v8->_queue);
    telephonyClient = v8->_telephonyClient;
    v8->_telephonyClient = (CoreTelephonyClient *)v13;

    -[CoreTelephonyClient setDelegate:](v8->_telephonyClient, "setDelegate:", v8);
  }

  return v8;
}

- (id)remoteAlertDescriptorForSession:(id)a3
{
  id v3;
  void *v4;
  STKClass0SMSSessionData *v5;
  void *v6;
  void *v7;
  void *v8;
  STKClass0SMSSessionData *v9;
  STKClass0SMSSessionAction *v10;
  STKClass0SMSSessionAction *v11;
  _STKRemoteAlertDescriptor *v12;
  _QWORD v14[4];
  id v15;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "options");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [STKClass0SMSSessionData alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Class0SMSBody"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Class0SMSAddress"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Class0SMSShowFromField"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[STKClass0SMSSessionData initWithBody:address:showsFromAddress:](v5, "initWithBody:address:showsFromAddress:", v6, v7, objc_msgSend(v8, "BOOLValue"));

    v10 = [STKClass0SMSSessionAction alloc];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __67__STKClass0SMSAlertSessionManager_remoteAlertDescriptorForSession___block_invoke;
    v14[3] = &unk_24D5632F0;
    v15 = v3;
    v11 = -[STKClass0SMSSessionAction initWithInputData:response:](v10, "initWithInputData:response:", v9, v14);
    v12 = -[_STKRemoteAlertDescriptor initWithAction:viewControllerName:]([_STKRemoteAlertDescriptor alloc], "initWithAction:viewControllerName:", v11, CFSTR("STKClass0SMSViewController"));

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __67__STKClass0SMSAlertSessionManager_remoteAlertDescriptorForSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendResponse:", a2);
}

- (void)handleClass0SMSBody:(id)a3 address:(id)a4 responder:(id)a5 forSlot:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__STKClass0SMSAlertSessionManager_handleClass0SMSBody_address_responder_forSlot___block_invoke;
  block[3] = &unk_24D5630A8;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, block);

}

uint64_t __81__STKClass0SMSAlertSessionManager_handleClass0SMSBody_address_responder_forSlot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleClass0SMSBody:address:responder:forSlot:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)smsMessageClass0Received:(id)a3 body:(id)a4 address:(id)a5
{
  id v8;
  id v9;
  id v10;
  _STKClass0SMSResponseProvider *v11;
  _STKClass0SMSResponseProvider *v12;
  uint64_t v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  BSDispatchQueueAssert();
  v11 = [_STKClass0SMSResponseProvider alloc];
  -[STKAlertSessionManager log](self, "log");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v12 = -[_STKClass0SMSResponseProvider initWithLogger:](v11, "initWithLogger:", v14);
  v13 = objc_msgSend(v10, "slotID");

  -[STKClass0SMSAlertSessionManager _queue_handleClass0SMSBody:address:responder:forSlot:](self, "_queue_handleClass0SMSBody:address:responder:forSlot:", v9, v8, v12, v13);
}

- (void)incomingCallUIStateDidChange:(BOOL)a3
{
  NSObject *queue;
  _QWORD block[5];

  if (!a3)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__STKClass0SMSAlertSessionManager_incomingCallUIStateDidChange___block_invoke;
    block[3] = &unk_24D563080;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __64__STKClass0SMSAlertSessionManager_incomingCallUIStateDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = 0;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v15;
    *(_QWORD *)&v7 = 134217984;
    v13 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "log", v13, (_QWORD)v14);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v19 = v11;
          _os_log_impl(&dword_216439000, v12, OS_LOG_TYPE_DEFAULT, "Enqueing session (%p) because incoming call UI was dismissed.", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "_queue_enqueueSession:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v8);
  }

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
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
  v7[2] = __66__STKClass0SMSAlertSessionManager_remoteAlertHandleDidDeactivate___block_invoke;
  v7[3] = &unk_24D563120;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __66__STKClass0SMSAlertSessionManager_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "alertHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 32), "_queue_setCurrentSession:", 0);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  objc_msgSend(v5, "removeObserver:", self);
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__STKClass0SMSAlertSessionManager_remoteAlertHandle_didInvalidateWithError___block_invoke;
  v8[3] = &unk_24D563120;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __76__STKClass0SMSAlertSessionManager_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "alertHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 32), "_queue_setCurrentSession:", 0);
}

- (void)_queue_setCurrentSession:(id)a3
{
  STKClass0SMSAlertSession *v4;
  STKClass0SMSAlertSession *currentSession;
  void *v6;
  STKClass0SMSAlertSession *v7;
  STKClass0SMSAlertSession *v8;
  id v9;

  v4 = (STKClass0SMSAlertSession *)a3;
  BSDispatchQueueAssert();
  currentSession = self->_currentSession;
  if (currentSession != v4)
  {
    -[STKAlertSession alertHandle](currentSession, "alertHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

    -[STKAlertSession invalidate](self->_currentSession, "invalidate");
  }
  v7 = self->_currentSession;
  self->_currentSession = v4;
  v8 = v4;

  -[STKAlertSession alertHandle](self->_currentSession, "alertHandle");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObserver:", self);
}

- (void)_queue_handleClass0SMSBody:(id)a3 address:(id)a4 responder:(id)a5 forSlot:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  STKClass0SMSAlertSession *v15;
  void *v16;
  void *v17;
  STKClass0SMSAlertSession *v18;
  id v19;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  BSDispatchQueueAssert();
  -[STKCarrierSubscriptionMonitor subscriptionInfoForSlot:](self->_subscriptionMonitor, "subscriptionInfoForSlot:", a6);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("Class0SMSBody"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("Class0SMSAddress"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v19, "showClass0SMSFromField"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("Class0SMSShowFromField"));

  v15 = [STKClass0SMSAlertSession alloc];
  -[STKAlertSessionManager log](self, "log");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[STKSoundFactory class0SMSSound](STKSoundFactory, "class0SMSSound");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[STKClass0SMSAlertSession initWithLogger:responseProvider:options:sound:slot:](v15, "initWithLogger:responseProvider:options:sound:slot:", v16, v10, v13, v17, a6);

  -[STKClass0SMSAlertSessionManager _queue_enqueueSession:](self, "_queue_enqueueSession:", v18);
}

- (void)_queue_enqueueSession:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSMutableArray *v7;
  NSMutableArray *queue_pendingAlertSessionsDueToInCallUI;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[STKCarrierSubscriptionMonitor subscriptionInfoForSlot:](self->_subscriptionMonitor, "subscriptionInfoForSlot:", objc_msgSend(v4, "slot"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STKIncomingCallUIStateMonitor isShowingIncomingCallUI](self->_queue_incomingCallStateMonitor, "isShowingIncomingCallUI"))
  {
    v6 = v5 == 0;
  }
  else
  {
    v6 = 1;
  }
  if (v6 || (objc_msgSend(v5, "canShowClass0SMSOverInCallAlerts") & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __57__STKClass0SMSAlertSessionManager__queue_enqueueSession___block_invoke;
    v10[3] = &unk_24D563318;
    v10[4] = self;
    v11 = v4;
    -[STKAlertSessionManager enqueuePresentationForSession:completion:](self, "enqueuePresentationForSession:completion:", v11, v10);

  }
  else
  {
    if (!self->_queue_pendingAlertSessionsDueToInCallUI)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      queue_pendingAlertSessionsDueToInCallUI = self->_queue_pendingAlertSessionsDueToInCallUI;
      self->_queue_pendingAlertSessionsDueToInCallUI = v7;

    }
    -[STKAlertSessionManager log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = v4;
      _os_log_impl(&dword_216439000, v9, OS_LOG_TYPE_DEFAULT, "Pending session (%p) due to incoming call UI up and carrier wanting alerts suppressed over incoming call alerts.", buf, 0xCu);
    }

    -[NSMutableArray addObject:](self->_queue_pendingAlertSessionsDueToInCallUI, "addObject:", v4);
  }

}

void __57__STKClass0SMSAlertSessionManager__queue_enqueueSession___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v4 = *(NSObject **)(v2 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __57__STKClass0SMSAlertSessionManager__queue_enqueueSession___block_invoke_2;
    v5[3] = &unk_24D563120;
    v5[4] = v2;
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __57__STKClass0SMSAlertSessionManager__queue_enqueueSession___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setCurrentSession:", *(_QWORD *)(a1 + 40));
}

- (STKCarrierSubscriptionMonitor)subscriptionMonitor
{
  return self->_subscriptionMonitor;
}

- (STKClass0SMSAlertSession)currentSession
{
  return self->_currentSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_subscriptionMonitor, 0);
  objc_storeStrong((id *)&self->_queue_incomingCallStateMonitor, 0);
  objc_storeStrong((id *)&self->_queue_pendingAlertSessionsDueToInCallUI, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
}

@end
