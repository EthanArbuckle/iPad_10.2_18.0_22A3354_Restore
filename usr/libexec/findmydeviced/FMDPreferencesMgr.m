@implementation FMDPreferencesMgr

+ (BOOL)simulateWipe
{
  return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", off_1003054C0, kFMDPrefDomain);
}

+ (BOOL)simulateLocateNotification
{
  return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", off_1003054E8, kFMDPrefDomain);
}

+ (BOOL)locateNotificationsEnabled
{
  return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", off_1003054F0, kFMDPrefDomain);
}

+ (id)httpRequestHeaders
{
  return +[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", off_100305470, kFMDPrefDomain);
}

+ (BOOL)userTestApplication
{
  return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", off_100305478, kFMDPrefDomain);
}

+ (id)hostportOverride
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", off_100305480, kFMDPrefDomain);
}

+ (id)protocolSchemeOverride
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", off_100305488, kFMDPrefDomain);
}

+ (id)deviceInfoOverrides
{
  return +[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", off_100305490, kFMDPrefDomain);
}

+ (id)locationDeviceInfoOverrides
{
  return +[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", off_100305498, kFMDPrefDomain);
}

+ (id)overriddenOSVersion
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", off_1003054A0, kFMDPrefDomain);
}

+ (id)overriddenBuildVersion
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", off_1003054A8, kFMDPrefDomain);
}

+ (BOOL)overriddenTrackNotifyEnabled
{
  return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", off_1003054B8, kFMDPrefDomain);
}

+ (BOOL)dontUseSLC
{
  return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", off_1003054B0, kFMDPrefDomain);
}

+ (id)errorForUnregister
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", off_1003054C8, kFMDPrefDomain);
}

+ (id)errorForMarkAsMissing
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", off_1003054D0, kFMDPrefDomain);
}

+ (int64_t)wipeDelay
{
  return (int64_t)+[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", off_1003054D8, kFMDPrefDomain);
}

+ (BOOL)notifyOnShutdownSoon
{
  return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", off_1003054E0, kFMDPrefDomain);
}

+ (BOOL)disableIntents
{
  return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", off_100305500, kFMDNotBackedUpPrefDomain);
}

+ (BOOL)disablePush
{
  return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", off_100305508, kFMDNotBackedUpPrefDomain);
}

+ (BOOL)accessibilityFontSizeEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", off_100305548, off_100305540));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "rangeOfString:", CFSTR("Accessibility")) != (id)0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = 0;

  return v4;
}

+ (int64_t)wipeState
{
  return (int64_t)+[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", off_100305510, kFMDNotBackedUpPrefDomain);
}

+ (void)setWipeState:(int64_t)a3
{
  +[FMPreferencesUtil setInteger:forKey:inDomain:](FMPreferencesUtil, "setInteger:forKey:inDomain:", a3, off_100305510, kFMDNotBackedUpPrefDomain);
}

+ (id)wipeInfo
{
  return +[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", off_100305518, kFMDNotBackedUpPrefDomain);
}

+ (void)setWipeInfo:(id)a3
{
  +[FMPreferencesUtil setDictionary:forKey:inDomain:](FMPreferencesUtil, "setDictionary:forKey:inDomain:", a3, off_100305518, kFMDNotBackedUpPrefDomain);
}

+ (id)lostModeInfo
{
  return +[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", CFSTR("FMIPLostModeInfo"), kFMDPublicNotBackedUpPrefDomain);
}

+ (void)setLostModeInfo:(id)a3
{
  id v3;

  v3 = a3;
  _CFPreferencesSetDaemonCacheEnabled(kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost, 0, 0);
  +[FMPreferencesUtil setDictionary:forKey:inDomain:](FMPreferencesUtil, "setDictionary:forKey:inDomain:", v3, CFSTR("FMIPLostModeInfo"), kFMDPublicNotBackedUpPrefDomain);

  _CFPreferencesSetDaemonCacheEnabled(kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost, 0, 1);
}

+ (id)playSoundInfo
{
  return +[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", CFSTR("FMIPPlaySoundInfo"), kFMDNotBackedUpPrefDomain);
}

+ (void)setPlaySoundInfo:(id)a3
{
  +[FMPreferencesUtil setDictionary:forKey:inDomain:](FMPreferencesUtil, "setDictionary:forKey:inDomain:", a3, CFSTR("FMIPPlaySoundInfo"), kFMDNotBackedUpPrefDomain);
}

+ (id)trackingInfoForType:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), off_100305528, a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", v3, kFMDNotBackedUpPrefDomain));

  return v4;
}

+ (void)setTrackingInfo:(id)a3 forType:(id)a4
{
  __CFString *v5;
  id v6;
  id v7;

  v5 = off_100305528;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v5, a4));
  +[FMPreferencesUtil setDictionary:forKey:inDomain:](FMPreferencesUtil, "setDictionary:forKey:inDomain:", v6, v7, kFMDNotBackedUpPrefDomain);

}

