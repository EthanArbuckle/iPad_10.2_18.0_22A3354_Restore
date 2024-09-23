@implementation PCNonCellularUsabilityMonitor

- (BOOL)isInterfaceUsable
{
  return self->_demoOverrideInterface
      || -[PCInterfaceUsabilityMonitor isInterfaceUsable](self->_monitor, "isInterfaceUsable");
}

- (NSString)linkQualityString
{
  return (NSString *)+[PCInterfaceUsabilityMonitor stringForLinkQuality:](PCInterfaceUsabilityMonitor, "stringForLinkQuality:", -[PCNonCellularUsabilityMonitor linkQuality](self, "linkQuality"));
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
  v5[2] = __44__PCNonCellularUsabilityMonitor_linkQuality__block_invoke;
  v5[3] = &unk_1E8743728;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__PCNonCellularUsabilityMonitor_linkQuality__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_linkQualityOnIvarQueue");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)_linkQualityOnIvarQueue
{
  int v2;
  int result;

  if (self->_demoOverrideInterface)
    v2 = 100;
  else
    v2 = -2;
  result = -[PCInterfaceUsabilityMonitor linkQuality](self->_monitor, "linkQuality");
  if (v2 > result)
    return v2;
  return result;
}

- (PCNonCellularUsabilityMonitor)initWithDelegateQueue:(id)a3
{
  id v5;
  PCNonCellularUsabilityMonitor *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *ivarQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *monitorDelegateQueue;
  NSString *v11;
  NSString *demoOverrideInterface;
  NSObject *v13;
  NSString *v14;
  objc_super v16;
  uint8_t buf[4];
  PCNonCellularUsabilityMonitor *v18;
  __int16 v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PCNonCellularUsabilityMonitor;
  v6 = -[PCNonCellularUsabilityMonitor init](&v16, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("PCNonCellularUsabilityMonitor-ivarqueue", 0);
    ivarQueue = v6->_ivarQueue;
    v6->_ivarQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("PCNonCellularUsabilityMonitor-monitordelegatequeue", 0);
    monitorDelegateQueue = v6->_monitorDelegateQueue;
    v6->_monitorDelegateQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_delegateQueue, a3);
    v6->_previousLinkQuality = -2;
    v11 = (NSString *)CFPreferencesCopyAppValue(CFSTR("PCWiFiInterface"), CFSTR("com.apple.persistentconnection"));
    demoOverrideInterface = v6->_demoOverrideInterface;
    v6->_demoOverrideInterface = v11;

    if (v6->_demoOverrideInterface)
    {
      +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v6->_demoOverrideInterface;
        *(_DWORD *)buf = 138543618;
        v18 = v6;
        v19 = 2114;
        v20 = v14;
        _os_log_impl(&dword_1CBC1B000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ NonCellularUsabilityMonitor is in demo override mode! (interface name %{public}@)", buf, 0x16u);
      }

    }
    -[PCNonCellularUsabilityMonitor _addMonitor](v6, "_addMonitor");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[PCInterfaceUsabilityMonitor setDelegate:](self->_monitor, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PCNonCellularUsabilityMonitor;
  -[PCNonCellularUsabilityMonitor dealloc](&v3, sel_dealloc);
}

- (void)_addMonitor
{
  NSObject *ivarQueue;
  _QWORD block[5];

  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PCNonCellularUsabilityMonitor__addMonitor__block_invoke;
  block[3] = &unk_1E8743348;
  block[4] = self;
  dispatch_async(ivarQueue, block);
}

void __44__PCNonCellularUsabilityMonitor__addMonitor__block_invoke(uint64_t a1)
{
  void *v2;
  PCInterfaceUsabilityMonitor *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)MEMORY[0x1D17A4604]();
  v3 = -[PCInterfaceUsabilityMonitor initWithInterfaceIdentifier:delegateQueue:]([PCInterfaceUsabilityMonitor alloc], "initWithInterfaceIdentifier:delegateQueue:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setDelegate:");
  objc_autoreleasePoolPop(v2);
}

- (void)_forwardConfigurationOnIvarQueue
{
  -[PCInterfaceUsabilityMonitor setTrackUsability:](self->_monitor, "setTrackUsability:", self->_trackUsability);
  -[PCInterfaceUsabilityMonitor setTrackedTimeInterval:](self->_monitor, "setTrackedTimeInterval:", self->_trackedTimeInterval);
  -[PCInterfaceUsabilityMonitor setThresholdOffTransitionCount:](self->_monitor, "setThresholdOffTransitionCount:", self->_thresholdOffTransitionCount);
}

- (void)setTrackUsability:(BOOL)a3
{
  NSObject *ivarQueue;
  _QWORD v4[5];
  BOOL v5;

  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PCNonCellularUsabilityMonitor_setTrackUsability___block_invoke;
  v4[3] = &unk_1E87436D8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(ivarQueue, v4);
}

uint64_t __51__PCNonCellularUsabilityMonitor_setTrackUsability___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 52) != v2)
  {
    *(_BYTE *)(v1 + 52) = v2;
    v3 = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(v3 + 52))
    {
      if (!*(_QWORD *)(v3 + 56))
      {
        *(_QWORD *)(v3 + 56) = 2;
        v3 = *(_QWORD *)(result + 32);
      }
      if (*(double *)(v3 + 64) == 0.0)
      {
        *(_QWORD *)(v3 + 64) = 0x4082C00000000000;
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
  v4[2] = __64__PCNonCellularUsabilityMonitor_setThresholdOffTransitionCount___block_invoke;
  v4[3] = &unk_1E8743700;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(ivarQueue, v4);
}

uint64_t __64__PCNonCellularUsabilityMonitor_setThresholdOffTransitionCount___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  v1 = *(_QWORD *)(result + 40);
  if (v1 != *(_QWORD *)(v2 + 56))
  {
    *(_QWORD *)(v2 + 56) = v1;
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
  v4[2] = __56__PCNonCellularUsabilityMonitor_setTrackedTimeInterval___block_invoke;
  v4[3] = &unk_1E8743700;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_async(ivarQueue, v4);
}

uint64_t __56__PCNonCellularUsabilityMonitor_setTrackedTimeInterval___block_invoke(uint64_t result)
{
  double v1;
  uint64_t v2;

  v1 = *(double *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(double *)(v2 + 64))
  {
    *(double *)(v2 + 64) = v1;
    return objc_msgSend(*(id *)(result + 32), "_forwardConfigurationOnIvarQueue");
  }
  return result;
}

- (int64_t)interfaceIdentifier
{
  return 0;
}

- (BOOL)isInterfaceHistoricallyUsable
{
  return -[PCInterfaceUsabilityMonitor isInterfaceHistoricallyUsable](self->_monitor, "isInterfaceHistoricallyUsable");
}

- (BOOL)isInternetReachable
{
  return self->_demoOverrideInterface
      || -[PCInterfaceUsabilityMonitor isInternetReachable](self->_monitor, "isInternetReachable");
}

- (BOOL)isPoorLinkQuality
{
  return +[PCInterfaceUsabilityMonitor isPoorLinkQuality:](PCInterfaceUsabilityMonitor, "isPoorLinkQuality:", -[PCNonCellularUsabilityMonitor linkQuality](self, "linkQuality"));
}

- (BOOL)isBadLinkQuality
{
  return +[PCInterfaceUsabilityMonitor isBadLinkQuality:](PCInterfaceUsabilityMonitor, "isBadLinkQuality:", -[PCNonCellularUsabilityMonitor linkQuality](self, "linkQuality"));
}

- (BOOL)isRadioHot
{
  return 1;
}

- (int64_t)interfaceConstraint
{
  return 0;
}

- (BOOL)isNetworkingPowerExpensiveToUse
{
  return 0;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PCNonCellularUsabilityMonitor_delegate__block_invoke;
  v5[3] = &unk_1E8743728;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PCInterfaceUsabilityMonitorDelegate *)v3;
}

