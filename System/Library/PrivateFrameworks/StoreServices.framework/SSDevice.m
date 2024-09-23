@implementation SSDevice

- (BOOL)_getDeviceType:(unsigned int *)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  int v16;
  id v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  int *v32;
  uint64_t v33;
  uint64_t v35;
  _QWORD v36[3];
  _QWORD v37[3];
  int v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MGCopyAnswer();
  v6 = (void *)MGCopyAnswer();
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("SSDeviceType"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("hardwareModel")),
        v10 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("buildVersion")),
        v11 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("deviceTypeNumber")),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v9, "isEqualToString:", v5)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v10, "isEqualToString:", v6)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = objc_msgSend(v11, "intValue");
    v13 = 0;
    v14 = 1;
  }
  else
  {
    v35 = 0;
    CjHbHx((uint64_t)&v35 + 4, (uint64_t)&v35);
    v14 = v15 == 0;
    if (v15)
    {
      v16 = v15;
      v17 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v17)
        v17 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v18 = objc_msgSend(v17, "shouldLog");
      if (objc_msgSend(v17, "shouldLogToDisk"))
        v18 |= 2u;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v17, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v18 &= 2u;
      if (v18)
      {
        v19 = objc_opt_class();
        v20 = v16;
        v38 = 138412546;
        v39 = v19;
        v40 = 2048;
        v41 = v16;
        LODWORD(v33) = 22;
        v32 = &v38;
        v21 = _os_log_send_and_compose_impl();
        if (v21)
        {
          v22 = (void *)v21;
          v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v21, 4, &v38, v33);
          free(v22);
          SSFileLog(v17, CFSTR("%@"), v24, v25, v26, v27, v28, v29, v23);
        }
      }
      else
      {
        v20 = v16;
      }
      v13 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v20, 0, v32);
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("SSDeviceType"));
      objc_msgSend(v7, "synchronize");
      v12 = 0;
    }
    else
    {
      v36[0] = CFSTR("hardwareModel");
      v36[1] = CFSTR("buildVersion");
      v37[0] = v5;
      v37[1] = v6;
      v36[2] = CFSTR("deviceTypeNumber");
      v37[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v35));
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3), CFSTR("SSDeviceType"));
      objc_msgSend(v7, "synchronize");
      v13 = 0;
      v12 = HIDWORD(v35);
    }
  }

  if (a3 && v14)
    *a3 = v12;
  if (a4)
    v30 = v14;
  else
    v30 = 1;
  if ((v30 & 1) == 0)
    *a4 = v13;
  return v14;
}

- (id)_userAgentClientNameForBundleID:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.AppStore")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.AppStore2")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.AppStore3")) & 1) != 0)
  {
    return CFSTR("AppStore");
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.MobileStore")) & 1) != 0)
    return CFSTR("MobileStore");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.itunesstored")) & 1) != 0)
    return CFSTR("itunesstored");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.Music")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.Music.")) & 1) != 0)
  {
    return CFSTR("Music");
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.lowtide")) & 1) != 0)
    return CFSTR("AppleTV");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.ios.StoreKitUIService")) & 1) != 0)
    return CFSTR("StoreKitUIService");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.iBooks")) & 1) != 0)
    return CFSTR("iBooks");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.itunesu")) & 1) != 0)
    return CFSTR("iTunesU");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.podcasts")) & 1) != 0)
    return CFSTR("Podcasts");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.Maps")) & 1) != 0)
    return CFSTR("Maps");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.Bridge")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.AppStore.BridgeStoreExtension")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.AppStore3.BridgeStoreExtension")) & 1) != 0)
  {
    return CFSTR("Watch");
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.Music.MediaSocialShareService")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.Music.MediaPicker")) & 1) != 0)
  {
    return CFSTR("Music");
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.WelcomeKit")) & 1) != 0)
    return CFSTR("matd");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.AppStore.MessagesStoreExtension")) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.AppStore3.MessagesStoreExtension")))
  {
    return CFSTR("Messages");
  }
  return 0;
}

- (id)_newModernUserAgentWithClientName:(id)a3 version:(id)a4 isCachable:(BOOL *)a5
{
  void *v7;
  id v8;
  const __CFString *v9;
  id v10;
  id v11;
  CFPropertyListRef v12;
  id v13;
  void *v14;
  id v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  id v19;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@/%@"), a3, a4);
  v8 = -[SSDevice _productVersion](self, "_productVersion");
  if (objc_msgSend(v8, "length"))
  {
    if (MGGetSInt32Answer() == 6)
      v9 = CFSTR(" watchOS/%@");
    else
      v9 = CFSTR(" iOS/%@");
    objc_msgSend(v7, "appendFormat:", v9, v8);
  }
  if (MGGetSInt32Answer() == 4)
  {
    v10 = -[SSDevice _appleTVProductVersion](self, "_appleTVProductVersion");
    if (objc_msgSend(v10, "length"))
      objc_msgSend(v7, "appendFormat:", CFSTR(" AppleTV/%@"), v10);
  }
  v11 = (id)MGCopyAnswer();
  v12 = (id)CFPreferencesCopyAppValue(CFSTR("OverrideProductType"), CFSTR("com.apple.itunesstored"));
  if (v12)
    v11 = (id)v12;
  if (objc_msgSend(v11, "length"))
    objc_msgSend(v7, "appendFormat:", CFSTR(" model/%@"), v11);
  v13 = (id)MGCopyAnswer();
  if (objc_msgSend(v13, "length"))
    objc_msgSend(v7, "appendFormat:", CFSTR(" hwp/%@"), v13);
  v14 = (void *)MGCopyAnswer();
  if (objc_msgSend(v14, "length"))
    objc_msgSend(v7, "appendFormat:", CFSTR(" build/%@"), v14);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = -[SSDevice _deviceType](self, "_deviceType");
  v17 = 0;
  v18 = &qword_1E47BBE40;
  while (*(v18 - 2) != v16)
  {
    ++v17;
    v18 += 3;
    if (v17 == 27)
      goto LABEL_23;
  }
  if (((0x20201uLL >> v17) & 1) == 0)
    objc_msgSend(v15, "addObject:", *v18);
LABEL_23:
  v19 = -[SSDevice _fairPlayDeviceTypeString](self, "_fairPlayDeviceTypeString");
  if (v19)
    objc_msgSend(v15, "addObject:", v19);
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v7, "appendFormat:", CFSTR(" (%@)"), objc_msgSend(v15, "componentsJoinedByString:", CFSTR("; ")));

  if (a5)
    *a5 = v19 != 0;
  return v7;
}

- (id)_productVersion
{
  id result;
  void *v4;

  result = self->_productVersion;
  if (!result)
  {
    v4 = (void *)_CFCopySystemVersionDictionary();
    self->_productVersion = (NSString *)(id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C9ABB0]);

    return self->_productVersion;
  }
  return result;
}

- (id)_fairPlayDeviceTypeString
{
  _BOOL4 v2;
  id result;
  unsigned int v4;

  v4 = 0;
  v2 = -[SSDevice _getDeviceType:error:](self, "_getDeviceType:error:", &v4, 0);
  result = 0;
  if (v2)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dt:%lu"), v4);
  return result;
}

- (int64_t)_deviceType
{
  int64_t result;
  NSString *v4;

  if (self->_productType)
    return self->_deviceType;
  v4 = -[SSDevice _copyProductType](self, "_copyProductType");
  self->_productType = v4;
  result = -[SSDevice _deviceTypeForProductType:](self, "_deviceTypeForProductType:", v4);
  self->_deviceType = result;
  return result;
}

+ (BOOL)deviceIsInternalBuild
{
  return MGGetBoolAnswer();
}

- (id)userAgentWithBundleRef:(__CFBundle *)a3 isCachable:(BOOL *)a4
{
  CFDictionaryRef InfoDictionary;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  InfoDictionary = CFBundleGetInfoDictionary(a3);
  v7 = -[SSDevice _userAgentClientNameForInfoPlist:](self, "_userAgentClientNameForInfoPlist:", InfoDictionary);
  if (v7)
    v8 = v7;
  else
    v8 = CFSTR("itunesstored");
  v9 = -[SSDevice _userAgentClientVersionForInfoPlist:clientName:](self, "_userAgentClientVersionForInfoPlist:clientName:", InfoDictionary, v8);
  if (v9)
    v10 = v9;
  else
    v10 = CFSTR("1.0");
  return -[SSDevice _newModernUserAgentWithClientName:version:isCachable:](self, "_newModernUserAgentWithClientName:version:isCachable:", v8, v10, a4);
}

- (id)_userAgentClientVersionForInfoPlist:(id)a3 clientName:(id)a4
{
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = *MEMORY[0x1E0C9AAF0];
  v7 = (const __CFString *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C9AAF0]);
  if (!v7)
    v7 = (const __CFString *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C9AE90]);
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("Music")))
  {
    v8 = (void *)CFPreferencesCopyAppValue(CFSTR("UseNewMusicApp2"), CFSTR("com.apple.mobileipod"));
    v9 = v8;
    if (v8 && !objc_msgSend(v8, "BOOLValue"))
      v7 = CFSTR("2.0");

  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("TVMusic"))
    && CFPreferencesGetAppBooleanValue(CFSTR("UseNewMusicApp"), CFSTR("com.apple.TVMusic"), 0))
  {
    v7 = CFSTR("10.0");
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("Messages"))
    && (v10 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/Messages/iMessageBalloons/ASMessagesProvider.bundle")), "infoDictionary")) != 0)
  {
    return (id)objc_msgSend(v10, "objectForKey:", v6);
  }
  else
  {
    return (id)v7;
  }
}

- (id)_userAgentClientNameForInfoPlist:(id)a3
{
  void *v5;
  id result;

  v5 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C9AE78]);
  if (MGGetSInt32Answer() == 4)
  {
    result = -[SSDevice _userAgentClientNameForAppleTVBundleID:](self, "_userAgentClientNameForAppleTVBundleID:", v5);
    if (result)
      return result;
  }
  else
  {
    result = -[SSDevice _userAgentClientNameForBundleID:](self, "_userAgentClientNameForBundleID:", v5);
    if (result)
      return result;
  }
  result = v5;
  if (!v5)
    return (id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C9AE70]);
  return result;
}

SSDevice *__25__SSDevice_currentDevice__block_invoke()
{
  SSDevice *result;

  result = objc_alloc_init(SSDevice);
  currentDevice_sCurrentDevice = (uint64_t)result;
  return result;
}

