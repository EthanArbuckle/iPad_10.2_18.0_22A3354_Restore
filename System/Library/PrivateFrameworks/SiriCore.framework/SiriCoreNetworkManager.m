@implementation SiriCoreNetworkManager

- (id)_init
{
  SiriCoreNetworkManager *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSHashTable *observers;
  uint64_t v9;
  CoreTelephonyClient *coreTelephonyClient;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SiriCoreNetworkManager;
  v2 = -[SiriCoreNetworkManager init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UNSPECIFIED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("SiriCoreNetworkManager", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 5, 1);
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v7;

    v2->_pathStatus = 0;
    v2->_ctLock._os_unfair_lock_opaque = 0;
    v2->_lastDataSubscriptionSlot = 0;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v2->_queue);
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v9;

    -[CoreTelephonyClient setDelegate:](v2->_coreTelephonyClient, "setDelegate:", v2);
    -[SiriCoreNetworkManager carrierBundleChange:](v2, "carrierBundleChange:", 0);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  CoreTelephonyClient *coreTelephonyClient;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SiriCoreNetworkManager dealloc]";
    _os_log_impl(&dword_211AB2000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (self->_pathEvaluator)
    nw_path_evaluator_cancel();
  coreTelephonyClient = self->_coreTelephonyClient;
  if (coreTelephonyClient)
    -[CoreTelephonyClient setDelegate:](coreTelephonyClient, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SiriCoreNetworkManager;
  -[SiriCoreNetworkManager dealloc](&v5, sel_dealloc);
}

- (void)addObserver:(id)a3
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
  v7[2] = __38__SiriCoreNetworkManager_addObserver___block_invoke;
  v7[3] = &unk_24CCE6BD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeObserver:(id)a3
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
  v7[2] = __41__SiriCoreNetworkManager_removeObserver___block_invoke;
  v7[3] = &unk_24CCE6BD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)_wiFiManagerClient
{
  SiriCoreWiFiManagerClient *wiFiManagerClient;
  SiriCoreWiFiManagerClient *v4;
  SiriCoreWiFiManagerClient *v5;

  wiFiManagerClient = self->_wiFiManagerClient;
  if (!wiFiManagerClient)
  {
    v4 = objc_alloc_init(SiriCoreWiFiManagerClient);
    v5 = self->_wiFiManagerClient;
    self->_wiFiManagerClient = v4;

    wiFiManagerClient = self->_wiFiManagerClient;
  }
  return wiFiManagerClient;
}

- (void)_pathUpdated:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  nw_path_status_t status;
  _BOOL4 v7;
  NSObject *v8;
  char v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  nw_path_status_t v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    status = nw_path_get_status(v4);
    v7 = nw_path_uses_interface_type(v5, nw_interface_type_cellular);
  }
  else
  {
    v7 = 0;
    status = nw_path_status_invalid;
  }
  if (status != self->_pathStatus || self->_pathUsesCellular != v7)
  {
    v8 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v31 = "-[SiriCoreNetworkManager _pathUpdated:]";
      v32 = 1024;
      v33 = status;
      v34 = 1024;
      v35 = v7;
      _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_DEFAULT, "%s status %d, usesCellular %d", buf, 0x18u);
    }
    v9 = status != nw_path_status_satisfied || v7;
    if (!self->_pathUsesCellular || (v9 & 1) != 0)
    {
      if (self->_pathUsesCellular || !v7)
        goto LABEL_33;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = self->_observers;
      v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v21 != v18)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "networkManagerLostNonWWANConnectivity:", self, (_QWORD)v20);
          }
          v17 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        }
        while (v17);
      }
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v10 = self->_observers;
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "networkManagerNonWWANDidBecomeAvailable:", self);
          }
          v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v12);
      }
    }

LABEL_33:
    self->_pathStatus = status;
    self->_pathUsesCellular = v7;
  }

}

- (void)startMonitoringNetworkForHost:(id)a3
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
  v7[2] = __56__SiriCoreNetworkManager_startMonitoringNetworkForHost___block_invoke;
  v7[3] = &unk_24CCE6BD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_stopMonitoringNetwork
{
  OS_nw_path_evaluator *pathEvaluator;

  if (self->_pathEvaluator)
  {
    nw_path_evaluator_cancel();
    pathEvaluator = self->_pathEvaluator;
    self->_pathEvaluator = 0;

  }
}

- (void)stopMonitoringNetwork
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SiriCoreNetworkManager_stopMonitoringNetwork__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)getNetworkPerformanceFeed
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x24BE09218], "sharedObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SiriCoreNetworkManager_getNetworkPerformanceFeed__block_invoke;
  v4[3] = &unk_24CCE6708;
  v4[4] = self;
  objc_msgSend(v3, "getCurrentConditionWithCompletion:", v4);

}

- (int64_t)cellularNetworkQuality
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__SiriCoreNetworkManager_cellularNetworkQuality__block_invoke;
  v5[3] = &unk_24CCE6730;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)wifiNetworkQuality
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SiriCoreNetworkManager_wifiNetworkQuality__block_invoke;
  v5[3] = &unk_24CCE6730;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)anyNetworkQuality
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__SiriCoreNetworkManager_anyNetworkQuality__block_invoke;
  v5[3] = &unk_24CCE6730;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)getQualityReport:(id)a3
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
  v7[2] = __43__SiriCoreNetworkManager_getQualityReport___block_invoke;
  v7[3] = &unk_24CCE6758;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (int64_t)_reportCellularInstantQuality
{
  if (!self->_hasSymptomsBasedInstantCellQuality)
    return 0;
  if (self->_symptomsBasedInstantCellQualityIsGood)
    return 1;
  return 2;
}

