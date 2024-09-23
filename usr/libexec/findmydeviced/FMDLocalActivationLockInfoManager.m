@implementation FMDLocalActivationLockInfoManager

+ (id)sharedInstance
{
  if (qword_1003064D0 != -1)
    dispatch_once(&qword_1003064D0, &stru_1002C1FC0);
  return (id)qword_1003064C8;
}

- (FMDLocalActivationLockInfoManager)init
{
  FMDLocalActivationLockInfoManager *v2;
  FMDLocalActivationLockInfoNVRAMStore *v3;
  FMDLocalActivationLockInfoStore *store;
  dispatch_queue_t v5;
  OS_dispatch_queue *storeAccessQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDLocalActivationLockInfoManager;
  v2 = -[FMDLocalActivationLockInfoManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(FMDLocalActivationLockInfoNVRAMStore);
    store = v2->_store;
    v2->_store = (FMDLocalActivationLockInfoStore *)v3;

    v5 = dispatch_queue_create("com.apple.icloud.findmydeviced.storeAccessQ", 0);
    storeAccessQueue = v2->_storeAccessQueue;
    v2->_storeAccessQueue = (OS_dispatch_queue *)v5;

    -[FMDLocalActivationLockInfoManager _cacheLocalState](v2, "_cacheLocalState");
    -[FMDLocalActivationLockInfoManager _setupSPStatusListener](v2, "_setupSPStatusListener");
  }
  return v2;
}

- (void)_cacheLocalState
{
  NSObject *v3;
  _QWORD block[5];

  if (-[FMDLocalActivationLockInfoManager _isFeatureEnabled](self, "_isFeatureEnabled"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager storeAccessQueue](self, "storeAccessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002258C;
    block[3] = &unk_1002C1328;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

- (void)_setupSPStatusListener
{
  void *v3;
  SPSettingsConfigurating *v4;
  SPSettingsConfigurating *settingsConfig;
  void *v6;
  _QWORD v7[5];

  if (-[FMDLocalActivationLockInfoManager _isFeatureEnabled](self, "_isFeatureEnabled"))
  {
    v3 = (void *)objc_opt_new(SPOwnerInterface);
    v4 = (SPSettingsConfigurating *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "settingsConfiguration"));
    settingsConfig = self->_settingsConfig;
    self->_settingsConfig = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager settingsConfig](self, "settingsConfig"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100022868;
    v7[3] = &unk_1002C1FE8;
    v7[4] = self;
    objc_msgSend(v6, "beginRefreshingServiceStateWithBlock:", v7);

  }
}

- (void)updateActivationLockStatus:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  if (-[FMDLocalActivationLockInfoManager _isFeatureEnabled](self, "_isFeatureEnabled"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager storeAccessQueue](self, "storeAccessQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100022A24;
    v6[3] = &unk_1002C2010;
    v6[4] = self;
    v7 = a3;
    dispatch_async(v5, v6);

  }
}

- (void)updateOfflineFindingStatus:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  if (-[FMDLocalActivationLockInfoManager _isFeatureEnabled](self, "_isFeatureEnabled"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager storeAccessQueue](self, "storeAccessQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100022C24;
    v6[3] = &unk_1002C2010;
    v7 = a3;
    v6[4] = self;
    dispatch_async(v5, v6);

  }
}

- (void)updateMaskedAppleID:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;

  v4 = a3;
  if (-[FMDLocalActivationLockInfoManager _isFeatureEnabled](self, "_isFeatureEnabled"))
  {
    if (!v4)
    {
      v5 = sub_1000031B8();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager fm_logID](self, "fm_logID"));
        v18 = 138412290;
        v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ cannot update maskedAppleID. Nil value provided", (uint8_t *)&v18, 0xCu);

      }
    }
    v8 = objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager maskedAppleID](self, "maskedAppleID"));
    if (!v8)
      goto LABEL_8;
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager maskedAppleID](self, "maskedAppleID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lowercaseString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if ((v13 & 1) == 0)
    {
LABEL_8:
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager store](self, "store"));
      objc_msgSend(v14, "updateMaskedAppleID:", v4);

      -[FMDLocalActivationLockInfoManager setMaskedAppleID:](self, "setMaskedAppleID:", v4);
      -[FMDLocalActivationLockInfoManager _postLocalActivationLockInfoChangedNotification](self, "_postLocalActivationLockInfoChangedNotification");
      v15 = sub_1000031B8();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager fm_logID](self, "fm_logID"));
        v18 = 138412546;
        v19 = v17;
        v20 = 2112;
        v21 = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ Updating stored maskedAppleID with %@", (uint8_t *)&v18, 0x16u);

      }
    }
  }

}

