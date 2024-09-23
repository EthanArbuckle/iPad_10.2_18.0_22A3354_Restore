@implementation PLPhotosApplication

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    srandomdev();
    originalUncaughtExceptionHandler = (uint64_t (*)(_QWORD))NSGetUncaughtExceptionHandler();
    NSSetUncaughtExceptionHandler((NSUncaughtExceptionHandler *)myUncaughtExceptionHandler);
  }
}

- (void)applicationDidFinishLaunching:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  void *v6;
  void *v7;

  PLDebugEnableCoreDataMultithreadedAsserts();
  dispatch_get_global_queue(25, 0);
  pl_dispatch_async();
  if (MGGetBoolAnswer())
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "registerDefaults:", &unk_1E70C6840);
  PLSetShouldCacheIOSurfaces();
  CFPreferencesGetAppBooleanValue(CFSTR("LogJPEGDecodeTime"), CFSTR("com.apple.mobileslideshow"), 0);
  PLSetShouldLogImageDecodeTime();
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "_setRotationDisabledDuringTouch:", 1);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)photosPreferenceChanged, CFSTR("com.apple.mobileslideshow.PreferenceChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  _signal_nobind();
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__applicationWillEnterForeground_, *MEMORY[0x1E0CEB350], 0);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackground_, *MEMORY[0x1E0CEB288], 0);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActive_, *MEMORY[0x1E0CEB270], 0);
}

- (NSString)currentTestName
{
  return self->_currentTestName;
}

- (void)photosPreferencesChanged
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  -[PLPhotosDefaults reloadPhotoDefaultValues](+[PLPhotosDefaults sharedInstance](PLPhotosDefaults, "sharedInstance"), "reloadPhotoDefaultValues");
}

- (void)_applicationDidBecomeActive:(id)a3
{
  -[PLPhotosApplication _displayAndRemovePhoneInvitationFailures](self, "_displayAndRemovePhoneInvitationFailures", a3);
  -[PLPhotosApplication prepareForApplicationDidBecomeActive](self, "prepareForApplicationDidBecomeActive");
}

- (void)_applicationWillEnterForeground:(id)a3
{
  -[PLPhotosApplication _registerForPhotoStreamActivityNotifications](self, "_registerForPhotoStreamActivityNotifications", a3);
  -[PLPhotosApplication prepareForApplicationWillEnterForeground](self, "prepareForApplicationWillEnterForeground");
  objc_msgSend(MEMORY[0x1E0D719E0], "applicationIsInForeground:photoLibraryURL:", 1, objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL"));
  if ((_applicationWillEnterForeground__isInitialLaunch & 1) != 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary"), "clientApplicationWillEnterForeground");
  else
    _applicationWillEnterForeground__isInitialLaunch = 1;
}

uint64_t __53__PLPhotosApplication_applicationDidFinishLaunching___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D719E0], "sharedStreamsExplictlyDisabledForPhotoLibraryURL:", objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL"));
}

- (void)_registerForPhotoStreamActivityNotifications
{
  uint64_t v2;
  uint64_t v3;

  v3 = MEMORY[0x1E0C809B0];
  v2 = pl_notify_register_dispatch();
  if ((_DWORD)v2)
    NSLog(CFSTR("failed to register for Shared Photo Stream invitation failure activity notification: %u"), v2, v3, 3221225472, __67__PLPhotosApplication__registerForPhotoStreamActivityNotifications__block_invoke, &unk_1E70B5EB8, self);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  -[PLPhotosApplication _stopObservingReachabilityChanges](self, "_stopObservingReachabilityChanges");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);

  v4.receiver = self;
  v4.super_class = (Class)PLPhotosApplication;
  -[PLPhotosApplication dealloc](&v4, sel_dealloc);
}

- (BOOL)useCompatibleSuspensionAnimation
{
  return 1;
}

