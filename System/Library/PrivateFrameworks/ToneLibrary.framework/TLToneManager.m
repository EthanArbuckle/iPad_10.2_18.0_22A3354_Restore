@implementation TLToneManager

- (id)defaultToneIdentifierForAlertType:(int64_t)a3
{
  return -[TLToneManager defaultToneIdentifierForAlertType:topic:](self, "defaultToneIdentifierForAlertType:topic:", a3, 0);
}

- (id)defaultToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "_defaultToneIdentifierForAlertType:topic:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_defaultToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((unint64_t)(a3 - 1) > 0x1C)
  {
    v7 = 0;
  }
  else
  {
    v7 = _TLToneManagerDefaultIdentifiers[a3 - 1];
    if (!-[__CFString length](v7, "length"))
    {
      v8 = CFSTR("<none>");

      v7 = v8;
    }
    switch(a3)
    {
      case 1:
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicIncomingCallFaceTimeGroupInvitation")) & 1) != 0)
        {
          v9 = CFSTR("texttone:FaceTime-Group-Invitation");
          goto LABEL_60;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicIncomingCallFaceTimeParticipantJoined")) & 1) != 0)
        {
          v9 = CFSTR("texttone:FaceTime-Participant-Joined");
          goto LABEL_60;
        }
        break;
      case 2:
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentHeart")) & 1) != 0)
        {
          v9 = CFSTR("texttone:Text-Message-Acknowledgment-Heart");
          goto LABEL_60;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentThumbsUp")) & 1) != 0)
        {
          v9 = CFSTR("texttone:Text-Message-Acknowledgment-Thumbs-Up");
          goto LABEL_60;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentThumbsDown")) & 1) != 0)
        {
          v9 = CFSTR("texttone:Text-Message-Acknowledgment-Thumbs-Down");
          goto LABEL_60;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentHaHa")) & 1) != 0)
        {
          v9 = CFSTR("texttone:Text-Message-Acknowledgment-HaHa");
          goto LABEL_60;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentExclamation")) & 1) != 0)
        {
          v9 = CFSTR("texttone:Text-Message-Acknowledgment-Exclamation");
          goto LABEL_60;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentQuestionMark")) & 1) != 0)
        {
          v9 = CFSTR("texttone:Text-Message-Acknowledgment-Question-Mark");
          goto LABEL_60;
        }
        break;
      case 4:
        if ((_os_feature_enabled_impl() & 1) != 0)
        {
          v9 = CFSTR("texttone:Droplet");
          goto LABEL_60;
        }
        break;
      case 5:
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilemail.bulletin-subsection.VIP")) & 1) != 0
          || (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilemail.bulletin-subsection.ThreadNotify")) & 1) != 0)
        {
          v9 = CFSTR("texttone:New Mail");
          goto LABEL_60;
        }
        break;
      case 9:
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicPhotosNotificationSharingPost")) & 1) != 0)
        {
          v9 = CFSTR("texttone:Photos Sharing Post");
          goto LABEL_60;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicPhotosNotificationMemory")) & 1) != 0)
        {
          v9 = CFSTR("texttone:Photos Memory");
          goto LABEL_60;
        }
        break;
      case 13:
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicAlarmGoToSleep")) & 1) != 0)
        {
          v9 = CFSTR("texttone:Go-To-Sleep");
          goto LABEL_60;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicAlarmWakeUp")) & 1) == 0)
          goto LABEL_37;
        v9 = CFSTR("alarmWakeUp:Early_Riser");
        goto LABEL_60;
      case 14:
LABEL_37:
        if ((_os_feature_enabled_impl() & 1) == 0)
          break;
        v9 = CFSTR("system:Radial");
        goto LABEL_60;
      case 16:
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationBackgroundMicUsage")) & 1) != 0)
        {
          v9 = CFSTR("texttone:System Background Mic Usage");
          goto LABEL_60;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationDoorbell")) & 1) != 0)
        {
          v9 = CFSTR("system:Doorbell");
          goto LABEL_60;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationElevationAlert")) & 1) != 0)
        {
          v9 = CFSTR("texttone:Elevation Alert");
          goto LABEL_60;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationHeadphoneAudioExposure")) & 1) == 0)
          break;
        v9 = CFSTR("texttone:Headphone-Audio-Exposure-Limit-Exceeded");
        goto LABEL_60;
      case 17:
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicAppNotificationCriticalAlert")) & 1) != 0)
        {
          v9 = CFSTR("texttone:App-Notification-Critical-Alert");
          goto LABEL_60;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicAppNotificationFirstParty")) & 1) != 0)
          break;
LABEL_42:
        if ((_os_feature_enabled_impl() & 1) == 0)
          break;
        v9 = CFSTR("texttone:Rebound");
        goto LABEL_60;
      case 20:
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicPassbookNFCScanComplete")) & 1) == 0)
          break;
        v9 = CFSTR("texttone:Passbook-NFC-Scan-Complete");
        goto LABEL_60;
      case 22:
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSOSCountdownTick")) & 1) != 0)
        {
          v9 = CFSTR("texttone:SOS-Countdown-Tick");
LABEL_60:

          v7 = v9;
          break;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSOSDialStart")) & 1) != 0
          || (objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSOSButtonChordingTimeout")) & 1) != 0
          || (objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSOSCountdownPreannounce")) & 1) != 0)
        {
          v9 = CFSTR("<none>");
          goto LABEL_60;
        }
        break;
      case 25:
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicHealthUrgent")) & 1) == 0)
          break;
        v9 = CFSTR("texttone:Health-Urgent");
        goto LABEL_60;
      case 29:
        goto LABEL_42;
      default:
        break;
    }
  }
  TLLogToneManagement();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = a1;
    v15 = 2114;
    v16 = v11;
    v17 = 2114;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: +_defaultToneIdentifierForAlertType:(%{public}@) topic:(%{public}@). Returning: %{public}@.", (uint8_t *)&v13, 0x2Au);

  }
  return v7;
}

+ (TLToneManager)sharedToneManager
{
  if (sharedToneManager__TLToneManagerSharedInstanceOnceToken != -1)
    dispatch_once(&sharedToneManager__TLToneManagerSharedInstanceOnceToken, &__block_literal_global);
  return (TLToneManager *)(id)sharedToneManager__TLToneManagerSharedInstance;
}

void __34__TLToneManager_sharedToneManager__block_invoke()
{
  TLToneManager *v0;
  void *v1;

  v0 = objc_alloc_init(TLToneManager);
  v1 = (void *)sharedToneManager__TLToneManagerSharedInstance;
  sharedToneManager__TLToneManagerSharedInstance = (uint64_t)v0;

}

- (TLToneManager)init
{
  return -[TLToneManager initWithITunesRingtonePlistAtPath:](self, "initWithITunesRingtonePlistAtPath:", 0);
}

- (TLToneManager)initWithITunesRingtonePlistAtPath:(id)a3
{
  id v4;
  TLToneManager *v5;
  TLAccessQueue *v6;
  TLAccessQueue *accessQueue;
  __CFString *v8;
  __CFString *v9;
  objc_class *NPSDomainAccessorClass;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  TLToneManager *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSCopying *contentProtectionStateObserverToken;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v24;
  __CFNotificationCenter *v25;
  __CFNotificationCenter *v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  TLToneManager *v31;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  TLToneManager *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)TLToneManager;
  v5 = -[TLToneManager init](&v33, sel_init);
  if (v5)
  {
    _TLAlertTypeValidateConsistencyOfEnumeration();
    v6 = -[TLAccessQueue initWithLabel:appendUUIDToLabel:]([TLAccessQueue alloc], "initWithLabel:appendUUIDToLabel:", CFSTR("_TLToneManagerAccessQueue"), 1);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = v6;

    v5->_shouldUseServiceToAccessTonePreferences = 0;
    v8 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
    v9 = v8;
    if (v8)
    {
      CFPreferencesSynchronize(v8, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      CFRelease(v9);
    }
    if (+[TLPreferencesUtilities canAccessNanoRegistry](TLPreferencesUtilities, "canAccessNanoRegistry"))
    {
      NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass();
      if (NPSDomainAccessorClass)
      {
        v11 = [NPSDomainAccessorClass alloc];
        +[TLPreferencesUtilities perWatchPreferencesDomain](TLPreferencesUtilities, "perWatchPreferencesDomain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithDomain:", v12);

        TLLogToneManagement();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v35 = v5;
          v36 = 2114;
          v37 = v13;
          _os_log_impl(&dword_1D33D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -init…: Instantiated domain accessor %{public}@.", buf, 0x16u);
        }

        v15 = (id)objc_msgSend(v13, "synchronize");
        TLLogToneManagement();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v35 = v5;
          v36 = 2114;
          v37 = v13;
          _os_log_impl(&dword_1D33D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: -init…: Synchronized domain accessor %{public}@.", buf, 0x16u);
        }

      }
    }
    v17 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __51__TLToneManager_initWithITunesRingtonePlistAtPath___block_invoke;
    v30[3] = &unk_1E952A6A8;
    v18 = v5;
    v31 = v18;
    v19 = v4;
    v32 = v19;
    -[TLToneManager _performBlockInAccessQueue:](v18, "_performBlockInAccessQueue:", v30);
    if (!v19)
    {
      objc_initWeak((id *)buf, v18);
      +[TLContentProtectionStateObserver sharedContentProtectionStateObserver](TLContentProtectionStateObserver, "sharedContentProtectionStateObserver");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v17;
      v28[1] = 3221225472;
      v28[2] = __51__TLToneManager_initWithITunesRingtonePlistAtPath___block_invoke_2;
      v28[3] = &unk_1E952A6D0;
      objc_copyWeak(&v29, (id *)buf);
      objc_msgSend(v20, "performBlockAfterProtectedContentUnlocked:", v28);
      v21 = objc_claimAutoreleasedReturnValue();
      contentProtectionStateObserverToken = v18->_contentProtectionStateObserverToken;
      v18->_contentProtectionStateObserverToken = (NSCopying *)v21;

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v18, (CFNotificationCallback)_TLToneManagerHandleTonePreferencesDidChangeNotification, CFSTR("_TLTonePreferencesDidChangeNotification"), 0, (CFNotificationSuspensionBehavior)1028);
    v24 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v24, v18, (CFNotificationCallback)_TLToneManagerHandleWatchAlertPrefersSalientNotificationPreferenceDidChangeLocallyNotification, CFSTR("_TLAlertWatchPrefersSalientNotificationPreferenceDidChangeLocallyNotification"), 0, (CFNotificationSuspensionBehavior)1028);
    v25 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v25, v18, (CFNotificationCallback)_TLToneManagerHandleWatchAlertPrefersSalientNotificationPreferenceDidChangeRemotelyNotification, CFSTR("_TLAlertWatchPrefersSalientNotificationPreferenceDidChangeRemotelyNotification"), 0, (CFNotificationSuspensionBehavior)1028);
    v26 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v26, v18, (CFNotificationCallback)_TLToneManagerHandleDeviceRingtonesChangedNotification, CFSTR("com.apple.itunesstored.RingtoneAdded"), 0, (CFNotificationSuspensionBehavior)1028);

  }
  return v5;
}

uint64_t __51__TLToneManager_initWithITunesRingtonePlistAtPath___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadITunesRingtoneInfoPlistAtPath:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_loadSystemTones");
  return objc_msgSend(*(id *)(a1 + 32), "_loadToneIdentifierAliasMap");
}

void __51__TLToneManager_initWithITunesRingtonePlistAtPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleProtectionContentUnlockedEvent");
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  TLAccessQueue *v3;
  TLAccessQueue *accessQueue;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;
  __CFNotificationCenter *v7;
  __CFNotificationCenter *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = self->_accessQueue;
  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.itunesstored.RingtoneAdded"), 0);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v6, self, CFSTR("_TLTonePreferencesDidChangeNotification"), 0);
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v7, self, CFSTR("_TLAlertWatchPrefersSalientNotificationPreferenceDidChangeLocallyNotification"), 0);
  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v8, self, CFSTR("_TLAlertWatchPrefersSalientNotificationPreferenceDidChangeRemotelyNotification"), 0);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __24__TLToneManager_dealloc__block_invoke;
  v11[3] = &unk_1E952A6F8;
  v11[4] = self;
  v11[5] = &v12;
  -[TLAccessQueue performSynchronousBlock:](v3, "performSynchronousBlock:", v11);

  if (v13[5])
  {
    +[TLContentProtectionStateObserver sharedContentProtectionStateObserver](TLContentProtectionStateObserver, "sharedContentProtectionStateObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancelBlockScheduledForProtectedContentUnlockedEventWithToken:", v13[5]);

  }
  _Block_object_dispose(&v12, 8);

  v10.receiver = self;
  v10.super_class = (Class)TLToneManager;
  -[TLToneManager dealloc](&v10, sel_dealloc);
}

void __24__TLToneManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 80);
  *(_QWORD *)(v12 + 80) = 0;

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 64);
  *(_QWORD *)(v14 + 64) = 0;

}

- (NSString)_rootDirectory
{
  return (NSString *)CFSTR("/var/mobile");
}

- (NSString)_deviceITunesRingtoneDirectory
{
  void *v2;
  void *v3;

  -[TLToneManager _rootDirectory](self, "_rootDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Media/Purchases"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_deviceITunesRingtoneInformationPlist
{
  void *v2;
  void *v3;

  -[TLToneManager _rootDirectory](self, "_rootDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Media/Purchases/Ringtones.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_iTunesRingtoneDirectory
{
  void *v2;
  void *v3;

  -[TLToneManager _rootDirectory](self, "_rootDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Media/iTunes_Control/Ringtones"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_iTunesRingtoneInformationPlist
{
  void *v2;
  void *v3;

  -[TLToneManager _rootDirectory](self, "_rootDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Media/iTunes_Control/iTunes/Ringtones.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_systemRingtoneDirectory
{
  return (NSString *)objc_msgSend((id)CPSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("/Library/Ringtones"));
}

- (BOOL)_loadITunesRingtoneInfoPlistAtPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  BOOL v24;
  _QWORD v26[5];
  id v27;
  id v28;
  _BYTE *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE buf[24];
  char v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[TLToneManager _iTunesRingtoneDirectory](self, "_iTunesRingtoneDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLToneManager _tonesFromManifestPath:mediaDirectoryPath:](self, "_tonesFromManifestPath:mediaDirectoryPath:", v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TLToneManager _iTunesRingtoneInformationPlist](self, "_iTunesRingtoneInformationPlist");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLToneManager _iTunesRingtoneDirectory](self, "_iTunesRingtoneDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLToneManager _tonesFromManifestPath:mediaDirectoryPath:](self, "_tonesFromManifestPath:mediaDirectoryPath:", v7, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v6, "addObjectsFromArray:", v5);
    -[TLToneManager _deviceITunesRingtoneInformationPlist](self, "_deviceITunesRingtoneInformationPlist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLToneManager _deviceITunesRingtoneDirectory](self, "_deviceITunesRingtoneDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLToneManager _tonesFromManifestPath:mediaDirectoryPath:](self, "_tonesFromManifestPath:mediaDirectoryPath:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v6, "addObjectsFromArray:", v11);

  }
  TLLogToneManagement();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1D33D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: -_load…: Loaded %lu tones.", buf, 0x16u);
  }

  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v19, v20);
        objc_msgSend(v19, "syncIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v14, "setObject:forKey:", v20, v21);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v16);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v35 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __52__TLToneManager__loadITunesRingtoneInfoPlistAtPath___block_invoke;
  v26[3] = &unk_1E952A720;
  v26[4] = self;
  v22 = v13;
  v27 = v22;
  v29 = buf;
  v23 = v14;
  v28 = v23;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v26);
  v24 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v24;
}

void __52__TLToneManager__loadITunesRingtoneInfoPlistAtPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqualToDictionary:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isEqualToDictionary:", *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v5;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
}

- (id)_tonesFromManifestPath:(id)a3 mediaDirectoryPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint8_t buf[4];
  TLToneManager *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v5);

  TLLogToneManagement();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543874;
      v53 = self;
      v54 = 2114;
      v55 = v5;
      v56 = 2114;
      v57 = v6;
      _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: _tonesFromManifestPath:(%{public}@) mediaDirectoryPath:(%{public}@): About to load tones.", buf, 0x20u);
    }

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
    v51 = 0;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = v12;
    if (!v11 || v12)
    {
      TLLogToneManagement();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v53 = self;
        v54 = 2114;
        v55 = v5;
        v56 = 2114;
        v57 = v6;
        v58 = 2114;
        v59 = (uint64_t)v13;
        _os_log_error_impl(&dword_1D33D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@: _tonesFromManifestPath:(%{public}@) mediaDirectoryPath:(%{public}@): Couldn't load manifest: %{public}@", buf, 0x2Au);
      }

    }
    objc_msgSend(v11, "objectForKey:", CFSTR("Ringtones"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v15, "count");
    if (!v39)
    {
      TLLogToneManagement();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v53 = self;
        v54 = 2114;
        v55 = v5;
        v56 = 2114;
        v57 = v6;
        v58 = 2114;
        v59 = (uint64_t)v11;
        _os_log_impl(&dword_1D33D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: _tonesFromManifestPath:(%{public}@) mediaDirectoryPath:(%{public}@): Couldn't find any tone entries in the manifest: %{public}@", buf, 0x2Au);
      }

    }
    v40 = v11;
    v41 = v13;
    v43 = v5;
    objc_msgSend(v15, "allKeys");
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v48;
      v20 = 0x1E9529000uLL;
      v44 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v48 != v19)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v6, "stringByAppendingPathComponent:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_alloc(*(Class *)(v20 + 3096));
          objc_msgSend(v15, "objectForKey:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v24, "initWithPropertyListRepresentation:filePath:", v25, v23);

          TLLogToneManagement();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v26)
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v26, "identifier");
              v29 = v9;
              v30 = v15;
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "filePath");
              v32 = v18;
              v33 = v6;
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v53 = self;
              v54 = 2114;
              v55 = v31;
              v56 = 2114;
              v57 = v34;
              _os_log_impl(&dword_1D33D5000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: _tonesFromManifestPath: Appending tone with identifier %{public}@ and file path: %{public}@.", buf, 0x20u);

              v6 = v33;
              v18 = v32;

              v15 = v30;
              v9 = v29;
              v19 = v44;
              v20 = 0x1E9529000;
            }

            if (!v9)
              v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[NSObject addObject:](v9, "addObject:", v26);
          }
          else
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v53 = self;
              v54 = 2114;
              v55 = v23;
              _os_log_error_impl(&dword_1D33D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@: _tonesFromManifestPath: Skipping inclusion of tone for file path: %{public}@.", buf, 0x16u);
            }

          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
      }
      while (v18);
    }
    v35 = -[NSObject copy](v9, "copy");
    TLLogToneManagement();
    v36 = objc_claimAutoreleasedReturnValue();
    v5 = v43;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_msgSend(v35, "count");
      *(_DWORD *)buf = 138544386;
      v53 = self;
      v54 = 2114;
      v55 = v43;
      v56 = 2114;
      v57 = v6;
      v58 = 2048;
      v59 = v37;
      v60 = 2048;
      v61 = v39;
      _os_log_impl(&dword_1D33D5000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: _tonesFromManifestPath:(%{public}@) mediaDirectoryPath:(%{public}@): Loaded %lu tones from %lu entries in the manifest.", buf, 0x34u);
    }

  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543874;
      v53 = self;
      v54 = 2114;
      v55 = v5;
      v56 = 2114;
      v57 = v6;
      _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: _tonesFromManifestPath:(%{public}@) mediaDirectoryPath:(%{public}@): Manifest file does not exist. Not loading any tones.", buf, 0x20u);
    }
    v35 = 0;
  }

  return v35;
}

- (void)_reloadTonesAfterExternalChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__TLToneManager__reloadTonesAfterExternalChange__block_invoke;
  v2[3] = &unk_1E952A748;
  v2[4] = self;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v2);
}

void __48__TLToneManager__reloadTonesAfterExternalChange__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  if (objc_msgSend(*(id *)(a1 + 32), "_loadITunesRingtoneInfoPlistAtPath:", 0))
  {
    dispatch_get_global_queue(0, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__TLToneManager__reloadTonesAfterExternalChange__block_invoke_2;
    block[3] = &unk_1E952A748;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v2, block);

  }
}

void __48__TLToneManager__reloadTonesAfterExternalChange__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("_TLToneManagerContentsChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_reloadTones
{
  __CFNotificationCenter *DarwinNotifyCenter;

  -[TLToneManager _reloadTonesAfterExternalChange](self, "_reloadTonesAfterExternalChange");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.itunesstored.RingtoneAdded"), 0, 0, 1u);
}

- (id)_toneWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__TLToneManager__toneWithIdentifier___block_invoke;
  v8[3] = &unk_1E952A770;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __37__TLToneManager__toneWithIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_installedTones
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__TLToneManager__installedTones__block_invoke;
  v4[3] = &unk_1E952A6F8;
  v4[4] = self;
  v4[5] = &v5;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __32__TLToneManager__installedTones__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)_installedTonesSize
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  id obj;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  statfs v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  memset(&v25, 0, 512);
  -[TLToneManager _deviceITunesRingtoneDirectory](self, "_deviceITunesRingtoneDirectory");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = statfs((const char *)objc_msgSend(v3, "UTF8String"), &v25);

  if (v4)
    v5 = 4095;
  else
    v5 = v25.f_bsize - 1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _installedTones](self, "_installedTones");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = *MEMORY[0x1E0CB2AF0];
    v10 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "filePath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "attributesOfItemAtPath:error:", v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "longLongValue");

        v10 = v10 + (float)((v15 + v5) & ~(_DWORD)v5);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
    v16 = (unint64_t)v10;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_addToneToManifestAtPath:(id)a3 metadata:(id)a4 fileName:(id)a5 mediaDirectory:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  TLToneImportResponse *v17;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
    goto LABEL_5;
  v14 = v11;
  if (!v14)
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = v12;
  v20[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _addToneEntries:toManifestAtPath:mediaDirectory:shouldSkipReload:](self, "_addToneEntries:toManifestAtPath:mediaDirectory:shouldSkipReload:", v15, v10, v13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v12);
  v17 = (TLToneImportResponse *)objc_claimAutoreleasedReturnValue();

  if (!v17)
LABEL_5:
    v17 = -[TLToneImportResponse initWithStatusCode:toneIdentifier:]([TLToneImportResponse alloc], "initWithStatusCode:toneIdentifier:", 2, 0);

  return v17;
}

