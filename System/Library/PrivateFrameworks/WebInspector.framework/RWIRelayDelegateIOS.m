@implementation RWIRelayDelegateIOS

- (id)_processMonitorPredicatesForConnectedApplications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[RWIRelay applicationConnections](self->_relay, "applicationConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[RWIRelay applicationConnections](self->_relay, "applicationConnections", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)MEMORY[0x24BE80CD8];
        objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "pid"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "predicateMatchingIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v5;
}

- (void)_handleProcessMonitorStateUpdate:(id)a3 forProcess:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  void *v15;
  NSObject *v16;
  _DWORD v17[2];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[_RWIApplicationInfo identifierForPID:](_RWIApplicationInfo, "identifierForPID:", objc_msgSend(v7, "pid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RWIRelay applicationConnections](self->_relay, "applicationConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = convertRBSProcessState(v11);

    if (objc_msgSend(v10, "debuggerAvailability") != v12)
    {
      objc_msgSend(v10, "setDebuggerAvailability:", v12);
      RWIDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(v7, "pid");
        NSStringFromRWIDebuggerAvailability(objc_msgSend(v10, "debuggerAvailability"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = 67109378;
        v17[1] = v14;
        v18 = 2114;
        v19 = v15;
        _os_log_impl(&dword_21AD49000, v13, OS_LOG_TYPE_DEFAULT, "Process (pid: %d) changed debugger availability: %{public}@", (uint8_t *)v17, 0x12u);

      }
      -[RWIRelay updateApplication:](self->_relay, "updateApplication:", v10);
    }
  }
  else
  {
    RWIDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[RWIRelayDelegateIOS _handleProcessMonitorStateUpdate:forProcess:].cold.1(v7);

  }
}

- (void)_createProcessMonitorIfNeeded
{
  void *v3;
  RBSProcessMonitor *v4;
  RBSProcessMonitor *processMonitor;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_processMonitor)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x24BE80CC8];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __52__RWIRelayDelegateIOS__createProcessMonitorIfNeeded__block_invoke;
    v6[3] = &unk_24DE032D8;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "monitorWithConfiguration:", v6);
    v4 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
    processMonitor = self->_processMonitor;
    self->_processMonitor = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __52__RWIRelayDelegateIOS__createProcessMonitorIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BE80CF8], "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValues:", 1);
    v11[0] = *MEMORY[0x24BE38348];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEndowmentNamespaces:", v7);

    objc_msgSend(v3, "setStateDescriptor:", v6);
    objc_msgSend(WeakRetained, "_processMonitorPredicatesForConnectedApplications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPredicates:", v8);

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52__RWIRelayDelegateIOS__createProcessMonitorIfNeeded__block_invoke_2;
    v9[3] = &unk_24DE032B0;
    objc_copyWeak(&v10, v4);
    objc_msgSend(v3, "setUpdateHandler:", v9);
    objc_destroyWeak(&v10);

  }
}

void __52__RWIRelayDelegateIOS__createProcessMonitorIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__RWIRelayDelegateIOS__createProcessMonitorIfNeeded__block_invoke_3;
  block[3] = &unk_24DE03288;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v13);
}

void __52__RWIRelayDelegateIOS__createProcessMonitorIfNeeded__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleProcessMonitorStateUpdate:forProcess:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_updateProcessMonitorPredicates
{
  RBSProcessMonitor *processMonitor;
  _QWORD v4[5];

  processMonitor = self->_processMonitor;
  if (processMonitor)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __54__RWIRelayDelegateIOS__updateProcessMonitorPredicates__block_invoke;
    v4[3] = &unk_24DE03300;
    v4[4] = self;
    -[RBSProcessMonitor updateConfiguration:](processMonitor, "updateConfiguration:", v4);
  }
}

void __54__RWIRelayDelegateIOS__updateProcessMonitorPredicates__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_processMonitorPredicatesForConnectedApplications");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicates:", v4);

}

- (void)relayInitialize:(id)a3
{
  id v5;
  dispatch_time_t v6;
  _QWORD block[5];

  objc_storeStrong((id *)&self->_relay, a3);
  v5 = a3;
  v6 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__RWIRelayDelegateIOS_relayInitialize___block_invoke;
  block[3] = &unk_24DE010C0;
  block[4] = self;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

}