- (SSDevice)init
{
  SSDevice *v2;
  SSDevice *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSDevice;
  v2 = -[SSDevice init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_biometricStyle = 0;
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.storeservices.SSDevice", 0);
    v3->_keyValueStore = objc_alloc_init(SSKeyValueStore);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__SoftwareCUIDChangedNotification, CFSTR("com.apple.StoreServices.SoftwareCUIDChanged"), 0, CFNotificationSuspensionBehaviorCoalesce);
    if ((SSIsDaemon() & 1) == 0)
    {
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__AutoDownloadsChangedNotification, CFSTR("com.apple.itunesstored.autodownloadschanged"), 0, CFNotificationSuspensionBehaviorCoalesce);
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__CellularNetworkingChangedNotification, CFSTR("com.apple.itunesstored.autodownloaddefaultschange"), 0, CFNotificationSuspensionBehaviorCoalesce);
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__StoreFrontChangedNotification, CFSTR("com.apple.StoreServices.StorefrontChanged"), 0, CFNotificationSuspensionBehaviorCoalesce);
    }
  }
  return v3;
}

- (NSString)productVersion
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__SSDevice_productVersion__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

SSPromise *__39__SSDevice_storeFrontIdentifierPromise__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "storeFrontIdentifier");
  if (v2)
    return +[SSPromise promiseWithResult:](SSPromise, "promiseWithResult:", v2);
  else
    return +[SSPromise promiseWithError:](SSPromise, "promiseWithError:", SSError((uint64_t)CFSTR("SSErrorDomain"), 106, (uint64_t)CFSTR("Missing Storefront Identifier"), (uint64_t)CFSTR("The local account doesn't have a storefront identifier.")));
}

+ (id)currentDevice
{
  if (currentDevice_sInstanceGuard != -1)
    dispatch_once(&currentDevice_sInstanceGuard, &__block_literal_global_40);
  return (id)currentDevice_sCurrentDevice;
}

- (NSString)storeFrontIdentifier
{
  return (NSString *)-[SSPromise resultWithError:](-[SSDevice storeFrontIdentifierPromise](self, "storeFrontIdentifierPromise"), "resultWithError:", 0);
}

- (SSPromise)storeFrontIdentifierPromise
{
  return (SSPromise *)objc_msgSend((id)objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "localAccount"), "thenWithBlock:", &__block_literal_global_70);
}

id __26__SSDevice_productVersion__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_productVersion");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  IONotificationPort *batteryMonitorPort;
  io_object_t batteryMonitorNotification;
  objc_super v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.itunesstored.autodownloadschanged"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.itunesstored.autodownloaddefaultschange"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.StoreServices.SoftwareCUIDChanged"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.StoreServices.StorefrontChanged"), 0);
  notify_cancel(self->_pluggedInToken);
  batteryMonitorPort = self->_batteryMonitorPort;
  if (batteryMonitorPort)
  {
    IONotificationPortDestroy(batteryMonitorPort);
    self->_batteryMonitorPort = 0;
  }
  batteryMonitorNotification = self->_batteryMonitorNotification;
  if (batteryMonitorNotification)
  {
    IOObjectRelease(batteryMonitorNotification);
    self->_batteryMonitorNotification = 0;
  }
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v6.receiver = self;
  v6.super_class = (Class)SSDevice;
  -[SSDevice dealloc](&v6, sel_dealloc);
}

- (NSString)clientVersion
{
  NSObject *dispatchQueue;
  const __CFString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__SSDevice_clientVersion__block_invoke;
  v5[3] = &unk_1E47BBA20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  if (objc_msgSend((id)v7[5], "length"))
  {
    v3 = (const __CFString *)v7[5];
  }
  else
  {
    v3 = CFSTR("1.0");
    v7[5] = (uint64_t)CFSTR("1.0");
  }
  _Block_object_dispose(&v6, 8);
  return &v3->isa;
}

uint64_t __25__SSDevice_clientVersion__block_invoke(uint64_t a1)
{
  __CFBundle *MainBundle;
  CFDictionaryRef InfoDictionary;
  uint64_t result;

  MainBundle = CFBundleGetMainBundle();
  InfoDictionary = CFBundleGetInfoDictionary(MainBundle);
  result = objc_msgSend(*(id *)(a1 + 32), "_userAgentClientVersionForInfoPlist:clientName:", InfoDictionary, objc_msgSend(*(id *)(a1 + 32), "_userAgentClientNameForInfoPlist:", InfoDictionary));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)clientName
{
  NSString *result;
  NSObject *dispatchQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  result = self->_clientName;
  if (!result)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3052000000;
    v9 = __Block_byref_object_copy__22;
    v10 = __Block_byref_object_dispose__22;
    v11 = 0;
    dispatchQueue = self->_dispatchQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __22__SSDevice_clientName__block_invoke;
    v5[3] = &unk_1E47B8DF8;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(dispatchQueue, v5);
    self->_clientName = (NSString *)objc_msgSend((id)v7[5], "copy");
    _Block_object_dispose(&v6, 8);
    return self->_clientName;
  }
  return result;
}

uint64_t __22__SSDevice_clientName__block_invoke(uint64_t a1)
{
  __CFBundle *MainBundle;
  uint64_t result;

  MainBundle = CFBundleGetMainBundle();
  result = objc_msgSend(*(id *)(a1 + 32), "_userAgentClientNameForInfoPlist:", CFBundleGetInfoDictionary(MainBundle));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSSet)automaticDownloadKinds
{
  id v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *dispatchQueue;
  NSSet *v17;
  uint64_t v19;
  _QWORD block[6];
  __int128 v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (MGGetBoolAnswer() && _os_feature_enabled_impl())
  {
    v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v3)
      v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v6 = v5;
    else
      v6 = v5 & 2;
    if (v6)
    {
      LODWORD(v21) = 136446210;
      *(_QWORD *)((char *)&v21 + 4) = "-[SSDevice automaticDownloadKinds]";
      LODWORD(v19) = 12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v21, v19);
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  *(_QWORD *)&v21 = 0;
  *((_QWORD *)&v21 + 1) = &v21;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__22;
  v24 = __Block_byref_object_dispose__22;
  v25 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SSDevice_automaticDownloadKinds__block_invoke;
  block[3] = &unk_1E47BBA20;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync(dispatchQueue, block);
  v17 = (NSSet *)*(id *)(*((_QWORD *)&v21 + 1) + 40);
  _Block_object_dispose(&v21, 8);
  return v17;
}

uint64_t __34__SSDevice_automaticDownloadKinds__block_invoke(uint64_t a1)
{
  void *v2;
  xpc_object_t v3;
  SSXPCConnection *v4;
  uint64_t result;
  _QWORD v6[5];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "0", 74);
    v4 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__SSDevice_automaticDownloadKinds__block_invoke_2;
    v6[3] = &unk_1E47BBC08;
    v6[4] = *(_QWORD *)(a1 + 32);
    -[SSXPCConnection sendSynchronousMessage:withReply:](v4, "sendSynchronousMessage:withReply:", v3, v6);

    xpc_release(v3);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  result = objc_msgSend(v2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __34__SSDevice_automaticDownloadKinds__block_invoke_2(uint64_t a1, void *a2)
{
  CFArrayRef v4;
  CFArrayRef v5;
  CFArrayRef v6;

  if (a2 && MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
  {
    objc_opt_class();
    v4 = SSXPCDictionaryCopyCFObjectWithClass(a2, "0");
    v5 = v4;
    if (v4)
    {
      v6 = v4;
      v4 = (CFArrayRef)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);
      v5 = v6;
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v4;

  }
}

- (NSString)cloudMediaLibraryIdentifier
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__SSDevice_cloudMediaLibraryIdentifier__block_invoke;
  v5[3] = &unk_1E47BBA20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __39__SSDevice_cloudMediaLibraryIdentifier__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  id result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (id)v2[4];
  if (!v3)
  {
    objc_msgSend(v2, "_cacheKeyValueStoreValues");
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  }
  result = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if (v3 != result)
  {
    result = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (id)copyStoreFrontRequestHeaders
{
  id result;

  result = -[SSDevice storeFrontIdentifier](self, "storeFrontIdentifier");
  if (result)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", result, CFSTR("X-Apple-Store-Front"), 0);
  return result;
}

- (unsigned)deviceTypeIdentifier
{
  unsigned int v3;

  v3 = 0;
  if (-[SSDevice _getDeviceType:error:](self, "_getDeviceType:error:", &v3, 0))
    return v3;
  else
    return 0;
}

- (void)getAvailableItemKindsWithBlock:(id)a3
{
  uint64_t v4;
  id v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  xpc_object_t v18;
  SSXPCConnection *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[6];
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("block is nil"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
  v4 = objc_msgSend((id)objc_opt_class(), "copyCachedAvailableItemKinds");
  if (v4)
  {
    v21 = (id)v4;
    (*((void (**)(id))a3 + 2))(a3);

  }
  else
  {
    if (MGGetBoolAnswer() && _os_feature_enabled_impl())
    {
      v5 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v5)
        v5 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = objc_msgSend(v5, "shouldLog");
      if (objc_msgSend(v5, "shouldLogToDisk"))
        v7 = v6 | 2;
      else
        v7 = v6;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v8 = v7;
      else
        v8 = v7 & 2;
      if (v8)
      {
        v23 = 136446210;
        v24 = "-[SSDevice getAvailableItemKindsWithBlock:]";
        LODWORD(v20) = 12;
        v9 = _os_log_send_and_compose_impl();
        if (v9)
        {
          v10 = (void *)v9;
          v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v23, v20);
          free(v10);
          SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
        }
      }
    }
    v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v18, "0", 68);
    v19 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __43__SSDevice_getAvailableItemKindsWithBlock___block_invoke;
    v22[3] = &unk_1E47B8EE0;
    v22[4] = v19;
    v22[5] = a3;
    -[SSXPCConnection sendMessage:withReply:](v19, "sendMessage:withReply:", v18, v22);
    xpc_release(v18);
  }
}

void __43__SSDevice_getAvailableItemKindsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *global_queue;
  uint64_t v8;
  CFArrayRef v9;
  _QWORD block[7];

  if (a2 == (void *)MEMORY[0x1E0C81258])
  {
    v4 = 121;
  }
  else
  {
    if (a2 && MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
    {
      objc_opt_class();
      v9 = SSXPCDictionaryCopyCFObjectWithClass(a2, "1");
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      if (v9)
        v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v9);
      else
        v6 = 0;

      goto LABEL_7;
    }
    v4 = 111;
  }
  v5 = (uint64_t)(id)SSError((uint64_t)CFSTR("SSErrorDomain"), v4, 0, 0);
  v6 = 0;
LABEL_7:
  if (!(v5 | v6))
    v5 = (uint64_t)(id)SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SSDevice_getAvailableItemKindsWithBlock___block_invoke_2;
  block[3] = &unk_1E47B9E60;
  v8 = *(_QWORD *)(a1 + 40);
  block[5] = v5;
  block[6] = v8;
  block[4] = v6;
  dispatch_async(global_queue, block);

}