- (id)_addToneEntries:(id)a3 toManifestAtPath:(id)a4 mediaDirectory:(id)a5 shouldSkipReload:(BOOL)a6
{
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  TLITunesTone *v16;
  void *v17;
  TLITunesTone *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  TLToneImportResponse *v38;
  char v39;
  char v40;
  NSObject *v41;
  void *v42;
  void *v43;
  TLToneImportResponse *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  void *v62;
  void *v63;
  id obj;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  uint64_t j;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[6];
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint8_t v93[128];
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  TLITunesTone *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  void *v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  LODWORD(v50) = a6;
  v104 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v8 = a4;
  v68 = a5;
  v69 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v53 = v8;
  objc_msgSend(v8, "stringByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _ensureDirectoryExistsAtPath:](self, "_ensureDirectoryExistsAtPath:", v9);

  HIDWORD(v50) = -[TLToneManager _lockManifestAtPath:](self, "_lockManifestAtPath:", v8);
  if (HIDWORD(v50) == -1)
  {
LABEL_50:
    v44 = -[TLToneImportResponse initWithStatusCode:toneIdentifier:]([TLToneImportResponse alloc], "initWithStatusCode:toneIdentifier:", 2, 0);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v45 = v52;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
    if (v46)
    {
      v47 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v73 != v47)
            objc_enumerationMutation(v45);
          objc_msgSend(v69, "setObject:forKey:", v44, *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i), v50);
        }
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
      }
      while (v46);
    }

    goto LABEL_58;
  }
  v87 = 0;
  v88 = &v87;
  v89 = 0x3032000000;
  v90 = __Block_byref_object_copy_;
  v91 = __Block_byref_object_dispose_;
  v92 = 0;
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __82__TLToneManager__addToneEntries_toManifestAtPath_mediaDirectory_shouldSkipReload___block_invoke;
  v86[3] = &unk_1E952A6F8;
  v86[4] = self;
  v86[5] = &v87;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v86);
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v8);
  if (!v10)
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v51 = v10;
  objc_msgSend(v10, "objectForKey:", CFSTR("Ringtones"), v50);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v51, "setObject:forKey:", v11, CFSTR("Ringtones"));
  }
  -[TLToneManager _deviceITunesRingtoneDirectory](self, "_deviceITunesRingtoneDirectory");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v52;
  v63 = v11;
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v103, 16);
  if (v60)
  {
    v61 = 0;
    v59 = *(_QWORD *)v83;
    do
    {
      for (j = 0; j != v60; ++j)
      {
        if (*(_QWORD *)v83 != v59)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j);
        objc_msgSend(obj, "objectForKey:", v12);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "stringByAppendingPathComponent:", v12);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v66, "hasProtectedContent");
        v14 = (void *)objc_msgSend(v70, "mutableCopy");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("Protected Content"));

        v16 = [TLITunesTone alloc];
        objc_msgSend(v68, "stringByAppendingPathComponent:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[TLITunesTone initWithPropertyListRepresentation:filePath:](v16, "initWithPropertyListRepresentation:filePath:", v14, v17);

        -[TLITunesTone identifier](v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v20 = (id)v88[5];
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v102, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v79;
LABEL_13:
          v23 = 0;
          while (1)
          {
            if (*(_QWORD *)v79 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v23);
            if (-[TLITunesTone isDuplicateOfTone:](v18, "isDuplicateOfTone:", v24))
              break;
            if (v21 == ++v23)
            {
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v78, v102, 16);
              if (v21)
                goto LABEL_13;
              goto LABEL_19;
            }
          }
          objc_msgSend(v24, "filePath");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v57, "fileExistsAtPath:", v27))
          {
            objc_msgSend(v24, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            TLLogToneManagement();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v95 = v29;
              v96 = 2114;
              v97 = v18;
              v98 = 2114;
              v99 = v24;
              v30 = v29;
              _os_log_impl(&dword_1D33D5000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping import of tone %{public}@ because it's a duplicate of the following existing tone: %{public}@.", buf, 0x20u);

            }
            v31 = 1;
            goto LABEL_34;
          }
          objc_msgSend(v27, "lastPathComponent");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "objectForKey:");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = (void *)objc_msgSend(v32, "mutableCopy");

          if (v62)
          {
            objc_msgSend(v63, "removeObjectForKey:", v58);
            v25 = v62;

            objc_msgSend(v24, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v27, "hasPrefix:", v55))
              objc_msgSend(v54, "addObject:", v27);
            TLLogToneManagement();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              v34 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138544130;
              v95 = v34;
              v96 = 2114;
              v97 = v18;
              v98 = 2114;
              v99 = v24;
              v100 = 2114;
              v101 = v27;
              v35 = v34;
              _os_log_impl(&dword_1D33D5000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Connected newly imported tone %{public}@ to old duplicate's metadata %{public}@ because its asset is missing at %{public}@.", buf, 0x2Au);

            }
          }
          else
          {
            TLLogToneManagement();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              v36 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v95 = v36;
              v96 = 2114;
              v97 = v18;
              v98 = 2114;
              v99 = v24;
              v37 = v36;
              _os_log_impl(&dword_1D33D5000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Proceeding to import tone %{public}@ despite finding duplicate %{public}@ because they don't appear to be listed in the same manifest.", buf, 0x20u);

            }
            v26 = v19;
            v25 = v14;
          }

        }
        else
        {
LABEL_19:
          v25 = v14;
          v26 = v19;
        }

        objc_msgSend(v63, "setObject:forKey:", v25, v12);
        v31 = 0;
        v61 = 1;
        v14 = v25;
LABEL_34:
        v38 = -[TLToneImportResponse initWithStatusCode:toneIdentifier:]([TLToneImportResponse alloc], "initWithStatusCode:toneIdentifier:", v31, v26);
        objc_msgSend(v69, "setObject:forKey:", v38, v12);

      }
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v103, 16);
    }
    while (v60);

    if ((v61 & 1) == 0)
    {
      v40 = 0;
      goto LABEL_47;
    }
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v51, 200, 0, 0);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(obj, "writeToFile:options:error:", v53, 1, 0);
    if ((v39 & 1) != 0)
    {
      if ((v50 & 1) == 0)
        -[TLToneManager _reloadTones](self, "_reloadTones");
    }
    else
    {
      TLLogToneManagement();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = (void *)objc_opt_class();
        -[TLToneManager _addToneEntries:toManifestAtPath:mediaDirectory:shouldSkipReload:].cold.1(v42, (uint64_t)buf, v41);
      }

      objc_msgSend(v69, "removeAllObjects");
    }
    v40 = v39 ^ 1;
  }
  else
  {
    v40 = 0;
  }

LABEL_47:
  close(SHIDWORD(v50));
  if (objc_msgSend(v54, "count"))
  {
    v43 = (void *)objc_msgSend(objc_alloc((Class)getSSDownloadFileManifestClass()), "initWithManifestType:", 0);
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __82__TLToneManager__addToneEntries_toManifestAtPath_mediaDirectory_shouldSkipReload___block_invoke_192;
    v76[3] = &unk_1E952A798;
    v76[4] = self;
    v77 = v54;
    objc_msgSend(v43, "removeItemsWithAssetPaths:completionBlock:", v77, v76);

  }
  _Block_object_dispose(&v87, 8);

  if ((v40 & 1) != 0)
    goto LABEL_50;
LABEL_58:

  return v69;
}

void __82__TLToneManager__addToneEntries_toManifestAtPath_mediaDirectory_shouldSkipReload___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __82__TLToneManager__addToneEntries_toManifestAtPath_mediaDirectory_shouldSkipReload___block_invoke_192(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  TLLogToneManagement();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = *(void **)(a1 + 40);
      v10 = v8;
      v11 = 138543618;
      v12 = v8;
      v13 = 2048;
      v14 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully removed %lu items from store download file manifest.", (uint8_t *)&v11, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __82__TLToneManager__addToneEntries_toManifestAtPath_mediaDirectory_shouldSkipReload___block_invoke_192_cold_1(a1);
  }

}

- (BOOL)_removeToneWithIdentifier:(id)a3
{
  return -[TLToneManager _removeToneWithIdentifier:orSyncIdentifier:](self, "_removeToneWithIdentifier:orSyncIdentifier:", a3, 0);
}

- (BOOL)_removeToneWithIdentifier:(id)a3 orSyncIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  char v12;
  _QWORD v14[4];
  id v15;
  id v16;
  TLToneManager *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a3;
  v7 = a4;
  -[TLAccessQueue assertNotRunningInAccessQueue](self->_accessQueue, "assertNotRunningInAccessQueue");
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__TLToneManager__removeToneWithIdentifier_orSyncIdentifier___block_invoke;
  v14[3] = &unk_1E952A7E8;
  v8 = v6;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  v17 = self;
  v18 = &v20;
  v19 = &v24;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v14);
  if (*((_BYTE *)v21 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("_TLToneManagerContentsChangedNotification"), self);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.itunesstored.RingtoneAdded"), 0, 0, 1u);
  }
  v12 = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __60__TLToneManager__removeToneWithIdentifier_orSyncIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "objectForKey:");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      TLLogToneManagement();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = (void *)objc_opt_class();
        v5 = *(_QWORD *)(a1 + 32);
        v6 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v51 = v4;
        v52 = 2114;
        v53 = v5;
        v54 = 2114;
        v55 = v6;
        v56 = 2114;
        v57 = v2;
        v7 = v4;
        _os_log_impl(&dword_1D33D5000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: _removeToneWithIdentifier:(%{public}@) orSyncIdentifier:(%{public}@): Resolved supplied sync identifier to tone identifier: %{public}@.", buf, 0x2Au);

      }
    }
    else
    {
      v2 = 0;
    }
  }
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "objectForKey:", v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(v8, "filePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_deviceITunesRingtoneDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "hasPrefix:", v12);

    v14 = *(void **)(a1 + 48);
    if ((v13 & 1) != 0)
      objc_msgSend(v14, "_deviceITunesRingtoneInformationPlist");
    else
      objc_msgSend(v14, "_iTunesRingtoneInformationPlist");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v11, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v16, "_removeTonesFromManifestAtPath:fileNames:shouldSkipReload:alreadyLockedManifest:removedEntries:", v15, v17, 1, 0, 0);

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v19 = objc_msgSend(v18, "removeItemAtPath:error:", v10, &v49);
    v20 = v49;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v19;

    v21 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    TLLogToneManagement();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_opt_class();
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v51 = v24;
        v52 = 2114;
        v53 = v25;
        v54 = 2114;
        v55 = v26;
        v56 = 2114;
        v57 = v10;
        v27 = v24;
        _os_log_impl(&dword_1D33D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: _removeToneWithIdentifier:(%{public}@) orSyncIdentifier:(%{public}@): Successfully deleted tone at file path '%{public}@'.", buf, 0x2Au);

      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v40 = (void *)objc_opt_class();
      v42 = *(_QWORD *)(a1 + 32);
      v43 = *(_QWORD *)(a1 + 40);
      v44 = v40;
      objc_msgSend(v20, "tl_nonRedundantDescription");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v51 = v40;
      v52 = 2114;
      v53 = v42;
      v54 = 2114;
      v55 = v43;
      v56 = 2114;
      v57 = v10;
      v58 = 2114;
      v59 = v41;
      _os_log_error_impl(&dword_1D33D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@: _removeToneWithIdentifier:(%{public}@) orSyncIdentifier:(%{public}@): Failed to delete tone at file path '%{public}@'; error = %{public}@.",
        buf,
        0x34u);

    }
    objc_msgSend(*(id *)(a1 + 48), "_deviceITunesRingtoneDirectory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasPrefix:", v28))
    {
      objc_msgSend(v10, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "hasPrefix:", CFSTR("import_"));

      if ((v30 & 1) != 0)
      {
LABEL_22:
        v31 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "mutableCopy");
        objc_msgSend(v31, "removeObjectForKey:", v2);
        v32 = objc_msgSend(v31, "copy");
        v33 = *(_QWORD *)(a1 + 48);
        v34 = *(void **)(v33 + 16);
        *(_QWORD *)(v33 + 16) = v32;

        objc_msgSend(v9, "syncIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          v36 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "mutableCopy");
          objc_msgSend(v36, "removeObjectForKey:", v35);
          v37 = objc_msgSend(v36, "copy");
          v38 = *(_QWORD *)(a1 + 48);
          v39 = *(void **)(v38 + 24);
          *(_QWORD *)(v38 + 24) = v37;

        }
        goto LABEL_25;
      }
      v28 = (void *)objc_msgSend(objc_alloc((Class)getSSDownloadFileManifestClass()), "initWithManifestType:", 0);
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __60__TLToneManager__removeToneWithIdentifier_orSyncIdentifier___block_invoke_195;
      v45[3] = &unk_1E952A7C0;
      v45[4] = *(_QWORD *)(a1 + 48);
      v46 = *(id *)(a1 + 32);
      v47 = *(id *)(a1 + 40);
      v48 = v10;
      objc_msgSend(v28, "removeItemWithAssetPath:completionBlock:", v48, v45);

    }
    goto LABEL_22;
  }
LABEL_27:

}

void __60__TLToneManager__removeToneWithIdentifier_orSyncIdentifier___block_invoke_195(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  TLLogToneManagement();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = a1[5];
      v10 = a1[6];
      v11 = a1[7];
      v13 = 138544130;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      v12 = v8;
      _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: _removeToneWithIdentifier:(%{public}@) orSyncIdentifier:(%{public}@): Successfully removed item for tone at file path '%{public}@' from store download file manifest.", (uint8_t *)&v13, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __60__TLToneManager__removeToneWithIdentifier_orSyncIdentifier___block_invoke_195_cold_1();
  }

}

- (BOOL)_removeToneFromManifestAtPath:(id)a3 fileName:(id)a4
{
  void *v6;
  id v7;
  void *v8;

  if (!a4)
    return 0;
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  objc_msgSend(v6, "setWithObjects:", a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TLToneManager _removeTonesFromManifestAtPath:fileNames:shouldSkipReload:alreadyLockedManifest:removedEntries:](self, "_removeTonesFromManifestAtPath:fileNames:shouldSkipReload:alreadyLockedManifest:removedEntries:", v7, v8, 0, 0, 0);

  return (char)self;
}

- (BOOL)_removeTonesFromManifestAtPath:(id)a3 fileNames:(id)a4 shouldSkipReload:(BOOL)a5 alreadyLockedManifest:(BOOL)a6 removedEntries:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  NSObject *v29;
  TLToneManager *v31;
  BOOL v32;
  void *v33;
  int v34;
  BOOL v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  objc_msgSend(v12, "stringByDeletingLastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _ensureDirectoryExistsAtPath:](self, "_ensureDirectoryExistsAtPath:", v14);

  if (a6)
  {
    v15 = -1;
  }
  else
  {
    v15 = -[TLToneManager _lockManifestAtPath:](self, "_lockManifestAtPath:", v12);
    if (v15 == -1)
    {
      v22 = 0;
      v27 = 0;
      if (!a7)
        goto LABEL_33;
      goto LABEL_32;
    }
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v12);
  v17 = v16;
  if (v16)
  {
    v32 = a5;
    v31 = self;
    v34 = v15;
    v35 = a6;
    v37 = v12;
    v33 = v16;
    objc_msgSend(v16, "objectForKey:", CFSTR("Ringtones"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v36 = v13;
    v19 = v13;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v20)
    {
      v21 = v20;
      v22 = 0;
      v23 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v39 != v23)
            objc_enumerationMutation(v19);
          v25 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (a7)
          {
            objc_msgSend(v18, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              if (!v22)
                v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(v22, "setObject:forKey:", v26, v25);
            }

          }
          objc_msgSend(v18, "removeObjectForKey:", v25);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v21);
    }
    else
    {
      v22 = 0;
    }

    v17 = v33;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v33, 200, 0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v37;
    v27 = objc_msgSend(v28, "writeToFile:options:error:", v37, 1, 0);
    if ((v27 & 1) != 0)
    {
      if (!v32)
        -[TLToneManager _reloadTones](v31, "_reloadTones");
    }
    else
    {
      TLLogToneManagement();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[TLToneManager _removeTonesFromManifestAtPath:fileNames:shouldSkipReload:alreadyLockedManifest:removedEntries:].cold.1();

      if (v22)
      {

        v22 = 0;
      }
    }
    v15 = v34;

    v13 = v36;
    if (!v35)
      goto LABEL_30;
  }
  else
  {
    v22 = 0;
    v27 = 0;
    if (!a6)
LABEL_30:
      close(v15);
  }

  if (a7)
LABEL_32:
    *a7 = (id)objc_msgSend(v22, "copy");
LABEL_33:

  return v27;
}

