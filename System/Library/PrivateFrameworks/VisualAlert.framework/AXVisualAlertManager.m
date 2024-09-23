@implementation AXVisualAlertManager

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)_VisualAlertManager;
    _VisualAlertManager = v2;

  }
}

- (AXVisualAlertManager)init
{
  AXVisualAlertManager *v2;
  id v3;
  void *v4;
  uint64_t v5;
  AXDispatchTimer *timer;
  uint64_t v7;
  AXDispatchTimer *torchForceShutdownTimer;
  uint64_t IsSpringBoard;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXVisualAlertManager;
  v2 = -[AXVisualAlertManager init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE005F0]);
    v4 = (void *)MEMORY[0x24BDAC9B8];
    v5 = objc_msgSend(v3, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    timer = v2->_timer;
    v2->_timer = (AXDispatchTimer *)v5;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v2->_timer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE005F0]), "initWithTargetSerialQueue:", v4);
    torchForceShutdownTimer = v2->_torchForceShutdownTimer;
    v2->_torchForceShutdownTimer = (AXDispatchTimer *)v7;

    IsSpringBoard = AXProcessIsSpringBoard();
    AXPrintLine();
    if (AXProcessIsSpringBoard())
      -[AXVisualAlertManager _insertCustomLogicForSystemWideServer](v2, "_insertCustomLogicForSystemWideServer", IsSpringBoard);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AXVisualAlertManager _stop](self, "_stop");
  v3.receiver = self;
  v3.super_class = (Class)AXVisualAlertManager;
  -[AXVisualAlertManager dealloc](&v3, sel_dealloc);
}

- (void)addBulletin:(id)a3
{
  id v4;
  NSMutableArray *bulletins;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  bulletins = self->_bulletins;
  v8 = v4;
  if (!bulletins)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_bulletins;
    self->_bulletins = v6;

    v4 = v8;
    bulletins = self->_bulletins;
  }
  -[NSMutableArray axSafelyAddObject:](bulletins, "axSafelyAddObject:", v4);

}

- (id)existingBulletinForBulletin:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_bulletins;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "sectionIdentifier", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sectionIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeBulletin:(id)a3
{
  -[NSMutableArray removeObject:](self->_bulletins, "removeObject:", a3);
}

- (void)_setTorchDeviceOpen:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v15;
  AXCameraTorchManagerBackgroundAdapter *asyncManagerAdapter;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  os_log_type_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v4 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  if (self->_torchDeviceOpen == v4)
  {
    if (v6)
    {
      dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v8, v7);

    }
  }
  else
  {
    self->_torchDeviceOpen = v4;
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "ignoreLogging");

      if ((v10 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v12 = objc_claimAutoreleasedReturnValue();

        v13 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v12, v13))
        {
          AXColorizeFormatLog();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, v13))
          {
            *(_DWORD *)buf = 138543362;
            v27 = v15;
            _os_log_impl(&dword_21FD32000, v12, v13, "%{public}@", buf, 0xCu);
          }

        }
      }
      asyncManagerAdapter = self->_asyncManagerAdapter;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __59__AXVisualAlertManager__setTorchDeviceOpen_withCompletion___block_invoke;
      v24[3] = &unk_24E593198;
      v25 = v7;
      -[AXCameraTorchManagerBackgroundAdapter openTorchDeviceWithCompletion:](asyncManagerAdapter, "openTorchDeviceWithCompletion:", v24);

    }
    else
    {
      -[AXCameraTorchManagerBackgroundAdapter closeTorchDeviceWithCompletion:](self->_asyncManagerAdapter, "closeTorchDeviceWithCompletion:", v6);
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "ignoreLogging");

      if ((v18 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v20 = objc_claimAutoreleasedReturnValue();

        v21 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v20, v21))
        {
          AXColorizeFormatLog();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, v21))
          {
            *(_DWORD *)buf = 138543362;
            v27 = v23;
            _os_log_impl(&dword_21FD32000, v20, v21, "%{public}@", buf, 0xCu);
          }

        }
      }
    }
  }

}

uint64_t __59__AXVisualAlertManager__setTorchDeviceOpen_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_setTorchDeviceOn:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  void *v22;
  AXCameraTorchManagerBackgroundAdapter *asyncManagerAdapter;
  void *v24;
  AXCameraTorchManagerBackgroundAdapter *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v4 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  if (self->_torchDeviceOn == v4)
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "ignoreLogging");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v11 = objc_claimAutoreleasedReturnValue();

      v12 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v11, v12))
      {
        AXColorizeFormatLog();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, v12))
        {
          *(_DWORD *)buf = 138543362;
          v31 = v14;
          _os_log_impl(&dword_21FD32000, v11, v12, "%{public}@", buf, 0xCu);
        }

      }
    }
    if (v7)
    {
      dispatch_get_global_queue(0, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v15, v7);

    }
  }
  else
  {
    self->_torchDeviceOn = v4;
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "ignoreLogging");

      if ((v17 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v19 = objc_claimAutoreleasedReturnValue();

        v20 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v19, v20))
        {
          AXColorizeFormatLog();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          CFAbsoluteTimeGetCurrent();
          _AXStringForArgs();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, v20))
          {
            *(_DWORD *)buf = 138543362;
            v31 = v22;
            _os_log_impl(&dword_21FD32000, v19, v20, "%{public}@", buf, 0xCu);
          }

        }
      }
      asyncManagerAdapter = self->_asyncManagerAdapter;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __57__AXVisualAlertManager__setTorchDeviceOn_withCompletion___block_invoke;
      v28[3] = &unk_24E593148;
      v28[4] = self;
      v29 = v7;
      -[AXCameraTorchManagerBackgroundAdapter turnTorchOnWithCompletion:](asyncManagerAdapter, "turnTorchOnWithCompletion:", v28);
      v24 = v29;
    }
    else
    {
      v25 = self->_asyncManagerAdapter;
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __57__AXVisualAlertManager__setTorchDeviceOn_withCompletion___block_invoke_341;
      v26[3] = &unk_24E593148;
      v26[4] = self;
      v27 = v6;
      -[AXCameraTorchManagerBackgroundAdapter turnTorchOffWithCompletion:](v25, "turnTorchOffWithCompletion:", v26);
      v24 = v27;
    }

  }
}

uint64_t __57__AXVisualAlertManager__setTorchDeviceOn_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  uint64_t result;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreLogging");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CFAbsoluteTimeGetCurrent();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", buf, 0xCu);
      }

    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  return result;
}

uint64_t __57__AXVisualAlertManager__setTorchDeviceOn_withCompletion___block_invoke_341(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  uint64_t result;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreLogging");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CFAbsoluteTimeGetCurrent();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", buf, 0xCu);
      }

    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  return result;
}

- (NSDictionary)_patterns
{
  NSDictionary *patterns;
  id v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;

  patterns = self->_patterns;
  if (!patterns)
  {
    v4 = objc_alloc(MEMORY[0x24BDBCE70]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("AXVisualAlertPatterns"), CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSDictionary *)objc_msgSend(v4, "initWithContentsOfURL:", v6);
    v8 = self->_patterns;
    self->_patterns = v7;

    patterns = self->_patterns;
  }
  return patterns;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[AXCameraTorchManagerBackgroundAdapter synchronousTorchManager](self->_asyncManagerAdapter, "synchronousTorchManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)AXVisualAlertManager;
  -[AXVisualAlertManager description](&v10, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (camera torch manager: <%@: %p>)"), v5, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (id)sharedVisualAlertManager
{
  return (id)_VisualAlertManager;
}

- (void)_springBoardLockButtonPress:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("AXVisualAlertLockButtonPressedNotification"), 0);

}

- (void)_springBoardVolumeChange:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("AXVisualAlertVolumeChangeNotification"), 0);

}