uint64_t __43__SSDevice_getAvailableItemKindsWithBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getCellularNetworkingAllowedWithBlock:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t v17;
  SSXPCConnection *v18;
  uint64_t v19;
  _QWORD v20[6];
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (MGGetBoolAnswer() && _os_feature_enabled_impl())
  {
    v4 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v4)
      v4 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v7 = v6;
    else
      v7 = v6 & 2;
    if (v7)
    {
      v21 = 136446210;
      v22 = "-[SSDevice getCellularNetworkingAllowedWithBlock:]";
      LODWORD(v19) = 12;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v21, v19);
        free(v9);
        SSFileLog(v4, CFSTR("%@"), v11, v12, v13, v14, v15, v16, v10);
      }
    }
  }
  v17 = SSXPCCreateMessageDictionary(87);
  v18 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__SSDevice_getCellularNetworkingAllowedWithBlock___block_invoke;
  v20[3] = &unk_1E47B8EE0;
  v20[4] = v18;
  v20[5] = a3;
  -[SSXPCConnection sendMessage:withReply:](v18, "sendMessage:withReply:", v17, v20);
  xpc_release(v17);
}

void __50__SSDevice_getCellularNetworkingAllowedWithBlock___block_invoke(uint64_t a1, void *a2)
{
  if (MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
    xpc_dictionary_get_BOOL(a2, "1");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)loadStoreFrontWithCompletionHandler:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v6[6];

  if (-[NSString length](-[SSDevice storeFrontIdentifier](self, "storeFrontIdentifier"), "length"))
  {
    if (a3)
      (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__SSDevice_loadStoreFrontWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E47BBC58;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(dispatchQueue, v6);
  }
}

uint64_t __48__SSDevice_loadStoreFrontWithCompletionHandler___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  void *v3;
  SSURLBagContext *v4;
  uint64_t v5;
  _QWORD v7[6];

  v2 = dispatch_queue_create("com.apple.StoreServices.SSDevice.completion", 0);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  if (!v3)
  {
    v4 = objc_alloc_init(SSURLBagContext);
    -[SSURLBagContext setBagType:](v4, "setBagType:", 0);
    -[SSURLBagContext setIgnoresCaches:](v4, "setIgnoresCaches:", 1);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = -[SSURLBag initWithURLBagContext:]([SSURLBag alloc], "initWithURLBagContext:", v4);

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SSDevice_loadStoreFrontWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E47BBC30;
  v5 = *(_QWORD *)(a1 + 40);
  v7[4] = v2;
  v7[5] = v5;
  return objc_msgSend(v3, "loadWithCompletionBlock:", v7);
}

void __48__SSDevice_loadStoreFrontWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__SSDevice_loadStoreFrontWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E47B8EB8;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = a3;
  v6[5] = v5;
  dispatch_async(v4, v6);
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

uint64_t __48__SSDevice_loadStoreFrontWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)sdk_loadStorefrontCountryCode:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t v17;
  SSXPCConnection *v18;
  uint64_t v19;
  _QWORD v20[6];
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (MGGetBoolAnswer() && _os_feature_enabled_impl())
  {
    v4 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v4)
      v4 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v7 = v6;
    else
      v7 = v6 & 2;
    if (v7)
    {
      v21 = 136446210;
      v22 = "-[SSDevice sdk_loadStorefrontCountryCode:]";
      LODWORD(v19) = 12;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v21, v19);
        free(v9);
        SSFileLog(v4, CFSTR("%@"), v11, v12, v13, v14, v15, v16, v10);
      }
    }
  }
  v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v17, "0", 173);
  v18 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __42__SSDevice_sdk_loadStorefrontCountryCode___block_invoke;
  v20[3] = &unk_1E47B8EE0;
  v20[4] = v18;
  v20[5] = a3;
  -[SSXPCConnection sendMessage:withReply:](v18, "sendMessage:withReply:", v17, v20);
  xpc_release(v17);
}

void __42__SSDevice_sdk_loadStorefrontCountryCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  CFArrayRef v6;
  NSObject *global_queue;
  uint64_t v8;
  _QWORD block[7];

  if (a2 == (void *)MEMORY[0x1E0C81258])
  {
    v4 = 121;
    goto LABEL_6;
  }
  if (!a2 || MEMORY[0x1A85863E4](a2) != MEMORY[0x1E0C812F8])
  {
    v4 = 111;
LABEL_6:
    v5 = (uint64_t)(id)SSError((uint64_t)CFSTR("SSErrorDomain"), v4, 0, 0);
    v6 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  v6 = SSXPCDictionaryCopyCFObjectWithClass(a2, "1");
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
LABEL_7:
  if (!(v5 | (unint64_t)v6))
    v5 = (uint64_t)(id)SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SSDevice_sdk_loadStorefrontCountryCode___block_invoke_2;
  block[3] = &unk_1E47B9E60;
  v8 = *(_QWORD *)(a1 + 40);
  block[5] = v5;
  block[6] = v8;
  block[4] = v6;
  dispatch_async(global_queue, block);

}

uint64_t __42__SSDevice_sdk_loadStorefrontCountryCode___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)sdk_loadStoreFrontIdentifier:(id)a3
{
  NSObject *dispatchQueue;
  uint64_t v6;
  id v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SSURLBagContext *v21;
  xpc_object_t v22;
  uint64_t v23;
  _QWORD v24[5];
  SSXPCConnection *v25;
  id v26;
  _QWORD block[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;
  int v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__22;
  v32 = __Block_byref_object_dispose__22;
  v33 = 0;
  dispatchQueue = self->_dispatchQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke;
  block[3] = &unk_1E47B8DF8;
  block[4] = self;
  block[5] = &v28;
  dispatch_sync(dispatchQueue, block);
  if (objc_msgSend((id)v29[5], "length"))
  {
    if (a3)
      (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, v29[5], 0);
  }
  else
  {
    if (MGGetBoolAnswer() && _os_feature_enabled_impl())
    {
      v7 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v7)
        v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = objc_msgSend(v7, "shouldLog");
      v9 = objc_msgSend(v7, "shouldLogToDisk");
      v10 = objc_msgSend(v7, "OSLogObject");
      if (v9)
        v8 |= 2u;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        v11 = v8;
      else
        v11 = v8 & 2;
      if (v11)
      {
        v34 = 136446210;
        v35 = "-[SSDevice sdk_loadStoreFrontIdentifier:]";
        LODWORD(v23) = 12;
        v12 = _os_log_send_and_compose_impl();
        if (v12)
        {
          v13 = (void *)v12;
          v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v34, v23);
          free(v13);
          SSFileLog(v7, CFSTR("%@"), v15, v16, v17, v18, v19, v20, v14);
        }
      }
    }
    v21 = objc_alloc_init(SSURLBagContext);
    -[SSURLBagContext setBagType:](v21, "setBagType:", 0);
    -[SSURLBagContext setIgnoresCaches:](v21, "setIgnoresCaches:", 1);
    v22 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v22, "0", 174);
    SSXPCDictionarySetCFObject(v22, "1", (__CFString *)v21);

    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke_65;
    v24[3] = &unk_1E47BBC80;
    v25 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    v26 = a3;
    v24[4] = self;
    -[SSXPCConnection sendMessage:withReply:](v25, "sendMessage:withReply:", v22, v24);
    xpc_release(v22);
  }

  _Block_object_dispose(&v28, 8);
}

uint64_t __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke_65(uint64_t a1, void *a2)
{
  void *v2;
  CFArrayRef v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *global_queue;
  _QWORD v10[7];
  _QWORD block[6];

  v2 = a2;
  if (a2)
  {
    if (MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
    {
      v4 = SSXPCDictionaryCopyCFObject(v2, "0");
      v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(v2, "1"));
    }
    else
    {
      v4 = 0;
      v2 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 48);
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke_2;
  block[3] = &unk_1E47B8BB8;
  block[4] = v5;
  block[5] = v4;
  dispatch_sync(v6, block);
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke_3;
    v10[3] = &unk_1E47B9E60;
    v10[5] = v2;
    v10[6] = v8;
    v10[4] = v4;
    dispatch_async(global_queue, v10);
  }

}

uint64_t __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = result;
  return result;
}

uint64_t __41__SSDevice_sdk_loadStoreFrontIdentifier___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSString)mediaLibraryIdentifier
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SSDevice_mediaLibraryIdentifier__block_invoke;
  v5[3] = &unk_1E47BBA20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __34__SSDevice_mediaLibraryIdentifier__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  id result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (id)v2[10];
  if (!v3)
  {
    objc_msgSend(v2, "_cacheKeyValueStoreValues");
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  }
  result = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if (v3 != result)
  {
    result = *(id *)(*(_QWORD *)(a1 + 32) + 80);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (void)setCellularNetworkingAllowed:(BOOL)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SSXPCConnection *v17;
  xpc_object_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (MGGetBoolAnswer() && _os_feature_enabled_impl())
  {
    v4 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v4)
      v4 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v7 = v6;
    else
      v7 = v6 & 2;
    if (v7)
    {
      v20 = 136446210;
      v21 = "-[SSDevice setCellularNetworkingAllowed:]";
      LODWORD(v19) = 12;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v20, v19);
        free(v9);
        SSFileLog(v4, CFSTR("%@"), v11, v12, v13, v14, v15, v16, v10);
      }
    }
  }
  v17 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v18 = SSXPCCreateMessageDictionary(88);
  xpc_dictionary_set_BOOL(v18, "1", a3);
  -[SSXPCConnection sendMessage:](v17, "sendMessage:", v18);
  xpc_release(v18);

}

- (void)setStoreFrontWithResponseHeaders:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("X-Set-Apple-Store-Front"));
  if (objc_msgSend(v4, "length"))
    -[SSDevice setStoreFrontIdentifier:](self, "setStoreFrontIdentifier:", v4);
}

