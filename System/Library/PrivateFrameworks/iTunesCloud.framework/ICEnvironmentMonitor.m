@implementation ICEnvironmentMonitor

- (void)_onQueue_updateNetworkReachabilityAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  _BOOL4 wifiAssociated;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  void *v16;
  int v17;
  int64_t networkType;
  BOOL v19;
  _BOOL4 v20;
  _BOOL4 v21;
  const __CFString *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _BOOL4 currentNetworkLinkExpensive;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  void *v30;
  NSObject *calloutQueue;
  id v32;
  void *v33;
  NSObject *v34;
  id v35;
  int ethernetWired;
  BOOL v37;
  _BOOL4 networkConstrained;
  _BOOL4 v39;
  _QWORD v40[4];
  id v41;
  ICEnvironmentMonitor *v42;
  _QWORD block[4];
  id v44;
  ICEnvironmentMonitor *v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  _BOOL4 v51;
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  _BOOL4 v57;
  __int16 v58;
  _BOOL4 v59;
  __int16 v60;
  _BOOL4 v61;
  __int16 v62;
  _BOOL4 v63;
  uint64_t v64;

  v3 = a3;
  v64 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v5 = -[ICEnvironmentMonitor _onQueue_currentNetworkType](self, "_onQueue_currentNetworkType");
  wifiAssociated = self->_wifiAssociated;
  ethernetWired = self->_ethernetWired;
  networkConstrained = self->_networkConstrained;
  v7 = -[ICEnvironmentMonitor _onQueue_currentCellularLinkQuality](self, "_onQueue_currentCellularLinkQuality");
  self->_wifiAssociated = -[ICEnvironmentMonitor _onQueue_isWiFiAssociated](self, "_onQueue_isWiFiAssociated");
  self->_ethernetWired = v5 == 2000;
  self->_networkConstrained = -[ICEnvironmentMonitor _onQueue_networkConstrained](self, "_onQueue_networkConstrained");
  -[NWPathEvaluator path](self->_networkPathEvaluator, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "status");

  v10 = v9 == 1;
  if (v9 == 1)
  {
    v12 = 1;
  }
  else
  {
    -[NWPathEvaluator path](self->_networkPathEvaluator, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "status") == 3;

  }
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isWatch");

  if (v14 && v5)
    v12 = 1;
  v15 = v9 == 1;
  -[NWPathEvaluator path](self->_networkPathEvaluator, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_currentNetworkLinkExpensive = objc_msgSend(v16, "isExpensive");

  if (self->_remoteServerReachable == v10
    && self->_remoteServerLikelyReachable == v12
    && self->_currentNetworkLinkQuality == v7
    && self->_wifiAssociated == wifiAssociated
    && self->_networkConstrained == networkConstrained)
  {
    v17 = self->_ethernetWired;
    networkType = self->_networkType;
    v19 = networkType == v5;
    v20 = v17 != ethernetWired;
    if (v17 == ethernetWired && networkType == v5)
      goto LABEL_25;
  }
  else
  {
    v19 = self->_networkType == v5;
    v20 = 1;
  }
  v39 = v12;
  v21 = v15;
  v22 = CFSTR("fair");
  if (v7 < 0x14)
    v22 = CFSTR("low");
  if (v7 > 0x31)
    v22 = CFSTR("high");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d (%@)"), v7, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_telephonyStatusIndicator);
    v37 = v19;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    currentNetworkLinkExpensive = self->_currentNetworkLinkExpensive;
    v27 = self->_wifiAssociated;
    v28 = self->_ethernetWired;
    v29 = self->_networkConstrained;
    *(_DWORD *)buf = 67242242;
    v47 = v5;
    v48 = 2114;
    v49 = v25;
    v50 = 1024;
    v51 = v21;
    v52 = 1024;
    v53 = v39;
    v54 = 2114;
    v55 = v23;
    v56 = 1024;
    v57 = currentNetworkLinkExpensive;
    v58 = 1024;
    v59 = v27;
    v60 = 1024;
    v61 = v28;
    v62 = 1024;
    v63 = v29;
    _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_DEFAULT, "Network reachability values changed. networkType=%{public}d, telephonyDataIndicator=%{public}@, isRemoteServerReachable=%{BOOL}u, isRemoteServerLikelyReachable=%{BOOL}u, currentNetworkLinkQuality=%{public}@, _currentNetworkLinkExpensive=%{BOOL}u, _wifiAssociated=%{BOOL}u, _ethernetWired=%{BOOL}u, _networkConstrained=%{BOOL}u", buf, 0x40u);

    v19 = v37;
  }

  if (v20)
  {
    self->_remoteServerReachable = v10;
    self->_remoteServerLikelyReachable = v39;
    self->_currentNetworkLinkQuality = v7;
    if (v3)
    {
      os_unfair_recursive_lock_lock_with_options();
      v30 = (void *)-[NSHashTable copy](self->_observers, "copy");
      os_unfair_recursive_lock_unlock();
      calloutQueue = self->_calloutQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __77__ICEnvironmentMonitor__onQueue_updateNetworkReachabilityAndNotifyObservers___block_invoke;
      block[3] = &unk_1E4391110;
      v44 = v30;
      v45 = self;
      v32 = v30;
      dispatch_async(calloutQueue, block);

    }
  }
LABEL_25:
  if (!v19)
  {
    self->_networkType = v5;
    self->_wiFiActive = (unint64_t)(v5 - 1000) < 0x3E8;
    if (v5)
      self->_lastKnownNetworkType = v5;
    if (v3)
    {
      os_unfair_recursive_lock_lock_with_options();
      v33 = (void *)-[NSHashTable copy](self->_observers, "copy");
      os_unfair_recursive_lock_unlock();
      v34 = self->_calloutQueue;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __77__ICEnvironmentMonitor__onQueue_updateNetworkReachabilityAndNotifyObservers___block_invoke_2;
      v40[3] = &unk_1E4391110;
      v41 = v33;
      v42 = self;
      v35 = v33;
      dispatch_async(v34, v40);

    }
  }
}

- (BOOL)_onQueue_networkConstrained
{
  void *v3;
  char v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[NWPathEvaluator path](self->_networkPathEvaluator, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isConstrained");

  return v4;
}

- (BOOL)_onQueue_isWiFiAssociated
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_networksOfInterest;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "interface", (_QWORD)v12) == 1)
        {
          if (objc_msgSend(v10, "linkQuality") > v7)
            v7 = objc_msgSend(v10, "linkQuality");
          v6 = 1;
        }
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);

    if ((v6 & 1) != 0)
      return v7 > 0;
  }
  else
  {

  }
  return self->_wifiAssociated;
}

