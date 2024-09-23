@implementation ACE

+ (id)availableRouterIDs
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[IECSInterface_GoldRestore2 locatedDevices](IECSInterface_GoldRestore2, "locatedDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "rid", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (ACE)initWithRouterID:(unsigned __int8)a3
{
  uint64_t v3;
  ACE *v4;
  ACE *v5;
  os_log_t v6;
  OS_os_log *log;
  AppleTypeCRetimerHPM *v8;
  AppleTypeCRetimerHPM *hpm;
  ACE *v10;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ACE;
  v4 = -[ACE init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    if (!-[ACE initForRouterID:](v4, "initForRouterID:", v3))
    {
      v10 = 0;
      goto LABEL_6;
    }
    v6 = os_log_create("com.apple.accessoryupdater.atcrt", "ace");
    log = v5->_log;
    v5->_log = (OS_os_log *)v6;

    v5->_routerID = v3;
    v8 = -[AppleTypeCRetimerHPM initWithHPMService:routerID:deviceService:]([AppleTypeCRetimerHPM alloc], "initWithHPMService:routerID:deviceService:", -[IECSInterface_GoldRestore2 service](v5->_interface, "service"), v3, -[IECSInterface_GoldRestore2 deviceService](v5->_interface, "deviceService"));
    hpm = v5->_hpm;
    v5->_hpm = v8;

  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (BOOL)initForRouterID:(unsigned __int8)a3
{
  int v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  +[IECSInterface_GoldRestore2 sharedInstance](IECSInterface_GoldRestore2, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v5, "locatedObjects", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "rid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12 && objc_msgSend(v12, "unsignedCharValue") == v3)
        {
          objc_storeStrong((id *)&self->_interface, v11);

          v14 = 1;
          goto LABEL_12;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)executeIECSCommand:(unsigned int)a3 withData:(char *)a4 dataLength:(unsigned int)a5
{
  uint64_t v7;
  NSObject *log;
  uint64_t v10;
  NSObject *v11;

  v7 = *(_QWORD *)&a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    -[ACE executeIECSCommand:withData:dataLength:].cold.2(log, v7);
  v10 = -[IECSInterface_GoldRestore2 iecsAtomicCommand:data:dataLength:retData:retDataLength:flags:timeout:](self->_interface, "iecsAtomicCommand:data:dataLength:retData:retDataLength:flags:timeout:", v7, a4, a5, 0, 0, 0, 10);
  if ((_DWORD)v10)
  {
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ACE executeIECSCommand:withData:dataLength:].cold.1(v11, v10);
  }
  return (_DWORD)v10 == 0;
}

- (BOOL)disableDFUfTaskIfActive
{
  NSObject *log;
  int routerID;
  ACETaskCommandDFUf *v5;
  BOOL v6;
  NSObject *v7;
  int v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!-[ACE dfufTaskRunning](self, "dfufTaskRunning"))
    return 1;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    routerID = self->_routerID;
    v10 = 136315394;
    v11 = "-[ACE disableDFUfTaskIfActive]";
    v12 = 1024;
    v13 = routerID;
    _os_log_impl(&dword_24BC99000, log, OS_LOG_TYPE_INFO, "%s: Detected that ACE is in DFU mode. [RID %u]", (uint8_t *)&v10, 0x12u);
  }
  v5 = -[ACETaskCommandDFUf initWithForceDFUMode:allowOnlyIfConnected:]([ACETaskCommandDFUf alloc], "initWithForceDFUMode:allowOnlyIfConnected:", 0, 0);
  v6 = -[ACE executeTask:](self, "executeTask:", v5);
  v7 = self->_log;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_INFO))
    {
      v8 = self->_routerID;
      v10 = 136315394;
      v11 = "-[ACE disableDFUfTaskIfActive]";
      v12 = 1024;
      v13 = v8;
      _os_log_impl(&dword_24BC99000, v7, OS_LOG_TYPE_INFO, "%s: ACE DFU mode has been disabled. [RID %u]", (uint8_t *)&v10, 0x12u);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[ACE disableDFUfTaskIfActive].cold.1();
  }

  return v6;
}

- (BOOL)retimerEnterDFULegacy
{
  ACETaskCommandVOUT *v3;
  BOOL v4;

  -[ACE retimerEnterForceDFU:](self, "retimerEnterForceDFU:", 1);
  if (!-[ACE disableDFUfTaskIfActive](self, "disableDFUfTaskIfActive")
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[ACE retimerEnterDFULegacy].cold.3();
  }
  v3 = -[ACETaskCommandVOUT initWithEnabled:forceDFU:]([ACETaskCommandVOUT alloc], "initWithEnabled:forceDFU:", 1, 1);
  if (-[ACE executeTask:](self, "executeTask:", v3))
  {
    sleepMS(100);
    if (!-[ACE retimerForcePower](self, "retimerForcePower"))
    {
      v4 = 1;
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[ACE retimerEnterDFULegacy].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[ACE retimerEnterDFULegacy].cold.2();
  }
  v4 = 0;
LABEL_11:

  return v4;
}

- (int)retimerEnterDFU
{
  AppleTypeCRetimerHPM *hpm;

  hpm = self->_hpm;
  if (hpm)
    return -[AppleTypeCRetimerHPM forceUpdateMode:](hpm, "forceUpdateMode:", 1);
  if (-[ACE retimerEnterDFULegacy](self, "retimerEnterDFULegacy"))
    return 0;
  return -536870212;
}

- (BOOL)dfufTaskRunning
{
  _BOOL4 v3;
  int v5;

  v5 = 0;
  if (-[IECSInterface_GoldRestore2 iecsReadForAddress:buffer:length:flags:andOutReadLength:](self->_interface, "iecsReadForAddress:buffer:length:flags:andOutReadLength:", 3, &v5, 4, 0, 0))
  {
    v3 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[ACE dfufTaskRunning].cold.1();
      LOBYTE(v3) = 0;
    }
  }
  else
  {
    LOBYTE(v3) = v5 == 1716864580;
  }
  return v3;
}