- (void)showPromptWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  xpc_object_t v19;
  SSXPCConnection *v20;
  uint64_t v21;
  _QWORD v22[6];
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("promptIdentifier is nil"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
  if ((objc_msgSend((id)objc_opt_class(), "promptNeedsDisplay:", a3) & 1) != 0)
  {
    if (MGGetBoolAnswer() && _os_feature_enabled_impl())
    {
      v6 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v6)
        v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = objc_msgSend(v6, "shouldLog");
      if (objc_msgSend(v6, "shouldLogToDisk"))
        v8 = v7 | 2;
      else
        v8 = v7;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_FAULT))
        v9 = v8;
      else
        v9 = v8 & 2;
      if (v9)
      {
        v23 = 136446210;
        v24 = "-[SSDevice showPromptWithIdentifier:completionHandler:]";
        LODWORD(v21) = 12;
        v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          v11 = (void *)v10;
          v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v23, v21);
          free(v11);
          SSFileLog(v6, CFSTR("%@"), v13, v14, v15, v16, v17, v18, v12);
        }
      }
    }
    v19 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v19, "0", 69);
    SSXPCDictionarySetCFObject(v19, "1", (__CFString *)a3);
    v20 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __55__SSDevice_showPromptWithIdentifier_completionHandler___block_invoke;
    v22[3] = &unk_1E47B8EE0;
    v22[4] = v20;
    v22[5] = a4;
    -[SSXPCConnection sendMessage:withReply:](v20, "sendMessage:withReply:", v19, v22);
    xpc_release(v19);
  }
  else if (a4)
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

void __55__SSDevice_showPromptWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *global_queue;
  uint64_t v8;
  _QWORD v9[6];

  if (*(_QWORD *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E0C81258])
    {
      v4 = 121;
    }
    else
    {
      if (a2 && MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
      {
        v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "1"));
        goto LABEL_8;
      }
      v4 = 111;
    }
    v5 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), v4, 0, 0);
LABEL_8:
    v6 = v5;
    global_queue = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__SSDevice_showPromptWithIdentifier_completionHandler___block_invoke_2;
    v9[3] = &unk_1E47B8EB8;
    v8 = *(_QWORD *)(a1 + 40);
    v9[4] = v6;
    v9[5] = v8;
    dispatch_async(global_queue, v9);

  }
}

uint64_t __55__SSDevice_showPromptWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSString)softwareLibraryIdentifier
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__SSDevice_softwareLibraryIdentifier__block_invoke;
  v5[3] = &unk_1E47BBA20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __37__SSDevice_softwareLibraryIdentifier__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  id result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (id)v2[14];
  if (!v3)
  {
    objc_msgSend(v2, "_cacheKeyValueStoreValues");
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  }
  result = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if (v3 != result)
  {
    result = *(id *)(*(_QWORD *)(a1 + 32) + 112);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (NSString)legacyUserAgent
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__SSDevice_legacyUserAgent__block_invoke;
  v5[3] = &unk_1E47BBA20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __27__SSDevice_legacyUserAgent__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v2;
  }
  else
  {
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("UserAgent"), CFSTR("com.apple.itunesstored"));
    if (v3)
    {
      v6 = v3;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = v3;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(id *)(*(_QWORD *)(a1 + 32) + 64);

    }
    else
    {
      v7 = 1;
      v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newLegacyUserAgent:", &v7);
      v5 = v4;
      if (v7)
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = v4;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v5;

    }
  }
}

- (NSString)userAgent
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__SSDevice_userAgent__block_invoke;
  v5[3] = &unk_1E47BBA20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __21__SSDevice_userAgent__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (v2)
  {
    v3 = v2;
LABEL_3:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v3;
    return;
  }
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("UserAgent"), CFSTR("com.apple.itunesstored"));
  if (!v4)
  {
    v8 = 1;
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "userAgentWithBundleRef:isCachable:", CFBundleGetMainBundle(), &v8);
    v6 = v5;
    if (v8)
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = v5;
    v3 = v6;
    goto LABEL_3;
  }
  v7 = v4;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = v4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(id *)(*(_QWORD *)(a1 + 32) + 136);

}

- (id)userAgentWithClientName:(id)a3 version:(id)a4
{
  return -[SSDevice _newModernUserAgentWithClientName:version:isCachable:](self, "_newModernUserAgentWithClientName:version:isCachable:", a3, a4, 0);
}

+ (id)copyCachedAvailableItemKinds
{
  void *v2;
  void *v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AvailableItemKinds"), CFSTR("com.apple.itunesstored"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v2);
  else
    v3 = 0;

  return v3;
}

+ (BOOL)promptNeedsDisplay:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  id v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v5 = (void *)objc_msgSend(v4, "activeAccount");
  if (!v5)
  {
    v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "localAccount"), "resultWithError:", 0);
    if (!v5)
    {
      v9 = +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
      if (!v9)
        v9 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = objc_msgSend(v9, "shouldLog");
      if (objc_msgSend(v9, "shouldLogToDisk"))
        v11 = v10 | 2;
      else
        v11 = v10;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v11 &= 2u;
      if (v11)
      {
        v22 = 138543618;
        v23 = objc_opt_class();
        v24 = 2114;
        v25 = a3;
        LODWORD(v21) = 22;
        v6 = _os_log_send_and_compose_impl();
        if (!v6)
          return v6;
        v12 = (void *)v6;
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v6, 4, &v22, v21);
        free(v12);
        SSFileLog(v9, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
      }
      goto LABEL_4;
    }
  }
  if ((objc_msgSend(v5, "displayedServerPromptWithIdentifier:", a3) & 1) != 0)
  {
LABEL_4:
    LOBYTE(v6) = 0;
    return v6;
  }
  v7 = (void *)objc_msgSend(v5, "lastAttemptDateForServerPromptWithIdentifier:", a3);
  if (v7)
  {
    objc_msgSend(v7, "timeIntervalSinceNow");
    LOBYTE(v6) = fabs(v8) >= 86400.0;
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

+ (BOOL)setCachedAvailableItemKinds:(id)a3
{
  int v4;

  v4 = SSIsDaemon();
  if (v4)
    CFPreferencesSetAppValue(CFSTR("AvailableItemKinds"), (CFPropertyListRef)objc_msgSend(a3, "allObjects"), CFSTR("com.apple.itunesstored"));
  return v4;
}

+ (void)setLastPromptAttemptDate:(id)a3 forPromptWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v7 = (void *)objc_msgSend(v6, "activeAccount");
  if (v7 || (v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "localAccount"), "resultWithError:", 0)) != 0)
  {
    objc_msgSend(v7, "setLastAttemptDate:forServerPromptWithIdentifier:", a3, a4);
    v25 = 0;
    if ((objc_msgSend(v6, "saveAccount:verifyCredentials:error:", v7, 0, &v25) & 1) == 0)
    {
      v8 = +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
      if (!v8)
        v8 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = objc_msgSend(v8, "shouldLog");
      v10 = objc_msgSend(v8, "shouldLogToDisk") ? v9 | 2 : v9;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v10 &= 2u;
      if (v10)
      {
        v11 = objc_opt_class();
        v12 = objc_msgSend(v7, "hashedDescription");
        v26 = 138544130;
        v27 = v11;
        v28 = 2114;
        v29 = v12;
        v30 = 2114;
        v31 = a4;
        v32 = 2114;
        v33 = v25;
        LODWORD(v24) = 42;
        goto LABEL_22;
      }
    }
  }
  else
  {
    v8 = +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    if (!v8)
      v8 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v13 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v14 = v13 | 2;
    else
      v14 = v13;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v14 &= 2u;
    if (v14)
    {
      v26 = 138543618;
      v27 = objc_opt_class();
      v28 = 2114;
      v29 = (uint64_t)a4;
      LODWORD(v24) = 22;
LABEL_22:
      v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        v16 = (void *)v15;
        v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v26, v24);
        free(v16);
        SSFileLog(v8, CFSTR("%@"), v18, v19, v20, v21, v22, v23, v17);
      }
    }
  }
}

+ (void)setPromptWithIdentifier:(id)a3 needsDisplay:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  int v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v7 = (void *)objc_msgSend(v6, "activeAccount");
  if (v7 || (v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "localAccount"), "resultWithError:", 0)) != 0)
  {
    if (v4)
    {
      objc_msgSend(v7, "setDisplayedServerPrompt:withIdentifier:", 0, a3);
    }
    else
    {
      objc_msgSend(v7, "setDisplayedServerPrompt:withIdentifier:", 1, a3);
      objc_msgSend(v7, "setLastAttemptDate:forServerPromptWithIdentifier:", 0, a3);
    }
    v35 = 0;
    if ((objc_msgSend(v6, "saveAccount:verifyCredentials:error:", v7, 0, &v35) & 1) == 0)
    {
      v8 = +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
      if (!v8)
        v8 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = objc_msgSend(v8, "shouldLog");
      if (objc_msgSend(v8, "shouldLogToDisk"))
        v10 = v9 | 2;
      else
        v10 = v9;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v10 &= 2u;
      if (v10)
      {
        v11 = objc_opt_class();
        v12 = objc_msgSend(v7, "hashedDescription");
        v36 = 138544130;
        v37 = v11;
        v38 = 2114;
        v39 = v12;
        v40 = 2114;
        v41 = a3;
        v42 = 2114;
        v43 = v35;
        LODWORD(v34) = 42;
        v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v36, v34);
          free(v14);
          SSFileLog(v8, CFSTR("%@"), v16, v17, v18, v19, v20, v21, v15);
        }
      }
    }
  }
  else
  {
    v22 = +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    if (!v22)
      v22 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v23 = objc_msgSend(v22, "shouldLog");
    if (objc_msgSend(v22, "shouldLogToDisk"))
      v24 = v23 | 2;
    else
      v24 = v23;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v22, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v24 &= 2u;
    if (v24)
    {
      v36 = 138543618;
      v37 = objc_opt_class();
      v38 = 2114;
      v39 = (uint64_t)a3;
      LODWORD(v34) = 22;
      v25 = _os_log_send_and_compose_impl();
      if (v25)
      {
        v26 = (void *)v25;
        v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v25, 4, &v36, v34);
        free(v26);
        SSFileLog(v22, CFSTR("%@"), v28, v29, v30, v31, v32, v33, v27);
      }
    }
  }
}

- (double)batteryLevel
{
  NSObject *dispatchQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  unint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0xBFF0000000000000;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__SSDevice_batteryLevel__block_invoke;
  v5[3] = &unk_1E47BBA20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __24__SSDevice_batteryLevel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  double result;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(uint64_t *)(v1 + 184) >= 1)
  {
    result = *(double *)(v1 + 152);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (id)carrierBundleStatusForService:(int64_t)a3
{
  id v3;
  CFPropertyListRef v5;
  const void *v6;
  CFTypeID v7;
  SSVSubscriptionStatus *v8;

  if (a3
    || (CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored")),
        (v5 = CFPreferencesCopyAppValue(CFSTR("FuseSubscriptionStatus"), CFSTR("com.apple.itunesstored"))) == 0))
  {
    v3 = 0;
  }
  else
  {
    v6 = v5;
    v7 = CFGetTypeID(v5);
    if (v7 == CFDictionaryGetTypeID())
    {
      v8 = -[SSVSubscriptionStatus initWithUserDefaultsRepresentation:]([SSVSubscriptionStatus alloc], "initWithUserDefaultsRepresentation:", v6);
      v3 = -[SSDevice _copyCarrierBundleEligibilityWithStatus:](self, "_copyCarrierBundleEligibilityWithStatus:", v8);

    }
    else
    {
      v3 = 0;
    }
    CFRelease(v6);
  }
  return v3;
}

- (NSString)compatibleProductType
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const __CFString *Value;
  __CFString *Copy;

  v2 = (const __CFDictionary *)MGCopyAnswer();
  if (v2)
  {
    v3 = v2;
    Value = (const __CFString *)CFDictionaryGetValue(v2, CFSTR("CompatibleDeviceFallback"));
    Copy = (__CFString *)Value;
    if (Value)
    {
      if (CFStringCompare(Value, CFSTR("0"), 0))
        Copy = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Copy);
      else
        Copy = 0;
    }
    CFRelease(v3);
  }
  else
  {
    Copy = 0;
  }
  return (NSString *)Copy;
}