- (int64_t)_onQueue_currentNetworkType
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  int v23;
  ICEnvironmentMonitor *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalBuild");

  if (v4
    && (+[ICDefaults standardDefaults](ICDefaults, "standardDefaults"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "networkTypeOverride"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Found network type override value %{public}@", (uint8_t *)&v23, 0x16u);
    }

    v8 = objc_msgSend(v6, "integerValue");
  }
  else
  {
    -[NWPathEvaluator path](self->_networkPathEvaluator, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "status");

    if ((v10 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      -[NWPathEvaluator path](self->_networkPathEvaluator, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "usesInterfaceType:", 3);

      if ((v12 & 1) != 0)
      {
        return 2000;
      }
      else
      {
        -[NWPathEvaluator path](self->_networkPathEvaluator, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "usesInterfaceType:", 1);

        if ((v14 & 1) != 0)
        {
          return 1000;
        }
        else
        {
          v8 = 1;
          switch(self->_telephonyStatusIndicator)
          {
            case 0:
              -[NWPathEvaluator path](self->_networkPathEvaluator, "path");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "usesInterfaceType:", 2);

              if ((v16 & 1) != 0)
                return 100;
              -[NWPathEvaluator path](self->_networkPathEvaluator, "path");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v17, "usesInterfaceType:", 0))
              {

              }
              else
              {
                -[NWPathEvaluator path](self->_networkPathEvaluator, "path");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "usesInterfaceType:", 4);

                if ((v19 & 1) == 0)
                  goto LABEL_25;
              }
              v8 = 3000;
              break;
            case 1:
            case 2:
              return v8;
            case 3:
            case 4:
            case 5:
              return 2;
            case 6:
            case 7:
            case 0xD:
            case 0xE:
            case 0xF:
              return 3;
            case 8:
            case 0x10:
            case 0x11:
            case 0x12:
              return 4;
            case 9:
              return 5;
            case 0xA:
              return 6;
            case 0xB:
              return 7;
            case 0xC:
              return 8;
            default:
              goto LABEL_25;
          }
        }
      }
    }
    else
    {
LABEL_25:
      +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isWatch");

      if (v21)
        return -[ICEnvironmentMonitor _networkTypeFromWatchCarousel](self, "_networkTypeFromWatchCarousel");
      return 0;
    }
  }
  return v8;
}

- (int64_t)_onQueue_currentCellularLinkQuality
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int64_t v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  ICEnvironmentMonitor *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalBuild");

  if (v4)
  {
    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "networkLinkQualityOverride");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v23 = self;
        v24 = 2114;
        v25 = v6;
        _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Found network link quality override value %{public}@", buf, 0x16u);
      }

      v8 = (int)objc_msgSend(v6, "intValue");
      return v8;
    }
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_networksOfInterest;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v10)
  {

    return self->_currentNetworkLinkQuality;
  }
  v11 = v10;
  v12 = 0;
  v8 = 0;
  v13 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v18 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      if (objc_msgSend(v15, "interface", (_QWORD)v17) == 2)
      {
        if (objc_msgSend(v15, "linkQuality") > v8)
          v8 = objc_msgSend(v15, "linkQuality");
        v12 = 1;
      }
    }
    v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v11);

  if ((v12 & 1) == 0)
    return self->_currentNetworkLinkQuality;
  return v8;
}

uint64_t __35__ICEnvironmentMonitor_networkType__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 128);
  return result;
}

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  int v21;
  NSDictionary *v22;
  NSDictionary *cellSignalInfo;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[CTXPCServiceSubscriptionContext uuid](self->_dataSubscriptionContext, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    v24 = v7;
    v25 = v6;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v7, "legacyInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (!v12)
      goto LABEL_14;
    v13 = v12;
    v14 = *(_QWORD *)v27;
    v15 = *MEMORY[0x1E0CA71F8];
    v16 = (id)*MEMORY[0x1E0CA7200];
    while (1)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKeyedSubscript:", v15);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (v19 == v16)
        {

LABEL_11:
          v22 = (NSDictionary *)objc_msgSend(v18, "copy");
          cellSignalInfo = self->_cellSignalInfo;
          self->_cellSignalInfo = v22;

          continue;
        }
        v20 = v19;
        v21 = objc_msgSend(v19, "isEqual:", v16);

        if (v21)
          goto LABEL_11;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (!v13)
      {
LABEL_14:

        v7 = v24;
        v6 = v25;
        break;
      }
    }
  }

}

uint64_t __44__ICEnvironmentMonitor_isNetworkConstrained__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 127);
  return result;
}

uint64_t __53__ICEnvironmentMonitor_isRemoteServerLikelyReachable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 122);
  return result;
}

uint64_t __43__ICEnvironmentMonitor_currentThermalLevel__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 152);
  return result;
}

uint64_t __40__ICEnvironmentMonitor_isWiFiAssociated__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 124);
  return result;
}

uint64_t __73__ICEnvironmentMonitor__handleApplicationDidEnterForegroundNotification___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateTelephonyStateAndNotifyObservers:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateNetworkReachabilityAndNotifyObservers:", 1);
}

