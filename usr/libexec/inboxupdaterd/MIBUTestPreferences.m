@implementation MIBUTestPreferences

+ (id)sharedInstance
{
  if (qword_1000688C0 != -1)
    dispatch_once(&qword_1000688C0, &stru_100055DF0);
  return (id)qword_1000688B8;
}

- (BOOL)useLiveTatsu
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("UseLiveTatsu")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (id)fakeTatsuPayloadPath
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FakeTatsuPayloadPath")));
  if (v2 && (v3 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (BOOL)useAppleConnect
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("UseAppleConnect")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)nfcIdleTime
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("NFCIdleTime")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)isActivated
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("IsActivated")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (BOOL)factorySUCertExist
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FactorySUCertExist")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)inBoxUpdateMode
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("InBoxUpdateMode")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)initialBuddySetupComplete
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("InitialBuddySetupComplete")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)isOnLockScreen
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("IsOnLockScreen")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)factorySUCertPath
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FactorySUCertPath")));
  if (v2 && (v3 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)factorySUKeyPath
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FactorySUKeyPath")));
  if (v2 && (v3 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)factorySUKeyIsSEP
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("FactorySUKeyIsSEP")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)iseTrustCertPaths
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ISETrustCertPaths")));
  if (v2 && (v3 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)iseTrustCertName
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("ISETrustCertName")));
  if (v2 && (v3 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (id)wifiSSID
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("WiFiSSID")));
  if (v2 && (v3 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

- (BOOL)skipWiFiAssociation
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SkipWiFiAssociation")));
  if (v2 && (v3 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)skipDaemonDisable
{
  void *v2;
  uint64_t v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SkipDaemonDisable")));
  v4 = 0;
  if (v2)
  {
    v3 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
      v4 = 1;
  }

  return v4;
}

- (BOOL)skipCertDeletion
{
  void *v2;
  uint64_t v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUTestPreferences getValueFromTestPreferencesForKey:](self, "getValueFromTestPreferencesForKey:", CFSTR("SkipCertDeletion")));
  v4 = 0;
  if (v2)
  {
    v3 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
      v4 = 1;
  }

  return v4;
}

- (id)getValueFromTestPreferencesForKey:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;

  v4 = (__CFString *)a3;
  if (!CFPreferencesSynchronize(CFSTR("com.apple.MobileInBoxUpdater.test"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055E10);
    v5 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003BAC0(v5, (uint64_t)self);
  }
  v6 = (void *)CFPreferencesCopyValue(v4, CFSTR("com.apple.MobileInBoxUpdater.test"), kCFPreferencesAnyUser, kCFPreferencesCurrentHost);

  return v6;
}

@end