- (int64_t)deviceType
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__SSDevice_deviceType__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__SSDevice_deviceType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_deviceType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)getCarrierBundleStatusForService:(int64_t)a3 completionHandler:(id)a4
{
  SSVSubscriptionStatusRequest *v6;
  _QWORD v7[6];

  v6 = objc_alloc_init(SSVSubscriptionStatusRequest);
  -[SSVSubscriptionStatusRequest setCarrierBundleProvisioningStyle:](v6, "setCarrierBundleProvisioningStyle:", 2);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__SSDevice_getCarrierBundleStatusForService_completionHandler___block_invoke;
  v7[3] = &unk_1E47BBCE8;
  v7[4] = self;
  v7[5] = a4;
  -[SSVSubscriptionStatusRequest startWithStatusResponseBlock:](v6, "startWithStatusResponseBlock:", v7);

}

void __63__SSDevice_getCarrierBundleStatusForService_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v3;
  id v5;

  if (*(_QWORD *)(a1 + 40))
    v3 = a3 == 0;
  else
    v3 = 1;
  if (!v3)
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "_copyCarrierBundleEligibilityWithStatus:", a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (BOOL)getMachineIdentifier:(id *)a3 otp:(id *)a4 forAccountIdentifier:(id)a5
{
  uint64_t v7;
  int v8;
  int v9;
  CFDataRef v10;
  const __CFData *v11;
  CFDataRef v12;
  const __CFData *v13;
  unsigned int v15;
  const UInt8 *v16;
  unsigned int v17;
  const UInt8 *v18;

  v18 = 0;
  v17 = 0;
  v16 = 0;
  v15 = 0;
  if (a5)
    v7 = objc_msgSend(a5, "unsignedLongLongValue");
  else
    v7 = -1;
  qi864985u0(v7, (uint64_t)&v16, (uint64_t)&v15, (uint64_t)&v18, (uint64_t)&v17);
  v9 = v8;
  if (!v8)
  {
    if (a3 && v16)
    {
      v10 = SSVCreateDataWithADIBytes(v16, v15);
      *a3 = v10;
      v11 = v10;
    }
    if (a4 && v18)
    {
      v12 = SSVCreateDataWithADIBytes(v18, v17);
      *a4 = v12;
      v13 = v12;
    }
  }
  return v9 == 0;
}

- (BOOL)isPluggedIn
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__SSDevice_isPluggedIn__block_invoke;
  v5[3] = &unk_1E47BBA20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __23__SSDevice_isPluggedIn__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (*(uint64_t *)(v2 + 184) >= 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(v2 + 176);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    result = MGGetSInt32Answer();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = (_DWORD)result == 4;
  }
  return result;
}

- (void)enableAllAutomaticDownloadKindsWithCompletionBlock:(id)a3
{
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v5)
    v5 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_INFO))
    v7 &= 2u;
  if (v7)
  {
    v19 = 138412290;
    v20 = objc_opt_class();
    LODWORD(v18) = 12;
    v17 = &v19;
    v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v19, v18);
      free(v9);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, v10);
    }
  }
  -[SSDevice _updateAutomaticDownloadKinds:withValue:completionBlock:](self, "_updateAutomaticDownloadKinds:withValue:completionBlock:", 0, CFSTR("all"), a3, v17);
}

- (void)minusAutomaticDownloadKinds:(id)a3 withCompletionBlock:(id)a4
{
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v7)
    v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_INFO))
    v9 &= 2u;
  if (v9)
  {
    v21 = 138412546;
    v22 = objc_opt_class();
    v23 = 2112;
    v24 = a3;
    LODWORD(v20) = 22;
    v19 = &v21;
    v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v21, v20);
      free(v11);
      SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, v12);
    }
  }
  -[SSDevice _updateAutomaticDownloadKinds:withValue:completionBlock:](self, "_updateAutomaticDownloadKinds:withValue:completionBlock:", a3, CFSTR("minus"), a4, v19);
}

- (NSString)phoneNumber
{
  return -[SSVTelephonyController phoneNumber](+[SSVTelephonyController sharedController](SSVTelephonyController, "sharedController"), "phoneNumber");
}

- (NSString)productType
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__SSDevice_productType__block_invoke;
  v5[3] = &unk_1E47BBA20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __23__SSDevice_productType__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[12];
  if (!v3)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = objc_msgSend(v2, "_copyProductType");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(*(id *)(a1 + 32), "_deviceTypeForProductType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  }
  result = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (BOOL)deviceIsAppleTV
{
  return MGGetSInt32Answer() == 4;
}

+ (BOOL)deviceIsAppleWatch
{
  return MGGetSInt32Answer() == 6;
}

+ (BOOL)deviceIsAudioAccessory
{
  return MGGetSInt32Answer() == 7;
}

+ (BOOL)deviceIsiPad
{
  return MGGetSInt32Answer() == 3;
}

+ (BOOL)deviceIsiPhone
{
  return MGGetSInt32Answer() == 1;
}

+ (BOOL)deviceIsiPod
{
  return MGGetSInt32Answer() == 2;
}

+ (BOOL)deviceIsSeedBuild
{
  return 0;
}

- (float)screenScale
{
  float result;

  MGGetFloat32Answer();
  return result;
}

- (NSString)serialNumber
{
  return (NSString *)(id)MGCopyAnswer();
}

- (void)setAutomaticDownloadKinds:(id)a3 withCompletionBlock:(id)a4
{
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v7)
    v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_INFO))
    v9 &= 2u;
  if (v9)
  {
    v21 = 138412546;
    v22 = objc_opt_class();
    v23 = 2112;
    v24 = a3;
    LODWORD(v20) = 22;
    v19 = &v21;
    v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v21, v20);
      free(v11);
      SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, v12);
    }
  }
  -[SSDevice _updateAutomaticDownloadKinds:withValue:completionBlock:](self, "_updateAutomaticDownloadKinds:withValue:completionBlock:", a3, CFSTR("set"), a4, v19);
}

- (void)setCloudMediaLibraryIdentifier:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v6[6];

  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SSDevice_setCloudMediaLibraryIdentifier___block_invoke;
  v6[3] = &unk_1E47B8BB8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(dispatchQueue, v6);
  -[SSKeyValueStore setValue:forDomain:key:completionBlock:](self->_keyValueStore, "setValue:forDomain:key:completionBlock:", a3, CFSTR("com.apple.itunesstored"), CFSTR("CloudLibraryCUID"), 0);
}

_QWORD *__43__SSDevice_setCloudMediaLibraryIdentifier___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  void *v3;

  v1 = *(void **)(result[4] + 32);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    v3 = (void *)v2[5];
    if (v3)
      result = (_QWORD *)objc_msgSend(v3, "copy");
    else
      result = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    *(_QWORD *)(v2[4] + 32) = result;
  }
  return result;
}

- (void)setMediaLibraryIdentifier:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v6[6];

  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SSDevice_setMediaLibraryIdentifier___block_invoke;
  v6[3] = &unk_1E47B8BB8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(dispatchQueue, v6);
  -[SSKeyValueStore setValue:forDomain:key:completionBlock:](self->_keyValueStore, "setValue:forDomain:key:completionBlock:", a3, CFSTR("com.apple.itunesstored"), CFSTR("LibraryCUID"), 0);
}

_QWORD *__38__SSDevice_setMediaLibraryIdentifier___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  void *v3;

  v1 = *(void **)(result[4] + 80);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    v3 = (void *)v2[5];
    if (v3)
      result = (_QWORD *)objc_msgSend(v3, "copy");
    else
      result = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    *(_QWORD *)(v2[4] + 80) = result;
  }
  return result;
}

- (void)setSoftwareLibraryIdentifier:(id)a3
{
  NSObject *dispatchQueue;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SSDevice_setSoftwareLibraryIdentifier___block_invoke;
  block[3] = &unk_1E47B8F30;
  block[4] = self;
  block[5] = a3;
  block[6] = &v8;
  dispatch_sync(dispatchQueue, block);
  -[SSKeyValueStore setValue:forDomain:key:completionBlock:](self->_keyValueStore, "setValue:forDomain:key:completionBlock:", a3, CFSTR("com.apple.itunesstored"), CFSTR("SoftwareCUID"), 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.StoreServices.SoftwareCUIDChanged"), 0, 0, 1u);
  if (*((_BYTE *)v9 + 24))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SSDeviceSoftwareLibraryIdentifierChangedNotification"), self);
  _Block_object_dispose(&v8, 8);
}

_QWORD *__41__SSDevice_setSoftwareLibraryIdentifier___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  void *v3;

  v1 = *(void **)(result[4] + 112);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    v3 = (void *)v2[5];
    if (v3)
      result = (_QWORD *)objc_msgSend(v3, "copy");
    else
      result = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    *(_QWORD *)(v2[4] + 112) = result;
    *(_BYTE *)(*(_QWORD *)(v2[6] + 8) + 24) = 1;
  }
  return result;
}

- (void)setStoreFrontIdentifier:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "localAccount");
  objc_msgSend(v4, "addErrorBlock:", &__block_literal_global_106);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SSDevice_setStoreFrontIdentifier___block_invoke_107;
  v5[3] = &unk_1E47BBD50;
  v5[4] = a3;
  objc_msgSend(v4, "addSuccessBlock:", v5);
}

void __36__SSDevice_setStoreFrontIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  if (!v3)
    v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  if (os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_ERROR))
    v6 = v5;
  else
    v6 = v5 & 2;
  if (v6)
  {
    v17 = 138412290;
    v18 = a2;
    LODWORD(v16) = 12;
    v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v17, v16);
      free(v8);
      SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
    }
  }
}