- (int64_t)_reportCellularHistoricalQuality
{
  if (!self->_hasSymptomsBasedHistoricalCellQuality)
    return 0;
  if (self->_symptomsBasedHistoricalCellQualityIsGood)
    return 1;
  return 2;
}

- (int64_t)_reportWiFiInstantQuality
{
  if (!self->_hasSymptomsBasedInstantWiFiQuality)
    return 0;
  if (self->_symptomsBasedInstantWiFiQualityIsGood)
    return 1;
  return 2;
}

- (int64_t)_reportWiFiHistoricalQuality
{
  if (!self->_hasSymptomsBasedHistoricalWiFiQuality)
    return 0;
  if (self->_symptomsBasedHistoricalWiFiQualityIsGood)
    return 1;
  return 2;
}

- (void)getSignalStrength:(id *)a3 subscriptionCount:(unint64_t *)a4
{
  os_unfair_lock_s *p_ctLock;
  unint64_t subscriptionCount;
  void *v9;
  id v10;

  p_ctLock = &self->_ctLock;
  os_unfair_lock_lock(&self->_ctLock);
  v10 = (id)-[NSNumber copy](self->_lastSignalStrength, "copy");
  subscriptionCount = self->_subscriptionCount;
  os_unfair_lock_unlock(p_ctLock);
  if (a4)
    *a4 = subscriptionCount;
  v9 = v10;
  if (a3)
  {
    *a3 = objc_retainAutorelease(v10);
    v9 = v10;
  }

}

- (void)_getCarrierName:(id *)a3
{
  os_unfair_lock_s *p_ctLock;
  int64_t lastDataSubscriptionSlot;
  void *v7;
  id v8;

  p_ctLock = &self->_ctLock;
  os_unfair_lock_lock(&self->_ctLock);
  lastDataSubscriptionSlot = self->_lastDataSubscriptionSlot;
  if (lastDataSubscriptionSlot == 1)
  {
    if (-[NSString isEqualToString:](self->_subscriptionSlotOneStatus, "isEqualToString:", *MEMORY[0x24BDC2D10]))
    {
LABEL_6:
      v8 = (id)-[NSString copy](self->_carrierName, "copy");
      goto LABEL_8;
    }
    lastDataSubscriptionSlot = self->_lastDataSubscriptionSlot;
  }
  if (lastDataSubscriptionSlot == 2
    && -[NSString isEqualToString:](self->_subscriptionSlotTwoStatus, "isEqualToString:", *MEMORY[0x24BDC2D10]))
  {
    goto LABEL_6;
  }
  v8 = 0;
LABEL_8:
  os_unfair_lock_unlock(p_ctLock);
  v7 = v8;
  if (a3)
  {
    *a3 = objc_retainAutorelease(v8);
    v7 = v8;
  }

}

- (int64_t)_getConnectionTechnologyForCellularInterface
{
  os_unfair_lock_s *p_ctLock;
  void *v4;
  os_log_t *v5;
  CoreTelephonyClient *coreTelephonyClient;
  __CFString *v7;
  __CFString *v8;
  NSObject *v9;
  int64_t v10;
  NSObject *v11;
  const __CFString *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  p_ctLock = &self->_ctLock;
  os_unfair_lock_lock(&self->_ctLock);
  v4 = (void *)-[CTServiceDescriptor copy](self->_dataServiceDescriptor, "copy");
  os_unfair_lock_unlock(p_ctLock);
  v5 = (os_log_t *)MEMORY[0x24BE08FB8];
  if (v4)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v14 = 0;
    -[CoreTelephonyClient getCurrentRat:error:](coreTelephonyClient, "getCurrentRat:error:", v4, &v14);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = (__CFString *)v14;
    if (v8)
    {
      v9 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[SiriCoreNetworkManager _getConnectionTechnologyForCellularInterface]";
        v17 = 2112;
        v18 = v8;
        _os_log_impl(&dword_211AB2000, v9, OS_LOG_TYPE_DEFAULT, "%s Error getting current Radio Access Technology: %@", buf, 0x16u);
      }
    }

  }
  else
  {
    v7 = 0;
  }
  if ((-[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x24BDC2600]) & 1) != 0)
  {
    v10 = 2004;
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x24BDC25F8]) & 1) != 0)
  {
    v10 = 2005;
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x24BDC2630]) & 1) != 0)
  {
    v10 = 2006;
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x24BDC2608]) & 1) != 0)
  {
    v10 = 2007;
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x24BDC2610]) & 1) != 0)
  {
    v10 = 2008;
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x24BDC25D8]) & 1) != 0)
  {
    v10 = 2002;
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x24BDC25E0]) & 1) != 0)
  {
    v10 = 2009;
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x24BDC25E8]) & 1) != 0)
  {
    v10 = 2010;
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x24BDC25F0]) & 1) != 0)
  {
    v10 = 2011;
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x24BDC2638]) & 1) != 0)
  {
    v10 = 2012;
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x24BDC2618]) & 1) != 0)
  {
    v10 = 2003;
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x24BDC2628]) & 1) != 0)
  {
    v10 = 2013;
  }
  else if (-[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x24BDC2620]))
  {
    v10 = 2014;
  }
  else
  {
    v10 = 2000;
  }
  v11 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("WWAN");
    if (v7)
      v12 = v7;
    *(_DWORD *)buf = 136315394;
    v16 = "-[SiriCoreNetworkManager _getConnectionTechnologyForCellularInterface]";
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_211AB2000, v11, OS_LOG_TYPE_DEFAULT, "%s Current Radio Access Technology: %@", buf, 0x16u);
  }

  return v10;
}

- (void)forceFastDormancy
{
  dispatch_async((dispatch_queue_t)self->_queue, &__block_literal_global_16);
}

