@implementation AppleTypeCRetimerDFUChecker

- (AppleTypeCRetimerDFUChecker)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5 deviceNamePrefix:(id)a6
{
  id v10;
  AppleTypeCRetimerDFUChecker *v11;
  uint64_t v12;
  NSString *deviceNamePrefix;
  uint64_t v14;
  NSMutableArray *notReadyRouterIDs;
  NSLock *v16;
  NSLock *notReadyRouterIDsLock;
  objc_super v19;

  v10 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AppleTypeCRetimerDFUChecker;
  v11 = -[AppleTypeCRetimerUpdaterHelper initWithOptions:logFunction:logContext:](&v19, sel_initWithOptions_logFunction_logContext_, a3, a4, a5);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    deviceNamePrefix = v11->_deviceNamePrefix;
    v11->_deviceNamePrefix = (NSString *)v12;

    -[AppleTypeCRetimerDFUChecker initForceDFU](v11, "initForceDFU");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    notReadyRouterIDs = v11->_notReadyRouterIDs;
    v11->_notReadyRouterIDs = (NSMutableArray *)v14;

    v16 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    notReadyRouterIDsLock = v11->_notReadyRouterIDsLock;
    v11->_notReadyRouterIDsLock = v16;

  }
  return v11;
}

- (void)initForceDFU
{
  _BOOL4 forceDFU;
  const char *v4;

  if ((os_parse_boot_arg_int() & 1) != 0)
  {
    forceDFU = 0;
    self->_forceDFU = 0;
  }
  else
  {
    forceDFU = self->_forceDFU;
  }
  if (forceDFU)
    v4 = "enabled";
  else
    v4 = "disabled";
  -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Force DFU mode is %s"), v4);
}

- (BOOL)doCheck
{
  void *v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  AppleTypeCRetimerGetRouterIDsForIicPrefix(self->_deviceNamePrefix);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("No iic devices found for prefix %@, nothing else to do."), self->_deviceNamePrefix);
    logSystemFatal(CFSTR("%s: Fatal error, no iic devices found for prefix %@."), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[AppleTypeCRetimerDFUChecker doCheck]");
    goto LABEL_5;
  }
  if (!-[AppleTypeCRetimerDFUChecker waitForACEsWithRouterIDs:](self, "waitForACEsWithRouterIDs:", v3))
  {
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = -[AppleTypeCRetimerDFUChecker doCheckForRouterIDList:allowsNotReady:](self, "doCheckForRouterIDList:allowsNotReady:", v3, 1);
LABEL_6:

  return v4;
}

- (BOOL)doCheckForRouterIDList:(id)a3 allowsNotReady:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  char v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  BOOL v19;
  id obj;
  id v22;
  NSObject *group;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD block[5];
  id v29;
  id v30;
  char v31;
  BOOL v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  group = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(obj);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "unsignedCharValue");
        dispatch_get_global_queue(-2, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __69__AppleTypeCRetimerDFUChecker_doCheckForRouterIDList_allowsNotReady___block_invoke;
        block[3] = &unk_251CE3F70;
        block[4] = self;
        v31 = v12;
        v32 = a4;
        v29 = v22;
        v30 = v7;
        dispatch_group_async(group, v13, block);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v9);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    while (2)
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "BOOLValue"))
        {
          v19 = 0;
          goto LABEL_18;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
      if (v16)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_18:

  return v19;
}

uint64_t __69__AppleTypeCRetimerDFUChecker_doCheckForRouterIDList_allowsNotReady___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "doCheckForRouterID:allowsNotReady:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57));
  objc_msgSend(*(id *)(a1 + 40), "lock");
  v3 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "unlock");
}

