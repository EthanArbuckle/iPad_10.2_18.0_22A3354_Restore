@implementation PCWWANUsabilityMonitor

- (BOOL)isInterfaceUsable
{
  NSObject *ivarQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PCWWANUsabilityMonitor_isInterfaceUsable__block_invoke;
  v5[3] = &unk_1E87435D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__43__PCWWANUsabilityMonitor_isInterfaceUsable__block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (result)
  {
    result = (void *)objc_msgSend(result, "isInterfaceUsable");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (NSString)linkQualityString
{
  return (NSString *)+[PCInterfaceUsabilityMonitor stringForLinkQuality:](PCInterfaceUsabilityMonitor, "stringForLinkQuality:", -[PCWWANUsabilityMonitor linkQuality](self, "linkQuality"));
}

- (int)linkQuality
{
  NSObject *ivarQueue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__PCWWANUsabilityMonitor_linkQuality__block_invoke;
  v5[3] = &unk_1E87435D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__PCWWANUsabilityMonitor_linkQuality__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
    result = objc_msgSend(v2, "linkQuality");
  else
    result = 4294967294;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __36__PCWWANUsabilityMonitor_currentRAT__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (BOOL)isLTEWithCDRX
{
  NSObject *ivarQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PCWWANUsabilityMonitor_isLTEWithCDRX__block_invoke;
  v5[3] = &unk_1E87435D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)currentRAT
{
  NSObject *ivarQueue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PCWWANUsabilityMonitor_currentRAT__block_invoke;
  v5[3] = &unk_1E8743728;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__PCWWANUsabilityMonitor_isLTEWithCDRX__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  _CTServerConnectionGetCDRXWithLTEState();
  if (!*MEMORY[0x1E0CA73E0])
  {
    +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1CBC1B000, v7, OS_LOG_TYPE_DEFAULT, "%@ isLTEWithCDRX? On", buf, 0xCu);
    }

    goto LABEL_12;
  }
  if (v13 != *MEMORY[0x1E0CA73E8])
  {
    v2 = *MEMORY[0x1E0CA73D8];
    +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v4)
      {
        v5 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        v6 = "%@ isLTEWithCDRX? Got invalid value from CT";
LABEL_15:
        _os_log_impl(&dword_1CBC1B000, v3, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
      }
    }
    else if (v4)
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      v6 = "%@ isLTEWithCDRX? Off";
      goto LABEL_15;
    }

    return;
  }
  v12 = 0;
  notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 88), &v12);
  +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v15 = v10;
    v16 = 2048;
    v17 = v12;
    _os_log_impl(&dword_1CBC1B000, v9, OS_LOG_TYPE_DEFAULT, "%@ isLTEWithCDRX? Unknown  --  powerlog value %llu", buf, 0x16u);
  }

  if (v12)
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (PCWWANUsabilityMonitor)initWithDelegateQueue:(id)a3
{
  id v5;
  PCWWANUsabilityMonitor *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *ivarQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *monitorDelegateQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PCWWANUsabilityMonitor;
  v6 = -[PCWWANUsabilityMonitor init](&v12, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("PCWWANUsabilityMonitor-ivarqueue", 0);
    ivarQueue = v6->_ivarQueue;
    v6->_ivarQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("PCWWANUsabilityMonitor-monitordelegatequeue", 0);
    monitorDelegateQueue = v6->_monitorDelegateQueue;
    v6->_monitorDelegateQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_delegateQueue, a3);
    v6->_currentRAT = -1;
    notify_register_dispatch("com.apple.powerlog.BasebandHasCDRXCapability", &v6->_powerlogCDRXToken, MEMORY[0x1E0C80D38], &__block_literal_global_6);
    -[PCWWANUsabilityMonitor _setupWWANMonitor](v6, "_setupWWANMonitor");
  }

  return v6;
}