- (int)_lockManifestAtPath:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  int v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend(a3, "stringByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("com.apple.ToneLibrary.lock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_retainAutorelease(v4);
  v6 = open((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 512, 438);
  if (v6 == -1)
  {
    TLLogToneManagement();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[TLToneManager _lockManifestAtPath:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    goto LABEL_9;
  }
  v7 = v6;
  fcntl(v6, 2, 1);
  if (flock(v7, 2) == -1)
  {
    TLLogToneManagement();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[TLToneManager _lockManifestAtPath:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);

    close(v7);
LABEL_9:
    v7 = -1;
  }

  return v7;
}

- (BOOL)_removeAllTones
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__TLToneManager__removeAllTones__block_invoke;
  v4[3] = &unk_1E952A860;
  v4[4] = self;
  v4[5] = &v5;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __32__TLToneManager__removeAllTones__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _DWORD *v8;
  char v9;
  uint64_t v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  char v19;
  id v20;
  FILE *v21;
  uint64_t v22;
  id v23;
  int v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  const char *v34;
  const char *v35;
  char v36;
  FILE *v37;
  _DWORD *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 v44;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_deviceITunesRingtoneInformationPlist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v3;
  objc_msgSend(*(id *)(a1 + 32), "_iTunesRingtoneInformationPlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  v7 = objc_msgSend(v5, "count");
  v8 = malloc_type_malloc(4 * v7, 0x100004052888210uLL);
  if (!v7)
  {
    v36 = 0;
    goto LABEL_10;
  }
  v9 = 0;
  v10 = 0;
  v11 = 1;
  do
  {
    objc_msgSend(v6, "objectAtIndex:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "fileExistsAtPath:", v12))
    {
      v13 = objc_msgSend(*(id *)(a1 + 32), "_lockManifestAtPath:", v12);
      v11 &= v13 != -1;
      v9 = 1;
    }
    else
    {
      v13 = -1;
    }
    v8[v10] = v13;

    ++v10;
  }
  while (v7 != v10);
  v36 = v9;
  if ((v11 & 1) != 0)
  {
LABEL_10:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_deviceITunesRingtoneDirectory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __32__TLToneManager__removeAllTones__block_invoke_2;
    v41[3] = &unk_1E952A838;
    v42 = v2;
    v43 = v14;
    v44 = *(_OWORD *)(a1 + 32);
    v16 = v14;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v41);

    if (!v7)
      goto LABEL_25;
  }
  v17 = 0;
  v38 = v8;
  do
  {
    objc_msgSend(v6, "objectAtIndex:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "fileExistsAtPath:", v18))
    {
      v40 = 0;
      v19 = objc_msgSend(v2, "removeItemAtPath:error:", v18, &v40);
      v20 = v40;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v19;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        printf("Removed tone manifest at path '%s'.\n", (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
      }
      else
      {
        v21 = (FILE *)*MEMORY[0x1E0C80C10];
        v22 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
        objc_msgSend(v20, "tl_nonRedundantDescription");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34 = (const char *)v22;
        v8 = v38;
        fprintf(v21, "Failed to remove item at path '%s'. Error: %s.\n", v34, (const char *)objc_msgSend(v23, "UTF8String"));

      }
    }
    v24 = v8[v17];
    if (v24 != -1)
      close(v24);
    objc_msgSend(v18, "stringByDeletingLastPathComponent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByAppendingPathComponent:", CFSTR("com.apple.ToneLibrary.lock"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v2, "fileExistsAtPath:", v26))
    {
      v39 = 0;
      v27 = objc_msgSend(v2, "removeItemAtPath:error:", v26, &v39);
      v28 = v39;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v27;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        printf("Removed tone manifest lock file at path '%s'.\n", (const char *)objc_msgSend(objc_retainAutorelease(v26), "UTF8String"));
      }
      else
      {
        v37 = (FILE *)*MEMORY[0x1E0C80C10];
        v29 = objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
        objc_msgSend(v28, "tl_nonRedundantDescription");
        v30 = a1;
        v31 = v7;
        v32 = v6;
        v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v35 = (const char *)v29;
        v8 = v38;
        fprintf(v37, "Failed to remove item at path '%s'. Error: %s.\n", v35, (const char *)objc_msgSend(v33, "UTF8String"));

        v6 = v32;
        v7 = v31;
        a1 = v30;
      }

    }
    ++v17;
  }
  while (v7 != v17);
LABEL_25:
  free(v8);
  if ((v36 & 1) == 0)
    puts("Nothing to remove.");
  objc_msgSend(*(id *)(a1 + 32), "_reloadTones");

}

void __32__TLToneManager__removeAllTones__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  int v9;
  void *v10;
  char v11;
  id v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  dispatch_semaphore_t v18;
  id v19;
  NSObject *v20;
  FILE *v21;
  const char *v22;
  const char *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  dispatch_semaphore_t v30;
  uint64_t v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "filePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v5))
    goto LABEL_24;
  if (objc_msgSend(v5, "hasPrefix:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("import_"));

    if (v7)
      v8 = "imported";
    else
      v8 = "purchased";
    v9 = v7 ^ 1;
  }
  else
  {
    v9 = 0;
    v8 = "synced";
  }
  v10 = *(void **)(a1 + 32);
  v32 = 0;
  v11 = objc_msgSend(v10, "removeItemAtPath:error:", v5, &v32);
  v12 = v32;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11;
  v13 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  TLLogToneManagement();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v34 = v16;
      v35 = 2114;
      v36 = v5;
      v17 = v16;
      _os_log_impl(&dword_1D33D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: _removeAllTones: Successfully deleted tone at file path '%{public}@'.", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_opt_class();
    v26 = v25;
    objc_msgSend(v12, "tl_nonRedundantDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v25;
    v35 = 2114;
    v36 = v5;
    v37 = 2114;
    v38 = v27;
    _os_log_error_impl(&dword_1D33D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@: _removeAllTones: Failed to delete tone at file path '%{public}@'; error = %{public}@.",
      buf,
      0x20u);

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v21 = (FILE *)*MEMORY[0x1E0C80C10];
    v22 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    objc_msgSend(v12, "tl_nonRedundantDescription");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(v21, "Failed to remove item at path '%s'. Error: %s.\n", v22, (const char *)objc_msgSend(v19, "UTF8String"));
    goto LABEL_17;
  }
  if (v9)
  {
    v18 = dispatch_semaphore_create(0);
    v19 = (id)objc_msgSend(objc_alloc((Class)getSSDownloadFileManifestClass()), "initWithManifestType:", 0);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __32__TLToneManager__removeAllTones__block_invoke_204;
    v28[3] = &unk_1E952A810;
    v31 = *(_QWORD *)(a1 + 56);
    v29 = v5;
    v30 = v18;
    v20 = v18;
    objc_msgSend(v19, "removeItemWithAssetPath:completionBlock:", v29, v28);
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);

LABEL_17:
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if (objc_msgSend(v4, "isRingtone"))
      v23 = "ringtone";
    else
      v23 = "alert tone";
    objc_msgSend(v4, "name");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("Removed %s %s with name '%s' at path '%s'.\n", v8, v23, (const char *)objc_msgSend(v24, "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));

  }
LABEL_24:

}

intptr_t __32__TLToneManager__removeAllTones__block_invoke_204(uint64_t a1, char a2, void *a3)
{
  FILE *v5;
  id v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;

  if ((a2 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v5 = (FILE *)*MEMORY[0x1E0C80C10];
    v6 = objc_retainAutorelease(*(id *)(a1 + 32));
    v7 = a3;
    v8 = (const char *)objc_msgSend(v6, "UTF8String");
    objc_msgSend(v7, "tl_nonRedundantDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v9);
    fprintf(v5, "Failed to remove item at path '%s' from store download manifest. Error: %s.\n", v8, (const char *)objc_msgSend(v10, "UTF8String"));

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_alarmWakeUpRingtoneDirectory
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("AlarmWakeUpRingtones"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_baseDirectoryForAlertToneSoundFiles
{
  return CFSTR("/System/Library/Audio/UISounds");
}

- (id)_systemEmbeddedSoundDirectory
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("AlertTones"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_systemEmbeddedClassicSoundDirectory
{
  void *v2;
  void *v3;

  -[TLToneManager _systemEmbeddedSoundDirectory](self, "_systemEmbeddedSoundDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Classic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_systemEmbeddedModernSoundDirectory
{
  void *v2;
  void *v3;

  -[TLToneManager _systemEmbeddedSoundDirectory](self, "_systemEmbeddedSoundDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Modern"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_systemEmbeddedEncoreInfinitumSoundDirectory
{
  void *v2;
  void *v3;

  -[TLToneManager _systemEmbeddedSoundDirectory](self, "_systemEmbeddedSoundDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("EncoreInfinitum"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_systemWatchSoundDirectory
{
  void *v2;
  void *v3;

  -[TLToneManager _baseDirectoryForAlertToneSoundFiles](self, "_baseDirectoryForAlertToneSoundFiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("nano"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_loadSystemTones
{
  uint64_t v3;
  id v4;
  uint64_t i;
  const __CFString **v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  TLSystemTone *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  void *v24;
  TLSystemTone *v25;
  TLSystemTone *v26;
  uint64_t v27;
  NSDictionary *systemTonesByIdentifier;
  void *v29;
  void *v30;
  id v31;
  TLToneManager *v32;
  _QWORD v33[115];
  uint64_t v34;
  const __CFString *v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  const __CFString *v39;
  uint64_t v40;
  const __CFString *v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  const __CFString *v45;
  uint64_t v46;
  const __CFString *v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  const __CFString *v54;
  uint64_t v55;
  const __CFString *v56;
  const __CFString *v57;
  uint64_t v58;
  const __CFString *v59;
  const __CFString *v60;
  uint64_t v61;
  const __CFString *v62;
  const __CFString *v63;
  uint64_t v64;
  const __CFString *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  const __CFString *v69;
  void *v70;
  const __CFString *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  const __CFString *v75;
  void *v76;
  const __CFString *v77;
  const __CFString *v78;
  void *v79;
  const __CFString *v80;
  const __CFString *v81;
  void *v82;
  const __CFString *v83;
  const __CFString *v84;
  void *v85;
  const __CFString *v86;
  const __CFString *v87;
  void *v88;
  const __CFString *v89;
  const __CFString *v90;
  void *v91;
  const __CFString *v92;
  const __CFString *v93;
  void *v94;
  const __CFString *v95;
  const __CFString *v96;
  void *v97;
  const __CFString *v98;
  const __CFString *v99;
  void *v100;
  const __CFString *v101;
  const __CFString *v102;
  int v103;
  int v104;
  uint64_t v105;
  _QWORD v106[30];
  int v107;
  int v108;
  id v109;
  const __CFString *v110;
  const __CFString *v111;
  int v112;
  int v113;
  uint64_t v114;
  const __CFString *v115;
  const __CFString *v116;
  int32x2_t v117;
  uint64_t v118;
  const __CFString *v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  -[TLToneManager _systemSoundDirectory](self, "_systemSoundDirectory");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v32 = self;
  -[TLToneManager _systemWatchSoundDirectory](self, "_systemWatchSoundDirectory");
  v3 = objc_claimAutoreleasedReturnValue();
  v102 = CFSTR("<none>");
  v103 = kSystemSoundID_NoneTone;
  v104 = kSystemSoundID_NoneTone;
  v106[0] = 0;
  v105 = 0;
  v106[1] = CFSTR("texttone:App Notification");
  v106[2] = 0x3F700000523;
  v106[3] = v31;
  v106[4] = CFSTR("sms-received1.caf");
  v106[5] = CFSTR("texttone:Text-Message-Alert-In-Conversation");
  v106[6] = 0x3EB00000515;
  v106[7] = v31;
  v106[8] = CFSTR("ReceivedMessage.caf");
  v106[9] = CFSTR("texttone:FaceTime-Group-Invitation");
  v106[10] = vdup_n_s32(0x4F1u);
  v106[11] = v3;
  v106[12] = CFSTR("MultiwayInvitation.caf");
  v106[13] = CFSTR("texttone:FaceTime-Participant-Joined");
  v106[14] = vdup_n_s32(0x4EFu);
  v106[15] = v3;
  v106[16] = CFSTR("MultiwayJoin.caf");
  v106[17] = CFSTR("texttone:Go-To-Sleep");
  v106[19] = v31;
  v106[20] = CFSTR("go_to_sleep_alert.caf");
  v106[18] = vdup_n_s32(0x486u);
  v106[21] = CFSTR("texttone:App-Notification-Critical-Alert");
  v106[22] = vdup_n_s32(0x48Du);
  v106[23] = v31;
  v106[24] = CFSTR("3rd_party_critical.caf");
  v106[25] = CFSTR("texttone:Passbook-NFC-Scan-Complete");
  v106[26] = vdup_n_s32(0x488u);
  v106[27] = v31;
  v106[28] = CFSTR("nfc_scan_complete.caf");
  v106[29] = CFSTR("texttone:Health");
  v107 = kSystemSoundID_NoneTone;
  v108 = 1262;
  v109 = v31;
  v110 = CFSTR("health_notification.caf");
  v111 = CFSTR("texttone:Health-Urgent");
  v112 = kSystemSoundID_NoneTone;
  v113 = 1363;
  v114 = v3;
  v115 = CFSTR("HealthNotificationUrgent.caf");
  v116 = CFSTR("texttone:Headphone-Audio-Exposure-Limit-Exceeded");
  v117 = vdup_n_s32(0x552u);
  v30 = (void *)v3;
  v118 = v3;
  v119 = CFSTR("HeadphoneAudioExposureLimitExceeded.caf");
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  for (i = 0; i != 44; i += 4)
  {
    v6 = &(&v102)[i];
    v7 = (id)v106[i - 1];
    v8 = (id)v106[i];
    v9 = v8;
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (v10)
    {
      v12 = 0;
      v11 = 0;
    }
    else
    {
      objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = -[TLSystemTone initWithSoundFileURL:actualSoundID:previewSoundID:requiresLongFormPlayback:]([TLSystemTone alloc], "initWithSoundFileURL:actualSoundID:previewSoundID:requiresLongFormPlayback:", v12, *((unsigned int *)v6 + 3), *((unsigned int *)v6 + 2), 0);
    if (v13)
      objc_msgSend(v4, "setObject:forKey:", v13, *v6);

  }
  -[TLToneManager _systemEmbeddedSoundDirectory](v32, "_systemEmbeddedSoundDirectory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _systemEmbeddedClassicSoundDirectory](v32, "_systemEmbeddedClassicSoundDirectory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _systemEmbeddedModernSoundDirectory](v32, "_systemEmbeddedModernSoundDirectory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _systemEmbeddedEncoreInfinitumSoundDirectory](v32, "_systemEmbeddedEncoreInfinitumSoundDirectory");
  v17 = 0;
  v33[0] = CFSTR("texttone:Alert");
  v33[1] = v15;
  v33[2] = CFSTR("Alert.m4r");
  v33[3] = CFSTR("texttone:Anticipate");
  v33[4] = v15;
  v33[5] = CFSTR("Anticipate.m4r");
  v33[6] = CFSTR("texttone:Bell");
  v33[7] = v15;
  v33[8] = CFSTR("Bell.m4r");
  v33[9] = CFSTR("texttone:Bloom");
  v33[10] = v15;
  v33[11] = CFSTR("Bloom.m4r");
  v33[12] = CFSTR("texttone:Calypso");
  v33[13] = v15;
  v33[14] = CFSTR("Calypso.m4r");
  v33[15] = CFSTR("texttone:Chime");
  v33[16] = v15;
  v33[17] = CFSTR("Chime.m4r");
  v33[18] = CFSTR("texttone:Choo Choo");
  v33[19] = v15;
  v33[20] = CFSTR("Choo Choo.m4r");
  v33[21] = CFSTR("texttone:Descent");
  v33[22] = v15;
  v33[23] = CFSTR("Descent.m4r");
  v33[24] = CFSTR("texttone:New Mail");
  v33[25] = v15;
  v33[26] = CFSTR("Ding.m4r");
  v33[27] = CFSTR("texttone:Electronic");
  v33[28] = v15;
  v33[29] = CFSTR("Electronic.m4r");
  v33[30] = CFSTR("texttone:Fanfare");
  v33[31] = v15;
  v33[32] = CFSTR("Fanfare.m4r");
  v33[33] = CFSTR("texttone:Glass");
  v33[34] = v15;
  v33[35] = CFSTR("Glass.m4r");
  v33[36] = CFSTR("texttone:Horn");
  v33[37] = v15;
  v33[38] = CFSTR("Horn.m4r");
  v33[39] = CFSTR("texttone:Ladder");
  v33[40] = v15;
  v33[41] = CFSTR("Ladder.m4r");
  v33[42] = CFSTR("texttone:Minuet");
  v33[43] = v15;
  v33[44] = CFSTR("Minuet.m4r");
  v33[45] = CFSTR("texttone:News Flash");
  v33[46] = v15;
  v33[47] = CFSTR("News Flash.m4r");
  v33[48] = CFSTR("texttone:Noir");
  v33[49] = v15;
  v33[50] = CFSTR("Noir.m4r");
  v33[51] = CFSTR("texttone:Sherwood Forest");
  v33[52] = v15;
  v33[53] = CFSTR("Sherwood Forest.m4r");
  v33[54] = CFSTR("texttone:Spell");
  v33[55] = v15;
  v33[56] = CFSTR("Spell.m4r");
  v33[57] = CFSTR("texttone:Suspense");
  v33[58] = v15;
  v33[59] = CFSTR("Suspense.m4r");
  v33[60] = CFSTR("texttone:Sharing Post");
  v33[61] = v15;
  v33[62] = CFSTR("Swish.m4r");
  v33[63] = CFSTR("texttone:Sent Mail");
  v33[64] = v15;
  v33[65] = CFSTR("Swoosh.m4r");
  v33[66] = CFSTR("texttone:Telegraph");
  v33[67] = v15;
  v33[68] = CFSTR("Telegraph.m4r");
  v33[69] = CFSTR("texttone:Tiptoes");
  v33[70] = v15;
  v33[71] = CFSTR("Tiptoes.m4r");
  v33[72] = CFSTR("texttone:Tri-tone");
  v33[73] = v15;
  v33[74] = CFSTR("Tri-Tone.m4r");
  v33[75] = CFSTR("texttone:Sent Tweet");
  v33[76] = v15;
  v33[77] = CFSTR("Tweet.m4r");
  v33[78] = CFSTR("texttone:Typewriters");
  v33[79] = v15;
  v33[80] = CFSTR("Typewriters.m4r");
  v33[81] = CFSTR("texttone:Update");
  v33[82] = v15;
  v33[83] = CFSTR("Update.m4r");
  v33[84] = CFSTR("texttone:Note");
  v33[85] = v16;
  v33[86] = CFSTR("Note.m4r");
  v33[87] = CFSTR("texttone:Bamboo");
  v33[88] = v16;
  v33[89] = CFSTR("Bamboo.m4r");
  v33[90] = CFSTR("texttone:Complete");
  v33[91] = v16;
  v33[92] = CFSTR("Complete.m4r");
  v33[93] = CFSTR("texttone:Hello");
  v33[94] = v16;
  v33[95] = CFSTR("Hello.m4r");
  v33[96] = CFSTR("texttone:Popcorn");
  v33[97] = v16;
  v33[98] = CFSTR("Popcorn.m4r");
  v33[99] = CFSTR("texttone:Synth");
  v33[100] = v16;
  v33[101] = CFSTR("Synth.m4r");
  v33[102] = CFSTR("texttone:Aurora");
  v33[103] = v16;
  v33[104] = CFSTR("Aurora.m4r");
  v33[105] = CFSTR("texttone:Keys");
  v33[106] = v16;
  v33[107] = CFSTR("Keys.m4r");
  v33[108] = CFSTR("texttone:Circles");
  v33[109] = v16;
  v33[110] = CFSTR("Circles.m4r");
  v33[111] = CFSTR("texttone:Input");
  v33[112] = v16;
  v33[113] = CFSTR("Input.m4r");
  v33[114] = CFSTR("texttone:Antic");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = CFSTR("Antic-EncoreInfinitum.caf");
  v36 = CFSTR("texttone:Cheers");
  v37 = v34;
  v38 = CFSTR("Cheers-EncoreInfinitum.caf");
  v39 = CFSTR("texttone:Droplet");
  v40 = v34;
  v41 = CFSTR("Droplet-EncoreInfinitum.caf");
  v42 = CFSTR("texttone:Handoff");
  v43 = v34;
  v44 = CFSTR("Handoff-EncoreInfinitum.caf");
  v45 = CFSTR("texttone:Milestone");
  v46 = v34;
  v47 = CFSTR("Milestone-EncoreInfinitum.caf");
  v48 = CFSTR("texttone:Passage");
  v49 = v34;
  v50 = CFSTR("Passage-EncoreInfinitum.caf");
  v51 = CFSTR("texttone:Portal");
  v52 = v34;
  v53 = CFSTR("Portal-EncoreInfinitum.caf");
  v54 = CFSTR("texttone:Rattle");
  v55 = v34;
  v56 = CFSTR("Rattle-EncoreInfinitum.caf");
  v57 = CFSTR("texttone:Rebound");
  v58 = v34;
  v59 = CFSTR("Rebound-EncoreInfinitum.caf");
  v60 = CFSTR("texttone:Slide");
  v61 = v34;
  v62 = CFSTR("Slide-EncoreInfinitum.caf");
  v63 = CFSTR("texttone:Welcome");
  v29 = (void *)v34;
  v64 = v34;
  v65 = CFSTR("Welcome-EncoreInfinitum.caf");
  v66 = CFSTR("texttone:Calendar Alert");
  v67 = v16;
  v68 = CFSTR("Chord.m4r");
  v69 = CFSTR("texttone:Air Drop Invitation");
  v70 = v16;
  v71 = CFSTR("Pulse.m4r");
  v72 = CFSTR("texttone:Photos Sharing Post");
  v73 = v14;
  v74 = CFSTR("PhotosSharingPostTone.caf");
  v75 = CFSTR("texttone:Photos Memory");
  v76 = v14;
  v77 = CFSTR("PhotosMemoriesNotification.caf");
  v78 = CFSTR("texttone:System Background Mic Usage");
  v79 = v14;
  v80 = CFSTR("Background-Mic-Usage.wav");
  v81 = CFSTR("texttone:SOS-Countdown-Tick");
  v82 = v14;
  v83 = CFSTR("SOS-Countdown-Tick.caf");
  v84 = CFSTR("texttone:Text-Message-Acknowledgment-Heart");
  v85 = v14;
  v86 = CFSTR("Text-Message-Acknowledgement-Heart.caf");
  v87 = CFSTR("texttone:Text-Message-Acknowledgment-Thumbs-Up");
  v88 = v14;
  v89 = CFSTR("Text-Message-Acknowledgement-ThumbsUp.caf");
  v90 = CFSTR("texttone:Text-Message-Acknowledgment-Thumbs-Down");
  v91 = v14;
  v92 = CFSTR("Text-Message-Acknowledgement-ThumbsDown.caf");
  v93 = CFSTR("texttone:Text-Message-Acknowledgment-HaHa");
  v94 = v14;
  v95 = CFSTR("Text-Message-Acknowledgement-HaHa.caf");
  v96 = CFSTR("texttone:Text-Message-Acknowledgment-Exclamation");
  v97 = v14;
  v98 = CFSTR("Text-Message-Acknowledgement-Exclamation.caf");
  v99 = CFSTR("texttone:Text-Message-Acknowledgment-Question-Mark");
  v101 = CFSTR("Text-Message-Acknowledgement-QuestionMark.caf");
  v100 = v14;
  do
  {
    v18 = (id)v33[v17 + 1];
    v19 = (id)v33[v17 + 2];
    v20 = v19;
    if (v18)
      v21 = v19 == 0;
    else
      v21 = 1;
    if (v21)
    {
      v22 = 0;
    }
    else
    {
      objc_msgSend(v18, "stringByAppendingPathComponent:", v19);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v23, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }

    }
    v25 = [TLSystemTone alloc];
    v26 = -[TLSystemTone initWithSoundFileURL:actualSoundID:previewSoundID:requiresLongFormPlayback:](v25, "initWithSoundFileURL:actualSoundID:previewSoundID:requiresLongFormPlayback:", v22, kSystemSoundID_InvalidTone, kSystemSoundID_InvalidTone, 0);
    if (v26)
      objc_msgSend(v4, "setObject:forKey:", v26, v33[v17]);

    v17 += 3;
  }
  while (v17 != 183);
  v27 = objc_msgSend(v4, "copy");
  systemTonesByIdentifier = v32->_systemTonesByIdentifier;
  v32->_systemTonesByIdentifier = (NSDictionary *)v27;

}

- (void)_loadToneIdentifierAliasMap
{
  NSDictionary *toneIdentifierAliasMap;

  toneIdentifierAliasMap = self->_toneIdentifierAliasMap;
  self->_toneIdentifierAliasMap = (NSDictionary *)&unk_1E9538128;

}

- (id)_aliasForToneIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__TLToneManager__aliasForToneIdentifier___block_invoke;
    v9[3] = &unk_1E952A770;
    v11 = &v12;
    v9[4] = self;
    v10 = v4;
    -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v9);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __41__TLToneManager__aliasForToneIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (BOOL)_toneWithIdentifierIsDefaultRingtone:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TLToneManager defaultRingtoneIdentifier](self, "defaultRingtoneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)_toneWithIdentifierIsNonDefaultSystemRingtone:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("system:"));
}

- (BOOL)_toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = !-[TLToneManager _toneWithIdentifierIsSystemTone:](self, "_toneWithIdentifierIsSystemTone:", v4)
    && -[TLToneManager _toneWithIdentifierIsNonDefaultSystemRingtone:](self, "_toneWithIdentifierIsNonDefaultSystemRingtone:", v4);

  return v5;
}

- (BOOL)_toneWithIdentifierIsITunesRingtone:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("itunes:"));
}

- (BOOL)_toneWithIdentifierIsSystemTone:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v13 = objc_msgSend(v4, "hasPrefix:", CFSTR("texttone:"));
  if (*((_BYTE *)v11 + 24))
  {
    v5 = 1;
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__TLToneManager__toneWithIdentifierIsSystemTone___block_invoke;
    v7[3] = &unk_1E952A888;
    v7[4] = self;
    v8 = v4;
    v9 = &v10;
    -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v7);

    v5 = *((_BYTE *)v11 + 24) != 0;
  }
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __49__TLToneManager__toneWithIdentifierIsSystemTone___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_aliasForToneIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 != 0;

}

- (BOOL)_toneWithIdentifierIsAlarmWakeUp:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("alarmWakeUp:"));
}

- (BOOL)_toneWithIdentifierIsMediaPlaybackArchive:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("mediaPlaybackArchive:")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[TLToneManager _underlyingPlaybackArchiveForToneIdentifier:](self, "_underlyingPlaybackArchiveForToneIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (id)_newServiceConnection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.tonelibraryd"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFCD7010);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);
  objc_msgSend(v2, "resume");

  return v2;
}

- (id)_tonePreferencesFromService
{
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__TLToneManager__tonePreferencesFromService__block_invoke;
  v17[3] = &unk_1E952A6F8;
  v17[4] = self;
  v17[5] = &v18;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v17);
  v4 = (void *)v19[5];
  if (!v4)
  {
    v5 = -[TLToneManager _newServiceConnection](self, "_newServiceConnection");
    v15[0] = v3;
    v15[1] = 3221225472;
    v15[2] = __44__TLToneManager__tonePreferencesFromService__block_invoke_2;
    v15[3] = &unk_1E952A8B0;
    v6 = dispatch_semaphore_create(0);
    v16 = v6;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __44__TLToneManager__tonePreferencesFromService__block_invoke_544;
    v12[3] = &unk_1E952A8D8;
    v14 = &v18;
    v8 = v6;
    v13 = v8;
    objc_msgSend(v7, "retrieveCurrentTonePreferencesWithCompletionHandler:", v12);

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(v5, "invalidate");
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __44__TLToneManager__tonePreferencesFromService__block_invoke_546;
    v11[3] = &unk_1E952A860;
    v11[4] = self;
    v11[5] = &v18;
    -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v11);

    v4 = (void *)v19[5];
  }
  v9 = v4;
  _Block_object_dispose(&v18, 8);

  return v9;
}

void __44__TLToneManager__tonePreferencesFromService__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

void __44__TLToneManager__tonePreferencesFromService__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TLLogToneManagement();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __44__TLToneManager__tonePreferencesFromService__block_invoke_2_cold_1(v3);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44__TLToneManager__tonePreferencesFromService__block_invoke_544(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else if (v7)
  {
    TLLogToneManagement();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __44__TLToneManager__tonePreferencesFromService__block_invoke_544_cold_1(v8);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __44__TLToneManager__tonePreferencesFromService__block_invoke_546(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (BOOL)_setToneIdentifierUsingService:(id)a3 keyedByTopic:(id)a4 forPreferenceKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  dispatch_semaphore_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v11 = -[TLToneManager _newServiceConnection](self, "_newServiceConnection");
  v12 = dispatch_semaphore_create(0);
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke;
  v21[3] = &unk_1E952A8B0;
  v14 = v12;
  v22 = v14;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke_547;
  v18[3] = &unk_1E952A900;
  v20 = &v23;
  v16 = v14;
  v19 = v16;
  objc_msgSend(v15, "setCurrentToneIdentifier:keyedByTopic:forPreferenceKey:completionHandler:", v8, v9, v10, v18);

  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v11, "invalidate");
  LOBYTE(v15) = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return (char)v15;
}

void __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TLLogToneManagement();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke_cold_1(v3);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke_547(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else if (v5)
  {
    TLLogToneManagement();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke_547_cold_1(v6);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)currentToneIdentifierForAlertType:(int64_t)a3
{
  return -[TLToneManager currentToneIdentifierForAlertType:topic:](self, "currentToneIdentifierForAlertType:topic:", a3, 0);
}

- (void)setCurrentToneIdentifier:(id)a3 forAlertType:(int64_t)a4
{
  -[TLToneManager setCurrentToneIdentifier:forAlertType:topic:](self, "setCurrentToneIdentifier:forAlertType:topic:", a3, a4, 0);
}

+ (id)_systemWideTonePreferenceKeyForAlertType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x1C)
    return 0;
  else
    return _TLToneManagerSystemWideTonePreferenceKeys[a3 - 1];
}

- (id)_currentToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  return -[TLToneManager _currentToneIdentifierForAlertType:topic:allowsFallbackToDefaultPreferablyNonSilentToneForInvalidPersistedValue:](self, "_currentToneIdentifierForAlertType:topic:allowsFallbackToDefaultPreferablyNonSilentToneForInvalidPersistedValue:", a3, a4, 1);
}

- (id)_currentToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4 allowsFallbackToDefaultPreferablyNonSilentToneForInvalidPersistedValue:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const char *v22;
  __CFString *v23;
  __CFString *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  _BOOL4 v46;
  NSObject *cf;
  NSObject *v48;
  NSObject *v49;
  uint8_t buf[4];
  TLToneManager *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  _BYTE v57[18];
  uint64_t v58;

  v5 = a5;
  v58 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  TLLogToneManagement();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v51 = self;
    v52 = 2114;
    v53 = v10;
    v54 = 2114;
    v55 = (uint64_t)v8;
    v56 = 1024;
    *(_DWORD *)v57 = v5;
    _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) topic:(%{public}@) allowsFallbackToDefaultPreferablyNonSilentToneForInvalidPersistedValue:(%{BOOL}u).", buf, 0x26u);

  }
  v11 = objc_msgSend(v8, "length");
  objc_msgSend((id)objc_opt_class(), "_systemWideTonePreferenceKeyForAlertType:", a3);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && v11)
  {
    -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("-per-account"));
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (__CFString *)v14;
  }
  v15 = 0;
  LODWORD(v16) = 0;
  if (!objc_msgSend(0, "length") && v13)
  {
    if (self->_shouldUseServiceToAccessTonePreferences)
    {
      -[TLToneManager _tonePreferencesFromService](self, "_tonePreferencesFromService");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      TLLogToneManagement();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(a3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v51 = self;
        v52 = 2114;
        v53 = v20;
        v54 = 2114;
        v55 = (uint64_t)v13;
        v56 = 2114;
        *(_QWORD *)v57 = v18;
        _os_log_impl(&dword_1D33D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Read Preferences value for key '%{public}@' from service: %{public}@.", buf, 0x2Au);

      }
      if (v11)
      {
        objc_msgSend(v18, "objectForKey:", v8);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        TLLogToneManagement();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromTLAlertType(a3);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v51 = self;
          v52 = 2114;
          v53 = v21;
          v54 = 2114;
          v55 = (uint64_t)v15;
          v22 = "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Per-topic: currentToneIdentifier = %{public}@.";
LABEL_23:
          _os_log_impl(&dword_1D33D5000, v16, OS_LOG_TYPE_DEFAULT, v22, buf, 0x20u);

        }
      }
      else
      {
        v15 = v18;
        TLLogToneManagement();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromTLAlertType(a3);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v51 = self;
          v52 = 2114;
          v53 = v21;
          v54 = 2114;
          v55 = (uint64_t)v15;
          v22 = "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. currentToneIdentifier = %{public}@.";
          goto LABEL_23;
        }
      }

      LODWORD(v16) = 0;
      goto LABEL_41;
    }
    v23 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
    if (!v23)
    {
      LODWORD(v16) = 0;
      v15 = 0;
      goto LABEL_41;
    }
    v24 = v23;
    v16 = CFPreferencesCopyAppValue(v13, v23);
    TLLogToneManagement();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromTLAlertType(a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v51 = self;
      v52 = 2114;
      v53 = v26;
      v54 = 2114;
      v55 = (uint64_t)v13;
      v56 = 2114;
      *(_QWORD *)v57 = v24;
      *(_WORD *)&v57[8] = 2114;
      *(_QWORD *)&v57[10] = v16;
      _os_log_impl(&dword_1D33D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Read Preferences value for key '%{public}@' from domain '%{public}@': %{public}@.", buf, 0x34u);

    }
    if (!v16)
    {
      v15 = 0;
LABEL_40:
      CFRelease(v24);
      goto LABEL_41;
    }
    if (v11)
    {
      -[NSObject objectForKey:](v16, "objectForKey:", v8);
      v27 = objc_claimAutoreleasedReturnValue();
      TLLogToneManagement();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(a3);
        v48 = v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = self;
        v52 = 2114;
        v53 = v29;
        v54 = 2114;
        v55 = (uint64_t)v48;
        v30 = "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Per-topic: persistedToneIdentifier = %{public}@.";
LABEL_29:
        _os_log_impl(&dword_1D33D5000, v28, OS_LOG_TYPE_DEFAULT, v30, buf, 0x20u);

        v27 = v48;
      }
    }
    else
    {
      v27 = v16;
      TLLogToneManagement();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(a3);
        v48 = v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = self;
        v52 = 2114;
        v53 = v29;
        v54 = 2114;
        v55 = (uint64_t)v48;
        v30 = "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. persistedToneIdentifier = %{public}@.";
        goto LABEL_29;
      }
    }

    cf = v16;
    if (-[NSObject length](v27, "length"))
    {
      v49 = v27;
      v46 = -[TLToneManager toneWithIdentifierIsValid:](self, "toneWithIdentifierIsValid:", v27);
      if (v46)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v27);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        TLLogToneManagement();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromTLAlertType(a3);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v51 = self;
          v52 = 2114;
          v53 = v32;
          v54 = 2114;
          v55 = (uint64_t)v15;
          _os_log_impl(&dword_1D33D5000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. currentToneIdentifier = %{public}@.", buf, 0x20u);

        }
      }
      else
      {
        TLLogToneManagement();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromTLAlertType(a3);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = self;
          v52 = 2114;
          v53 = v33;
          _os_log_impl(&dword_1D33D5000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. persistedToneIdentifierWasInvalid = YES.", buf, 0x16u);

        }
        v15 = 0;
      }
      LODWORD(v16) = !v46;

      v27 = v49;
    }
    else
    {
      LODWORD(v16) = 0;
      v15 = 0;
    }
    CFRelease(cf);

    goto LABEL_40;
  }
