@implementation SCLInterruptBehaviorResolver

- (SCLInterruptBehaviorResolver)initWithTargetQueue:(id)a3
{
  NSObject *v4;
  SCLInterruptBehaviorResolver *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  NSXPCListener *listener;
  id v10;
  void *v11;
  uint64_t v12;
  CNContactStore *contactStore;
  NSMutableArray *v14;
  NSMutableArray *resolutionRecords;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SCLInterruptBehaviorResolver;
  v5 = -[SCLInterruptBehaviorResolver init](&v17, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create_with_target_V2("SCLInterruptBehaviorResolver", 0, v4);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", 0x24E29C328);
    listener = v5->_listener;
    v5->_listener = (NSXPCListener *)v8;

    -[NSXPCListener _setQueue:](v5->_listener, "_setQueue:", v5->_queue);
    -[NSXPCListener setDelegate:](v5->_listener, "setDelegate:", v5);
    v5->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_alloc_init(MEMORY[0x24BDBAD00]);
    v11 = (void *)tcc_identity_create();
    objc_msgSend(v10, "setAssumedIdentity:", v11);

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBACF8]), "initWithConfiguration:", v10);
    contactStore = v5->_contactStore;
    v5->_contactStore = (CNContactStore *)v12;

    -[CNContactStore requestAccessForEntityType:completionHandler:](v5->_contactStore, "requestAccessForEntityType:completionHandler:", 0, &__block_literal_global_6);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    resolutionRecords = v5->_resolutionRecords;
    v5->_resolutionRecords = v14;

  }
  return v5;
}

void __52__SCLInterruptBehaviorResolver_initWithTargetQueue___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  scl_interrupt_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_21E4AD000, v5, OS_LOG_TYPE_DEFAULT, "Access to contacts store: granted=%{BOOL}u, error=%@", (uint8_t *)v6, 0x12u);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SCLInterruptBehaviorResolver;
  -[SCLInterruptBehaviorResolver dealloc](&v3, sel_dealloc);
}

- (void)activate
{
  -[NSXPCListener resume](self->_listener, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  scl_interrupt_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109120;
    v10[1] = objc_msgSend(v5, "processIdentifier");
    _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_INFO, "Accepting new connection from pid %d", (uint8_t *)v10, 8u);
  }

  SCLInterruptBehaviorResolutionXPCServerInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);

  objc_msgSend(v5, "setExportedObject:", self);
  -[SCLInterruptBehaviorResolver queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setQueue:", v8);

  objc_msgSend(v5, "resume");
  return 1;
}

- (void)server:(id)a3 didUpdateState:(id)a4 fromState:(id)a5
{
  SCLState *v6;
  SCLState *currentState;

  v6 = (SCLState *)a4;
  os_unfair_lock_lock(&self->_lock);
  currentState = self->_currentState;
  self->_currentState = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)resolveBehaviorForEvent:(id)a3 clientIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  -[SCLInterruptBehaviorResolver queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  scl_interrupt_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v17 = 138543362;
    v18 = v8;
    _os_log_impl(&dword_21E4AD000, v12, OS_LOG_TYPE_INFO, "Resolving behavior for event: %{public}@", (uint8_t *)&v17, 0xCu);
  }

  if (-[SCLInterruptBehaviorResolver _isEntitledWithClientIdentifier:](self, "_isEntitledWithClientIdentifier:", v9))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLInterruptBehaviorResolver _resolveInterruptBehaviorForEvent:date:clientIdentifier:](self, "_resolveInterruptBehaviorForEvent:date:clientIdentifier:", v8, v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    scl_interrupt_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v14;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_21E4AD000, v15, OS_LOG_TYPE_DEFAULT, "Result behavior:%@ for event: %{public}@", (uint8_t *)&v17, 0x16u);
    }

    v10[2](v10, v14, 0);
  }
  else
  {
    scl_interrupt_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SCLInterruptBehaviorResolver resolveBehaviorForEvent:clientIdentifier:completion:].cold.1(v16);

    SCLEntitlementError(0x24E29C328);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v13);
  }

}