void __48__PCWWANUsabilityMonitor_initWithDelegateQueue___block_invoke(int a1, int token)
{
  NSObject *v2;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  notify_get_state(token, &state64);
  +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v5 = state64;
    _os_log_impl(&dword_1CBC1B000, v2, OS_LOG_TYPE_DEFAULT, "kPCWWANPowerlogCDRXNotification - state = %llu", buf, 0xCu);
  }

}

- (void)dealloc
{
  PCInterfaceUsabilityMonitor *interfaceMonitor;
  objc_super v4;

  notify_cancel(self->_powerlogCDRXToken);
  -[PCInterfaceUsabilityMonitor setDelegate:](self->_interfaceMonitor, "setDelegate:", 0);
  interfaceMonitor = self->_interfaceMonitor;
  self->_interfaceMonitor = 0;

  if (self->_ctServerConnection)
  {
    _CTServerConnectionUnregisterForNotification();
    CFRelease(self->_ctServerConnection);
    self->_ctServerConnection = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PCWWANUsabilityMonitor;
  -[PCWWANUsabilityMonitor dealloc](&v4, sel_dealloc);
}

- (void)_setupWWANMonitor
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CBC1B000, a2, OS_LOG_TYPE_ERROR, "Unable to setup WWAN monitor. {dataSimContextError: %@}.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

uint64_t __43__PCWWANUsabilityMonitor__setupWWANMonitor__block_invoke(uint64_t a1)
{
  PCInterfaceUsabilityMonitor *v2;
  uint64_t v3;
  void *v4;

  v2 = -[PCInterfaceUsabilityMonitor initWithInterfaceIdentifier:delegateQueue:]([PCInterfaceUsabilityMonitor alloc], "initWithInterfaceIdentifier:delegateQueue:", 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setDelegate:");
  return objc_msgSend(*(id *)(a1 + 32), "_forwardConfigurationOnIvarQueue");
}

- (void)_adjustInterfaceNameForWWANContextID:(int)a3 interfaceName:(id)a4 forContext:(id)a5
{
  id v8;
  id v9;
  NSObject *ivarQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a4;
  v9 = a5;
  ivarQueue = self->_ivarQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__PCWWANUsabilityMonitor__adjustInterfaceNameForWWANContextID_interfaceName_forContext___block_invoke;
  v13[3] = &unk_1E8743770;
  v13[4] = self;
  v14 = v9;
  v16 = a3;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async(ivarQueue, v13);

}

void __88__PCWWANUsabilityMonitor__adjustInterfaceNameForWWANContextID_interfaceName_forContext___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PCInterfaceUsabilityMonitor *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_isCurrentDataSimContextOnIvarQueue:", *(_QWORD *)(a1 + 40)))
  {
    v2 = (void *)MEMORY[0x1D17A4604]();
    v3 = *(_DWORD *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 32);
    if (v3 != *(_DWORD *)(v4 + 112))
    {
      *(_DWORD *)(v4 + 112) = v3;
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 64);
      *(_QWORD *)(v5 + 64) = 0;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setDelegate:", 0);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 72);
      *(_QWORD *)(v7 + 72) = 0;

      v9 = *(_QWORD *)(a1 + 32);
      if (*(_DWORD *)(v9 + 112) != -1)
      {
        objc_storeStrong((id *)(v9 + 64), *(id *)(a1 + 48));
        if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "length"))
        {
          v10 = *(_QWORD *)(a1 + 32);
          v11 = *(void **)(v10 + 64);
          *(_QWORD *)(v10 + 64) = 0;

        }
      }
      +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(int *)(a1 + 56);
        v15 = *(_QWORD *)(v13 + 64);
        v19 = 138543874;
        v20 = v13;
        v21 = 2048;
        v22 = v14;
        v23 = 2114;
        v24 = v15;
        _os_log_impl(&dword_1CBC1B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ _adjustInterfaceNameForWWANContextID contextID %ld  interfaceName %{public}@", (uint8_t *)&v19, 0x20u);
      }

      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
      {
        v16 = -[PCInterfaceUsabilityMonitor initWithInterfaceIdentifier:delegateQueue:]([PCInterfaceUsabilityMonitor alloc], "initWithInterfaceIdentifier:delegateQueue:", 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(v17 + 72);
        *(_QWORD *)(v17 + 72) = v16;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setDelegate:");
        objc_msgSend(*(id *)(a1 + 32), "_forwardConfigurationOnIvarQueue");
      }
    }
    objc_autoreleasePoolPop(v2);
  }
}