- (void)releaseWiFiAssertion
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SiriCoreNetworkManager_releaseWiFiAssertion__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)acquireWiFiAssertion:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__SiriCoreNetworkManager_acquireWiFiAssertion___block_invoke;
  v4[3] = &unk_24CCE67A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_subscribeToLinkRecommendations:(id)a3
{
  id v4;
  WRM_iRATInterface *interface;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  interface = self->_interface;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__SiriCoreNetworkManager__subscribeToLinkRecommendations___block_invoke;
  v7[3] = &unk_24CCE67C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[WRM_iRATInterface subscribeStandaloneLinkRecommendation:](interface, "subscribeStandaloneLinkRecommendation:", v7);

}

- (void)_getLinkRecommendationSafe:(BOOL)a3 recommendation:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  unint64_t v14;
  unint64_t iRATCallNumber;
  NSObject *v16;
  void *v17;
  WRM_iRATInterface *interface;
  uint64_t v19;
  NSObject *v20;
  dispatch_time_t v21;
  NSObject *queue;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  _BYTE *v28;
  _QWORD *v29;
  _QWORD *v30;
  BOOL v31;
  _QWORD block[5];
  NSObject *v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD v37[5];
  NSObject *v38;
  _QWORD *v39;
  uint64_t *v40;
  _BYTE *v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD v44[4];
  _QWORD v45[3];
  char v46;
  _QWORD v47[4];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  SiriCoreLinkRecommendationInfo *v53;
  _BYTE buf[24];
  char v55;
  uint64_t v56;

  v4 = a3;
  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__2359;
  v52 = __Block_byref_object_dispose__2360;
  v53 = self->_linkRecommendationInfo;
  v7 = -[SiriCoreLinkRecommendationInfo btPreference](v53, "btPreference");
  v8 = objc_msgSend((id)v49[5], "wifiPreference");
  if ((AFIsNano() & 1) != 0 && !self->_iRATCallInProgress)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemUptime");
    v11 = v10;

    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x2020000000;
    v47[3] = 0;
    v12 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("trying");
      if (v4)
        v13 = CFSTR("retrying");
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SiriCoreNetworkManager _getLinkRecommendationSafe:recommendation:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_211AB2000, v12, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v14 = 1;
    v55 = 1;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v46 = 0;
    self->_iRATCallInProgress = 1;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    iRATCallNumber = self->_iRATCallNumber;
    v44[3] = iRATCallNumber;
    if (iRATCallNumber + 1 > 1)
      v14 = iRATCallNumber + 1;
    self->_iRATCallNumber = v14;
    -[SiriCoreLinkRecommendationInfo setLinkMetrics:](self->_linkRecommendationInfo, "setLinkMetrics:", 0);
    v16 = dispatch_group_create();
    dispatch_group_enter(v16);
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logEventWithType:context:", 1011, 0);

    interface = self->_interface;
    v19 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __68__SiriCoreNetworkManager__getLinkRecommendationSafe_recommendation___block_invoke;
    v37[3] = &unk_24CCE67F0;
    v37[4] = self;
    v43 = v11;
    v39 = v47;
    v40 = &v48;
    v41 = buf;
    v42 = v45;
    v20 = v16;
    v38 = v20;
    -[WRM_iRATInterface getProximityLinkRecommendation:recommendation:](interface, "getProximityLinkRecommendation:recommendation:", v4, v37);
    v21 = dispatch_time(0, 1000000000);
    queue = self->_queue;
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __68__SiriCoreNetworkManager__getLinkRecommendationSafe_recommendation___block_invoke_25;
    block[3] = &unk_24CCE6818;
    v34 = v44;
    v35 = v47;
    v36 = v11;
    block[4] = self;
    v33 = v20;
    v23 = v20;
    dispatch_after(v21, queue, block);
    v24 = self->_queue;
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __68__SiriCoreNetworkManager__getLinkRecommendationSafe_recommendation___block_invoke_26;
    v25[3] = &unk_24CCE6840;
    v28 = buf;
    v29 = v45;
    v30 = v47;
    v31 = v4;
    v27 = &v48;
    v25[4] = self;
    v26 = v6;
    dispatch_group_notify(v23, v24, v25);

    _Block_object_dispose(v44, 8);
    _Block_object_dispose(v45, 8);
    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v47, 8);
  }
  else
  {
    (*((void (**)(id, uint64_t, uint64_t))v6 + 2))(v6, v7, v8);
  }
  _Block_object_dispose(&v48, 8);

}

- (void)registerWithWirelessCoexManager
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SiriCoreNetworkManager_registerWithWirelessCoexManager__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)deRegisterWithWirelessCoexManager
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SiriCoreNetworkManager_deRegisterWithWirelessCoexManager__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)getLinkRecommendation:(BOOL)a3 recommendation:(id)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__SiriCoreNetworkManager_getLinkRecommendation_recommendation___block_invoke;
    block[3] = &unk_24CCE6890;
    block[4] = self;
    v10 = v6;
    v11 = a3;
    dispatch_async(queue, block);

  }
}