uint64_t __36__SSDevice_setStoreFrontIdentifier___block_invoke_107(uint64_t a1, void *a2)
{
  uint64_t result;
  id v5;
  _QWORD v6[5];

  result = objc_msgSend((id)objc_msgSend(a2, "storeFrontIdentifier"), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((result & 1) == 0)
  {
    objc_msgSend(a2, "setStoreFrontIdentifier:", *(_QWORD *)(a1 + 32));
    v5 = +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__SSDevice_setStoreFrontIdentifier___block_invoke_2;
    v6[3] = &unk_1E47BA468;
    v6[4] = *(_QWORD *)(a1 + 32);
    return objc_msgSend(v5, "saveAccount:verifyCredentials:completion:", a2, 0, v6);
  }
  return result;
}

void __36__SSDevice_setStoreFrontIdentifier___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  id v6;
  id v7;
  int v8;
  int v9;
  id v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v7 = v6;
  if (a2)
  {
    if (!v6)
      v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v9 &= 2u;
    if (v9)
    {
      v10 = SSHashIfNeeded(*(void **)(a1 + 32));
      LODWORD(v23) = 138543362;
      *(_QWORD *)((char *)&v23 + 4) = v10;
      LODWORD(v22) = 12;
      goto LABEL_21;
    }
  }
  else
  {
    if (!v6)
      v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v11 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v13 = v12;
    else
      v13 = v12 & 2;
    if (v13)
    {
      LODWORD(v23) = 138412290;
      *(_QWORD *)((char *)&v23 + 4) = a3;
      LODWORD(v22) = 12;
LABEL_21:
      v14 = (void *)_os_log_send_and_compose_impl();
      if (v14)
      {
        v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v23, v22, v23);
        free(v14);
        SSFileLog(v7, CFSTR("%@"), v16, v17, v18, v19, v20, v21, v15);
      }
    }
  }
}

- (void)startPowerMonitoring
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SSDevice_startPowerMonitoring__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__SSDevice_startPowerMonitoring__block_invoke(uint64_t result)
{
  uint64_t v1;
  mach_port_t v2;
  const __CFDictionary *v3;
  uint64_t MatchingService;
  uint64_t v5;
  SSWeakReference *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD handler[5];

  if (++*(_QWORD *)(*(_QWORD *)(result + 32) + 184) == 1)
  {
    v1 = result;
    v2 = *MEMORY[0x1E0CBBAB8];
    *(_QWORD *)(*(_QWORD *)(result + 32) + 168) = IONotificationPortCreate(*MEMORY[0x1E0CBBAB8]);
    IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(*(_QWORD *)(v1 + 32) + 168), *(dispatch_queue_t *)(*(_QWORD *)(v1 + 32) + 48));
    v3 = IOServiceMatching("IOPMPowerSource");
    MatchingService = IOServiceGetMatchingService(v2, v3);
    if ((_DWORD)MatchingService)
    {
      v5 = MatchingService;
      if (!IOServiceAddInterestNotification(*(IONotificationPortRef *)(*(_QWORD *)(v1 + 32) + 168), MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)__BatteryLevelChanged, *(void **)(v1 + 32), (io_object_t *)(*(_QWORD *)(v1 + 32) + 160)))objc_msgSend(*(id *)(v1 + 32), "_updateBatteryLevelFromService:", v5);
      IOObjectRelease(v5);
    }
    v6 = +[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", *(_QWORD *)(v1 + 32));
    v7 = *(_QWORD *)(v1 + 32);
    v8 = *(NSObject **)(v7 + 48);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __32__SSDevice_startPowerMonitoring__block_invoke_2;
    handler[3] = &unk_1E47BBD78;
    handler[4] = v6;
    result = notify_register_dispatch("com.apple.springboard.pluggedin", (int *)(v7 + 180), v8, handler);
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(v1 + 32) + 176) = 0;
    }
    else
    {
      v9 = 0;
      result = notify_get_state(*(_DWORD *)(*(_QWORD *)(v1 + 32) + 180), &v9);
      *(_BYTE *)(*(_QWORD *)(v1 + 32) + 176) = v9 != 0;
    }
  }
  return result;
}

void __32__SSDevice_startPowerMonitoring__block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD v3[6];

  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "object");
  objc_msgSend(v1, "_reloadPluggedInState");
  v2 = dispatch_queue_create("com.apple.StoreServices.SSDevice.notify", 0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__SSDevice_startPowerMonitoring__block_invoke_3;
  v3[3] = &unk_1E47B8BB8;
  v3[4] = v1;
  v3[5] = v2;
  dispatch_async(v2, v3);
}

void __32__SSDevice_startPowerMonitoring__block_invoke_3(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SSDevicePluggedInStateChangedNotification"), *(_QWORD *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

- (void)stopPowerMonitoring
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SSDevice_stopPowerMonitoring__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__SSDevice_stopPowerMonitoring__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  IONotificationPort *v7;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 184);
  v3 = v2 < 1;
  v4 = v2 - 1;
  if (!v3)
  {
    v5 = result;
    *(_QWORD *)(v1 + 184) = v4;
    v6 = *(_QWORD *)(result + 32);
    if (!*(_QWORD *)(v6 + 184))
    {
      v7 = *(IONotificationPort **)(v6 + 168);
      if (v7)
      {
        IONotificationPortDestroy(v7);
        *(_QWORD *)(*(_QWORD *)(v5 + 32) + 168) = 0;
        v6 = *(_QWORD *)(v5 + 32);
      }
      result = *(unsigned int *)(v6 + 160);
      if ((_DWORD)result)
      {
        result = IOObjectRelease(result);
        *(_DWORD *)(*(_QWORD *)(v5 + 32) + 160) = 0;
      }
    }
  }
  return result;
}

- (BOOL)supportsDeviceCapability:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      return MGGetBoolAnswer();
    case 2:
      return -[SSDevice _is1080pCapable](self, "_is1080pCapable");
    case 1:
      return -[SSDevice _is720pCapable](self, "_is720pCapable");
  }
  return 1;
}

- (int64_t)deviceBiometricStyle
{
  const void *v3;
  const void *v4;
  const void *v5;
  int64_t v6;

  if (!self->_biometricStyle)
  {
    v3 = (const void *)MGCopyAnswer();
    v4 = (const void *)*MEMORY[0x1E0C9AE50];
    if (v3 == (const void *)*MEMORY[0x1E0C9AE50])
    {
      v5 = 0;
      v6 = 3;
    }
    else
    {
      v5 = (const void *)MGCopyAnswer();
      v6 = 1;
      if (v5 == v4)
        v6 = 2;
    }
    self->_biometricStyle = v6;
    if (v3)
      CFRelease(v3);
    if (v5)
      CFRelease(v5);
  }
  return self->_biometricStyle;
}

- (void)synchronizeAutomaticDownloadKinds
{
  id v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SSXPCConnection *v15;
  xpc_object_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (MGGetBoolAnswer() && _os_feature_enabled_impl())
  {
    v2 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v2)
      v2 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v5 = v4;
    else
      v5 = v4 & 2;
    if (v5)
    {
      v18 = 136446210;
      v19 = "-[SSDevice synchronizeAutomaticDownloadKinds]";
      LODWORD(v17) = 12;
      v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v6, 4, &v18, v17);
        free(v7);
        SSFileLog(v2, CFSTR("%@"), v9, v10, v11, v12, v13, v14, v8);
      }
    }
  }
  v15 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v16, "0", 76);
  -[SSXPCConnection sendSynchronousMessage:withReply:](v15, "sendSynchronousMessage:withReply:", v16, &__block_literal_global_122);
  xpc_release(v16);

}

- (NSString)thinnedApplicationVariantIdentifier
{
  CFPropertyListRef v3;
  void *v4;
  CFTypeID v5;
  NSString *v6;
  id v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;

  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
  v3 = CFPreferencesCopyAppValue(CFSTR("ThinnedAppVariantID"), CFSTR("com.apple.itunesstored"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      v6 = v4;
      CFRelease(v4);
      if (v6)
        return v6;
    }
    else
    {
      CFRelease(v4);
    }
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = -[SSDevice productType](self, "productType");
  if (v9)
    objc_msgSend(v8, "addObject:", v9);
  v10 = -[SSDevice compatibleProductType](self, "compatibleProductType");
  if (v10)
    objc_msgSend(v8, "addObject:", v10);
  v11 = (NSString *)objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));

  return v11;
}

- (void)unionAutomaticDownloadKinds:(id)a3 withCompletionBlock:(id)a4
{
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v7)
    v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_INFO))
    v9 &= 2u;
  if (v9)
  {
    v21 = 138412546;
    v22 = objc_opt_class();
    v23 = 2112;
    v24 = a3;
    LODWORD(v20) = 22;
    v19 = &v21;
    v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v21, v20);
      free(v11);
      SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, v12);
    }
  }
  -[SSDevice _updateAutomaticDownloadKinds:withValue:completionBlock:](self, "_updateAutomaticDownloadKinds:withValue:completionBlock:", a3, CFSTR("union"), a4, v19);
}

- (NSString)uniqueDeviceIdentifier
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SSDevice_uniqueDeviceIdentifier__block_invoke;
  v5[3] = &unk_1E47BBA20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __34__SSDevice_uniqueDeviceIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  id result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = -[SSLockdown copyDeviceGUID](+[SSLockdown sharedInstance](SSLockdown, "sharedInstance"), "copyDeviceGUID");
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  }
  result = v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)userAgentWithBundleIdentifier:(id)a3 version:(id)a4
{
  id v7;
  id v8;

  v7 = -[SSDevice _userAgentClientNameForBundleID:](self, "_userAgentClientNameForBundleID:");
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  return -[SSDevice userAgentWithClientName:version:](self, "userAgentWithClientName:version:", v8, a4);
}

- (void)setStoreFrontIdentifier:(id)a3 account:(id)a4
{
  -[SSDevice setStoreFrontIdentifier:forRequest:response:account:](self, "setStoreFrontIdentifier:forRequest:response:account:", a3, 0, 0, a4);
}

- (void)setStoreFrontIdentifier:(id)a3 accountIdentifier:(id)a4
{
  id v7;
  uint64_t v8;

  v7 = +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  if (a4)
    v8 = objc_msgSend(v7, "accountWithUniqueIdentifier:", a4);
  else
    v8 = objc_msgSend(v7, "activeAccount");
  -[SSDevice setStoreFrontIdentifier:account:](self, "setStoreFrontIdentifier:account:", a3, v8);
}