- (BOOL)_isCurrentDataSimContextOnIvarQueue:(id)a3
{
  BOOL result;
  CTXPCServiceSubscriptionContext *currentDataSimContext;
  id v6;
  uint64_t v7;
  uint64_t v8;

  result = 0;
  if (a3)
  {
    currentDataSimContext = self->_currentDataSimContext;
    if (currentDataSimContext)
    {
      v6 = a3;
      v7 = -[CTXPCServiceSubscriptionContext slotID](currentDataSimContext, "slotID");
      v8 = objc_msgSend(v6, "slotID");

      return v7 == v8;
    }
  }
  return result;
}

- (void)_processDataConnectionStatus:(id)a3 forContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "pdp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v12, "pdp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

  }
  else
  {
    v9 = -1;
  }

  if (v9 < 0)
    v10 = 0xFFFFFFFFLL;
  else
    v10 = v9;
  objc_msgSend(v12, "interfaceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCWWANUsabilityMonitor _adjustInterfaceNameForWWANContextID:interfaceName:forContext:](self, "_adjustInterfaceNameForWWANContextID:interfaceName:forContext:", v10, v11, v6);

}

- (void)_processDataStatus:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  int v9;
  int v10;
  NSObject *ivarQueue;
  id v12;
  _QWORD v13[5];
  id v14;
  int v15;
  int v16;
  BOOL v17;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "indicator") < 6;
  v9 = objc_msgSend(v7, "radioTechnology");
  v10 = objc_msgSend(v7, "dataBearerSoMask");

  ivarQueue = self->_ivarQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__PCWWANUsabilityMonitor__processDataStatus_forContext___block_invoke;
  v13[3] = &unk_1E8743798;
  v13[4] = self;
  v14 = v6;
  v17 = v8;
  v15 = v9;
  v16 = v10;
  v12 = v6;
  dispatch_async(ivarQueue, v13);

}

uint64_t __56__PCWWANUsabilityMonitor__processDataStatus_forContext___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  void *v5;
  int v6;
  int v7;
  _QWORD v8[5];

  result = objc_msgSend(*(id *)(a1 + 32), "_isCurrentDataSimContextOnIvarQueue:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(unsigned __int8 *)(a1 + 56);
    if (*(unsigned __int8 *)(v3 + 41) != v4)
    {
      *(_BYTE *)(v3 + 41) = v4;
      v5 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __56__PCWWANUsabilityMonitor__processDataStatus_forContext___block_invoke_2;
      v8[3] = &unk_1E8743688;
      v8[4] = v5;
      result = objc_msgSend(v5, "_callDelegateOnIvarQueueWithBlock:", v8);
      v3 = *(_QWORD *)(a1 + 32);
    }
    v6 = *(_DWORD *)(a1 + 48);
    if (*(_DWORD *)(v3 + 80) != v6)
    {
      *(_DWORD *)(v3 + 80) = v6;
      v3 = *(_QWORD *)(a1 + 32);
    }
    v7 = *(_DWORD *)(a1 + 52);
    if (*(_DWORD *)(v3 + 84) != v7)
      *(_DWORD *)(v3 + 84) = v7;
  }
  return result;
}

void __56__PCWWANUsabilityMonitor__processDataStatus_forContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "interfaceRadioHotnessChanged:", *(_QWORD *)(a1 + 32));

}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1CBC1B000, v10, OS_LOG_TYPE_DEFAULT, "connectionStateChanged - %@", (uint8_t *)&v11, 0xCu);
  }

  if (!a4)
    -[PCWWANUsabilityMonitor _processDataConnectionStatus:forContext:](self, "_processDataConnectionStatus:forContext:", v9, v8);

}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1CBC1B000, v8, OS_LOG_TYPE_DEFAULT, "dataStatus changed - %@", (uint8_t *)&v9, 0xCu);
  }

  -[PCWWANUsabilityMonitor _processDataStatus:forContext:](self, "_processDataStatus:forContext:", v7, v6);
}

