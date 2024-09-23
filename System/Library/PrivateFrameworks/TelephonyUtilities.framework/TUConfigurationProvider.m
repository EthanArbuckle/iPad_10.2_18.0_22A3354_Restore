@implementation TUConfigurationProvider

- (TUConfigurationProvider)init
{
  ConfigurationProviderDarwinNotifier *v3;
  TUConfigurationProvider *v4;

  v3 = objc_alloc_init(ConfigurationProviderDarwinNotifier);
  v4 = -[TUConfigurationProvider initWithNotifier:](self, "initWithNotifier:", v3);

  return v4;
}

- (TUConfigurationProvider)initWithNotifier:(id)a3
{
  id v5;
  TUConfigurationProvider *v6;
  TUUserConfiguration *v7;
  TUUserConfiguration *userConfiguration;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  TUCarrierBundleControllerProtocol *v12;
  TUCarrierBundleControllerProtocol *carrierBundleController;
  NSObject *v14;
  dispatch_queue_t v15;
  uint64_t v16;
  CoreTelephonyClient *coreTelephonyClient;
  LiveLookupManagerProxy *v18;
  LiveLookupManagerProxy *liveLookupExtensionManager;
  NSObject *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  objc_super v25;
  id location[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TUConfigurationProvider;
  v6 = -[TUConfigurationProvider init](&v25, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(TUUserConfiguration);
    userConfiguration = v6->_userConfiguration;
    v6->_userConfiguration = v7;

    objc_storeStrong((id *)&v6->_configurationProviderNotifier, a3);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v9 = (void *)getTPSCarrierBundleControllerClass_softClass;
    v30 = getTPSCarrierBundleControllerClass_softClass;
    v10 = MEMORY[0x1E0C809B0];
    if (!getTPSCarrierBundleControllerClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = __getTPSCarrierBundleControllerClass_block_invoke;
      location[3] = &unk_1E38A1710;
      location[4] = &v27;
      __getTPSCarrierBundleControllerClass_block_invoke((uint64_t)location);
      v9 = (void *)v28[3];
    }
    v11 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v27, 8);
    v12 = (TUCarrierBundleControllerProtocol *)objc_alloc_init(v11);
    carrierBundleController = v6->_carrierBundleController;
    v6->_carrierBundleController = v12;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("TUConfigurationProviderQueue", v14);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v15);
    coreTelephonyClient = v6->_coreTelephonyClient;
    v6->_coreTelephonyClient = (CoreTelephonyClient *)v16;

    v18 = objc_alloc_init(LiveLookupManagerProxy);
    liveLookupExtensionManager = v6->_liveLookupExtensionManager;
    v6->_liveLookupExtensionManager = v18;

    objc_initWeak(location, v6);
    v20 = MEMORY[0x1E0C80D38];
    v21 = MEMORY[0x1E0C80D38];
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __44__TUConfigurationProvider_initWithNotifier___block_invoke;
    v23[3] = &unk_1E38A1698;
    objc_copyWeak(&v24, location);
    notify_register_dispatch("com.apple.telephonyutilities.configurationChanged", &v6->_token, v20, v23);

    objc_destroyWeak(&v24);
    objc_destroyWeak(location);

  }
  return v6;
}

void __44__TUConfigurationProvider_initWithNotifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint8_t v6[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Notification observed from TUConfigurationChangedNotification, notifying delegate", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationChanged");

  }
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)TUConfigurationProvider;
  -[TUConfigurationProvider dealloc](&v3, sel_dealloc);
}

