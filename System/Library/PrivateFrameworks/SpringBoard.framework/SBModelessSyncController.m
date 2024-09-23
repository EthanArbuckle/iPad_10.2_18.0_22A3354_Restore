@implementation SBModelessSyncController

- (SBModelessSyncController)init
{
  SBModelessSyncController *v2;
  SBModelessSyncController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBModelessSyncController;
  v2 = -[SBModelessSyncController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SBModelessSyncController _appSyncStateChanged](v2, "_appSyncStateChanged");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SBModelessSyncController endMonitoring](self, "endMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)SBModelessSyncController;
  -[SBModelessSyncController dealloc](&v3, sel_dealloc);
}

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1)
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_174);
  return (id)sharedInstance___instance_6;
}

uint64_t __42__SBModelessSyncController_sharedInstance__block_invoke()
{
  SBModelessSyncController *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBModelessSyncController);
  v1 = (void *)sharedInstance___instance_6;
  sharedInstance___instance_6 = (uint64_t)v0;

  return kdebug_trace();
}

- (void)setIsSyncing:(BOOL)a3
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  id v6;

  if (self->_isSyncing != a3)
  {
    self->_isSyncing = a3;
    v3 = CFSTR("kSBSyncSessionEnded");
    if (a3)
      v3 = CFSTR("kSBSyncSessionBegan");
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = v3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", v5, 0, 0);

  }
}

- (BOOL)isAutoSyncing
{
  return self->_isSyncing && self->_isAutoSyncing;
}

- (BOOL)isWirelessSyncing
{
  return self->_isSyncing && self->_isWirelessSyncing;
}

- (void)connection:(id)a3 updatedProgress:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;

  v5 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("Enabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("AutoSync"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("Wireless"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v10, "BOOLValue");
  -[SBModelessSyncController setIsSyncing:](self, "setIsSyncing:", v7);
  self->_isAutoSyncing = v9;
  self->_isWirelessSyncing = (char)v5;
}

- (void)connectionWasInterrupted:(id)a3
{
  -[SBModelessSyncController setIsSyncing:](self, "setIsSyncing:", 0);
}

- (void)beginMonitoring
{
  ATConnection *v3;
  ATConnection *airTrafficConnection;
  _QWORD handler[5];

  -[SBModelessSyncController _beginObservingICloudRestoreStatus](self, "_beginObservingICloudRestoreStatus");
  if (!self->_syncRegistrationToken)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __43__SBModelessSyncController_beginMonitoring__block_invoke;
    handler[3] = &unk_1E8E9EBA8;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.atc.wsyncnotify", &self->_syncRegistrationToken, MEMORY[0x1E0C80D38], handler);
  }
  v3 = (ATConnection *)objc_alloc_init(MEMORY[0x1E0CF7688]);
  airTrafficConnection = self->_airTrafficConnection;
  self->_airTrafficConnection = v3;

  -[ATConnection setDelegate:](self->_airTrafficConnection, "setDelegate:", self);
  -[ATConnection registerForStatus](self->_airTrafficConnection, "registerForStatus");
}

uint64_t __43__SBModelessSyncController_beginMonitoring__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appSyncStateChanged");
}

- (void)endMonitoring
{
  int syncRegistrationToken;
  ATConnection *airTrafficConnection;

  -[SBModelessSyncController _endObservingICloudRestoreStatus](self, "_endObservingICloudRestoreStatus");
  syncRegistrationToken = self->_syncRegistrationToken;
  if (syncRegistrationToken)
  {
    notify_cancel(syncRegistrationToken);
    self->_syncRegistrationToken = 0;
  }
  -[ATConnection setDelegate:](self->_airTrafficConnection, "setDelegate:", 0);
  airTrafficConnection = self->_airTrafficConnection;
  self->_airTrafficConnection = 0;

}

- (void)gotLowBatteryWarning
{
  -[ATConnection lowBatteryNotification](self->_airTrafficConnection, "lowBatteryNotification");
}

- (void)_appSyncStateChanged
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(self->_syncRegistrationToken, &state64);
  -[SBModelessSyncController _setAppSyncState:](self, "_setAppSyncState:", state64 != 0);
}

- (void)_setAppSyncState:(BOOL)a3
{
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  if (self->_isAppSyncing != a3)
  {
    self->_isAppSyncing = a3;
    v4 = CFSTR("kSBWirelessAppSyncEnded");
    if (a3)
      v4 = CFSTR("kSBWirelessAppSyncBegan");
    v5 = (void *)MEMORY[0x1E0CB37D0];
    v6 = v4;
    objc_msgSend(v5, "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", v6, 0, 0);

    if (!self->_isAppSyncing)
      -[SBModelessSyncController _updateIconsForStateChange](self, "_updateIconsForStateChange");
  }
}

- (void)_updateIconsForStateChange
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v3, "leafIcons", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasApplicationPlaceholder"))
          objc_msgSend(v9, "noteExternalApplicationPlaceholderStateChange");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (BOOL)isRestoringFromICloud
{
  return self->_restoringFromICloud;
}

- (void)_iCloudStatusChanged
{
  uint64_t v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t state64;

  state64 = 0;
  notify_get_state(self->_iCloudRestoreToken, &state64);
  v3 = state64 - 1;
  v4 = state64 - 1 < 2;
  if (self->_restoringFromICloud != v4)
  {
    self->_restoringFromICloud = v4;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3 >= 2)
      v7 = CFSTR("SBICloudRestoreDidEndNotification");
    else
      v7 = CFSTR("SBICloudRestoreDidBeginNotification");
    objc_msgSend(v5, "postNotificationName:object:", v7, 0);

  }
}

- (void)_beginObservingICloudRestoreStatus
{
  const char *v3;
  _QWORD handler[5];

  v3 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D4E0E0], "UTF8String");
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __62__SBModelessSyncController__beginObservingICloudRestoreStatus__block_invoke;
  handler[3] = &unk_1E8E9EBA8;
  handler[4] = self;
  notify_register_dispatch(v3, &self->_iCloudRestoreToken, MEMORY[0x1E0C80D38], handler);
  -[SBModelessSyncController _iCloudStatusChanged](self, "_iCloudStatusChanged");
}

uint64_t __62__SBModelessSyncController__beginObservingICloudRestoreStatus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_iCloudStatusChanged");
}

- (void)_endObservingICloudRestoreStatus
{
  notify_cancel(self->_iCloudRestoreToken);
  self->_iCloudRestoreToken = -1;
}

- (BOOL)isAppSyncing
{
  return self->_isAppSyncing;
}

- (BOOL)isSyncing
{
  return self->_isSyncing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airTrafficConnection, 0);
}

@end