- (void)currentDataSimChanged:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *ivarQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1CBC1B000, v5, OS_LOG_TYPE_DEFAULT, "currentDataSimChanged - %@", buf, 0xCu);
  }

  ivarQueue = self->_ivarQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__PCWWANUsabilityMonitor_currentDataSimChanged___block_invoke;
  v8[3] = &unk_1E8743238;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(ivarQueue, v8);

}

void __48__PCWWANUsabilityMonitor_currentDataSimChanged___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
}

- (void)_processCallStatusChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  const void *v8;
  BOOL v9;
  NSObject *ivarQueue;
  _QWORD v11[5];
  BOOL v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CA7140]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "intValue") - 6 < 0xFFFFFFFE;
  else
    v7 = 0;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CA7130]);
  v8 = (const void *)CTCallGetCallSubType();
  if (CFEqual(v8, (CFTypeRef)*MEMORY[0x1E0CA7150]))
    v9 = v7;
  else
    v9 = 0;
  ivarQueue = self->_ivarQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PCWWANUsabilityMonitor__processCallStatusChanged___block_invoke;
  v11[3] = &unk_1E87436D8;
  v12 = v9;
  v11[4] = self;
  dispatch_async(ivarQueue, v11);

}

void __52__PCWWANUsabilityMonitor__processCallStatusChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40))
  {
    +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 40))
        v4 = CFSTR("NO");
      v5 = 138412546;
      v6 = v3;
      v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_1CBC1B000, v2, OS_LOG_TYPE_DEFAULT, "%@ call status changed. isInCall = %@", (uint8_t *)&v5, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = *(_BYTE *)(a1 + 40);
  }
}

- (unint64_t)interface5GMode
{
  NSObject *ivarQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PCWWANUsabilityMonitor_interface5GMode__block_invoke;
  v5[3] = &unk_1E87435D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__PCWWANUsabilityMonitor_interface5GMode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 80) == 10)
  {
    v3 = *(void **)(v2 + 104);
    v22 = 0;
    v4 = objc_msgSend(v3, "isSmartDataModeSupported:", &v22);
    v5 = v22;
    if (v4
      && (objc_msgSend(MEMORY[0x1E0CA6DE0], "descriptorWithSubscriptionContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128)), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = *(void **)(*(_QWORD *)(a1 + 32) + 104), v21 = 0, v8 = objc_msgSend(v7, "smartDataMode:error:", v6, &v21), v6, v8))
    {
      v9 = 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      v12 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 84);
      if ((v12 & 8) != 0)
      {
        v9 = 0;
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v14 = 2;
      }
      else
      {
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v9 = 0;
        if ((v12 & 4) != 0)
          v14 = 3;
        else
          v14 = 4;
      }
      *(_QWORD *)(v13 + 24) = v14;
    }
    +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v18 = CFSTR("NO");
      if (v9)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      if (v4)
        v18 = CFSTR("YES");
      v20 = *(unsigned int *)(v16 + 84);
      *(_DWORD *)buf = 138413314;
      v24 = v16;
      v25 = 1024;
      v26 = v17;
      v27 = 2112;
      v28 = v19;
      v29 = 2112;
      v30 = v18;
      v31 = 2048;
      v32 = v20;
      _os_log_impl(&dword_1CBC1B000, v15, OS_LOG_TYPE_DEFAULT, "%@ interface5GMode? 5G mode is %d {isSmartDataModeEnabled: %@, isSmartDataModeSupported: %@, currentDataBearerSoMask: %llu}", buf, 0x30u);
    }

  }
  else
  {
    +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_DWORD *)(v10 + 80);
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      v25 = 1024;
      v26 = v11;
      _os_log_impl(&dword_1CBC1B000, v5, OS_LOG_TYPE_DEFAULT, "%@ interface5GMode? Current RAT is not 5G %d", buf, 0x12u);
    }
  }

}