- (void)_springBoardLockStateChange:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v5 = (_QWORD *)getkSBNotificationKeyDeviceLockStateSymbolLoc_ptr;
  v15 = getkSBNotificationKeyDeviceLockStateSymbolLoc_ptr;
  if (!getkSBNotificationKeyDeviceLockStateSymbolLoc_ptr)
  {
    v6 = (void *)SpringBoardUILibrary();
    v5 = dlsym(v6, "kSBNotificationKeyDeviceLockState");
    v13[3] = (uint64_t)v5;
    getkSBNotificationKeyDeviceLockStateSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v12, 8);
  if (!v5)
    -[AXVisualAlertManager _springBoardLockStateChange:].cold.1();
  objc_msgSend(v4, "objectForKey:", *v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("AXVisualAlertLockStateKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("AXVisualAlertLockStateChangeNotification"), 0, v11);

}

- (void)_startForAlertTypes:(unint64_t)a3 cameraTorchManager:(id)a4
{
  id v6;
  AXCameraTorchManagerBackgroundAdapter *asyncManagerAdapter;
  AXCameraTorchManagerBackgroundAdapter *v8;
  AXCameraTorchManagerBackgroundAdapter *v9;
  void *v10;
  unint64_t alertTypes;
  AXTelephonyNotificationHandler *v12;
  AXTelephonyNotificationHandler *v13;
  AXTelephonyNotificationHandler *v14;
  AXTelephonyNotificationHandler *v15;
  AXTelephonyNotificationHandler *v16;
  AXTelephonyNotificationHandler *v17;
  AXTelephonyNotificationHandler *v18;
  AXTelephonyNotificationHandler *v19;
  AXTelephonyNotificationHandler *v20;
  AXTelephonyNotificationHandler *v21;
  AXDistributedNotificationHandler *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  AXAutoForwardingLocalNotificationHandler *v32;
  VISAXNotificationHandler *v33;
  VISAXNotificationHandler *deviceLockStateChangedNotificationHandler;
  AXAutoForwardingLocalNotificationHandler *v35;
  VISAXNotificationHandler *torchInControlCenterWasEnabledNotificationHandler;
  AXAutoForwardingLocalNotificationHandler *v37;
  AXAutoForwardingLocalNotificationHandler *v38;
  AXAutoForwardingLocalNotificationHandler *v39;
  AXAutoForwardingLocalNotificationHandler *v40;
  AXDistributedNotificationHandler *v41;
  void *v42;
  int v43;
  char *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  char v49;
  void *v50;
  NSObject *v51;
  os_log_type_t v52;
  void *v53;
  void *v54;
  AXDistributedNotificationHandler *v55;
  AXDistributedNotificationHandler *v56;
  NSArray *v57;
  NSArray *notificationHandlers;
  void *v59;
  char v60;
  void *v61;
  NSObject *v62;
  os_log_type_t v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  AXAutoForwardingLocalNotificationHandler *v71;
  AXAutoForwardingLocalNotificationHandler *v72;
  AXAutoForwardingLocalNotificationHandler *v73;
  AXAutoForwardingLocalNotificationHandler *v74;
  void *v75;
  _QWORD handler[5];
  _QWORD block[5];
  _QWORD v78[4];
  id v79;
  _QWORD v80[5];
  __int128 buf;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[AXVisualAlertManager _stop](self, "_stop");
  self->_alertTypes = a3;
  asyncManagerAdapter = self->_asyncManagerAdapter;
  self->_asyncManagerAdapter = 0;

  if (v6)
  {
    v8 = -[AXCameraTorchManagerBackgroundAdapter initWithCameraTorchManager:]([AXCameraTorchManagerBackgroundAdapter alloc], "initWithCameraTorchManager:", v6);
    v9 = self->_asyncManagerAdapter;
    self->_asyncManagerAdapter = v8;

    v10 = (void *)objc_opt_new();
    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke;
    v80[3] = &unk_24E5931E8;
    v80[4] = self;
    v75 = (void *)MEMORY[0x2207D1D70](v80);
    alertTypes = self->_alertTypes;
    if ((alertTypes & 1) != 0)
    {
      v12 = [AXTelephonyNotificationHandler alloc];
      v13 = -[VISAXNotificationHandler initWithNotificationName:target:dispatcher:](v12, "initWithNotificationName:target:dispatcher:", *MEMORY[0x24BEB4AB8], self, v75);
      objc_msgSend(v10, "addObject:", v13);
      v14 = [AXTelephonyNotificationHandler alloc];
      v15 = -[VISAXNotificationHandler initWithNotificationName:target:dispatcher:](v14, "initWithNotificationName:target:dispatcher:", *MEMORY[0x24BEB4AB0], self, &__block_literal_global_372);

      objc_msgSend(v10, "addObject:", v15);
      alertTypes = self->_alertTypes;
    }
    if ((alertTypes & 2) != 0)
    {
      v16 = [AXTelephonyNotificationHandler alloc];
      v17 = -[VISAXNotificationHandler initWithNotificationName:target:dispatcher:](v16, "initWithNotificationName:target:dispatcher:", *MEMORY[0x24BEB4AD0], self, v75);
      objc_msgSend(v10, "addObject:", v17);
      v18 = [AXTelephonyNotificationHandler alloc];
      v19 = -[VISAXNotificationHandler initWithNotificationName:target:dispatcher:](v18, "initWithNotificationName:target:dispatcher:", *MEMORY[0x24BEB4AB0], self, &__block_literal_global_372);

      objc_msgSend(v10, "addObject:", v19);
      alertTypes = self->_alertTypes;
    }
    if ((alertTypes & 3) != 0)
    {
      v20 = [AXTelephonyNotificationHandler alloc];
      v21 = -[VISAXNotificationHandler initWithNotificationName:target:dispatcher:](v20, "initWithNotificationName:target:dispatcher:", *MEMORY[0x24BEB4B08], self, &__block_literal_global);
      objc_msgSend(v10, "addObject:", v21);

      alertTypes = self->_alertTypes;
    }
    if ((alertTypes & 0x10) != 0)
    {
      v22 = -[VISAXNotificationHandler initWithNotificationName:target:handler:]([AXDistributedNotificationHandler alloc], "initWithNotificationName:target:handler:", CFSTR("AXVisualAlert"), self, sel__handleVisualAlertForExternalApplication);
      objc_msgSend(v10, "addObject:", v22);

    }
    if (AXProcessIsSpringBoard())
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v82 = 0x2020000000;
      v24 = (_QWORD *)getSBLockButtonPressedNotificationSymbolLoc_ptr;
      v83 = getSBLockButtonPressedNotificationSymbolLoc_ptr;
      if (!getSBLockButtonPressedNotificationSymbolLoc_ptr)
      {
        v25 = (void *)SpringBoardUILibrary();
        v24 = dlsym(v25, "SBLockButtonPressedNotification");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v24;
        getSBLockButtonPressedNotificationSymbolLoc_ptr = (uint64_t)v24;
      }
      _Block_object_dispose(&buf, 8);
      if (!v24)
        -[AXVisualAlertManager _startForAlertTypes:cameraTorchManager:].cold.1();
      objc_msgSend(v23, "addObserver:selector:name:object:", self, sel__springBoardLockButtonPress_, *v24, 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v82 = 0x2020000000;
      v27 = (_QWORD *)getSBVolumeButtonPressedNotificationSymbolLoc_ptr;
      v83 = getSBVolumeButtonPressedNotificationSymbolLoc_ptr;
      if (!getSBVolumeButtonPressedNotificationSymbolLoc_ptr)
      {
        v28 = (void *)SpringBoardUILibrary();
        v27 = dlsym(v28, "SBVolumeButtonPressedNotification");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v27;
        getSBVolumeButtonPressedNotificationSymbolLoc_ptr = (uint64_t)v27;
      }
      _Block_object_dispose(&buf, 8);
      if (!v27)
        -[AXVisualAlertManager _startForAlertTypes:cameraTorchManager:].cold.2();
      objc_msgSend(v26, "addObserver:selector:name:object:", self, sel__springBoardVolumeChange_, *v27, 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v82 = 0x2020000000;
      v30 = (_QWORD *)getSBDeviceLockStateChangedNotificationSymbolLoc_ptr;
      v83 = getSBDeviceLockStateChangedNotificationSymbolLoc_ptr;
      if (!getSBDeviceLockStateChangedNotificationSymbolLoc_ptr)
      {
        v31 = (void *)SpringBoardUILibrary();
        v30 = dlsym(v31, "SBDeviceLockStateChangedNotification");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v30;
        getSBDeviceLockStateChangedNotificationSymbolLoc_ptr = (uint64_t)v30;
      }
      _Block_object_dispose(&buf, 8);
      if (!v30)
        -[AXVisualAlertManager _startForAlertTypes:cameraTorchManager:].cold.3();
      objc_msgSend(v29, "addObserver:selector:name:object:", self, sel__springBoardLockStateChange_, *v30, 0);

    }
    v74 = -[AXAutoForwardingLocalNotificationHandler initWithNotificationName:target:handler:]([AXAutoForwardingLocalNotificationHandler alloc], "initWithNotificationName:target:handler:", CFSTR("AXVisualAlertLockButtonPressedNotification"), self, sel__handleLockButtonPressed);
    objc_msgSend(v10, "addObject:", v74);
    v73 = -[AXAutoForwardingLocalNotificationHandler initWithNotificationName:target:handler:]([AXAutoForwardingLocalNotificationHandler alloc], "initWithNotificationName:target:handler:", CFSTR("AXVisualAlertVolumeChangeNotification"), self, sel__handleVolumeChanged);
    objc_msgSend(v10, "addObject:", v73);
    v32 = [AXAutoForwardingLocalNotificationHandler alloc];
    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_4;
    v78[3] = &unk_24E5932B0;
    v79 = &__block_literal_global_391;
    v33 = -[AXAutoForwardingLocalNotificationHandler initWithNotificationName:target:dispatcher:possibleHandlers:](v32, "initWithNotificationName:target:dispatcher:possibleHandlers:", CFSTR("AXVisualAlertLockStateChangeNotification"), self, v78, sel__handleDeviceWasLocked, sel__handleDeviceWasUnlocked, 0);
    deviceLockStateChangedNotificationHandler = self->_deviceLockStateChangedNotificationHandler;
    self->_deviceLockStateChangedNotificationHandler = v33;

    objc_msgSend(v10, "addObject:", self->_deviceLockStateChangedNotificationHandler);
    v72 = -[AXAutoForwardingLocalNotificationHandler initWithNotificationName:target:dispatcher:possibleHandlers:]([AXAutoForwardingLocalNotificationHandler alloc], "initWithNotificationName:target:dispatcher:possibleHandlers:", CFSTR("AXVisualAlertManagerDoNotDisturbStatusChangedNotification"), self, &__block_literal_global_396, sel__handleQuietModeWasEnabled, sel__handleQuietModeWasDisabled, 0);
    objc_msgSend(v10, "addObject:", v72);
    v35 = -[AXAutoForwardingLocalNotificationHandler initWithNotificationName:target:handler:]([AXAutoForwardingLocalNotificationHandler alloc], "initWithNotificationName:target:handler:", CFSTR("AXVisualAlertManagerControlCenterTorchWasEnabledNotification"), self, sel__handleTorchInControlCenterWasEnabled);
    torchInControlCenterWasEnabledNotificationHandler = self->_torchInControlCenterWasEnabledNotificationHandler;
    self->_torchInControlCenterWasEnabledNotificationHandler = &v35->super.super;

    objc_msgSend(v10, "addObject:", self->_torchInControlCenterWasEnabledNotificationHandler);
    v71 = -[AXAutoForwardingLocalNotificationHandler initWithNotificationName:target:handler:]([AXAutoForwardingLocalNotificationHandler alloc], "initWithNotificationName:target:handler:", CFSTR("AXVisualAlertManagerControlCenterTorchWasDisabledNotification"), self, sel__handleTorchInControlCenterWasDisabled);
    objc_msgSend(v10, "addObject:", v71);
    v37 = [AXAutoForwardingLocalNotificationHandler alloc];
    v38 = -[AXAutoForwardingLocalNotificationHandler initWithNotificationName:target:handler:](v37, "initWithNotificationName:target:handler:", *MEMORY[0x24BDB1AC8], self, sel__handleCaptureSessionDidStartRunning);
    objc_msgSend(v10, "addObject:", v38);
    v39 = [AXAutoForwardingLocalNotificationHandler alloc];
    v40 = -[AXAutoForwardingLocalNotificationHandler initWithNotificationName:target:handler:](v39, "initWithNotificationName:target:handler:", *MEMORY[0x24BDB1AD0], self, sel__handleCaptureSessionDidStopRunning);
    objc_msgSend(v10, "addObject:", v40);
    if (AXProcessIsSpringBoard())
    {
      v41 = -[VISAXNotificationHandler initWithNotificationName:target:handler:]([AXDistributedNotificationHandler alloc], "initWithNotificationName:target:handler:", CFSTR("AXVisualAlertManagerDidStartNotification"), self, sel__handleSecondaryVisualAlertManagerDidStart);
      objc_msgSend(v10, "addObject:", v41);
      -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBLockScreenManager")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "safeBoolForKey:", CFSTR("isUILocked"));

      if (v43)
        v44 = sel__handleDeviceWasLocked;
      else
        v44 = sel__handleDeviceWasUnlocked;
      -[VISAXNotificationHandler processHandler:](self->_deviceLockStateChangedNotificationHandler, "processHandler:", v44);
      objc_msgSend(MEMORY[0x24BE2D738], "serviceForClientIdentifier:", CFSTR("com.apple.accessibility.visual.alerts"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXVisualAlertManager setDisturbanceService:](self, "setDisturbanceService:", v45);

      -[AXVisualAlertManager disturbanceService](self, "disturbanceService");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addStateUpdateListener:withCompletionHandler:", self, &__block_literal_global_423);

      dispatch_get_global_queue(0, 0);
      v47 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_426;
      block[3] = &unk_24E593338;
      block[4] = self;
      dispatch_async(v47, block);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "ignoreLogging");

      if ((v49 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v51 = objc_claimAutoreleasedReturnValue();

        v52 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v51, v52))
        {
          AXColorizeFormatLog();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = -[AXVisualAlertManager _hasVideoConferenceCameraTorchManager](self, "_hasVideoConferenceCameraTorchManager");
          _AXStringForArgs();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, v52))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v54;
            _os_log_impl(&dword_21FD32000, v51, v52, "%{public}@", (uint8_t *)&buf, 0xCu);
          }

        }
      }
      if (-[AXVisualAlertManager _hasVideoConferenceCameraTorchManager](self, "_hasVideoConferenceCameraTorchManager", v70))
      {
        v55 = -[VISAXNotificationHandler initWithNotificationName:target:handler:]([AXDistributedNotificationHandler alloc], "initWithNotificationName:target:handler:", CFSTR("AXVisualAlertManagerVideoConferenceCallRingingNotification"), self, sel__handleVideoConferenceCallRinging);
        objc_msgSend(v10, "addObject:", v55);
        v56 = -[VISAXNotificationHandler initWithNotificationName:target:handler:]([AXDistributedNotificationHandler alloc], "initWithNotificationName:target:handler:", CFSTR("AXVisualAlertManagerVideoConferenceCallHandledNotification"), self, sel__handleEndVisualAlertForIncomingVideoConferenceCall);

        objc_msgSend(v10, "addObject:", v56);
      }
      +[AXDistributedNotificationHandler postDistributedNotificationWithName:](AXDistributedNotificationHandler, "postDistributedNotificationWithName:", CFSTR("AXVisualAlertManagerDidStartNotification"));
    }
    v57 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v10);
    notificationHandlers = self->_notificationHandlers;
    self->_notificationHandlers = v57;

    self->_isRingerSwitchSilent = BKSHIDServicesGetRingerState() == 0;
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "ignoreLogging");

    if ((v60 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v62 = objc_claimAutoreleasedReturnValue();

      v63 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v62, v63))
      {
        AXColorizeFormatLog();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, v63))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v65;
          _os_log_impl(&dword_21FD32000, v62, v63, "%{public}@", (uint8_t *)&buf, 0xCu);
        }

      }
    }
    if (AXProcessIsSpringBoard())
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v82 = 0x2020000000;
      v67 = (_QWORD *)getSBRingerChangedNotificationSymbolLoc_ptr;
      v83 = getSBRingerChangedNotificationSymbolLoc_ptr;
      if (!getSBRingerChangedNotificationSymbolLoc_ptr)
      {
        v68 = (void *)SpringBoardUILibrary();
        v67 = dlsym(v68, "SBRingerChangedNotification");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v67;
        getSBRingerChangedNotificationSymbolLoc_ptr = (uint64_t)v67;
      }
      _Block_object_dispose(&buf, 8);
      if (!v67)
        -[AXVisualAlertManager _startForAlertTypes:cameraTorchManager:].cold.4();
      objc_msgSend(v66, "addObserver:selector:name:object:", self, sel__handleRingerSwitchToggled, *v67, 0);

    }
    else
    {
      v69 = (const char *)objc_msgSend(CFSTR("com.apple.springboard.ringerstate"), "UTF8String");
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_439;
      handler[3] = &unk_24E593360;
      handler[4] = self;
      notify_register_dispatch(v69, &self->_ringerStateNotifyToken, MEMORY[0x24BDAC9B8], handler);
    }

  }
}