- (void)clearMaskedAppleIDValue
{
  NSObject *v3;
  _QWORD block[5];

  if (-[FMDLocalActivationLockInfoManager _isFeatureEnabled](self, "_isFeatureEnabled"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager storeAccessQueue](self, "storeAccessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002309C;
    block[3] = &unk_1002C1328;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

- (id)maskedAppleIDValue
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!-[FMDLocalActivationLockInfoManager _isFeatureEnabled](self, "_isFeatureEnabled"))
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000231D4;
  v11 = sub_1000231E4;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager storeAccessQueue](self, "storeAccessQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000231EC;
  v6[3] = &unk_1002C11C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)activationLockInfoWithCompletion:(id)a3
{
  id v4;
  id v5;
  void ***v6;
  NSObject *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  FMDLocalActivationLockInfoManager *v12;
  id v13;

  v4 = a3;
  if (!-[FMDLocalActivationLockInfoManager _isFeatureEnabled](self, "_isFeatureEnabled"))
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1000232E8;
  v11 = &unk_1002C2038;
  v12 = self;
  v13 = v4;
  v5 = v4;
  v6 = objc_retainBlock(&v8);
  v7 = objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager storeAccessQueue](self, "storeAccessQueue", v8, v9, v10, v11, v12));
  dispatch_async(v7, v6);

}

- (void)storeOfflineFindingInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[FMDLocalActivationLockInfoManager _isFeatureEnabled](self, "_isFeatureEnabled"))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager storeAccessQueue](self, "storeAccessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100023524;
    block[3] = &unk_1002C2088;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

- (void)fetchOfflineFindingInfoWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (!-[FMDLocalActivationLockInfoManager _isFeatureEnabled](self, "_isFeatureEnabled"))
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  v5 = objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager storeAccessQueue](self, "storeAccessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000236A0;
  v7[3] = &unk_1002C2038;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_fetchOfflineFindingInfoInternal
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager offlineFindingInfo](self, "offlineFindingInfo"));
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager store](self, "store"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "retrieveOfflineFindingInfo"));

    -[FMDLocalActivationLockInfoManager setOfflineFindingInfo:](self, "setOfflineFindingInfo:", v6);
    v4 = (void *)v6;
  }
  return v4;
}

- (void)clearOfflineFindingInfoWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[FMDLocalActivationLockInfoManager _isFeatureEnabled](self, "_isFeatureEnabled"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager storeAccessQueue](self, "storeAccessQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100023A7C;
    v6[3] = &unk_1002C2038;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)clearAllState
{
  NSObject *v3;
  _QWORD block[5];

  if (-[FMDLocalActivationLockInfoManager _isFeatureEnabled](self, "_isFeatureEnabled"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager storeAccessQueue](self, "storeAccessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100023BB8;
    block[3] = &unk_1002C1328;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

- (void)_addLocalizedStrings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _UNKNOWN **v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  FMDLocalActivationLockInfoManager *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;

  v4 = a3;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyDevice.framework")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizations"));
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager fm_logID](self, "fm_logID"));
      v10 = objc_msgSend(v6, "count");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager maskedAppleID](self, "maskedAppleID"));
      *(_DWORD *)buf = 138412802;
      v44 = v9;
      v45 = 2048;
      v46 = v10;
      v47 = 2112;
      v48 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ - fetching strings for %lu localizations for id - %@", buf, 0x20u);

    }
    v12 = &ACErrorKeychainDomain_ptr;
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v29 = v6;
    v14 = v6;
    v37 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v37)
    {
      v36 = *(_QWORD *)v39;
      v33 = kFMDActivationLockInfoTitleKey;
      v34 = kFMDActivationLockInfoDescriptionKey;
      v30 = self;
      v31 = v13;
      v32 = v14;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v39 != v36)
            objc_enumerationMutation(v14);
          v16 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12[215], "dictionary"));
          if (objc_msgSend(v4, "isActivationLocked"))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager _locKeyForALEnabled](self, "_locKeyForALEnabled"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:localization:", v18, &stru_1002CD590, 0, v16));
            if (v19)
              objc_msgSend(v17, "setValue:forKey:", v19, v33);

          }
          if (objc_msgSend(v4, "isOfflineFindingEnabled")
            && (objc_msgSend(v4, "isRestrictedSKU") & 1) == 0)
          {
            v22 = v12;
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager _locKeyForOfflineFindingEnabled](self, "_locKeyForOfflineFindingEnabled"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:localization:", v21, &stru_1002CD590, 0, v16));
            if (v23)
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager maskedAppleID](self, "maskedAppleID"));

              if (v24)
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager maskedAppleID](self, "maskedAppleID"));
                v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v25));

                self = v30;
                v13 = v31;
                objc_msgSend(v17, "setValue:forKey:", v26, v34);

              }
            }

            v12 = v22;
            v14 = v32;
          }
          else
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maskedAppleID"));

            if (!v20)
              goto LABEL_23;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maskedAppleID"));
            objc_msgSend(v17, "setValue:forKey:", v21, v34);
          }

LABEL_23:
          if (objc_msgSend(v17, "count"))
            -[NSObject setValue:forKey:](v13, "setValue:forKey:", v17, v16);

          v15 = (char *)v15 + 1;
        }
        while (v37 != v15);
        v37 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v37);
    }

    objc_msgSend(v4, "setLocaleStrings:", v13);
    v6 = v29;
  }
  else
  {
    v27 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager fm_logID](self, "fm_logID"));
      *(_DWORD *)buf = 138412290;
      v44 = v28;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ - not adding localized strings since list of localizations is nil or empty", buf, 0xCu);

    }
  }

}

- (id)_locKeyForALEnabled
{
  void *v2;
  id v3;
  const __CFString *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v3 = objc_msgSend(v2, "deviceClass");

  v4 = CFSTR("FM_ACTIVATION_LOCK_ENABLED_IPHONE_TEXT");
  if (v3 == (id)2)
    v4 = CFSTR("FM_ACTIVATION_LOCK_ENABLED_IPAD_TEXT");
  if (v3 == (id)3)
    return CFSTR("FM_ACTIVATION_LOCK_ENABLED_IPOD_TEXT");
  else
    return (id)v4;
}

- (id)_locKeyForOfflineFindingEnabled
{
  void *v2;
  id v3;
  const __CFString *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v3 = objc_msgSend(v2, "deviceClass");

  v4 = CFSTR("FM_OFFLINE_FINDING_ENABLED_IPHONE_TEXT");
  if (v3 == (id)2)
    v4 = CFSTR("FM_OFFLINE_FINDING_ENABLED_IPAD_TEXT");
  if (v3 == (id)3)
    return CFSTR("FM_OFFLINE_FINDING_ENABLED_IPOD_TEXT");
  else
    return (id)v4;
}

