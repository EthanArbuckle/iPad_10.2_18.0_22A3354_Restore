@implementation RTWiFiManager

+ (RTWiFiManager)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (RTWiFiManager *)+[RTWiFiManager allocWithZone:](RTWiFiManager_MobileWiFi, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___RTWiFiManager;
  return (RTWiFiManager *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (RTWiFiManager)init
{
  RTWiFiManager *v2;
  RTWiFiManager *v3;
  NSArray *accessPoints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTWiFiManager;
  v2 = -[RTNotifier init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_linkStatus = 0;
    v2->_powerStatus = 0;
    accessPoints = v2->_accessPoints;
    v2->_accessPoints = 0;

    -[RTService setup](v3, "setup");
  }
  return v3;
}

- (void)scheduleScan
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__RTWiFiManager_scheduleScan__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __29__RTWiFiManager_scheduleScan__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleScan");
}

- (void)scheduleScanWithChannels:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__RTWiFiManager_scheduleScanWithChannels___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __42__RTWiFiManager_scheduleScanWithChannels___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleScanWithChannels:", *(_QWORD *)(a1 + 40));
}

- (void)scheduleActiveScan
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__RTWiFiManager_scheduleActiveScan__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __35__RTWiFiManager_scheduleActiveScan__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleActiveScan");
}

- (void)cancelScan
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__RTWiFiManager_cancelScan__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __27__RTWiFiManager_cancelScan__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelScan");
}

- (void)fetchPowerStatus:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTWiFiManager fetchPowerStatus:]";
      v12 = 1024;
      v13 = 112;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__RTWiFiManager_fetchPowerStatus___block_invoke;
  v8[3] = &unk_1E9297678;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __34__RTWiFiManager_fetchPowerStatus___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "powerStatus"));
}

- (void)fetchLinkStatus:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTWiFiManager fetchLinkStatus:]";
      v12 = 1024;
      v13 = 121;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__RTWiFiManager_fetchLinkStatus___block_invoke;
  v8[3] = &unk_1E9297678;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __33__RTWiFiManager_fetchLinkStatus___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "linkStatus");
  objc_msgSend(*(id *)(a1 + 32), "accessPoints");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);

}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v4) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v4) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

+ (BOOL)supportsNotificationName:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[RTNotification notificationName](RTWiFiManagerNotificationScanResults, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[RTNotification notificationName](RTWiFiManagerNotificationLinkStatusChanged, "notificationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", v6) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      +[RTNotification notificationName](RTWiFiManagerNotificationPowerStatusChanged, "notificationName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "isEqualToString:", v7);

    }
  }

  return v5;
}

- (void)setPowerStatus:(unint64_t)a3
{
  unint64_t powerStatus;
  NSObject *v5;
  void *v6;
  void *v7;
  RTWiFiManagerNotificationPowerStatusChanged *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  powerStatus = self->_powerStatus;
  if (powerStatus != a3)
  {
    self->_powerStatus = a3;
    _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      +[RTWiFiManager powerStatusToString:](RTWiFiManager, "powerStatusToString:", powerStatus);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTWiFiManager powerStatusToString:](RTWiFiManager, "powerStatusToString:", self->_powerStatus);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "power status changed from, %@, to, %@", (uint8_t *)&v9, 0x16u);

    }
    v8 = -[RTWiFiManagerNotificationPowerStatusChanged initWithPowerStatus:]([RTWiFiManagerNotificationPowerStatusChanged alloc], "initWithPowerStatus:", self->_powerStatus);
    -[RTNotifier postNotification:](self, "postNotification:", v8);

  }
}

- (void)setAccessPoints:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t linkStatus;
  NSObject *v10;
  void *v11;
  void *v12;
  NSArray **p_accessPoints;
  NSObject *v14;
  void *v15;
  RTWiFiManagerNotificationLinkStatusChanged *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "count");
    v8 = 1;
    if (v7)
      v8 = 2;
  }
  else
  {
    v8 = 0;
  }
  linkStatus = self->_linkStatus;
  if (v8 != linkStatus)
  {
    self->_linkStatus = v8;
    _rt_log_facility_get_os_log(RTLogFacilityWiFi);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      +[RTWiFiManager linkStatusToString:](RTWiFiManager, "linkStatusToString:", linkStatus);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTWiFiManager linkStatusToString:](RTWiFiManager, "linkStatusToString:", self->_linkStatus);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "link status changed from, %@, to, %@", (uint8_t *)&v17, 0x16u);

    }
  }
  p_accessPoints = &self->_accessPoints;
  objc_storeStrong((id *)&self->_accessPoints, a3);
  _rt_log_facility_get_os_log(RTLogFacilityWiFi);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    -[NSArray componentsJoinedByString:](*p_accessPoints, "componentsJoinedByString:", CFSTR(", "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v15;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "access points changed to, %@", (uint8_t *)&v17, 0xCu);

  }
  v16 = -[RTWiFiManagerNotificationLinkStatusChanged initWithLinkStatus:accessPoints:]([RTWiFiManagerNotificationLinkStatusChanged alloc], "initWithLinkStatus:accessPoints:", self->_linkStatus, *p_accessPoints);
  -[RTNotifier postNotification:](self, "postNotification:", v16);

}