void __28__ICEnvironmentMonitor_init__block_invoke(uint64_t a1)
{
  int *v2;
  int *v3;
  NSObject *v4;
  uint64_t v5;
  uint32_t v6;
  NSObject *v7;
  int *v8;
  int *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  objc_class *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id *v42;
  void *v43;
  const char *v44;
  _QWORD *v45;
  int *v46;
  NSObject *v47;
  uint32_t v48;
  NSObject *v49;
  _QWORD v50[4];
  _QWORD *v51;
  _QWORD v52[4];
  _QWORD *v53;
  _QWORD v54[4];
  int *v55;
  _QWORD handler[4];
  int *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  const __CFString *v62;
  uint8_t buf[8];
  uint64_t v64;
  Class (*v65)(uint64_t);
  void *v66;
  uint64_t *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v2 = *(int **)(a1 + 32);
  v3 = v2 + 28;
  v4 = *((_QWORD *)v2 + 1);
  v5 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __28__ICEnvironmentMonitor_init__block_invoke_2;
  handler[3] = &unk_1E4391078;
  v57 = v2;
  v6 = notify_register_dispatch("com.apple.system.powersources.timeremaining", v3, v4, handler);
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "ICEnvironmentMonitor: failed to register for battery level notifications. status=%d", buf, 8u);
    }

  }
  v8 = *(int **)(a1 + 32);
  v9 = v8 + 29;
  v10 = *((_QWORD *)v8 + 1);
  v54[0] = v5;
  v54[1] = 3221225472;
  v54[2] = __28__ICEnvironmentMonitor_init__block_invoke_14;
  v54[3] = &unk_1E4391078;
  v55 = v8;
  v11 = notify_register_dispatch("com.apple.system.powersources.source", v9, v10, v54);
  if (v11)
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v11;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "ICEnvironmentMonitor: failed to register for power source notifications. status=%d", buf, 8u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updatePowerStateNotifyingObservers:", 0);
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "hasWiFiCapability")
    && objc_msgSend(MEMORY[0x1E0D4D070], "hasBoolEntitlement:", CFSTR("com.apple.private.corewifi")))
  {
    v14 = objc_msgSend(MEMORY[0x1E0D4D070], "hasEntitlement:inGroup:", CFSTR("com.apple.private.corewifi-xpc"), CFSTR("com.apple.security.exception.mach-lookup.global-name"));

    if (v14)
    {
      v58 = 0;
      v59 = &v58;
      v60 = 0x2050000000;
      v15 = (void *)getCWFInterfaceClass_softClass;
      v61 = getCWFInterfaceClass_softClass;
      if (!getCWFInterfaceClass_softClass)
      {
        *(_QWORD *)buf = v5;
        v64 = 3221225472;
        v65 = __getCWFInterfaceClass_block_invoke;
        v66 = &unk_1E4391138;
        v67 = &v58;
        __getCWFInterfaceClass_block_invoke((uint64_t)buf);
        v15 = (void *)v59[3];
      }
      v16 = objc_retainAutorelease(v15);
      _Block_object_dispose(&v58, 8);
      v17 = objc_alloc_init(v16);
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 88);
      *(_QWORD *)(v18 + 88) = v17;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "activate");
    }
  }
  else
  {

  }
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hasCellularDataCapability");

  if (v21)
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v23 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = v22;

    v24 = *(_QWORD **)(a1 + 32);
    v25 = (void *)v24[7];
    v52[0] = v5;
    v52[1] = 3221225472;
    v52[2] = __28__ICEnvironmentMonitor_init__block_invoke_24;
    v52[3] = &unk_1E43910A0;
    v53 = v24;
    objc_msgSend(v25, "getCurrentDataSubscriptionContext:", v52);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setDelegate:");

  }
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateTelephonyStateAndNotifyObservers:", 0);
  objc_msgSend(MEMORY[0x1E0CCECB0], "sharedDefaultEvaluator");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v26;

  v28 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v28)
  {
    objc_msgSend(v28, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("path"), 5, ICEnvironmentMonitorNetworkPathEvaluatorContext);
  }
  else
  {
    v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A03E3000, v29, OS_LOG_TYPE_ERROR, "ICEnvironmentMonitor: failed to create network path observer", buf, 2u);
    }

  }
  v30 = a1 + 32;
  *(_BYTE *)(*(_QWORD *)v30 + 127) = objc_msgSend(*(id *)(a1 + 32), "_onQueue_networkConstrained");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  *(_QWORD *)(*(_QWORD *)v30 + 104) = v31;

  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isWatch");
  v35 = 50;
  if (v34)
    v35 = 0;
  *(_QWORD *)(*(_QWORD *)v30 + 144) = v35;

  v62 = CFSTR("linkQuality");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)ICNOIKeysToObserve;
  ICNOIKeysToObserve = v36;

  v38 = objc_alloc_init(MEMORY[0x1E0DB0688]);
  v39 = *(void **)(*(_QWORD *)v30 + 96);
  *(_QWORD *)(*(_QWORD *)v30 + 96) = v38;

  v40 = *(void **)(*(_QWORD *)v30 + 96);
  if (v40)
  {
    objc_msgSend(v40, "setQueue:", *(_QWORD *)(*(_QWORD *)v30 + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "trackNOIAnyForInterfaceType:options:", 2, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "trackNOIAnyForInterfaceType:options:", 1, 0);
  }
  else
  {
    v41 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A03E3000, v41, OS_LOG_TYPE_ERROR, "Failed to create NWNetworkOfInterestManager", buf, 2u);
    }

  }
  v43 = *(void **)(a1 + 32);
  v42 = (id *)(a1 + 32);
  objc_msgSend(v43, "_onQueue_updateNetworkReachabilityAndNotifyObservers:", 0);
  objc_msgSend(*v42, "_onQueue_loadInitialThermalLevel");
  objc_msgSend(*((id *)*v42 + 7), "refreshCellMonitor:completion:", 0, &__block_literal_global_32_35460);
  v44 = (const char *)*MEMORY[0x1E0C83A00];
  v45 = *v42;
  v46 = (int *)((char *)*v42 + 48);
  v47 = v45[1];
  v50[0] = v5;
  v50[1] = 3221225472;
  v50[2] = __28__ICEnvironmentMonitor_init__block_invoke_33;
  v50[3] = &unk_1E4391078;
  v51 = v45;
  v48 = notify_register_dispatch(v44, v46, v47, v50);
  if (v48)
  {
    v49 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v48;
      _os_log_impl(&dword_1A03E3000, v49, OS_LOG_TYPE_DEFAULT, "error registering for thermal pressure levels change notifications status=%u", buf, 8u);
    }

  }
}

uint64_t __44__ICEnvironmentMonitor_didStartTrackingNOI___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "interface");
  if ((unint64_t)(result - 1) <= 1)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v16 = v4;
      v17 = 1024;
      v18 = objc_msgSend(v4, "linkQuality");
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "Start tracking interface %{public}@. linkQuality=%d", buf, 0x12u);
    }

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = (id)ICNOIKeysToObserve;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), 1, ICEnvironmentMonitorNOIContext, (_QWORD)v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "addObject:", *(_QWORD *)(a1 + 32));
    return objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateNetworkReachabilityAndNotifyObservers:", 1);
  }
  return result;
}

uint64_t __71__ICEnvironmentMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateTelephonyStateAndNotifyObservers:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateNetworkReachabilityAndNotifyObservers:", 1);
}