char *__63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  NSObject *v26;
  os_log_type_t v27;
  void *v28;
  void *v29;
  char *v30;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  v9 = a3;
  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callServicesClientCapabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWantsToScreenCalls:", 1);

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "callServicesClientCapabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "save");

  if (!v9 || (objc_msgSend(v9, "isOutgoing") & 1) != 0)
    goto LABEL_18;
  v33 = objc_msgSend(v9, "isVideo");
  v14 = objc_msgSend(v9, "status");
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  objc_msgSend((id)v35[5], "removeObject:", v9);
  v15 = objc_msgSend((id)v35[5], "count");
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "ignoreLogging");

  if ((v17 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v19, v20))
    {
      AXColorizeFormatLog();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v22;
        _os_log_impl(&dword_21FD32000, v19, v20, "%{public}@", buf, 0xCu);
      }

    }
  }
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "ignoreLogging");

    if ((v24 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v26 = objc_claimAutoreleasedReturnValue();

      v27 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v26, v27))
      {
        AXColorizeFormatLog();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, v27))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v29;
          _os_log_impl(&dword_21FD32000, v26, v27, "%{public}@", buf, 0xCu);
        }

      }
    }
    goto LABEL_16;
  }
  if ((v14 - 3) < 2)
    v32 = v33;
  else
    v32 = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 105) = v32;
  if ((v14 - 3) < 2)
  {
    if ((v33 & 1) != 0)
      v30 = sel__handleBeginVisualAlertForIncomingVideoConferenceCall;
    else
      v30 = sel__handleBeginVisualAlertForIncomingCall;
  }
  else
  {
    if (v14 != 1 && v14 != 6)
    {
LABEL_16:
      v30 = 0;
      goto LABEL_17;
    }
    if ((v33 & 1) != 0)
      v30 = sel__handleEndVisualAlertForIncomingVideoConferenceCall;
    else
      v30 = sel__handleEndVisualAlertForIncomingCall;
  }
