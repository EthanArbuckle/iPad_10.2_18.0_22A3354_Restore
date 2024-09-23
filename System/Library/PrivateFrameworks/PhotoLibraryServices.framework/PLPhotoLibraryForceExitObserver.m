@implementation PLPhotoLibraryForceExitObserver

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_998);
  return (id)sharedInstance_observer;
}

void __49__PLPhotoLibraryForceExitObserver_sharedInstance__block_invoke()
{
  PLPhotoLibraryForceExitObserver *v0;
  void *v1;

  v0 = objc_alloc_init(PLPhotoLibraryForceExitObserver);
  v1 = (void *)sharedInstance_observer;
  sharedInstance_observer = (uint64_t)v0;

}

- (PLPhotoLibraryForceExitObserver)init
{
  PLPhotoLibraryForceExitObserver *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLPhotoLibraryForceExitObserver;
  v2 = -[PLPhotoLibraryForceExitObserver init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_photoLibraryCorruptNotification, (CFStringRef)PLPhotoLibraryCorruptNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_photoLibraryForceClientExitNotification, (CFStringRef)PLPhotoLibraryForceClientExitNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)PLPhotoLibraryForceExitObserver;
  -[PLPhotoLibraryForceExitObserver dealloc](&v4, sel_dealloc);
}

- (void)_photoLibraryCorruptNotification
{
  NSObject *v2;
  uint8_t v3[16];

  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Exiting because another process detected a corrupt database.", v3, 2u);
  }

  exit(0);
}

- (void)_photoLibraryForceClientExitNotification
{
  int v2;
  const __CFString *v3;
  char v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!PLIsRunningInStoreDemoMode())
    goto LABEL_14;
  v2 = PLIsSpringboard();
  if (v2)
    v3 = CFSTR("for SpringBoard in Store Demo Mode to avoid a possible crash loop");
  else
    v3 = 0;
  v4 = PLIsInternalTool();
  v5 = PLIsDemod();
  if ((v4 & 1) != 0)
  {
    if (!v5)
    {
      v3 = CFSTR("for internal tool in Store Demo Mode to avoid unnecessary crash");
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if ((v5 & 1) != 0)
  {
LABEL_9:
    v3 = CFSTR("for demod in Store Demo Mode to avoid unnecessary crash");
    goto LABEL_11;
  }
  if (!v2)
  {
LABEL_14:
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Exiting because another process requested a FORCE CLIENT EXIT.  Everything is behaving as it should and you don't need to file a radar about this.\n\nThis is usually initiated by: plphotosctl rebuilddb.", (uint8_t *)&v8, 2u);
    }

    exit(0);
  }
LABEL_11:
  PLBackendGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543362;
    v9 = v3;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Ignoring simulated FORCE CLIENT EXIT %{public}@.", (uint8_t *)&v8, 0xCu);
  }

}

@end