- (void)_onQueue_updateTelephonyStateAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  CTXPCServiceSubscriptionContext *dataSubscriptionContext;
  CTXPCServiceSubscriptionContext *v6;
  NSString *v7;
  CoreTelephonyClient *telephonyClient;
  NSString *v9;
  id v10;
  NSString *telephonyOperatorName;
  NSObject *v12;
  NSString *v13;
  char v14;
  NSString *v15;
  CoreTelephonyClient *v16;
  NSString *v17;
  id v18;
  NSString *telephonyRegistrationStatus;
  NSObject *v20;
  int v21;
  NSString *v22;
  int telephonyStatusIndicator;
  CoreTelephonyClient *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  int v29;
  int v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  dataSubscriptionContext = self->_dataSubscriptionContext;
  if (dataSubscriptionContext)
  {
    v6 = dataSubscriptionContext;
    v7 = self->_telephonyOperatorName;
    telephonyClient = self->_telephonyClient;
    v33 = 0;
    -[CoreTelephonyClient getOperatorName:error:](telephonyClient, "getOperatorName:error:", v6, &v33);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = v33;
    telephonyOperatorName = self->_telephonyOperatorName;
    self->_telephonyOperatorName = v9;

    if (v10)
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v10;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "Error fetching operator name. error=%{public}@", buf, 0xCu);
      }

    }
    v13 = self->_telephonyOperatorName;
    if (v13 == v7)
      v14 = 0;
    else
      v14 = !-[NSString isEqualToString:](v13, "isEqualToString:", v7);
    v15 = self->_telephonyRegistrationStatus;
    v16 = self->_telephonyClient;
    v32 = 0;
    v17 = (NSString *)-[CoreTelephonyClient copyRegistrationStatus:error:](v16, "copyRegistrationStatus:error:", v6, &v32);
    v18 = v32;
    telephonyRegistrationStatus = self->_telephonyRegistrationStatus;
    self->_telephonyRegistrationStatus = v17;

    if (v18)
    {
      v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v18;
        _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_ERROR, "Error fetching registration status. error=%{public}@", buf, 0xCu);
      }

    }
    if ((v14 & 1) != 0)
    {
      v21 = 1;
    }
    else
    {
      v22 = self->_telephonyRegistrationStatus;
      if (v22 == v15)
        v21 = 0;
      else
        v21 = !-[NSString isEqualToString:](v22, "isEqualToString:", v15);
    }
    telephonyStatusIndicator = self->_telephonyStatusIndicator;
    v24 = self->_telephonyClient;
    v31 = 0;
    -[CoreTelephonyClient getDataStatus:error:](v24, "getDataStatus:error:", v6, &v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v31;
    if (v26)
    {
      v27 = v26;
      v28 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v27;
        _os_log_impl(&dword_1A03E3000, v28, OS_LOG_TYPE_ERROR, "Error fetching data status. error=%{public}@", buf, 0xCu);
      }

    }
    if (v25)
    {
      v29 = objc_msgSend(v25, "indicator");
      self->_telephonyStatusIndicator = v29;
      if (v29 == telephonyStatusIndicator)
        v30 = v21;
      else
        v30 = 1;
      if (!v3)
        goto LABEL_31;
      if (v29 == telephonyStatusIndicator)
      {
        if (!v30)
          goto LABEL_31;
      }
      else
      {
        -[ICEnvironmentMonitor _onQueue_updateNetworkReachabilityAndNotifyObservers:](self, "_onQueue_updateNetworkReachabilityAndNotifyObservers:", 1);
      }
    }
    else if ((v3 & v21 & 1) == 0)
    {
LABEL_31:

      return;
    }
    -[ICEnvironmentMonitor _notifyObserversEnvironmentMonitorDidChangeTelephonyStatus](self, "_notifyObserversEnvironmentMonitorDidChangeTelephonyStatus");
    goto LABEL_31;
  }
}

- (void)_onQueue_updatePowerStateNotifyingObservers:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *calloutQueue;
  id v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  double v21;
  double v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  ICEnvironmentMonitor *v29;
  _QWORD block[4];
  id v31;
  ICEnvironmentMonitor *v32;
  unsigned __int8 v33;
  unsigned __int8 charging;
  int currentBatteryLevel;
  uint8_t buf[4];
  _BYTE v37[10];
  void *v38;
  uint64_t v39;

  v3 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  currentBatteryLevel = (int)self->_currentBatteryLevel;
  charging = self->_charging;
  v33 = 0;
  v5 = IOPSDrawingUnlimitedPower();
  v6 = IOPSGetPercentRemaining();
  if (v6)
  {
    v7 = v6;
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v37 = v7;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v7;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "Failed to get current batter state. err=%d (%x)", buf, 0xEu);
    }

  }
  charging |= v5;
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "chargingStateOverride");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v37 = self;
      *(_WORD *)&v37[8] = 2114;
      v38 = v10;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Found charging state override value %{public}@", buf, 0x16u);
    }

    v12 = objc_msgSend(v10, "BOOLValue");
    charging = v12;
  }
  else
  {
    v12 = charging;
  }
  if (self->_charging != v12)
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v37 = charging;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v33;
      LOWORD(v38) = 1024;
      *(_DWORD *)((char *)&v38 + 2) = v5;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "Power state changed. isCharging=%d, isFullyCharged=%d, powerSourceIsUnlimited=%d", buf, 0x14u);
    }

    self->_charging = charging;
    if (v3)
    {
      os_unfair_recursive_lock_lock_with_options();
      v14 = (void *)-[NSHashTable copy](self->_observers, "copy");
      os_unfair_recursive_lock_unlock();
      calloutQueue = self->_calloutQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__ICEnvironmentMonitor__onQueue_updatePowerStateNotifyingObservers___block_invoke;
      block[3] = &unk_1E4391110;
      v31 = v14;
      v32 = self;
      v16 = v14;
      dispatch_async(calloutQueue, block);

    }
  }
  v17 = currentBatteryLevel;
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "batteryLevelOverride");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v37 = self;
      *(_WORD *)&v37[8] = 2114;
      v38 = v19;
      _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Found battery level override value %{public}@", buf, 0x16u);
    }

    objc_msgSend(v19, "doubleValue");
    v22 = v21;
  }
  else
  {
    v22 = (double)v17 / 100.0;
  }
  if (v22 != self->_currentBatteryLevel)
  {
    v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v37 = v22;
      _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_DEFAULT, "Battery level changed. batteryLevel=%.2f", buf, 0xCu);
    }

    self->_currentBatteryLevel = v22;
    if (v3)
    {
      os_unfair_recursive_lock_lock_with_options();
      v24 = (void *)-[NSHashTable copy](self->_observers, "copy");
      os_unfair_recursive_lock_unlock();
      v25 = self->_calloutQueue;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __68__ICEnvironmentMonitor__onQueue_updatePowerStateNotifyingObservers___block_invoke_89;
      v27[3] = &unk_1E4391110;
      v28 = v24;
      v29 = self;
      v26 = v24;
      dispatch_async(v25, v27);

    }
  }

}