- (void)_applicationDidEnterBackground:(id)a3
{
  -[PLPhotosApplication setReceivingRemoteControlEvents:](self, "setReceivingRemoteControlEvents:", 0);
  -[PLPhotosApplication setStatusBarShowsProgress:](self, "setStatusBarShowsProgress:", 0);
  -[PLPhotosApplication _updateSuspensionSettings](self, "_updateSuspensionSettings");
  -[PLPhotosApplication _unregisterForPhotoStreamActivityNotifications](self, "_unregisterForPhotoStreamActivityNotifications");
  objc_msgSend(MEMORY[0x1E0D719E0], "applicationIsInForeground:photoLibraryURL:", 0, objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL"));
  objc_msgSend(MEMORY[0x1E0D71BA8], "userDidLeavePhotosApplication");
  -[PLPhotosApplication prepareForApplicationDidEnterBackground](self, "prepareForApplicationDidEnterBackground");
}

- (void)_updateSuspensionSettings
{
  id v3;

  if ((objc_msgSend(MEMORY[0x1E0CEA2F8], "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0CEB260], *MEMORY[0x1E0CEC3F0]);
    -[PLPhotosApplication updateSuspendedSettings:](self, "updateSuspendedSettings:", v3);

  }
}

- (void)setReceivingRemoteControlEvents:(BOOL)a3
{
  if (a3)
  {
    if (!self->_receivingRemoteControlEvents)
    {
      PLMRMediaRemoteSetNowPlayingApplicationOverrideEnabled(1);
      -[PLPhotosApplication beginReceivingRemoteControlEvents](self, "beginReceivingRemoteControlEvents");
      self->_receivingRemoteControlEvents = 1;
    }
  }
  else if (self->_receivingRemoteControlEvents)
  {
    self->_receivingRemoteControlEvents = 0;
    -[PLPhotosApplication endReceivingRemoteControlEvents](self, "endReceivingRemoteControlEvents");
    PLMRMediaRemoteSetNowPlayingApplicationOverrideEnabled(0);
  }
}

- (void)_networkReachabilityDidChange:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = (void *)objc_msgSend(a3, "userInfo");
  v6 = (void *)objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CFA308]);
  v7 = (void *)objc_msgSend(a3, "userInfo");
  self->_isReachable = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CFA300]), "BOOLValue");
  v8 = (*(_BYTE *)(objc_msgSend(v6, "bytes") + 2) & 4) == 0 && self->_isReachable;
  self->_isOnWifi = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_isReachable);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", self->_isOnWifi);
  v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v9, *MEMORY[0x1E0D71FF0], v10, *MEMORY[0x1E0D71FE8], 0);

  v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v12, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D71FE0], 0, v11);
}

- (void)_startObservingReachabilityChanges
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver"), "addObserver:selector:forHostname:", self, sel__networkReachabilityDidChange_, CFSTR("0.0.0.0"));
}

- (void)_stopObservingReachabilityChanges
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver"), "removeObserver:forHostname:", self, CFSTR("0.0.0.0"));
}

- (void)enableNetworkObservation
{
  int observeForRechabilityChanges;

  observeForRechabilityChanges = self->_observeForRechabilityChanges;
  self->_observeForRechabilityChanges = observeForRechabilityChanges + 1;
  if (!observeForRechabilityChanges)
    -[PLPhotosApplication _startObservingReachabilityChanges](self, "_startObservingReachabilityChanges");
}

- (void)disableNetworkObservation
{
  int v2;

  v2 = self->_observeForRechabilityChanges - 1;
  self->_observeForRechabilityChanges = v2;
  if (!v2)
    -[PLPhotosApplication _stopObservingReachabilityChanges](self, "_stopObservingReachabilityChanges");
}

- (void)_unregisterForPhotoStreamActivityNotifications
{
  uint64_t v2;

  v2 = notify_cancel(self->_sharedPhotoStreamInvitationFailureToken);
  if ((_DWORD)v2)
    NSLog(CFSTR("notify_cancel() failed for Shared Photo Stream invitation failure activity notification. (%d)"), v2);
}

- (BOOL)isReachable
{
  return self->_isReachable;
}

- (BOOL)isOnWifi
{
  return self->_isOnWifi;
}

- (void)setCurrentTestName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 504);
}

- (NSDictionary)currentTestOptions
{
  return self->_currentTestOptions;
}

- (void)setCurrentTestOptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 512);
}

- (NSSet)notificationSuppressionContexts
{
  return self->_notificationSuppressionContexts;
}

- (void)setNotificationSuppressionContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

uint64_t __67__PLPhotosApplication__registerForPhotoStreamActivityNotifications__block_invoke()
{
  dispatch_time(0, 10000000000);
  return pl_dispatch_after();
}

uint64_t __67__PLPhotosApplication__registerForPhotoStreamActivityNotifications__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayAndRemovePhoneInvitationFailures");
}

@end
