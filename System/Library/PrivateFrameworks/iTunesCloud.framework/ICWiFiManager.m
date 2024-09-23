@implementation ICWiFiManager

void __41__ICWiFiManager__getWiFiEnabledFromPrefs__block_invoke(uint64_t a1)
{
  const __CFBoolean *Value;
  const __CFBoolean *v3;
  CFTypeID v4;
  CFTypeID v5;

  Value = (const __CFBoolean *)SCPreferencesGetValue(*(SCPreferencesRef *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("AllowEnable"));
  if (Value)
  {
    v3 = Value;
    v4 = CFGetTypeID(Value);
    if (v4 == CFNumberGetTypeID() || (v5 = CFGetTypeID(v3), v5 == CFBooleanGetTypeID()))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFBooleanGetValue(v3) != 0;
  }
  SCPreferencesSynchronize(*(SCPreferencesRef *)(*(_QWORD *)(a1 + 32) + 8));
}

void __34__ICWiFiManager_sharedWiFiManager__block_invoke()
{
  ICWiFiManager *v0;
  void *v1;

  v0 = objc_alloc_init(ICWiFiManager);
  v1 = (void *)sharedWiFiManager_sharedWiFiManager;
  sharedWiFiManager_sharedWiFiManager = (uint64_t)v0;

}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  -[ICWiFiManager _wifiCallBack:](self, "_wifiCallBack:", 1);
}

- (ICWiFiManager)init
{
  ICWiFiManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  const __CFString *v5;
  const __SCPreferences *v6;
  const __SCPreferences *wifiPreferences;
  __CFRunLoop *Main;
  void *v9;
  ICWiFiManager *v10;
  SCPreferencesContext v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICWiFiManager;
  v2 = -[ICWiFiManager init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.amp.HomeSharing.HSWiFiManager.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = -[ICWiFiManager _processIdentifier](v2, "_processIdentifier");
    v6 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, CFSTR("com.apple.wifi.plist"));
    v2->_wifiPreferences = v6;
    v12.version = 0;
    memset(&v12.retain, 0, 24);
    v12.info = v2;
    SCPreferencesSetCallback(v6, (SCPreferencesCallBack)_WiFiCallBack, &v12);
    wifiPreferences = v2->_wifiPreferences;
    Main = CFRunLoopGetMain();
    SCPreferencesScheduleWithRunLoop(wifiPreferences, Main, (CFStringRef)*MEMORY[0x1E0C9B270]);
    v2->_wiFiEnabled = -[ICWiFiManager _getWiFiEnabledFromPrefs](v2, "_getWiFiEnabledFromPrefs");
    v2->_wiFiAssociated = 1;
    +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerObserver:", v2);

    v10 = v2;
  }

  return v2;
}

+ (id)sharedWiFiManager
{
  if (sharedWiFiManager_onceToken != -1)
    dispatch_once(&sharedWiFiManager_onceToken, &__block_literal_global_36624);
  return (id)sharedWiFiManager_sharedWiFiManager;
}

- (void)_wifiCallBack:(unsigned int)a3
{
  char v3;
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v3 = a3;
  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = -[ICWiFiManager _getWiFiEnabledFromPrefs](self, "_getWiFiEnabledFromPrefs");
  v6 = -[ICWiFiManager _getWiFiAssociated](self, "_getWiFiAssociated");
  if ((v3 & 1) != 0)
  {
    v7 = v6;
    if (v5 != -[ICWiFiManager isWiFiEnabled](self, "isWiFiEnabled")
      || v7 != -[ICWiFiManager isWiFiAssociated](self, "isWiFiAssociated"))
    {
      -[ICWiFiManager setWiFiEnabled:](self, "setWiFiEnabled:", v5);
      -[ICWiFiManager setWiFiAssociated:](self, "setWiFiAssociated:", v7);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICWiFiManager isWiFiEnabled](self, "isWiFiEnabled"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v8;
      v13[0] = CFSTR("ICWiFiManagerWiFiEnabledUserInfoKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICWiFiManager isWiFiAssociated](self, "isWiFiAssociated"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = v9;
      v13[1] = CFSTR("ICWiFiManagerWiFiAssociatedUserInfoKey");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("ICWiFiManagerWiFiDidChangeNotification"), self, v10);

    }
  }
}

- (BOOL)isWiFiEnabled
{
  return self->_wiFiEnabled;
}

- (BOOL)isWiFiAssociated
{
  return self->_wiFiAssociated;
}

- (BOOL)_getWiFiEnabledFromPrefs
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__ICWiFiManager__getWiFiEnabledFromPrefs__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_getWiFiAssociated
{
  void *v2;
  char v3;

  +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWiFiAssociated");

  return v3;
}

- (id)_processIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  const char *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = getprogname();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%s (%d)"), v5, getpid());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)dealloc
{
  __SCPreferences *wifiPreferences;
  __CFRunLoop *Main;
  objc_super v5;

  wifiPreferences = self->_wifiPreferences;
  Main = CFRunLoopGetMain();
  SCPreferencesUnscheduleFromRunLoop(wifiPreferences, Main, (CFStringRef)*MEMORY[0x1E0C9B270]);
  CFRelease(self->_wifiPreferences);
  v5.receiver = self;
  v5.super_class = (Class)ICWiFiManager;
  -[ICWiFiManager dealloc](&v5, sel_dealloc);
}

- (void)setWiFiEnabled:(BOOL)a3
{
  self->_wiFiEnabled = a3;
}

- (void)setWiFiAssociated:(BOOL)a3
{
  self->_wiFiAssociated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
