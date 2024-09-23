@implementation SPFinderStateManager

- (SPFinderStateManager)init
{
  SPFinderStateManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  id v6;
  void *v7;
  uint64_t v8;
  FMXPCServiceDescription *serviceDescription;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SPFinderStateManager;
  v2 = -[SPFinderStateManager init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPFinderStateManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc(MEMORY[0x24BE2FE70]);
    -[SPFinderStateManager remoteInterface](v2, "remoteInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithMachServiceName:options:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.finderstatemanager"), 0, v7, 0, 0);
    serviceDescription = v2->_serviceDescription;
    v2->_serviceDescription = (FMXPCServiceDescription *)v8;

  }
  return v2;
}

- (id)remoteInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DEEBF8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v7[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_stateInfoWithCompletion_, 0, 1);

  return v2;
}

- (void)start
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_215909000, v3, OS_LOG_TYPE_DEFAULT, "SPFinderStateManager: start observing state change notification", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)finderStateChangedHandler, CFSTR("SPFinderStateChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  -[SPFinderStateManager updateStateBlock](self, "updateStateBlock");
}

- (void)enableFinderModeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215909000, v5, OS_LOG_TYPE_DEFAULT, "enableFinderModeWithCompletion", buf, 2u);
  }

  -[SPFinderStateManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__SPFinderStateManager_enableFinderModeWithCompletion___block_invoke;
  v8[3] = &unk_24D3B6EA0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __55__SPFinderStateManager_enableFinderModeWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __55__SPFinderStateManager_enableFinderModeWithCompletion___block_invoke_2;
  v2[3] = &unk_24D3B6EA0;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  _os_activity_initiate(&dword_215909000, "SPFinderStateManager enableFinderModeWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, v2);

}

void __55__SPFinderStateManager_enableFinderModeWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableFinderModeWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)disableFinderModeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215909000, v5, OS_LOG_TYPE_DEFAULT, "disableFinderModeWithCompletion", buf, 2u);
  }

  -[SPFinderStateManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__SPFinderStateManager_disableFinderModeWithCompletion___block_invoke;
  v8[3] = &unk_24D3B6EA0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __56__SPFinderStateManager_disableFinderModeWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __56__SPFinderStateManager_disableFinderModeWithCompletion___block_invoke_2;
  v2[3] = &unk_24D3B6EA0;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  _os_activity_initiate(&dword_215909000, "SPFinderStateManager disableFinderModeWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, v2);

}

void __56__SPFinderStateManager_disableFinderModeWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableFinderModeWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)setActiveCache:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[SPFinderStateManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SPFinderStateManager_setActiveCache_completion___block_invoke;
  block[3] = &unk_24D3B6ED0;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __50__SPFinderStateManager_setActiveCache_completion___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  _QWORD activity_block[5];
  id v4;
  uint64_t v5;

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __50__SPFinderStateManager_setActiveCache_completion___block_invoke_2;
  activity_block[3] = &unk_24D3B6ED0;
  v2 = (void *)a1[5];
  v1 = a1[6];
  activity_block[4] = a1[4];
  v5 = v1;
  v4 = v2;
  _os_activity_initiate(&dword_215909000, "SPFinderStateManager setActiveCache:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __50__SPFinderStateManager_setActiveCache_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActiveCache:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)updateStateBlock
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __40__SPFinderStateManager_updateStateBlock__block_invoke;
  v2[3] = &unk_24D3B6F20;
  v2[4] = self;
  -[SPFinderStateManager stateInfoWithCompletion:](self, "stateInfoWithCompletion:", v2);
}

void __40__SPFinderStateManager_updateStateBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD activity_block[5];
  id v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __40__SPFinderStateManager_updateStateBlock__block_invoke_cold_1((uint64_t)v6, v8);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v17 = objc_msgSend(v5, "state");
      _os_log_impl(&dword_215909000, v8, OS_LOG_TYPE_DEFAULT, "Fetched latest finder state %i:", buf, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "stateChangedBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = MEMORY[0x24BDAC760];
    if (v9)
    {
      activity_block[0] = MEMORY[0x24BDAC760];
      activity_block[1] = 3221225472;
      activity_block[2] = __40__SPFinderStateManager_updateStateBlock__block_invoke_64;
      activity_block[3] = &unk_24D3B6EF8;
      activity_block[4] = *(_QWORD *)(a1 + 32);
      v15 = v5;
      _os_activity_initiate(&dword_215909000, "SPFinderStateManager stateChangedBlock", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    }
    objc_msgSend(*(id *)(a1 + 32), "stateInfoChangedBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12[0] = v10;
      v12[1] = 3221225472;
      v12[2] = __40__SPFinderStateManager_updateStateBlock__block_invoke_2;
      v12[3] = &unk_24D3B6EF8;
      v12[4] = *(_QWORD *)(a1 + 32);
      v13 = v5;
      _os_activity_initiate(&dword_215909000, "SPFinderStateManager stateInfoChangedBlock", OS_ACTIVITY_FLAG_DEFAULT, v12);

    }
  }

}

void __40__SPFinderStateManager_updateStateBlock__block_invoke_64(uint64_t a1)
{
  void (**v2)(id, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "stateChangedBlock");
  v2 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v2[2](v2, objc_msgSend(*(id *)(a1 + 40), "state"));

}

void __40__SPFinderStateManager_updateStateBlock__block_invoke_2(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "stateInfoChangedBlock");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;
  uint8_t buf[4];
  SPFinderStateManager *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl(&dword_215909000, v3, OS_LOG_TYPE_DEFAULT, "SPFinderStateManager: Dealloc %@", buf, 0xCu);
  }

  -[SPFinderStateManager session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[SPFinderStateManager setSession:](self, "setSession:", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SPFinderStateChangedNotification"), 0);
  v6.receiver = self;
  v6.super_class = (Class)SPFinderStateManager;
  -[SPFinderStateManager dealloc](&v6, sel_dealloc);
}

- (SPFinderStateXPCProtocol)proxy
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SPFinderStateManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPFinderStateManager session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x24BE2FE78]);
    -[SPFinderStateManager serviceDescription](self, "serviceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithServiceDescription:", v6);
    -[SPFinderStateManager setSession:](self, "setSession:", v7);

    LogCategory_Unspecified();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SPFinderStateManager serviceDescription](self, "serviceDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "machService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_215909000, v8, OS_LOG_TYPE_DEFAULT, "SPFinderStateManager: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);

    }
    -[SPFinderStateManager session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
  -[SPFinderStateManager session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "proxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPFinderStateXPCProtocol *)v13;
}

- (void)fetchFinderState:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215909000, v5, OS_LOG_TYPE_DEFAULT, "fetching Finder State...", buf, 2u);
  }

  -[SPFinderStateManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__SPFinderStateManager_fetchFinderState___block_invoke;
  v8[3] = &unk_24D3B6EA0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __41__SPFinderStateManager_fetchFinderState___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __41__SPFinderStateManager_fetchFinderState___block_invoke_2;
  v2[3] = &unk_24D3B6EA0;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  _os_activity_initiate(&dword_215909000, "SPFinderStateManager fetchFinderState", OS_ACTIVITY_FLAG_DEFAULT, v2);

}

void __41__SPFinderStateManager_fetchFinderState___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchFinderState:", *(_QWORD *)(a1 + 40));

}

- (void)stateInfoWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SPFinderStateManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SPFinderStateManager_stateInfoWithCompletion___block_invoke;
  v7[3] = &unk_24D3B6EA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __48__SPFinderStateManager_stateInfoWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __48__SPFinderStateManager_stateInfoWithCompletion___block_invoke_2;
  v2[3] = &unk_24D3B6EA0;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  _os_activity_initiate(&dword_215909000, "SPFinderStateManager stateInfoWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, v2);

}

void __48__SPFinderStateManager_stateInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stateInfoWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (id)stateInfoChangedBlock
{
  return self->stateInfoChangedBlock;
}

- (void)setStateInfoChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)stateChangedBlock
{
  return self->_stateChangedBlock;
}

- (void)setStateChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescription, a3);
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong(&self->_stateChangedBlock, 0);
  objc_storeStrong(&self->stateInfoChangedBlock, 0);
}

void __40__SPFinderStateManager_updateStateBlock__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215909000, a2, OS_LOG_TYPE_ERROR, "Error fetching latest state change: %@", (uint8_t *)&v2, 0xCu);
}

@end