+ (void)setFMIPWipeLostModeInfo:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v7;

  v3 = kFMDPostWipePrefDomain;
  v4 = a3;
  +[FMPreferencesUtil synchronizeDomain:](FMPreferencesUtil, "synchronizeDomain:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", CFSTR("FMIPWipeLostModeInfo"), kFMDPostWipePrefDomain));
  +[FMPreferencesUtil setDictionary:forKey:inDomain:](FMPreferencesUtil, "setDictionary:forKey:inDomain:", v4, CFSTR("FMIPWipeLostModeInfo"), kFMDPostWipePrefDomain);

  v5 = v7;
  if (!v4 && v7)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, kLostModeChangedNotification, 0, 0, 1u);
    v5 = v7;
  }

}

+ (void)setClientLostModeInfo:(id)a3
{
  +[FMPreferencesUtil setDictionary:forKey:inDomain:](FMPreferencesUtil, "setDictionary:forKey:inDomain:", a3, CFSTR("ClientLostModeInfo"), kFMDPublicNotBackedUpPrefDomain);
}

+ (id)pushAccountsData
{
  return +[FMPreferencesUtil arrayForKey:inDomain:](FMPreferencesUtil, "arrayForKey:inDomain:", off_100305520, kFMDNotBackedUpPrefDomain);
}

+ (void)setPushAccountsData:(id)a3
{
  +[FMPreferencesUtil setArray:forKey:inDomain:](FMPreferencesUtil, "setArray:forKey:inDomain:", a3, off_100305520, kFMDNotBackedUpPrefDomain);
}

+ (id)lastLaunchVersion
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", off_100305530, kFMDPrefDomain);
}

+ (void)setLastLaunchVersion:(id)a3
{
  +[FMPreferencesUtil setString:forKey:inDomain:](FMPreferencesUtil, "setString:forKey:inDomain:", a3, off_100305530, kFMDPrefDomain);
}

+ (BOOL)importedAosnotifydData
{
  return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", off_100305538, kFMDPrefDomain);
}

+ (void)setImportedAosnotifydData:(BOOL)a3
{
  +[FMPreferencesUtil setBool:forKey:inDomain:](FMPreferencesUtil, "setBool:forKey:inDomain:", a3, off_100305538, kFMDPrefDomain);
}

+ (BOOL)needsLostModeExitAuth
{
  return +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("needsLostModeExitAuth"), kFMDNotBackedUpPrefDomain);
}

+ (void)setNeedsLostModeExitAuth:(BOOL)a3
{
  +[FMPreferencesUtil setBool:forKey:inDomain:](FMPreferencesUtil, "setBool:forKey:inDomain:", a3, CFSTR("needsLostModeExitAuth"), kFMDNotBackedUpPrefDomain);
}

+ (id)lostModeExitAuthForPairedDeviceID
{
  return +[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", off_1003054F8, kFMDNotBackedUpPrefDomain);
}

+ (void)setLostModeExitAuthForPairedDeviceID:(id)a3
{
  +[FMPreferencesUtil setString:forKey:inDomain:](FMPreferencesUtil, "setString:forKey:inDomain:", a3, off_1003054F8, kFMDNotBackedUpPrefDomain);
}

+ (void)removeNeedsLostModeExitAuth
{
  +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", CFSTR("needsLostModeExitAuth"), kFMDNotBackedUpPrefDomain);
}

+ (void)cleanAccountKeys
{
  +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", off_100305520, kFMDNotBackedUpPrefDomain);
}

@end
