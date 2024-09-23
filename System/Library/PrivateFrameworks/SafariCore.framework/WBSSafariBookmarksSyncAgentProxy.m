@implementation WBSSafariBookmarksSyncAgentProxy

void __47__WBSSafariBookmarksSyncAgentProxy_sharedProxy__block_invoke()
{
  WBSSafariBookmarksSyncAgentProxy *v0;
  void *v1;

  v0 = objc_alloc_init(WBSSafariBookmarksSyncAgentProxy);
  v1 = (void *)sharedProxy_sharedProxy;
  sharedProxy_sharedProxy = (uint64_t)v0;

}

- (WBSSafariBookmarksSyncAgentProxy)init
{
  WBSSafariBookmarksSyncAgentProxy *v2;
  uint64_t v3;
  NSXPCConnection *safariBookmarksSyncAgentConnection;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WBSSafariBookmarksSyncAgentProxy *v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)WBSSafariBookmarksSyncAgentProxy;
  v2 = -[WBSSafariBookmarksSyncAgentProxy init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.SafariBookmarksSyncAgent"), 0);
    safariBookmarksSyncAgentConnection = v2->_safariBookmarksSyncAgentConnection;
    v2->_safariBookmarksSyncAgentConnection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEFF6988);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_fetchSyncedCloudTabDevicesAndCloseRequestsWithCompletionHandler_, 0, 1);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_fetchSyncedCloudTabDevicesAndCloseRequestsWithCompletionHandler_, 1, 1);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getCloudTabDevicesWithCompletionHandler_, 0, 1);
    -[NSXPCConnection setRemoteObjectInterface:](v2->_safariBookmarksSyncAgentConnection, "setRemoteObjectInterface:", v5);
    objc_initWeak(&location, v2);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__WBSSafariBookmarksSyncAgentProxy_init__block_invoke;
    v11[3] = &unk_1E649B5B0;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_safariBookmarksSyncAgentConnection, "setInvalidationHandler:", v11);
    -[NSXPCConnection resume](v2->_safariBookmarksSyncAgentConnection, "resume");
    v9 = v2;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)fetchCloudSettingsChangesImmediately
{
  void *v2;
  id v3;

  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchCloudSettingsChangesImmediately");

}

- (void)fetchRemoteMigrationStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRemoteMigrationStateWithCompletionHandler:", v4);

}

- (void)fetchSyncedCloudTabDevicesAndCloseRequestsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchSyncedCloudTabDevicesAndCloseRequestsWithCompletionHandler:", v4);

}

- (void)getCloudTabDevicesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getCloudTabDevicesWithCompletionHandler:", v4);

}

- (void)observeRemoteMigrationStateForSecondaryMigration
{
  void *v2;
  id v3;

  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observeRemoteMigrationStateForSecondaryMigration");

}

- (void)setUsesOpportunisticPushTopic:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesOpportunisticPushTopic:", v3);

}

- (NSXPCConnection)_safariBookmarksSyncAgentConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

+ (id)sharedProxy
{
  if (sharedProxy_onceToken != -1)
    dispatch_once(&sharedProxy_onceToken, &__block_literal_global_50);
  return (id)sharedProxy_sharedProxy;
}

void __40__WBSSafariBookmarksSyncAgentProxy_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "set_safariBookmarksSyncAgentConnection:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("WBSSafariBookmarksSyncAgentProxyConnectionWasInvalidatedNotification"), v3, 0);

    WeakRetained = v3;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)WBSSafariBookmarksSyncAgentProxy;
  -[WBSSafariBookmarksSyncAgentProxy dealloc](&v4, sel_dealloc);
}

- (void)registerForPushNotificationsIfNeeded
{
  void *v2;
  id v3;

  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerForPushNotificationsIfNeeded");

}

- (void)userAccountDidChange:(int64_t)a3
{
  void *v4;
  id v5;

  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userAccountDidChange:", a3);

}

- (void)getCloudSettingsContainerManateeStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getCloudSettingsContainerManateeStateWithCompletionHandler:", v4);

}

- (void)userDidUpdateBookmarkDatabase
{
  void *v2;
  id v3;

  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userDidUpdateBookmarkDatabase");

}

- (void)beginMigrationFromDAV
{
  void *v2;
  id v3;

  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginMigrationFromDAV");

}

- (void)collectDiagnosticsDataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectDiagnosticsDataWithCompletionHandler:", v4);

}

- (void)saveTabsForCurrentDeviceWithDictionaryRepresentation:(id)a3 deviceUUIDString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __124__WBSSafariBookmarksSyncAgentProxy_saveTabsForCurrentDeviceWithDictionaryRepresentation_deviceUUIDString_completionHandler___block_invoke;
  v14[3] = &unk_1E649DA98;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "saveTabsForCurrentDeviceWithDictionaryRepresentation:deviceUUIDString:completionHandler:", v10, v9, v14);

}

uint64_t __124__WBSSafariBookmarksSyncAgentProxy_saveTabsForCurrentDeviceWithDictionaryRepresentation_deviceUUIDString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)saveCloudTabCloseRequestWithDictionaryRepresentation:(id)a3 closeRequestUUIDString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saveCloudTabCloseRequestWithDictionaryRepresentation:closeRequestUUIDString:completionHandler:", v10, v9, v8);

}