- (void)_onQueue_loadInitialThermalLevel
{
  uint32_t v3;
  uint32_t v4;
  NSObject *v5;
  unint64_t *p_currentThermalLevel;
  uint32_t state;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  unint64_t v15;
  int out_token;
  uint8_t buf[4];
  _DWORD v18[7];

  *(_QWORD *)&v18[5] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  out_token = 0;
  v3 = notify_register_check((const char *)*MEMORY[0x1E0C83A00], &out_token);
  if (!v3)
  {
    p_currentThermalLevel = &self->_currentThermalLevel;
    state = notify_get_state(out_token, &self->_currentThermalLevel);
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v9 = v8;
    if (state)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = *p_currentThermalLevel;
        *(_DWORD *)buf = 67109376;
        v18[0] = state;
        LOWORD(v18[1]) = 2048;
        *(_QWORD *)((char *)&v18[1] + 2) = v10;
        v11 = "error getting current thermal pressure level - status=%u, _currentThermalLevel=%llu";
        v12 = v9;
        v13 = OS_LOG_TYPE_ERROR;
        v14 = 18;
LABEL_10:
        _os_log_impl(&dword_1A03E3000, v12, v13, v11, buf, v14);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *p_currentThermalLevel;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v18 = v15;
      v11 = "current thermal pressure level=%llu";
      v12 = v9;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 12;
      goto LABEL_10;
    }

    notify_cancel(out_token);
    return;
  }
  v4 = v3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v18[0] = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "error checking for thermal pressure level status=%u", buf, 8u);
  }

}

- (void)_notifyObserversEnvironmentMonitorDidChangeTelephonyStatus
{
  void *v3;
  NSObject *calloutQueue;
  id v5;
  _QWORD v6[4];
  id v7;
  ICEnvironmentMonitor *v8;

  os_unfair_recursive_lock_lock_with_options();
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy");
  os_unfair_recursive_lock_unlock();
  calloutQueue = self->_calloutQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__ICEnvironmentMonitor__notifyObserversEnvironmentMonitorDidChangeTelephonyStatus__block_invoke;
  v6[3] = &unk_1E4391110;
  v7 = v3;
  v8 = self;
  v5 = v3;
  dispatch_async(calloutQueue, v6);

}

uint64_t __39__ICEnvironmentMonitor_isEthernetWired__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 125);
  return result;
}

- (BOOL)isNetworkConstrained
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__ICEnvironmentMonitor_isNetworkConstrained__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)currentThermalPressureLevel
{
  int v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;

  v2 = -[ICEnvironmentMonitor currentThermalLevel](self, "currentThermalLevel");
  v3 = 30;
  v4 = 40;
  v5 = 50;
  if (v2 != 50)
    v5 = 0;
  if (v2 != 40)
    v4 = v5;
  if (v2 != 30)
    v3 = v4;
  v6 = 10;
  v7 = 20;
  if (v2 != 20)
    v7 = 0;
  if (v2 != 10)
    v6 = v7;
  if (v2 <= 29)
    return v6;
  else
    return v3;
}

- (unint64_t)currentThermalLevel
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__ICEnvironmentMonitor_currentThermalLevel__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __82__ICEnvironmentMonitor__notifyObserversEnvironmentMonitorDidChangeTelephonyStatus__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "environmentMonitorDidChangeTelephonyStatus:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __77__ICEnvironmentMonitor__onQueue_updateNetworkReachabilityAndNotifyObservers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "environmentMonitorDidChangeNetworkReachability:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)registerObserver:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    os_unfair_recursive_lock_lock_with_options();
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);

    os_unfair_recursive_lock_unlock();
  }
}

- (BOOL)isRemoteServerLikelyReachable
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__ICEnvironmentMonitor_isRemoteServerLikelyReachable__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (ICEnvironmentMonitor)sharedMonitor
{
  if (sharedMonitor_sOnceToken_35479 != -1)
    dispatch_once(&sharedMonitor_sOnceToken_35479, &__block_literal_global_35480);
  return (ICEnvironmentMonitor *)(id)sharedMonitor_sSharedMonitor_35481;
}

- (int64_t)networkType
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__ICEnvironmentMonitor_networkType__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isWiFiAssociated
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__ICEnvironmentMonitor_isWiFiAssociated__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isEthernetWired
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__ICEnvironmentMonitor_isEthernetWired__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __37__ICEnvironmentMonitor_sharedMonitor__block_invoke()
{
  ICEnvironmentMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(ICEnvironmentMonitor);
  v1 = (void *)sharedMonitor_sSharedMonitor_35481;
  sharedMonitor_sSharedMonitor_35481 = (uint64_t)v0;

}

- (ICEnvironmentMonitor)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ICEnvironmentMonitor;
  v2 = -[ICEnvironmentMonitor init](&v15, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.itunescloud.ICEnvironmentMonitor.accessQueue", 0);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = dispatch_queue_create("com.apple.itunescloud.ICEnvironmentMonitor.calloutQueue", MEMORY[0x1E0C80D50]);
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v7;

    *((_QWORD *)v2 + 4) = 0;
    *((_QWORD *)v2 + 14) = -1;
    *((_DWORD *)v2 + 16) = 0;
    *((_QWORD *)v2 + 19) = 0;
    *((_DWORD *)v2 + 12) = -1;
    v9 = *((_QWORD *)v2 + 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__ICEnvironmentMonitor_init__block_invoke;
    block[3] = &unk_1E43913D8;
    v10 = v2;
    v14 = v10;
    dispatch_async(v9, block);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel__handleApplicationDidEnterForegroundNotification_, CFSTR("UIApplicationDidEnterForegroundNotification"), 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel__handleApplicationDidEnterForegroundNotification_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

  }
  return (ICEnvironmentMonitor *)v2;
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ICEnvironmentMonitor *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ICEnvironmentMonitor_didStartTrackingNOI___block_invoke;
  v7[3] = &unk_1E4391110;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __53__ICEnvironmentMonitor_isCurrentNetworkLinkExpensive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 123);
  return result;
}

uint64_t __47__ICEnvironmentMonitor_isRemoteServerReachable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 121);
  return result;
}

void __45__ICEnvironmentMonitor_telephonyOperatorName__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 168));
}

- (void)_handleApplicationDidEnterForegroundNotification:(id)a3
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ICEnvironmentMonitor__handleApplicationDidEnterForegroundNotification___block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

void __28__ICEnvironmentMonitor_init__block_invoke_30(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "ICEnvironmentMonitor: [_telephonyClient refreshCellMonitor] failed error=%{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __38__ICEnvironmentMonitor_signalStrength__block_invoke(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 56));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 88));
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(a1[4] + 128);
}

void __34__ICEnvironmentMonitor_signalInfo__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 88));
  v2 = objc_msgSend(*(id *)(a1[4] + 80), "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(a1[4] + 128);
}