- (void)proximityRecomendationWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__SiriCoreNetworkManager_proximityRecomendationWithCompletion___block_invoke;
  block[3] = &unk_24CCE68B8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)resetLinkMetrics
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SiriCoreNetworkManager_resetLinkMetrics__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_dataSubscriptionContextChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SiriCoreNetworkManager _dataSubscriptionContextChange:]";
      _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __57__SiriCoreNetworkManager__dataSubscriptionContextChange___block_invoke;
    v7[3] = &unk_24CCE6BD0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)_dataServiceDescriptorUpdate
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SiriCoreNetworkManager _dataServiceDescriptorUpdate]";
    _os_log_impl(&dword_211AB2000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SiriCoreNetworkManager__dataServiceDescriptorUpdate__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_serviceSubscriptionInfoUpdate
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SiriCoreNetworkManager _serviceSubscriptionInfoUpdate]";
    _os_log_impl(&dword_211AB2000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SiriCoreNetworkManager__serviceSubscriptionInfoUpdate__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_signalStrengthUpdate
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SiriCoreNetworkManager _signalStrengthUpdate]";
    _os_log_impl(&dword_211AB2000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SiriCoreNetworkManager__signalStrengthUpdate__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_signalStrengthChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *lastSignalStrength;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[SiriCoreNetworkManager _signalStrengthChange:]";
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  os_unfair_lock_lock(&self->_ctLock);
  objc_msgSend(v4, "bars");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSNumber *)objc_msgSend(v6, "copy");
  lastSignalStrength = self->_lastSignalStrength;
  self->_lastSignalStrength = v7;

  os_unfair_lock_unlock(&self->_ctLock);
}

- (void)preferredDataSimChanged:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SiriCoreNetworkManager preferredDataSimChanged:]";
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  -[SiriCoreNetworkManager _dataSubscriptionContextChange:](self, "_dataSubscriptionContextChange:", v4);
  -[SiriCoreNetworkManager _dataServiceDescriptorUpdate](self, "_dataServiceDescriptorUpdate");

}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t lastDataSubscriptionSlot;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SiriCoreNetworkManager carrierBundleChange:]";
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_ctLock);
  lastDataSubscriptionSlot = self->_lastDataSubscriptionSlot;
  os_unfair_lock_unlock(&self->_ctLock);
  if (v4 && lastDataSubscriptionSlot)
  {
    if (objc_msgSend(v4, "slotID") == lastDataSubscriptionSlot)
      -[SiriCoreNetworkManager _dataSubscriptionContextChange:](self, "_dataSubscriptionContextChange:", v4);
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__SiriCoreNetworkManager_carrierBundleChange___block_invoke;
    block[3] = &unk_24CCE6BA8;
    block[4] = self;
    dispatch_async(queue, block);
  }
  -[SiriCoreNetworkManager _dataServiceDescriptorUpdate](self, "_dataServiceDescriptorUpdate");

}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSString *v11;
  NSString *subscriptionSlotOneStatus;
  NSString *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = (void *)*MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v14 = 136315650;
      v15 = "-[SiriCoreNetworkManager simStatusDidChange:status:]";
      v16 = 2048;
      v17 = objc_msgSend(v6, "slotID");
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_211AB2000, v10, OS_LOG_TYPE_DEFAULT, "%s SIM Slot %ld - Status: %@", (uint8_t *)&v14, 0x20u);

    }
    os_unfair_lock_lock(&self->_ctLock);
    if (objc_msgSend(v6, "slotID") == 1)
    {
      v11 = (NSString *)objc_msgSend(v8, "copy");
      subscriptionSlotOneStatus = self->_subscriptionSlotOneStatus;
      self->_subscriptionSlotOneStatus = v11;
    }
    else
    {
      if (objc_msgSend(v6, "slotID") != 2)
      {
LABEL_10:
        os_unfair_lock_unlock(&self->_ctLock);
        -[SiriCoreNetworkManager _serviceSubscriptionInfoUpdate](self, "_serviceSubscriptionInfoUpdate");
        -[SiriCoreNetworkManager _dataServiceDescriptorUpdate](self, "_dataServiceDescriptorUpdate");
        goto LABEL_11;
      }
      v13 = (NSString *)objc_msgSend(v8, "copy");
      subscriptionSlotOneStatus = self->_subscriptionSlotTwoStatus;
      self->_subscriptionSlotTwoStatus = v13;
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int64_t lastDataSubscriptionSlot;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SiriCoreNetworkManager signalStrengthChanged:info:]";
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  if (v6)
  {
    if (v7)
    {
      os_unfair_lock_lock(&self->_ctLock);
      lastDataSubscriptionSlot = self->_lastDataSubscriptionSlot;
      os_unfair_lock_unlock(&self->_ctLock);
      if (objc_msgSend(v6, "slotID") == lastDataSubscriptionSlot)
        -[SiriCoreNetworkManager _signalStrengthChange:](self, "_signalStrengthChange:", v7);
    }
  }

}

- (BOOL)_defaultWiFiLinkRecommendation
{
  return AFIsNano() ^ 1;
}

- (BOOL)_getConnectionSuccessRate:(id)a3 hasMetric:(BOOL *)a4
{
  if (a4)
    *a4 = 0;
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetricsInfo, 0);
  objc_storeStrong((id *)&self->_linkRecommendationInfo, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_lastSignalStrength, 0);
  objc_storeStrong((id *)&self->_subscriptionSlotTwoStatus, 0);
  objc_storeStrong((id *)&self->_subscriptionSlotOneStatus, 0);
  objc_storeStrong((id *)&self->_dataServiceDescriptor, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_wiFiManagerClient, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __46__SiriCoreNetworkManager_carrierBundleChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__SiriCoreNetworkManager_carrierBundleChange___block_invoke_2;
  v4[3] = &unk_24CCE6980;
  v4[4] = v1;
  return objc_msgSend(v2, "getCurrentDataSubscriptionContext:", v4);
}

uint64_t __46__SiriCoreNetworkManager_carrierBundleChange___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return objc_msgSend(*(id *)(result + 32), "_dataSubscriptionContextChange:", a2);
  return result;
}

uint64_t __47__SiriCoreNetworkManager__signalStrengthUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__SiriCoreNetworkManager__signalStrengthUpdate__block_invoke_2;
  v4[3] = &unk_24CCE6980;
  v4[4] = v1;
  return objc_msgSend(v2, "getCurrentDataSubscriptionContext:", v4);
}

