@implementation PLDistributedNotificationHandler

- (PLDistributedNotificationHandler)initWithLibraryBundleController:(id)a3
{
  id v5;
  PLDistributedNotificationHandler *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *notificationQueue;
  PLAppUninstallNotificationHandler *v11;
  PLAppUninstallNotificationHandler *appUninstallNotificationHandler;
  PLDistributedNotificationHandler *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLDistributedNotificationHandler;
  v6 = -[PLDistributedNotificationHandler init](&v15, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.photos.distnoted.handler", v8);
    notificationQueue = v6->_notificationQueue;
    v6->_notificationQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_libraryBundleController, a3);
    v11 = -[PLAppUninstallNotificationHandler initWithLibraryBundleController:]([PLAppUninstallNotificationHandler alloc], "initWithLibraryBundleController:", v5);
    appUninstallNotificationHandler = v6->_appUninstallNotificationHandler;
    v6->_appUninstallNotificationHandler = v11;

    v13 = v6;
  }

  return v6;
}

- (void)registerForNotifications
{
  NSObject *notificationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  notificationQueue = self->_notificationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__PLDistributedNotificationHandler_registerForNotifications__block_invoke;
  v4[3] = &unk_1E3668B60;
  objc_copyWeak(&v5, &location);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", notificationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_handleNotification:(id)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  char *v10;
  const char *string;
  void *v12;
  char *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    PLDescriptionFromXPCObject();
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Got distributed notification: %@", (uint8_t *)&v15, 0xCu);

  }
  v7 = MEMORY[0x19AEC2100](v4);
  v8 = MEMORY[0x1E0C812F8];
  if (v7 != MEMORY[0x1E0C812F8])
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      PLDescriptionFromXPCObject();
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Unexpected notification: %@", (uint8_t *)&v15, 0xCu);

    }
LABEL_6:

    goto LABEL_7;
  }
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81298]);
  if (!strcmp(string, "com.apple.assetsd.cloudphoto"))
  {
    -[PLDistributedNotificationHandler _handleCloudPhotoNotification](self, "_handleCloudPhotoNotification");
    goto LABEL_7;
  }
  if (strcmp(string, "Application Uninstalled"))
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315138;
      v16 = string;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Unexpected event name: %s", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_6;
  }
  xpc_dictionary_get_value(v4, "UserInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x19AEC2100]() == v8)
    v13 = (char *)_CFXPCCreateCFObjectFromXPCObject();
  else
    v13 = 0;
  PLBackendGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = v13;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Handling Application Uninstalled event for %{public}@.", (uint8_t *)&v15, 0xCu);
  }

  -[PLAppUninstallNotificationHandler handleApplicationUninstalledNotification:](self->_appUninstallNotificationHandler, "handleApplicationUninstalledNotification:", v13);
LABEL_7:

}

- (void)_openSystemPhotoLibrary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PLPhotoLibraryOpener *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryBundleController openBundleAtLibraryURL:](self->_libraryBundleController, "openBundleAtLibraryURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "libraryServicesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLPhotoLibraryOpener initWithLibraryServicesManager:reportInProgressUpgrades:]([PLPhotoLibraryOpener alloc], "initWithLibraryServicesManager:reportInProgressUpgrades:", v6, 0);
    v16 = 0;
    v8 = -[PLPhotoLibraryOpener openPhotoLibraryDatabaseWithAutoUpgrade:autoCreate:error:](v7, "openPhotoLibraryDatabaseWithAutoUpgrade:autoCreate:error:", 0, 0, &v16);
    v9 = v16;
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "Distributed notification handler: Opened system photo library";
        v13 = v11;
        v14 = OS_LOG_TYPE_DEFAULT;
        v15 = 2;
LABEL_9:
        _os_log_impl(&dword_199541000, v13, v14, v12, buf, v15);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v3;
      v19 = 2112;
      v20 = v9;
      v12 = "Distributed notification handler: Unable to open library at URL: %@, error: %@";
      v13 = v11;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
      goto LABEL_9;
    }

    goto LABEL_11;
  }
  PLBackendGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v3;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Distributed notification handler: No library bundle for URL %@", buf, 0xCu);
  }
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appUninstallNotificationHandler, 0);
  objc_storeStrong((id *)&self->_libraryBundleController, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

void __60__PLDistributedNotificationHandler_registerForNotifications__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleNotification:", v3);

}

@end