- (NSDictionary)signalStrength
{
  id v3;
  NSObject *accessQueue;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  float v26;
  float v27;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  _QWORD block[8];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t buf[4];
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__35395;
  v54 = __Block_byref_object_dispose__35396;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__35395;
  v44 = __Block_byref_object_dispose__35396;
  v45 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ICEnvironmentMonitor_signalStrength__block_invoke;
  block[3] = &unk_1E43910E8;
  block[4] = self;
  block[5] = &v50;
  block[6] = &v40;
  block[7] = &v46;
  dispatch_sync(accessQueue, block);
  v5 = v47[3];
  if ((unint64_t)(v5 - 1) > 0x1F2)
  {
    v9 = 0;
  }
  else
  {
    v6 = (void *)v51[5];
    v38 = 0;
    objc_msgSend(v6, "getCurrentDataServiceDescriptorSync:", &v38);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v38;
    if (v8)
    {
      v9 = v8;
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v57 = v9;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve Current Data CTServiceDescriptor: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v11 = (void *)v51[5];
      v37 = 0;
      objc_msgSend(v11, "getPublicSignalStrength:error:", v7, &v37);
      v10 = objc_claimAutoreleasedReturnValue();
      v12 = v37;
      if (v12)
      {
        v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v57 = v12;
          _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "Failed to retrieve CTSignalStrengthInfo %{public}@", buf, 0xCu);
        }
      }
      else
      {
        -[NSObject maxDisplayBars](v10, "maxDisplayBars");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("signal-bars-max"));

        -[NSObject displayBars](v10, "displayBars");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("signal-bars"));
      }

      v15 = (void *)v51[5];
      v36 = v12;
      objc_msgSend(v15, "getSignalStrengthMeasurements:error:", v7, &v36);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v36;

      if (v9)
      {
        v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v57 = v9;
          _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_ERROR, "Failed to retrieve CTSignalStrengthMeasurements %{public}@", buf, 0xCu);
        }
      }
      else
      {
        objc_msgSend(v16, "rssi");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("gsm-rssi"));

        objc_msgSend(v16, "rscp");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("umts-rscp"));

        objc_msgSend(v16, "ecn0");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("umts-ecn0"));

        objc_msgSend(v16, "rsrp");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("lte-rsrp"));

        objc_msgSend(v16, "rsrq");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("lte-rsrq"));

        objc_msgSend(v16, "snr");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("lte-snr"));

        objc_msgSend(v16, "ecio");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("evdo-ecio"));

        objc_msgSend(v16, "rxagc");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("evdo-rxagc"));
      }

    }
    v5 = v47[3];
  }
  if ((unint64_t)(v5 - 1000) <= 0x3E7)
  {
    v25 = (float)objc_msgSend((id)v41[5], "RSSI") + 77.5;
    v26 = fabsf(sqrtf((float)(v25 * v25) + 450.0));
    v27 = (float)(v25 / (float)(v26 + v26)) + 0.5;
    if (v27 < 0.0 || v27 > 1.0)
    {
      v29 = 0;
    }
    else
    {
      v30 = vcvtps_u32_f32(v27 * 3.0);
      if (v30 <= 1)
        v30 = 1;
      if (v30 >= 3)
        v29 = 3;
      else
        v29 = v30;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("signal-bars"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("signal-bars-max"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)v41[5], "RSSI"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("wifi-rssi"));

  }
  v34 = (void *)objc_msgSend(v3, "copy");

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  return (NSDictionary *)v34;
}