void __47__SiriCoreNetworkManager__signalStrengthUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (v6)
    {
      v10 = *MEMORY[0x24BE08FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[SiriCoreNetworkManager _signalStrengthUpdate]_block_invoke";
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_211AB2000, v10, OS_LOG_TYPE_DEFAULT, "%s Error getting current Data Subscription Context: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 64);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __47__SiriCoreNetworkManager__signalStrengthUpdate__block_invoke_3;
    v11[3] = &unk_24CCE6958;
    v11[4] = v8;
    objc_msgSend(v9, "getSignalStrengthInfo:completion:", v5, v11);
  }

}

void __47__SiriCoreNetworkManager__signalStrengthUpdate__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[SiriCoreNetworkManager _signalStrengthUpdate]_block_invoke_3";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_211AB2000, v7, OS_LOG_TYPE_DEFAULT, "%s Error getting Signal Strength: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_signalStrengthChange:", v5);
  }

}

uint64_t __56__SiriCoreNetworkManager__serviceSubscriptionInfoUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__SiriCoreNetworkManager__serviceSubscriptionInfoUpdate__block_invoke_2;
  v4[3] = &unk_24CCE6930;
  v4[4] = v1;
  return objc_msgSend(v2, "getSubscriptionInfo:", v4);
}

void __56__SiriCoreNetworkManager__serviceSubscriptionInfoUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (v6)
    {
      v14 = *MEMORY[0x24BE08FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[SiriCoreNetworkManager _serviceSubscriptionInfoUpdate]_block_invoke_2";
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_211AB2000, v14, OS_LOG_TYPE_DEFAULT, "%s Error getting Subscription Info: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    objc_msgSend(v5, "subscriptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v9)
    {
      v10 = v9;
      LODWORD(v11) = 0;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v8);
          v11 = v11
              + (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "isSimHidden") ^ 1);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 60));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = v11;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 60));

  }
}

uint64_t __54__SiriCoreNetworkManager__dataServiceDescriptorUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SiriCoreNetworkManager__dataServiceDescriptorUpdate__block_invoke_2;
  v4[3] = &unk_24CCE6908;
  v4[4] = v1;
  return objc_msgSend(v2, "getCurrentDataServiceDescriptor:", v4);
}

void __54__SiriCoreNetworkManager__dataServiceDescriptorUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[SiriCoreNetworkManager _dataServiceDescriptorUpdate]_block_invoke_2";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_211AB2000, v7, OS_LOG_TYPE_DEFAULT, "%s Error getting current Data Service Descriptor: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 60));
    v8 = objc_msgSend(v5, "copy");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 80);
    *(_QWORD *)(v9 + 80) = v8;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 60));
  }

}

void __57__SiriCoreNetworkManager__dataSubscriptionContextChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 1);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 64);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__SiriCoreNetworkManager__dataSubscriptionContextChange___block_invoke_2;
  v6[3] = &unk_24CCE68E0;
  v6[4] = v3;
  v7 = v4;
  objc_msgSend(v5, "copyCarrierBundleValue:key:bundleType:completion:", v7, CFSTR("CarrierName"), v2, v6);

}

void __57__SiriCoreNetworkManager__dataSubscriptionContextChange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  char isKindOfClass;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;

  v5 = a2;
  if (!a3)
  {
    v15 = v5;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v15;
    if ((isKindOfClass & 1) != 0)
    {
      v7 = v15;
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 60));
      v8 = objc_msgSend(v7, "copy");
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 128);
      *(_QWORD *)(v9 + 128) = v8;

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = objc_msgSend(*(id *)(a1 + 40), "slotID");
      if (objc_msgSend(*(id *)(a1 + 40), "slotID") == 1)
      {
        v11 = 88;
      }
      else
      {
        if (objc_msgSend(*(id *)(a1 + 40), "slotID") != 2)
        {
LABEL_8:
          os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 60));

          v5 = v15;
          goto LABEL_9;
        }
        v11 = 96;
      }
      v12 = *(_QWORD *)(a1 + 32);
      v13 = (id)*MEMORY[0x24BDC2D10];
      v14 = *(void **)(v12 + v11);
      *(_QWORD *)(v12 + v11) = v13;

      goto LABEL_8;
    }
  }
LABEL_9:

}

uint64_t __42__SiriCoreNetworkManager_resetLinkMetrics__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 136))
    return objc_msgSend(*(id *)(v1 + 168), "resetLinkMetrics");
  return result;
}

uint64_t __63__SiriCoreNetworkManager_proximityRecomendationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __63__SiriCoreNetworkManager_getLinkRecommendation_recommendation___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[17])
  {
    v3 = *(unsigned __int8 *)(a1 + 48);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __63__SiriCoreNetworkManager_getLinkRecommendation_recommendation___block_invoke_28;
    v5[3] = &unk_24CCE6868;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v2, "_getLinkRecommendationSafe:recommendation:", v3, v5);

  }
  else
  {
    v4 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[SiriCoreNetworkManager getLinkRecommendation:recommendation:]_block_invoke";
      _os_log_error_impl(&dword_211AB2000, v4, OS_LOG_TYPE_ERROR, "%s iRAT client not registered", buf, 0xCu);
      v2 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v2, "_defaultBTLinkRecommendation");
    objc_msgSend(*(id *)(a1 + 32), "_defaultWiFiLinkRecommendation");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __63__SiriCoreNetworkManager_getLinkRecommendation_recommendation___block_invoke_28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t result;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[SiriCoreNetworkManager getLinkRecommendation:recommendation:]_block_invoke";
    v10 = 1024;
    v11 = a2;
    v12 = 1024;
    v13 = a3;
    _os_log_impl(&dword_211AB2000, v6, OS_LOG_TYPE_DEFAULT, "%s %d , %d", (uint8_t *)&v8, 0x18u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

void __59__SiriCoreNetworkManager_deRegisterWithWirelessCoexManager__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (v2)
  {
    objc_msgSend(v2, "unregisterClient");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 136);
    *(_QWORD *)(v3 + 136) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  }
}

