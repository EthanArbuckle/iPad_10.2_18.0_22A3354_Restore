@implementation RBDaemon

- (void)assertionManager:(id)a3 didInvalidateAssertions:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  RBProcessManager *processManager;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD block[5];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v6)
  {
    v7 = v6;
    v32 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v32)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        -[RBProcessReconnectManager didInvalidateAssertion:](self->_reconnectManager, "didInvalidateAssertion:", v9);
        objc_msgSend(v9, "target");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v9, "invalidationReason");
        -[RBProcessManager processForIdentity:](self->_processManager, "processForIdentity:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          processManager = self->_processManager;
          objc_msgSend(v9, "originator");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "terminationContextForTargetProcess:originatorProcessIsActive:", v13, -[RBProcessManager isActiveProcess:](processManager, "isActiveProcess:", v15));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(v9, "endPolicy");
          if (objc_msgSend(v13, "isLifecycleManaged"))
            v18 = v12 == 4;
          else
            v18 = 0;
          if (v18 && v17 == 2)
            -[RBDaemon emitAssertionSignpostForTimeout:]((uint64_t)self, v9);
          if (v16)
          {
            v20 = objc_alloc(MEMORY[0x24BE80D48]);
            v21 = (void *)MEMORY[0x24BE80CD8];
            objc_msgSend(v13, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "predicateMatchingIdentifier:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)objc_msgSend(v20, "initWithPredicate:context:", v23, v16);

            v25 = objc_msgSend(MEMORY[0x24BE80D58], "sharedBackgroundWorkloop");
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __53__RBDaemon_assertionManager_didInvalidateAssertions___block_invoke;
            block[3] = &unk_24DD45FF0;
            block[4] = self;
            v38 = v24;
            v26 = v24;
            dispatch_async(v25, block);

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v7);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[RBConnectionListener readyClients]((os_unfair_lock_s *)self->_listener);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(v27);
        -[RBConnectionClient didInvalidateAssertions:](*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j), v5);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v29);
  }

}

- (void)assertionManager:(id)a3 didEndTrackingInFightUpdatesForProcessIdentity:(id)a4
{
  -[RBProcessMonitor unsuppressUpdatesForIdentity:](self->_processMonitor, "unsuppressUpdatesForIdentity:", a4);
}

- (void)assertionManager:(id)a3 didBeginTrackingInFightUpdatesForProcessIdentity:(id)a4
{
  -[RBProcessMonitor suppressUpdatesForIdentity:](self->_processMonitor, "suppressUpdatesForIdentity:", a4);
}

- (RBDomainAttributeManaging)domainAttributeManager
{
  return (RBDomainAttributeManaging *)self->_domainAttributeManager;
}

uint64_t __63__RBDaemon_assertionManager_didUpdateProcessStates_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[RBConnectionListener readyClients](*(os_unfair_lock_s **)(*(_QWORD *)(a1 + 32) + 64));
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
        -[RBConnectionClient didUpdateProcessStates:](*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), *(void **)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t))(result + 16))(result);
  return result;
}

- (void)assertionManager:(id)a3 didUpdateProcessStates:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  RBProcessManager *processManager;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  processManager = self->_processManager;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__RBDaemon_assertionManager_didUpdateProcessStates_completion___block_invoke;
  v12[3] = &unk_24DD46480;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  -[RBProcessManager didUpdateProcessStates:completion:](processManager, "didUpdateProcessStates:completion:", v11, v12);
  -[RBCoalitionManager didUpdateProcessStates:](self->_coalitionManager, "didUpdateProcessStates:", v11);
  -[RBPowerAssertionManager didUpdateProcessStates:](self->_powerAssertionManager, "didUpdateProcessStates:", v11);
  -[RBThrottleBestEffortNetworkingManager didUpdateProcessStates:](self->_throttleBestEffortNetworkingManager, "didUpdateProcessStates:", v11);
  -[RBProcessMonitor didUpdateProcessStates:](self->_processMonitor, "didUpdateProcessStates:", v11);

}

- (RBEntitlementManaging)entitlementManager
{
  return (RBEntitlementManaging *)self->_entitlementManager;
}

- (RBStateCaptureManaging)stateCaptureManager
{
  return (RBStateCaptureManaging *)self->_stateCaptureManager;
}

- (RBHistoricalStatisticsMaintaining)historicalStatistics
{
  return (RBHistoricalStatisticsMaintaining *)self->_historicalStatistics;
}

