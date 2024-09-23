@implementation VUIJSDevice

- (BOOL)isVisionOS
{
  return 0;
}

- (BOOL)supportsSharedWatchPostPlayBinge
{
  return 1;
}

- (BOOL)nativeDisplaysPlaybackModePrompt
{
  return 1;
}

- (VUIJSDevice)initWithAppContext:(id)a3
{
  id v4;
  VUIJSDevice *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id networkPropertiesChangedToken;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIJSDevice;
  v5 = -[VUIJSObject initWithAppContext:](&v14, sel_initWithAppContext_, v4);
  if (v5)
  {
    objc_initWeak(&location, v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUINetworkUtilities sharedInstance](VUINetworkUtilities, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __34__VUIJSDevice_initWithAppContext___block_invoke;
    v11[3] = &unk_1E9FA2F20;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", CFSTR("VUINetworkPropertiesChangedNotification"), v7, 0, v11);
    v8 = objc_claimAutoreleasedReturnValue();
    networkPropertiesChangedToken = v5->_networkPropertiesChangedToken;
    v5->_networkPropertiesChangedToken = (id)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (NSString)systemVersion
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0DC69D0], "systemVersion");
}

- (BOOL)runningAnInternalBuild
{
  return objc_msgSend(MEMORY[0x1E0DC69B0], "runningAnInternalBuild");
}

- (NSString)osBuildNumber
{
  return (NSString *)CFSTR("unknown");
}

- (NSString)model
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0DC69D0], "model");
}

- (BOOL)isInRetailDemoMode
{
  return +[VUIUtilities isInRetailDemoMode](VUIUtilities, "isInRetailDemoMode");
}

- (NSString)productType
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "getMobileGestaltString:", CFSTR("ProductType"));
}

+ (id)getMobileGestaltString:(__CFString *)a3
{
  const void *v3;
  const void *v4;
  CFTypeID v5;
  void *v6;

  v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void __34__VUIJSDevice_initWithAppContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __34__VUIJSDevice_initWithAppContext___block_invoke_2;
    v9[3] = &unk_1E9F9CBA8;
    objc_copyWeak(&v11, v4);
    v8 = v6;
    v10 = v8;
    objc_msgSend(v7, "evaluate:", v9);

    objc_destroyWeak(&v11);
  }

}

void __34__VUIJSDevice_initWithAppContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(WeakRetained, "invokeMethod:withArguments:", CFSTR("onNetworkChange"), v3);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_networkPropertiesChangedToken);

  v4.receiver = self;
  v4.super_class = (Class)VUIJSDevice;
  -[VUIJSDevice dealloc](&v4, sel_dealloc);
}

- (NSString)appVersion
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("CFBundleVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)appIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isNetworkReachable
{
  void *v2;
  char v3;

  +[VUINetworkUtilities sharedInstance](VUINetworkUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkReachable");

  return v3;
}

- (BOOL)isInAirplaneMode
{
  void *v2;
  char v3;

  +[VUINetworkUtilities sharedInstance](VUINetworkUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAirplaneModeEnabled");

  return v3;
}

- (NSString)networkType
{
  void *v2;
  void *v3;

  +[VUINetworkUtilities sharedInstance](VUINetworkUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "networkType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isSeedBuild
{
  return 0;
}

+ (BOOL)isSearchEnabled
{
  return WLKIsNLSBubbleTipEnabledInCache();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_networkPropertiesChangedToken, 0);
}

@end