void __57__SiriCoreNetworkManager_registerWithWirelessCoexManager__block_invoke(uint64_t a1)
{
  objc_class *WRM_iRATInterfaceClass_2347;
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  SiriCoreLinkRecommendationInfo *v8;
  uint64_t v9;
  void *v10;
  id *v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136))
  {
    WRM_iRATInterfaceClass_2347 = (objc_class *)getWRM_iRATInterfaceClass_2347();
    if (WRM_iRATInterfaceClass_2347)
    {
      v3 = objc_alloc_init(WRM_iRATInterfaceClass_2347);
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 136);
      *(_QWORD *)(v4 + 136) = v3;

      v6 = *MEMORY[0x24BE08FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
        v14 = 136315394;
        v15 = "-[SiriCoreNetworkManager registerWithWirelessCoexManager]_block_invoke";
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_211AB2000, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v14, 0x16u);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "registerClient:queue:", 22, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      v8 = -[SiriCoreLinkRecommendationInfo initWithPreferences:wifiPreference:timeTaken:metrics:]([SiriCoreLinkRecommendationInfo alloc], "initWithPreferences:wifiPreference:timeTaken:metrics:", objc_msgSend(*(id *)(a1 + 32), "_defaultBTLinkRecommendation"), objc_msgSend(*(id *)(a1 + 32), "_defaultWiFiLinkRecommendation"), 0, 0.0);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 168);
      *(_QWORD *)(v9 + 168) = v8;

      v11 = *(id **)(a1 + 32);
      v12 = v11[21];
      objc_msgSend(v11, "_subscribeToLinkRecommendations:", v12);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 1;

    }
    else
    {
      v13 = *MEMORY[0x24BE08FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_ERROR))
      {
        v14 = 136315138;
        v15 = "-[SiriCoreNetworkManager registerWithWirelessCoexManager]_block_invoke";
        _os_log_error_impl(&dword_211AB2000, v13, OS_LOG_TYPE_ERROR, "%s Unable to find iRATInterface class", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

void __68__SiriCoreNetworkManager__getLinkRecommendationSafe_recommendation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_log_t *v4;
  NSObject *v5;
  void *v6;
  double v7;
  int v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (os_log_t *)MEMORY[0x24BE08FB8];
  v5 = *MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SiriCoreNetworkManager _getLinkRecommendationSafe:recommendation:]_block_invoke";
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 144))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7 - *(double *)(a1 + 80);

    v8 = objc_msgSend(v3, "count");
    v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[SiriCoreNetworkManager _getLinkRecommendationSafe:recommendation:]_block_invoke";
      v26 = 1024;
      v27 = v8;
      _os_log_impl(&dword_211AB2000, v9, OS_LOG_TYPE_DEFAULT, "%s count of recommendations is %d", buf, 0x12u);
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v3;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v15, "RecommendationType", (_QWORD)v19) == 2)
          {
            v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            objc_msgSend(v15, "metrics");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setLinkMetrics:", v17);

          }
          if (objc_msgSend(v15, "linkIsRecommended")
            && objc_msgSend(v15, "linkRecommendationIsValid")
            && objc_msgSend(v15, "RecommendationType"))
          {
            if (objc_msgSend(v15, "RecommendationType") == 1)
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
            if (objc_msgSend(v15, "RecommendationType") == 2)
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 0;
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logEventWithType:context:", 1012, 0);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __68__SiriCoreNetworkManager__getLinkRecommendationSafe_recommendation___block_invoke_25(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  double v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_QWORD *)(v2 + 24))
    *(_QWORD *)(v2 + 24) = 1;
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 144) && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == *(_QWORD *)(v3 + 152))
  {
    *(_BYTE *)(v3 + 144) = 0;
    v4 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[SiriCoreNetworkManager _getLinkRecommendationSafe:recommendation:]_block_invoke";
      _os_log_error_impl(&dword_211AB2000, v4, OS_LOG_TYPE_ERROR, "%s getLinkRecommendation timedout", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemUptime");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6 - *(double *)(a1 + 64);

    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logEventWithType:context:", 1013, 0);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

uint64_t __68__SiriCoreNetworkManager__getLinkRecommendationSafe_recommendation___block_invoke_26(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setBTPreference:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setWiFiPreference:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setTimeTaken:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "systemUptime");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = v3;

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __58__SiriCoreNetworkManager__subscribeToLinkRecommendations___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315906;
    v13 = "-[SiriCoreNetworkManager _subscribeToLinkRecommendations:]_block_invoke";
    v14 = 1024;
    v15 = a2;
    v16 = 1024;
    v17 = a3;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_DEFAULT, "%s Received an asynchronous recommendation type %d, linkType %d, value %@", (uint8_t *)&v12, 0x22u);
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  if (a2 == 1)
  {
    if (a3 == 1)
    {
      v9 = 1;
    }
    else
    {
      if (a3)
      {
LABEL_9:
        objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "systemUptime");
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = v11;

        goto LABEL_10;
      }
      v9 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "setWiFiPreference:", v9);
    goto LABEL_9;
  }
LABEL_10:

}

void __47__SiriCoreNetworkManager_acquireWiFiAssertion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_wiFiManagerClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acquireWiFiAssertion:", *(_QWORD *)(a1 + 40));

}