- (void)deleteDevicesWithUUIDStrings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteDevicesWithUUIDStrings:completionHandler:", v7, v6);

}

- (void)deleteCloudTabCloseRequestsWithUUIDStrings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteCloudTabCloseRequestsWithUUIDStrings:completionHandler:", v7, v6);

}

- (void)triggerSafariTabGroupSync
{
  void *v2;
  id v3;

  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerSafariTabGroupSync");

}

- (void)getCloudTabContainerManateeStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getCloudTabContainerManateeStateWithCompletionHandler:", v4);

}

- (void)fetchCloudTabDevicesAndCloseRequests
{
  void *v2;
  id v3;

  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchCloudTabDevicesAndCloseRequests");

}

- (void)syncScribbleFeedbackUp:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncScribbleFeedbackUp:withCompletion:", v7, v6);

}

- (void)saveCloudSettingWithDictionaryRepresentation:(id)a3 successCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveCloudSettingWithDictionaryRepresentation:successCompletionHandler:", v7, v6);

}

- (void)deleteBackgroundImageFromCloudKitWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteBackgroundImageFromCloudKitWithCompletionHandler:", v4);

}

- (void)scheduleCloudBackgroundImageSaveWithURL:(id)a3 isLightAppearance:(BOOL)a4 successCompletionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scheduleCloudBackgroundImageSaveWithURL:isLightAppearance:successCompletionHandler:", v9, v5, v8);

}

- (void)triggerImmediateBackgroundImageSaveIfApplicable
{
  void *v2;
  id v3;

  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerImmediateBackgroundImageSaveIfApplicable");

}

- (void)syncDownSafariSettingsSyncWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncDownSafariSettingsSyncWithCompletion:", v4);

}

- (void)syncUpSafariSettingsSyncWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncUpSafariSettingsSyncWithCompletion:", v4);

}

- (void)deleteBackgroundImageDirectory
{
  void *v2;
  id v3;

  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteBackgroundImageDirectory");

}

- (void)fetchProfileEntitiesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchProfileEntitiesWithCompletion:", v4);

}

- (void)fetchTabGroupEntitiesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchTabGroupEntitiesWithCompletion:", v4);

}

- (void)syncDownSafariPerSiteSettingsSyncWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncDownSafariPerSiteSettingsSyncWithCompletion:", v4);

}

- (void)syncUpSafariPerSiteSettingsSyncWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncUpSafariPerSiteSettingsSyncWithCompletion:", v4);

}

- (void)saveCloudPerSiteSettingWithDictionaryRepresentation:(id)a3 successCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveCloudPerSiteSettingWithDictionaryRepresentation:successCompletionHandler:", v7, v6);

}

- (void)deletePerSiteSettingsSyncData
{
  void *v2;
  id v3;

  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deletePerSiteSettingsSyncData");

}

- (void)saveExtensionStatesWithDictionaryRepresentation:(id)a3 forDevice:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saveExtensionStatesWithDictionaryRepresentation:forDevice:completionHandler:", v10, v9, v8);

}

- (void)saveExtensionDeviceWithDictionaryRepresentation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveExtensionDeviceWithDictionaryRepresentation:completionHandler:", v7, v6);

}

- (void)getCloudExtensionStatesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getCloudExtensionStatesWithCompletionHandler:", v4);

}

- (void)deleteCloudExtensionDevicesWithUUIDStrings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteCloudExtensionDevicesWithUUIDStrings:completionHandler:", v7, v6);

}

- (void)deleteCloudExtensionStatesDatabaseWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteCloudExtensionStatesDatabaseWithCompletionHandler:", v4);

}

- (void)dumpCloudKitDataPrintByDates:(BOOL)a3 liveOnly:(BOOL)a4 printTree:(BOOL)a5 printPlist:(BOOL)a6 writeToFile:(BOOL)a7 atFileURL:(id)a8 completionHandler:(id)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  id v15;
  id v16;
  void *v17;
  id v18;

  v10 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v15 = a9;
  v16 = a8;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "remoteObjectProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dumpCloudKitDataPrintByDates:liveOnly:printTree:printPlist:writeToFile:atFileURL:completionHandler:", v12, v13, v12, v11, v10, v16, v15);

}

- (void)resetToDAVDatabaseWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetToDAVDatabaseWithCompletionHandler:", v4);

}

- (void)clearLocalDataIncludingMigrationState:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearLocalDataIncludingMigrationState:completionHandler:", v4, v6);

}

- (void)generateDAVServerIDsForExistingBookmarksWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generateDAVServerIDsForExistingBookmarksWithCompletionHandler:", v4);

}

- (void)migrateToCloudKitWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WBSSafariBookmarksSyncAgentProxy _safariBookmarksSyncAgentConnection](self, "_safariBookmarksSyncAgentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "migrateToCloudKitWithCompletionHandler:", v4);

}

- (void)set_safariBookmarksSyncAgentConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safariBookmarksSyncAgentConnection, 0);
}

@end
