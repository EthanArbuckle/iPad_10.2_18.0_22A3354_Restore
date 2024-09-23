@implementation UNCBlueListMonitor

- (UNCBlueListMonitor)init
{
  UNCBlueListMonitor *v2;
  uint64_t v3;
  _CDContext *context;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  _CDContextualKeyPath *blueListKeyPath;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  UNCBlueListMonitor *v15;
  id v16;
  char v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)UNCBlueListMonitor;
  v2 = -[UNCBlueListMonitor init](&v19, sel_init);
  if (!v2)
  {
LABEL_12:
    v15 = v2;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v3 = objc_claimAutoreleasedReturnValue();
  context = v2->_context;
  v2->_context = (_CDContext *)v3;

  if (v2->_context)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.usernotificationsserver.BlueListMonitor", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x24BE1B198], "keyPathWithKey:", CFSTR("/push/bluelist"));
    v8 = objc_claimAutoreleasedReturnValue();
    blueListKeyPath = v2->_blueListKeyPath;
    v2->_blueListKeyPath = (_CDContextualKeyPath *)v8;

    -[_CDContext objectForKeyedSubscript:](v2->_context, "objectForKeyedSubscript:", v2->_blueListKeyPath);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    v12 = v10;
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v16 = v13;

    v17 = objc_msgSend(v16, "BOOLValue");
    v2->_budgetExhausted = v17;
    -[UNCBlueListMonitor _startMonitoring](v2, "_startMonitoring");
    goto LABEL_12;
  }
  v14 = *MEMORY[0x24BDF89E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
    -[UNCBlueListMonitor init].cold.1(v14);
  v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)shouldBoostOpportunisticTopicsToEnabled
{
  UNCBlueListMonitor *v2;
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = v2->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__UNCBlueListMonitor_shouldBoostOpportunisticTopicsToEnabled__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24) == 0;
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __61__UNCBlueListMonitor_shouldBoostOpportunisticTopicsToEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__UNCBlueListMonitor_setDelegate___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

id __34__UNCBlueListMonitor_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (void)_startMonitoring
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)MEMORY[0x24BE1B190];
  objc_msgSend(MEMORY[0x24BE1B1A0], "predicateForChangeAtKeyPath:", self->_blueListKeyPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__UNCBlueListMonitor__startMonitoring__block_invoke;
  v6[3] = &unk_251AE01F0;
  v6[4] = self;
  objc_msgSend(v3, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.usernotifications.bluelist"), v4, CFSTR("com.apple.UserNotificationsServer"), v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDContext registerCallback:](self->_context, "registerCallback:", v5);
}

void __38__UNCBlueListMonitor__startMonitoring__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  _QWORD block[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__UNCBlueListMonitor__startMonitoring__block_invoke_11;
  block[3] = &unk_251AE01C8;
  block[4] = v7;
  block[5] = &v19;
  block[6] = &v13;
  dispatch_sync(v8, block);
  v9 = *MEMORY[0x24BDF89E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = *((unsigned __int8 *)v20 + 24);
    v11 = v14[5];
    *(_DWORD *)buf = 67109376;
    v24 = v10;
    v25 = 2048;
    v26 = v11;
    _os_log_impl(&dword_2499A5000, v9, OS_LOG_TYPE_DEFAULT, "bluelist status changed; budgetExhausted: %d, notifying delegate: %p",
      buf,
      0x12u);
  }
  objc_msgSend((id)v14[5], "bluelistStatusChanged");
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
}

void __38__UNCBlueListMonitor__startMonitoring__block_invoke_11(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  char v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1[4] + 24));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = objc_msgSend(v6, "BOOLValue");
  *(_BYTE *)(a1[4] + 8) = v7;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a1[4] + 8);
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = WeakRetained;

}

- (UNCBlueListMonitorDelegate)delegate
{
  return (UNCBlueListMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_blueListKeyPath, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2499A5000, log, OS_LOG_TYPE_ERROR, "Unable to initialize bluelist coreduet context. Opportunistic topics will not be boosted.", v1, 2u);
}

@end