- (void)setStoreFrontIdentifier:(id)a3 forRequest:(id)a4 response:(id)a5 account:(id)a6
{
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  __int16 v49;
  id v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  if (!a6)
    goto LABEL_40;
  v12 = v11;
  if ((objc_msgSend((id)objc_msgSend(a6, "storeFrontIdentifier"), "isEqualToString:", a3) & 1) != 0
    || (objc_msgSend(a6, "isLocalAccount") & 1) != 0)
  {
    goto LABEL_38;
  }
  v13 = SSGenerateLogCorrelationString();
  v14 = (void *)objc_msgSend(a6, "copy");
  objc_msgSend(v14, "setStoreFrontIdentifier:forRequest:response:", a3, a4, a5);
  v15 = objc_msgSend(+[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig"), "debugLogsEnabled");
  v16 = +[SSLogConfig sharedAccountsStorefrontConfig](SSLogConfig, "sharedAccountsStorefrontConfig");
  v17 = v16;
  if (v15)
  {
    if (!v16)
      v17 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v18 = objc_msgSend(v17, "shouldLog");
    if (objc_msgSend(v17, "shouldLogToDisk"))
      v19 = v18 | 2;
    else
      v19 = v18;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v17, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v20 = v19;
    else
      v20 = v19 & 2;
    if (!v20)
      goto LABEL_26;
    v47 = 138544130;
    v48 = objc_opt_class();
    v49 = 2114;
    v50 = v13;
    v51 = 2114;
    v52 = objc_msgSend(a6, "hashedDescription");
    v53 = 2114;
    v54 = +[SSStackShot generateSymbolicatedStackShot](SSStackShot, "generateSymbolicatedStackShot");
    LODWORD(v45) = 42;
    v44 = &v47;
  }
  else
  {
    if (!v16)
      v17 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v21 = objc_msgSend(v17, "shouldLog");
    if (objc_msgSend(v17, "shouldLogToDisk"))
      v21 |= 2u;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v17, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v22 = v21;
    else
      v22 = v21 & 2;
    if (!v22)
      goto LABEL_26;
    v47 = 138543874;
    v48 = objc_opt_class();
    v49 = 2114;
    v50 = v13;
    v51 = 2114;
    v52 = objc_msgSend(a6, "hashedDescription");
    LODWORD(v45) = 32;
    v44 = &v47;
  }
  v23 = (void *)_os_log_send_and_compose_impl();
  if (v23)
  {
    v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v23, 4, &v47, v45);
    free(v23);
    SSFileLog(v17, CFSTR("%@"), v25, v26, v27, v28, v29, v30, v24);
  }
LABEL_26:
  v46 = 0;
  if ((objc_msgSend(v12, "saveAccount:verifyCredentials:error:", v14, 0, &v46, v44) & 1) == 0)
  {
    v31 = +[SSLogConfig sharedAccountsStorefrontConfig](SSLogConfig, "sharedAccountsStorefrontConfig");
    if (!v31)
      v31 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v32 = objc_msgSend(v31, "shouldLog");
    if (objc_msgSend(v31, "shouldLogToDisk"))
      v32 |= 2u;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v31, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v33 = v32;
    else
      v33 = v32 & 2;
    if (v33)
    {
      v34 = objc_opt_class();
      v47 = 138543618;
      v48 = v34;
      v49 = 2114;
      v50 = v13;
      LODWORD(v45) = 22;
      v44 = &v47;
      v35 = _os_log_send_and_compose_impl();
      if (v35)
      {
        v36 = (void *)v35;
        v37 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v35, 4, &v47, v45);
        free(v36);
        SSFileLog(v31, CFSTR("%@"), v38, v39, v40, v41, v42, v43, v37);
      }
    }
  }

LABEL_38:
  if (!objc_msgSend(v12, "activeAccount", v44) || objc_msgSend(a6, "isActive"))
LABEL_40:
    -[SSDevice setStoreFrontIdentifier:](self, "setStoreFrontIdentifier:", a3);
}

- (id)_appleTVProductVersion
{
  id result;

  result = self->_appleTVProductVersion;
  if (!result)
  {
    if (MGGetSInt32Answer() == 4)
    {
      result = -[SSDevice _productVersion](self, "_productVersion");
      self->_appleTVProductVersion = (NSString *)result;
    }
    else
    {
      return self->_appleTVProductVersion;
    }
  }
  return result;
}

- (void)_cacheKeyValueStoreValues
{
  NSObject *v3;
  SSKeyValueStore *keyValueStore;
  uint64_t v5;
  NSObject *v6;
  SSKeyValueStore *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[7];
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;
  _QWORD v34[2];
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__22;
  v32 = __Block_byref_object_dispose__22;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__22;
  v26 = __Block_byref_object_dispose__22;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__22;
  v20 = __Block_byref_object_dispose__22;
  v21 = 0;
  v35[0] = CFSTR("CloudLibraryCUID");
  v35[1] = CFSTR("LibraryCUID");
  v35[2] = CFSTR("SoftwareCUID");
  v3 = dispatch_semaphore_create(0);
  keyValueStore = self->_keyValueStore;
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __37__SSDevice__cacheKeyValueStoreValues__block_invoke;
  v15[3] = &unk_1E47BBDC0;
  v15[6] = &v22;
  v15[7] = &v16;
  v15[4] = v3;
  v15[5] = &v28;
  -[SSKeyValueStore getValuesForDomain:keys:count:usingBlock:](keyValueStore, "getValuesForDomain:keys:count:usingBlock:", CFSTR("com.apple.itunesstored"), v35, 3, v15);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
  v34[0] = CFSTR("LibraryCUID");
  v34[1] = CFSTR("SoftwareCUID");
  v6 = dispatch_semaphore_create(0);
  v7 = self->_keyValueStore;
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __37__SSDevice__cacheKeyValueStoreValues__block_invoke_2;
  v14[3] = &unk_1E47BBDE8;
  v14[5] = &v22;
  v14[6] = &v16;
  v14[4] = v6;
  -[SSKeyValueStore getValuesForDomain:keys:count:usingBlock:](v7, "getValuesForDomain:keys:count:usingBlock:", CFSTR("com.apple.mobile.iTunes.store"), v34, 2, v14);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v6);

  v8 = (void *)v29[5];
  if (v8)
    v9 = v8;
  else
    v9 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  self->_cloudMediaLibraryIdentifier = v9;

  v10 = (void *)v23[5];
  if (v10)
    v11 = v10;
  else
    v11 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  self->_mediaLibraryIdentifier = v11;

  v12 = (void *)v17[5];
  if (v12)
    v13 = v12;
  else
    v13 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  self->_softwareLibraryIdentifier = v13;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
}

intptr_t __37__SSDevice__cacheKeyValueStoreValues__block_invoke(uint64_t a1, id *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a2[1];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a2[2];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __37__SSDevice__cacheKeyValueStoreValues__block_invoke_2(uint64_t a1, id *a2)
{
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a2[1];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_copyCarrierBundleEligibilityWithStatus:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = objc_msgSend(a3, "carrierBundlingStatus");
    v4 = 1;
    if (v3 == 1 || v3 == 4)
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v4);
    if (v3 == 2)
    {
      v4 = 0;
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v4);
    }
  }
  return 0;
}

- (id)_copyKeyValueStoreValueForDomain:(id)a3 key:(id)a4
{
  NSObject *v7;
  SSKeyValueStore *keyValueStore;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__22;
  v16 = __Block_byref_object_dispose__22;
  v17 = 0;
  v7 = dispatch_semaphore_create(0);
  keyValueStore = self->_keyValueStore;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__SSDevice__copyKeyValueStoreValueForDomain_key___block_invoke;
  v11[3] = &unk_1E47BBE10;
  v11[4] = v7;
  v11[5] = &v12;
  -[SSKeyValueStore getValueForDomain:key:usingBlock:](keyValueStore, "getValueForDomain:key:usingBlock:", a3, a4, v11);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v7);
  v9 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

intptr_t __49__SSDevice__copyKeyValueStoreValueForDomain_key___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_copyProductType
{
  return (id)MGCopyAnswer();
}

- (int)_deviceClass
{
  void *v2;
  int v3;

  v2 = (void *)MGCopyAnswer();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "intValue");
  else
    v3 = -1;

  return v3;
}

- (int64_t)_deviceTypeForProductType:(id)a3
{
  uint64_t v5;
  int64_t v6;

  if (!a3)
    return 0;
  v5 = 0;
  v6 = 0;
  do
  {
    if (objc_msgSend((id)__DeviceProperties[v5 + 1], "isEqualToString:", a3))
      v6 = __DeviceProperties[v5];
    v5 += 3;
  }
  while (v5 != 81);
  if (v6)
    return v6;
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("iPad")))
    return -[SSDevice _deviceTypeForUnknownIPad:](self, "_deviceTypeForUnknownIPad:", a3);
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("iPhone")))
    return -[SSDevice _deviceTypeForUnknownIPhone:](self, "_deviceTypeForUnknownIPhone:", a3);
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("iPod")))
    return -[SSDevice _deviceTypeForUnknownIPod:](self, "_deviceTypeForUnknownIPod:", a3);
  if (!objc_msgSend(a3, "hasPrefix:", CFSTR("AppleTV")))
  {
    if ((objc_msgSend(a3, "hasPrefix:", CFSTR("Watch")) & 1) != 0)
      return 2007;
    if (objc_msgSend(a3, "hasPrefix:", CFSTR("iProd")))
      return 4002;
    return 0;
  }
  return -[SSDevice _deviceTypeForUnknownAppleTV:](self, "_deviceTypeForUnknownAppleTV:", a3);
}

- (int64_t)_deviceTypeForUnknownAppleTV:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t result;

  v3 = (void *)objc_msgSend((id)objc_msgSend(a3, "substringFromIndex:", 7), "componentsSeparatedByString:", CFSTR(","));
  if (objc_msgSend(v3, "count") != 2)
    return 4;
  v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "integerValue");
  v5 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 1), "integerValue");
  if (v4 > 3)
    return 4002;
  v6 = v5;
  result = 4;
  if (v4 == 3 && v6 >= 2)
    return 4002;
  return result;
}

- (int64_t)_deviceTypeForUnknownIPad:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t result;

  v3 = (void *)objc_msgSend((id)objc_msgSend(a3, "substringFromIndex:", 4), "componentsSeparatedByString:", CFSTR(","));
  if (objc_msgSend(v3, "count") != 2)
    return 1;
  v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "integerValue");
  v5 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 1), "integerValue");
  if (v4 > 2)
    return 1008;
  v6 = v5;
  result = 1;
  if (v4 == 2 && v6 >= 5)
    return 1008;
  return result;
}

- (int64_t)_deviceTypeForUnknownIPhone:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend(a3, "substringFromIndex:", 6), "componentsSeparatedByString:", CFSTR(","));
  if (objc_msgSend(v3, "count") != 2)
    return 2;
  if (objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "integerValue") <= 4)
    return 2;
  return 2007;
}