- (BOOL)isSIMAvailable
{
  void *v2;
  void *v3;
  BOOL v4;

  -[TUConfigurationProvider carrierBundleController](self, "carrierBundleController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeSubscriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isCallReportingAvailable
{
  void *v2;
  BOOL v3;

  if (!-[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType") == 2;

  return v3;
}

- (BOOL)isSIMPINAvailable
{
  void *v2;
  BOOL v3;

  if (!-[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType") == 2;

  return v3;
}

- (BOOL)isMyNumberAvailable
{
  void *v2;
  BOOL v3;

  if (!-[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType") == 2;

  return v3;
}

- (BOOL)isWiFiCallingAvailable
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _UNKNOWN **v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[TUConfigurationProvider carrierBundleController](self, "carrierBundleController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeSubscriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    v7 = &off_1E389E000;
    v22 = *(_QWORD *)v29;
    v23 = v3;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isSimHidden", v22) & 1) == 0)
        {
          objc_msgSend(v7[402], "senderIdentityCapabilities");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v25 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
                objc_msgSend(v16, "senderIdentityUUID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "uuid");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v17, "isEqual:", v18))
                {
                  v19 = objc_msgSend(v16, "supportsWiFiCalling");

                  if ((v19 & 1) != 0)
                  {

                    v20 = 1;
                    v3 = v23;
                    goto LABEL_23;
                  }
                }
                else
                {

                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v13);
          }

          v6 = v22;
          v3 = v23;
          v7 = &off_1E389E000;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      v20 = 0;
    }
    while (v5);
  }
  else
  {
    v20 = 0;
  }
LABEL_23:

  return v20;
}

- (BOOL)isNetworkSelectionAvailable
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  char v17;
  BOOL v18;
  __int128 v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[TUConfigurationProvider carrierBundleController](self, "carrierBundleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSubscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v23;
    *(_QWORD *)&v6 = 138412546;
    v20 = v6;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isSimHidden", v20) & 1) == 0)
        {
          -[TUConfigurationProvider carrierBundleController](self, "carrierBundleController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "telephonyClient");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0;
          objc_msgSend(v12, "isNetworkSelectionMenuAvailable:error:", v10, &v21);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v21;

          if (!v13)
          {
            objc_msgSend(v14, "domain");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              TUDefaultLog();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v20;
                v27 = v14;
                v28 = 2112;
                v29 = v10;
                _os_log_error_impl(&dword_19A50D000, v16, OS_LOG_TYPE_ERROR, "Retrieving cellular network selection information failed with error %@ for %@.", buf, 0x16u);
              }

            }
          }
          v17 = objc_msgSend(v13, "BOOLValue");

          if ((v17 & 1) != 0)
          {
            v18 = 1;
            goto LABEL_17;
          }
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v7)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_17:

  return v18;
}

- (BOOL)isCallForwardingAvailable
{
  void *v3;
  BOOL v4;

  if (!-[TUConfigurationProvider isSystemCapabilityAvailableForName:](self, "isSystemCapabilityAvailableForName:", *MEMORY[0x1E0CA78B0])|| !-[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable"))
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceType") == 2;

  return v4;
}

- (BOOL)isRelayPrimaryAvailable
{
  return (+[TUCallCapabilities supportsThumperCalling](TUCallCapabilities, "supportsThumperCalling")
       || +[TUCallCapabilities supportsRelayCalling](TUCallCapabilities, "supportsRelayCalling"))
      && +[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling")
      && +[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls](TUCallCapabilities, "supportsDisplayingFaceTimeVideoCalls");
}

- (BOOL)isRelaySecondaryAvailable
{
  return !+[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling")
      && +[TUCallCapabilities supportsThumperCalling](TUCallCapabilities, "supportsThumperCalling");
}

- (BOOL)isDialAssistAvailable
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TUConfigurationProvider carrierBundleController](self, "carrierBundleController", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSubscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        if (-[TUConfigurationProvider supportsDialAssistForSubscriptionContext:](self, "supportsDialAssistForSubscriptionContext:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i)))
        {
          objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "deviceType");

          if (v10 == 2)
          {
            v11 = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)isShowMyCallerIDAvailable
{
  void *v3;
  BOOL v4;

  if (!-[TUConfigurationProvider isSystemCapabilityAvailableForName:](self, "isSystemCapabilityAvailableForName:", *MEMORY[0x1E0CA78C0])|| !-[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable"))
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceType") == 2;

  return v4;
}

- (BOOL)isCallWaitingAvailable
{
  void *v3;
  BOOL v4;

  if (!-[TUConfigurationProvider isSystemCapabilityAvailableForName:](self, "isSystemCapabilityAvailableForName:", *MEMORY[0x1E0CA78B8])|| !-[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable"))
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceType") == 2;

  return v4;
}

- (BOOL)isILClassificationAvailable
{
  void *v2;
  BOOL v3;

  if (!-[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType") == 2;

  return v3;
}

- (BOOL)isIncomingCallsAvailableForPhone
{
  void *v2;
  BOOL v3;

  if (!-[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType") == 2;

  return v3;
}

- (BOOL)isCallAnnouncementAvailableForPhone
{
  void *v2;
  BOOL v3;

  if (!-[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType") == 2;

  return v3;
}

- (BOOL)isShareNameAndPhotosAvailable
{
  return -[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable")
      || -[TUConfigurationProvider isFaceTimeEnabledInSettings](self, "isFaceTimeEnabledInSettings");
}

- (BOOL)isRespondwithTextAvailable
{
  void *v2;
  BOOL v3;

  if (!-[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType") == 2;

  return v3;
}

- (BOOL)isBlockedContactsAvailable
{
  void *v2;
  BOOL v3;

  if (!-[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType") == 2;

  return v3;
}

- (BOOL)isAutomaticProminenceAvailable
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = -[TUConfigurationProvider isFaceTimeEnabledInSettings](self, "isFaceTimeEnabledInSettings");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "multiwaySupported");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)isLivePhotosAvailable
{
  _BOOL4 v2;

  v2 = -[TUConfigurationProvider isFaceTimeEnabledInSettings](self, "isFaceTimeEnabledInSettings");
  if (v2)
    LOBYTE(v2) = !+[TUMomentsController isFaceTimePhotosRestricted](TUMomentsController, "isFaceTimePhotosRestricted");
  return v2;
}

- (BOOL)isCallIdentificationAppsAvailable
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  BOOL v8;
  uint8_t v10[16];
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C932D8]);
  v4 = dispatch_semaphore_create(0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__TUConfigurationProvider_isCallIdentificationAppsAvailable__block_invoke;
  v11[3] = &unk_1E38A3C80;
  v13 = &v14;
  v5 = v4;
  v12 = v5;
  objc_msgSend(v3, "extensionsWithCompletionHandler:", v11);
  v6 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "isCallIdentificationAppsAvailable did not return before the semaphore timeout", v10, 2u);
    }

  }
  if (-[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable"))
    v8 = *((_BYTE *)v15 + 24) != 0;
  else
    v8 = 0;

  _Block_object_dispose(&v14, 8);
  return v8;
}

intptr_t __60__TUConfigurationProvider_isCallIdentificationAppsAvailable__block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "count") != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isLiveLookupAvailable
{
  void *v3;
  uint64_t v4;
  BOOL result;

  -[TUConfigurationProvider liveLookupExtensionManager](self, "liveLookupExtensionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "extensionCount");

  result = -[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable");
  if (!v4)
    return 0;
  return result;
}

- (BOOL)isCallBlockingAndIdentificationAvailable
{
  return -[TUConfigurationProvider isBrandedCallingAvailable](self, "isBrandedCallingAvailable")
      || -[TUConfigurationProvider isBusinessConnectCallingAvailable](self, "isBusinessConnectCallingAvailable")
      || -[TUConfigurationProvider isSilenceJunkCallingEnabled](self, "isSilenceJunkCallingEnabled")
      || -[TUConfigurationProvider isCallIdentificationAppsAvailable](self, "isCallIdentificationAppsAvailable")
      || -[TUConfigurationProvider isLiveLookupAvailable](self, "isLiveLookupAvailable");
}

- (BOOL)isFaceTimeEnabledInSettings
{
  id v2;
  void *v3;
  char v4;

  v2 = objc_alloc(MEMORY[0x1E0D34380]);
  v3 = (void *)objc_msgSend(v2, "initWithQueue:", MEMORY[0x1E0C80D38]);
  v4 = objc_msgSend(v3, "isFaceTimeEnabled");

  return v4;
}

- (BOOL)isCallRecordingAvailable
{
  int v2;

  v2 = -[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable");
  if (v2)
    LOBYTE(v2) = TUCallRecordingActivatable(0);
  return v2;
}

- (BOOL)isCallScreeningAvailable
{
  void *v2;
  BOOL v3;

  if (!-[TUConfigurationProvider isSIMAvailable](self, "isSIMAvailable"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType") == 2 && TUCallScreeningActivatable(0, 0);

  return v3;
}

- (BOOL)isCallScreeningEnabled
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[TUConfigurationProvider isCallScreeningAvailable](self, "isCallScreeningAvailable");
  if (v3)
  {
    -[TUConfigurationProvider userConfiguration](self, "userConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCallScreeningEnabled");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setCallScreeningEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[TUConfigurationProvider isCallScreeningAvailable](self, "isCallScreeningAvailable"))
  {
    -[TUConfigurationProvider userConfiguration](self, "userConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCallScreeningEnabled:", v3);

    -[TUConfigurationProvider postConfigurationChangedNotification](self, "postConfigurationChangedNotification");
  }
}

- (BOOL)isSilenceUnknownCallersEnabledForFaceTime
{
  void *v2;
  char v3;

  -[TUConfigurationProvider userConfiguration](self, "userConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSilenceUnknownCallersEnabledForFaceTime");

  return v3;
}

- (BOOL)isSilenceUnknownCallersEnabledForPhone
{
  void *v2;
  char v3;

  -[TUConfigurationProvider userConfiguration](self, "userConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSilenceUnknownCallersEnabledForPhone");

  return v3;
}

- (void)setSilenceUnknownCallersEnabledForFaceTime:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[TUConfigurationProvider userConfiguration](self, "userConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSilenceUnknownCallersEnabledForFaceTime:", v3);

  -[TUConfigurationProvider postConfigurationChangedNotification](self, "postConfigurationChangedNotification");
}

- (void)setSilenceUnknownCallersEnabledForPhone:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[TUConfigurationProvider userConfiguration](self, "userConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSilenceUnknownCallersEnabledForPhone:", v3);

  -[TUConfigurationProvider postConfigurationChangedNotification](self, "postConfigurationChangedNotification");
}

- (BOOL)isBrandedCallingAvailable
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TUConfigurationProvider carrierBundleController](self, "carrierBundleController", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSubscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        if (-[TUConfigurationProvider supportsBrandedCallingForSubscriptionContext:](self, "supportsBrandedCallingForSubscriptionContext:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i)))
        {
          objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "deviceType");

          if (v10 == 2)
          {
            v11 = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)isBrandedCallingEnabled:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  if (a3)
    v4 = 1;
  else
    v4 = 2;
  v17 = 0uLL;
  v18 = 0uLL;
  -[TUConfigurationProvider carrierBundleController](self, "carrierBundleController", (_QWORD)v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeSubscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (-[TUConfigurationProvider supportsBrandedCallingForSubscriptionContext:](self, "supportsBrandedCallingForSubscriptionContext:", v11)&& objc_msgSend(v11, "slotID") == v4)
        {
          -[TUConfigurationProvider userConfiguration](self, "userConfiguration");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v13, "isBrandedCallingEnabled:", v11);

          goto LABEL_15;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (void)setBrandedCallingEnabled:(BOOL)a3 primary:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  if (a4)
    v6 = 1;
  else
    v6 = 2;
  v17 = 0uLL;
  v18 = 0uLL;
  -[TUConfigurationProvider carrierBundleController](self, "carrierBundleController", (_QWORD)v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeSubscriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (-[TUConfigurationProvider supportsBrandedCallingForSubscriptionContext:](self, "supportsBrandedCallingForSubscriptionContext:", v13)&& objc_msgSend(v13, "slotID") == v6)
        {
          -[TUConfigurationProvider userConfiguration](self, "userConfiguration");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setBrandedCallingEnabled:subscription:", v4, v13);

          -[TUConfigurationProvider postConfigurationChangedNotification](self, "postConfigurationChangedNotification");
          goto LABEL_15;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_15:

}

- (BOOL)isBusinessConnectCallingAvailable
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TUConfigurationProvider carrierBundleController](self, "carrierBundleController", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSubscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        if (-[TUConfigurationProvider supportsBusinessConnectCallingForSubscriptionContext:](self, "supportsBusinessConnectCallingForSubscriptionContext:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i)))
        {
          objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "deviceType");

          if (v10 == 2)
          {
            v11 = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)isBusinessConnectCallingEnabled
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[TUConfigurationProvider isBusinessConnectCallingAvailable](self, "isBusinessConnectCallingAvailable");
  if (v3)
  {
    -[TUConfigurationProvider userConfiguration](self, "userConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isBusinessConnectCallingEnabled");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setBusinessConnectCallingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[TUConfigurationProvider isBusinessConnectCallingAvailable](self, "isBusinessConnectCallingAvailable"))
  {
    -[TUConfigurationProvider userConfiguration](self, "userConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBusinessConnectCallingEnabled:", v3);

    -[TUConfigurationProvider postConfigurationChangedNotification](self, "postConfigurationChangedNotification");
  }
}

- (BOOL)isSilenceJunkCallingAvailable
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[TUConfigurationProvider carrierBundleController](self, "carrierBundleController", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSubscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[TUConfigurationProvider supportsCallBlockingForSubscriptionContext:](self, "supportsCallBlockingForSubscriptionContext:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)isSilenceJunkCallingEnabled
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[TUConfigurationProvider isSilenceJunkCallingAvailable](self, "isSilenceJunkCallingAvailable");
  if (v3)
  {
    -[TUConfigurationProvider userConfiguration](self, "userConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSilenceJunkCallingEnabled");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setSilenceJunkCallingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[TUConfigurationProvider isSilenceJunkCallingAvailable](self, "isSilenceJunkCallingAvailable"))
  {
    -[TUConfigurationProvider userConfiguration](self, "userConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSilenceJunkCallingEnabled:", v3);

    -[TUConfigurationProvider postConfigurationChangedNotification](self, "postConfigurationChangedNotification");
  }
}

- (BOOL)supportsBrandedCallingForSubscriptionContext:(id)a3
{
  id v4;
  CoreTelephonyClient *coreTelephonyClient;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  const __CFString *v12;
  id v14;
  char v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  coreTelephonyClient = self->_coreTelephonyClient;
  v6 = *MEMORY[0x1E0CA7180];
  v14 = 0;
  -[CoreTelephonyClient context:canSetCapability:allowed:with:](coreTelephonyClient, "context:canSetCapability:allowed:with:", v4, v6, &v15, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[TUConfigurationProvider supportsBrandedCallingForSubscriptionContext:].cold.1();

    v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("Yes");
      if (!v15)
        v12 = CFSTR("No");
      *(_DWORD *)buf = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "kCTCapabilityBrandedCallingInfo fetched for context: %@, capability enabled: %@", buf, 0x16u);
    }

    v11 = v15 != 0;
  }

  return v11;
}

- (id)systemCapabilitiesForSubscriptionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;

  v4 = a3;
  -[TUConfigurationProvider coreTelephonyClient](self, "coreTelephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "context:getSystemCapabilities:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (!v6)
  {
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      TUDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[TUConfigurationProvider systemCapabilitiesForSubscriptionContext:].cold.1();

    }
  }

  return v6;
}

- (BOOL)supportsBusinessConnectCallingForSubscriptionContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  -[TUConfigurationProvider stringForKeyHierarchy:subscriptionContext:error:](self, "stringForKeyHierarchy:subscriptionContext:error:", &unk_1E38E98B8, v4, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v7 = v6;
  if (v5)
  {
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Retrieved verstat feature capability value '%@' for subscription %@", buf, 0x16u);
    }

    v9 = objc_msgSend(v5, "isEqualToIgnoringCase:", CFSTR("Disabled")) ^ 1;
  }
  else
  {
    if (v6)
    {
      TUDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v7;
        _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Retrieving verstat feature capability value for subscription %@ failed with error %@", buf, 0x16u);
      }

    }
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)supportsCallBlockingForSubscriptionContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  char v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  -[TUConfigurationProvider stringForKeyHierarchy:subscriptionContext:error:](self, "stringForKeyHierarchy:subscriptionContext:error:", &unk_1E38E98D0, v4, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v7 = v6;
  if (v5)
  {
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = v4;
      v9 = "Retrieved call blocking value '%@' for subscription %@";
LABEL_7:
      _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);
    }
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = v7;
      v9 = "Retrieving call blocking value for subscription %@ failed with error %@";
      goto LABEL_7;
    }
  }

LABEL_9:
  if ((objc_msgSend(v5, "isEqualToIgnoringCase:", CFSTR("Enabled")) & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v5, "isEqualToIgnoringCase:", CFSTR("Dynamic"));

  return v10;
}

- (BOOL)supportsDialAssistForSubscriptionContext:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  char v7;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  -[TUConfigurationProvider objectForKeyHierarchy:subscriptionContext:error:](self, "objectForKeyHierarchy:subscriptionContext:error:", &unk_1E38E98E8, a3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v5)
  {
    TUDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      _os_log_error_impl(&dword_19A50D000, v6, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);

    }
  }
  else
  {
    if (!v4)
    {
      v7 = 1;
      goto LABEL_6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v4, "BOOLValue");
      goto LABEL_6;
    }
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = (objc_class *)MEMORY[0x1E0CA6D00];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithBundleType:", 1);
  -[TUConfigurationProvider carrierBundleController](self, "carrierBundleController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "telephonyClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyCarrierBundleValue:keyHierarchy:bundleType:error:", v9, v10, v11, a5);

  return v14;
}

- (id)stringForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  void *v5;
  id v6;

  -[TUConfigurationProvider objectForKeyHierarchy:subscriptionContext:error:](self, "objectForKeyHierarchy:subscriptionContext:error:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (BOOL)supportsSystemCapabilityWithName:(id)a3 subscriptionContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[TUConfigurationProvider systemCapabilitiesForSubscriptionContext:](self, "systemCapabilitiesForSubscriptionContext:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = objc_msgSend(v9, "BOOLValue");
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isSystemCapabilityAvailableForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TUConfigurationProvider carrierBundleController](self, "carrierBundleController", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeSubscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isSimHidden") & 1) == 0
          && -[TUConfigurationProvider supportsSystemCapabilityWithName:subscriptionContext:](self, "supportsSystemCapabilityWithName:subscriptionContext:", v4, v11))
        {
          v12 = 1;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (void)postConfigurationChangedNotification
{
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "%@ postConfigurationChangedNotification", (uint8_t *)&v6, 0xCu);

  }
  -[TUConfigurationProvider configurationProviderNotifier](self, "configurationProviderNotifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postConfigurationChanged");

}

- (TUConfigurationProviderDelegate)delegate
{
  return (TUConfigurationProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (TUConfigurationProviderNotifier)configurationProviderNotifier
{
  return self->_configurationProviderNotifier;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (LiveLookupManagerProxy)liveLookupExtensionManager
{
  return self->_liveLookupExtensionManager;
}

- (int)token
{
  return self->_token;
}

- (TUCarrierBundleControllerProtocol)carrierBundleController
{
  return self->_carrierBundleController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierBundleController, 0);
  objc_storeStrong((id *)&self->_liveLookupExtensionManager, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_configurationProviderNotifier, 0);
  objc_storeStrong((id *)&self->_userConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)supportsBrandedCallingForSubscriptionContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19A50D000, v0, v1, "Failed to fetch kCTCapabilityBrandedCallingInfo for context:%@ , error: %@");
}

- (void)systemCapabilitiesForSubscriptionContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19A50D000, v0, v1, "Retrieving system capability information failed with error %@ for %@.");
}

@end