- (void)assertionManager:(id)a3 didRemoveProcess:(id)a4 withState:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[RBConnectionListener readyClients]((os_unfair_lock_s *)self->_listener);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[RBConnectionClient didRemoveProcess:withState:](*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), v7);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  -[RBProcessMonitor didRemoveProcess:withState:](self->_processMonitor, "didRemoveProcess:withState:", v7, v8, (_QWORD)v14);
}

- (void)assertionManager:(id)a3 didBeginTrackingStateForProcessIdentity:(id)a4
{
  -[RBProcessMonitor trackStateForProcessIdentity:](self->_processMonitor, "trackStateForProcessIdentity:", a4);
}

- (void)assertionManager:(id)a3 didAddProcess:(id)a4 withState:(id)a5
{
  -[RBProcessMonitor didAddProcess:withState:](self->_processMonitor, "didAddProcess:withState:", a4, a5);
}

- (RBExtensionDataProviding)extensionDataProvider
{
  return self->_extensionDataProvider;
}

- (RBProcessManaging)processManager
{
  return (RBProcessManaging *)self->_processManager;
}

- (RBProcessMonitoring)processMonitor
{
  return (RBProcessMonitoring *)self->_processMonitor;
}

- (RBAssertionManaging)assertionManager
{
  return (RBAssertionManaging *)self->_assertionManager;
}

- (RBRequestManaging)requestManager
{
  return self->_requestManager;
}

- (RBProcess)process
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __19__RBDaemon_process__block_invoke;
  block[3] = &unk_24DD46160;
  block[4] = self;
  if (process_onceToken != -1)
    dispatch_once(&process_onceToken, block);
  return (RBProcess *)(id)process_process;
}

- (void)assertionManager:(id)a3 didEndTrackingStateForProcessIdentity:(id)a4
{
  RBProcessManager *processManager;
  id v6;

  processManager = self->_processManager;
  v6 = a4;
  -[RBProcessManager removeStateForProcessIdentity:](processManager, "removeStateForProcessIdentity:", v6);
  -[RBProcessMonitor removeStateForProcessIdentity:](self->_processMonitor, "removeStateForProcessIdentity:", v6);
  -[RBPowerAssertionManager removeStateForProcessIdentity:](self->_powerAssertionManager, "removeStateForProcessIdentity:", v6);

}

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  const char *v14;
  _BYTE v15[18];
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEmbeddedApplication"))
  {
    objc_msgSend(v5, "lastExitContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "embeddedApplicationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RBAssertionManager isProcessForeground:](self->_assertionManager, "isProcessForeground:", v5);
    rbs_sp_telemetry_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      v12 = objc_msgSend(v8, "domain");
      v13 = objc_msgSend(v8, "code");
      v14 = "NO";
      *(_DWORD *)v15 = 138544130;
      *(_WORD *)&v15[12] = 1026;
      *(_QWORD *)&v15[4] = v9;
      if (v10)
        v14 = "YES";
      *(_DWORD *)&v15[14] = v12;
      v16 = 2050;
      v17 = v13;
      v18 = 2082;
      v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_21A8B4000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessExited", "BundleIdOverride=%{public,signpost.description:attribute}@ exitStatusDomain=%{public,signpost.telemetry:number1}u exitStatusCode=%{public,signpost.telemetry:number2}llu foreground=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", v15, 0x26u);
    }

  }
  -[RBAssertionManager processDidTerminate:](self->_assertionManager, "processDidTerminate:", v5, *(_OWORD *)v15);
  -[RBPowerAssertionManager removeProcess:](self->_powerAssertionManager, "removeProcess:", v5);
  -[RBThrottleBestEffortNetworkingManager removeProcess:](self->_throttleBestEffortNetworkingManager, "removeProcess:", v5);
  -[RBBundlePropertiesManager removeProcess:](self->_bundlePropertiesManager, "removeProcess:", v5);
  -[RBCoalitionManager removeProcess:](self->_coalitionManager, "removeProcess:", v5);

}

+ (void)run
{
  if (run_onceToken != -1)
    dispatch_once(&run_onceToken, &__block_literal_global_21);
}

void __15__RBDaemon_run__block_invoke()
{
  id v0;

  +[RBDaemon _sharedInstance]();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  -[RBDaemon _start]((uint64_t)v0);

}

+ (id)_sharedInstance
{
  objc_opt_self();
  if (_sharedInstance_onceToken != -1)
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_32);
  return (id)_sharedInstance___sharedInstance;
}