- (void)retimerExitDFU
{
  AppleTypeCRetimerHPM *hpm;

  hpm = self->_hpm;
  if (hpm)
  {
    -[AppleTypeCRetimerHPM forceUpdateMode:](hpm, "forceUpdateMode:", 0);
  }
  else
  {
    -[ACE retimerExitForceDFU](self, "retimerExitForceDFU");
    -[ACE retimerRemoveForcePower](self, "retimerRemoveForcePower");
  }
}

- (int)retimerForcePower
{
  AppleTypeCRetimerHPM *hpm;
  int result;
  ACETaskCommandVOUT *v5;
  BOOL v6;

  hpm = self->_hpm;
  if (hpm)
  {
    result = -[AppleTypeCRetimerHPM forceRetimerPower:](hpm, "forceRetimerPower:", 1);
    if (result)
      return result;
    goto LABEL_8;
  }
  if (!-[ACE disableDFUfTaskIfActive](self, "disableDFUfTaskIfActive")
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[ACE retimerForcePower].cold.1();
  }
  v5 = -[ACETaskCommandVOUT initWithEnabled:forceDFU:]([ACETaskCommandVOUT alloc], "initWithEnabled:forceDFU:", 1, 0);
  v6 = -[ACE executeTask:](self, "executeTask:", v5);

  if (v6)
  {
LABEL_8:
    sleep(1u);
    return 0;
  }
  return -536870212;
}

- (BOOL)retimerRemoveForcePower
{
  AppleTypeCRetimerHPM *hpm;
  ACETaskCommandVOUT *v5;
  BOOL v6;

  hpm = self->_hpm;
  if (hpm)
    return -[AppleTypeCRetimerHPM forceRetimerPower:](hpm, "forceRetimerPower:", 0) == 0;
  v5 = -[ACETaskCommandVOUT initWithEnabled:forceDFU:]([ACETaskCommandVOUT alloc], "initWithEnabled:forceDFU:", 0, 0);
  v6 = -[ACE executeTask:](self, "executeTask:", v5);

  return v6;
}

- (BOOL)retimerExitForceDFU
{
  if (!self->_isForceDFUModeEnabled)
    return 1;
  if (self->_hpm)
    return -[AppleTypeCRetimerHPM forceUpdateMode:](self->_hpm, "forceUpdateMode:", 0) == 0;
  return -[ACE retimerEnterForceDFU:](self, "retimerEnterForceDFU:", 0);
}

- (BOOL)retimerEnterForceDFU:(BOOL)a3
{
  HPMForceRetimerDFUModeSetter *v5;
  BOOL v6;

  v5 = -[HPMForceRetimerDFUModeSetter initWithHPMService:deviceService:enableDFUMode:]([HPMForceRetimerDFUModeSetter alloc], "initWithHPMService:deviceService:enableDFUMode:", -[IECSInterface_GoldRestore2 service](self->_interface, "service"), -[IECSInterface_GoldRestore2 deviceService](self->_interface, "deviceService"), a3);
  v6 = -[HPMForceRetimerDFUModeSetter doSet](v5, "doSet");
  self->_isForceDFUModeEnabled = v6 ^ a3 ^ 1;

  return v6;
}