LABEL_17:
  _Block_object_dispose(&v34, 8);

  if (v15)
LABEL_18:
    v30 = 0;

  return v30;
}

void __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_357(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentAudioAndVideoCalls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mutableCopy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

char *__63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_371(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  char *v4;

  v3 = a3;
  if (objc_msgSend(v3, "status") == 4 && objc_msgSend(v3, "shouldSuppressRingtone"))
  {
    if ((objc_msgSend(v3, "isVideo") & 1) != 0)
      v4 = sel__handleEndVisualAlertForIncomingVideoConferenceCall;
    else
      v4 = sel__handleEndVisualAlertForIncomingCall;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

char *__63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  char *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isOutgoing") & 1) != 0 || !objc_msgSend(v3, "isConnecting"))
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isVideo") & 1) != 0)
  {
    v4 = sel__handleEndVisualAlertForIncomingVideoConferenceCall;
  }
  else
  {
    v4 = sel__handleEndVisualAlertForIncomingCall;
  }

  return v4;
}

char *__63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_3(uint64_t a1, int a2)
{
  char **v2;

  v2 = &selRef__handleDeviceWasLocked;
  if (!a2)
    v2 = &selRef__handleDeviceWasUnlocked;
  return *v2;
}

uint64_t __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;

  objc_msgSend(a4, "objectForKey:", CFSTR("AXVisualAlertLockStateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "BOOLValue");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

char *__63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  int v5;
  char **v6;
  char *v7;

  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("active"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");
  v6 = &selRef__handleQuietModeWasEnabled;
  if (!v5)
    v6 = &selRef__handleQuietModeWasDisabled;
  v7 = *v6;

  return v7;
}

void __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ignoreLogging");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v7, v8))
      {
        AXColorizeFormatLog();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, v8))
        {
          *(_DWORD *)buf = 138543362;
          v12 = v10;
          _os_log_impl(&dword_21FD32000, v7, v8, "%{public}@", buf, 0xCu);
        }

      }
    }
  }

}

void __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_426(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "disturbanceService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v2, "queryCurrentStateWithError:", &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  v5 = objc_msgSend(v3, "isActive");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "ignoreLogging");

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v9, v10))
      {
        AXColorizeFormatLog();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, v10))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v12;
          _os_log_impl(&dword_21FD32000, v9, v10, "%{public}@", buf, 0xCu);
        }

      }
    }
  }
  if (v5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_429;
    block[3] = &unk_24E593338;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_429(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleQuietModeWasEnabled");
}

uint64_t __63__AXVisualAlertManager__startForAlertTypes_cameraTorchManager___block_invoke_439(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRingerSwitchToggled");
}

- (void)_stop
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *notificationHandlers;
  AXCameraTorchManagerBackgroundAdapter *asyncManagerAdapter;
  VISAXNotificationHandler *deviceLockStateChangedNotificationHandler;
  VISAXNotificationHandler *torchInControlCenterWasEnabledNotificationHandler;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        v15 = 138543362;
        v16 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", (uint8_t *)&v15, 0xCu);
      }

    }
  }
  if (self->_asyncManagerAdapter)
  {
    if (AXProcessIsSpringBoard())
    {
      -[AXVisualAlertManager setDisturbanceService:](self, "setDisturbanceService:", 0);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:", self);

    }
    else
    {
      notify_cancel(-[AXVisualAlertManager ringerStateNotifyToken](self, "ringerStateNotifyToken"));
    }
    -[NSArray makeObjectsPerformSelector:](self->_notificationHandlers, "makeObjectsPerformSelector:", sel_invalidate);
    notificationHandlers = self->_notificationHandlers;
    self->_notificationHandlers = 0;

    -[AXVisualAlertManager _endVisualAlert](self, "_endVisualAlert");
    asyncManagerAdapter = self->_asyncManagerAdapter;
    self->_asyncManagerAdapter = 0;

    deviceLockStateChangedNotificationHandler = self->_deviceLockStateChangedNotificationHandler;
    self->_deviceLockStateChangedNotificationHandler = 0;

    torchInControlCenterWasEnabledNotificationHandler = self->_torchInControlCenterWasEnabledNotificationHandler;
    self->_torchInControlCenterWasEnabledNotificationHandler = 0;

    self->_isDeviceLocked = 0;
  }
}

- (void)startForAlertTypes:(unint64_t)a3 cameraTorchManager:(id)a4
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ignoreLogging");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      AXColorizeFormatLog();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v11;
        _os_log_impl(&dword_21FD32000, v8, v9, "%{public}@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  AXPerformBlockOnMainThread();

}

uint64_t __62__AXVisualAlertManager_startForAlertTypes_cameraTorchManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startForAlertTypes:cameraTorchManager:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)stop
{
  AXPerformBlockOnMainThread();
}

uint64_t __28__AXVisualAlertManager_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop");
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ignoreLogging");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      AXColorizeFormatLog();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v4;
      _AXStringForArgs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v11;
        _os_log_impl(&dword_21FD32000, v8, v9, "%{public}@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = CFSTR("active");
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isActive"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("AXVisualAlertManagerDoNotDisturbStatusChangedNotification"), 0, v16);

}

- (BOOL)_isCameraInUse
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[objc_class sharedApplication](NSClassFromString(CFSTR("UIApplication")), "sharedApplication", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_sensorActivityDataProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSetForKey:", CFSTR("activeCameraAndMicrophoneActivityAttributions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "safeIntegerForKey:", CFSTR("sensor")))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)_isRingerSwitchException:(unint64_t)a3
{
  BOOL v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3 == 32 && (self->_alertTypes & 0x20) != 0;
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ignoreLogging");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      AXColorizeFormatLog();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v10;
        _os_log_impl(&dword_21FD32000, v7, v8, "%{public}@", buf, 0xCu);
      }

    }
  }
  return v3;
}

- (void)_beginVisualAlertForType:(unint64_t)a3 repeat:(BOOL)a4
{
  -[AXVisualAlertManager _beginVisualAlertForType:repeat:skipAutomaticStopOnUserInteraction:bundleId:](self, "_beginVisualAlertForType:repeat:skipAutomaticStopOnUserInteraction:bundleId:", a3, a4, 0, 0);
}