- (void)_start
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  RBStateCaptureManager *v8;
  void *v9;
  RBPowerAssertionManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  RBDomainAttributeManagerDataProvider *v15;
  RBDomainAttributeManager *v16;
  void *v17;
  RBEntitlementManager *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  RBJetsamPropertyManager *v22;
  void *v23;
  RBBundlePropertiesManager *v24;
  void *v25;
  RBAssertionDescriptorValidator *v26;
  void *v27;
  RBAssertionOriginatorPidStore *v28;
  void *v29;
  RBHistoricalStatistics *v30;
  void *v31;
  RBProcessManager *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  RBAssertionManager *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  RBProcessReconnectManager *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  RBThrottleBestEffortNetworkingManager *v50;
  void *v51;
  void *v52;
  RBProcessMonitor *v53;
  void *v54;
  id v55;
  void *v56;
  RBExtensionDataProvider *v57;
  void *v58;
  RBRequestManager *v59;
  void *v60;
  void *v61;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t buf[4];
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    rbs_general_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A8B4000, v2, OS_LOG_TYPE_DEFAULT, "Battlecruiser operational.", buf, 2u);
    }

    -[RBDaemon setLowDiskIOPolicy](a1);
    -[RBDaemon watchdogRegister](a1);
    objc_msgSend(MEMORY[0x24BDD1540], "_setFileNameLocalizationEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("XPC_SERVICE_NAME"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBLaunchdJobManager lastExitStatusForLabel:error:](RBLaunchdJobManager, "lastExitStatusForLabel:error:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isValid"))
    {
      rbs_general_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v64 = v6;
        _os_log_impl(&dword_21A8B4000, v7, OS_LOG_TYPE_DEFAULT, "Back online after last exit: %{public}@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BE80B70], "setInDaemon");
    v8 = objc_alloc_init(RBStateCaptureManager);
    v9 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = v8;

    v10 = objc_alloc_init(RBPowerAssertionManager);
    v11 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v10;

    objc_msgSend(*(id *)(a1 + 72), "setDelegate:", a1);
    RBSPathForSystemDirectory();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("LifecyclePolicy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("DomainAttributes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[RBDomainAttributeManagerDataProvider initWithPath:]([RBDomainAttributeManagerDataProvider alloc], "initWithPath:", v14);
    v16 = -[RBDomainAttributeManager initWithDataProvider:]([RBDomainAttributeManager alloc], "initWithDataProvider:", v15);
    v17 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v16;

    v18 = [RBEntitlementManager alloc];
    objc_msgSend(*(id *)(a1 + 32), "allEntitlements");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[RBEntitlementManager initWithDomainAttributeEntitlements:](v18, "initWithDomainAttributeEntitlements:", v19);
    v21 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v20;

    v22 = -[RBJetsamPropertyManager initWithEntitlementManager:]([RBJetsamPropertyManager alloc], "initWithEntitlementManager:", *(_QWORD *)(a1 + 48));
    v23 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v22;

    v24 = objc_alloc_init(RBBundlePropertiesManager);
    v25 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v24;

    objc_msgSend(*(id *)(a1 + 40), "setDelegate:", a1);
    v26 = objc_alloc_init(RBAssertionDescriptorValidator);
    v27 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v26;

    v28 = -[RBAssertionOriginatorPidStore initWithPath:]([RBAssertionOriginatorPidStore alloc], "initWithPath:", CFSTR("/runningboard"));
    v29 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v28;

    v30 = -[RBHistoricalStatistics initWithReportFrequency:]([RBHistoricalStatistics alloc], "initWithReportFrequency:", 30);
    v31 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = v30;

    v32 = [RBProcessManager alloc];
    v33 = *(_QWORD *)(a1 + 40);
    v34 = *(_QWORD *)(a1 + 48);
    v35 = *(_QWORD *)(a1 + 56);
    +[RBTimeProvider sharedInstance](RBTimeProvider, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[RBProcessManager initWithBundlePropertiesManager:entitlementManager:jetsamPropertytManager:timeProvider:historialStatistics:delegate:](v32, "initWithBundlePropertiesManager:entitlementManager:jetsamPropertytManager:timeProvider:historialStatistics:delegate:", v33, v34, v35, v36, *(_QWORD *)(a1 + 128), a1);
    v38 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = v37;

    v39 = [RBAssertionManager alloc];
    v40 = *(_QWORD *)(a1 + 40);
    v41 = *(_QWORD *)(a1 + 24);
    v42 = *(_QWORD *)(a1 + 8);
    +[RBTimeProvider sharedInstance](RBTimeProvider, "sharedInstance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[RBAssertionManager initWithDelegate:bundlePropertiesManager:originatorPidStore:assertionDescriptorValidator:timeProvider:daemonContext:maxOperationsInFlight:maxAssertionsPerOriginator:](v39, "initWithDelegate:bundlePropertiesManager:originatorPidStore:assertionDescriptorValidator:timeProvider:daemonContext:maxOperationsInFlight:maxAssertionsPerOriginator:", a1, v40, v41, v42, v43, a1, 50, 2000);
    v45 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v44;

    v46 = [RBProcessReconnectManager alloc];
    objc_msgSend((id)a1, "process");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[RBProcessReconnectManager initWithDaemonContext:originatorProcess:](v46, "initWithDaemonContext:originatorProcess:", a1, v47);
    v49 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = v48;

    v50 = objc_alloc_init(RBThrottleBestEffortNetworkingManager);
    v51 = *(void **)(a1 + 112);
    *(_QWORD *)(a1 + 112) = v50;

    +[RBResourceViolationHandler sharedInstance]();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBResourceViolationHandler startWithAssertionManager:]((uint64_t)v52, *(void **)(a1 + 16));

    v53 = -[RBProcessMonitor initWithStateCaptureManager:historialStatistics:]([RBProcessMonitor alloc], "initWithStateCaptureManager:historialStatistics:", *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 128));
    v54 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = v53;

    v55 = -[RBConnectionListener initWithContext:]([RBConnectionListener alloc], (void *)a1);
    v56 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v55;

    v57 = objc_alloc_init(RBExtensionDataProvider);
    v58 = *(void **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = v57;

    v59 = -[RBRequestManager initWithContext:]([RBRequestManager alloc], "initWithContext:", a1);
    v60 = *(void **)(a1 + 152);
    *(_QWORD *)(a1 + 152) = v59;

    v61 = *(void **)(a1 + 136);
    *(_QWORD *)(a1 + 136) = 0;

    objc_msgSend(*(id *)(a1 + 104), "addItem:withIdentifier:", *(_QWORD *)(a1 + 16), CFSTR("assertion"));
    objc_msgSend(*(id *)(a1 + 104), "addItem:withIdentifier:", *(_QWORD *)(a1 + 64), CFSTR("connection"));
    objc_msgSend(*(id *)(a1 + 104), "addItem:withIdentifier:", *(_QWORD *)(a1 + 32), CFSTR("domain"));
    objc_msgSend(*(id *)(a1 + 104), "addItem:withIdentifier:", *(_QWORD *)(a1 + 48), CFSTR("entitlements"));
    objc_msgSend(*(id *)(a1 + 104), "addItem:withIdentifier:", *(_QWORD *)(a1 + 24), CFSTR("originatorpids"));
    objc_msgSend(*(id *)(a1 + 104), "addItem:withIdentifier:", *(_QWORD *)(a1 + 72), CFSTR("power"));
    objc_msgSend(*(id *)(a1 + 104), "addItem:withIdentifier:", *(_QWORD *)(a1 + 80), CFSTR("process"));
    objc_msgSend(*(id *)(a1 + 104), "addItem:withIdentifier:", *(_QWORD *)(a1 + 40), CFSTR("bundles"));
    objc_msgSend(*(id *)(a1 + 104), "addItem:withIdentifier:", *(_QWORD *)(a1 + 112), CFSTR("throttleBestEffort"));
    objc_msgSend(*(id *)(a1 + 104), "addItem:withIdentifier:", *(_QWORD *)(a1 + 88), CFSTR("processMonitor"));
    objc_msgSend(*(id *)(a1 + 80), "start");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BE80DC0], 0, 0, 1u);

  }
}

- (RBDaemon)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBDaemon.m"), 123, CFSTR("-init is not allowed on RBDaemon"));

  return 0;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; listener=%p assertions=%p processes=%p monitor=%p>"),
                       objc_opt_class(),
                       self,
                       self->_listener,
                       self->_assertionManager,
                       self->_processManager,
                       self->_processMonitor);
}