LABEL_41:
  if (objc_msgSend(v15, "length") || !v11)
  {
    if (!(_DWORD)v16)
      goto LABEL_62;
  }
  else
  {
    -[TLToneManager _currentToneIdentifierForAlertType:topic:](self, "_currentToneIdentifierForAlertType:topic:", a3, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    TLLogToneManagement();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromTLAlertType(a3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = self;
      v52 = 2114;
      v53 = v36;
      v54 = 2114;
      v55 = (uint64_t)v34;
      _os_log_impl(&dword_1D33D5000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Falling back to current tone without topic. currentToneIdentifier = %{public}@.", buf, 0x20u);

    }
    if (!(_DWORD)v16)
    {
      v15 = v34;
      goto LABEL_62;
    }
    if (objc_msgSend(v34, "isEqualToString:", CFSTR("<none>")))
    {

      TLLogToneManagement();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(a3);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = self;
        v52 = 2114;
        v53 = v38;
        v54 = 2114;
        v55 = 0;
        _os_log_impl(&dword_1D33D5000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Persisted value was invalid, and fallback value is none. Ignoring fallback value. currentToneIdentifier = %{public}@.", buf, 0x20u);

      }
      v15 = 0;
    }
    else
    {
      v15 = v34;
    }
  }
  if (!objc_msgSend(v15, "length"))
  {
    if (v5)
    {
      -[TLToneManager _defaultPreferablyNonSilentToneIdentifierForAlertType:topic:](self, "_defaultPreferablyNonSilentToneIdentifierForAlertType:topic:", a3, v8);
      v39 = objc_claimAutoreleasedReturnValue();

      TLLogToneManagement();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(a3);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = self;
        v52 = 2114;
        v53 = v41;
        v54 = 2114;
        v55 = v39;
        _os_log_impl(&dword_1D33D5000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Persisted value was invalid; falling back to"
          " non-silent default tone. currentToneIdentifier = %{public}@.",
          buf,
          0x20u);

      }
    }
    else
    {
      TLLogVibrationManagement();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType(a3);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = self;
        v52 = 2114;
        v53 = v42;
        v54 = 2114;
        v55 = (uint64_t)v15;
        _os_log_impl(&dword_1D33D5000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) […]. Persisted value was invalid, but falling back to non-silent default tone is disallowed. currentToneIdentifier = %{public}@.", buf, 0x20u);

      }
      v39 = (uint64_t)v15;
    }

    v15 = (id)v39;
  }
LABEL_62:
  TLLogToneManagement();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v51 = self;
    v52 = 2114;
    v53 = v44;
    v54 = 2114;
    v55 = (uint64_t)v8;
    v56 = 1024;
    *(_DWORD *)v57 = v5;
    *(_WORD *)&v57[4] = 2114;
    *(_QWORD *)&v57[6] = v15;
    _os_log_impl(&dword_1D33D5000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneIdentifierForAlertType:(%{public}@) topic:(%{public}@) allowsFallbackToDefaultPreferablyNonSilentToneForInvalidPersistedValue:(%{BOOL}u). Returning: %{public}@.", buf, 0x30u);

  }
  return v15;
}

- (id)currentToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  int v28;
  TLToneManager *v29;
  __int16 v30;
  NSObject *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  TLLogToneManagement();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v28 = 138543874;
    v29 = self;
    v30 = 2114;
    v31 = v8;
    v32 = 2114;
    v33 = v6;
    _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) topic:(%{public}@).", (uint8_t *)&v28, 0x20u);

  }
  if (+[TLAlert _currentOverridePolicyForType:](TLAlert, "_currentOverridePolicyForType:", a3) != 1)
    goto LABEL_7;
  v9 = CFSTR("<none>");
  TLLogToneManagement();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v11 = objc_claimAutoreleasedReturnValue();
    v28 = 138543874;
    v29 = self;
    v30 = 2114;
    v31 = v11;
    v32 = 2114;
    v33 = v9;
    _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Falling back to none due to alert override policy. toneIdentifier = %{public}@.", (uint8_t *)&v28, 0x20u);

  }
  if (!v9)
  {
LABEL_7:
    if (v6)
    {
      if (a3 == 13)
      {
        if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("TLAlertTopicAlarmGoToSleep")))
        {
          TLLogToneManagement();
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
          {
LABEL_29:

LABEL_30:
            -[TLToneManager defaultToneIdentifierForAlertType:topic:](self, "defaultToneIdentifierForAlertType:topic:", a3, v6);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
            TLLogToneManagement();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromTLAlertType(a3);
              v18 = objc_claimAutoreleasedReturnValue();
              v28 = 138543874;
              v29 = self;
              v30 = 2114;
              v31 = v18;
              v32 = 2114;
              v33 = v9;
              _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Falling back to default due missing setting in Preferences. toneIdentifier = %{public}@.", (uint8_t *)&v28, 0x20u);

            }
            goto LABEL_33;
          }
          NSStringFromTLAlertType(0xDuLL);
          v13 = objc_claimAutoreleasedReturnValue();
          v28 = 138543874;
          v29 = self;
          v30 = 2114;
          v31 = v13;
          v32 = 2114;
          v33 = v6;
          _os_log_impl(&dword_1D33D5000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Skipping Preferences lookup for topic %{public}@.", (uint8_t *)&v28, 0x20u);
LABEL_28:

          goto LABEL_29;
        }
      }
      else if (a3 == 2)
      {
        if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentHeart")) & 1) != 0|| (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentThumbsUp")) & 1) != 0|| (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentThumbsDown")) & 1) != 0|| (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentHaHa")) & 1) != 0|| (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentExclamation")) & 1) != 0)
        {
          v12 = 1;
        }
        else
        {
          v12 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentQuestionMark"));
        }
        goto LABEL_20;
      }
    }
    v12 = 0;
LABEL_20:
    -[TLToneManager _currentToneIdentifierForAlertType:topic:](self, "_currentToneIdentifierForAlertType:topic:", a3, v6);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    TLLogToneManagement();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromTLAlertType(a3);
      v15 = objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = self;
      v30 = 2114;
      v31 = v15;
      v32 = 2114;
      v33 = v9;
      _os_log_impl(&dword_1D33D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Value from Preferences lookup method: toneIdentifier = %{public}@.", (uint8_t *)&v28, 0x20u);

    }
    if (!v12 || (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("<none>")) & 1) != 0)
    {
      if (v9)
        goto LABEL_33;
      goto LABEL_30;
    }
    TLLogToneManagement();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromTLAlertType(a3);
      v16 = objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = self;
      v30 = 2114;
      v31 = v16;
      v32 = 2114;
      v33 = CFSTR("<none>");
      _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Value from Preferences lookup method was not %{public}@; ignoring it.",
        (uint8_t *)&v28,
        0x20u);

    }
    goto LABEL_28;
  }
LABEL_33:
  if (a3 == 18)
  {
    -[TLToneManager currentToneIdentifierForAlertType:topic:](self, "currentToneIdentifierForAlertType:topic:", 2, v6);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    TLLogToneManagement();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromTLAlertType(0x12uLL);
      v23 = objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = self;
      v30 = 2114;
      v31 = v23;
      v32 = 2114;
      v33 = (const __CFString *)v19;
      _os_log_impl(&dword_1D33D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Detected alert type for emergency alert. Resolving to current tone identifier for text messages: toneIdentifier = %{public}@.", (uint8_t *)&v28, 0x20u);

    }
    v20 = (__CFString *)v19;
    goto LABEL_48;
  }
  if (a3 == 3)
  {
    -[TLToneManager currentToneIdentifierForAlertType:topic:](self, "currentToneIdentifierForAlertType:topic:", 2, v6);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject isEqualToString:](v19, "isEqualToString:", CFSTR("<none>")))
    {
      v20 = v9;
      goto LABEL_48;
    }
    v20 = CFSTR("<none>");

    TLLogToneManagement();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromTLAlertType(3uLL);
      v24 = objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = self;
      v30 = 2114;
      v31 = v24;
      v32 = 2114;
      v33 = v20;
      _os_log_impl(&dword_1D33D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Detected alert type for text message in conversation. toneIdentifier = %{public}@.", (uint8_t *)&v28, 0x20u);

    }
    goto LABEL_46;
  }
  if (a3 == 2
    && -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageInConversation"))&& (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("<none>")) & 1) == 0)
  {

    TLLogToneManagement();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("texttone:Text-Message-Alert-In-Conversation");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
LABEL_48:

      v9 = v20;
      goto LABEL_49;
    }
    NSStringFromTLAlertType(2uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    v28 = 138543874;
    v29 = self;
    v30 = 2114;
    v31 = v21;
    v32 = 2114;
    v33 = CFSTR("texttone:Text-Message-Alert-In-Conversation");
    _os_log_impl(&dword_1D33D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) […]: Detected topic for text message in conversation. toneIdentifier = %{public}@.", (uint8_t *)&v28, 0x20u);
LABEL_46:

    goto LABEL_48;
  }
LABEL_49:
  TLLogToneManagement();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v26 = objc_claimAutoreleasedReturnValue();
    v28 = 138544130;
    v29 = self;
    v30 = 2114;
    v31 = v26;
    v32 = 2114;
    v33 = v6;
    v34 = 2114;
    v35 = v9;
    _os_log_impl(&dword_1D33D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentToneIdentifierForAlertType:(%{public}@) topic:(%{public}@). Returning: %{public}@.", (uint8_t *)&v28, 0x2Au);

  }
  return v9;
}

- (void)setCurrentToneIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  const __CFString *v21;
  void *v22;
  const void *v23;
  id v24;
  _BYTE v25[24];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v9, "length");
  TLLogToneManagement();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      NSStringFromTLAlertType(a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v25 = 138543874;
      *(_QWORD *)&v25[4] = v8;
      *(_WORD *)&v25[12] = 2114;
      *(_QWORD *)&v25[14] = v13;
      *(_WORD *)&v25[22] = 2114;
      v26 = v9;
      v14 = "setCurrentToneIdentifier:@\"%{public}@\" forAlertType:%{public}@ topic:@\"%{public}@\";
      v15 = v11;
      v16 = 32;
LABEL_6:
      _os_log_impl(&dword_1D33D5000, v15, OS_LOG_TYPE_DEFAULT, v14, v25, v16);

    }
  }
  else if (v12)
  {
    NSStringFromTLAlertType(a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v25 = 138543618;
    *(_QWORD *)&v25[4] = v8;
    *(_WORD *)&v25[12] = 2114;
    *(_QWORD *)&v25[14] = v13;
    v14 = "setCurrentToneIdentifier:@\"%{public}@\" forAlertType:%{public}@";
    v15 = v11;
    v16 = 22;
    goto LABEL_6;
  }

  objc_msgSend((id)objc_opt_class(), "_systemWideTonePreferenceKeyForAlertType:", a4);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v10 && v17)
  {
    -[__CFString stringByAppendingString:](v17, "stringByAppendingString:", CFSTR("-per-account"));
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (__CFString *)v19;
  }
  if (v18)
  {
    if (self->_shouldUseServiceToAccessTonePreferences)
    {
      if (!-[TLToneManager _setToneIdentifierUsingService:keyedByTopic:forPreferenceKey:](self, "_setToneIdentifierUsingService:keyedByTopic:forPreferenceKey:", v8, v9, v18))goto LABEL_32;
    }
    else
    {
      v20 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
      if (!v20)
        goto LABEL_32;
      v21 = v20;
      if (v10)
      {
        v22 = (void *)CFPreferencesCopyAppValue(v18, v20);
        if (v22)
        {
          v23 = v22;
          v24 = (id)objc_msgSend(v22, "mutableCopy");
          CFRelease(v23);
        }
        else if (objc_msgSend(v8, "length"))
        {
          v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        }
        else
        {
          v24 = 0;
        }
        if (objc_msgSend(v8, "length", *(_OWORD *)v25, *(_QWORD *)&v25[16], v26))
        {
          objc_msgSend(v24, "setObject:forKey:", v8, v9);
        }
        else
        {
          objc_msgSend(v24, "removeObjectForKey:", v9);
          if (!objc_msgSend(v24, "count"))
          {

            v24 = 0;
          }
        }
        CFPreferencesSetAppValue(v18, v24, v21);

      }
      else
      {
        CFPreferencesSetAppValue(v18, v8, v20);
      }
      CFRelease(v21);
    }
    -[TLToneManager _didSetTonePreferenceSuccessfullyWithKey:inDomain:usingPreferencesOfKind:](self, "_didSetTonePreferenceSuccessfullyWithKey:inDomain:usingPreferencesOfKind:", v18, +[TLPreferencesUtilities preferencesDomain](TLPreferencesUtilities, "preferencesDomain", *(_QWORD *)v25, *(_OWORD *)&v25[8]), 1);
    if ((!v8 || (objc_msgSend(v8, "isEqualToString:", CFSTR("<none>")) & 1) == 0)
      && +[TLAlert _currentOverridePolicyForType:](TLAlert, "_currentOverridePolicyForType:", a4) == 1)
    {
      +[TLAlert _setCurrentOverridePolicy:forType:](TLAlert, "_setCurrentOverridePolicy:forType:", 0, a4);
    }
  }
LABEL_32:

}

- (id)currentToneNameForAlertType:(int64_t)a3
{
  void *v4;
  void *v5;

  -[TLToneManager currentToneIdentifierForAlertType:](self, "currentToneIdentifierForAlertType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager nameForToneIdentifier:](self, "nameForToneIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unsigned)currentToneSoundIDForAlertType:(int64_t)a3
{
  return -[TLToneManager currentToneSoundIDForAlertType:topic:](self, "currentToneSoundIDForAlertType:topic:", a3, 0);
}

- (unsigned)currentToneSoundIDForAlertType:(int64_t)a3 topic:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;

  v6 = a4;
  -[TLToneManager currentToneIdentifierForAlertType:topic:](self, "currentToneIdentifierForAlertType:topic:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _soundForToneIdentifier:](self, "_soundForToneIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[TLToneManager defaultToneIdentifierForAlertType:topic:](self, "defaultToneIdentifierForAlertType:topic:", a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLToneManager _soundForToneIdentifier:](self, "_soundForToneIdentifier:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = objc_msgSend(v8, "soundID");

  return v10;
}

+ (id)_defaultWatchToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  __CFString *v15;
  const __CFString *v16;
  NSObject *v17;
  void *v18;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((unint64_t)(a3 - 1) > 0x1C)
  {
    v7 = 0;
  }
  else
  {
    v7 = _TLToneManagerDefaultWatchIdentifiers[a3 - 1];
    if (!-[__CFString length](v7, "length"))
    {
      v8 = CFSTR("<none>");

      v7 = v8;
    }
  }
  if (a3 == 28 || a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("us"));
    if (a3 == 1)
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("_TLAlertTopicIncomingCallDeemphasized")) & 1) == 0)
      {
LABEL_14:
        if (v11)
        {

          v7 = CFSTR("texttone:Incoming-Call-Haptic-UK");
        }
        goto LABEL_16;
      }
    }
    else if (!objc_msgSend(v6, "isEqualToString:", CFSTR("_TLAlertTopicClassroomDeemphasized")))
    {
      goto LABEL_14;
    }

    if (v11)
      v7 = CFSTR("texttone:Incoming-Call-Haptic-Deemphasized-UK");
    else
      v7 = CFSTR("texttone:Incoming-Call-Haptic-Deemphasized-US");
LABEL_16:

  }
  +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "supportsNanoEncore");

  if (v13)
  {
    if (a3 == 1)
    {
      v14 = objc_msgSend(v6, "isEqualToString:", CFSTR("_TLAlertTopicIncomingCallDeemphasized"));

      if (v14)
        v7 = CFSTR("system:Pebbles-Deemphasized");
      else
        v7 = CFSTR("system:Pebbles");
LABEL_41:
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicIncomingCallFaceTimeGroupInvitation")) & 1) != 0)
      {
        v15 = CFSTR("texttone:FaceTime-Group-Invitation");
      }
      else
      {
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicIncomingCallFaceTimeParticipantJoined")) & 1) == 0)
          goto LABEL_108;
        v15 = CFSTR("texttone:FaceTime-Participant-Joined");
      }
      goto LABEL_107;
    }
    v15 = CFSTR("texttone:Resonate");
    switch(a3)
    {
      case 2:

        v7 = CFSTR("texttone:Resonate");
        goto LABEL_57;
      case 3:
      case 6:
      case 7:
      case 8:
      case 9:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 18:
        goto LABEL_40;
      case 4:
        break;
      case 5:

        v7 = CFSTR("texttone:Resonate");
        goto LABEL_60;
      case 10:
      case 11:
        v15 = CFSTR("texttone:Moment");
        break;
      case 17:

        v7 = CFSTR("texttone:Globe");
LABEL_64:
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicAppNotificationCriticalAlert")) & 1) != 0)
        {
          v15 = CFSTR("texttone:App-Notification-Critical-Alert");
          break;
        }
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicAppNotificationFirstParty")) & 1) == 0)
          goto LABEL_108;
        v15 = CFSTR("texttone:App-Notification-First-Party-Haptic");
        break;
      case 19:
        goto LABEL_31;
      case 20:
        goto LABEL_25;
      default:
        if (a3 == 24)
          goto LABEL_38;
        goto LABEL_40;
    }
LABEL_107:

    v7 = v15;
    goto LABEL_108;
  }
  switch(a3)
  {
    case 19:
LABEL_31:
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicActivityGoalAttained")) & 1) != 0)
      {
        v15 = CFSTR("texttone:Activity-Goal-Attained-Haptic");
      }
      else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicActivityGoalBehind")) & 1) != 0)
      {
        v15 = CFSTR("texttone:Activity-Goal-Behind-Haptic");
      }
      else
      {
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicActivityFriendsGoalAttained")) & 1) == 0)
          break;
        v15 = CFSTR("texttone:Activity-Friends-Goal-Attained-Haptic");
      }
      goto LABEL_107;
    case 24:
LABEL_38:
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicWalkieTalkieActiveStart")) & 1) != 0)
      {
        v15 = CFSTR("texttone:Walkie-Talkie-Active-Start-Haptic");
      }
      else
      {
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicWalkieTalkieActiveEnd")) & 1) == 0)
          break;
        v15 = CFSTR("texttone:Walkie-Talkie-Active-End-Haptic");
      }
      goto LABEL_107;
    case 20:
LABEL_25:
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicPassbookGeofence")))
      {

        v7 = CFSTR("texttone:Passbook-Geofence-Haptic");
      }
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicPassbookNFCScanComplete")) & 1) != 0)
      {
        v15 = CFSTR("texttone:Passbook-NFC-Scan-Complete");
        goto LABEL_107;
      }
      break;
    default:
LABEL_40:
      if (a3 == 1)
        goto LABEL_41;
      if (a3 > 12)
      {
        switch(a3)
        {
          case 13:
            if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicAlarmGoToSleep")) & 1) != 0)
            {
              v16 = CFSTR("texttone:Go-To-Sleep");
            }
            else
            {
              if (!objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicAlarmWakeUp")))
                goto LABEL_85;
              v16 = CFSTR("alarmWakeUp:Early_Riser");
            }

            v7 = (__CFString *)v16;
LABEL_85:
            if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicAlarmNightstand")) & 1) == 0)
              goto LABEL_108;
            v15 = CFSTR("texttone:Alarm-Nightstand-Haptic");
            goto LABEL_107;
          case 16:
            if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationBackgroundMicUsage")) & 1) != 0)
            {
              v15 = CFSTR("texttone:System Background Mic Usage");
              goto LABEL_107;
            }
            if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationDoorbell")) & 1) != 0)
            {
              v15 = CFSTR("system:Doorbell");
              goto LABEL_107;
            }
            if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationElevationAlert")) & 1) != 0)
            {
              v15 = CFSTR("texttone:Elevation Alert");
              goto LABEL_107;
            }
            if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSystemNotificationHeadphoneAudioExposure")) & 1) == 0)
              goto LABEL_108;
            v15 = CFSTR("texttone:Headphone-Audio-Exposure-Limit-Exceeded");
            goto LABEL_107;
          case 17:
            goto LABEL_64;
          case 22:
            if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSOSCountdownTick")) & 1) != 0)
            {
              v15 = CFSTR("texttone:SOS-Countdown-Tick");
              goto LABEL_107;
            }
            if (!objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSOSDialStart"))
              && !objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSOSButtonChordingTimeout"))
              && !objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicSOSCountdownPreannounce")))
            {
              goto LABEL_108;
            }
            v15 = CFSTR("<none>");
            goto LABEL_107;
          case 25:
            if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicHealthUrgent")) & 1) == 0)
              goto LABEL_108;
            v15 = CFSTR("texttone:Health-Urgent");
            goto LABEL_107;
          case 27:
            if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicHandwashingReminder")) & 1) != 0)
            {
              v15 = CFSTR("texttone:Handwashing-Reminder");
              goto LABEL_107;
            }
            if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicHandwashingSessionStart")) & 1) != 0)
            {
              v15 = CFSTR("texttone:Handwashing-Session-Start");
              goto LABEL_107;
            }
            if (!objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicHandwashingSessionEnd")))
              goto LABEL_108;
            v15 = CFSTR("texttone:Handwashing-Session-End");
            break;
          default:
            goto LABEL_108;
        }
        goto LABEL_107;
      }
      if (a3 == 2)
      {
LABEL_57:
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentHeart")) & 1) != 0)
        {
          v15 = CFSTR("texttone:Text-Message-Acknowledgment-Heart");
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentThumbsUp")) & 1) != 0)
        {
          v15 = CFSTR("texttone:Text-Message-Acknowledgment-Thumbs-Up");
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentThumbsDown")) & 1) != 0)
        {
          v15 = CFSTR("texttone:Text-Message-Acknowledgment-Thumbs-Down");
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentHaHa")) & 1) != 0)
        {
          v15 = CFSTR("texttone:Text-Message-Acknowledgment-HaHa");
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentExclamation")) & 1) != 0)
        {
          v15 = CFSTR("texttone:Text-Message-Acknowledgment-Exclamation");
        }
        else
        {
          if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicTextMessageAcknowledgmentQuestionMark")) & 1) == 0)
            break;
          v15 = CFSTR("texttone:Text-Message-Acknowledgment-Question-Mark");
        }
        goto LABEL_107;
      }
      if (a3 != 5)
      {
        if (a3 != 9)
          break;
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicPhotosNotificationSharingPost")) & 1) != 0)
        {
          v15 = CFSTR("texttone:Photos Sharing Post");
        }
        else
        {
          if ((objc_msgSend(v6, "isEqualToString:", CFSTR("TLAlertTopicPhotosNotificationMemory")) & 1) == 0)
            break;
          v15 = CFSTR("texttone:Photos Memory");
        }
        goto LABEL_107;
      }
LABEL_60:
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilemail.bulletin-subsection.VIP")) & 1) != 0
        || (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilemail.bulletin-subsection.ThreadNotify")) & 1) != 0)
      {
        v15 = CFSTR("texttone:New-Mail-Haptic");
        goto LABEL_107;
      }
      break;
  }
LABEL_108:
  TLLogToneManagement();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = a1;
    v22 = 2114;
    v23 = v18;
    v24 = 2114;
    v25 = v6;
    v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: +_defaultWatchToneIdentifierForAlertType:(%{public}@) topic:(%{public}@). Returning: %{public}@.", (uint8_t *)&v20, 0x2Au);

  }
  return v7;
}

- (id)defaultWatchToneIdentifierForAlertType:(int64_t)a3
{
  return -[TLToneManager defaultWatchToneIdentifierForAlertType:topic:](self, "defaultWatchToneIdentifierForAlertType:topic:", a3, 0);
}

- (id)defaultWatchToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "_defaultWatchToneIdentifierForAlertType:topic:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultRingtoneIdentifier
{
  return -[TLToneManager defaultToneIdentifierForAlertType:](self, "defaultToneIdentifierForAlertType:", 1);
}

- (id)_defaultRingtoneName
{
  void *v2;
  int v3;
  void *v4;

  +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsModernDefaultRingtone");

  if (!v3
    || (TLLocalizedString(CFSTR("RINGTONE_PICKER_DEFAULT_MODERN_RINGTONE_NAME")),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    TLLocalizedString(CFSTR("RINGTONE_PICKER_DEFAULT_RINGTONE_NAME"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_defaultRingtonePath
{
  void *v3;
  void *v4;

  -[TLToneManager defaultRingtoneIdentifier](self, "defaultRingtoneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager filePathForToneIdentifier:](self, "filePathForToneIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_defaultPreferablyNonSilentToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  void *v6;
  int v7;
  uint64_t v8;

  -[TLToneManager defaultToneIdentifierForAlertType:topic:](self, "defaultToneIdentifierForAlertType:topic:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("<none>"));
  if (a3 == 5 && v7)
  {
    -[TLToneManager defaultToneIdentifierForAlertType:topic:](self, "defaultToneIdentifierForAlertType:topic:", 5, CFSTR("com.apple.mobilemail.bulletin-subsection.VIP"));
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  return v6;
}

- (BOOL)hasSpecificDefaultToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;

  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[TLToneManager defaultToneIdentifierForAlertType:](self, "defaultToneIdentifierForAlertType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLToneManager defaultToneIdentifierForAlertType:topic:](self, "defaultToneIdentifierForAlertType:topic:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v7) ^ 1;

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)_soundForToneIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  TLToneManager *v13;
  uint64_t *v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  -[TLToneManager _aliasForToneIdentifier:](self, "_aliasForToneIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TLToneManager _toneWithIdentifierIsSystemTone:](self, "_toneWithIdentifierIsSystemTone:", v5)
    || objc_msgSend(v5, "isEqualToString:", CFSTR("<none>")))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41__TLToneManager__soundForToneIdentifier___block_invoke;
    v15[3] = &unk_1E952A888;
    v15[4] = self;
    v16 = v5;
    v17 = &v18;
    -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v15);

  }
  else if (-[TLToneManager _toneWithIdentifierIsITunesRingtone:](self, "_toneWithIdentifierIsITunesRingtone:", v5)
         || -[TLToneManager _toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:](self, "_toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:", v5)|| -[TLToneManager _toneWithIdentifierIsDefaultRingtone:](self, "_toneWithIdentifierIsDefaultRingtone:", v5)|| -[TLToneManager _toneWithIdentifierIsAlarmWakeUp:](self, "_toneWithIdentifierIsAlarmWakeUp:", v5))
  {
    if (_soundForToneIdentifier__sOnce != -1)
      dispatch_once(&_soundForToneIdentifier__sOnce, &__block_literal_global_608);
    if (-[TLToneManager toneWithIdentifierIsValid:](self, "toneWithIdentifierIsValid:", v5))
    {
      v10 = _soundForToneIdentifier__sSoundCacheAccessQueue;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __41__TLToneManager__soundForToneIdentifier___block_invoke_3;
      v11[3] = &unk_1E952A770;
      v14 = &v18;
      v12 = v5;
      v13 = self;
      dispatch_sync(v10, v11);

    }
  }
  TLLogToneManagement();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v19[5];
    *(_DWORD *)buf = 138543618;
    v25 = v4;
    v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "_soundForToneIdentifier %{public}@ ==> %{public}@", buf, 0x16u);
  }

  v8 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __41__TLToneManager__soundForToneIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(v2, "actualSound");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = v6;
  }

}

void __41__TLToneManager__soundForToneIdentifier___block_invoke_2()
{
  id v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_soundForToneIdentifier__sSoundCache;
  _soundForToneIdentifier__sSoundCache = (uint64_t)v0;

  v2 = dispatch_queue_create("com.apple.ToneLibrary.TLToneManager.soundCacheAccessQueue", 0);
  v3 = (void *)_soundForToneIdentifier__sSoundCacheAccessQueue;
  _soundForToneIdentifier__sSoundCacheAccessQueue = (uint64_t)v2;

}

void __41__TLToneManager__soundForToneIdentifier___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  TLSystemSound *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend((id)_soundForToneIdentifier__sSoundCache, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "filePathForToneIdentifier:", *(_QWORD *)(a1 + 32));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "_toneWithIdentifierIsAlarmWakeUp:", *(_QWORD *)(a1 + 32));
    v7 = [TLSystemSound alloc];
    v8 = -[TLSystemSound initWithSoundFileURL:soundID:requiresLongFormPlayback:](v7, "initWithSoundFileURL:soundID:requiresLongFormPlayback:", v5, kSystemSoundID_InvalidTone, v6);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "soundID"))
    {
      objc_msgSend((id)_soundForToneIdentifier__sSoundCache, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));
    }
    else
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = 0;

    }
  }
}

