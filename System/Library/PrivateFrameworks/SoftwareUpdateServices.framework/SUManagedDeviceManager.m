@implementation SUManagedDeviceManager

- (SUManagedDeviceManager)init
{
  SUManagedDeviceManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *workQueue;
  void *v5;
  uint64_t v6;
  NSString *assetAudience;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUManagedDeviceManager;
  v2 = -[SUManagedDeviceManager init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.softwareupdateservices.mdmWorkQueue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    +[SUState currentState](SUState, "currentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastAssetAudience");
    v6 = objc_claimAutoreleasedReturnValue();
    assetAudience = v2->_assetAudience;
    v2->_assetAudience = (NSString *)v6;

    v2->_notifyToken = 0;
    -[SUManagedDeviceManager registerProfileChangeListener](v2, "registerProfileChangeListener");

  }
  return v2;
}

- (void)dealloc
{
  SUManagedDeviceManagerDelegate *delegate;
  objc_super v4;

  delegate = self->_delegate;
  self->_delegate = 0;

  -[SUManagedDeviceManager unregisterProfileChangeListener](self, "unregisterProfileChangeListener");
  v4.receiver = self;
  v4.super_class = (Class)SUManagedDeviceManager;
  -[SUManagedDeviceManager dealloc](&v4, sel_dealloc);
}

+ (id)sharedInstance
{
  if (sharedInstance_pred_2 != -1)
    dispatch_once(&sharedInstance_pred_2, &__block_literal_global_13);
  return (id)sharedInstance___instance_6;
}

void __40__SUManagedDeviceManager_sharedInstance__block_invoke()
{
  SUManagedDeviceManager *v0;
  void *v1;

  v0 = objc_alloc_init(SUManagedDeviceManager);
  v1 = (void *)sharedInstance___instance_6;
  sharedInstance___instance_6 = (uint64_t)v0;

}

- (BOOL)isManagedByMDM
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSupervised");

  return v3;
}

- (BOOL)isDelayingUpdates
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = -[SUManagedDeviceManager isManagedByMDM](self, "isManagedByMDM");
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSoftwareUpdateResisted");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)allowSplat
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = -[SUManagedDeviceManager isManagedByMDM](self, "isManagedByMDM");
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isRapidSecurityResponseInstallationAllowed");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)allowSplatRollback
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = -[SUManagedDeviceManager isManagedByMDM](self, "isManagedByMDM");
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isRapidSecurityResponseRemovalAllowed");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (unint64_t)delayPeriodInDays
{
  void *v2;
  unint64_t v3;

  if (!-[SUManagedDeviceManager isDelayingUpdates](self, "isDelayingUpdates"))
    return 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enforcedSoftwareUpdateDelayInDays");

  return v3;
}

- (unint64_t)softwareUpdatePathRestriction
{
  void *v3;
  uint64_t v4;

  if (!-[SUManagedDeviceManager isManagedByMDM](self, "isManagedByMDM"))
    return 3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "softwareUpdatePath");

  return -[SUManagedDeviceManager MCPathToSUMDMPath:](self, "MCPathToSUMDMPath:", v4);
}

- (void)registerProfileChangeListener
{
  const char *v3;
  NSObject *v4;
  _QWORD handler[5];

  v3 = (const char *)objc_msgSend((id)*MEMORY[0x24BE63B78], "UTF8String");
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __55__SUManagedDeviceManager_registerProfileChangeListener__block_invoke;
  handler[3] = &unk_24CE3CCF0;
  handler[4] = self;
  notify_register_dispatch(v3, &self->_notifyToken, v4, handler);

}

uint64_t __55__SUManagedDeviceManager_registerProfileChangeListener__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  SULogInfo(CFSTR("Received profile change notification in registerProfileChangeListener"), a2, a3, a4, a5, a6, a7, a8, v10);
  return objc_msgSend(*(id *)(a1 + 32), "profileChanged");
}

- (void)unregisterProfileChangeListener
{
  int notifyToken;

  notifyToken = self->_notifyToken;
  if (notifyToken)
    notify_cancel(notifyToken);
}

- (void)profileChanged
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  dispatch_time_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[5];

  SULogInfo(CFSTR("recived profile change notification"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v11);
  v9 = dispatch_time(0, 1000000000);
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SUManagedDeviceManager_profileChanged__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_after(v9, v10, block);

}

void __40__SUManagedDeviceManager_profileChanged__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  MEMORY[0x212BF5AF4](CFSTR("com.apple.MobileAsset.SoftwareUpdate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAssetAudience:", v2);

}

- (void)setAssetAudience:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUManagedDeviceManager_setAssetAudience___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(workQueue, block);

}

void __43__SUManagedDeviceManager_setAssetAudience___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    SULogInfo(CFSTR("Asset audience changed from:%@ to:%@"), v2, v3, v4, v5, v6, v7, v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
    +[SUState currentState](SUState, "currentState");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLastAssetAudience:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v9, "save");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "assetAudienceChanged:");

  }
}

- (void)refreshAssetAudience
{
  id v3;

  MEMORY[0x212BF5AF4](CFSTR("com.apple.MobileAsset.SoftwareUpdate"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SUManagedDeviceManager setAssetAudience:](self, "setAssetAudience:", v3);

}

- (unint64_t)MCPathToSUMDMPath:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (SUManagedDeviceManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (SUManagedDeviceUpdateDelay)mdmDelay
{
  return self->_mdmDelay;
}

- (void)setMdmDelay:(id)a3
{
  objc_storeStrong((id *)&self->_mdmDelay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdmDelay, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assetAudience, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