- (void)_beginVisualAlertForType:(unint64_t)a3 repeat:(BOOL)a4 skipAutomaticStopOnUserInteraction:(BOOL)a5 bundleId:(id)a6
{
  _BOOL4 v6;
  void *v9;
  unsigned int v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  os_log_type_t v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  char v35;
  void *v36;
  os_log_type_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  os_log_type_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  NSObject *v49;
  os_log_type_t v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  char v55;
  void *v56;
  os_log_type_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  char v65;
  void *v66;
  os_log_type_t v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  NSObject *v73;
  os_log_type_t v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  char v79;
  void *v80;
  os_log_type_t v81;
  void *v82;
  void *v83;
  void *v84;
  char v85;
  void *v86;
  NSObject *v87;
  os_log_type_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  AXDispatchTimer *torchForceShutdownTimer;
  void *v97;
  unint64_t v98;
  AXVisualAlertManager *v99;
  _BOOL8 v100;
  const __CFString *v101;
  _BOOL8 v102;
  uint64_t v103;
  _BOOL4 v104;
  id v105;
  _QWORD v106[5];
  id v107;
  _QWORD v108[2];
  _QWORD v109[2];
  uint8_t buf[4];
  void *v111;
  uint64_t v112;

  v6 = a5;
  v104 = a4;
  v112 = *MEMORY[0x24BDAC8D0];
  v105 = a6;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldFlashWhileUnlocked");

  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "ignoreLogging");

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v14, v15))
    {
      AXColorizeFormatLog();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v6;
      v103 = v10;
      v98 = a3;
      v100 = v104;
      _AXStringForArgs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 138543362;
        v111 = v17;
        _os_log_impl(&dword_21FD32000, v14, v15, "%{public}@", buf, 0xCu);
      }

    }
  }
  if (self->_isDeviceLocked)
    v18 = 1;
  else
    v18 = v10;
  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "ignoreLogging");

    if ((v27 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v22 = objc_claimAutoreleasedReturnValue();

      v29 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v22, v29))
      {
        AXColorizeFormatLog();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, v29))
        {
          *(_DWORD *)buf = 138543362;
          v111 = v31;
          _os_log_impl(&dword_21FD32000, v22, v29, "%{public}@", buf, 0xCu);
        }

      }
      goto LABEL_61;
    }
    goto LABEL_62;
  }
  if (AXProcessIsSpringBoard()
    && !self->_isDeviceLocked
    && -[AXVisualAlertManager _isCameraInUse](self, "_isCameraInUse"))
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "ignoreLogging");

    if ((v20 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v22 = objc_claimAutoreleasedReturnValue();

      v23 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v22, v23))
      {
        AXColorizeFormatLog();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, v23))
        {
          *(_DWORD *)buf = 138543362;
          v111 = v25;
          _os_log_impl(&dword_21FD32000, v22, v23, "%{public}@", buf, 0xCu);
        }

      }
LABEL_61:

    }
  }
  else
  {
    if (self->_isRingerSwitchSilent)
    {
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "shouldFlashForAlertInSilentMode"))
      {

      }
      else
      {
        v33 = -[AXVisualAlertManager _isRingerSwitchException:](self, "_isRingerSwitchException:", a3);

        if (!v33)
        {
          objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "ignoreLogging");

          if ((v55 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BE00710], "identifier");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            AXLoggerForFacility();
            v22 = objc_claimAutoreleasedReturnValue();

            v57 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v22, v57))
            {
              AXColorizeFormatLog();
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              _AXStringForArgs();
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, v57))
              {
                *(_DWORD *)buf = 138543362;
                v111 = v59;
                _os_log_impl(&dword_21FD32000, v22, v57, "%{public}@", buf, 0xCu);
              }

            }
            goto LABEL_61;
          }
          goto LABEL_62;
        }
      }
    }
    if (a3 - 1 <= 1 && self->_isQuietModeEnabled)
    {
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "ignoreLogging");

      if ((v35 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v22 = objc_claimAutoreleasedReturnValue();

        v37 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v22, v37))
        {
          AXColorizeFormatLog();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, v37))
          {
            *(_DWORD *)buf = 138543362;
            v111 = v39;
            _os_log_impl(&dword_21FD32000, v22, v37, "%{public}@", buf, 0xCu);
          }

        }
        goto LABEL_61;
      }
    }
    else if (self->_isTorchEnabledInControlCenter)
    {
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "ignoreLogging");

      if ((v41 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v22 = objc_claimAutoreleasedReturnValue();

        v43 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v22, v43))
        {
          AXColorizeFormatLog();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, v43))
          {
            *(_DWORD *)buf = 138543362;
            v111 = v45;
            _os_log_impl(&dword_21FD32000, v22, v43, "%{public}@", buf, 0xCu);
          }

        }
        goto LABEL_61;
      }
    }
    else if (self->_captureSessionRunning)
    {
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "ignoreLogging");

      if ((v47 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v49 = objc_claimAutoreleasedReturnValue();

        v50 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v49, v50))
        {
          AXColorizeFormatLog();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = (unint64_t)self;
          _AXStringForArgs();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, v50))
          {
            *(_DWORD *)buf = 138543362;
            v111 = v52;
            _os_log_impl(&dword_21FD32000, v49, v50, "%{public}@", buf, 0xCu);
          }

        }
      }
      if (v104)
        v53 = a3;
      else
        v53 = 0;
      -[AXVisualAlertManager _setTypeToUseForVisualAlertAfterCaptureSessionStopsRunning:](self, "_setTypeToUseForVisualAlertAfterCaptureSessionStopsRunning:", v53, v98, v100, v102, v103);
    }
    else
    {
      if (AXProcessIsSpringBoard())
      {
        _AXFrontBoardFocusedAppProcesses();
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "firstObject");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "bundleIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "isEqualToString:", *MEMORY[0x24BE00510]);

        if (v63)
        {
          objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "ignoreLogging");

          if ((v65 & 1) != 0)
            goto LABEL_62;
          objc_msgSend(MEMORY[0x24BE00710], "identifier");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v22 = objc_claimAutoreleasedReturnValue();

          v67 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v22, v67))
          {
            AXColorizeFormatLog();
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            _AXStringForArgs();
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, v67))
            {
              *(_DWORD *)buf = 138543362;
              v111 = v69;
              _os_log_impl(&dword_21FD32000, v22, v67, "%{public}@", buf, 0xCu);
            }

          }
          goto LABEL_61;
        }
      }
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance", v98, v100, v102, v103);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "ignoreLogging");

      if ((v71 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v73 = objc_claimAutoreleasedReturnValue();

        v74 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v73, v74))
        {
          AXColorizeFormatLog();
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, v74))
          {
            *(_DWORD *)buf = 138543362;
            v111 = v76;
            _os_log_impl(&dword_21FD32000, v73, v74, "%{public}@", buf, 0xCu);
          }

        }
      }
      -[AXVisualAlertManager _endVisualAlert](self, "_endVisualAlert");
      if (!_AXSVisualAlertEnabled() || (MGGetBoolAnswer() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v78, "ignoreLogging");

        if ((v79 & 1) != 0)
          goto LABEL_62;
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v22 = objc_claimAutoreleasedReturnValue();

        v81 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v22, v81))
        {
          AXColorizeFormatLog();
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, v81))
          {
            *(_DWORD *)buf = 138543362;
            v111 = v83;
            _os_log_impl(&dword_21FD32000, v22, v81, "%{public}@", buf, 0xCu);
          }

        }
        goto LABEL_61;
      }
      if ((uint64_t)a3 > 7)
      {
        if (a3 == 8 || a3 == 16)
        {
          v77 = CFSTR("PushNotification");
        }
        else
        {
          if (a3 != 32)
            goto LABEL_62;
          v77 = CFSTR("Alarm");
        }
      }
      else if (a3 - 1 >= 2)
      {
        if (a3 != 4)
          goto LABEL_62;
        v77 = CFSTR("IncomingMessage");
      }
      else
      {
        v77 = CFSTR("IncomingCall");
      }
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "ignoreLogging");

      if ((v85 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v87 = objc_claimAutoreleasedReturnValue();

        v88 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v87, v88))
        {
          AXColorizeFormatLog();
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = self;
          v101 = v77;
          _AXStringForArgs();
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, v88))
          {
            *(_DWORD *)buf = 138543362;
            v111 = v90;
            _os_log_impl(&dword_21FD32000, v87, v88, "%{public}@", buf, 0xCu);
          }

        }
      }
      -[AXVisualAlertManager _patterns](self, "_patterns", v99, v101);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "objectForKey:", v77);
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = CFSTR("bundleId");
      v108[1] = CFSTR("visualAlertType");
      v109[0] = &stru_24E594160;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v109[1] = v94;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v109, v108, 2);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "postNotificationName:object:userInfo:", CFSTR("AXVisualAlertEvent"), 0, v95);

      self->_skipAutomaticStopOnUserInteraction = v6;
      objc_initWeak((id *)buf, self);
      torchForceShutdownTimer = self->_torchForceShutdownTimer;
      v106[0] = MEMORY[0x24BDAC760];
      v106[1] = 3221225472;
      v106[2] = __100__AXVisualAlertManager__beginVisualAlertForType_repeat_skipAutomaticStopOnUserInteraction_bundleId___block_invoke;
      v106[3] = &unk_24E5933B0;
      objc_copyWeak(&v107, (id *)buf);
      v106[4] = self;
      -[AXDispatchTimer afterDelay:processBlock:](torchForceShutdownTimer, "afterDelay:processBlock:", v106, 180.0);
      -[AXVisualAlertManager _normalizedStrobePatternForOriginalPattern:](self, "_normalizedStrobePatternForOriginalPattern:", v92);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXVisualAlertManager _setActivePattern:](self, "_setActivePattern:", v97);

      self->_shouldRepeatPattern = v104;
      self->_activePatternCursor = 0;
      -[AXVisualAlertManager _setTorchDeviceOpen:withCompletion:](self, "_setTorchDeviceOpen:withCompletion:", 1, 0);
      -[AXVisualAlertManager _processNextVisualAlertComponent](self, "_processNextVisualAlertComponent");
      objc_destroyWeak(&v107);
      objc_destroyWeak((id *)buf);

    }
  }