- (id)filePathForToneIdentifier:(id)a3
{
  return -[TLToneManager _filePathForToneIdentifier:isValid:](self, "_filePathForToneIdentifier:isValid:", a3, 0);
}

- (id)_filePathForToneIdentifier:(id)a3 isValid:(BOOL *)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  TLToneManager *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__TLToneManager__filePathForToneIdentifier_isValid___block_invoke;
  v12[3] = &unk_1E952A948;
  v7 = v6;
  v13 = v7;
  v14 = self;
  v15 = &v23;
  v16 = &v17;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v12);
  if (a4)
    *a4 = *((_BYTE *)v24 + 24);
  TLLogToneManagement();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v18[5];
    *(_DWORD *)buf = 138543618;
    v28 = v7;
    v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "filePathForToneIdentifier: %{public}@ ==> %{public}@", buf, 0x16u);
  }

  v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

void __52__TLToneManager__filePathForToneIdentifier_isValid___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  __CFString *v5;
  id v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  id *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_aliasForToneIdentifier:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 40), "_toneWithIdentifierIsDefaultRingtone:", v2) & 1) != 0)
    {
      +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "wantsModernDefaultRingtone");

      if (v4)
        v5 = CFSTR("Reflection");
      else
        v5 = CFSTR("Opening");
LABEL_9:
      objc_msgSend(*(id *)(a1 + 40), "_systemRingtoneDirectory");
      v9 = objc_claimAutoreleasedReturnValue();
      if (_os_feature_enabled_impl())
      {
        -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("-EncoreInfinitum"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("m4r"));
        v6 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "fileExistsAtPath:", v6);

        if ((v13 & 1) != 0)
        {

          if (v6)
          {
LABEL_18:

            goto LABEL_19;
          }
        }
        else
        {

        }
      }
      -[NSObject stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByAppendingPathExtension:", CFSTR("m4r"));
      v6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    v7 = objc_msgSend(*(id *)(a1 + 40), "_toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:", v2);
    v8 = *(void **)(a1 + 40);
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "_fileNameFromToneIdentifier:withPrefix:", v2, CFSTR("system:"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v14 = objc_msgSend(v8, "_toneWithIdentifierIsAlarmWakeUp:", v2);
    v15 = *(void **)(a1 + 40);
    if (v14)
    {
      objc_msgSend(v15, "_fileNameFromToneIdentifier:withPrefix:", v2, CFSTR("alarmWakeUp:"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_alarmWakeUpRingtoneDirectory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingPathComponent:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "stringByAppendingPathExtension:", CFSTR("m4r"));
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_21;
      goto LABEL_20;
    }
    v24 = objc_msgSend(v15, "_toneWithIdentifierIsITunesRingtone:", v2);
    v25 = *(id **)(a1 + 40);
    if (v24)
    {
      objc_msgSend(v25[2], "objectForKey:", v2);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString filePath](v5, "filePath");
      v26 = objc_claimAutoreleasedReturnValue();
      v6 = (id)v26;
      if (v26)
        LOBYTE(v26) = objc_msgSend((id)objc_opt_class(), "_ensureTCCAccessPreflightAndCheckForFileExistenceAtPath:", v26);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v26;
    }
    else
    {
      if (!objc_msgSend(v25, "_toneWithIdentifierIsSystemTone:", v2))
      {
        v6 = v2;
        if (!v6)
          goto LABEL_21;
LABEL_20:
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        {
LABEL_22:

          goto LABEL_23;
        }
LABEL_21:
        objc_msgSend(*(id *)(a1 + 40), "_defaultRingtonePath");
        v20 = objc_claimAutoreleasedReturnValue();

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        v6 = (id)v20;
        goto LABEL_22;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", v2);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v5 = v27;
      if (v27
        && (-[__CFString soundFileURL](v27, "soundFileURL"),
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v28, "path"),
            v6 = (id)objc_claimAutoreleasedReturnValue(),
            v28,
            v6))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v29, "fileExistsAtPath:", v6);

        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        {
          TLLogToneManagement();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v30 = *(_QWORD *)(a1 + 40);
            v31 = 138543618;
            v32 = v30;
            v33 = 2114;
            v34 = v6;
            _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: File DOES NOT exist at path %{public}@.", (uint8_t *)&v31, 0x16u);
          }
          goto LABEL_18;
        }
      }
      else
      {
        v6 = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      }
    }
LABEL_19:

    if (!v6)
      goto LABEL_21;
    goto LABEL_20;
  }
  v6 = 0;
LABEL_23:
  v21 = objc_msgSend(v6, "copy");
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

}

- (id)_previewSoundForToneIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  TLSystemSound *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = kSystemSoundID_InvalidTone;
  if (-[TLToneManager _toneWithIdentifierIsSystemTone:](self, "_toneWithIdentifierIsSystemTone:", v4)
    || objc_msgSend(v4, "isEqualToString:", CFSTR("<none>")))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __48__TLToneManager__previewSoundForToneIdentifier___block_invoke;
    v15[3] = &unk_1E952A948;
    v15[4] = self;
    v16 = v4;
    v17 = &v23;
    v18 = &v19;
    -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v15);

  }
  else if (-[TLToneManager _toneWithIdentifierIsITunesRingtone:](self, "_toneWithIdentifierIsITunesRingtone:", v4)
         || -[TLToneManager _toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:](self, "_toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:", v4)|| -[TLToneManager _toneWithIdentifierIsDefaultRingtone:](self, "_toneWithIdentifierIsDefaultRingtone:", v4)|| -[TLToneManager _toneWithIdentifierIsAlarmWakeUp:](self, "_toneWithIdentifierIsAlarmWakeUp:", v4))
  {
    -[TLToneManager filePathForToneIdentifier:](self, "filePathForToneIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TLToneManager _toneWithIdentifierIsAlarmWakeUp:](self, "_toneWithIdentifierIsAlarmWakeUp:", v4);
    v8 = [TLSystemSound alloc];
    v9 = -[TLSystemSound initWithSoundFileURL:soundID:requiresLongFormPlayback:](v8, "initWithSoundFileURL:soundID:requiresLongFormPlayback:", v6, kSystemSoundID_InvalidTone, v7);
    v10 = (void *)v24[5];
    v24[5] = v9;

    v11 = objc_msgSend((id)v24[5], "soundID");
    *((_DWORD *)v20 + 6) = v11;

  }
  if (*((_DWORD *)v20 + 6) == kSystemSoundID_NoneTone)
  {
    v12 = (void *)v24[5];
    v24[5] = 0;

  }
  v13 = (id)v24[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __48__TLToneManager__previewSoundForToneIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_aliasForToneIdentifier:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "previewSound");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 40), "soundID");
  }

}

- (id)nameForToneIdentifier:(id)a3
{
  return -[TLToneManager _nameForToneIdentifier:isValid:](self, "_nameForToneIdentifier:isValid:", a3, 0);
}

- (id)_nameForToneIdentifier:(id)a3 isValid:(BOOL *)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  BOOL *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__TLToneManager__nameForToneIdentifier_isValid___block_invoke;
  v10[3] = &unk_1E952A970;
  v10[4] = self;
  v7 = v6;
  v12 = &v14;
  v13 = a4;
  v11 = v7;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __48__TLToneManager__nameForToneIdentifier_isValid___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  int v15;
  void *v16;
  int v17;
  id *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_aliasForToneIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "_toneWithIdentifierIsSystemTone:", v2) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", CFSTR("<none>")))
  {
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("<none>")))
      TLLocalizedString(CFSTR("RINGTONE_PICKER_NONE"));
    else
      objc_msgSend(*(id *)(a1 + 32), "_localizedNameOfToneWithIdentifier:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = *(BOOL **)(a1 + 56);
    if (v5)
      *v5 = v3 != 0;
    goto LABEL_40;
  }
  if (!objc_msgSend(v2, "length"))
  {
    v4 = 0;
    LOBYTE(v9) = 1;
    goto LABEL_38;
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "_toneWithIdentifierIsDefaultRingtone:", v2);
  v7 = *(void **)(a1 + 32);
  if (v6)
    goto LABEL_10;
  v10 = objc_msgSend(v7, "_toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:", v2);
  v11 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v11, "_localizedNameOfToneWithIdentifier:", v2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = *(void **)(a1 + 32);
      v14 = CFSTR("system:");
LABEL_26:
      objc_msgSend(v13, "_fileNameFromToneIdentifier:withPrefix:", v2, v14);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    goto LABEL_19;
  }
  v15 = objc_msgSend(v11, "_toneWithIdentifierIsAlarmWakeUp:", v2);
  v16 = *(void **)(a1 + 32);
  if (v15)
  {
    objc_msgSend(v16, "_localizedNameOfToneWithIdentifier:", v2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = *(void **)(a1 + 32);
      v14 = CFSTR("alarmWakeUp:");
      goto LABEL_26;
    }
LABEL_19:
    v4 = (void *)v12;
    v8 = 0;
    LOBYTE(v9) = 1;
    goto LABEL_37;
  }
  v17 = objc_msgSend(v16, "_toneWithIdentifierIsITunesRingtone:", v2);
  v18 = *(id **)(a1 + 32);
  if (v17)
  {
    objc_msgSend(v18[2], "objectForKey:", v2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "filePath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      LODWORD(v9) = objc_msgSend((id)objc_opt_class(), "_ensureTCCAccessPreflightAndCheckForFileExistenceAtPath:", v20);
    else
      LODWORD(v9) = 0;
    TLLogToneManagement();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(_QWORD *)(a1 + 32);
      v28 = *(_QWORD *)(a1 + 40);
      v33 = 138544642;
      v34 = v27;
      v35 = 2114;
      v36 = v28;
      v37 = 2112;
      v38 = v19;
      v39 = 2112;
      v40 = v4;
      v41 = 2114;
      v42 = v20;
      v43 = 1024;
      v44 = (int)v9;
      _os_log_impl(&dword_1D33D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Checking validity of tone with identifier '%{public}@': %@. Name: '%@'. File path: '%{public}@'. Is valid? %{BOOL}u.", (uint8_t *)&v33, 0x3Au);
    }

LABEL_35:
    v8 = 0;
    if (v4)
      goto LABEL_37;
LABEL_36:
    objc_msgSend(*(id *)(a1 + 32), "_defaultRingtoneName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = 0;
    goto LABEL_37;
  }
  v21 = objc_msgSend(v18, "_toneWithIdentifierIsMediaPlaybackArchive:", v2);
  v22 = *(void **)(a1 + 32);
  if (v21)
  {
    objc_msgSend(v22, "_underlyingPlaybackArchiveForToneIdentifier:", *(_QWORD *)(a1 + 40));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displayProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v9) = v4 != 0;
    goto LABEL_35;
  }
  objc_msgSend(v22, "_defaultRingtonePath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v2, "isEqualToString:", v24);

  if (v25)
  {
    v7 = *(void **)(a1 + 32);
LABEL_10:
    objc_msgSend(v7, "_defaultRingtoneName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_11;
  }
  v23 = v2;
LABEL_27:
  v8 = v23;
  if (!v23)
    goto LABEL_36;
  objc_msgSend(v23, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  LOBYTE(v9) = 1;
  if (!v4)
    goto LABEL_36;
LABEL_37:

LABEL_38:
  v29 = *(_BYTE **)(a1 + 56);
  if (v29)
    *v29 = (_BYTE)v9;
LABEL_40:
  v30 = objc_msgSend(v4, "copy");
  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v32 = *(void **)(v31 + 40);
  *(_QWORD *)(v31 + 40) = v30;

}

- (id)subtitleForToneIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TLToneManager _underlyingPlaybackArchiveForToneIdentifier:](self, "_underlyingPlaybackArchiveForToneIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_toneIdentifierForFileAtPath:(id)a3 isValid:(BOOL *)a4
{
  id v6;
  id v7;
  uint64_t *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  TLToneManager *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__TLToneManager__toneIdentifierForFileAtPath_isValid___block_invoke;
  v15[3] = &unk_1E952A888;
  v7 = v6;
  v16 = v7;
  v17 = self;
  v18 = &v19;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v15);
  v8 = v20;
  if (a4)
    *a4 = v20[5] != 0;
  v9 = (void *)v8[5];
  if (!v9)
  {
    -[TLToneManager defaultRingtoneIdentifier](self, "defaultRingtoneIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    v12 = (void *)v20[5];
    v20[5] = v11;

    v9 = (void *)v20[5];
  }
  v13 = v9;

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __54__TLToneManager__toneIdentifierForFileAtPath_isValid___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *, void *, _BYTE *);
  void *v36;
  id v37;
  uint64_t *v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy_;
  v46 = __Block_byref_object_dispose_;
  v47 = 0;
  objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stringByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_iTunesRingtoneDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "_deviceITunesRingtoneDirectory"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v3, "isEqualToString:", v5),
        v5,
        v6))
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __54__TLToneManager__toneIdentifierForFileAtPath_isValid___block_invoke_2;
    v39[3] = &unk_1E952A998;
    v40 = v7;
    v41 = &v42;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v39);
    v9 = v40;
