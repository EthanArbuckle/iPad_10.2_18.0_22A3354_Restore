@implementation PLCPLSettingsObserver

- (PLCPLSettingsObserver)initWithLibraryBundle:(id)a3
{
  id v6;
  PLCPLSettingsObserver *v7;
  id v8;
  id v9;
  uint64_t v10;
  PLLazyObject *lazySettings;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLCPLSettingsObserver;
  v7 = -[PLCPLSettingsObserver init](&v19, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PLCPLSettings.m"), 350, CFSTR("Missing library bundle"));

    }
    objc_storeStrong((id *)&v7->_libraryBundle, a3);
    v8 = objc_initWeak(&location, v7);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__PLCPLSettingsObserver_initWithLibraryBundle___block_invoke;
    v15[3] = &unk_1E3670E50;
    objc_copyWeak(&v17, &location);
    v16 = v6;
    v10 = objc_msgSend(v9, "initWithRetriableBlock:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    lazySettings = v7->_lazySettings;
    v7->_lazySettings = (PLLazyObject *)v10;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_settingsDidChange, CFSTR("PLCPLSettingsDidChangeNotification"), 0, (CFNotificationSuspensionBehavior)1024);
  }

  return v7;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("PLCPLSettingsDidChangeNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)PLCPLSettingsObserver;
  -[PLCPLSettingsObserver dealloc](&v4, sel_dealloc);
}

- (PLCPLSettings)settings
{
  return (PLCPLSettings *)-[PLLazyObject objectValue](self->_lazySettings, "objectValue");
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  if (-[PLPhotoLibraryBundle isSystemPhotoLibrary](self->_libraryBundle, "isSystemPhotoLibrary"))
    return PLIsCloudPhotoLibraryEnabledForCurrentUser();
  -[PLCPLSettingsObserver settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (-[PLCPLSettingsObserver settings](self, "settings"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isAppLibrary"),
        v5,
        v6))
  {
    -[PLCPLSettingsObserver settings](self, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isICPLEnabled");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)setPrefetchMode:(int64_t)a3 error:(id *)a4
{
  _BOOL4 v5;

  v5 = +[PLCPLSettings setPrefetchMode:withLibraryBundle:error:](PLCPLSettings, "setPrefetchMode:withLibraryBundle:error:", a3, self->_libraryBundle, a4);
  if (v5)
    -[PLLazyObject resetObject](self->_lazySettings, "resetObject");
  return v5;
}

- (PLCPLSettingsObserverDelegate)delegate
{
  return (PLCPLSettingsObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lazySettings, 0);
  objc_storeStrong((id *)&self->_libraryBundle, 0);
}

id __47__PLCPLSettingsObserver_initWithLibraryBundle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[PLCPLSettings settingsWithLibraryBundle:](PLCPLSettings, "settingsWithLibraryBundle:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