- (BOOL)doCheckForRouterID:(unsigned __int8)a3 allowsNotReady:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  ACE *v7;
  AppleTypeCRetimerIICDeviceHandle *v8;
  AppleTypeCRetimerIIC *v9;
  uint64_t v10;
  BOOL v12;
  NSMutableArray *notReadyRouterIDs;
  void *v14;
  const char *v16;
  uint64_t v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  AppleTypeCRetimerDFU *v21;
  AppleTypeCRetimerDFU *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a4;
  v5 = a3;
  v7 = -[ACE initWithRouterID:]([ACE alloc], "initWithRouterID:", a3);
  if (v7)
  {
    v8 = -[AppleTypeCRetimerIICDeviceHandle initWithRouterID:namePrefix:]([AppleTypeCRetimerIICDeviceHandle alloc], "initWithRouterID:namePrefix:", v5, self->_deviceNamePrefix);
    if (!v8)
    {
      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Unable to create IIC device handle for %@%u"), self->_deviceNamePrefix, v5);
      v12 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v9 = -[AppleTypeCRetimerIICBase initWithDeviceHandle:]([AppleTypeCRetimerIIC alloc], "initWithDeviceHandle:", v8);
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Forcing power on for router ID %u"), v5);
    v10 = -[ACE retimerForcePower](v7, "retimerForcePower");
    if ((_DWORD)v10 == -536870184 && v4)
    {
      -[NSLock lock](self->_notReadyRouterIDsLock, "lock");
      notReadyRouterIDs = self->_notReadyRouterIDs;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](notReadyRouterIDs, "addObject:", v14);

      -[NSLock unlock](self->_notReadyRouterIDsLock, "unlock");
      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Router ID %u not ready for DFU check."), v5);
LABEL_13:
      v12 = 1;
      goto LABEL_14;
    }
    if ((_DWORD)v10)
    {
      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Failed to force power for router ID %u (0x%08x)"), v5, v10);
    }
    else
    {
      sleep(1u);
      v16 = "enabled";
      if (!self->_forceDFU)
      {
        -[AppleTypeCRetimerIICBase queryHardwareID:](v9, "queryHardwareID:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Router ID %u does not require DFU mode"), v5);
          goto LABEL_13;
        }
        if (!self->_forceDFU)
          v16 = "disabled";
      }
      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Force DFU mode is %s"), v16);
      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Entering into DFU mode for Router ID %u"), v5);
      v17 = -[ACE retimerEnterDFU](v7, "retimerEnterDFU");
      if ((_DWORD)v17 == -536870184 && v4)
      {
        -[NSLock lock](self->_notReadyRouterIDsLock, "lock");
        v18 = self->_notReadyRouterIDs;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v18, "addObject:", v19);

        -[NSLock unlock](self->_notReadyRouterIDsLock, "unlock");
        -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Router ID %u not ready for DFU check after IIC check failed."), v5);
        goto LABEL_13;
      }
      if ((_DWORD)v17)
      {
        -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Enter DFU request failed for router ID %u (0x%08x)"), v5, v17);
      }
      else
      {
        v21 = -[AppleTypeCRetimerDFU initWithRouterID:route:port:space:baudRate:]([AppleTypeCRetimerDFU alloc], "initWithRouterID:route:port:space:baudRate:", v5, 0, 0, 2, 921600);
        v22 = v21;
        if (v21)
        {
          -[AppleTypeCRetimerDFU queryHardwareID](v21, "queryHardwareID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Router ID %u placed into DFU mode"), v5);

            goto LABEL_13;
          }
          -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Failed to access router ID %u in DFU mode. Bytes sent: %lu, bytes received: %lu"), v5, -[AppleTypeCRetimerDFU bytesSent](v22, "bytesSent"), -[AppleTypeCRetimerDFU bytesReceived](v22, "bytesReceived"));
        }
        else
        {
          -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Unable to create DFU updater for router ID %u"), v5, v24, v25);
        }

      }
      -[ACE retimerRemoveForcePower](v7, "retimerRemoveForcePower");
    }
    v12 = 0;
LABEL_14:

    goto LABEL_15;
  }
  -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Unable to locate ACE for router ID %u"), v5);
  v12 = 0;
LABEL_16:

  return v12;
}

- (BOOL)waitForACEsWithRouterIDs:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v4 = a3;
  +[ACE availableRouterIDs](ACE, "availableRouterIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsAllObjectsIn:", v4) & 1) != 0)
  {
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("All ACEs are available"));
    v6 = 1;
  }
  else
  {
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Waiting for ACEs with routerIDs: %@. Available ACEs: %@."), v4, v5);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sleepMS(500);
    +[ACE availableRouterIDs](ACE, "availableRouterIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsAllObjectsIn:", v4) & 1) != 0)
    {
LABEL_6:
      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("All ACEs are now available."));
      v6 = 1;
    }
    else
    {
      while (1)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", v7);
        v11 = v10;

        if (v11 > 10.0)
          break;

        sleepMS(500);
        +[ACE availableRouterIDs](ACE, "availableRouterIDs");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "containsAllObjectsIn:", v4) & 1) != 0)
          goto LABEL_6;
      }
      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Timing out waiting for ACEs. Last available: %@"), v8);
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)checkDeferredRouterIDs
{
  if (!-[NSMutableArray count](self->_notReadyRouterIDs, "count"))
    return 1;
  -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", CFSTR("Running DFU check for deferred router IDs."));
  return -[AppleTypeCRetimerDFUChecker doCheckForRouterIDList:allowsNotReady:](self, "doCheckForRouterIDList:allowsNotReady:", self->_notReadyRouterIDs, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notReadyRouterIDsLock, 0);
  objc_storeStrong((id *)&self->_notReadyRouterIDs, 0);
  objc_storeStrong((id *)&self->_deviceNamePrefix, 0);
}

@end