LABEL_62:

}

void __100__AXVisualAlertManager__beginVisualAlertForType_repeat_skipAutomaticStopOnUserInteraction_bundleId___block_invoke(uint64_t a1)
{
  id *v1;
  id v2;
  int v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  id v11;
  id WeakRetained;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "_isTorchDeviceOpen") & 1) != 0)
  {
    v2 = objc_loadWeakRetained(v1);
    v3 = objc_msgSend(v2, "_isTorchDeviceOn");

    if (v3)
    {
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "ignoreLogging");

      if ((v5 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v7 = objc_claimAutoreleasedReturnValue();

        v8 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v7, v8))
        {
          AXColorizeFormatLog();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, v8))
          {
            *(_DWORD *)buf = 138543362;
            v14 = v10;
            _os_log_impl(&dword_21FD32000, v7, v8, "%{public}@", buf, 0xCu);
          }

        }
      }
      v11 = objc_loadWeakRetained(v1);
      objc_msgSend(v11, "_endVisualAlert");

    }
  }
  else
  {

  }
}

- (void)_endVisualAlert
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        v11 = 138543362;
        v12 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  -[AXDispatchTimer cancel](self->_timer, "cancel");
  -[AXDispatchTimer cancel](self->_torchForceShutdownTimer, "cancel");
  -[AXVisualAlertManager _setTorchDeviceOn:withCompletion:](self, "_setTorchDeviceOn:withCompletion:", 0, 0);
  -[AXVisualAlertManager _setTorchDeviceOpen:withCompletion:](self, "_setTorchDeviceOpen:withCompletion:", 0, 0);
  -[AXVisualAlertManager _setActivePattern:](self, "_setActivePattern:", 0);
  -[AXVisualAlertManager _setTypeToUseForVisualAlertAfterCaptureSessionStopsRunning:](self, "_setTypeToUseForVisualAlertAfterCaptureSessionStopsRunning:", 0);
  self->_shouldRepeatPattern = 0;
  self->_activePatternCursor = 0;
  self->_skipAutomaticStopOnUserInteraction = 0;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("AXVisualAlertEventEnded"), 0, 0);

}

- (void)_processNextVisualAlertComponent
{
  void *v3;
  void *v4;
  unint64_t activePatternCursor;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  void *v22;
  int v23;
  double v24;
  AXDispatchTimer *v25;
  AXDispatchTimer *v26;
  _QWORD v27[4];
  AXDispatchTimer *v28;
  id v29[2];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[AXVisualAlertManager _activePattern](self, "_activePattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("StrobePattern"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "ignoreLogging");

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v12, v13))
      {
        AXColorizeFormatLog();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, v13))
        {
          *(_DWORD *)buf = 138543362;
          v31 = v15;
          _os_log_impl(&dword_21FD32000, v12, v13, "%{public}@", buf, 0xCu);
        }

      }
    }
LABEL_11:
    -[AXVisualAlertManager _endVisualAlert](self, "_endVisualAlert");
    goto LABEL_23;
  }
  activePatternCursor = self->_activePatternCursor;
  if (activePatternCursor >= objc_msgSend(v4, "count") - 1)
  {
    if (self->_shouldRepeatPattern)
    {
      self->_activePatternCursor = 0;
      -[AXVisualAlertManager _processNextVisualAlertComponent](self, "_processNextVisualAlertComponent");
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "ignoreLogging");

    if ((v17 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v19 = objc_claimAutoreleasedReturnValue();

      v20 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v19, v20))
      {
        AXColorizeFormatLog();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, v20))
        {
          *(_DWORD *)buf = 138543362;
          v31 = v22;
          _os_log_impl(&dword_21FD32000, v19, v20, "%{public}@", buf, 0xCu);
        }

      }
    }
    goto LABEL_11;
  }
  objc_msgSend(v4, "objectAtIndex:", self->_activePatternCursor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", self->_activePatternCursor + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_activePatternCursor += 2;
  if (v6)
    v8 = objc_msgSend(v6, "BOOLValue");
  else
    v8 = 0;
  v23 = objc_msgSend(v7, "intValue");
  objc_initWeak((id *)buf, self);
  v24 = (double)v23 / 1000.0;
  v25 = self->_timer;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __56__AXVisualAlertManager__processNextVisualAlertComponent__block_invoke;
  v27[3] = &unk_24E593400;
  v26 = v25;
  v28 = v26;
  v29[1] = *(id *)&v24;
  objc_copyWeak(v29, (id *)buf);
  -[AXVisualAlertManager _setTorchDeviceOn:withCompletion:](self, "_setTorchDeviceOn:withCompletion:", v8, v27);
  objc_destroyWeak(v29);

  objc_destroyWeak((id *)buf);
LABEL_23:

}

void __56__AXVisualAlertManager__processNextVisualAlertComponent__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(double *)(a1 + 48);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__AXVisualAlertManager__processNextVisualAlertComponent__block_invoke_2;
  v3[3] = &unk_24E5933D8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_msgSend(v1, "afterDelay:processBlock:", v3, v2);
  objc_destroyWeak(&v4);
}

void __56__AXVisualAlertManager__processNextVisualAlertComponent__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_processNextVisualAlertComponent");

}

- (void)_handleBeginVisualAlertForIncomingCall
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((self->_alertTypes & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "ignoreLogging");

    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v6 = objc_claimAutoreleasedReturnValue();

      v7 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v6, v7))
      {
        AXColorizeFormatLog();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, v7))
        {
          v10 = 138543362;
          v11 = v9;
          _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
        }

      }
    }
    -[AXVisualAlertManager _beginVisualAlertForType:repeat:](self, "_beginVisualAlertForType:repeat:", 1, 1);
  }
}

- (void)_handleEndVisualAlertForIncomingCall
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }

    }
  }
  -[AXVisualAlertManager _endVisualAlert](self, "_endVisualAlert");
}

- (void)_handleBeginVisualAlertForIncomingVideoConferenceCall
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  os_log_type_t v21;
  void *v22;
  void *v23;
  unint64_t alertTypes;
  uint64_t IsSpringBoard;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if ((self->_alertTypes & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "ignoreLogging");

    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v6 = objc_claimAutoreleasedReturnValue();

      v7 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v6, v7))
      {
        AXColorizeFormatLog();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        IsSpringBoard = AXProcessIsSpringBoard();
        v26 = -[AXVisualAlertManager _shouldHandleVisualAlertsForVideoConferenceCallsInConferenceFramework](self, "_shouldHandleVisualAlertsForVideoConferenceCallsInConferenceFramework");
        _AXStringForArgs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, v7))
        {
          *(_DWORD *)buf = 138543362;
          v28 = v9;
          _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", buf, 0xCu);
        }

      }
    }
    if (AXProcessIsSpringBoard()
      && -[AXVisualAlertManager _shouldHandleVisualAlertsForVideoConferenceCallsInConferenceFramework](self, "_shouldHandleVisualAlertsForVideoConferenceCallsInConferenceFramework"))
    {
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "ignoreLogging");

      if ((v11 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v13 = objc_claimAutoreleasedReturnValue();

        v14 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v13, v14))
        {
          AXColorizeFormatLog();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, v14))
          {
            *(_DWORD *)buf = 138543362;
            v28 = v16;
            _os_log_impl(&dword_21FD32000, v13, v14, "%{public}@", buf, 0xCu);
          }

        }
      }
      +[AXDistributedNotificationHandler postDistributedNotificationWithName:](AXDistributedNotificationHandler, "postDistributedNotificationWithName:", CFSTR("AXVisualAlertManagerVideoConferenceCallRingingNotification"), IsSpringBoard, v26);
      self->_videoConferenceCallRinging = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance", IsSpringBoard, v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "ignoreLogging");

      if ((v18 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v20 = objc_claimAutoreleasedReturnValue();

        v21 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v20, v21))
        {
          AXColorizeFormatLog();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, v21))
          {
            *(_DWORD *)buf = 138543362;
            v28 = v23;
            _os_log_impl(&dword_21FD32000, v20, v21, "%{public}@", buf, 0xCu);
          }

        }
      }
      alertTypes = self->_alertTypes;
      self->_alertTypes = alertTypes | 1;
      -[AXVisualAlertManager _handleBeginVisualAlertForIncomingCall](self, "_handleBeginVisualAlertForIncomingCall");
      self->_alertTypes = alertTypes;
    }
  }
}