- (NSDictionary)signalInfo
{
  id v3;
  NSObject *accessQueue;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD block[8];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _BYTE v59[128];
  _QWORD v60[17];

  v60[16] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__35395;
  v57 = __Block_byref_object_dispose__35396;
  v58 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__35395;
  v47 = __Block_byref_object_dispose__35396;
  v48 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ICEnvironmentMonitor_signalInfo__block_invoke;
  block[3] = &unk_1E43910E8;
  block[4] = self;
  block[5] = &v43;
  block[6] = &v53;
  block[7] = &v49;
  dispatch_sync(accessQueue, block);
  v5 = *MEMORY[0x1E0CA7230];
  v60[0] = *MEMORY[0x1E0CA7220];
  v60[1] = v5;
  v6 = *MEMORY[0x1E0CA7218];
  v60[2] = *MEMORY[0x1E0CA71F0];
  v60[3] = v6;
  v7 = *MEMORY[0x1E0CA71C8];
  v60[4] = *MEMORY[0x1E0CA72C8];
  v60[5] = v7;
  v8 = *MEMORY[0x1E0CA71D8];
  v60[6] = *MEMORY[0x1E0CA7238];
  v60[7] = v8;
  v9 = *MEMORY[0x1E0CA7250];
  v60[8] = *MEMORY[0x1E0CA71D0];
  v60[9] = v9;
  v10 = *MEMORY[0x1E0CA72B0];
  v60[10] = *MEMORY[0x1E0CA7258];
  v60[11] = v10;
  v11 = *MEMORY[0x1E0CA7210];
  v60[12] = *MEMORY[0x1E0CA7248];
  v60[13] = v11;
  v12 = *MEMORY[0x1E0CA7208];
  v60[14] = *MEMORY[0x1E0CA7260];
  v60[15] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v50[3];
  if ((unint64_t)(v15 - 1) <= 0x1F2)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v59, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(v16);
          v20 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend((id)v54[5], "objectForKeyedSubscript:", v20, (_QWORD)v38);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend((id)v54[5], "objectForKeyedSubscript:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, v20);

          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v59, 16);
      }
      while (v17);
    }

    v15 = v50[3];
  }
  if ((unint64_t)(v15 - 1000) <= 0x3E7)
  {
    v23 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend((id)v44[5], "txRate");
    objc_msgSend(v23, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("wifi-txRate"));

    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend((id)v44[5], "channel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithUnsignedInt:", objc_msgSend(v26, "flags"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("wifi-channel-flags"));

    v28 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend((id)v44[5], "channel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "numberWithUnsignedInt:", objc_msgSend(v29, "width"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("wifi-channel-width"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)v44[5], "PHYMode"));
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("wifi-phyMode"));

    objc_msgSend((id)v44[5], "countryCode");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v31) = v32 == 0;

    if ((v31 & 1) == 0)
    {
      objc_msgSend((id)v44[5], "countryCode");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("wifi-countryCode"));

    }
    v34 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend((id)v44[5], "rxRate", (_QWORD)v38);
    objc_msgSend(v34, "numberWithDouble:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("wifi-rxRate"));

  }
  v36 = (void *)objc_msgSend(v3, "copy", (_QWORD)v38);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return (NSDictionary *)v36;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *accessQueue;
  NSObject *v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  ICEnvironmentMonitor *v18;
  _QWORD block[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)ICEnvironmentMonitorNetworkPathEvaluatorContext == a6)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__ICEnvironmentMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E43913D8;
    block[4] = self;
    dispatch_async(accessQueue, block);
  }
  else if ((void *)ICEnvironmentMonitorNOIContext == a6)
  {
    v14 = self->_accessQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__ICEnvironmentMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v16[3] = &unk_1E4391110;
    v17 = v11;
    v18 = self;
    dispatch_async(v14, v16);

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ICEnvironmentMonitor;
    -[ICEnvironmentMonitor observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

uint64_t __55__ICEnvironmentMonitor_isCurrentNetworkLinkHighQuality__block_invoke(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 128) != 0;
  v1 = *(_QWORD *)(result + 32);
  if ((unint64_t)(*(_QWORD *)(v1 + 128) - 1) <= 0x1F2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(v1 + 144) > 0x31uLL;
  return result;
}

- (BOOL)isCurrentNetworkLinkExpensive
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__ICEnvironmentMonitor_isCurrentNetworkLinkExpensive__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isRemoteServerReachable
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__ICEnvironmentMonitor_isRemoteServerReachable__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCurrentNetworkLinkHighQuality
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__ICEnvironmentMonitor_isCurrentNetworkLinkHighQuality__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)telephonyOperatorName
{
  NSObject *accessQueue;
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
  v9 = __Block_byref_object_copy__35395;
  v10 = __Block_byref_object_dispose__35396;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ICEnvironmentMonitor_telephonyOperatorName__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __61__ICEnvironmentMonitor__onQueue_updateThermalLevelWithToken___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "environmentMonitorDidChangeThermalLevel:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_onQueue_updateThermalLevelWithToken:(int)a3
{
  uint32_t state;
  uint32_t v6;
  NSObject *v7;
  unint64_t currentThermalLevel;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  NSObject *calloutQueue;
  _QWORD block[4];
  id v14;
  ICEnvironmentMonitor *v15;
  uint64_t state64;
  uint8_t buf[4];
  _BYTE v18[18];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  state64 = 0;
  state = notify_get_state(a3, &state64);
  if (state)
  {
    v6 = state;
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      currentThermalLevel = self->_currentThermalLevel;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v18 = v6;
      *(_WORD *)&v18[4] = 2048;
      *(_QWORD *)&v18[6] = currentThermalLevel;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "Failed to get current thermal level. status=%u, using %llu for now", buf, 0x12u);
    }
  }
  else
  {
    if (state64 == self->_currentThermalLevel)
      return;
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_currentThermalLevel;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v18 = v10;
      *(_WORD *)&v18[8] = 2048;
      *(_QWORD *)&v18[10] = state64;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "thermal levels changed - oldValue=%llu, newValue=%llu", buf, 0x16u);
    }

    self->_currentThermalLevel = state64;
    os_unfair_recursive_lock_lock_with_options();
    v11 = (void *)-[NSHashTable copy](self->_observers, "copy");
    os_unfair_recursive_lock_unlock();
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__ICEnvironmentMonitor__onQueue_updateThermalLevelWithToken___block_invoke;
    block[3] = &unk_1E4391110;
    v14 = v11;
    v15 = self;
    v7 = v11;
    dispatch_async(calloutQueue, block);

  }
}

- (void)dealloc
{
  NWPathEvaluator *networkPathEvaluator;
  NWPathEvaluator *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int batteryNotificationToken;
  int powerSourceNotificationToken;
  void *v17;
  int thermalNotificationToken;
  NSMutableSet *obj;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  networkPathEvaluator = self->_networkPathEvaluator;
  if (networkPathEvaluator)
  {
    -[NWPathEvaluator removeObserver:forKeyPath:context:](networkPathEvaluator, "removeObserver:forKeyPath:context:", self, CFSTR("path"), ICEnvironmentMonitorNetworkPathEvaluatorContext);
    v4 = self->_networkPathEvaluator;
    self->_networkPathEvaluator = 0;

  }
  -[CoreTelephonyClient setDelegate:](self->_telephonyClient, "setDelegate:", 0);
  -[CWFInterface invalidate](self->_wifiInterface, "invalidate");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_networksOfInterest;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v10 = (id)ICNOIKeysToObserve;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v9, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14++));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  -[NSMutableSet removeAllObjects](self->_networksOfInterest, "removeAllObjects");
  -[NWNetworkOfInterestManager setDelegate:](self->_noiManager, "setDelegate:", 0);
  -[NWNetworkOfInterestManager destroy](self->_noiManager, "destroy");
  batteryNotificationToken = self->_batteryNotificationToken;
  if (batteryNotificationToken != -1)
    notify_cancel(batteryNotificationToken);
  powerSourceNotificationToken = self->_powerSourceNotificationToken;
  if (powerSourceNotificationToken != -1)
    notify_cancel(powerSourceNotificationToken);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObserver:", self);

  thermalNotificationToken = self->_thermalNotificationToken;
  if (thermalNotificationToken != -1)
    notify_cancel(thermalNotificationToken);
  v20.receiver = self;
  v20.super_class = (Class)ICEnvironmentMonitor;
  -[ICEnvironmentMonitor dealloc](&v20, sel_dealloc);
}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

  os_unfair_recursive_lock_unlock();
}

