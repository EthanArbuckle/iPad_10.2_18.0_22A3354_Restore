@implementation PCInterfaceMonitor

- (int)linkQuality
{
  return -[PCInterfaceUsabilityMonitorProtocol linkQuality](self->_internal, "linkQuality");
}

+ (id)sharedInstanceForIdentifier:(int64_t)a3
{
  id v3;
  id v5;
  PCInterfaceMonitor *v6;
  id v7;

  if (a3 <= 1)
  {
    v5 = a1;
    objc_sync_enter(v5);
    if (!sharedInstanceForIdentifier__sInstances[a3])
    {
      v6 = -[PCInterfaceMonitor initWithInterfaceIdentifier:]([PCInterfaceMonitor alloc], "initWithInterfaceIdentifier:", a3);
      v7 = sharedInstanceForIdentifier__sInstances[a3];
      sharedInstanceForIdentifier__sInstances[a3] = v6;

    }
    objc_sync_exit(v5);

    v3 = sharedInstanceForIdentifier__sInstances[a3];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isInterfaceUsable
{
  return -[PCInterfaceUsabilityMonitorProtocol isInterfaceUsable](self->_internal, "isInterfaceUsable");
}

- (NSString)linkQualityString
{
  return (NSString *)-[PCInterfaceUsabilityMonitorProtocol linkQualityString](self->_internal, "linkQualityString");
}

- (BOOL)isLTEWithCDRX
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[PCInterfaceUsabilityMonitorProtocol isLTEWithCDRX](self->_internal, "isLTEWithCDRX");
  else
    return 0;
}

- (int)currentRAT
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[PCInterfaceUsabilityMonitorProtocol currentRAT](self->_internal, "currentRAT");
  else
    return -1;
}