- (BOOL)executeTask:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int routerID;
  NSObject *log;
  BOOL v17;
  unsigned int v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  int v23;
  char v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  _BYTE v28[14];
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "code");
  objc_msgSend(v4, "inputData");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "bytes");
  objc_msgSend(v4, "inputData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = -[ACE executeIECSCommand:withData:dataLength:](self, "executeIECSCommand:withData:dataLength:", v5, v7, objc_msgSend(v8, "length"));

  if ((v5 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[ACE executeTask:].cold.1(log, v4, (uint64_t)self);
    goto LABEL_7;
  }
  v24 = 0;
  v9 = -[IECSInterface_GoldRestore2 iecsReadForAddress:buffer:length:flags:andOutReadLength:](self->_interface, "iecsReadForAddress:buffer:length:flags:andOutReadLength:", 9, &v24, 1, 0, 0);
  if ((_DWORD)v9)
  {
    v10 = v9;
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      objc_msgSend(v4, "codeString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      stringForUpdateStatus(v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      routerID = self->_routerID;
      *(_DWORD *)buf = 138412802;
      v26 = v13;
      v27 = 2112;
      *(_QWORD *)v28 = v14;
      *(_WORD *)&v28[8] = 1024;
      *(_DWORD *)&v28[10] = routerID;
      _os_log_error_impl(&dword_24BC99000, v12, OS_LOG_TYPE_ERROR, "Failed to query task result status for %@ (%@) [RID %u]", buf, 0x1Cu);

LABEL_12:
    }
  }
  else
  {
    v19 = v24 & 0xF;
    if (!v19)
    {
      v17 = 1;
      goto LABEL_8;
    }
    v20 = self->_log;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v12 = v20;
      objc_msgSend(v4, "codeString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = stringForACETaskResult(v19);
      v23 = self->_routerID;
      *(_DWORD *)buf = 138413058;
      v26 = v21;
      v27 = 1024;
      *(_DWORD *)v28 = v19;
      *(_WORD *)&v28[4] = 2080;
      *(_QWORD *)&v28[6] = v22;
      v29 = 1024;
      v30 = v23;
      _os_log_error_impl(&dword_24BC99000, v12, OS_LOG_TYPE_ERROR, "Task %@ failed to execute: 0x%02x (%s) [RID %u]", buf, 0x22u);

      goto LABEL_12;
    }
  }
LABEL_7:
  v17 = 0;
LABEL_8:

  return v17;
}

- (NSString)chipInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("ACE Info:\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IECSInterface_GoldRestore2 rid](self->_interface, "rid");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    objc_msgSend(v3, "appendFormat:", CFSTR("\tRID: %@\n"), v4);
  v11 = 0;
  if (!-[IECSInterface_GoldRestore2 iecsReadForAddress:buffer:length:flags:andOutReadLength:](self->_interface, "iecsReadForAddress:buffer:length:flags:andOutReadLength:", 1, &v11, 4, 0, 0))objc_msgSend(v3, "appendFormat:", CFSTR("\tID: %s\n"), stringForACEDeviceID(v11));
  v10 = 0;
  if (!-[IECSInterface_GoldRestore2 iecsReadForAddress:buffer:length:flags:andOutReadLength:](self->_interface, "iecsReadForAddress:buffer:length:flags:andOutReadLength:", 4, &v10, 4, 0, 0))objc_msgSend(v3, "appendFormat:", CFSTR("\tType: %s\n"), stringForACEDeviceType(bswap32(v10)));
  v9 = 0;
  if (!-[IECSInterface_GoldRestore2 iecsReadForAddress:buffer:length:flags:andOutReadLength:](self->_interface, "iecsReadForAddress:buffer:length:flags:andOutReadLength:", 3, &v9, 4, 0, 0))objc_msgSend(v3, "appendFormat:", CFSTR("\tMode: %s\n"), stringForACEDeviceMode(bswap32(v9)));
  v8 = 0;
  if (!-[IECSInterface_GoldRestore2 iecsReadForAddress:buffer:length:flags:andOutReadLength:](self->_interface, "iecsReadForAddress:buffer:length:flags:andOutReadLength:", 15, &v8, 4, 0, 0))objc_msgSend(v3, "appendFormat:", CFSTR("\tFirmware Version: %02X%01X.%01X%02X.%02X\n"), HIBYTE(v8), BYTE2(v8) >> 4, BYTE2(v8) & 0xF, BYTE1(v8), v8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithDescString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hpm, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

- (void)executeIECSCommand:(void *)a1 withData:(uint64_t)a2 dataLength:.cold.1(void *a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  stringForUpdateStatus(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl(&dword_24BC99000, v3, OS_LOG_TYPE_ERROR, "%s: command request failed (%@) [RID %u]", (uint8_t *)v5, 0x1Cu);

  OUTLINED_FUNCTION_0_1();
}

- (void)executeIECSCommand:(void *)a1 withData:(int)a2 dataLength:.cold.2(void *a1, int a2)
{
  NSObject *v3;
  void *v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  stringForFourCharCode(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_2_3();
  _os_log_debug_impl(&dword_24BC99000, v3, OS_LOG_TYPE_DEBUG, "%s: %@ [RID %u]", (uint8_t *)v5, 0x1Cu);

  OUTLINED_FUNCTION_0_1();
}

- (void)disableDFUfTaskIfActive
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_24BC99000, v0, v1, "%s: Failed to force ACE out of DFU mode [RID %u]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)retimerEnterDFULegacy
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_24BC99000, v0, v1, "%s: DFUf check failed [RID %u]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)dfufTaskRunning
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_24BC99000, v0, v1, "%s: Failed to query ACE mode [RID %u]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)retimerForcePower
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_24BC99000, v0, v1, "%s: DFUf check failed [RID %u]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)executeTask:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "codeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned __int8 *)(a3 + 24);
  v8 = 138412546;
  v9 = v6;
  v10 = 1024;
  v11 = v7;
  _os_log_error_impl(&dword_24BC99000, v5, OS_LOG_TYPE_ERROR, "%@ task failed to execute [RID %u]", (uint8_t *)&v8, 0x12u);

}

@end