uint64_t __46__SiriCoreNetworkManager_releaseWiFiAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "releaseWiFiAssertion");
}

void __43__SiriCoreNetworkManager_forceFastDormancy__block_invoke()
{
  NSObject *v0;
  void *v1;
  const void *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[SiriCoreNetworkManager forceFastDormancy]_block_invoke";
    _os_log_impl(&dword_211AB2000, v0, OS_LOG_TYPE_DEFAULT, "%s Forcing fast dormancy", (uint8_t *)&v3, 0xCu);
  }
  dispatch_get_global_queue(21, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (const void *)_CTServerConnectionCreateOnTargetQueue();

  if (v2)
  {
    _CTServerForceFastDormancy();
    CFRelease(v2);
  }
}

void __43__SiriCoreNetworkManager_getQualityReport___block_invoke(uint64_t a1)
{
  SiriCoreNetworkQualityReport *v2;

  v2 = objc_alloc_init(SiriCoreNetworkQualityReport);
  -[SiriCoreNetworkQualityReport setCellularInstant:](v2, "setCellularInstant:", objc_msgSend(*(id *)(a1 + 32), "_reportCellularInstantQuality"));
  -[SiriCoreNetworkQualityReport setCellularHistorical:](v2, "setCellularHistorical:", objc_msgSend(*(id *)(a1 + 32), "_reportCellularHistoricalQuality"));
  -[SiriCoreNetworkQualityReport setWifiInstant:](v2, "setWifiInstant:", objc_msgSend(*(id *)(a1 + 32), "_reportWiFiInstantQuality"));
  -[SiriCoreNetworkQualityReport setWifiHistorical:](v2, "setWifiHistorical:", objc_msgSend(*(id *)(a1 + 32), "_reportWiFiHistoricalQuality"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __43__SiriCoreNetworkManager_anyNetworkQuality__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 50))
    v2 = *(unsigned __int8 *)(v1 + 51);
  else
    v2 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  v3 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_QWORD *)(v3 + 24))
  {
    v4 = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(v4 + 48))
      v5 = *(unsigned __int8 *)(v4 + 49);
    else
      v5 = 0;
    *(_QWORD *)(v3 + 24) = v5;
  }
  return result;
}

uint64_t __44__SiriCoreNetworkManager_wifiNetworkQuality__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 50))
    v2 = *(unsigned __int8 *)(v1 + 51);
  else
    v2 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

uint64_t __48__SiriCoreNetworkManager_cellularNetworkQuality__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 48))
    v2 = *(unsigned __int8 *)(v1 + 49);
  else
    v2 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __51__SiriCoreNetworkManager_getNetworkPerformanceFeed__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a2 > 1)
  {
    v4 = (void *)*MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      _AFMemoryPressureConditionGetName();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v9 = "-[SiriCoreNetworkManager getNetworkPerformanceFeed]_block_invoke";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_DEFAULT, "%s Memory condition (%@) not suited for Symptoms feedback.", buf, 0x16u);

    }
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(NSObject **)(v2 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__SiriCoreNetworkManager_getNetworkPerformanceFeed__block_invoke_2;
    block[3] = &unk_24CCE6BA8;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __51__SiriCoreNetworkManager_getNetworkPerformanceFeed__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getNetworkPerformanceFeed");
}

uint64_t __47__SiriCoreNetworkManager_stopMonitoringNetwork__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopMonitoringNetwork");
}

void __56__SiriCoreNetworkManager_startMonitoringNetworkForHost___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  nw_endpoint_t host;
  void *evaluator_for_endpoint;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v2 = *(void **)(a1 + 40);
    if (v2)
    {
      v3 = *MEMORY[0x24BE08FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v8 = "-[SiriCoreNetworkManager startMonitoringNetworkForHost:]_block_invoke";
        _os_log_impl(&dword_211AB2000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
        v2 = *(void **)(a1 + 40);
      }
      host = nw_endpoint_create_host((const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"), "443");
      evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      objc_copyWeak(&v6, (id *)buf);
      nw_path_evaluator_set_update_handler();
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), evaluator_for_endpoint);
      objc_msgSend(*(id *)(a1 + 32), "_serviceSubscriptionInfoUpdate");
      objc_msgSend(*(id *)(a1 + 32), "_signalStrengthUpdate");
      objc_destroyWeak(&v6);
      objc_destroyWeak((id *)buf);

    }
  }
}

void __56__SiriCoreNetworkManager_startMonitoringNetworkForHost___block_invoke_8(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_pathUpdated:", v3);

}

uint64_t __41__SiriCoreNetworkManager_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_stopMonitoringNetwork");
  return result;
}

uint64_t __38__SiriCoreNetworkManager_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2441 != -1)
    dispatch_once(&sharedInstance_onceToken_2441, &__block_literal_global_2442);
  return (id)sharedInstance_sSharedInstance_2443;
}

+ (void)_ifnameTypeForName:(char *)a3 isWiFi:(BOOL *)a4 isCellular:(BOOL *)a5
{
  int v7;
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = socket(2, 2, 0);
    v9 = 0u;
    v10 = 0u;
    __strlcpy_chk();
    if (ioctl(v7, 0xC0206911uLL, &v9) != -1 && a5 && (v10 & 0x10) != 0)
      *a5 = 1;
    memset(v8, 0, 44);
    __strlcpy_chk();
    if (ioctl(v7, 0xC02C6938uLL, v8) != -1 && a4 && (v8[1] & 0xE0) == 0x80)
      *a4 = 1;
    close(v7);
  }
}