- (BOOL)isCharging
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__ICEnvironmentMonitor_isCharging__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)lastKnownNetworkType
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__ICEnvironmentMonitor_lastKnownNetworkType__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)currentNetworkLinkQuality
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__ICEnvironmentMonitor_currentNetworkLinkQuality__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isWifiActive
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__ICEnvironmentMonitor_isWifiActive__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)currentBatteryLevel
{
  NSObject *accessQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__ICEnvironmentMonitor_currentBatteryLevel__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)telephonyRegistrationStatus
{
  NSObject *accessQueue;
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
  v9 = __Block_byref_object_copy__35395;
  v10 = __Block_byref_object_dispose__35396;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__ICEnvironmentMonitor_telephonyRegistrationStatus__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (int64_t)currentThermalState
{
  int v2;
  int64_t v4;

  v2 = -[ICEnvironmentMonitor currentThermalLevel](self, "currentThermalLevel");
  if (v2 <= 29)
  {
    v4 = 2;
    if (v2 != 20)
      v4 = 0;
    if (v2 == 10)
      return 1;
    else
      return v4;
  }
  else if (v2 == 30 || v2 == 40 || v2 == 50)
  {
    return 3;
  }
  else
  {
    return 0;
  }
}

- (int64_t)_networkTypeFromWatchCarousel
{
  return 0;
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  NSObject *accessQueue;
  id v6;
  void *v7;
  void *v8;

  accessQueue = self->_accessQueue;
  v6 = a3;
  dispatch_assert_queue_V2(accessQueue);
  -[CTXPCServiceSubscriptionContext uuid](self->_dataSubscriptionContext, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v7, "isEqual:", v8);
  if ((_DWORD)v6)
    -[ICEnvironmentMonitor _onQueue_updateTelephonyStateAndNotifyObservers:](self, "_onQueue_updateTelephonyStateAndNotifyObservers:", 1);
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  NSObject *accessQueue;
  id v6;
  void *v7;
  void *v8;

  accessQueue = self->_accessQueue;
  v6 = a3;
  dispatch_assert_queue_V2(accessQueue);
  -[CTXPCServiceSubscriptionContext uuid](self->_dataSubscriptionContext, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v7, "isEqual:", v8);
  if ((_DWORD)v6)
    -[ICEnvironmentMonitor _onQueue_updateTelephonyStateAndNotifyObservers:](self, "_onQueue_updateTelephonyStateAndNotifyObservers:", 1);
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  NSObject *accessQueue;
  id v7;
  void *v8;
  void *v9;

  accessQueue = self->_accessQueue;
  v7 = a3;
  dispatch_assert_queue_V2(accessQueue);
  -[CTXPCServiceSubscriptionContext uuid](self->_dataSubscriptionContext, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v8, "isEqual:", v9);
  if ((_DWORD)v7)
    -[ICEnvironmentMonitor _onQueue_updateTelephonyStateAndNotifyObservers:](self, "_onQueue_updateTelephonyStateAndNotifyObservers:", 1);
}

- (void)currentDataSimChanged:(id)a3
{
  CTXPCServiceSubscriptionContext *v4;
  CTXPCServiceSubscriptionContext *dataSubscriptionContext;

  v4 = (CTXPCServiceSubscriptionContext *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  dataSubscriptionContext = self->_dataSubscriptionContext;
  self->_dataSubscriptionContext = v4;

  -[ICEnvironmentMonitor _onQueue_updateTelephonyStateAndNotifyObservers:](self, "_onQueue_updateTelephonyStateAndNotifyObservers:", 1);
}

- (void)didStopTrackingNOI:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ICEnvironmentMonitor *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ICEnvironmentMonitor_didStopTrackingNOI___block_invoke;
  v7[3] = &unk_1E4391110;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)didStopTrackingAllNOIs:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ICEnvironmentMonitor *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ICEnvironmentMonitor_didStopTrackingAllNOIs___block_invoke;
  v7[3] = &unk_1E4391110;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (BOOL)isWiFiActive
{
  return self->_wiFiActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyRegistrationStatus, 0);
  objc_storeStrong((id *)&self->_telephonyOperatorName, 0);
  objc_storeStrong((id *)&self->_networksOfInterest, 0);
  objc_storeStrong((id *)&self->_noiManager, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
  objc_storeStrong((id *)&self->_cellSignalInfo, 0);
  objc_storeStrong((id *)&self->_dataSubscriptionContext, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_networkPathEvaluator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __47__ICEnvironmentMonitor_didStopTrackingAllNOIs___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v18 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "Stop tracking interfaces %{public}@", buf, 0xCu);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 40), "didStopTrackingNOI:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(NSObject **)(v9 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ICEnvironmentMonitor_didStopTrackingAllNOIs___block_invoke_94;
  block[3] = &unk_1E43913D8;
  block[4] = v9;
  dispatch_async(v10, block);
}

uint64_t __47__ICEnvironmentMonitor_didStopTrackingAllNOIs___block_invoke_94(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "Start tracking WiFi and Cellular link changes", v4, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "trackNOIAnyForInterfaceType:options:", 2, 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "trackNOIAnyForInterfaceType:options:", 1, 0);
}

uint64_t __43__ICEnvironmentMonitor_didStopTrackingNOI___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "interface");
  if ((unint64_t)(result - 1) <= 1)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v16 = v4;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "Stop tracking interface %{public}@", buf, 0xCu);
    }

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = (id)ICNOIKeysToObserve;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), ICEnvironmentMonitorNOIContext, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "removeObject:", *(_QWORD *)(a1 + 32));
    return objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateNetworkReachabilityAndNotifyObservers:", 1);
  }
  return result;
}

void __71__ICEnvironmentMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (objc_msgSend(v2, "interface") == 2)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
    goto LABEL_7;
  }
  if (objc_msgSend(v2, "interface") == 1)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:
      v4 = 138543618;
      v5 = v2;
      v6 = 1024;
      v7 = objc_msgSend(v2, "linkQuality");
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "Received link quality change on interface %{public}@. linkQuality=%d", (uint8_t *)&v4, 0x12u);
    }
LABEL_7:

    objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateNetworkReachabilityAndNotifyObservers:", 1);
  }

}

void __68__ICEnvironmentMonitor__onQueue_updatePowerStateNotifyingObservers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "environmentMonitorDidChangePower:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __68__ICEnvironmentMonitor__onQueue_updatePowerStateNotifyingObservers___block_invoke_89(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "environmentMonitorDidChangeBatteryLevel:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __77__ICEnvironmentMonitor__onQueue_updateNetworkReachabilityAndNotifyObservers___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  objc_msgSend(*(id *)(a1 + 32), "allObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "environmentMonitorDidChangeNetworkType:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __51__ICEnvironmentMonitor_telephonyRegistrationStatus__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 176));
}

double __43__ICEnvironmentMonitor_currentBatteryLevel__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 160);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __36__ICEnvironmentMonitor_isWifiActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 126);
  return result;
}

uint64_t __49__ICEnvironmentMonitor_currentNetworkLinkQuality__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 144);
  return result;
}

uint64_t __44__ICEnvironmentMonitor_lastKnownNetworkType__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 136);
  return result;
}

uint64_t __34__ICEnvironmentMonitor_isCharging__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 120);
  return result;
}

uint64_t __28__ICEnvironmentMonitor_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updatePowerStateNotifyingObservers:", 1);
}

uint64_t __28__ICEnvironmentMonitor_init__block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updatePowerStateNotifyingObservers:", 1);
}

void __28__ICEnvironmentMonitor_init__block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "ICEnvironmentMonitor: getCurrentDataSubscriptionContext failed error=%{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), a2);
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateTelephonyStateAndNotifyObservers:", 0);
  }

}

uint64_t __28__ICEnvironmentMonitor_init__block_invoke_33(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateThermalLevelWithToken:", a2);
}

@end