LABEL_15:

    goto LABEL_16;
  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_defaultRingtonePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v10, "isEqualToString:", v11);

  v12 = *(void **)(a1 + 40);
  if ((_DWORD)v10)
  {
    objc_msgSend(v12, "defaultRingtoneIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v43[5];
    v43[5] = v13;
    goto LABEL_15;
  }
  objc_msgSend(v12, "_systemRingtoneDirectory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "isEqualToString:", v14);

  if (v15)
  {
    objc_msgSend(v2, "stringByDeletingPathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("system:"), "stringByAppendingString:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v43[5];
    v43[5] = v16;

    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 40), "_systemSoundDirectory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v3, "isEqualToString:", v18);

  if ((v19 & 1) != 0)
    goto LABEL_14;
  objc_msgSend(*(id *)(a1 + 40), "_systemEmbeddedSoundDirectory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v3, "isEqualToString:", v20);

  if ((v21 & 1) != 0)
    goto LABEL_14;
  objc_msgSend(*(id *)(a1 + 40), "_systemEmbeddedClassicSoundDirectory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v3, "isEqualToString:", v22);

  if ((v23 & 1) != 0)
    goto LABEL_14;
  objc_msgSend(*(id *)(a1 + 40), "_systemEmbeddedModernSoundDirectory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v3, "isEqualToString:", v24);

  if ((v25 & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "_systemWatchSoundDirectory"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = objc_msgSend(v3, "isEqualToString:", v26),
        v26,
        v27))
  {
LABEL_14:
    v28 = *(void **)(a1 + 32);
    v29 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __54__TLToneManager__toneIdentifierForFileAtPath_isValid___block_invoke_3;
    v36 = &unk_1E952A9C0;
    v37 = v28;
    v38 = &v42;
    objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", &v33);
    v9 = v37;
    goto LABEL_15;
  }
LABEL_16:
  v30 = objc_msgSend((id)v43[5], "copy", v33, v34, v35, v36);
  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v32 = *(void **)(v31 + 40);
  *(_QWORD *)(v31 + 40) = v30;

  _Block_object_dispose(&v42, 8);
}

void __54__TLToneManager__toneIdentifierForFileAtPath_isValid___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(a3, "filePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __54__TLToneManager__toneIdentifierForFileAtPath_isValid___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(a3, "soundFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)_toneWithIdentifierIsValid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  BOOL v24;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  TLToneManager *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  if (objc_msgSend(v4, "length"))
  {
    -[TLToneManager _aliasForToneIdentifier:](self, "_aliasForToneIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TLToneManager _toneWithIdentifierIsDefaultRingtone:](self, "_toneWithIdentifierIsDefaultRingtone:", v5))
    {
      *((_BYTE *)v30 + 24) = 1;
    }
    else if (-[TLToneManager _toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:](self, "_toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:", v5))
    {
      -[TLToneManager _fileNameFromToneIdentifier:withPrefix:](self, "_fileNameFromToneIdentifier:withPrefix:", v5, CFSTR("system:"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLToneManager _systemRingtoneDirectory](self, "_systemRingtoneDirectory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("m4r"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

      if ((v11 & 1) != 0)
      {
        v12 = 1;
      }
      else
      {
        objc_msgSend(v6, "stringByAppendingString:", CFSTR("-EncoreInfinitum"));
        v18 = objc_claimAutoreleasedReturnValue();

        -[TLToneManager _systemRingtoneDirectory](self, "_systemRingtoneDirectory");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByAppendingPathComponent:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "stringByAppendingPathExtension:", CFSTR("m4r"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v21, "fileExistsAtPath:", v9);

        v6 = (void *)v18;
      }
      *((_BYTE *)v30 + 24) = v12;

    }
    else if (-[TLToneManager _toneWithIdentifierIsAlarmWakeUp:](self, "_toneWithIdentifierIsAlarmWakeUp:", v5))
    {
      -[TLToneManager _fileNameFromToneIdentifier:withPrefix:](self, "_fileNameFromToneIdentifier:withPrefix:", v5, CFSTR("alarmWakeUp:"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLToneManager _alarmWakeUpRingtoneDirectory](self, "_alarmWakeUpRingtoneDirectory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "stringByAppendingPathExtension:", CFSTR("m4r"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v14) = objc_msgSend(v17, "fileExistsAtPath:", v16);

      *((_BYTE *)v30 + 24) = (_BYTE)v14;
    }
    else
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __44__TLToneManager__toneWithIdentifierIsValid___block_invoke;
      v26[3] = &unk_1E952A770;
      v28 = &v29;
      v26[4] = self;
      v27 = v5;
      -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v26);

    }
  }
  TLLogToneManagement();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = *((unsigned __int8 *)v30 + 24);
    *(_DWORD *)buf = 138543874;
    v34 = self;
    v35 = 2114;
    v36 = v4;
    v37 = 1024;
    v38 = v23;
    _os_log_impl(&dword_1D33D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Performed basic check for validity of tone with identifier '%{public}@': %{BOOL}u.", buf, 0x1Cu);
  }

  v24 = *((_BYTE *)v30 + 24) != 0;
  _Block_object_dispose(&v29, 8);

  return v24;
}

void __44__TLToneManager__toneWithIdentifierIsValid___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;

  v2 = (uint64_t)(a1 + 4);
  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = a1[6];
    v4 = a1 + 6;
    *(_BYTE *)(*(_QWORD *)(v5 + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[6];
    v4 = a1 + 6;
    *(_BYTE *)(*(_QWORD *)(v7 + 8) + 24) = v6 != 0;

  }
  if (!*(_BYTE *)(*(_QWORD *)(*v4 + 8) + 24))
  {
    TLLogToneManagement();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __44__TLToneManager__toneWithIdentifierIsValid___block_invoke_cold_2();

    TLLogToneManagement();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __44__TLToneManager__toneWithIdentifierIsValid___block_invoke_cold_1(v2);

  }
}

- (BOOL)toneWithIdentifierIsValid:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  BOOL v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  TLToneManager *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__TLToneManager_toneWithIdentifierIsValid___block_invoke;
  v10[3] = &unk_1E952A888;
  v10[4] = self;
  v5 = v4;
  v11 = v5;
  v12 = &v13;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v10);
  TLLogToneManagement();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *((unsigned __int8 *)v14 + 24);
    *(_DWORD *)buf = 138543874;
    v18 = self;
    v19 = 2114;
    v20 = v5;
    v21 = 1024;
    v22 = v7;
    _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -toneWithIdentifierIsValid:(%{public}@): Returning %{BOOL}u.", buf, 0x1Cu);
  }

  v8 = *((_BYTE *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __43__TLToneManager_toneWithIdentifierIsValid___block_invoke(uint64_t a1)
{
  int v2;
  unsigned __int8 v3;
  unint64_t i;
  __CFString *v5;
  char v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_toneWithIdentifierIsValid:", *(_QWORD *)(a1 + 40));
  v3 = v2;
  v11 = v2;
  if (!v2)
    goto LABEL_18;
  for (i = 0; ; ++i)
  {
    v5 = _TLToneManagerDefaultIdentifiers[i];
    if (-[__CFString length](v5, "length"))
      break;

    if (i >= 0x1C)
      goto LABEL_10;
LABEL_8:
    ;
  }
  v6 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v5);

  if (i <= 0x1B && (v6 & 1) == 0)
    goto LABEL_8;
  if ((v6 & 1) != 0)
    goto LABEL_18;
LABEL_10:
  if (_TLToneManagerContentsChangedNotification_block_invoke__TLToneManagerAdditionalValidDefaultToneIdentifiersOnceToken != -1)
    dispatch_once(&_TLToneManagerContentsChangedNotification_block_invoke__TLToneManagerAdditionalValidDefaultToneIdentifiersOnceToken, &__block_literal_global_616);
  if ((objc_msgSend((id)_TLToneManagerContentsChangedNotification_block_invoke__TLToneManagerAdditionalValidDefaultToneIdentifiers, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_nameForToneIdentifier:isValid:", *(_QWORD *)(a1 + 40), &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    TLLogToneManagement();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v16 = 2112;
      v17 = v7;
      v18 = 1024;
      v19 = v11;
      _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: -toneWithIdentifierIsValid:(%{public}@): Double checking that we have a valid name for this tone. Name: '%@', isValid: %{BOOL}u.", buf, 0x26u);
    }

    if (!v7)
      v11 = 0;

    v3 = v11;
  }
LABEL_18:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
}

void __43__TLToneManager_toneWithIdentifierIsValid___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v2, "addObjectsFromArray:", &unk_1E9538150);
  if (objc_msgSend(v2, "count"))
  {
    v0 = objc_msgSend(v2, "copy");
    v1 = (void *)_TLToneManagerContentsChangedNotification_block_invoke__TLToneManagerAdditionalValidDefaultToneIdentifiers;
    _TLToneManagerContentsChangedNotification_block_invoke__TLToneManagerAdditionalValidDefaultToneIdentifiers = v0;

  }
}

- (id)_unduckTimeNumberForToneIdentifier:(id)a3 fromResourceNamed:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB34D0];
  v8 = a4;
  objc_msgSend(v7, "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLForResource:withExtension:", v8, CFSTR("plist"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLToneManager _aliasForToneIdentifier:](self, "_aliasForToneIdentifier:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (double)_unduckTimeForToneIdentifier:(id)a3
{
  id v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = CFSTR("ToneEarlyUnduckTimes");
  -[TLToneManager _unduckTimeNumberForToneIdentifier:fromResourceNamed:](self, "_unduckTimeNumberForToneIdentifier:fromResourceNamed:", v4, CFSTR("ToneEarlyUnduckTimes"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
LABEL_3:
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    goto LABEL_4;
  }
  v9 = 0.0;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(CFSTR("ToneEarlyUnduckTimes"), "stringByAppendingString:", CFSTR("-EncoreInfinitum"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[TLToneManager _unduckTimeNumberForToneIdentifier:fromResourceNamed:](self, "_unduckTimeNumberForToneIdentifier:fromResourceNamed:", v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_3;
  }
LABEL_4:

  return v9;
}

- (id)_toneIdentifierForDeemphasizingAlertWithType:(int64_t)a3 topic:(id)a4 regularToneIdentifier:(id)a5
{
  return 0;
}

- (void)importTone:(id)a3 metadata:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__TLToneManager_importTone_metadata_completionBlock___block_invoke;
  v15[3] = &unk_1E952AA08;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __53__TLToneManager_importTone_metadata_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "_deviceITunesRingtoneDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_ensureDirectoryExistsAtPath:", v2);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("GUID"));
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("File Extension"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = (__CFString *)v6;
    else
      v7 = CFSTR("m4r");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("import_"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathExtension:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v17 = 0;
    if (objc_msgSend(v11, "createFileAtPath:contents:attributes:", v10, *(_QWORD *)(a1 + 48), 0))
    {
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v12, "_deviceITunesRingtoneInformationPlist");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_deviceITunesRingtoneDirectory");
      v16 = v7;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_addToneToManifestAtPath:metadata:fileName:mediaDirectory:", v13, v5, v9, v14);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      v7 = v16;
    }

  }
  else
  {
    v17 = 0;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    if (objc_msgSend(v17, "statusCode"))
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v17, "toneIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (void)removeImportedToneWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[TLToneManager _toneWithIdentifier:](self, "_toneWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "hasPrefix:", CFSTR("import_")))
    {
LABEL_9:

      goto LABEL_10;
    }
    v8 = -[TLToneManager _removeToneWithIdentifier:](self, "_removeToneWithIdentifier:", v4);
    TLLogToneManagement();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:

        goto LABEL_9;
      }
      v12 = 138543874;
      v13 = (id)objc_opt_class();
      v14 = 2114;
      v15 = v4;
      v16 = 2114;
      v17 = v6;
      v11 = v13;
      _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: removeImportedToneWithIdentifier:(%{public}@): Successfully deleted tone at file path '%{public}@'.", (uint8_t *)&v12, 0x20u);
    }
    else
    {
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      v12 = 138543874;
      v13 = (id)objc_opt_class();
      v14 = 2114;
      v15 = v4;
      v16 = 2114;
      v17 = v6;
      v11 = v13;
      _os_log_error_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@: removeImportedToneWithIdentifier:(%{public}@): Failed to delete tone at file path '%{public}@'.", (uint8_t *)&v12, 0x20u);
    }

    goto LABEL_8;
  }
LABEL_10:

}

- (id)_importPurchasedToneWithMetadata:(id)a3 fileName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[TLToneManager _deviceITunesRingtoneInformationPlist](self, "_deviceITunesRingtoneInformationPlist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _deviceITunesRingtoneDirectory](self, "_deviceITunesRingtoneDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _addToneToManifestAtPath:metadata:fileName:mediaDirectory:](self, "_addToneToManifestAtPath:metadata:fileName:mediaDirectory:", v8, v7, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_transferPurchasedToITunes:(id)a3
{
  return 0;
}

- (BOOL)_wasAffectedByAccidentalToneDeletion
{
  BOOL v3;

  v3 = 0;
  -[TLToneManager _evaluateOrphanEntriesCleanupStatusForcingReevaluationIfPreviouslyDone:returningFilePathsForFoundOrphans:wasAffectedByAccidentalToneDeletion:](self, "_evaluateOrphanEntriesCleanupStatusForcingReevaluationIfPreviouslyDone:returningFilePathsForFoundOrphans:wasAffectedByAccidentalToneDeletion:", 0, 0, &v3);
  return v3;
}

- (id)_allSyncedTones
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E08];
  -[TLToneManager _iTunesRingtoneInformationPlist](self, "_iTunesRingtoneInformationPlist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("Ringtones"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_toneForSyncIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__TLToneManager__toneForSyncIdentifier___block_invoke;
  v8[3] = &unk_1E952A888;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __40__TLToneManager__toneForSyncIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = v6;
  }

}

- (BOOL)_importSyncedToneWithMetadata:(id)a3 fileName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[TLToneManager _iTunesRingtoneInformationPlist](self, "_iTunesRingtoneInformationPlist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _iTunesRingtoneDirectory](self, "_iTunesRingtoneDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _addToneToManifestAtPath:metadata:fileName:mediaDirectory:](self, "_addToneToManifestAtPath:metadata:fileName:mediaDirectory:", v8, v7, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v10, "statusCode") == 0;
  return (char)v7;
}

- (BOOL)_removeToneWithSyncIdentifier:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[TLToneManager _removeToneWithIdentifier:orSyncIdentifier:](self, "_removeToneWithIdentifier:orSyncIdentifier:", 0, v4);
  TLLogToneManagement();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = (id)objc_opt_class();
      v12 = 2114;
      v13 = v4;
      v8 = v11;
      _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: _removeToneWithSyncIdentifier:(%{public}@): Successfully deleted tone.", (uint8_t *)&v10, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[TLToneManager _removeToneWithSyncIdentifier:].cold.1((uint64_t)self, (uint64_t)v4, v7);
  }

  return v5;
}

- (void)_removeAllSyncedData
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  TLToneManager *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _iTunesRingtoneDirectory](self, "_iTunesRingtoneDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _iTunesRingtoneInformationPlist](self, "_iTunesRingtoneInformationPlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = self;
  v6 = -[TLToneManager _lockManifestAtPath:](self, "_lockManifestAtPath:", v5);
  if (v6 != -1)
  {
    v26 = v6;
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v5);
    objc_msgSend(v25, "objectForKey:", CFSTR("Ringtones"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v27 = v5;
    objc_msgSend(v3, "removeItemAtPath:error:", v5, 0);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v32;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v4, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          v15 = objc_msgSend(v3, "removeItemAtPath:error:", v14, &v30);
          v16 = v30;
          TLLogToneManagement();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v15)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v19 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v36 = v19;
              v37 = 2114;
              v38 = v14;
              v20 = v19;
              _os_log_impl(&dword_1D33D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: _removeAllSyncedData: Successfully deleted tone at file path '%{public}@'.", buf, 0x16u);

            }
          }
          else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v21 = (void *)objc_opt_class();
            v28 = v21;
            objc_msgSend(v16, "tl_nonRedundantDescription");
            v22 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v36 = v21;
            v37 = 2114;
            v38 = v14;
            v39 = 2114;
            v40 = v22;
            v23 = (void *)v22;
            _os_log_error_impl(&dword_1D33D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@: _removeAllSyncedData: Failed to delete tone at file path '%{public}@'; error = %{public}@.",
              buf,
              0x20u);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v11);
    }

    close(v26);
    -[TLToneManager _reloadTones](v29, "_reloadTones");

    v5 = v27;
  }

}

- (id)_removeOrphanedPlistEntriesInManifestAtPath:(id)a3 mediaDirectory:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v23;
  int v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[TLToneManager _lockManifestAtPath:](self, "_lockManifestAtPath:", v6);
  if (v8 == -1)
  {
    v14 = 0;
  }
  else
  {
    v9 = v8;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v6);
    v11 = v10;
    if (v10)
    {
      v24 = v9;
      v25 = v6;
      v23 = v10;
      objc_msgSend(v10, "objectForKey:", CFSTR("Ringtones"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v15 = v12;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v27 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v7, "stringByAppendingPathComponent:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend((id)objc_opt_class(), "_ensureTCCAccessPreflightAndCheckForFileExistenceAtPath:", v21) & 1) == 0)
            {
              objc_msgSend(v13, "addObject:", v20);
              objc_msgSend(v14, "addObject:", v21);
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v17);
      }

      v6 = v25;
      if (!objc_msgSend(v13, "count")
        || !-[TLToneManager _removeTonesFromManifestAtPath:fileNames:shouldSkipReload:alreadyLockedManifest:removedEntries:](self, "_removeTonesFromManifestAtPath:fileNames:shouldSkipReload:alreadyLockedManifest:removedEntries:", v25, v13, 1, 1, 0))
      {

        v14 = 0;
      }
      v9 = v24;
      v11 = v23;

    }
    else
    {
      v14 = 0;
    }
    close(v9);

  }
  return v14;
}

- (int64_t)_evaluateOrphanEntriesCleanupStatusForcingReevaluationIfPreviouslyDone:(BOOL)a3 returningFilePathsForFoundOrphans:(id *)a4 wasAffectedByAccidentalToneDeletion:(BOOL *)a5
{
  _BOOL4 v7;
  __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFBoolean *v13;
  const __CFBoolean *v14;
  CFTypeID v15;
  CFTypeID TypeID;
  _BOOL4 v17;
  int64_t v18;
  _BOOL4 v19;
  const void *v20;
  const void *v21;
  const __CFBoolean *v22;
  const __CFBoolean *v23;
  CFTypeID v24;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v9 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
  v10 = v9;
  if (v9)
  {
    v11 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v12 = (const __CFString *)*MEMORY[0x1E0C9B230];
    CFPreferencesSynchronize(v9, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v13 = (const __CFBoolean *)CFPreferencesCopyAppValue(CFSTR("was-affected-by-accidental-tone-deletion"), v10);
    v14 = v13;
    if (v13)
    {
      v15 = CFGetTypeID(v13);
      TypeID = CFBooleanGetTypeID();
      v17 = v15 == TypeID;
      if (v15 == TypeID)
      {
        v19 = CFBooleanGetValue(v14) != 0;
      }
      else
      {
        v19 = 0;
        v7 = 1;
      }
      CFRelease(v14);
      if (!v7)
        goto LABEL_23;
    }
    else
    {
      v19 = 0;
      v17 = 0;
    }
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __158__TLToneManager__evaluateOrphanEntriesCleanupStatusForcingReevaluationIfPreviouslyDone_returningFilePathsForFoundOrphans_wasAffectedByAccidentalToneDeletion___block_invoke;
    v26[3] = &unk_1E952A860;
    v26[4] = self;
    v26[5] = &v27;
    -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v26);
    if (v19)
    {
      v19 = 1;
      if (!v17)
        goto LABEL_15;
    }
    else
    {
      v19 = objc_msgSend((id)v28[5], "count") != 0;
      if (!v17)
      {
LABEL_15:
        v20 = (const void *)*MEMORY[0x1E0C9AE50];
        if (v19)
          v21 = (const void *)*MEMORY[0x1E0C9AE50];
        else
          v21 = (const void *)*MEMORY[0x1E0C9AE40];
        CFPreferencesSetAppValue(CFSTR("was-affected-by-accidental-tone-deletion"), v21, v10);
        if (v19)
          CFPreferencesSetAppValue(CFSTR("requires-reset-sync-post-accidental-tone-deletion"), v20, v10);
        CFPreferencesSynchronize(v10, v11, v12);
LABEL_21:
        if (objc_msgSend((id)v28[5], "count"))
        {
          v18 = 1;
          goto LABEL_29;
        }
LABEL_23:
        v22 = (const __CFBoolean *)CFPreferencesCopyAppValue(CFSTR("requires-reset-sync-post-accidental-tone-deletion"), v10);
        v23 = v22;
        if (v22)
        {
          v24 = CFGetTypeID(v22);
          v18 = v24 == CFBooleanGetTypeID() && CFBooleanGetValue(v23) != 0;
          CFRelease(v23);
        }
        else
        {
          v18 = 0;
        }
LABEL_29:
        CFRelease(v10);
        LOBYTE(v10) = v19;
        if (!a4)
          goto LABEL_31;
        goto LABEL_30;
      }
    }
    if (!objc_msgSend((id)v28[5], "count"))
      goto LABEL_21;
    goto LABEL_15;
  }
  v18 = 0;
  if (a4)
LABEL_30:
    *a4 = (id)objc_msgSend((id)v28[5], "copy");
LABEL_31:
  if (a5)
    *a5 = (char)v10;
  _Block_object_dispose(&v27, 8);

  return v18;
}

void __158__TLToneManager__evaluateOrphanEntriesCleanupStatusForcingReevaluationIfPreviouslyDone_returningFilePathsForFoundOrphans_wasAffectedByAccidentalToneDeletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_deviceITunesRingtoneInformationPlist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_deviceITunesRingtoneDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeOrphanedPlistEntriesInManifestAtPath:mediaDirectory:", v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (v8)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "unionSet:", v8);
    objc_msgSend(*(id *)(a1 + 32), "_reloadTones");
  }

}

- (int64_t)_removeOrphanedManifestEntriesReturningFilePathsForFoundOrphans:(id *)a3
{
  return -[TLToneManager _evaluateOrphanEntriesCleanupStatusForcingReevaluationIfPreviouslyDone:returningFilePathsForFoundOrphans:wasAffectedByAccidentalToneDeletion:](self, "_evaluateOrphanEntriesCleanupStatusForcingReevaluationIfPreviouslyDone:returningFilePathsForFoundOrphans:wasAffectedByAccidentalToneDeletion:", 1, a3, 0);
}

- (void)_registerDidRequestResetSyncPostAccidentalToneDeletion
{
  __CFString *v2;
  const __CFString *v3;

  v2 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
  if (v2)
  {
    v3 = v2;
    CFPreferencesSetAppValue(CFSTR("requires-reset-sync-post-accidental-tone-deletion"), 0, v2);
    CFPreferencesSynchronize(v3, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    CFRelease(v3);
  }
}

+ (BOOL)_migrateLegacyToneSettings
{
  __CFString *v3;
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  int v7;
  unint64_t v8;
  void *v9;
  const void *v10;
  __CFString *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  char *v19;
  const __CFString *v20;
  const __CFString *v21;
  CFIndex AppIntegerValue;
  CFIndex v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v43;
  __CFString *v44;
  CFStringRef v45;
  const __CFString *applicationID;
  id v47;
  Boolean keyExistsAndHasValidFormat;
  uint8_t v49;
  char v50[15];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  const __CFString *v59;
  __CFString *v60;
  _DWORD v61[2];
  _QWORD v62[3];
  int v63;
  uint64_t v64;
  const __CFString *v65;
  __CFString *v66;
  int v67;
  uint64_t v68;
  const __CFString *v69;
  CFStringRef v70;
  int v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
  v4 = 0;
  v59 = CFSTR("PlaySentMailSound");
  v60 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomainForDomain:](TLPreferencesUtilities, "copySharedResourcesPreferencesDomainForDomain:", CFSTR("com.apple.mobilemail"));
  v61[0] = 0;
  v62[0] = 6;
  v62[1] = CFSTR("PlayNewMailSound");
  v45 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomainForDomain:](TLPreferencesUtilities, "copySharedResourcesPreferencesDomainForDomain:", CFSTR("com.apple.mobilephone"));
  applicationID = v60;
  v62[2] = v60;
  v63 = 0;
  v64 = 5;
  v65 = CFSTR("calendar-alarm");
  v66 = v3;
  v67 = 1;
  v68 = 10;
  v69 = CFSTR("VoicemailToneEnabled");
  v70 = v45;
  v71 = 0;
  v72 = 4;
  v47 = a1;
  do
  {
    v6 = (&v59)[v4 / 8];
    v5 = *(&v59 + v4 / 8 + 1);
    v7 = v61[v4 / 4];
    v8 = v62[v4 / 8];
    v9 = (void *)CFPreferencesCopyAppValue(v6, v5);
    if (!v9)
      goto LABEL_20;
    v10 = v9;
    if (v7)
    {
      if (v7 == 1 && !objc_msgSend(v9, "length"))
      {
LABEL_8:
        objc_msgSend(a1, "_systemWideTonePreferenceKeyForAlertType:", v8);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          TLLogGeneral();
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

          if (v13)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Tones/TLToneManager.m");
            v14 = objc_claimAutoreleasedReturnValue();
            TLLogGeneral();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject lastPathComponent](v14, "lastPathComponent");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v3;
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v16 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136381443;
              v52 = "+[TLToneManager _migrateLegacyToneSettings]";
              v53 = 2113;
              v54 = v43;
              v55 = 2049;
              v56 = 3353;
              v57 = 2113;
              v58 = v16;
              v17 = (void *)v16;
              _os_log_impl(&dword_1D33D5000, v15, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

              v3 = v44;
            }

          }
          else
          {
            TLLogGeneral();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              +[TLToneManager _migrateLegacyToneSettings].cold.3(&v49, v50, v14);
          }

          TLLogGeneral();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            NSStringFromTLAlertType(v8);
            v19 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v19;
            v53 = 2114;
            v54 = 0;
            _os_log_error_impl(&dword_1D33D5000, v18, OS_LOG_TYPE_ERROR, "Unexpected value for preferences key associated to alertType %{public}@: %{public}@.", buf, 0x16u);

          }
          a1 = v47;
        }
        CFPreferencesSetAppValue(v11, CFSTR("<none>"), v3);
        CFPreferencesSetAppValue(v6, 0, v5);

      }
    }
    else if ((objc_msgSend(v9, "BOOLValue") & 1) == 0)
    {
      goto LABEL_8;
    }
    CFRelease(v10);
LABEL_20:
    v4 += 32;
  }
  while (v4 != 128);
  v20 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v21 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize(applicationID, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  CFPreferencesSynchronize(v45, v20, v21);
  CFRelease(applicationID);
  CFRelease(v45);
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("sms-sound"), v3, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v23 = AppIntegerValue;
    objc_msgSend(a1, "_defaultToneIdentifierForAlertType:topic:", 2, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = CFSTR("texttone:Tri-tone");
    switch(v23)
    {
      case 0:
        v25 = CFSTR("<none>");
        goto LABEL_29;
      case 1:
        goto LABEL_29;
      case 2:
        v25 = CFSTR("texttone:Chime");
        goto LABEL_29;
      case 3:
        v25 = CFSTR("texttone:Glass");
        goto LABEL_29;
      case 4:
        v25 = CFSTR("texttone:Horn");
        goto LABEL_29;
      case 6:
        v25 = CFSTR("texttone:Bell");
        goto LABEL_29;
      case 7:
        v25 = CFSTR("texttone:Electronic");
LABEL_29:

        v24 = v25;
        break;
      default:
        break;
    }
    objc_msgSend(v47, "_systemWideTonePreferenceKeyForAlertType:", 2);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      v27 = v3;
      TLLogGeneral();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);

      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Tones/TLToneManager.m");
        v30 = objc_claimAutoreleasedReturnValue();
        TLLogGeneral();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject lastPathComponent](v30, "lastPathComponent");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136381443;
          v52 = "+[TLToneManager _migrateLegacyToneSettings]";
          v53 = 2113;
          v54 = v32;
          v55 = 2049;
          v56 = 3383;
          v57 = 2113;
          v58 = (uint64_t)v33;
          _os_log_impl(&dword_1D33D5000, v31, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

        }
      }
      else
      {
        TLLogGeneral();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          +[TLToneManager _migrateLegacyToneSettings].cold.2(v30, v34, v35, v36, v37, v38, v39, v40);
      }
      v3 = v27;

      TLLogGeneral();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        +[TLToneManager _migrateLegacyToneSettings].cold.1(v41);

    }
    CFPreferencesSetAppValue(v26, v24, v3);
    CFPreferencesSetAppValue(CFSTR("sms-sound"), 0, v3);

  }
  CFPreferencesSetAppValue(CFSTR("was-affected-by-accidental-tone-deletion"), 0, v3);
  CFPreferencesSynchronize(v3, v20, v21);
  +[TLPreferencesUtilities migratePerTopicPreferencesInDomain:withRegularPreferenceKeys:regularPreferenceKeysCount:intoSinglePerTopicPreferenceWithSuffix:usingPreferencesScope:](TLPreferencesUtilities, "migratePerTopicPreferencesInDomain:withRegularPreferenceKeys:regularPreferenceKeysCount:intoSinglePerTopicPreferenceWithSuffix:usingPreferencesScope:", v3, _TLToneManagerSystemWideTonePreferenceKeys, 29, CFSTR("-per-account"), 0);
  CFRelease(v3);
  return 1;
}

- (id)_currentWatchToneIdentifierPreferenceKeyForAlertType:(int64_t)a3 topic:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "_systemWideTonePreferenceKeyForAlertType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("watch-"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "length");
  if (v8)
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("-per-account"));
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  return v7;
}

- (id)currentWatchToneIdentifierForAlertType:(int64_t)a3
{
  return -[TLToneManager currentWatchToneIdentifierForAlertType:topic:](self, "currentWatchToneIdentifierForAlertType:topic:", a3, 0);
}

- (void)setCurrentWatchToneIdentifier:(id)a3 forAlertType:(int64_t)a4
{
  -[TLToneManager setCurrentWatchToneIdentifier:forAlertType:topic:](self, "setCurrentWatchToneIdentifier:forAlertType:topic:", a3, a4, 0);
}