void __39__RWIRelayDelegateIOS_relayInitialize___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientConnections");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");

  if (!v2)
  {
    RWIDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134349056;
      v5 = 0x4000000000000000;
      _os_log_impl(&dword_21AD49000, v3, OS_LOG_TYPE_DEFAULT, "Device: shutting down automatically, no client connection after %{public}g seconds.", (uint8_t *)&v4, 0xCu);
    }

    exit(1);
  }
}

- (id)relay:(id)a3 applicationInfoForIncomingConnection:(id)a4 bundleIdentifier:(id)a5
{
  id v7;
  id v8;
  _xpc_connection_s *v9;
  uint64_t pid;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  __CFString *v28;
  __CFString *v29;
  _RWIApplicationInfo *v30;
  void *v32;
  uint64_t v33;
  id v34;
  _OWORD v35[2];
  __int128 v36;
  __int128 v37;

  v7 = a4;
  v8 = a5;
  -[RWIRelayDelegateIOS _createProcessMonitorIfNeeded](self, "_createProcessMonitorIfNeeded");
  objc_msgSend(v7, "connection");
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  pid = xpc_connection_get_pid(v9);

  v11 = (void *)MEMORY[0x24BE80C78];
  objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", pid);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v11, "handleForIdentifier:error:", v12, &v34);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v34;

  if (v13)
    v15 = v14 == 0;
  else
    v15 = 0;
  if (v15)
  {
    objc_msgSend(v13, "currentState");
    v16 = objc_claimAutoreleasedReturnValue();
    v33 = convertRBSProcessState(v16);
  }
  else
  {
    RWIDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[RWIRelayDelegateIOS relay:applicationInfoForIncomingConnection:bundleIdentifier:].cold.2(v14);
    v33 = 0;
  }

  objc_msgSend(v7, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  v36 = 0u;
  v37 = 0u;
  xpc_connection_get_audit_token();
  v35[0] = v36;
  v35[1] = v37;
  if (auditTokenHasEntitlement(v35, CFSTR("com.apple.private.webinspector.proxy-application")))
    v19 = 1;
  else
    v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("com.apple.WebKit.WebContent"));

  objc_msgSend(v7, "connection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v18;
  *(_QWORD *)&v36 = 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v21, 0, &v36);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)v36;
  if (v23 || !v22)
  {
    RWIDefaultLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[RWIRelayDelegateIOS relay:applicationInfoForIncomingConnection:bundleIdentifier:].cold.1((uint64_t)v21, v23);

  }
  objc_msgSend(v22, "localizedName");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v32 = v14;
  if (!v25 || !-[__CFString length](v25, "length"))
  {
    processNameForPID();
    v27 = objc_claimAutoreleasedReturnValue();

    v26 = (__CFString *)v27;
  }

  v28 = &stru_24DE03408;
  if (v26)
    v28 = v26;
  v29 = v28;

  v30 = -[_RWIApplicationInfo initWithPID:bundleId:name:isProxy:connection:debuggerAvailability:]([_RWIApplicationInfo alloc], "initWithPID:bundleId:name:isProxy:connection:debuggerAvailability:", pid, v21, v29, v19, v7, v33);
  return v30;
}

- (void)relay:(id)a3 activateApplicationWithBundleIdentifier:(id)a4
{
  id v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilesafari"));
  RWIDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl(&dword_21AD49000, v6, OS_LOG_TYPE_DEFAULT, "Device: activating application with bundle identifier: %@", buf, 0xCu);
    }

    v8 = (void *)MEMORY[0x24BE38478];
    v9 = *MEMORY[0x24BE382D8];
    v14[0] = *MEMORY[0x24BE38320];
    v14[1] = v9;
    v15[0] = MEMORY[0x24BDBD1C8];
    v15[1] = &unk_24DE11028;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "optionsWithDictionary:", v10);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__RWIRelayDelegateIOS_relay_activateApplicationWithBundleIdentifier___block_invoke;
    v12[3] = &unk_24DE03328;
    v13 = v4;
    objc_msgSend(v11, "openApplication:withOptions:completion:", v13, v6, v12);

  }
  else if (v7)
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_21AD49000, v6, OS_LOG_TYPE_DEFAULT, "Device: application activation request ignored, not allowed for bundle identifier: %@", buf, 0xCu);
  }

}