void __41__PCNonCellularUsabilityMonitor_delegate__block_invoke(uint64_t a1)
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
  block[2] = __45__PCNonCellularUsabilityMonitor_setDelegate___block_invoke;
  block[3] = &unk_1E8743238;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(ivarQueue, block);

}

void __45__PCNonCellularUsabilityMonitor_setDelegate___block_invoke(uint64_t a1)
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
    v9[2] = __67__PCNonCellularUsabilityMonitor__callDelegateOnIvarQueueWithBlock___block_invoke;
    v9[3] = &unk_1E8743638;
    v10 = v6;
    v11 = v4;
    v8 = v6;
    dispatch_async(delegateQueue, v9);

  }
}

void __67__PCNonCellularUsabilityMonitor__callDelegateOnIvarQueueWithBlock___block_invoke(uint64_t a1)
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
  NSObject *ivarQueue;
  _QWORD block[5];

  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PCNonCellularUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke;
  block[3] = &unk_1E8743348;
  block[4] = self;
  dispatch_async(ivarQueue, block);
}

uint64_t __81__PCNonCellularUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  int v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "_linkQualityOnIvarQueue");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(v3 + 48);
  if ((_DWORD)result != v4)
  {
    v5 = result;
    *(_DWORD *)(v3 + 48) = result;
    +[PCLog usabilityMonitor](PCLog, "usabilityMonitor");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v12 = v7;
      v13 = 1024;
      v14 = v4;
      v15 = 1024;
      v16 = v5;
      _os_log_impl(&dword_1CBC1B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ NonCellularUsabilityMonitor - LQ changed from %d to %d", buf, 0x18u);
    }

    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__PCNonCellularUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke_6;
    v9[3] = &unk_1E87436B0;
    v9[4] = v8;
    v10 = v4;
    return objc_msgSend(v8, "_callDelegateOnIvarQueueWithBlock:", v9);
  }
  return result;
}

void __81__PCNonCellularUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke_6(uint64_t a1, void *a2)
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
  _QWORD v7[5];
  id v8;

  v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PCNonCellularUsabilityMonitor_interfaceReachabilityChanged___block_invoke;
  v7[3] = &unk_1E8743238;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(ivarQueue, v7);

}

_QWORD *__62__PCNonCellularUsabilityMonitor_interfaceReachabilityChanged___block_invoke(uint64_t a1)
{
  _QWORD *result;
  _QWORD v3[5];

  result = *(_QWORD **)(a1 + 32);
  if (result[9] == *(_QWORD *)(a1 + 40))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __62__PCNonCellularUsabilityMonitor_interfaceReachabilityChanged___block_invoke_2;
    v3[3] = &unk_1E8743688;
    v3[4] = result;
    return (_QWORD *)objc_msgSend(result, "_callDelegateOnIvarQueueWithBlock:", v3);
  }
  return result;
}

void __62__PCNonCellularUsabilityMonitor_interfaceReachabilityChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "interfaceReachabilityChanged:", *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_demoOverrideInterface, 0);
  objc_storeStrong((id *)&self->_delegateReference, 0);
  objc_storeStrong((id *)&self->_monitorDelegateQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

@end