- (NSString)networkCode
{
  void *v3;
  void *v4;
  CoreTelephonyClient *ctClient;
  void *v6;
  unint64_t v7;
  CoreTelephonyClient *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  id v14;
  id v15;

  -[PCWWANUsabilityMonitor _currentDataSimContext](self, "_currentDataSimContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  if (v4)
  {
    ctClient = self->_ctClient;
    v15 = 0;
    v6 = (void *)-[CoreTelephonyClient copyMobileCountryCode:error:](ctClient, "copyMobileCountryCode:error:", v4, &v15);
    v7 = (unint64_t)v15;
    v8 = self->_ctClient;
    v14 = 0;
    v9 = (void *)-[CoreTelephonyClient copyMobileNetworkCode:error:](v8, "copyMobileNetworkCode:error:", v4, &v14);
    v10 = (unint64_t)v14;
    if (v7 | v10)
    {
      +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[PCWWANUsabilityMonitor networkCode].cold.1();

      v12 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v6, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v12 = 0;
  }

  return (NSString *)v12;
}

- (id)_currentDataSimContext
{
  NSObject *ivarQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PCWWANUsabilityMonitor__currentDataSimContext__block_invoke;
  v5[3] = &unk_1E8743728;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__PCWWANUsabilityMonitor__currentDataSimContext__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
}

- (__CFString)wwanInterfaceName
{
  NSObject *ivarQueue;
  void *v3;
  __CFString *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  ivarQueue = self->_ivarQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PCWWANUsabilityMonitor_wwanInterfaceName__block_invoke;
  v6[3] = &unk_1E8743728;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(ivarQueue, v6);
  v3 = (void *)v8[5];
  if (v3)
    v4 = (__CFString *)CFAutorelease(v3);
  else
    v4 = 0;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __43__PCWWANUsabilityMonitor_wwanInterfaceName__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "currentInterfaceName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_forwardConfigurationOnIvarQueue
{
  -[PCInterfaceUsabilityMonitor setTrackUsability:](self->_interfaceMonitor, "setTrackUsability:", self->_trackUsability);
  -[PCInterfaceUsabilityMonitor setTrackedTimeInterval:](self->_interfaceMonitor, "setTrackedTimeInterval:", self->_trackedTimeInterval);
  -[PCInterfaceUsabilityMonitor setThresholdOffTransitionCount:](self->_interfaceMonitor, "setThresholdOffTransitionCount:", self->_thresholdOffTransitionCount);
}

- (void)setTrackUsability:(BOOL)a3
{
  NSObject *ivarQueue;
  _QWORD v4[5];
  BOOL v5;

  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__PCWWANUsabilityMonitor_setTrackUsability___block_invoke;
  v4[3] = &unk_1E87436D8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(ivarQueue, v4);
}

uint64_t __44__PCWWANUsabilityMonitor_setTrackUsability___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 42) != v2)
  {
    *(_BYTE *)(v1 + 42) = v2;
    v3 = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(v3 + 42))
    {
      if (!*(_QWORD *)(v3 + 48))
      {
        *(_QWORD *)(v3 + 48) = 2;
        v3 = *(_QWORD *)(result + 32);
      }
      if (*(double *)(v3 + 56) == 0.0)
      {
        *(_QWORD *)(v3 + 56) = 0x4082C00000000000;
        v3 = *(_QWORD *)(result + 32);
      }
    }
    return objc_msgSend((id)v3, "_forwardConfigurationOnIvarQueue");
  }
  return result;
}

- (void)setThresholdOffTransitionCount:(unint64_t)a3
{
  NSObject *ivarQueue;
  _QWORD v4[6];

  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PCWWANUsabilityMonitor_setThresholdOffTransitionCount___block_invoke;
  v4[3] = &unk_1E8743700;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(ivarQueue, v4);
}