- (BOOL)_isEntitledWithClientIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  NSObject *v10;

  v4 = a3;
  -[SCLInterruptBehaviorResolver queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForEntitlement:", 0x24E29C328);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "containsObject:", v4);
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "isEqualToString:", v4);
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:
  scl_interrupt_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[SCLInterruptBehaviorResolver _isEntitledWithClientIdentifier:].cold.1((uint64_t)v4, v9, v10);

  return v9;
}

- (id)_resolveInterruptBehaviorForEvent:(id)a3 date:(id)a4 clientIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  SCLInterruptEventBehavior *v17;
  void *v18;
  _BOOL4 v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SCLInterruptBehaviorResolver queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  os_unfair_lock_lock(&self->_lock);
  -[SCLInterruptBehaviorResolver currentState](self, "currentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v8, "sender");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isActive")
    || (objc_msgSend(v8, "shouldAlwaysInterrupt") & 1) != 0
    || objc_msgSend(v8, "urgency") == 1)
  {
    v14 = 0;
    v15 = 1;
  }
  else if (v13)
  {
    v20 = -[SCLInterruptBehaviorResolver _isEmergencyBypassEnabledForContact:](self, "_isEmergencyBypassEnabledForContact:", v13);
    v14 = !v20;
    v15 = v20;
  }
  else
  {
    v15 = 0;
    v14 = 1;
  }
  v16 = objc_msgSend(v8, "type");
  if (v14 && v16 == 1 && v13)
    v15 = -[SCLInterruptBehaviorResolver _isRepeatSender:date:clientIdentifier:](self, "_isRepeatSender:date:clientIdentifier:", v13, v9, v10);
  v17 = -[SCLInterruptEventBehavior initWithEvent:interruptEligibility:]([SCLInterruptEventBehavior alloc], "initWithEvent:interruptEligibility:", v8, v15);
  if (objc_msgSend(v8, "type") == 1)
  {
    +[SCLInterruptBehaviorResolutionRecord resolutionRecordForDate:eventBehavior:clientIdentifier:](SCLInterruptBehaviorResolutionRecord, "resolutionRecordForDate:eventBehavior:clientIdentifier:", v9, v17, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLInterruptBehaviorResolver _addResolutionRecord:](self, "_addResolutionRecord:", v18);

  }
  return v17;
}

- (BOOL)_isEmergencyBypassEnabledForContact:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CNContactStore *contactStore;
  id v12;
  NSObject *v13;
  int v14;
  BOOL v15;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  int v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SCLInterruptBehaviorResolver queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc(MEMORY[0x24BDBACB8]);
  v7 = *MEMORY[0x24BDBA308];
  v27[0] = *MEMORY[0x24BDBA2E0];
  v27[1] = v7;
  v27[2] = *MEMORY[0x24BDBA268];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKeysToFetch:", v8);

  objc_msgSend(MEMORY[0x24BDBACA0], "scl_predicateForContactsMatchingEventSender:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(v9, "setUnifyResults:", 1);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  contactStore = self->_contactStore;
  v17[4] = &v19;
  v18 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __68__SCLInterruptBehaviorResolver__isEmergencyBypassEnabledForContact___block_invoke;
  v17[3] = &unk_24E29BD50;
  LODWORD(v10) = -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, &v18, v17);
  v12 = v18;
  if ((_DWORD)v10)
  {
    scl_interrupt_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *((unsigned __int8 *)v20 + 24);
      *(_DWORD *)buf = 138543618;
      v24 = v4;
      v25 = 1024;
      v26 = v14;
      _os_log_impl(&dword_21E4AD000, v13, OS_LOG_TYPE_DEFAULT, "sender=%{public}@, isEmergencyBypassEnabled=%{BOOL}u", buf, 0x12u);
    }
  }
  else
  {
    scl_interrupt_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SCLInterruptBehaviorResolver _isEmergencyBypassEnabledForContact:].cold.1((uint64_t)v12, v13);
  }

  v15 = *((_BYTE *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  return v15;
}

void __68__SCLInterruptBehaviorResolver__isEmergencyBypassEnabledForContact___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if ((objc_msgSend(v5, "isUnified") & 1) != 0)
  {
    objc_msgSend(v5, "linkedContacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "bs_containsObjectPassingTest:", &__block_literal_global_20);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

uint64_t __68__SCLInterruptBehaviorResolver__isEmergencyBypassEnabledForContact___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "callAlert");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreMute");

  return v3;
}

- (BOOL)_isRepeatSender:(id)a3 date:(id)a4 clientIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSMutableArray *resolutionRecords;
  id v14;
  id v15;
  id v16;
  int v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[SCLInterruptBehaviorResolver queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v10, "dateByAddingTimeInterval:", -180.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  resolutionRecords = self->_resolutionRecords;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __70__SCLInterruptBehaviorResolver__isRepeatSender_date_clientIdentifier___block_invoke;
  v20[3] = &unk_24E29BD78;
  v21 = v12;
  v22 = v9;
  v14 = v8;
  v23 = v14;
  v15 = v9;
  v16 = v12;
  v17 = -[NSMutableArray bs_containsObjectPassingTest:](resolutionRecords, "bs_containsObjectPassingTest:", v20);
  scl_interrupt_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = v14;
    v26 = 1024;
    v27 = v17;
    _os_log_impl(&dword_21E4AD000, v18, OS_LOG_TYPE_DEFAULT, "Checked if event sender is a repeat: sender=%{public}@, repeat=%{BOOL}u", buf, 0x12u);
  }

  return v17;
}