- (id)currentWatchToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  TLToneManager *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  TLLogToneManagement();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = self;
    v17 = 2114;
    v18 = v8;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentWatchToneIdentifierForAlertType:(%{public}@) topic:(%{public}@).", (uint8_t *)&v15, 0x20u);

  }
  -[TLToneManager _currentWatchToneIdentifierForAlertType:topic:didFindPersistedWatchToneIdentifier:](self, "_currentWatchToneIdentifierForAlertType:topic:didFindPersistedWatchToneIdentifier:", a3, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  TLLogToneManagement();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = self;
    v17 = 2114;
    v18 = v11;
    v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentWatchToneIdentifierForAlertType:(%{public}@) […]: Value from Preferences lookup method: toneIdentifier = %{public}@.", (uint8_t *)&v15, 0x20u);

  }
  if (!v9)
  {
    -[TLToneManager defaultWatchToneIdentifierForAlertType:topic:](self, "defaultWatchToneIdentifierForAlertType:topic:", a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    TLLogToneManagement();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromTLAlertType(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = self;
      v17 = 2114;
      v18 = v13;
      v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_1D33D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: -currentWatchToneIdentifierForAlertType:(%{public}@) […]: Falling back to default due missing setting in Preferences. toneIdentifier = %{public}@.", (uint8_t *)&v15, 0x20u);

    }
  }

  return v9;
}

- (id)_currentWatchToneIdentifierForAlertType:(int64_t)a3 topic:(id)a4 didFindPersistedWatchToneIdentifier:(BOOL *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *NPSDomainAccessorClass;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  char isKindOfClass;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  BOOL *v25;
  uint8_t buf[4];
  TLToneManager *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = objc_msgSend(v8, "length");
  +[TLPreferencesUtilities perWatchPreferencesDomain](TLPreferencesUtilities, "perWatchPreferencesDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _currentWatchToneIdentifierPreferenceKeyForAlertType:topic:](self, "_currentWatchToneIdentifierPreferenceKeyForAlertType:topic:", a3, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 || (NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass()) == 0)
  {
    isKindOfClass = 0;
    v20 = 0;
LABEL_18:
    if (v9)
    {
      -[TLToneManager _currentWatchToneIdentifierForAlertType:topic:didFindPersistedWatchToneIdentifier:](self, "_currentWatchToneIdentifierForAlertType:topic:didFindPersistedWatchToneIdentifier:", a3, 0, 0);
      v23 = objc_claimAutoreleasedReturnValue();

      v20 = (id)v23;
    }
    goto LABEL_20;
  }
  v13 = (void *)objc_msgSend([NPSDomainAccessorClass alloc], "initWithDomain:", v10);
  TLLogToneManagement();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v27 = self;
    v28 = 2114;
    v29 = v13;
    _os_log_impl(&dword_1D33D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentWatchToneIdentifier…: Instantiated domain accessor %{public}@.", buf, 0x16u);
  }

  objc_msgSend(v13, "objectForKey:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  TLLogToneManagement();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v27 = self;
    v28 = 2114;
    v29 = v11;
    v30 = 2114;
    v31 = v13;
    v32 = 2114;
    v33 = v15;
    _os_log_impl(&dword_1D33D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentWatchToneIdentifier…: Retrieved object for key %{public}@ from %{public}@: %{public}@.", buf, 0x2Au);
  }

  v25 = a5;
  if (v9)
  {
    objc_opt_class();
    v17 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "objectForKey:", v8);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    v21 = v9;

    v15 = (void *)v18;
  }
  else
  {
    v17 = v10;
    v21 = 0;
  }
  v22 = v13;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v20 = v15;
  else
    v20 = 0;

  v9 = v21;
  v10 = v17;
  a5 = v25;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_18;
LABEL_20:
  if (a5)
    *a5 = isKindOfClass & 1;

  return v20;
}

- (void)setCurrentWatchToneIdentifier:(id)a3 forAlertType:(int64_t)a4 topic:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  char v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  TLToneManager *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  TLLogToneManagement();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLAlertType(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v25 = self;
    v26 = 2114;
    v27 = v8;
    v28 = 2114;
    v29 = v11;
    v30 = 2114;
    v31 = v9;
    _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -setCurrentWatchToneIdentifier:(%{public}@) forAlertType:(%{public}@) topic:(%{public}@)", buf, 0x2Au);

  }
  buf[0] = 0;
  -[TLToneManager _currentWatchToneIdentifierForAlertType:topic:didFindPersistedWatchToneIdentifier:](self, "_currentWatchToneIdentifierForAlertType:topic:didFindPersistedWatchToneIdentifier:", a4, v9, buf);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!buf[0])
    goto LABEL_11;
  v14 = v12;
  v15 = (unint64_t)v8;
  v16 = (id)v15;
  if (!(v15 | v14))
    goto LABEL_16;
  if (!v15 || !v14)
  {

LABEL_11:
    +[TLPreferencesUtilities perWatchPreferencesDomain](TLPreferencesUtilities, "perWatchPreferencesDomain");
    v14 = objc_claimAutoreleasedReturnValue();
    -[TLToneManager _currentWatchToneIdentifierPreferenceKeyForAlertType:topic:](self, "_currentWatchToneIdentifierPreferenceKeyForAlertType:topic:", a4, v9);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __66__TLToneManager_setCurrentWatchToneIdentifier_forAlertType_topic___block_invoke;
      v19[3] = &unk_1E952AA30;
      v19[4] = self;
      v14 = (uint64_t)(id)v14;
      v20 = (id)v14;
      v21 = v9;
      v16 = v16;
      v22 = v16;
      v23 = v8;
      -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v19);

    }
    else
    {
      TLLogToneManagement();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[TLToneManager setCurrentWatchToneIdentifier:forAlertType:topic:].cold.1((uint64_t)self, a4, v18);

    }
    goto LABEL_16;
  }
  if (v14 != v15)
  {
    v17 = objc_msgSend((id)v14, "isEqualToString:", v15);

    if ((v17 & 1) != 0)
      goto LABEL_17;
    goto LABEL_11;
  }
LABEL_16:

LABEL_17:
}

void __66__TLToneManager_setCurrentWatchToneIdentifier_forAlertType_topic___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  objc_class *NPSDomainAccessorClass;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  if (v2)
  {
    v3 = v2;
LABEL_3:
    v4 = 0;
    goto LABEL_8;
  }
  NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass();
  if (!NPSDomainAccessorClass)
  {
    v3 = 0;
    goto LABEL_3;
  }
  v3 = (void *)objc_msgSend([NPSDomainAccessorClass alloc], "initWithDomain:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v3);
  TLLogToneManagement();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v23 = 138543618;
    v24 = v7;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -setCurrentWatchToneIdentifier…: Instantiated domain accessor %{public}@ and set it to be the transient one.", (uint8_t *)&v23, 0x16u);
  }

  v4 = 1;
LABEL_8:
  if (objc_msgSend(*(id *)(a1 + 48), "length"))
  {
    objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 56));
    v8 = objc_claimAutoreleasedReturnValue();
    TLLogToneManagement();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(a1 + 56);
      v23 = 138544130;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      v27 = 2114;
      v28 = v3;
      v29 = 2114;
      v30 = v8;
      _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -setCurrentWatchToneIdentifier…: Retrieved object for key %{public}@ from %{public}@: %{public}@.", (uint8_t *)&v23, 0x2Au);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = -[NSObject mutableCopy](v8, "mutableCopy");
    else
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = v12;
    v17 = *(_QWORD *)(a1 + 64);
    if (v17)
      -[NSObject setObject:forKey:](v12, "setObject:forKey:", v17, *(_QWORD *)(a1 + 48));
    else
      -[NSObject removeObjectForKey:](v12, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v3, "setObject:forKey:", v13, *(_QWORD *)(a1 + 56));
    TLLogToneManagement();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(a1 + 56);
      v23 = 138544130;
      v24 = v19;
      v25 = 2114;
      v26 = v20;
      v27 = 2114;
      v28 = v3;
      v29 = 2114;
      v30 = v13;
      _os_log_impl(&dword_1D33D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: -setCurrentWatchToneIdentifier…: Did set object for key %{public}@ on %{public}@: %{public}@.", (uint8_t *)&v23, 0x2Au);
    }

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
    TLLogToneManagement();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(a1 + 56);
      v16 = *(NSObject **)(a1 + 64);
      v23 = 138544130;
      v24 = v14;
      v25 = 2114;
      v26 = v15;
      v27 = 2114;
      v28 = v3;
      v29 = 2114;
      v30 = v16;
      _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -setCurrentWatchToneIdentifier…: Did set object for key %{public}@ on %{public}@: %{public}@.", (uint8_t *)&v23, 0x2Au);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "_didSetTonePreferenceSuccessfullyWithKey:inDomain:usingPreferencesOfKind:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 2);
  if (v4)
  {
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 64);
    *(_QWORD *)(v21 + 64) = 0;

  }
}

- (id)_currentToneWatchAlertPolicyPreferenceKeyForAlertType:(int64_t)a3 topic:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "_systemWideTonePreferenceKeyForAlertType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("sound-identifier"), CFSTR("sound"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingString:", CFSTR("-watch-alert-policy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "length");
  if (v9)
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("-per-account"));
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  return v8;
}

- (int64_t)_currentToneWatchAlertPolicyForAlertType:(int64_t)a3
{
  return -[TLToneManager _currentToneWatchAlertPolicyForAlertType:topic:](self, "_currentToneWatchAlertPolicyForAlertType:topic:", a3, 0);
}

- (int64_t)_currentToneWatchAlertPolicyForAlertType:(int64_t)a3 topic:(id)a4
{
  return -[TLToneManager _currentToneWatchAlertPolicyForAlertType:topic:didFindPersistedWatchAlertPolicy:](self, "_currentToneWatchAlertPolicyForAlertType:topic:didFindPersistedWatchAlertPolicy:", a3, a4, 0);
}

- (int64_t)_currentToneWatchAlertPolicyForAlertType:(int64_t)a3 topic:(id)a4 didFindPersistedWatchAlertPolicy:(BOOL *)a5
{
  id v8;
  int64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_class *NPSDomainAccessorClass;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  char isKindOfClass;
  BOOL *v23;
  uint8_t buf[4];
  TLToneManager *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if ((unint64_t)(a3 - 13) >= 2)
  {
    if (a3 == 17)
    {
      +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "supportsNanoEncore");

      v9 = v11 ^ 1u;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 1;
  }
  v12 = objc_msgSend(v8, "length");
  +[TLPreferencesUtilities perWatchPreferencesDomain](TLPreferencesUtilities, "perWatchPreferencesDomain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _currentToneWatchAlertPolicyPreferenceKeyForAlertType:topic:](self, "_currentToneWatchAlertPolicyPreferenceKeyForAlertType:topic:", a3, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || (NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass()) == 0)
  {
    isKindOfClass = 0;
LABEL_21:
    if (v12)
      v9 = -[TLToneManager _currentToneWatchAlertPolicyForAlertType:topic:didFindPersistedWatchAlertPolicy:](self, "_currentToneWatchAlertPolicyForAlertType:topic:didFindPersistedWatchAlertPolicy:", a3, 0, 0);
    goto LABEL_23;
  }
  v23 = a5;
  v16 = (void *)objc_msgSend([NPSDomainAccessorClass alloc], "initWithDomain:", v13);
  TLLogToneManagement();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = self;
    v26 = 2114;
    v27 = v16;
    _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneWatchAlertPolicy…: Instantiated domain accessor %{public}@.", buf, 0x16u);
  }

  objc_msgSend(v16, "objectForKey:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  TLLogToneManagement();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v25 = self;
    v26 = 2114;
    v27 = v14;
    v28 = 2114;
    v29 = v16;
    v30 = 2114;
    v31 = v18;
    _os_log_impl(&dword_1D33D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: -_currentToneWatchAlertPolicy…: Retrieved object for key %{public}@ from %{public}@: %{public}@.", buf, 0x2Au);
  }

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "objectForKey:", v8);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }

    v18 = (void *)v20;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v9 = TLWatchAlertPolicyFromString(v18);

  a5 = v23;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_21;
LABEL_23:
  if (a5)
    *a5 = isKindOfClass & 1;

  return v9;
}

- (void)_setCurrentToneWatchAlertPolicy:(int64_t)a3 forAlertType:(int64_t)a4
{
  -[TLToneManager _setCurrentToneWatchAlertPolicy:forAlertType:topic:](self, "_setCurrentToneWatchAlertPolicy:forAlertType:topic:", a3, a4, 0);
}

- (void)_setCurrentToneWatchAlertPolicy:(int64_t)a3 forAlertType:(int64_t)a4 topic:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  TLToneManager *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  TLLogToneManagement();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromTLWatchAlertPolicy(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromTLAlertType(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v24 = self;
    v25 = 2114;
    v26 = v10;
    v27 = 2114;
    v28 = v11;
    v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentToneWatchAlertPolicy:(%{public}@) forAlertType:(%{public}@) topic:(%{public}@)", buf, 0x2Au);

  }
  if (a3 == 3)
  {
    -[TLToneManager currentToneIdentifierForAlertType:topic:](self, "currentToneIdentifierForAlertType:topic:", a4, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("<none>")))
      a3 = 2;
    else
      a3 = 1;

  }
  buf[0] = 0;
  v13 = -[TLToneManager _currentToneWatchAlertPolicyForAlertType:topic:didFindPersistedWatchAlertPolicy:](self, "_currentToneWatchAlertPolicyForAlertType:topic:didFindPersistedWatchAlertPolicy:", a4, v8, buf);
  if (!buf[0] || v13 != a3)
  {
    +[TLPreferencesUtilities perWatchPreferencesDomain](TLPreferencesUtilities, "perWatchPreferencesDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLToneManager _currentToneWatchAlertPolicyPreferenceKeyForAlertType:topic:](self, "_currentToneWatchAlertPolicyPreferenceKeyForAlertType:topic:", a4, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      NSStringFromTLWatchAlertPolicy(a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __68__TLToneManager__setCurrentToneWatchAlertPolicy_forAlertType_topic___block_invoke;
      v18[3] = &unk_1E952AA30;
      v18[4] = self;
      v19 = v14;
      v20 = v8;
      v21 = v15;
      v22 = v16;
      v17 = v16;
      -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v18);

    }
    else
    {
      TLLogToneManagement();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[TLToneManager _setCurrentToneWatchAlertPolicy:forAlertType:topic:].cold.1(a4);
    }

  }
}

void __68__TLToneManager__setCurrentToneWatchAlertPolicy_forAlertType_topic___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  objc_class *NPSDomainAccessorClass;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  if (v2)
  {
    v3 = v2;
LABEL_3:
    v4 = 0;
    goto LABEL_8;
  }
  NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass();
  if (!NPSDomainAccessorClass)
  {
    v3 = 0;
    goto LABEL_3;
  }
  v3 = (void *)objc_msgSend([NPSDomainAccessorClass alloc], "initWithDomain:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v3);
  TLLogToneManagement();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v22 = 138543618;
    v23 = v7;
    v24 = 2114;
    v25 = v3;
    _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentToneWatchAlertPolicy…: Instantiated domain accessor %{public}@ and set it to be the transient one.", (uint8_t *)&v22, 0x16u);
  }

  v4 = 1;
LABEL_8:
  if (objc_msgSend(*(id *)(a1 + 48), "length"))
  {
    objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 56));
    v8 = objc_claimAutoreleasedReturnValue();
    TLLogToneManagement();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(a1 + 56);
      v22 = 138544130;
      v23 = v10;
      v24 = 2114;
      v25 = v11;
      v26 = 2114;
      v27 = v3;
      v28 = 2114;
      v29 = v8;
      _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentToneWatchAlertPolicy…: Retrieved object for key %{public}@ from %{public}@: %{public}@.", (uint8_t *)&v22, 0x2Au);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = -[NSObject mutableCopy](v8, "mutableCopy");
    else
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = v12;
    -[NSObject setObject:forKey:](v12, "setObject:forKey:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
    objc_msgSend(v3, "setObject:forKey:", v13, *(_QWORD *)(a1 + 56));
    TLLogToneManagement();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(a1 + 56);
      v22 = 138544130;
      v23 = v18;
      v24 = 2114;
      v25 = v19;
      v26 = 2114;
      v27 = v3;
      v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_1D33D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentToneWatchAlertPolicy…: Did set object for key %{public}@ on %{public}@: %{public}@.", (uint8_t *)&v22, 0x2Au);
    }

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
    TLLogToneManagement();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(a1 + 56);
      v16 = *(NSObject **)(a1 + 64);
      v22 = 138544130;
      v23 = v14;
      v24 = 2114;
      v25 = v15;
      v26 = 2114;
      v27 = v3;
      v28 = 2114;
      v29 = v16;
      _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setCurrentToneWatchAlertPolicy…: Did set object for key %{public}@ on %{public}@: %{public}@.", (uint8_t *)&v22, 0x2Au);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "_didSetTonePreferenceSuccessfullyWithKey:inDomain:usingPreferencesOfKind:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 2);
  if (v4)
  {
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 64);
    *(_QWORD *)(v20 + 64) = 0;

  }
}

- (BOOL)_watchPrefersSalientNotifications
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__TLToneManager__watchPrefersSalientNotifications__block_invoke;
  v4[3] = &unk_1E952A860;
  v4[4] = self;
  v4[5] = &v5;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __50__TLToneManager__watchPrefersSalientNotifications__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  objc_class *NPSDomainAccessorClass;
  objc_class *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  _WORD v17[17];

  *(_QWORD *)&v17[13] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 57))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(v2 + 56);
    TLLogToneManagement();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v14 = 138543618;
      v15 = v4;
      v16 = 1024;
      *(_DWORD *)v17 = v5;
      _os_log_impl(&dword_1D33D5000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: _watchPrefersSalientNotifications: Returning %{BOOL}u from cache.", (uint8_t *)&v14, 0x12u);
    }
  }
  else
  {
    NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass();
    if (!NPSDomainAccessorClass)
      return;
    v7 = NPSDomainAccessorClass;
    +[TLPreferencesUtilities perWatchPreferencesDomain](TLPreferencesUtilities, "perWatchPreferencesDomain");
    v3 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend([v7 alloc], "initWithDomain:", v3);
    TLLogToneManagement();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      *(_QWORD *)v17 = v8;
      _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_watchPrefersSalientNotifications: Instantiated domain accessor %{public}@.", (uint8_t *)&v14, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "BOOLForKey:", CFSTR("watch-prefers-salient-notification"));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = 1;
    TLLogToneManagement();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v14 = 138543874;
      v15 = v12;
      v16 = 1024;
      *(_DWORD *)v17 = v13;
      v17[2] = 2114;
      *(_QWORD *)&v17[3] = v8;
      _os_log_impl(&dword_1D33D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: _watchPrefersSalientNotifications: Read %{BOOL}u from %{public}@; caching this value, and returning it.",
        (uint8_t *)&v14,
        0x1Cu);
    }

  }
}

- (void)_setWatchPrefersSalientNotifications:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  BOOL v9;

  +[TLPreferencesUtilities perWatchPreferencesDomain](TLPreferencesUtilities, "perWatchPreferencesDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__TLToneManager__setWatchPrefersSalientNotifications___block_invoke;
  v7[3] = &unk_1E952AA58;
  v7[4] = self;
  v8 = v5;
  v9 = a3;
  v6 = v5;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v7);

}

void __54__TLToneManager__setWatchPrefersSalientNotifications___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  objc_class *NPSDomainAccessorClass;
  NSObject *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v18;
  uint64_t v19;
  __int16 v20;
  _BYTE v21[18];
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  if (v2)
  {
    v3 = v2;
LABEL_3:
    v4 = 0;
    goto LABEL_8;
  }
  NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass();
  if (!NPSDomainAccessorClass)
  {
    v3 = 0;
    goto LABEL_3;
  }
  v3 = (void *)objc_msgSend([NPSDomainAccessorClass alloc], "initWithDomain:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v3);
  TLLogToneManagement();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v18 = 138543618;
    v19 = v7;
    v20 = 2114;
    *(_QWORD *)v21 = v3;
    _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setWatchPrefersSalientNotifications…: Instantiated domain accessor %{public}@ and set it to be the transient one.", (uint8_t *)&v18, 0x16u);
  }

  v4 = 1;
LABEL_8:
  v8 = objc_msgSend(v3, "BOOLForKey:", CFSTR("watch-prefers-salient-notification"));
  TLLogToneManagement();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v18 = 138543874;
    v19 = v10;
    v20 = 1024;
    *(_DWORD *)v21 = v8;
    *(_WORD *)&v21[4] = 2114;
    *(_QWORD *)&v21[6] = v3;
    _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: _setWatchPrefersSalientNotifications…: Read didWatchAlreadyPreferSalientNotifications = %{BOOL}u from %{public}@.", (uint8_t *)&v18, 0x1Cu);
  }

  v11 = *(unsigned __int8 *)(a1 + 48);
  if (v11 != v8)
  {
    objc_msgSend(v3, "setBool:forKey:", v11 != 0, CFSTR("watch-prefers-salient-notification"));
    TLLogToneManagement();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(unsigned __int8 *)(a1 + 48);
      v18 = 138544130;
      v19 = v13;
      v20 = 2114;
      *(_QWORD *)v21 = CFSTR("watch-prefers-salient-notification");
      *(_WORD *)&v21[8] = 2114;
      *(_QWORD *)&v21[10] = v3;
      v22 = 1024;
      v23 = v14;
      _os_log_impl(&dword_1D33D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: -_setWatchPrefersSalientNotifications…: Did set BOOLean value for key %{public}@ on %{public}@: %{BOOL}u.", (uint8_t *)&v18, 0x26u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_didSetTonePreferenceSuccessfullyWithKey:inDomain:usingPreferencesOfKind:", CFSTR("watch-prefers-salient-notification"), *(_QWORD *)(a1 + 40), 2);
  }
  if (v4)
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 64);
    *(_QWORD *)(v15 + 64) = 0;

  }
  if (*(unsigned __int8 *)(a1 + 48) != v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleWatchPrefersSalientNotificationDidChange");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 58) = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("_TLAlertWatchPrefersSalientNotificationPreferenceDidChangeLocallyNotification"), 0, 0, 1u);
  }

}

- (void)_handleWatchPrefersSalientNotificationDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__TLToneManager__handleWatchPrefersSalientNotificationDidChange__block_invoke;
  v2[3] = &unk_1E952A748;
  v2[4] = self;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v2);
}

void __64__TLToneManager__handleWatchPrefersSalientNotificationDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 56);
  v4 = *(unsigned __int8 *)(v2 + 57);
  *(_BYTE *)(v2 + 57) = 0;
  v5 = objc_msgSend(*(id *)(a1 + 32), "_watchPrefersSalientNotifications");
  if (v4)
    v6 = v3 == v5;
  else
    v6 = 0;
  if (!v6)
  {
    v7 = *(void **)(a1 + 32);
    +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
    {
      dispatch_get_global_queue(0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v9, &__block_literal_global_650);

    }
  }
}

void __64__TLToneManager__handleWatchPrefersSalientNotificationDidChange__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("_TLAlertWatchPrefersSalientToneAndVibrationDidChangeNotification"), 0);

}

+ (id)_currentOverridePolicyPreferenceKeyForAlertType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_systemWideTonePreferenceKeyForAlertType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-sound-identifier"), &stru_1E952DE48);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingString:", CFSTR("-alert-override-policy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)_currentOverridePolicyForAlertType:(int64_t)a3
{
  return -[TLToneManager _currentOverridePolicyForAlertType:didFindAlertOverridePolicy:](self, "_currentOverridePolicyForAlertType:didFindAlertOverridePolicy:", a3, 0);
}

- (int64_t)_currentOverridePolicyForAlertType:(int64_t)a3 didFindAlertOverridePolicy:(BOOL *)a4
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  CFPropertyListRef v8;
  void *v9;
  CFTypeID v10;
  CFTypeID TypeID;
  BOOL v12;
  int64_t v14;

  objc_msgSend((id)objc_opt_class(), "_currentOverridePolicyPreferenceKeyForAlertType:", a3);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain")) == 0)
  {
    v12 = 0;
    v14 = 0;
    if (!a4)
      goto LABEL_9;
LABEL_8:
    *a4 = v12;
    goto LABEL_9;
  }
  v7 = v6;
  v8 = CFPreferencesCopyAppValue(v5, v6);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = CFGetTypeID(v8);
    TypeID = CFStringGetTypeID();
    v12 = v10 == TypeID;
    if (v10 == TypeID)
      v14 = TLAlertOverridePolicyFromString(v9);
    else
      v14 = 0;
    CFRelease(v9);
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  CFRelease(v7);
  if (a4)
    goto LABEL_8;
LABEL_9:

  return v14;
}