void __69__RWIRelayDelegateIOS_relay_activateApplicationWithBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (v6)
    {
      objc_msgSend(v6, "localizedFailureReason");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("(unknown error)");
    }
    RWIDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __69__RWIRelayDelegateIOS_relay_activateApplicationWithBundleIdentifier___block_invoke_cold_1(a1, (uint64_t)v8, v10);

  }
  else
  {
    RWIDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v9;
      v13 = 1024;
      v14 = objc_msgSend(v5, "pid");
      _os_log_impl(&dword_21AD49000, v8, OS_LOG_TYPE_DEFAULT, "Device: activated application (%@) with PID %d", (uint8_t *)&v11, 0x12u);
    }
  }

}

- (void)relay:(id)a3 unhandledApplicationXPCMessage:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[8];
  CFTypeRef cf;

  v5 = a3;
  cf = 0;
  if (!lockdown_copy_checkin_info())
  {
    RWIDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AD49000, v6, OS_LOG_TYPE_DEFAULT, "Device: Starting lockdown XPC checkin process", buf, 2u);
    }

    +[_RWIRelayClientTCPConnection connectionFromLockdownCheckinWithInfo:delegate:](_RWIRelayClientTCPConnection, "connectionFromLockdownCheckinWithInfo:delegate:", cf, self->_relay);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      RWIDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_21AD49000, v8, OS_LOG_TYPE_DEFAULT, "Device: Received Client Connection", v9, 2u);
      }

      objc_msgSend(v5, "addPendingClientConnection:", v7);
    }
    if (cf)
      CFRelease(cf);
    objc_msgSend(v5, "shutdownIfDisabled");

  }
}

- (id)relaySetupResponseForClientConnection:(id)a3
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (void)_startPreventingDeviceFromIdling
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21AD49000, a2, OS_LOG_TYPE_ERROR, "Unable to take assertion to prevent device from becoming idle: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)_stopPreventingDeviceFromIdling
{
  NSObject *v3;
  BSInvalidatable *idleTimerAssertion;
  uint8_t v5[16];

  if (self->_idleTimerAssertion)
  {
    RWIDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21AD49000, v3, OS_LOG_TYPE_DEFAULT, "Device: Stopped Idling Prevention", v5, 2u);
    }

    -[BSInvalidatable invalidate](self->_idleTimerAssertion, "invalidate");
    idleTimerAssertion = self->_idleTimerAssertion;
    self->_idleTimerAssertion = 0;

  }
}

- (void)_updateDeviceIdlePrevention
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[RWIRelay applicationConnections](self->_relay, "applicationConnections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        -[RWIRelay applicationConnections](self->_relay, "applicationConnections", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "debuggerAvailability") && objc_msgSend(v12, "hasRemoteDebugSession"))
        {
          -[RWIRelay clientConnections](self->_relay, "clientConnections");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "debuggerConnectionIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v15, "sleeping"))
          {
            -[RWIRelayDelegateIOS _startPreventingDeviceFromIdling](self, "_startPreventingDeviceFromIdling");

            goto LABEL_14;
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[RWIRelayDelegateIOS _stopPreventingDeviceFromIdling](self, "_stopPreventingDeviceFromIdling");
LABEL_14:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_relay, 0);
}

- (void)_handleProcessMonitorStateUpdate:(void *)a1 forProcess:.cold.1(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "pid");
  OUTLINED_FUNCTION_0_5();
  _os_log_error_impl(v1, v2, v3, v4, v5, 8u);
  OUTLINED_FUNCTION_3();
}

- (void)relay:(uint64_t)a1 applicationInfoForIncomingConnection:(void *)a2 bundleIdentifier:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  objc_msgSend(a2, "localizedFailureReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

- (void)relay:(void *)a1 applicationInfoForIncomingConnection:bundleIdentifier:.cold.2(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  objc_msgSend(a1, "localizedFailureReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x12u);

  OUTLINED_FUNCTION_2_0();
}

void __69__RWIRelayDelegateIOS_relay_activateApplicationWithBundleIdentifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_21AD49000, log, OS_LOG_TYPE_ERROR, "Device: failed to activate application (%@): %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

@end
