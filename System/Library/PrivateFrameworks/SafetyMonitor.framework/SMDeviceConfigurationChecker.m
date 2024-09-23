@implementation SMDeviceConfigurationChecker

- (SMDeviceConfigurationChecker)initWithQueue:(id)a3
{
  id v5;
  SMDeviceConfigurationChecker *v6;
  SMDeviceConfigurationChecker *v7;
  uint64_t v8;
  IDSService *ownAccountIDSService;
  SMDeviceConfigurationChecker *v10;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)SMDeviceConfigurationChecker;
    v6 = -[SMDeviceConfigurationChecker init](&v12, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_queue, a3);
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.safetymonitor.ownaccount"));
      ownAccountIDSService = v7->_ownAccountIDSService;
      v7->_ownAccountIDSService = (IDSService *)v8;

      -[IDSService addDelegate:queue:](v7->_ownAccountIDSService, "addDelegate:queue:", v7, v7->_queue);
    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (SMDeviceConfigurationChecker)initWithQueue:(id)a3 messagingService:(id)a4
{
  SMDeviceConfigurationChecker *v6;
  SMDeviceConfigurationChecker *v7;
  SMDeviceConfigurationChecker *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SMDeviceConfigurationChecker;
  v6 = -[SMDeviceConfigurationChecker init](&v10, sel_init);
  v7 = v6;
  if (!v6 || (v8 = 0, a3) && a4)
    v8 = v6;

  return v8;
}

- (int64_t)getDeviceConfigurationLowPowerModeWarningState
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[SMDeviceConfigurationChecker queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__SMDeviceConfigurationChecker_getDeviceConfigurationLowPowerModeWarningState__block_invoke;
  v6[3] = &unk_25166D950;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __78__SMDeviceConfigurationChecker_getDeviceConfigurationLowPowerModeWarningState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_getDeviceConfigurationLowPowerModeWarningState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)getDeviceConfigurationLowPowerModeWarningStateWithPairedDeviceNearby:(BOOL)a3
{
  NSObject *v5;
  int64_t v6;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[SMDeviceConfigurationChecker queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __101__SMDeviceConfigurationChecker_getDeviceConfigurationLowPowerModeWarningStateWithPairedDeviceNearby___block_invoke;
  block[3] = &unk_25166D978;
  block[4] = self;
  block[5] = &v10;
  v9 = a3;
  dispatch_sync(v5, block);

  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __101__SMDeviceConfigurationChecker_getDeviceConfigurationLowPowerModeWarningStateWithPairedDeviceNearby___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_getDeviceConfigurationLowPowerModeWarningStateWithPairedDeviceNearby:", *(unsigned __int8 *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMDeviceConfigurationChecker queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __92__SMDeviceConfigurationChecker_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke;
  v7[3] = &unk_25166D9A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __92__SMDeviceConfigurationChecker_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (int64_t)_getDeviceConfigurationLowPowerModeWarningState
{
  return 1;
}

- (int64_t)_getDeviceConfigurationLowPowerModeWarningStateWithPairedDeviceNearby:(BOOL)a3
{
  return 1;
}

- (int64_t)_determineLowPowerModeWarningStateWithPairedDeviceNearby:(BOOL)a3
{
  return 1;
}

- (id)effectivePairedDevice
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SMDeviceConfigurationChecker ownAccountIDSService](self, "ownAccountIDSService", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isDefaultPairedDevice") && objc_msgSend(v7, "relationship") == 1)
        {
          v4 = v7;
          goto LABEL_12;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (BOOL)isEffectivePairedDeviceNearby
{
  void *v2;
  char v3;

  -[SMDeviceConfigurationChecker effectivePairedDevice](self, "effectivePairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNearby");

  return v3;
}

+ (id)convertLowPowerModeWarningStateToString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("LowPowerModeWarningStateEnabled");
  if (a3 == 1)
    v3 = CFSTR("LowPowerModeStateWarningDisabled");
  if (a3)
    return (id)v3;
  else
    return CFSTR("LowPowerModeStateWarningUnknown");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IDSService)ownAccountIDSService
{
  return self->_ownAccountIDSService;
}

- (void)setOwnAccountIDSService:(id)a3
{
  objc_storeStrong((id *)&self->_ownAccountIDSService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownAccountIDSService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