- (void)_handleEndVisualAlertForIncomingVideoConferenceCall
{
  if (AXProcessIsSpringBoard()
    && -[AXVisualAlertManager _shouldHandleVisualAlertsForVideoConferenceCallsInConferenceFramework](self, "_shouldHandleVisualAlertsForVideoConferenceCallsInConferenceFramework"))
  {
    +[AXDistributedNotificationHandler postDistributedNotificationWithName:](AXDistributedNotificationHandler, "postDistributedNotificationWithName:", CFSTR("AXVisualAlertManagerVideoConferenceCallHandledNotification"));
    self->_videoConferenceCallRinging = 0;
  }
  else
  {
    -[AXVisualAlertManager _handleEndVisualAlertForIncomingCall](self, "_handleEndVisualAlertForIncomingCall");
  }
}

- (void)_handleBeginVisualAlertForAlarmWithSound:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ignoreLogging");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      AXColorizeFormatLog();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v10;
        _os_log_impl(&dword_21FD32000, v7, v8, "%{public}@", buf, 0xCu);
      }

    }
  }
  if ((self->_alertTypes & 0x20) != 0)
    -[AXVisualAlertManager _beginVisualAlertForType:repeat:skipAutomaticStopOnUserInteraction:bundleId:](self, "_beginVisualAlertForType:repeat:skipAutomaticStopOnUserInteraction:bundleId:", 32, 1, 0, 0);
}

- (void)_handleEndVisualAlertForAlarm
{
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  void *v17;
  const char *Name;
  unint64_t alertTypes;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ignoreLogging");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      AXColorizeFormatLog();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      Name = sel_getName(a2);
      alertTypes = self->_alertTypes;
      _AXStringForArgs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v10;
        _os_log_impl(&dword_21FD32000, v7, v8, "%{public}@", buf, 0xCu);
      }

    }
  }
  if ((self->_alertTypes & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ignoreLogging");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v14 = objc_claimAutoreleasedReturnValue();

      v15 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v14, v15))
      {
        AXColorizeFormatLog();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, v15))
        {
          *(_DWORD *)buf = 138543362;
          v21 = v17;
          _os_log_impl(&dword_21FD32000, v14, v15, "%{public}@", buf, 0xCu);
        }

      }
    }
    -[AXVisualAlertManager _endVisualAlert](self, "_endVisualAlert", Name, alertTypes);
  }
}

- (void)_handleVisualAlertForRegularNotification:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((self->_alertTypes & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "ignoreLogging");

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v8 = objc_claimAutoreleasedReturnValue();

      v9 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v8, v9))
      {
        AXColorizeFormatLog();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, v9))
        {
          v12 = 138543362;
          v13 = v11;
          _os_log_impl(&dword_21FD32000, v8, v9, "%{public}@", (uint8_t *)&v12, 0xCu);
        }

      }
    }
    -[AXVisualAlertManager _beginVisualAlertForType:repeat:skipAutomaticStopOnUserInteraction:bundleId:](self, "_beginVisualAlertForType:repeat:skipAutomaticStopOnUserInteraction:bundleId:", 8, 0, 0, v4);
  }

}

- (void)_handleVisualAlertForExternalApplication
{
  unint64_t alertTypes;

  alertTypes = self->_alertTypes;
  if ((alertTypes & 0x10) != 0)
  {
    self->_alertTypes = alertTypes | 8;
    -[AXVisualAlertManager _handleVisualAlertForRegularNotification:](self, "_handleVisualAlertForRegularNotification:", 0);
    self->_alertTypes = alertTypes;
  }
}

- (void)_handleVisualAlertForIncomingMessage
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((self->_alertTypes & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "ignoreLogging");

    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v6 = objc_claimAutoreleasedReturnValue();

      v7 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v6, v7))
      {
        AXColorizeFormatLog();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, v7))
        {
          v10 = 138543362;
          v11 = v9;
          _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
        }

      }
    }
    -[AXVisualAlertManager _beginVisualAlertForType:repeat:](self, "_beginVisualAlertForType:repeat:", 4, 0);
  }
}

- (void)_handleSecondaryVisualAlertManagerDidStart
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_isDeviceLocked)
    -[VISAXNotificationHandler processHandler:](self->_deviceLockStateChangedNotificationHandler, "processHandler:", sel__handleDeviceWasLocked);
  if (self->_isTorchEnabledInControlCenter)
    -[VISAXNotificationHandler processHandler:](self->_torchInControlCenterWasEnabledNotificationHandler, "processHandler:", sel__handleTorchInControlCenterWasEnabled);
  if (self->_videoConferenceCallRinging && self->_videoConferenceCallExists)
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "ignoreLogging");

    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v6 = objc_claimAutoreleasedReturnValue();

      v7 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v6, v7))
      {
        AXColorizeFormatLog();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, v7))
        {
          v10 = 138543362;
          v11 = v9;
          _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
        }

      }
    }
    -[AXVisualAlertManager _handleBeginVisualAlertForIncomingVideoConferenceCall](self, "_handleBeginVisualAlertForIncomingVideoConferenceCall");
  }
}

- (void)_handleVideoConferenceCallRinging
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((self->_alertTypes & 2) != 0
    && -[AXVisualAlertManager _hasVideoConferenceCameraTorchManager](self, "_hasVideoConferenceCameraTorchManager"))
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "ignoreLogging");

    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v6 = objc_claimAutoreleasedReturnValue();

      v7 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v6, v7))
      {
        AXColorizeFormatLog();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, v7))
        {
          v10 = 138543362;
          v11 = v9;
          _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
        }

      }
    }
    -[AXVisualAlertManager _handleBeginVisualAlertForIncomingVideoConferenceCall](self, "_handleBeginVisualAlertForIncomingVideoConferenceCall");
  }
}

- (void)_handleLockButtonPressed
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v11 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", buf, 0xCu);
      }

    }
  }
  if (!self->_skipAutomaticStopOnUserInteraction)
    -[AXVisualAlertManager _endVisualAlert](self, "_endVisualAlert");
}

- (void)_handleVolumeChanged
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }

    }
  }
  -[AXVisualAlertManager _handleLockButtonPressed](self, "_handleLockButtonPressed");
}

- (void)_handleDeviceWasLocked
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v11 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", buf, 0xCu);
      }

    }
  }
  self->_isDeviceLocked = 1;
}

- (void)_handleDeviceWasUnlocked
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  self->_isDeviceLocked = 0;
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v11 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", buf, 0xCu);
      }

    }
  }
  if (!self->_skipAutomaticStopOnUserInteraction)
    -[AXVisualAlertManager _endVisualAlert](self, "_endVisualAlert");
}

- (void)_handleRingerSwitchToggled
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  void *v18;
  _BOOL8 isRingerSwitchSilent;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  self->_isRingerSwitchSilent = BKSHIDServicesGetRingerState() == 0;
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      isRingerSwitchSilent = self->_isRingerSwitchSilent;
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", buf, 0xCu);
      }

    }
  }
  if (self->_isRingerSwitchSilent)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldFlashForAlertInSilentMode");

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "ignoreLogging");

      if ((v13 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v15 = objc_claimAutoreleasedReturnValue();

        v16 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v15, v16))
        {
          AXColorizeFormatLog();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, v16))
          {
            *(_DWORD *)buf = 138543362;
            v21 = v18;
            _os_log_impl(&dword_21FD32000, v15, v16, "%{public}@", buf, 0xCu);
          }

        }
      }
      -[AXVisualAlertManager _endVisualAlert](self, "_endVisualAlert", isRingerSwitchSilent);
    }
  }
}

- (void)_handleQuietModeWasEnabled
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }

    }
  }
  self->_isQuietModeEnabled = 1;
  -[AXVisualAlertManager _endVisualAlert](self, "_endVisualAlert");
}