uint64_t __57__PCWWANUsabilityMonitor_setThresholdOffTransitionCount___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  v1 = *(_QWORD *)(result + 40);
  if (v1 != *(_QWORD *)(v2 + 48))
  {
    *(_QWORD *)(v2 + 48) = v1;
    return objc_msgSend(*(id *)(result + 32), "_forwardConfigurationOnIvarQueue");
  }
  return result;
}

- (void)setTrackedTimeInterval:(double)a3
{
  NSObject *ivarQueue;
  _QWORD v4[6];

  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__PCWWANUsabilityMonitor_setTrackedTimeInterval___block_invoke;
  v4[3] = &unk_1E8743700;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_async(ivarQueue, v4);
}

uint64_t __49__PCWWANUsabilityMonitor_setTrackedTimeInterval___block_invoke(uint64_t result)
{
  double v1;
  uint64_t v2;

  v1 = *(double *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(double *)(v2 + 56))
  {
    *(double *)(v2 + 56) = v1;
    return objc_msgSend(*(id *)(result + 32), "_forwardConfigurationOnIvarQueue");
  }
  return result;
}

- (int64_t)interfaceIdentifier
{
  return 1;
}

- (BOOL)isInterfaceHistoricallyUsable
{
  NSObject *ivarQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PCWWANUsabilityMonitor_isInterfaceHistoricallyUsable__block_invoke;
  v5[3] = &unk_1E87435D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__55__PCWWANUsabilityMonitor_isInterfaceHistoricallyUsable__block_invoke(uint64_t a1)
{
  void *result;
  BOOL v3;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (result)
  {
    result = (void *)objc_msgSend(result, "isInterfaceHistoricallyUsable");
    if ((_DWORD)result)
      v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) == 0;
    else
      v3 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)isInternetReachable
{
  NSObject *ivarQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PCWWANUsabilityMonitor_isInternetReachable__block_invoke;
  v5[3] = &unk_1E87435D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__45__PCWWANUsabilityMonitor_isInternetReachable__block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (result)
  {
    result = (void *)objc_msgSend(result, "isInternetReachable");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)isPoorLinkQuality
{
  return +[PCInterfaceUsabilityMonitor isPoorLinkQuality:](PCInterfaceUsabilityMonitor, "isPoorLinkQuality:", -[PCWWANUsabilityMonitor linkQuality](self, "linkQuality"));
}

- (BOOL)isBadLinkQuality
{
  return +[PCInterfaceUsabilityMonitor isBadLinkQuality:](PCInterfaceUsabilityMonitor, "isBadLinkQuality:", -[PCWWANUsabilityMonitor linkQuality](self, "linkQuality"));
}

- (BOOL)isRadioHot
{
  NSObject *ivarQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PCWWANUsabilityMonitor_isRadioHot__block_invoke;
  v5[3] = &unk_1E8743728;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__PCWWANUsabilityMonitor_isRadioHot__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 41);
  return result;
}

- (int64_t)interfaceConstraint
{
  NSObject *ivarQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PCWWANUsabilityMonitor_interfaceConstraint__block_invoke;
  v5[3] = &unk_1E87435D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__45__PCWWANUsabilityMonitor_interfaceConstraint__block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (result)
    result = (void *)objc_msgSend(result, "interfaceConstraint");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (PCInterfaceUsabilityMonitorDelegate)delegate
{
  NSObject *ivarQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PCWWANUsabilityMonitor_delegate__block_invoke;
  v5[3] = &unk_1E8743728;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PCInterfaceUsabilityMonitorDelegate *)v3;
}

void __34__PCWWANUsabilityMonitor_delegate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "object");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *ivarQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PCWWANUsabilityMonitor_setDelegate___block_invoke;
  block[3] = &unk_1E8743238;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(ivarQueue, block);

}

void __38__PCWWANUsabilityMonitor_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

  }
}