- (BOOL)_readIODeviceSupportsFindMy
{
  _QWORD *v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  char *CFProperty;
  char *v7;
  CFTypeID v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000244A4;
  v24[3] = &unk_1002C20B0;
  v24[4] = &v25;
  v3 = objc_retainBlock(v24);
  v4 = IOServiceNameMatching("AppleDialogSPMIPMU");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v4);
  *((_DWORD *)v26 + 6) = MatchingService;
  if (!MatchingService)
  {
    v18 = sub_1000031B8();
    v16 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager fm_logID](self, "fm_logID"));
      *(_DWORD *)buf = 138412546;
      v30 = v19;
      v31 = 2080;
      v32 = "AppleDialogSPMIPMU";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ _readIODeviceSupportsFindMy: Could not find service: %s", buf, 0x16u);

    }
    goto LABEL_12;
  }
  CFProperty = (char *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IOPMUBootLPMCtrl"), 0, 0);
  v7 = CFProperty;
  if (!CFProperty || (v8 = CFGetTypeID(CFProperty), v8 != CFDictionaryGetTypeID()))
  {
    v15 = sub_1000031B8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager fm_logID](self, "fm_logID"));
      sub_1002269A4(v17, (uint64_t)v7, buf, v16);
    }
LABEL_12:

    ((void (*)(_QWORD *))v3[2])(v3);
    v14 = 0;
    goto LABEL_13;
  }
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager fm_logID](self, "fm_logID"));
    *(_DWORD *)buf = 138412546;
    v30 = v11;
    v31 = 2112;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ _readIODeviceSupportsFindMy: PMU data == %@\n", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("lpm2")));
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "BOOLValue");
    ((void (*)(_QWORD *))v3[2])(v3);
  }
  else
  {
    v21 = sub_1000031B8();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager fm_logID](self, "fm_logID"));
      sub_100226A1C(v23, (uint64_t)v7, buf, v22);
    }

    ((void (*)(_QWORD *))v3[2])(v3);
    v14 = 0;
  }

LABEL_13:
  _Block_object_dispose(&v25, 8);
  return v14;
}

- (void)_postLocalActivationLockInfoChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kFMDLocalActivationLockInfoChangedNotification, 0, 0, 1u);
}

- (BOOL)_isFeatureEnabled
{
  return 1;
}

- (BOOL)_isWithinDaemonStartupThreshold
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDDaemon sharedInstance](FMDDaemon, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startTime"));

  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;
  if (v5 >= -3.0)
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoManager fm_logID](self, "fm_logID"));
      v11 = 138412802;
      v12 = v9;
      v13 = 2048;
      v14 = -v6;
      v15 = 2112;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ - call is within startup threshold - will need to be delayed. startTimeDelta %f, daemonStartTime %@", (uint8_t *)&v11, 0x20u);

    }
  }

  return v6 >= -3.0;
}

- (NSString)maskedAppleID
{
  return self->_maskedAppleID;
}

- (void)setMaskedAppleID:(id)a3
{
  objc_storeStrong((id *)&self->_maskedAppleID, a3);
}

- (NSNumber)activationLockStatus
{
  return self->_activationLockStatus;
}

- (void)setActivationLockStatus:(id)a3
{
  objc_storeStrong((id *)&self->_activationLockStatus, a3);
}

- (NSNumber)offlineFindingStatus
{
  return self->_offlineFindingStatus;
}

- (void)setOfflineFindingStatus:(id)a3
{
  objc_storeStrong((id *)&self->_offlineFindingStatus, a3);
}

- (NSData)offlineFindingInfo
{
  return self->_offlineFindingInfo;
}

- (void)setOfflineFindingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_offlineFindingInfo, a3);
}

- (FMDLocalActivationLockInfoStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (SPSettingsConfigurating)settingsConfig
{
  return self->_settingsConfig;
}

- (void)setSettingsConfig:(id)a3
{
  objc_storeStrong((id *)&self->_settingsConfig, a3);
}

- (OS_dispatch_queue)storeAccessQueue
{
  return self->_storeAccessQueue;
}

- (void)setStoreAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_storeAccessQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAccessQueue, 0);
  objc_storeStrong((id *)&self->_settingsConfig, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_offlineFindingInfo, 0);
  objc_storeStrong((id *)&self->_offlineFindingStatus, 0);
  objc_storeStrong((id *)&self->_activationLockStatus, 0);
  objc_storeStrong((id *)&self->_maskedAppleID, 0);
}

@end