- (void)_notifyScanResults:(id)a3
{
  id v4;
  RTWiFiManagerNotificationScanResults *v5;

  v4 = a3;
  v5 = -[RTWiFiManagerNotificationScanResults initWithScanResults:]([RTWiFiManagerNotificationScanResults alloc], "initWithScanResults:", v4);

  -[RTNotifier postNotification:](self, "postNotification:", v5);
}

+ (id)powerStatusToString:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Unexpected Value");
  else
    return off_1E929F3A0[a3];
}

+ (id)linkStatusToString:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Unexpected Value");
  else
    return off_1E929F3B8[a3];
}

- (unint64_t)powerStatus
{
  return self->_powerStatus;
}

- (unint64_t)linkStatus
{
  return self->_linkStatus;
}

- (NSArray)accessPoints
{
  return self->_accessPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPoints, 0);
}

uint64_t __41__RTWiFiManager_MobileWiFi__scheduleScan__block_invoke()
{
  return WiFiDeviceClientScanAsync();
}

uint64_t __50__RTWiFiManager_MobileWiFi__scheduleScanWithCache__block_invoke()
{
  return WiFiDeviceClientScanAsync();
}

uint64_t __47__RTWiFiManager_MobileWiFi__scheduleActiveScan__block_invoke()
{
  return WiFiDeviceClientScanAsync();
}

uint64_t __54__RTWiFiManager_MobileWiFi__scheduleScanWithChannels___block_invoke()
{
  return WiFiDeviceClientScanAsync();
}

uint64_t __39__RTWiFiManager_MobileWiFi__cancelScan__block_invoke()
{
  return WiFiDeviceClientScanCancel();
}

void __59__RTWiFiManager_MobileWiFi__destroyConnectionToWiFiManager__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t __67__RTWiFiManager_MobileWiFi__setRegisteredForExtendedLinkCallbacks___block_invoke()
{
  return WiFiDeviceClientRegisterExtendedLinkCallback();
}

uint64_t __60__RTWiFiManager_MobileWiFi__setRegisteredForPowerCallbacks___block_invoke()
{
  return WiFiDeviceClientRegisterPowerCallback();
}

uint64_t __65__RTWiFiManager_MobileWiFi__setRegisteredForScanUpdateCallbacks___block_invoke()
{
  return WiFiDeviceClientRegisterScanUpdateCallback();
}

uint64_t __64__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientPowerCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleWiFiDeviceClientPowerCallback:", *(_QWORD *)(a1 + 40));
}

uint64_t __81__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientExtendedLinkCallback_eventData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleWiFiDeviceClientExtendedLinkCallback:eventData:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __45__RTWiFiManager_MobileWiFi__pollAccessPoints__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  const void *v7;
  id v8;

  v6 = WiFiDeviceClientCopyCurrentNetwork();
  if (v6)
  {
    v7 = (const void *)v6;
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D18580]), "initWithWiFiNetwork:", v6);
    if (v8)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    CFRelease(v7);
    *a4 = 1;

  }
}

uint64_t __99__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientScanUpdateCallback_scanRequest_scanResults_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleScanResultsCallback:attemptCacheFallback:error:", *(_QWORD *)(a1 + 40), 0, *(unsigned int *)(a1 + 48));
  return +[RTWiFiScanMetrics submitWiFiScanMetricsWithErrorCode:accessPointsscanResultsCount:isScanIssuedByOtherClient:isCacheQuery:](RTWiFiScanMetrics, "submitWiFiScanMetricsWithErrorCode:accessPointsscanResultsCount:isScanIssuedByOtherClient:isCacheQuery:", *(int *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "count"), 1, 0);
}

uint64_t __81__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientScanCallback_scanResults_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleScanResultsCallback:attemptCacheFallback:error:", *(_QWORD *)(a1 + 40), 1, *(unsigned int *)(a1 + 48));
  return +[RTWiFiScanMetrics submitWiFiScanMetricsWithErrorCode:accessPointsscanResultsCount:isScanIssuedByOtherClient:isCacheQuery:](RTWiFiScanMetrics, "submitWiFiScanMetricsWithErrorCode:accessPointsscanResultsCount:isScanIssuedByOtherClient:isCacheQuery:", *(int *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "count"), 0, 0);
}

uint64_t __86__RTWiFiManager_MobileWiFi_handleWiFiDeviceClientCacheScanCallback_scanResults_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleScanResultsCallback:attemptCacheFallback:error:", *(_QWORD *)(a1 + 40), 0, *(unsigned int *)(a1 + 48));
  return +[RTWiFiScanMetrics submitWiFiScanMetricsWithErrorCode:accessPointsscanResultsCount:isScanIssuedByOtherClient:isCacheQuery:](RTWiFiScanMetrics, "submitWiFiScanMetricsWithErrorCode:accessPointsscanResultsCount:isScanIssuedByOtherClient:isCacheQuery:", *(int *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "count"), 0, 1);
}

void __82__RTWiFiManager_MobileWiFi__handleScanResultsCallback_attemptCacheFallback_error___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0D18580];
  v4 = a2;
  v6 = (id)objc_msgSend([v3 alloc], "initWithWiFiNetwork:", v4);

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    v5 = v6;
  }

}

void __85__RTWiFiManager_MobileWiFi_scanRequestWithType_dwellTime_channels_lowPriority_merge___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = (id)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("CHANNEL"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E9328D00, CFSTR("CHANNEL_FLAGS"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

@end