- (void)assertionManager:(id)a3 didResolveSystemState:(id)a4
{
  RBProcessManager *processManager;
  id v6;
  RBProcessMonitor *processMonitor;
  id v8;

  processManager = self->_processManager;
  v6 = a4;
  -[RBProcessManager applySystemState:](processManager, "applySystemState:", v6);
  -[RBPowerAssertionManager applySystemState:](self->_powerAssertionManager, "applySystemState:", v6);
  processMonitor = self->_processMonitor;
  objc_msgSend(v6, "preventLaunchPredicates");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[RBProcessMonitor didResolvePreventLaunchPredicates:](processMonitor, "didResolvePreventLaunchPredicates:", v8);
}

- (void)assertionManager:(id)a3 willExpireAssertionsSoonForProcess:(id)a4 expirationTime:(double)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[RBConnectionListener readyClients]((os_unfair_lock_s *)self->_listener);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[RBConnectionClient willExpireAssertionsSoonForProcess:expirationTime:](*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v7, a5);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)assertionManager:(id)a3 willInvalidateAssertion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[RBConnectionListener readyClients]((os_unfair_lock_s *)self->_listener);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[RBConnectionClient willInvalidateAssertion:](*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)emitAssertionSignpostForTimeout:(uint64_t)a1
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  void *v99;
  __int16 v100;
  uint64_t v101;
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = v4;
  if (a1)
  {
    objc_msgSend(v4, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v5, "legacyReason");
    if (v8 <= 9999)
    {
      switch(v8)
      {
        case 1:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v10;
          if (v10)
          {
            v12 = 0;
            v13 = (void *)v10;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v48 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v48;
            if (v48)
            {
              v12 = 0;
              v13 = (void *)v48;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v77;
          v70 = "ExceededTimeLimit_MediaPlayback";
          break;
        case 2:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v22 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v22;
          if (v22)
          {
            v12 = 0;
            v13 = (void *)v22;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v49 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v49;
            if (v49)
            {
              v12 = 0;
              v13 = (void *)v49;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v78;
          v70 = "ExceededTimeLimit_Location";
          break;
        case 3:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v23 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v23;
          if (v23)
          {
            v12 = 0;
            v13 = (void *)v23;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v50 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v50;
            if (v50)
            {
              v12 = 0;
              v13 = (void *)v50;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v79;
          v70 = "ExceededTimeLimit_ExternalAccessory";
          break;
        case 4:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v24 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v24;
          if (v24)
          {
            v12 = 0;
            v13 = (void *)v24;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v51 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v51;
            if (v51)
            {
              v12 = 0;
              v13 = (void *)v51;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v80;
          v70 = "ExceededTimeLimit_FinishTask";
          break;
        case 5:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v25 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v25;
          if (v25)
          {
            v12 = 0;
            v13 = (void *)v25;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v52 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v52;
            if (v52)
            {
              v12 = 0;
              v13 = (void *)v52;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v81;
          v70 = "ExceededTimeLimit_Bluetooth";
          break;
        case 7:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v26 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v26;
          if (v26)
          {
            v12 = 0;
            v13 = (void *)v26;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v53 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v53;
            if (v53)
            {
              v12 = 0;
              v13 = (void *)v53;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v82;
          v70 = "ExceededTimeLimit_BackgroundUI";
          break;
        case 8:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v27 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v27;
          if (v27)
          {
            v12 = 0;
            v13 = (void *)v27;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v54 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v54;
            if (v54)
            {
              v12 = 0;
              v13 = (void *)v54;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v83;
          v70 = "ExceededTimeLimit_InterAppAudioStreaming";
          break;
        case 9:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v28 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v28;
          if (v28)
          {
            v12 = 0;
            v13 = (void *)v28;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v55 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v55;
            if (v55)
            {
              v12 = 0;
              v13 = (void *)v55;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v84;
          v70 = "ExceededTimeLimit_ViewService";
          break;
        case 10:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v29 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v29;
          if (v29)
          {
            v12 = 0;
            v13 = (void *)v29;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v56 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v56;
            if (v56)
            {
              v12 = 0;
              v13 = (void *)v56;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v85;
          v70 = "ExceededTimeLimit_NewsstandDownload";
          break;
        case 12:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v30 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v30;
          if (v30)
          {
            v12 = 0;
            v13 = (void *)v30;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v57 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v57;
            if (v57)
            {
              v12 = 0;
              v13 = (void *)v57;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v86;
          v70 = "ExceededTimeLimit_VoIP";
          break;
        case 13:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v31 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v31;
          if (v31)
          {
            v12 = 0;
            v13 = (void *)v31;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v58 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v58;
            if (v58)
            {
              v12 = 0;
              v13 = (void *)v58;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v87;
          v70 = "ExceededTimeLimit_Extension";
          break;
        case 16:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v32 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v32;
          if (v32)
          {
            v12 = 0;
            v13 = (void *)v32;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v59 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v59;
            if (v59)
            {
              v12 = 0;
              v13 = (void *)v59;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v88;
          v70 = "ExceededTimeLimit_WatchConnectivity";
          break;
        case 18:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v33 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v33;
          if (v33)
          {
            v12 = 0;
            v13 = (void *)v33;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v60 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v60;
            if (v60)
            {
              v12 = 0;
              v13 = (void *)v60;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v89;
          v70 = "ExceededTimeLimit_ComplicationUpdate";
          break;
        case 19:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v34 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v34;
          if (v34)
          {
            v12 = 0;
            v13 = (void *)v34;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v61 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v61;
            if (v61)
            {
              v12 = 0;
              v13 = (void *)v61;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v90;
          v70 = "ExceededTimeLimit_WorkoutProcessing";
          break;
        case 20:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v35 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v35;
          if (v35)
          {
            v12 = 0;
            v13 = (void *)v35;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v62 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v62;
            if (v62)
            {
              v12 = 0;
              v13 = (void *)v62;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v91;
          v70 = "ExceededTimeLimit_ComplicationPushUpdate";
          break;
        case 21:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v36 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v36;
          if (v36)
          {
            v12 = 0;
            v13 = (void *)v36;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v63 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v63;
            if (v63)
            {
              v12 = 0;
              v13 = (void *)v63;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v92;
          v70 = "ExceededTimeLimit_BackgroundLocationProcessing";
          break;
        case 23:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v37 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v37;
          if (v37)
          {
            v12 = 0;
            v13 = (void *)v37;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v64 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v64;
            if (v64)
            {
              v12 = 0;
              v13 = (void *)v64;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v93;
          v70 = "ExceededTimeLimit_AudioRecording";
          break;
        default:
          goto LABEL_90;
      }
      goto LABEL_205;
    }
    if (v8 <= 49999)
    {
      switch(v8)
      {
        case 10000:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v14 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v14;
          if (v14)
          {
            v12 = 0;
            v13 = (void *)v14;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v41 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v41;
            if (v41)
            {
              v12 = 0;
              v13 = (void *)v41;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v69;
          v70 = "ExceededTimeLimit_Resume";
          break;
        case 10002:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v16 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v16;
          if (v16)
          {
            v12 = 0;
            v13 = (void *)v16;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v42 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v42;
            if (v42)
            {
              v12 = 0;
              v13 = (void *)v42;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v71;
          v70 = "ExceededTimeLimit_TransientWakeup";
          break;
        case 10004:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v17 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v17;
          if (v17)
          {
            v12 = 0;
            v13 = (void *)v17;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v43 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v43;
            if (v43)
            {
              v12 = 0;
              v13 = (void *)v43;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v72;
          v70 = "ExceededTimeLimit_FinishTaskUnbounded";
          break;
        case 10005:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v18 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v18;
          if (v18)
          {
            v12 = 0;
            v13 = (void *)v18;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v44 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v44;
            if (v44)
            {
              v12 = 0;
              v13 = (void *)v44;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v73;
          v70 = "ExceededTimeLimit_Continuous";
          break;
        case 10006:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v19 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v19;
          if (v19)
          {
            v12 = 0;
            v13 = (void *)v19;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v45 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v45;
            if (v45)
            {
              v12 = 0;
              v13 = (void *)v45;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v74;
          v70 = "ExceededTimeLimit_BackgroundContentFetching";
          break;
        case 10007:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v20 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v20;
          if (v20)
          {
            v12 = 0;
            v13 = (void *)v20;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v46 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v46;
            if (v46)
            {
              v12 = 0;
              v13 = (void *)v46;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v75;
          v70 = "ExceededTimeLimit_NotificationAction";
          break;
        case 10008:
          rbs_sp_telemetry_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9))
            goto LABEL_210;
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v21 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v21;
          if (v21)
          {
            v12 = 0;
            v13 = (void *)v21;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v47 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v47;
            if (v47)
            {
              v12 = 0;
              v13 = (void *)v47;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v76;
          v70 = "ExceededTimeLimit_PIP";
          break;
        default:
          goto LABEL_90;
      }
      goto LABEL_205;
    }
    switch(v8)
    {
      case 50000:
        rbs_sp_telemetry_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v9))
        {
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v38 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v38;
          if (v38)
          {
            v12 = 0;
            v13 = (void *)v38;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v66 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v66;
            if (v66)
            {
              v12 = 0;
              v13 = (void *)v66;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v95;
          v70 = "ExceededTimeLimit_FinishTaskAfterBackgroundContentFetching";
          goto LABEL_205;
        }
        break;
      case 50003:
        rbs_sp_telemetry_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v9))
        {
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v39 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v39;
          if (v39)
          {
            v12 = 0;
            v13 = (void *)v39;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v67 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v67;
            if (v67)
            {
              v12 = 0;
              v13 = (void *)v67;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v96;
          v70 = "ExceededTimeLimit_FinishTaskAfterNotificationAction";
          goto LABEL_205;
        }
        break;
      case 50004:
        rbs_sp_telemetry_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v9))
        {
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v15 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v15;
          if (v15)
          {
            v12 = 0;
            v13 = (void *)v15;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v65 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v65;
            if (v65)
            {
              v12 = 0;
              v13 = (void *)v65;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v94;
          v70 = "ExceededTimeLimit_FinishTaskAfterWatchConnectivity";
          goto LABEL_205;
        }
        break;
      default:
LABEL_90:
        rbs_sp_telemetry_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v9))
        {
          objc_msgSend(v7, "embeddedApplicationIdentifier");
          v40 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v40;
          if (v40)
          {
            v12 = 0;
            v13 = (void *)v40;
          }
          else
          {
            objc_msgSend(v7, "xpcServiceIdentifier");
            v68 = objc_claimAutoreleasedReturnValue();
            v2 = (void *)v68;
            if (v68)
            {
              v12 = 0;
              v13 = (void *)v68;
            }
            else
            {
              objc_msgSend(v7, "consistentLaunchdJobLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = 1;
            }
          }
          objc_msgSend(v5, "invalidationDuration");
          v98 = 138543618;
          v99 = v13;
          v100 = 2050;
          v101 = v97;
          v70 = "AssertionTimedOut";
LABEL_205:
          _os_signpost_emit_with_name_impl(&dword_21A8B4000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v70, "BundleIdOverride=%{public, signpost.description:attribute}@ permittedBackgroundDuration=%{public, signpost.telemetry:number1}f enableTelemetry=YES ", (uint8_t *)&v98, 0x16u);
          if (v12)

          if (!v11)
        }
        break;
    }
LABEL_210:

  }
}

uint64_t __53__RBDaemon_assertionManager_didInvalidateAssertions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "executeTerminateRequest:completion:", *(_QWORD *)(a1 + 40), 0);
}

- (void)assertionManager:(id)a3 didRejectAcquisitionFromOriginatorWithExcessiveAssertions:(id)a4
{
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  _QWORD block[5];
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x24BE80D40];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Process %@ has an excessive number of assertions. Direct this report to owners of that process"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultContextWithExplanation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPreventIfBeingDebugged:", 1);
  objc_msgSend(v9, "setReportType:", 1);
  objc_msgSend(v9, "setExceptionCode:", 3490524077);
  objc_msgSend(v6, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  rbs_sp_telemetry_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    objc_msgSend(v10, "embeddedApplicationIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
    {
      v14 = 0;
      v15 = (void *)v12;
    }
    else
    {
      objc_msgSend(v10, "xpcServiceIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v16;
      if (v16)
      {
        v14 = 0;
        v15 = (void *)v16;
      }
      else
      {
        objc_msgSend(v10, "consistentLaunchdJobLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 1;
      }
    }
    *(_DWORD *)buf = 138543362;
    v27 = v15;
    _os_signpost_emit_with_name_impl(&dword_21A8B4000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RBAssertionMaxCountReached_ProcessTerminated", "BundleIdOverride=%{public, signpost.description:attribute}@ enableTelemetry=YES ", buf, 0xCu);
    if (v14)

    if (!v13)
  }

  v17 = objc_alloc(MEMORY[0x24BE80D48]);
  v18 = (void *)MEMORY[0x24BE80CD8];
  objc_msgSend(v6, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "predicateMatchingIdentifier:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithPredicate:context:", v20, v9);

  v22 = objc_msgSend(MEMORY[0x24BE80D58], "sharedBackgroundWorkloop");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__RBDaemon_assertionManager_didRejectAcquisitionFromOriginatorWithExcessiveAssertions___block_invoke;
  block[3] = &unk_24DD45FF0;
  block[4] = self;
  v25 = v21;
  v23 = v21;
  dispatch_async(v22, block);

}

uint64_t __87__RBDaemon_assertionManager_didRejectAcquisitionFromOriginatorWithExcessiveAssertions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "executeTerminateRequest:completion:", *(_QWORD *)(a1 + 40), 0);
}

- (void)powerAssertionManagerDidAllowIdleSleep:(id)a3
{
  -[RBProcessManager systemPreventIdleSleepStateDidChange:](self->_processManager, "systemPreventIdleSleepStateDidChange:", 0);
}

- (void)powerAssertionManagerDidPreventIdleSleep:(id)a3
{
  -[RBProcessManager systemPreventIdleSleepStateDidChange:](self->_processManager, "systemPreventIdleSleepStateDidChange:", 1);
}

- (void)processManager:(id)a3 didReconnectProcesses:(id)a4
{
  -[RBProcessReconnectManager reconnectProcesses:](self->_reconnectManager, "reconnectProcesses:", a4);
  -[RBConnectionListener start]((uint64_t)self->_listener);
}

- (void)processManager:(id)a3 didAddProcess:(id)a4 withState:(id)a5
{
  RBAssertionManager *assertionManager;
  id v8;
  id v9;

  assertionManager = self->_assertionManager;
  v8 = a5;
  v9 = a4;
  -[RBAssertionManager processDidLaunch:](assertionManager, "processDidLaunch:", v9);
  -[RBPowerAssertionManager addProcess:](self->_powerAssertionManager, "addProcess:", v9);
  -[RBThrottleBestEffortNetworkingManager addProcess:](self->_throttleBestEffortNetworkingManager, "addProcess:", v9);
  -[RBCoalitionManager addProcess:withState:](self->_coalitionManager, "addProcess:withState:", v9, v8);

}

- (void)bundlePropertiesManager:(id)a3 didChangePropertiesForProcessIdentities:(id)a4
{
  -[RBAssertionManager revalidateAssertionsForProcessIdentities:](self->_assertionManager, "revalidateAssertionsForProcessIdentities:", a4);
}

void __27__RBDaemon__sharedInstance__block_invoke()
{
  RBDaemon *v0;
  void *v1;
  objc_super v2;

  v0 = [RBDaemon alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)RBDaemon;
    v0 = (RBDaemon *)objc_msgSendSuper2(&v2, sel_init);
  }
  v1 = (void *)_sharedInstance___sharedInstance;
  _sharedInstance___sharedInstance = (uint64_t)v0;

}

- (uint64_t)setLowDiskIOPolicy
{
  uint64_t v1;
  _OWORD v2[5];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    result = setiopolicy_np(9, 0, 1);
    if ((_DWORD)result)
      -[RBDaemon setLowDiskIOPolicy].cold.1(&v1, v2);
  }
  return result;
}

- (void)watchdogRegister
{
  uint64_t v1;
  uint64_t i;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    wd_endpoint_register();
    +[RBConnectionListener sharedConnectionWorkloop]();
    +[RBAssertionManager sharedWorkloop](RBAssertionManager, "sharedWorkloop", objc_claimAutoreleasedReturnValue());
    v3[1] = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80B70], "handshakeQueue");
    v3[2] = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80B70], "connectionQueue");
    v3[3] = objc_claimAutoreleasedReturnValue();
    +[RBProcessManager stateApplicationQueue](RBProcessManager, "stateApplicationQueue");
    v1 = 0;
    v3[4] = objc_claimAutoreleasedReturnValue();
    do
    {
      wd_endpoint_add_queue();
      v1 += 8;
    }
    while (v1 != 40);
    wd_endpoint_activate();
    for (i = 4; i != -1; --i)

  }
}

void __19__RBDaemon_process__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", getpid());
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BE80C98];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("XPC_SERVICE_NAME"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identityForDaemonJobLabel:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE80CB0], "instanceWithIdentifier:identity:", v10, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "processForInstance:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)process_process;
  process_process = v8;

}

- (RBAssertionOriginatorPidPersisting)assertionOriginatorPidStore
{
  return (RBAssertionOriginatorPidPersisting *)self->_assertionOriginatorPidStore;
}

- (RBJetsamPropertyManaging)jetsamPropertyManager
{
  return (RBJetsamPropertyManaging *)self->_jetsamPropertyManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestManager, 0);
  objc_storeStrong((id *)&self->_extensionDataProvider, 0);
  objc_storeStrong((id *)&self->_coalitionManager, 0);
  objc_storeStrong((id *)&self->_historicalStatistics, 0);
  objc_storeStrong((id *)&self->_thermalResponseManager, 0);
  objc_storeStrong((id *)&self->_throttleBestEffortNetworkingManager, 0);
  objc_storeStrong((id *)&self->_stateCaptureManager, 0);
  objc_storeStrong((id *)&self->_reconnectManager, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_processManager, 0);
  objc_storeStrong((id *)&self->_powerAssertionManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_jetsamPropertyManager, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_domainAttributeManager, 0);
  objc_storeStrong((id *)&self->_assertionOriginatorPidStore, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_assertionDescriptorValidator, 0);
}

- (void)setLowDiskIOPolicy
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  __error();
  v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

@end