uint64_t __70__SCLInterruptBehaviorResolver__isRepeatSender_date_clientIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  int v13;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "compare:", v5);

  objc_msgSend(v4, "clientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", a1[5]);

  objc_msgSend(v4, "eventBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", a1[6]);

  if (v6 == 1)
    v13 = 0;
  else
    v13 = v8;
  return v13 & v12;
}

- (void)_addResolutionRecord:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SCLInterruptBehaviorResolver queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    -[NSMutableArray addObject:](self->_resolutionRecords, "addObject:", v4);
    scl_interrupt_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v18 = (uint64_t)v4;
      _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_INFO, "New record added %{public}@", buf, 0xCu);
    }

    if ((unint64_t)-[NSMutableArray count](self->_resolutionRecords, "count") >= 0x15)
    {
      v7 = -[NSMutableArray count](self->_resolutionRecords, "count");
      objc_msgSend(v4, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateByAddingTimeInterval:", -180.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x24BDD1758];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __53__SCLInterruptBehaviorResolver__addResolutionRecord___block_invoke;
      v15[3] = &unk_24E29BDA0;
      v11 = v9;
      v16 = v11;
      objc_msgSend(v10, "predicateWithBlock:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray filterUsingPredicate:](self->_resolutionRecords, "filterUsingPredicate:", v12);
      v13 = v7 - -[NSMutableArray count](self->_resolutionRecords, "count");
      if (v13)
      {
        scl_interrupt_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v18 = v13;
          _os_log_impl(&dword_21E4AD000, v14, OS_LOG_TYPE_DEFAULT, "Pruned %lu resolution records", buf, 0xCu);
        }

      }
    }
  }

}

BOOL __53__SCLInterruptBehaviorResolver__addResolutionRecord___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3) != 1;

  return v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (SCLState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (NSMutableArray)resolutionRecords
{
  return self->_resolutionRecords;
}

- (void)setResolutionRecords:(id)a3
{
  objc_storeStrong((id *)&self->_resolutionRecords, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionRecords, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)resolveBehaviorForEvent:(os_log_t)log clientIdentifier:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E4AD000, log, OS_LOG_TYPE_ERROR, "Missing entitlement for resolving behavior", v1, 2u);
}

- (void)_isEntitledWithClientIdentifier:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_21E4AD000, log, OS_LOG_TYPE_DEBUG, "Client %@ entitled %{BOOL}u", (uint8_t *)&v3, 0x12u);
}

- (void)_isEmergencyBypassEnabledForContact:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21E4AD000, a2, OS_LOG_TYPE_ERROR, "Error checking emergency bypass contacts: error=%@", (uint8_t *)&v2, 0xCu);
}

@end