- (void)_handleQuietModeWasDisabled
{
  self->_isQuietModeEnabled = 0;
}

- (void)_handleTorchInControlCenterWasEnabled
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  self->_isTorchEnabledInControlCenter = 1;
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }

    }
  }
  -[AXVisualAlertManager _endVisualAlert](self, "_endVisualAlert");
}

- (void)_handleTorchInControlCenterWasDisabled
{
  self->_isTorchEnabledInControlCenter = 0;
}

- (void)_handleCaptureSessionDidStartRunning
{
  self->_captureSessionRunning = 1;
}

- (void)_handleCaptureSessionDidStopRunning
{
  self->_captureSessionRunning = 0;
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __59__AXVisualAlertManager__handleCaptureSessionDidStopRunning__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "_typeToUseForVisualAlertAfterCaptureSessionStopsRunning");
  if (result)
  {
    v3 = result;
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ignoreLogging");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v7, v8))
      {
        AXColorizeFormatLog();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, v8))
        {
          v11 = 138543362;
          v12 = v10;
          _os_log_impl(&dword_21FD32000, v7, v8, "%{public}@", (uint8_t *)&v11, 0xCu);
        }

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_beginVisualAlertForType:repeat:", v3, 1);
    return objc_msgSend(*(id *)(a1 + 32), "_setTypeToUseForVisualAlertAfterCaptureSessionStopsRunning:", 0);
  }
  return result;
}

- (void)_insertCustomLogicForSystemWideServer
{
  id v2;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_546, &__block_literal_global_570, &__block_literal_global_576, &__block_literal_global_578);

}

uint64_t __61__AXVisualAlertManager__insertCustomLogicForSystemWideServer__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("BBSound"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BBBulletin"), CFSTR("sectionID"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLockScreenManager"), CFSTR("isUILocked"), "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBPrototypeController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBPrototypeController"), CFSTR("rootSettings"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SpringBoard"), CFSTR("_sensorActivityDataProvider"), "SBSensorActivityDataProvider");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSensorActivityDataProvider"), CFSTR("activeCameraAndMicrophoneActivityAttributions"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSensorActivityAttribution"), CFSTR("sensor"), "q", 0);

  return 1;
}

uint64_t __61__AXVisualAlertManager__insertCustomLogicForSystemWideServer__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AXVisualAlerts"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Visual Alerts"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __61__AXVisualAlertManager__insertCustomLogicForSystemWideServer__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXVisualAlertSBNCSoundController"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXVisualAlertSBNCScreenController"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AXVisualAlertSBUIFlashlightController"), 1);

}

- (id)_normalizedStrobePatternForOriginalPattern:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned int v20;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("StrobePattern"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v3;
  if (!v4)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("VibePattern"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("OnDuration"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", CFSTR("OffDuration"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v7, "doubleValue");
        v10 = (int)(v9 * 1000.0);
        objc_msgSend(v8, "doubleValue");
        v20 = (int)(v11 * 1000.0);
        v12 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "arrayWithObjects:", v13, v14, v15, v16, 0);
        v17 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v13;
      }
      else
      {
        v17 = 0;
      }

      v6 = (void *)v17;
    }
    v5 = v3;
    if (v6)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v3);
      objc_msgSend(v18, "setObject:forKey:", v6, CFSTR("StrobePattern"));
      objc_msgSend(v18, "removeObjectForKey:", CFSTR("VibePattern"));
      objc_msgSend(v18, "removeObjectForKey:", CFSTR("OnDuration"));
      objc_msgSend(v18, "removeObjectForKey:", CFSTR("OffDuration"));
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

- (BOOL)_hasVideoConferenceCameraTorchManager
{
  AXCameraTorchManagerBackgroundAdapter *asyncManagerAdapter;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  asyncManagerAdapter = self->_asyncManagerAdapter;
  if (asyncManagerAdapter)
  {
    v3 = (void *)MEMORY[0x24BDD1488];
    -[AXCameraTorchManagerBackgroundAdapter synchronousTorchManager](asyncManagerAdapter, "synchronousTorchManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.AVConference"));

    LOBYTE(asyncManagerAdapter) = v7;
  }
  return (char)asyncManagerAdapter;
}

- (BOOL)_supportsVisualAlertsForVideoConferenceCalls
{
  if (_supportsVisualAlertsForVideoConferenceCalls__AXVisualAlertManagerHasLegacySOCOnceToken != -1)
    dispatch_once(&_supportsVisualAlertsForVideoConferenceCalls__AXVisualAlertManagerHasLegacySOCOnceToken, &__block_literal_global_586);
  return (_supportsVisualAlertsForVideoConferenceCalls__AXVisualAlertManagerHasLegacySOC & 1) == 0;
}

uint64_t __68__AXVisualAlertManager__supportsVisualAlertsForVideoConferenceCalls__block_invoke()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  uint64_t result;

  v0 = *MEMORY[0x24BDD8B18];
  v1 = IOServiceMatching("AppleH3CamIn");
  result = IOServiceGetMatchingService(v0, v1);
  if ((_DWORD)result)
  {
    _supportsVisualAlertsForVideoConferenceCalls__AXVisualAlertManagerHasLegacySOC = 1;
    return IOObjectRelease(result);
  }
  return result;
}

- (BOOL)_shouldHandleVisualAlertsForVideoConferenceCallsInConferenceFramework
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_isDeviceLocked || !self->_videoConferenceCallRinging)
    return -[AXVisualAlertManager _supportsVisualAlertsForVideoConferenceCalls](self, "_supportsVisualAlertsForVideoConferenceCalls");
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }

    }
  }
  return 0;
}

- (BOOL)_isTorchEnabledInControlCenter
{
  return self->_isTorchEnabledInControlCenter;
}

- (int)ringerStateNotifyToken
{
  return self->_ringerStateNotifyToken;
}

- (void)setRingerStateNotifyToken:(int)a3
{
  self->_ringerStateNotifyToken = a3;
}

- (NSDictionary)_activePattern
{
  return self->_activePattern;
}

- (void)_setActivePattern:(id)a3
{
  objc_storeStrong((id *)&self->_activePattern, a3);
}

- (unint64_t)_typeToUseForVisualAlertAfterCaptureSessionStopsRunning
{
  return self->_typeToUseForVisualAlertAfterCaptureSessionStopsRunning;
}

- (void)_setTypeToUseForVisualAlertAfterCaptureSessionStopsRunning:(unint64_t)a3
{
  self->_typeToUseForVisualAlertAfterCaptureSessionStopsRunning = a3;
}

- (BOOL)_isTorchDeviceOpen
{
  return self->_torchDeviceOpen;
}

- (BOOL)_isTorchDeviceOn
{
  return self->_torchDeviceOn;
}

- (AXCameraTorchManagerBackgroundAdapter)_asyncManagerAdapter
{
  return self->_asyncManagerAdapter;
}

- (DNDStateService)disturbanceService
{
  return self->disturbanceService;
}

- (void)setDisturbanceService:(id)a3
{
  objc_storeStrong((id *)&self->disturbanceService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->disturbanceService, 0);
  objc_storeStrong((id *)&self->_asyncManagerAdapter, 0);
  objc_storeStrong((id *)&self->_bulletins, 0);
  objc_storeStrong((id *)&self->_torchInControlCenterWasEnabledNotificationHandler, 0);
  objc_storeStrong((id *)&self->_deviceLockStateChangedNotificationHandler, 0);
  objc_storeStrong((id *)&self->_notificationHandlers, 0);
  objc_storeStrong((id *)&self->_patternToUseForVisualAlertAfterCaptureSessionStopsRunning, 0);
  objc_storeStrong((id *)&self->_activePattern, 0);
  objc_storeStrong((id *)&self->_patterns, 0);
  objc_storeStrong((id *)&self->_torchForceShutdownTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)_springBoardLockStateChange:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getkSBNotificationKeyDeviceLockState(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXVisualAlertManager.m"), 86, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_startForAlertTypes:cameraTorchManager:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBLockButtonPressedNotification(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXVisualAlertManager.m"), 85, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_startForAlertTypes:cameraTorchManager:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBVolumeButtonPressedNotification(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXVisualAlertManager.m"), 82, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_startForAlertTypes:cameraTorchManager:.cold.3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBDeviceLockStateChangedNotification(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXVisualAlertManager.m"), 84, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_startForAlertTypes:cameraTorchManager:.cold.4()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBRingerChangedNotification(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXVisualAlertManager.m"), 83, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

@end