+ (int64_t)connectionSubTypeForCellularInterface
{
  void *v2;
  int64_t v3;

  +[SiriCoreNetworkManager sharedInstance](SiriCoreNetworkManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_getConnectionTechnologyForCellularInterface");

  return v3;
}

+ (void)getCarrierName:(id *)a3 signalStrength:(id *)a4 subscriptionCount:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  +[SiriCoreNetworkManager sharedInstance](SiriCoreNetworkManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v8, "getSignalStrength:subscriptionCount:", &v18, &v19);
  v9 = v18;

  +[SiriCoreNetworkManager sharedInstance](SiriCoreNetworkManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v10, "_getCarrierName:", &v17);
  v11 = v17;

  if (a3)
    *a3 = objc_retainAutorelease(v11);
  if (a4)
    *a4 = objc_retainAutorelease(v9);
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)*MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)MEMORY[0x24BDD16E0];
    v14 = v19;
    v15 = v12;
    objc_msgSend(v13, "numberWithUnsignedInteger:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v21 = "+[SiriCoreNetworkManager getCarrierName:signalStrength:subscriptionCount:]";
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v16;
    _os_log_impl(&dword_211AB2000, v15, OS_LOG_TYPE_DEFAULT, "%s Carrier Name: %@, Signal Strength: %@, Subscription count: %@", buf, 0x2Au);

  }
}

+ (id)connectionTypeForInterfaceName:(id)a3 isCellular:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  SiriCoreConnectionType *v10;
  char v12;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    v8 = objc_msgSend(a1, "connectionSubTypeForCellularInterface");
  }
  else if (v6 && (v12 = 0, (v9 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String")) != 0))
  {
    objc_msgSend(a1, "_ifnameTypeForName:isWiFi:isCellular:", v9, &v12, 0);
    if (v12)
      v8 = 1000;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v10 = -[SiriCoreConnectionType initWithTechnology:]([SiriCoreConnectionType alloc], "initWithTechnology:", v8);

  return v10;
}

+ (int64_t)connectionTypeForInterface:(id)a3
{
  int64_t result;
  __int16 v5;

  if (!a3)
    return 0;
  v5 = 0;
  result = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (result)
  {
    objc_msgSend(a1, "_ifnameTypeForName:isWiFi:isCellular:", result, (char *)&v5 + 1, &v5);
    if (HIBYTE(v5))
      result = 1000;
    else
      result = 0;
    if ((_BYTE)v5)
      return objc_msgSend(a1, "connectionSubTypeForCellularInterface");
  }
  return result;
}

+ (void)acquireDormancySuspendAssertion:(const void *)a3
{
  const void *v3;
  os_log_t *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  os_log_t v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = *a3;
    v4 = (os_log_t *)MEMORY[0x24BE08FB8];
    v5 = *MEMORY[0x24BE08FB8];
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        v16 = 136315138;
        v17 = "+[SiriCoreNetworkManager acquireDormancySuspendAssertion:]";
        _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_DEFAULT, "%s Already acquired.", (uint8_t *)&v16, 0xCu);
      }
      return;
    }
    if (v6)
    {
      v16 = 136315138;
      v17 = "+[SiriCoreNetworkManager acquireDormancySuspendAssertion:]";
      _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_DEFAULT, "%s Suspend Dormancy", (uint8_t *)&v16, 0xCu);
    }
    dispatch_get_global_queue(21, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (const void *)_CTServerConnectionCreateOnTargetQueue();

    if (v9)
    {
      v10 = _CTServerConnectionDormancySuspendAssertionCreateWithExpirationCB();

      v11 = *v4;
      v12 = os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v10)
      {
        if (v12)
        {
          v16 = 136315650;
          v17 = "+[SiriCoreNetworkManager acquireDormancySuspendAssertion:]";
          v18 = 1024;
          v19 = v10;
          v20 = 1024;
          v21 = HIDWORD(v10);
          v13 = "%s Failed to acquire the dormancy suspend assertion (%i, %i)";
          v14 = v11;
          v15 = 24;
LABEL_15:
          _os_log_impl(&dword_211AB2000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v15);
        }
      }
      else if (v12)
      {
        v16 = 136315138;
        v17 = "+[SiriCoreNetworkManager acquireDormancySuspendAssertion:]";
        v13 = "%s Acquired dormany suspension assertion.";
        v14 = v11;
        v15 = 12;
        goto LABEL_15;
      }
      CFRelease(v9);
    }
  }
  else
  {
    v7 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_ERROR))
    {
      v16 = 136315138;
      v17 = "+[SiriCoreNetworkManager acquireDormancySuspendAssertion:]";
      _os_log_error_impl(&dword_211AB2000, v7, OS_LOG_TYPE_ERROR, "%s Assertion ref should not be nil", (uint8_t *)&v16, 0xCu);
    }
  }
}

+ (void)releaseDormancySuspendAssertion:(void *)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "+[SiriCoreNetworkManager releaseDormancySuspendAssertion:]";
      _os_log_impl(&dword_211AB2000, v4, OS_LOG_TYPE_DEFAULT, "%s Released dormancy suspension assertion.", (uint8_t *)&v5, 0xCu);
    }
    CFRelease(a3);
  }
}

void __58__SiriCoreNetworkManager_acquireDormancySuspendAssertion___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "+[SiriCoreNetworkManager acquireDormancySuspendAssertion:]_block_invoke";
    _os_log_impl(&dword_211AB2000, v0, OS_LOG_TYPE_DEFAULT, "%s Dormancy Suspend Assertion auto expired.", (uint8_t *)&v1, 0xCu);
  }
}

void __40__SiriCoreNetworkManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SiriCoreNetworkManager _init]([SiriCoreNetworkManager alloc], "_init");
  v1 = (void *)sharedInstance_sSharedInstance_2443;
  sharedInstance_sSharedInstance_2443 = (uint64_t)v0;

}

@end