+ (BOOL)isNetworkingPowerExpensiveToUse
{
  void *v2;
  void *v3;
  int v4;

  +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isBadLinkQuality"))
  {
    +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isInterfaceUsable") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (PCInterfaceMonitor)initWithInterfaceIdentifier:(int64_t)a3
{
  PCInterfaceMonitor *v4;
  dispatch_queue_t v5;
  __objc2_class *v6;
  uint64_t v7;
  PCInterfaceUsabilityMonitorProtocol *internal;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PCInterfaceMonitor;
  v4 = -[PCInterfaceMonitor init](&v10, sel_init);
  if (v4)
  {
    if (a3 == 1)
    {
      v5 = dispatch_queue_create("PCInterfaceMonitor-WWAN", 0);
      v6 = PCWWANUsabilityMonitor;
    }
    else
    {
      if (a3)
      {
LABEL_7:
        -[PCInterfaceUsabilityMonitorProtocol setTrackUsability:](v4->_internal, "setTrackUsability:", 1);
        -[PCInterfaceUsabilityMonitorProtocol setDelegate:](v4->_internal, "setDelegate:", v4);
        return v4;
      }
      v5 = dispatch_queue_create("PCInterfaceMonitor-NonCellular", 0);
      v6 = PCNonCellularUsabilityMonitor;
    }
    v7 = objc_msgSend([v6 alloc], "initWithDelegateQueue:", v5);
    internal = v4->_internal;
    v4->_internal = (PCInterfaceUsabilityMonitorProtocol *)v7;

    -[PCInterfaceUsabilityMonitorProtocol setDelegate:](v4->_internal, "setDelegate:", v4);
    goto LABEL_7;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[PCInterfaceUsabilityMonitorProtocol setDelegate:](self->_internal, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PCInterfaceMonitor;
  -[PCInterfaceMonitor dealloc](&v3, sel_dealloc);
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  unint64_t v6;
  PCInterfaceMonitor *v7;
  uint64_t v8;
  NSMapTable *delegateMap;
  unint64_t v10;

  v10 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (v10 | v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    if (!v7->_delegateMap)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 512, 1);
      delegateMap = v7->_delegateMap;
      v7->_delegateMap = (NSMapTable *)v8;

    }
    if (v10 && v6)
    {
      -[NSMapTable setObject:forKey:](v7->_delegateMap, "setObject:forKey:", v6, v10);
    }
    else if (v10)
    {
      -[NSMapTable removeObjectForKey:](v7->_delegateMap, "removeObjectForKey:", v10);
    }
    objc_sync_exit(v7);

  }
}

- (void)removeDelegate:(id)a3
{
  id v4;
  PCInterfaceMonitor *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMapTable removeObjectForKey:](v5->_delegateMap, "removeObjectForKey:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4
{
  PCInterfaceMonitor *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  _QWORD block[6];
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v7 = (void *)-[NSMapTable copy](v6->_delegateMap, "copy");
  objc_sync_exit(v6);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "objectForKey:", v12, v14);
          v13 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __70__PCInterfaceMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke;
          block[3] = &unk_1E87437C0;
          block[4] = v12;
          block[5] = v6;
          v16 = a4;
          dispatch_async(v13, block);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

void __70__PCInterfaceMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D17A4604]();
  objc_msgSend(*(id *)(a1 + 32), "interfaceLinkQualityChanged:previousLinkQuality:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
}

- (void)interfaceReachabilityChanged:(id)a3
{
  PCInterfaceMonitor *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD block[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)-[NSMapTable copy](v4->_delegateMap, "copy");
  objc_sync_exit(v4);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "objectForKey:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __51__PCInterfaceMonitor_interfaceReachabilityChanged___block_invoke;
          block[3] = &unk_1E8743238;
          block[4] = v10;
          block[5] = v4;
          dispatch_async(v11, block);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

void __51__PCInterfaceMonitor_interfaceReachabilityChanged___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D17A4604]();
  objc_msgSend(*(id *)(a1 + 32), "interfaceReachabilityChanged:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)interfaceRadioHotnessChanged:(id)a3
{
  PCInterfaceMonitor *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD block[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)-[NSMapTable copy](v4->_delegateMap, "copy");
  objc_sync_exit(v4);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "objectForKey:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __51__PCInterfaceMonitor_interfaceRadioHotnessChanged___block_invoke;
          block[3] = &unk_1E8743238;
          block[4] = v10;
          block[5] = v4;
          dispatch_async(v11, block);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

void __51__PCInterfaceMonitor_interfaceRadioHotnessChanged___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D17A4604]();
  objc_msgSend(*(id *)(a1 + 32), "interfaceRadioHotnessChanged:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)interfaceConstraintChanged:(id)a3
{
  PCInterfaceMonitor *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD block[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)-[NSMapTable copy](v4->_delegateMap, "copy");
  objc_sync_exit(v4);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "objectForKey:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __49__PCInterfaceMonitor_interfaceConstraintChanged___block_invoke;
          block[3] = &unk_1E8743238;
          block[4] = v10;
          block[5] = v4;
          dispatch_async(v11, block);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

void __49__PCInterfaceMonitor_interfaceConstraintChanged___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D17A4604]();
  objc_msgSend(*(id *)(a1 + 32), "interfaceConstraintChanged:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (int64_t)interfaceIdentifier
{
  return -[PCInterfaceUsabilityMonitorProtocol interfaceIdentifier](self->_internal, "interfaceIdentifier");
}

- (BOOL)isInterfaceHistoricallyUsable
{
  return -[PCInterfaceUsabilityMonitorProtocol isInterfaceHistoricallyUsable](self->_internal, "isInterfaceHistoricallyUsable");
}

- (BOOL)isInternetReachable
{
  return -[PCInterfaceUsabilityMonitorProtocol isInternetReachable](self->_internal, "isInternetReachable");
}

- (BOOL)isPoorLinkQuality
{
  return -[PCInterfaceUsabilityMonitorProtocol isPoorLinkQuality](self->_internal, "isPoorLinkQuality");
}

- (BOOL)isBadLinkQuality
{
  return -[PCInterfaceUsabilityMonitorProtocol isBadLinkQuality](self->_internal, "isBadLinkQuality");
}

- (BOOL)isRadioHot
{
  return -[PCInterfaceUsabilityMonitorProtocol isRadioHot](self->_internal, "isRadioHot");
}

- (int64_t)interfaceConstraint
{
  return -[PCInterfaceUsabilityMonitorProtocol interfaceConstraint](self->_internal, "interfaceConstraint");
}

- (BOOL)isNetworkingPowerExpensiveToUse
{
  return -[PCInterfaceUsabilityMonitorProtocol isNetworkingPowerExpensiveToUse](self->_internal, "isNetworkingPowerExpensiveToUse");
}

- (__CFString)wwanInterfaceName
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (__CFString *)-[PCInterfaceUsabilityMonitorProtocol wwanInterfaceName](self->_internal, "wwanInterfaceName");
  else
    return 0;
}

- (unint64_t)interface5GMode
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[PCInterfaceUsabilityMonitorProtocol interface5GMode](self->_internal, "interface5GMode");
  else
    return 0;
}

- (NSString)networkCode
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PCInterfaceUsabilityMonitorProtocol networkCode](self->_internal, "networkCode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

+ (id)stringForLinkQuality:(int)a3
{
  return +[PCInterfaceUsabilityMonitor stringForLinkQuality:](PCInterfaceUsabilityMonitor, "stringForLinkQuality:", *(_QWORD *)&a3);
}

+ (BOOL)isPoorLinkQuality:(int)a3
{
  return +[PCInterfaceUsabilityMonitor isPoorLinkQuality:](PCInterfaceUsabilityMonitor, "isPoorLinkQuality:", *(_QWORD *)&a3);
}

+ (BOOL)isBadLinkQuality:(int)a3
{
  return +[PCInterfaceUsabilityMonitor isBadLinkQuality:](PCInterfaceUsabilityMonitor, "isBadLinkQuality:", *(_QWORD *)&a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateMap, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
