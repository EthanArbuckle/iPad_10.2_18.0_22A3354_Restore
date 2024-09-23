@implementation MSDTestPreferences

+ (id)sharedInstance
{
  if (qword_100175370 != -1)
    dispatch_once(&qword_100175370, &stru_10013EC90);
  return (id)qword_100175368;
}

- (BOOL)fakeActivationDemoBit
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FakeActivationDemoBit")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (id)demoUnitServerURL
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("DemoUnitServerURL")));
  if (v3 && (v4 = objc_opt_class(NSString, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  else
    v5 = 0;

  return v5;
}

- (int64_t)findMyHubRetryDelay
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FMHRetryDelay")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return (int64_t)v5;
}

- (unsigned)rebootDelayForStaging
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("RebootDelayForStaging")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "unsignedIntValue");
  else
    v5 = 0;

  return v5;
}

- (unsigned)timeShowingFatalError
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("TimeShowingFatalError")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "unsignedIntValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)disableParallelProcessing
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("DisableParallelProcessing")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)pauseContentUpdateOnError
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("PauseContentUpdateOnError")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)bailOnStashedStagingRestoreFailure
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("BailOnStashedStagingRestoreFailure")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (int64_t)concurrentDownloadRequest
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ConcurrentDownloadRequest")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return (int64_t)v5;
}

- (int64_t)concurrentDownloadOperation
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ConcurrentDownloadOperation")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return (int64_t)v5;
}

- (int64_t)concurrentSession
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ConcurrentSession")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return (int64_t)v5;
}

- (double)cachingHubRetryInterval
{
  uint64_t v2;
  void *v3;
  double v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("CachingHubRetryInterval")));
  v4 = 0.0;
  if (v3)
  {
    v5 = objc_opt_class(NSNumber, v2);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
      v4 = (double)(uint64_t)objc_msgSend(v3, "integerValue");
  }

  return v4;
}

- (double)caLogsUploadInterval
{
  uint64_t v2;
  void *v3;
  double v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("CALogsUploadInterval")));
  v4 = 0.0;
  if (v3)
  {
    v5 = objc_opt_class(NSNumber, v2);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
      v4 = (double)(uint64_t)objc_msgSend(v3, "integerValue");
  }

  return v4;
}

- (double)appUsagePollingInterval
{
  uint64_t v2;
  void *v3;
  double v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("AppUsagePollingInterval")));
  v4 = 0.0;
  if (v3)
  {
    v5 = objc_opt_class(NSNumber, v2);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
      v4 = (double)(uint64_t)objc_msgSend(v3, "integerValue");
  }

  return v4;
}

- (unsigned)systemAppTimeoutInterval
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SystemAppTimeoutInterval")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "unsignedIntValue");
  else
    v5 = 0;

  return v5;
}

- (unsigned)systemAppPollingInterval
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SystemAppPollingInterval")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "unsignedIntValue");
  else
    v5 = 0;

  return v5;
}

- (int64_t)deviceActivationFlag
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("DeviceActivationFlag")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = (int64_t)objc_msgSend(v3, "integerValue");
  else
    v5 = -1;

  return v5;
}

- (BOOL)mockForBetterTogetherDemo
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("MockForBetterTogetherDemo")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (id)mockAccountSettingsFile
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("MockAccountSettingsFile")));
  if (v3 && (v4 = objc_opt_class(NSString, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (id)mockOSUpdateRequestFile
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("MockOSUpdateRequestFile")));
  if (v3 && (v4 = objc_opt_class(NSString, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (id)screenSaverIdleDelay
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ScreenSaverIdleDelay")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (id)mockPeerProtocolVersion
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("MockPeerProtocolVersion")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (id)contentSyncTimeoutInterval
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ContentSyncTimeoutInterval")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (int64_t)storePickerUIMode
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("StorePickerUIMode")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = (int64_t)objc_msgSend(v3, "integerValue");
  else
    v5 = 2;

  return v5;
}

- (BOOL)skipMarkAsNotDemo
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SkipMarkAsNotDemo")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)enablePeerDemoService
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("EnablePeerDemoService")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (id)pressDemoXCTestProductsPath
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("PressDemoXCTestProductsPath")));
  if (v3 && (v4 = objc_opt_class(NSString, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (id)pressDemoTestTarget
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("PressDemoTestTarget")));
  if (v3 && (v4 = objc_opt_class(NSString, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (id)LSMeasurementsFilePath
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("LSMeasurementsFilePath")));
  if (v3 && (v4 = objc_opt_class(NSString, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (BOOL)disassociateWiFiBeforeCheckIn
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("DisassociateWiFiBeforeCheckIn")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)skipVerifyHashBeforeStaging
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SkipVerifyHashBeforeStaging")));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (id)getValueFromTestPreferencesForKey:(id)a3
{
  __CFString *v3;
  id v4;
  NSObject *v5;
  void *v6;

  v3 = (__CFString *)a3;
  if (!CFPreferencesSynchronize(CFSTR("com.apple.MobileStoreDemo.test"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost))
  {
    v4 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000C1230(v5);

  }
  v6 = (void *)CFPreferencesCopyValue(v3, CFSTR("com.apple.MobileStoreDemo.test"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);

  return v6;
}

@end