- (void)_callDelegateOnIvarQueueWithBlock:(id)a3
{
  id v4;
  CUTWeakReference *delegateReference;
  CUTWeakReference *v6;
  NSObject *delegateQueue;
  CUTWeakReference *v8;
  _QWORD v9[4];
  CUTWeakReference *v10;
  id v11;

  v4 = a3;
  delegateReference = self->_delegateReference;
  if (delegateReference && self->_delegateQueue)
  {
    v6 = delegateReference;
    delegateQueue = self->_delegateQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__PCWWANUsabilityMonitor__callDelegateOnIvarQueueWithBlock___block_invoke;
    v9[3] = &unk_1E8743638;
    v10 = v6;
    v11 = v4;
    v8 = v6;
    dispatch_async(delegateQueue, v9);

  }
}

void __60__PCWWANUsabilityMonitor__callDelegateOnIvarQueueWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1D17A4604]();
  objc_msgSend(*(id *)(a1 + 32), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v2);
}

- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4
{
  id v6;
  NSObject *ivarQueue;
  id v8;
  _QWORD block[4];
  id v10;
  PCWWANUsabilityMonitor *v11;
  int v12;

  v6 = a3;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PCWWANUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke;
  block[3] = &unk_1E87437C0;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(ivarQueue, block);

}

_QWORD *__74__PCWWANUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  _QWORD v4[5];
  int v5;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[9])
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __74__PCWWANUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke_2;
    v4[3] = &unk_1E87436B0;
    v4[4] = result;
    v5 = *(_DWORD *)(a1 + 48);
    return (_QWORD *)objc_msgSend(result, "_callDelegateOnIvarQueueWithBlock:", v4);
  }
  return result;
}

void __74__PCWWANUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "interfaceLinkQualityChanged:previousLinkQuality:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));

}

- (void)interfaceReachabilityChanged:(id)a3
{
  id v4;
  NSObject *ivarQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  PCWWANUsabilityMonitor *v9;

  v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PCWWANUsabilityMonitor_interfaceReachabilityChanged___block_invoke;
  v7[3] = &unk_1E8743238;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(ivarQueue, v7);

}

_QWORD *__55__PCWWANUsabilityMonitor_interfaceReachabilityChanged___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;
  _QWORD v3[5];

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[9])
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __55__PCWWANUsabilityMonitor_interfaceReachabilityChanged___block_invoke_2;
    v3[3] = &unk_1E8743688;
    v3[4] = result;
    return (_QWORD *)objc_msgSend(result, "_callDelegateOnIvarQueueWithBlock:", v3);
  }
  return result;
}

void __55__PCWWANUsabilityMonitor_interfaceReachabilityChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "interfaceReachabilityChanged:", *(_QWORD *)(a1 + 32));

}

- (void)interfaceConstraintChanged:(id)a3
{
  id v4;
  NSObject *ivarQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  PCWWANUsabilityMonitor *v9;

  v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PCWWANUsabilityMonitor_interfaceConstraintChanged___block_invoke;
  v7[3] = &unk_1E8743238;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(ivarQueue, v7);

}

_QWORD *__53__PCWWANUsabilityMonitor_interfaceConstraintChanged___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;
  _QWORD v3[5];

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[9])
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __53__PCWWANUsabilityMonitor_interfaceConstraintChanged___block_invoke_2;
    v3[3] = &unk_1E8743688;
    v3[4] = result;
    return (_QWORD *)objc_msgSend(result, "_callDelegateOnIvarQueueWithBlock:", v3);
  }
  return result;
}

void __53__PCWWANUsabilityMonitor_interfaceConstraintChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "interfaceConstraintChanged:", *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDataSimContext, 0);
  objc_storeStrong((id *)&self->_ctServerQueue, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_interfaceMonitor, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_delegateReference, 0);
  objc_storeStrong((id *)&self->_monitorDelegateQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

- (void)networkCode
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1CBC1B000, v0, v1, "Failed to copy mobile network code. {MCC error: %@; MNC error: %@}");
  OUTLINED_FUNCTION_1();
}

@end