- (void)_setCurrentOverridePolicy:(int64_t)a3 forAlertType:(int64_t)a4
{
  int64_t v7;
  BOOL v8;
  __CFString *v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  char v14;

  v14 = 0;
  v7 = -[TLToneManager _currentOverridePolicyForAlertType:didFindAlertOverridePolicy:](self, "_currentOverridePolicyForAlertType:didFindAlertOverridePolicy:", a4, &v14);
  if (v14)
    v8 = v7 == a3;
  else
    v8 = 0;
  if (!v8)
  {
    objc_msgSend((id)objc_opt_class(), "_currentOverridePolicyPreferenceKeyForAlertType:", a4);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain");
      if (v10)
      {
        v11 = v10;
        NSStringFromTLAlertOverridePolicy(a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        CFPreferencesSetAppValue(v9, v12, v11);
        CFRelease(v11);

        -[TLToneManager _didSetTonePreferenceSuccessfullyWithKey:inDomain:usingPreferencesOfKind:](self, "_didSetTonePreferenceSuccessfullyWithKey:inDomain:usingPreferencesOfKind:", v9, +[TLPreferencesUtilities preferencesDomain](TLPreferencesUtilities, "preferencesDomain"), 1);
      }
    }
    else
    {
      TLLogToneManagement();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[TLToneManager _setCurrentOverridePolicy:forAlertType:].cold.1(a4);

    }
  }
}

+ (id)_abbreviatedDescriptionOfToneIdentifierWithUnderlyingMediaPlaybackArchiveForLogging:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = objc_msgSend(CFSTR("mediaPlaybackArchive:"), "length");
  if (objc_msgSend(v3, "length") <= (unint64_t)(2 * v4))
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(v3, "substringToIndex:", 2 * v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("…"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)_abbreviatedDescriptionOfMediaPlaybackArchive:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = (objc_class *)MEMORY[0x1E0CB37A0];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("<%@: %p"), v7, v4);

  objc_msgSend(v4, "displayProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "title");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    objc_msgSend(v8, "appendFormat:", CFSTR("; title = \"%@\"), v10);
  objc_msgSend(v9, "subtitle");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    objc_msgSend(v8, "appendFormat:", CFSTR("; subtitle = \"%@\"), v12);
  objc_msgSend(v8, "appendString:", CFSTR(">"));

  return v8;
}

- (id)_toneIdentifierWithUnderlyingPlaybackArchive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  TLToneManager *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_abbreviatedDescriptionOfMediaPlaybackArchive:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v14;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("mediaPlaybackArchive:"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_abbreviatedDescriptionOfToneIdentifierWithUnderlyingMediaPlaybackArchiveForLogging:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      TLLogToneManagement();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v16 = self;
        v17 = 2114;
        v18 = v5;
        v19 = 2114;
        v20 = v10;
        _os_log_impl(&dword_1D33D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: _toneIdentifierWithUnderlyingPlaybackArchive:(%{public}@): Returning \"%{public}@\".", buf, 0x20u);
      }

    }
    else
    {
      TLLogToneManagement();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[TLToneManager _toneIdentifierWithUnderlyingPlaybackArchive:].cold.1();
      v9 = 0;
    }

  }
  else
  {
    TLLogToneManagement();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "tl_nonRedundantDescription");
      v13 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = self;
      v17 = 2114;
      v18 = v5;
      v19 = 2114;
      v20 = v13;
      _os_log_error_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@: _toneIdentifierWithUnderlyingPlaybackArchive:(%{public}@): Failed to serialize playback archive with error: %{public}@.", buf, 0x20u);

    }
    v9 = 0;
  }

  return v9;
}

- (id)_underlyingPlaybackArchiveForToneIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE buf[24];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_abbreviatedDescriptionOfToneIdentifierWithUnderlyingMediaPlaybackArchiveForLogging:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("mediaPlaybackArchive:")))
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("mediaPlaybackArchive:"), "length"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 1);
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)MEMORY[0x1E0CB3710];
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v10 = (void *)getMPPlaybackArchiveClass_softClass;
    v21 = getMPPlaybackArchiveClass_softClass;
    if (!getMPPlaybackArchiveClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getMPPlaybackArchiveClass_block_invoke;
      v23 = &unk_1E952AB10;
      v24 = &v18;
      __getMPPlaybackArchiveClass_block_invoke((uint64_t)buf);
      v10 = (void *)v19[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v18, 8);
    v17 = 0;
    objc_msgSend(v9, "unarchivedObjectOfClass:fromData:error:", v11, v8, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    if (v12)
    {
      objc_msgSend((id)objc_opt_class(), "_abbreviatedDescriptionOfMediaPlaybackArchive:", v12);
      v14 = objc_claimAutoreleasedReturnValue();
      TLLogToneManagement();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 2114;
        v23 = v14;
        _os_log_impl(&dword_1D33D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: _underlyingPlaybackArchiveForToneIdentifier:(%{public}@): Returning %{public}@.", buf, 0x20u);
      }

    }
    else
    {
      TLLogToneManagement();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[TLToneManager _underlyingPlaybackArchiveForToneIdentifier:].cold.2();
    }

  }
  else
  {
    TLLogToneManagement();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[TLToneManager _underlyingPlaybackArchiveForToneIdentifier:].cold.1();
    v12 = 0;
  }

  return v12;
}

- (BOOL)_hasUnderlyingPlaybackArchiveForToneIdentifier:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = !-[TLToneManager _toneWithIdentifierIsDefaultRingtone:](self, "_toneWithIdentifierIsDefaultRingtone:", v4)
    && !-[TLToneManager _toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:](self, "_toneWithIdentifierIsNonDefaultAndNonEmbeddedSystemRingtone:", v4)&& !-[TLToneManager _toneWithIdentifierIsITunesRingtone:](self, "_toneWithIdentifierIsITunesRingtone:", v4)&& !-[TLToneManager _toneWithIdentifierIsSystemTone:](self, "_toneWithIdentifierIsSystemTone:", v4)&& !-[TLToneManager _toneWithIdentifierIsAlarmWakeUp:](self, "_toneWithIdentifierIsAlarmWakeUp:", v4)&& -[TLToneManager _toneWithIdentifierIsMediaPlaybackArchive:](self, "_toneWithIdentifierIsMediaPlaybackArchive:", v4);

  return v5;
}

- (void)_performBlockInAccessQueue:(id)a3
{
  -[TLAccessQueue performSynchronousBlock:](self->_accessQueue, "performSynchronousBlock:", a3);
}

- (id)_fileNameFromToneIdentifier:(id)a3 withPrefix:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  v5 = a3;
  if (objc_msgSend(v5, "rangeOfString:", a4) || (v7 = v6, v6 >= objc_msgSend(v5, "length")))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "substringFromIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_localizedNameOfToneWithIdentifier:(id)a3
{
  __CFString *v3;
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;

  v3 = (__CFString *)a3;
  +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "wantsModernDefaultRingtone"))
  {
    v5 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("system:Opening"));

    v6 = v3;
    if (!v5)
      goto LABEL_6;
    v6 = CFSTR("RINGTONE_PICKER_DEFAULT_RINGTONE_NAME");
    v4 = v3;
  }
  else
  {
    v6 = v3;
  }

LABEL_6:
  TLLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v6))
  {

    v7 = 0;
  }

  return v7;
}

- (BOOL)_ensureDirectoryExistsAtPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "fileExistsAtPath:", v3) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v9 = 0;
      v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v9);
      v6 = v9;
      if ((v5 & 1) == 0)
      {
        TLLogToneManagement();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[TLToneManager _ensureDirectoryExistsAtPath:].cold.1();

      }
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_didSetTonePreferenceSuccessfullyWithKey:(id)a3 inDomain:(id)a4 usingPreferencesOfKind:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v13;
  objc_class *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE buf[24];
  void *v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  TLLogToneManagement();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    v26 = v9;
    _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetTonePreferenceSuccessfullyWithKey:(%{public}@) inDomain:(%{public}@)…", buf, 0x20u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__TLToneManager__didSetTonePreferenceSuccessfullyWithKey_inDomain_usingPreferencesOfKind___block_invoke;
  v20[3] = &unk_1E952AAA0;
  v20[4] = self;
  v20[5] = a5;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v20);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("_TLTonePreferencesDidChangeNotification"), 0, 0, 1u);
  if (a5)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v13 = (void *)getNPSManagerClass_softClass;
    v24 = getNPSManagerClass_softClass;
    if (!getNPSManagerClass_softClass)
    {
      *(_QWORD *)buf = v11;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getNPSManagerClass_block_invoke;
      v26 = &unk_1E952AB10;
      v27[0] = &v21;
      __getNPSManagerClass_block_invoke((uint64_t)buf);
      v13 = (void *)v22[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v21, 8);
    if (v14)
    {
      v15 = objc_alloc_init(v14);
      TLLogToneManagement();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v15;
        _os_log_impl(&dword_1D33D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetTonePreferenceSuccessfully…: Instantiated preferences sync manager %{public}@.", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v8, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a5 & 1) != 0)
      {
        objc_msgSend(v15, "synchronizeUserDefaultsDomain:keys:", v9, v17);
        TLLogToneManagement();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2114;
          v26 = v15;
          LOWORD(v27[0]) = 2114;
          *(_QWORD *)((char *)v27 + 2) = v17;
          _os_log_impl(&dword_1D33D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetTonePreferenceSuccessfully…: Did synchronize user defaults domain %{public}@ with %{public}@ for keys %{public}@.", buf, 0x2Au);
        }

      }
      if ((a5 & 2) != 0)
      {
        objc_msgSend(v15, "synchronizeNanoDomain:keys:", v9, v17);
        TLLogToneManagement();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2114;
          v26 = v15;
          LOWORD(v27[0]) = 2114;
          *(_QWORD *)((char *)v27 + 2) = v17;
          _os_log_impl(&dword_1D33D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didSetTonePreferenceSuccessfully…: Did synchronize nano domain %{public}@ with %{public}@ for keys %{public}@.", buf, 0x2Au);
        }

      }
    }
  }

}

uint64_t __90__TLToneManager__didSetTonePreferenceSuccessfullyWithKey_inDomain_usingPreferencesOfKind___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "_handleTonePreferencesChangedNotificationForPreferencesKinds:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
  return result;
}

+ (BOOL)_ensureTCCAccessPreflightAndCheckForFileExistenceAtPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___TLToneManagerTCCPreflightOnceToken != -1)
    dispatch_once(&_ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___TLToneManagerTCCPreflightOnceToken, block);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((_ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___TLToneManagerTCCAccessPreflightStatus + 1) > 3)
    v7 = 0;
  else
    v7 = (uint64_t)*(&off_1E952AB90
                  + _ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___TLToneManagerTCCAccessPreflightStatus
                  + 1);
  TLLogToneManagement();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v13 = a1;
      v14 = 2114;
      v15 = v4;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: File exists at path %{public}@. TCCAccessPreflight status: %{public}@.", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v13 = a1;
    v14 = 2114;
    v15 = v4;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@: File DOES NOT exists at path %{public}@. TCCAccessPreflight status: %{public}@.", buf, 0x20u);
  }

  return v6;
}

void __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  const __CFString *v9;
  NSObject *v10;
  uint64_t v11;
  _BYTE v12[24];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v12 = 0;
  *(_QWORD *)&v12[8] = v12;
  *(_QWORD *)&v12[16] = 0x2020000000;
  v2 = (id *)getkTCCServiceMediaLibrarySymbolLoc_ptr;
  v13 = (void *)getkTCCServiceMediaLibrarySymbolLoc_ptr;
  if (!getkTCCServiceMediaLibrarySymbolLoc_ptr)
  {
    v3 = (void *)TCCLibrary();
    v2 = (id *)dlsym(v3, "kTCCServiceMediaLibrary");
    *(_QWORD *)(*(_QWORD *)&v12[8] + 24) = v2;
    getkTCCServiceMediaLibrarySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(v12, 8);
  if (!v2)
    goto LABEL_19;
  v4 = objc_retainAutorelease(*v2);
  *(_QWORD *)v12 = 0;
  *(_QWORD *)&v12[8] = v12;
  *(_QWORD *)&v12[16] = 0x2020000000;
  v5 = getTCCAccessPreflightSymbolLoc_ptr;
  v13 = getTCCAccessPreflightSymbolLoc_ptr;
  if (!getTCCAccessPreflightSymbolLoc_ptr)
  {
    v6 = (void *)TCCLibrary();
    v5 = dlsym(v6, "TCCAccessPreflight");
    *(_QWORD *)(*(_QWORD *)&v12[8] + 24) = v5;
    getTCCAccessPreflightSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(v12, 8);
  if (!v5)
  {
LABEL_19:
    __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    __break(1u);
  }
  v7 = ((uint64_t (*)(id, _QWORD))v5)(v4, 0);
  if (v7 == 2)
  {
    v8 = 0;
  }
  else
  {
    if (v7 != 1)
    {
      if (v7)
      {
        v9 = 0;
        v8 = -1;
      }
      else
      {
        v8 = 1;
        v9 = CFSTR("granted");
      }
      TLLogToneManagement();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v12 = 138543618;
        *(_QWORD *)&v12[4] = v11;
        *(_WORD *)&v12[12] = 2114;
        *(_QWORD *)&v12[14] = v9;
        _os_log_impl(&dword_1D33D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoked TCCAccessPreflight(kTCCServiceMediaLibrary, NULL). Got result: %{public}@.", v12, 0x16u);
      }
      goto LABEL_18;
    }
    v8 = 2;
  }
  TLLogToneManagement();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_3();
LABEL_18:

  _ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___TLToneManagerTCCAccessPreflightStatus = v8;
}

- (void)_handleTonePreferencesChangedNotificationForPreferencesKinds:(unint64_t)a3
{
  NSObject *v4;
  NSDictionary *cachedTonePreferences;
  NSObject *v6;
  NSObject *v7;
  char v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  char v13;
  objc_class *NPSDomainAccessorClass;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  _QWORD v28[5];
  char v29;
  _QWORD v30[6];
  _QWORD block[5];
  uint8_t v32[4];
  TLToneManager *v33;
  __int16 v34;
  uint64_t v35;
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (self->_shouldIgnoreNextToneDidChangeNotification)
  {
    self->_shouldIgnoreNextToneDidChangeNotification = 0;
    TLLogToneManagement();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1D33D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleTonePreferencesChangedNotification…: Ignoring notification.", buf, 0xCu);
    }

    return;
  }
  if (!self->_shouldUseServiceToAccessTonePreferences)
  {
    v8 = a3;
    TLLogToneManagement();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleTonePreferencesChangedNotification…", buf, 0xCu);
    }

    if ((v8 & 1) != 0
      && (v10 = +[TLPreferencesUtilities copySharedResourcesPreferencesDomain](TLPreferencesUtilities, "copySharedResourcesPreferencesDomain"), (v11 = v10) != 0))
    {
      CFPreferencesSynchronize(v10, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      TLLogToneManagement();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v11;
        _os_log_impl(&dword_1D33D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleTonePreferencesChangedNotification…: Synchronized CFPreferences domain %{public}@.", buf, 0x16u);
      }

      CFRelease(v11);
      v13 = 1;
      if ((v8 & 2) == 0)
        goto LABEL_30;
    }
    else
    {
      v13 = 0;
      if ((v8 & 2) == 0)
      {
LABEL_30:
        dispatch_get_global_queue(0, 0);
        v27 = objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __78__TLToneManager__handleTonePreferencesChangedNotificationForPreferencesKinds___block_invoke_681;
        v28[3] = &unk_1E952AAE8;
        v28[4] = self;
        v29 = v13;
        dispatch_async(v27, v28);

        return;
      }
    }
    if (+[TLPreferencesUtilities canAccessNanoRegistry](TLPreferencesUtilities, "canAccessNanoRegistry")
      && (NPSDomainAccessorClass = (objc_class *)getNPSDomainAccessorClass()) != 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v37 = __Block_byref_object_copy_;
      v38 = __Block_byref_object_dispose_;
      v39 = 0;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __78__TLToneManager__handleTonePreferencesChangedNotificationForPreferencesKinds___block_invoke_680;
      v30[3] = &unk_1E952A6F8;
      v30[4] = self;
      v30[5] = buf;
      -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v30);
      v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (!v15)
      {
        v16 = [NPSDomainAccessorClass alloc];
        +[TLPreferencesUtilities perWatchPreferencesDomain](TLPreferencesUtilities, "perWatchPreferencesDomain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "initWithDomain:", v17);
        v19 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v18;

        TLLogToneManagement();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v32 = 138543618;
          v33 = self;
          v34 = 2114;
          v35 = v21;
          _os_log_impl(&dword_1D33D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleTonePreferencesChangedNotification…: Instantiated domain accessor %{public}@.", v32, 0x16u);
        }

        v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
      }
      v22 = (id)objc_msgSend(v15, "synchronize");
      TLLogToneManagement();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v32 = 138543618;
        v33 = self;
        v34 = 2114;
        v35 = v24;
        _os_log_impl(&dword_1D33D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleTonePreferencesChangedNotification…: Synchronized domain accessor %{public}@.", v32, 0x16u);
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      TLLogToneManagement();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = +[TLPreferencesUtilities canAccessNanoRegistry](TLPreferencesUtilities, "canAccessNanoRegistry");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v26;
        _os_log_impl(&dword_1D33D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleTonePreferencesChangedNotification…: Skipping synchronizing the domain accessor. canAccessNanoRegistry = %{BOOL}u.", buf, 0x12u);
      }

    }
    goto LABEL_30;
  }
  cachedTonePreferences = self->_cachedTonePreferences;
  self->_cachedTonePreferences = 0;

  TLLogToneManagement();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_handleTonePreferencesChangedNotification…: Clearing cached tone preferences.", buf, 0xCu);
  }

  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__TLToneManager__handleTonePreferencesChangedNotificationForPreferencesKinds___block_invoke;
  block[3] = &unk_1E952A748;
  block[4] = self;
  dispatch_async(v7, block);

}

void __78__TLToneManager__handleTonePreferencesChangedNotificationForPreferencesKinds___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("TLTonePreferencesDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __78__TLToneManager__handleTonePreferencesChangedNotificationForPreferencesKinds___block_invoke_680(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

void __78__TLToneManager__handleTonePreferencesChangedNotificationForPreferencesKinds___block_invoke_681(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("TLTonePreferencesDidChangeNotification"), *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("_TLAlertOverridePolicyDidChangeNotification"), 0);

}

- (void)_handleProtectionContentUnlockedEvent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__TLToneManager__handleProtectionContentUnlockedEvent__block_invoke;
  v2[3] = &unk_1E952A748;
  v2[4] = self;
  -[TLToneManager _performBlockInAccessQueue:](self, "_performBlockInAccessQueue:", v2);
}

uint64_t __54__TLToneManager__handleProtectionContentUnlockedEvent__block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(void **)(v1 + 48);
  if (v2)
  {
    v3 = result;
    *(_QWORD *)(v1 + 48) = 0;

    return objc_msgSend(*(id *)(v3 + 32), "_reloadTonesAfterExternalChange");
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTonePreferences, 0);
  objc_storeStrong((id *)&self->_transientNanoPreferencesDomainAccessor, 0);
  objc_storeStrong((id *)&self->_contentProtectionStateObserverToken, 0);
  objc_storeStrong((id *)&self->_toneIdentifierAliasMap, 0);
  objc_storeStrong((id *)&self->_systemTonesByIdentifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifiersBySyncIdentifier, 0);
  objc_storeStrong((id *)&self->_tonesByIdentifier, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_addToneEntries:(NSObject *)a3 toManifestAtPath:mediaDirectory:shouldSkipReload:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  id v5;

  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  v5 = a1;
  _os_log_error_impl(&dword_1D33D5000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Could not update ringtones plist", (uint8_t *)a2, 0xCu);

}

void __82__TLToneManager__addToneEntries_toManifestAtPath_mediaDirectory_shouldSkipReload___block_invoke_192_cold_1(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  os_log_t v6;
  os_log_type_t v7;
  const char *v8;
  uint8_t *v9;

  v2 = (void *)objc_opt_class();
  v3 = *(void **)(a1 + 40);
  v4 = v2;
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(v5, v6, v7, v8, v9, 0x20u);

}

void __60__TLToneManager__removeToneWithIdentifier_orSyncIdentifier___block_invoke_195_cold_1()
{
  id v0;
  id v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_opt_class();
  OUTLINED_FUNCTION_6();
  v1 = v0;
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x34u);

}

- (void)_removeTonesFromManifestAtPath:fileNames:shouldSkipReload:alreadyLockedManifest:removedEntries:.cold.1()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_opt_class();
  OUTLINED_FUNCTION_6();
  v1 = v0;
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "%{public}@: Could not update ringtones plist", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)_lockManifestAtPath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D33D5000, a1, a3, "Unable to create file lock.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_10();
}

- (void)_lockManifestAtPath:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D33D5000, a1, a3, "Unable to take file lock.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_10();
}

void __44__TLToneManager__tonePreferencesFromService__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "tl_nonRedundantDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "Unexpected error while retrieving current tone preferences: %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __44__TLToneManager__tonePreferencesFromService__block_invoke_544_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "tl_nonRedundantDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "Failed retrieving current tone preferences: %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "tl_nonRedundantDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "Unexpected error trying to set a tone preference: %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __78__TLToneManager__setToneIdentifierUsingService_keyedByTopic_forPreferenceKey___block_invoke_547_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "tl_nonRedundantDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "Failed setting a tone preference: %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __44__TLToneManager__toneWithIdentifierIsValid___block_invoke_cold_1(uint64_t a1)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)a1 + 16), "count");
  objc_msgSend(*(id *)(*(_QWORD *)a1 + 16), "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x2Au);

}

void __44__TLToneManager__toneWithIdentifierIsValid___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_1D33D5000, v0, v1, "%{public}@: Tone with identifier '%{public}@' is neither in of the collections for system or iTunes tones.");
  OUTLINED_FUNCTION_7();
}

- (void)_removeToneWithSyncIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 138543618;
  v8 = (id)objc_opt_class();
  v9 = 2114;
  v10 = a2;
  v5 = v8;
  OUTLINED_FUNCTION_3(&dword_1D33D5000, a3, v6, "%{public}@: _removeToneWithSyncIdentifier:(%{public}@): Failed to delete tone.", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2();
}

+ (void)_migrateLegacyToneSettings
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D33D5000, log, OS_LOG_TYPE_ERROR, "*** Assertion failure.", buf, 2u);
}

- (void)setCurrentWatchToneIdentifier:(uint64_t)a1 forAlertType:(unint64_t)a2 topic:(NSObject *)a3 .cold.1(uint64_t a1, unint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  NSStringFromTLAlertType(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_3(&dword_1D33D5000, a3, v6, "%{public}@: -setCurrentWatchToneIdentifier…: Failed to update watch tone identifier for alert type %{public}@ because it is not settable.", (uint8_t *)&v7);

}

- (void)_setCurrentToneWatchAlertPolicy:(unint64_t)a1 forAlertType:topic:.cold.1(unint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromTLAlertType(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "Failed to update watch alert policy for alert type %{public}@ because it is not settable.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)_setCurrentOverridePolicy:(unint64_t)a1 forAlertType:.cold.1(unint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromTLAlertType(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "Failed to update alert override policy for alert type %{public}@ because it is not settable.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)_toneIdentifierWithUnderlyingPlaybackArchive:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D33D5000, v0, v1, "%{public}@: _toneIdentifierWithUnderlyingPlaybackArchive:(%{public}@): Failed to encode serialized playback archive as a base 64 string.");
  OUTLINED_FUNCTION_7();
}

- (void)_underlyingPlaybackArchiveForToneIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D33D5000, v0, v1, "%{public}@: _underlyingPlaybackArchiveForToneIdentifier:(%{public}@): Failed to decode base 64 encoded serialized playback archive.");
  OUTLINED_FUNCTION_7();
}

- (void)_underlyingPlaybackArchiveForToneIdentifier:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D33D5000, v0, v1, "%{public}@: _underlyingPlaybackArchiveForToneIdentifier:(%{public}@): Failed to deserialize the serialized playback archive.");
  OUTLINED_FUNCTION_7();
}

- (void)_ensureDirectoryExistsAtPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D33D5000, v0, v1, "Failed to create directory at path: %{public}@. %{public}@.");
  OUTLINED_FUNCTION_7();
}

uint64_t __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_3(v0);
}

void __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9();
  v3 = v0;
  _os_log_fault_impl(&dword_1D33D5000, v1, OS_LOG_TYPE_FAULT, "%{public}@: Invoked TCCAccessPreflight(kTCCServiceMediaLibrary, NULL). Got result: %{public}@.", v2, 0x16u);
  OUTLINED_FUNCTION_7();
}

@end
