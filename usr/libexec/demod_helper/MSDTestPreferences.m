@implementation MSDTestPreferences

+ (id)sharedInstance
{
  if (qword_100053DE8 != -1)
    dispatch_once(&qword_100053DE8, &stru_100048DE8);
  return (id)qword_100053DE0;
}

- (BOOL)fakeActivationDemoBit
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FakeActivationDemoBit")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)demoUnitServerURL
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("DemoUnitServerURL")));
  if (v2 && (v3 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v2));
  else
    v4 = 0;

  return v4;
}

- (int64_t)findMyHubRetryDelay
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FMHRetryDelay")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (unsigned)rebootDelayForStaging
{
  void *v2;
  uint64_t v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("RebootDelayForStaging")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)timeShowingFatalError
{
  void *v2;
  uint64_t v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("TimeShowingFatalError")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)disableParallelProcessing
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("DisableParallelProcessing")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)pauseContentUpdateOnError
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("PauseContentUpdateOnError")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)bailOnStashedStagingRestoreFailure
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("BailOnStashedStagingRestoreFailure")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (int64_t)concurrentDownloadRequest
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ConcurrentDownloadRequest")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (int64_t)concurrentDownloadOperation
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ConcurrentDownloadOperation")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (int64_t)concurrentSession
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ConcurrentSession")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (double)cachingHubRetryInterval
{
  void *v2;
  double v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("CachingHubRetryInterval")));
  v3 = 0.0;
  if (v2)
  {
    v4 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0)
      v3 = (double)(uint64_t)objc_msgSend(v2, "integerValue");
  }

  return v3;
}

- (double)caLogsUploadInterval
{
  void *v2;
  double v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("CALogsUploadInterval")));
  v3 = 0.0;
  if (v2)
  {
    v4 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0)
      v3 = (double)(uint64_t)objc_msgSend(v2, "integerValue");
  }

  return v3;
}

- (double)appUsagePollingInterval
{
  void *v2;
  double v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("AppUsagePollingInterval")));
  v3 = 0.0;
  if (v2)
  {
    v4 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0)
      v3 = (double)(uint64_t)objc_msgSend(v2, "integerValue");
  }

  return v3;
}

- (unsigned)systemAppTimeoutInterval
{
  void *v2;
  uint64_t v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SystemAppTimeoutInterval")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)systemAppPollingInterval
{
  void *v2;
  uint64_t v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SystemAppPollingInterval")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (int64_t)deviceActivationFlag
{
  void *v2;
  uint64_t v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("DeviceActivationFlag")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = (int64_t)objc_msgSend(v2, "integerValue");
  else
    v4 = -1;

  return v4;
}

- (BOOL)mockForBetterTogetherDemo
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("MockForBetterTogetherDemo")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)mockAccountSettingsFile
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("MockAccountSettingsFile")));
  if (v2 && (v3 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)mockOSUpdateRequestFile
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("MockOSUpdateRequestFile")));
  if (v2 && (v3 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)screenSaverIdleDelay
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ScreenSaverIdleDelay")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)mockPeerProtocolVersion
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("MockPeerProtocolVersion")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)contentSyncTimeoutInterval
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ContentSyncTimeoutInterval")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (int64_t)storePickerUIMode
{
  void *v2;
  uint64_t v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("StorePickerUIMode")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = (int64_t)objc_msgSend(v2, "integerValue");
  else
    v4 = 2;

  return v4;
}

- (BOOL)skipMarkAsNotDemo
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SkipMarkAsNotDemo")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)enablePeerDemoService
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("EnablePeerDemoService")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)pressDemoXCTestProductsPath
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("PressDemoXCTestProductsPath")));
  if (v2 && (v3 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)pressDemoTestTarget
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("PressDemoTestTarget")));
  if (v2 && (v3 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)LSMeasurementsFilePath
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("LSMeasurementsFilePath")));
  if (v2 && (v3 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (BOOL)disassociateWiFiBeforeCheckIn
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("DisassociateWiFiBeforeCheckIn")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)skipVerifyHashBeforeStaging
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SkipVerifyHashBeforeStaging")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
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
    v4 = sub_100024A40();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10002D1FC(v5);

  }
  v6 = (void *)CFPreferencesCopyValue(v3, CFSTR("com.apple.MobileStoreDemo.test"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);

  return v6;
}

@end
