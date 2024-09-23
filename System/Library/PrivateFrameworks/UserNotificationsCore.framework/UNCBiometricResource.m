@implementation UNCBiometricResource

- (UNCBiometricResource)init
{
  UNCBiometricResource *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UNCBiometricResource;
  v2 = -[UNCBiometricResource init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.usernotifications.UNCBiometricResource", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    -[UNCBiometricResource _updateIsPasscodeSet](v2, "_updateIsPasscodeSet");
    -[UNCBiometricResource _updateIsBiometricUnlockAllowed](v2, "_updateIsBiometricUnlockAllowed");
    -[UNCBiometricResource _initializeBiometricKit](v2, "_initializeBiometricKit");
    -[UNCBiometricResource _registerForBiometricUnlockAllowedChange](v2, "_registerForBiometricUnlockAllowedChange");
    -[UNCBiometricResource _registerForPasscodeChange](v2, "_registerForPasscodeChange");
  }
  return v2;
}

- (void)_initializeBiometricKit
{
  BKDevice *pearlDevice;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  void *v11;
  id v12;
  void *v13;
  char isKindOfClass;
  BKDevice *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  pearlDevice = self->_pearlDevice;
  self->_pearlDevice = 0;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(MEMORY[0x24BE0CE28], "availableDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v5)
    goto LABEL_12;
  v6 = v5;
  v7 = *(_QWORD *)v18;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
      v10 = NSClassFromString(CFSTR("BKDevice"));
      v16 = 0;
      -[objc_class deviceWithDescriptor:error:](v10, "deviceWithDescriptor:error:", v9, &v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v16;
      objc_msgSend(v11, "descriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "type") == 2)
      {
        NSClassFromString(CFSTR("BKDevicePearl"));
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          goto LABEL_10;
        v15 = v11;
        v13 = self->_pearlDevice;
        self->_pearlDevice = v15;
      }

LABEL_10:
      ++v8;
    }
    while (v6 != v8);
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v6);
LABEL_12:

  -[UNCBiometricResource _updateHasEnrolledPearlIdentities](self, "_updateHasEnrolledPearlIdentities");
  if (self->_pearlDevice)
    -[UNCBiometricResource _registerForBKEnrollmentChange](self, "_registerForBKEnrollmentChange");
}

- (void)dealloc
{
  objc_super v3;

  -[UNCBiometricResource _unregisterForBKEnrollmentChange](self, "_unregisterForBKEnrollmentChange");
  -[UNCBiometricResource _unregisterForBiometricUnlockAllowedChange](self, "_unregisterForBiometricUnlockAllowedChange");
  v3.receiver = self;
  v3.super_class = (Class)UNCBiometricResource;
  -[UNCBiometricResource dealloc](&v3, sel_dealloc);
}

- (void)_registerForBKEnrollmentChange
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleBKEnrollmentChange, CFSTR("com.apple.BiometricKit.enrollmentChanged"), 0, (CFNotificationSuspensionBehavior)0);
}

- (void)_unregisterForBKEnrollmentChange
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.BiometricKit.enrollmentChanged"), 0);
}

- (void)_registerForBiometricUnlockAllowedChange
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateIsBiometricUnlockAllowed, *MEMORY[0x24BE63740], 0);

}

- (void)_unregisterForBiometricUnlockAllowedChange
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE63740], 0);

}

- (void)_registerForPasscodeChange
{
  const char *v3;
  NSObject *queue;
  _QWORD v5[5];
  int out_token;

  out_token = 0;
  v3 = (const char *)objc_msgSend((id)*MEMORY[0x24BE63B68], "cStringUsingEncoding:", 4);
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__UNCBiometricResource__registerForPasscodeChange__block_invoke;
  v5[3] = &unk_251AE03A8;
  v5[4] = self;
  notify_register_dispatch(v3, &out_token, queue, v5);
}

uint64_t __50__UNCBiometricResource__registerForPasscodeChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateIsPasscodeSet");
}

- (void)_updateIsPasscodeSet
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isPasscodeSet = objc_msgSend(v3, "isPasscodeSet");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("BBBiometricResourceStateChanged"), self, 0);

}

- (void)_updateIsBiometricUnlockAllowed
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__UNCBiometricResource__updateIsBiometricUnlockAllowed__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __55__UNCBiometricResource__updateIsBiometricUnlockAllowed__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = objc_msgSend(v2, "isFingerprintUnlockAllowed");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("BBBiometricResourceStateChanged"), *(_QWORD *)(a1 + 32), 0);

}

- (void)_updateHasEnrolledPearlIdentities
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__UNCBiometricResource__updateHasEnrolledPearlIdentities__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __57__UNCBiometricResource__updateHasEnrolledPearlIdentities__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    v6 = 0;
    objc_msgSend(v2, "identitiesWithError:", &v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
    if (objc_msgSend(v3, "count"))
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("BBBiometricResourceStateChanged"), *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)isPearlEnabledAndEnrolled
{
  return self->_isPasscodeSet && self->_hasEnrolledPearlIdentities && self->_isBiometricUnlockAllowed;
}

- (BOOL)hasPearlCapability
{
  return self->_pearlDevice != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pearlDevice, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