- (int64_t)_deviceTypeForUnknownIPod:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend(a3, "substringFromIndex:", 4), "componentsSeparatedByString:", CFSTR(","));
  if (objc_msgSend(v3, "count") != 2)
    return 3;
  if (objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "integerValue") <= 4)
    return 3;
  return 3006;
}

- (id)_diskCapacityString
{
  void *v2;
  void *v3;
  double v4;
  long double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v11;

  v2 = (void *)MGCopyAnswer();
  v3 = (void *)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DE2CC0]);
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 1.79769313e308;
  }

  v6 = log2(v5);
  v7 = exp2(ceil(v6));
  v8 = 0;
  v9 = 1024.0;
  while (1)
  {
    if (v7 < v9)
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f%@"), v7 / (v9 * 0.0009765625), *(__CFString **)((char *)&off_1E47BC0E0 + v8));
    if (v7 == v9)
      break;
    v9 = v9 * 1024.0;
    v8 += 8;
    if (v8 == 56)
      return 0;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("1%@"), *(__CFString **)((char *)&off_1E47BC0E0 + v8 + 8), v11);
}

- (void)_invalidateAutomaticDownloadKinds
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SSDevice__invalidateAutomaticDownloadKinds__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __45__SSDevice__invalidateAutomaticDownloadKinds__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *global_queue;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  if (v2)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    v1 = *(_QWORD *)(a1 + 32);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SSDevice__invalidateAutomaticDownloadKinds__block_invoke_2;
  block[3] = &unk_1E47B8B68;
  block[4] = v1;
  dispatch_async(global_queue, block);
}

uint64_t __45__SSDevice__invalidateAutomaticDownloadKinds__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SSDeviceAutomaticDownloadKindsChangedNotification"), *(_QWORD *)(a1 + 32));
}

- (void)_invalidatePhoneNumber
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SSDevice__invalidatePhoneNumber__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __34__SSDevice__invalidatePhoneNumber__block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
}

- (void)_invalidateSoftwareCUID
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SSDevice__invalidateSoftwareCUID__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __35__SSDevice__invalidateSoftwareCUID__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *global_queue;
  _QWORD block[5];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  if (v1)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__SSDevice__invalidateSoftwareCUID__block_invoke_2;
    block[3] = &unk_1E47B8B68;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(global_queue, block);
  }
}

uint64_t __35__SSDevice__invalidateSoftwareCUID__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SSDeviceSoftwareLibraryIdentifierChangedNotification"), *(_QWORD *)(a1 + 32));
}

- (BOOL)_is720pCapable
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  BOOL v5;

  v2 = (const __CFBoolean *)MGCopyAnswer();
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
  CFRelease(v3);
  return v5;
}

- (BOOL)_is1080pCapable
{
  int v3;
  float v4;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  CFTypeID v7;
  BOOL v8;

  v3 = -[SSDevice _screenClass](self, "_screenClass");
  if (-[SSDevice _deviceClass](self, "_deviceClass") != 3 && v3 != 9 && v3 != 15 && v3 != 18 && v3 != 19)
    return 0;
  GSMainScreenScaleFactor();
  if (v4 <= 1.0)
    return 0;
  v5 = (const __CFBoolean *)MGCopyAnswer();
  if (!v5)
    return 0;
  v6 = v5;
  v7 = CFGetTypeID(v5);
  v8 = v7 == CFBooleanGetTypeID() && CFBooleanGetValue(v6) != 0;
  CFRelease(v6);
  return v8;
}

- (id)_newLegacyUserAgent:(BOOL *)a3
{
  void *v5;
  int v6;
  const __CFString *v7;
  const __CFBoolean *v8;
  const __CFBoolean *v9;
  CFTypeID v10;
  const __CFString *v11;
  id v12;
  id v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  id v17;
  id v18;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("iTunes-"));
  v6 = MGGetSInt32Answer();
  switch(v6)
  {
    case 4:
      v7 = CFSTR("AppleTV");
      break;
    case 3:
      v8 = (const __CFBoolean *)MGCopyAnswer();
      if (v8)
      {
        v9 = v8;
        v10 = CFGetTypeID(v8);
        if (v10 == CFBooleanGetTypeID() && CFBooleanGetValue(v9))
          v11 = CFSTR("iPad-M");
        else
          v11 = CFSTR("iPad");
        objc_msgSend(v5, "appendString:", v11);
        CFRelease(v9);
        goto LABEL_15;
      }
      v7 = CFSTR("iPad");
      break;
    case 1:
      v7 = CFSTR("iPhone");
      break;
    default:
      v7 = CFSTR("iPod");
      break;
  }
  objc_msgSend(v5, "appendString:", v7);
LABEL_15:
  v12 = -[SSDevice _productVersion](self, "_productVersion");
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v5, "appendFormat:", CFSTR("/%@"), v12);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = -[SSDevice _deviceType](self, "_deviceType");
  v15 = 0;
  v16 = &qword_1E47BBE40;
  while (*(v16 - 2) != v14)
  {
    ++v15;
    v16 += 3;
    if (v15 == 27)
      goto LABEL_23;
  }
  if (((0x20201uLL >> v15) & 1) == 0)
    objc_msgSend(v13, "addObject:", *v16);
LABEL_23:
  v17 = -[SSDevice _diskCapacityString](self, "_diskCapacityString");
  if (v17)
    objc_msgSend(v13, "addObject:", v17);
  v18 = -[SSDevice _fairPlayDeviceTypeString](self, "_fairPlayDeviceTypeString");
  if (v18)
    objc_msgSend(v13, "addObject:", v18);
  if (objc_msgSend(v13, "count"))
    objc_msgSend(v5, "appendFormat:", CFSTR(" (%@)"), objc_msgSend(v13, "componentsJoinedByString:", CFSTR("; ")));

  if (a3)
    *a3 = v18 != 0;
  return v5;
}

- (void)_postStoreFrontDidChangeNotification
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (+[SSDevice setCachedAvailableItemKinds:](SSDevice, "setCachedAvailableItemKinds:", 0))
    CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SSDevice__postStoreFrontDidChangeNotification__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __48__SSDevice__postStoreFrontDidChangeNotification__block_invoke(uint64_t a1)
{
  void *v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SSDeviceAvailableItemKindsChangedNotification"), *(_QWORD *)(a1 + 32));
  return objc_msgSend(v2, "postNotificationName:object:", CFSTR("SSDeviceStoreFrontChangedNotification"), *(_QWORD *)(a1 + 32));
}

- (void)_reloadPluggedInState
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t state64;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  notify_get_state(self->_pluggedInToken, &state64);
  v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v3)
    v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_INFO))
    v5 &= 2u;
  if (v5)
  {
    v6 = objc_opt_class();
    v18 = 138412546;
    v19 = v6;
    v20 = 2048;
    v21 = state64;
    LODWORD(v16) = 22;
    v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v18, v16);
      free(v8);
      SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
    }
  }
  self->_pluggedIn = state64 != 0;
}

- (int)_screenClass
{
  void *v2;
  int v3;

  v2 = (void *)MGCopyAnswer();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "intValue");
  else
    v3 = -1;

  return v3;
}

- (void)_updateAutomaticDownloadKinds:(id)a3 withValue:(id)a4 completionBlock:(id)a5
{
  id v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  xpc_object_t v21;
  SSXPCConnection *v22;
  uint64_t v23;
  _QWORD v24[6];
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (MGGetBoolAnswer() && _os_feature_enabled_impl())
  {
    v8 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v8)
      v8 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v11 = v10;
    else
      v11 = v10 & 2;
    if (v11)
    {
      v25 = 136446210;
      v26 = "-[SSDevice _updateAutomaticDownloadKinds:withValue:completionBlock:]";
      LODWORD(v23) = 12;
      v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v25, v23);
        free(v13);
        SSFileLog(v8, CFSTR("%@"), v15, v16, v17, v18, v19, v20, v14);
      }
    }
  }
  v21 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v21, "0", 75);
  SSXPCDictionarySetCFObject(v21, "1", (__CFString *)objc_msgSend(a3, "allObjects"));
  SSXPCDictionarySetCFObject(v21, "2", (__CFString *)a4);
  v22 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __68__SSDevice__updateAutomaticDownloadKinds_withValue_completionBlock___block_invoke;
  v24[3] = &unk_1E47B8EE0;
  v24[4] = v22;
  v24[5] = a5;
  -[SSXPCConnection sendMessage:withReply:](v22, "sendMessage:withReply:", v21, v24);
  xpc_release(v21);
}

void __68__SSDevice__updateAutomaticDownloadKinds_withValue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *global_queue;
  _QWORD v5[5];
  char v6;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = a2;
    if (a2)
      LOBYTE(v3) = MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_BOOL(v3, "0");
    global_queue = dispatch_get_global_queue(0, 0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__SSDevice__updateAutomaticDownloadKinds_withValue_completionBlock___block_invoke_2;
    v5[3] = &unk_1E47BC0C0;
    v5[4] = *(_QWORD *)(a1 + 40);
    v6 = (char)v3;
    dispatch_async(global_queue, v5);
  }

}

uint64_t __68__SSDevice__updateAutomaticDownloadKinds_withValue_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_updateBatteryLevelFromService:(unsigned int)a3
{
  const __CFAllocator *v5;
  void *CFProperty;
  void *v7;
  const void *v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  NSObject *global_queue;
  _QWORD block[5];

  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("MaxCapacity"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v7 = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("CurrentCapacity"), v5, 0);
  v8 = v7;
  if (CFProperty)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (!CFProperty)
    {
      if (!v7)
        return;
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v7, "doubleValue");
    v11 = v10;
    objc_msgSend(CFProperty, "doubleValue");
    self->_batteryLevel = v11 / v12;
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__SSDevice__updateBatteryLevelFromService___block_invoke;
    block[3] = &unk_1E47B8B68;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
  CFRelease(CFProperty);
  if (!v8)
    return;
LABEL_8:
  CFRelease(v8);
}

uint64_t __43__SSDevice__updateBatteryLevelFromService___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SSDeviceBatteryLevelChangedNotification"), *(_QWORD *)(a1 + 32));
}

- (id)_userAgentClientNameForAppleTVBundleID:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.")))
    v4 = (void *)objc_msgSend(a3, "substringFromIndex:", objc_msgSend(CFSTR("com.apple."), "length"));
  else
    v4 = 0;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("lowtide")))
    return CFSTR("AppleTV");
  else
    return v4;
}

- (BOOL)isStoreFrontIdentifierTransient
{
  return 0;
}

- (id)synchedStoreFrontIdentifier
{
  return 0;
}

@end
