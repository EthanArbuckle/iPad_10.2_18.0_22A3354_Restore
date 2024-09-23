@implementation ICDefaults

- (NSNumber)networkTypeOverride
{
  void *v2;
  void *v3;
  id v4;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ICDefaultsKeyNetworkTypeOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSNumber())
    v4 = v3;
  else
    v4 = 0;

  return (NSNumber *)v4;
}

- (NSNumber)networkLinkQualityOverride
{
  void *v2;
  void *v3;
  id v4;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ICDefaultsKeyNetworkLinkQualityOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSNumber())
    v4 = v3;
  else
    v4 = 0;

  return (NSNumber *)v4;
}

- (NSString)deviceModelOverride
{
  void *v3;
  void *v4;
  id v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ICDefaultsKeyDeviceModelOverride"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSString())
  {
    v5 = v4;
  }
  else
  {
    if (-[ICDefaults _shouldSpoofIPhoneRequestProperties](self, "_shouldSpoofIPhoneRequestProperties"))
    {
      v6 = CFSTR("iPhone");
      v7 = CFSTR("12,3");
    }
    else
    {
      if (!-[ICDefaults _shouldSpoofIPadRequestProperties](self, "_shouldSpoofIPadRequestProperties"))
      {
        v8 = 0;
        goto LABEL_9;
      }
      v6 = CFSTR("iPad");
      v7 = CFSTR("8,12");
    }
    -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;
LABEL_9:

  return (NSString *)v8;
}

- (NSString)productVersionOverride
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ICDefaultsKeyProductVersionOverride"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSString())
  {
    v5 = v4;
  }
  else
  {
    if (!-[ICDefaults _shouldSpoofIPhoneRequestProperties](self, "_shouldSpoofIPhoneRequestProperties")
      && !-[ICDefaults _shouldSpoofIPadRequestProperties](self, "_shouldSpoofIPadRequestProperties"))
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CFDA50], "productVersion");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_7:

  return (NSString *)v6;
}

+ (ICDefaults)standardDefaults
{
  if (standardDefaults_sOnceToken != -1)
    dispatch_once(&standardDefaults_sOnceToken, &__block_literal_global_24562);
  return (ICDefaults *)(id)standardDefaults_sSharedInstance;
}

- (BOOL)shouldBypassURLBagCache
{
  void *v2;
  char v3;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICInternalDefaultsKeyShouldBypassURLBagCache"));

  return v3;
}

- (NSString)productPlatformOverride
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ICDefaultsKeyProductPlatformOverride"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSString())
  {
    v5 = v4;
  }
  else
  {
    v5 = CFSTR("iOS");
    if (!-[ICDefaults _shouldSpoofIPhoneRequestProperties](self, "_shouldSpoofIPhoneRequestProperties")
      && !-[ICDefaults _shouldSpoofIPadRequestProperties](self, "_shouldSpoofIPadRequestProperties"))
    {
      v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (BOOL)_shouldSpoofIPadRequestProperties
{
  void *v3;
  void *v4;
  char v5;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("ICDefaultsKeySpoofIPad"));

  return v5;
}

- (BOOL)_shouldSpoofIPhoneRequestProperties
{
  void *v3;
  void *v4;
  char v5;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("ICDefaultsKeySpoofIPhone"));

  return v5;
}

- (NSUserDefaults)internalDefaults
{
  return self->_internalDefaults;
}

- (BOOL)isPrivacyAcknowledgementDisabledForMusic
{
  void *v2;
  char v3;

  -[ICDefaults _musicUserDefaults](self, "_musicUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("suppressPrivacyWelcomeScreen"));

  return v3;
}

- (id)_musicUserDefaults
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  int v6;
  NSUserDefaults *v7;
  NSUserDefaults *musicUserDefaults;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_musicUserDefaults)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Music"));

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v7 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Music"));
    }
    musicUserDefaults = self->_musicUserDefaults;
    self->_musicUserDefaults = v7;

  }
  os_unfair_lock_unlock(p_lock);
  return self->_musicUserDefaults;
}

void __30__ICDefaults_standardDefaults__block_invoke()
{
  ICDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(ICDefaults);
  v1 = (void *)standardDefaults_sSharedInstance;
  standardDefaults_sSharedInstance = (uint64_t)v0;

}

- (ICDefaults)init
{
  ICDefaults *v2;
  ICDefaults *v3;
  uint64_t v4;
  NSUserDefaults *userDefaults;
  void *v6;
  int v7;
  uint64_t v8;
  NSUserDefaults *internalDefaults;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICDefaults;
  v2 = -[ICDefaults init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.itunescloud"));
    userDefaults = v3->_userDefaults;
    v3->_userDefaults = (NSUserDefaults *)v4;

    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isInternalBuild");

    if (v7)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.itunescloud.internal"));
      internalDefaults = v3->_internalDefaults;
      v3->_internalDefaults = (NSUserDefaults *)v8;

    }
    -[NSUserDefaults removeObjectForKey:](v3->_userDefaults, "removeObjectForKey:", CFSTR("ICDefaultsCachedSubscriptionStatusIsValid"));
  }
  return v3;
}

- (BOOL)isLegacyStoreCacheBusterEnabled
{
  void *v2;
  int v3;

  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalBuild");

  return v3 && CFPreferencesGetAppBooleanValue(CFSTR("ISCacheBuster"), CFSTR("com.apple.itunesstored"), 0) != 0;
}

- (NSString)hardwarePlatformOverride
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ICDefaultsKeyHardwarePlatformOverride"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSString())
  {
    v5 = v4;
  }
  else if (-[ICDefaults _shouldSpoofIPhoneRequestProperties](self, "_shouldSpoofIPhoneRequestProperties"))
  {
    v5 = CFSTR("t8030");
  }
  else if (-[ICDefaults _shouldSpoofIPadRequestProperties](self, "_shouldSpoofIPadRequestProperties"))
  {
    v5 = CFSTR("t8027");
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSNumber)fairPlayDeviceTypeOverride
{
  void *v2;
  void *v3;
  id v4;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ICDefaultsKeyFairPlayDeviceTypeOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSNumber())
    v4 = v3;
  else
    v4 = 0;

  return (NSNumber *)v4;
}

- (NSNumber)deviceClassOverride
{
  void *v3;
  void *v4;
  id v5;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ICDefaultsKeyDeviceClassOverride"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSNumber())
  {
    v5 = v4;
  }
  else if (-[ICDefaults _shouldSpoofIPhoneRequestProperties](self, "_shouldSpoofIPhoneRequestProperties"))
  {
    v5 = &unk_1E43E67D8;
  }
  else if (-[ICDefaults _shouldSpoofIPadRequestProperties](self, "_shouldSpoofIPadRequestProperties"))
  {
    v5 = &unk_1E43E67F0;
  }
  else
  {
    v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSString)cloudMediaLibraryUID
{
  return -[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("ICDefaultsCloudMediaLibraryUID"));
}

- (NSDictionary)lastKnownLocalStoreAccountProperties
{
  void *v2;
  id v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsKeyLastKnownLocalStoreAccountProperties"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = v2;
  else
    v3 = 0;

  return (NSDictionary *)v3;
}

- (NSNumber)chargingStateOverride
{
  void *v2;
  void *v3;
  id v4;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ICDefaultsKeyChargingStateOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSNumber())
    v4 = v3;
  else
    v4 = 0;

  return (NSNumber *)v4;
}

- (NSNumber)batteryLevelOverride
{
  void *v2;
  void *v3;
  id v4;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ICDefaultsKeyBatteryLevelOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSNumber())
    v4 = v3;
  else
    v4 = 0;

  return (NSNumber *)v4;
}

- (NSNumber)requestTimeoutOverride
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICDefaults internalDefaults](self, "internalDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("ICInternalDefaultsKeyRequestTimeoutOverrideValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  if (_NSIsNSNumber())
    v6 = v5;
  else
    v6 = 0;

  return (NSNumber *)v6;
}

- (BOOL)enableMultipathTCP
{
  void *v2;
  char v3;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICEnableMultipathTCP"));

  return v3;
}

- (BOOL)ignoreExtendedCertificateValidation
{
  return CFPreferencesGetAppBooleanValue(CFSTR("ISIgnoreExtendedValidation"), CFSTR("com.apple.itunesstored"), 0) != 0;
}

- (NSString)lastKnownHouseholdID
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsKeyLastKnownHouseholdID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setLastKnownUserAgeVerificationState:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsKeyLastKnownUserAgeVerificationState"));
}

- (NSDictionary)lastKnownUserAgeVerificationState
{
  return (NSDictionary *)-[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsKeyLastKnownUserAgeVerificationState"));
}

- (void)_setOrRemoveObject:(id)a3 forKey:(id)a4
{
  NSUserDefaults *userDefaults;

  userDefaults = self->_userDefaults;
  if (a3)
    -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", a3, a4);
  else
    -[NSUserDefaults removeObjectForKey:](userDefaults, "removeObjectForKey:", a4);
}

- (NSDictionary)accountNotificationsShowInLibraryDictionary
{
  void *v2;
  id v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsKeyAccountNotificationsShowInLibrarySwitch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = v2;
  else
    v3 = 0;

  return (NSDictionary *)v3;
}

- (void)clearShouldForceServerToUseDAAPDebugFeatures
{
  void *v3;
  id v4;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("ICInternalDefaultsKeyForceResetSyncRequiredResponseFromCloudLibrary"));

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("ICInternalDefaultsKeyForceBackoffResponseFromCloudLibrary"));

}

- (void)setCloudMediaLibraryUID:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsCloudMediaLibraryUID"));
}

- (NSString)defaultStoreFront
{
  void *v2;
  void *v3;
  void *v4;

  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localStoreAccountProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storefrontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSDictionary)cachedSubscriptionStatus
{
  void *v2;
  void *v3;
  NSDictionary *v4;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsCachedSubscriptionStatus"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setCachedSubscriptionStatus:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsCachedSubscriptionStatus"));
}

- (NSDictionary)cachedMusicUserTokens
{
  void *v2;
  void *v3;
  NSDictionary *v4;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsCachedMusicUserTokens"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setCachedMusicUserTokens:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsCachedMusicUserTokens"));
}

- (NSDictionary)pushNotificationState
{
  void *v2;
  void *v3;
  NSDictionary *v4;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsRegisteredPushNotificationState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setPushNotificationState:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsRegisteredPushNotificationState"));
}

- (NSDictionary)mediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__24535;
  v11 = __Block_byref_object_dispose__24536;
  v12 = 0;
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsKeyMediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    v3 = v2;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__ICDefaults_mediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates__block_invoke;
    v6[3] = &unk_1E438DEA8;
    v6[4] = &v7;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
  v4 = (void *)objc_msgSend((id)v8[5], "copy");

  _Block_object_dispose(&v7, 8);
  return (NSDictionary *)v4;
}

- (void)setMediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsKeyMediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates"));
}

- (NSNumber)lastActiveAccountDSID
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsKeyLastActiveAccountDSID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setLastActiveAccountDSID:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsKeyLastActiveAccountDSID"));
}

- (NSDictionary)lastCookieHeadersForRevokingMusicUserTokens
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__24535;
  v11 = __Block_byref_object_dispose__24536;
  v12 = 0;
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsKeyLastCookieHeadersForRevokingMusicUserTokens"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    v3 = v2;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__ICDefaults_lastCookieHeadersForRevokingMusicUserTokens__block_invoke;
    v6[3] = &unk_1E438DEA8;
    v6[4] = &v7;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
  v4 = (void *)objc_msgSend((id)v8[5], "copy");

  _Block_object_dispose(&v7, 8);
  return (NSDictionary *)v4;
}

- (void)setLastCookieHeadersForRevokingMusicUserTokens:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsKeyLastCookieHeadersForRevokingMusicUserTokens"));
}

- (NSDate)lastAllowedInteractiveAuthenticationTime
{
  void *v2;
  id v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsKeyLastAllowedInteractiveAuthenticationTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDate())
    v3 = v2;
  else
    v3 = 0;

  return (NSDate *)v3;
}

- (void)setLastAllowedInteractiveAuthenticationTime:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsKeyLastAllowedInteractiveAuthenticationTime"));
}

- (NSNumber)authServiceClientTokenTimeToLive
{
  void *v2;
  id v3;

  -[NSUserDefaults objectForKey:](self->_internalDefaults, "objectForKey:", CFSTR("ICDefaultsKeyAuthServiceClientTokenTimeToLive"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isNSNumber"))
    v3 = v2;
  else
    v3 = 0;

  return (NSNumber *)v3;
}

- (NSDictionary)authServiceClientTokenCache
{
  void *v2;
  id v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsKeyAuthServiceClientTokenCache"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = v2;
  else
    v3 = 0;

  return (NSDictionary *)v3;
}

- (void)setAuthServiceClientTokenCache:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsKeyAuthServiceClientTokenCache"));
}

- (double)lastAuthenticationDialogResponseTime
{
  void *v2;
  double v3;
  double v4;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsKeyLastAuthenticationDialogResponseTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if (_NSIsNSNumber())
  {
    objc_msgSend(v2, "doubleValue");
    v3 = v4;
  }

  return v3;
}

- (void)setLastAuthenticationDialogResponseTime:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", v4, CFSTR("ICDefaultsKeyLastAuthenticationDialogResponseTime"));

}

- (void)setLastKnownLocalStoreAccountProperties:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsKeyLastKnownLocalStoreAccountProperties"));
}

- (NSDictionary)lastKnownSubscriptionStatusBaseCacheKey
{
  void *v2;
  id v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsKeyLastKnownSubscriptionStatusBaseCacheKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = v2;
  else
    v3 = 0;

  return (NSDictionary *)v3;
}

- (void)setLastKnownSubscriptionStatusBaseCacheKey:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsKeyLastKnownSubscriptionStatusBaseCacheKey"));
}

- (void)setAccountNotificationsShowInLibraryDictionary:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsKeyAccountNotificationsShowInLibrarySwitch"));
}

- (void)setAccountNotificationsNewMusicDictionary:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsKeyAccountNotificationsNewMusicSwitch"));
}

- (NSDictionary)accountNotificationsNewMusicDictionary
{
  void *v2;
  id v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ICDefaultsKeyAccountNotificationsNewMusicSwitch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = v2;
  else
    v3 = 0;

  return (NSDictionary *)v3;
}

- (void)setLastKnownHouseholdID:(id)a3
{
  -[ICDefaults _setOrRemoveObject:forKey:](self, "_setOrRemoveObject:forKey:", a3, CFSTR("ICDefaultsKeyLastKnownHouseholdID"));
}

- (BOOL)shouldForceStreamingOnlyKeysForPlayback
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("ICDefaultsKeyShouldForceStreamingOnlyKeysForPlayback"));
}

- (void)setShouldForceStreamingOnlyKeysForPlayback:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", a3, CFSTR("ICDefaultsKeyShouldForceStreamingOnlyKeysForPlayback"));
}

- (BOOL)cachedU18MinorAccountStatus
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("ICDefaultsKeyCachedU18MinorAccountStatus"));
}

- (void)setCachedU18MinorAccountStatus:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", a3, CFSTR("ICDefaultsKeyCachedU18MinorAccountStatus"));
}

- (void)setIgnoreExtendedCertificateValidation:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("ISIgnoreExtendedValidation"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.itunesstored"));
}

- (BOOL)bypassBagSanityChecks
{
  void *v3;
  void *v4;
  char v5;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("ICDefaultsKeyBypassBagSanityChecks"));

  return v5;
}

- (void)setDeviceClassOverride:(id)a3
{
  -[ICDefaults _setOrRemoveInternalDefaultsObject:forKey:](self, "_setOrRemoveInternalDefaultsObject:forKey:", a3, CFSTR("ICDefaultsKeyDeviceClassOverride"));
}

- (void)setDeviceModelOverride:(id)a3
{
  -[ICDefaults _setOrRemoveInternalDefaultsObject:forKey:](self, "_setOrRemoveInternalDefaultsObject:forKey:", a3, CFSTR("ICDefaultsKeyDeviceModelOverride"));
}

- (void)setFairPlayDeviceTypeOverride:(id)a3
{
  -[ICDefaults _setOrRemoveInternalDefaultsObject:forKey:](self, "_setOrRemoveInternalDefaultsObject:forKey:", a3, CFSTR("ICDefaultsKeyFairPlayDeviceTypeOverride"));
}

- (void)setHardwarePlatformOverride:(id)a3
{
  -[ICDefaults _setOrRemoveInternalDefaultsObject:forKey:](self, "_setOrRemoveInternalDefaultsObject:forKey:", a3, CFSTR("ICDefaultsKeyHardwarePlatformOverride"));
}

- (void)setProductVersionOverride:(id)a3
{
  -[ICDefaults _setOrRemoveInternalDefaultsObject:forKey:](self, "_setOrRemoveInternalDefaultsObject:forKey:", a3, CFSTR("ICDefaultsKeyProductVersionOverride"));
}

- (void)setProductPlatformOverride:(id)a3
{
  -[ICDefaults _setOrRemoveInternalDefaultsObject:forKey:](self, "_setOrRemoveInternalDefaultsObject:forKey:", a3, CFSTR("ICDefaultsKeyProductPlatformOverride"));
}

- (void)setNetworkTypeOverride:(id)a3
{
  -[ICDefaults _setOrRemoveInternalDefaultsObject:forKey:](self, "_setOrRemoveInternalDefaultsObject:forKey:", a3, CFSTR("ICDefaultsKeyNetworkTypeOverride"));
}

- (void)setNetworkLinkQualityOverride:(id)a3
{
  -[NSUserDefaults setObject:forKey:](self->_internalDefaults, "setObject:forKey:", a3, CFSTR("ICDefaultsKeyNetworkLinkQualityOverride"));
}

- (void)setChargingStateOverride:(id)a3
{
  -[ICDefaults _setOrRemoveInternalDefaultsObject:forKey:](self, "_setOrRemoveInternalDefaultsObject:forKey:", a3, CFSTR("ICDefaultsKeyChargingStateOverride"));
}

- (void)setBatteryLevelOverride:(id)a3
{
  -[ICDefaults _setOrRemoveInternalDefaultsObject:forKey:](self, "_setOrRemoveInternalDefaultsObject:forKey:", a3, CFSTR("ICDefaultsKeyBatteryLevelOverride"));
}

- (BOOL)shouldForceiPhoneBehaviors
{
  return -[ICDefaults _shouldSpoofIPhoneRequestProperties](self, "_shouldSpoofIPhoneRequestProperties")
      || -[ICDefaults _shouldSpoofIPadRequestProperties](self, "_shouldSpoofIPadRequestProperties");
}

- (BOOL)shouldRunAgeVerification
{
  void *v3;
  void *v4;
  char v5;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("ICDefaultsKeyShouldRunAgeVerification"));

  return v5;
}

- (void)setShouldRunAgeVerification:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("ICDefaultsKeyShouldRunAgeVerification"));

}

- (NSDate)ageVerificationExpirationDate
{
  id v3;
  void *v4;
  void *v5;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICDefaults internalDefaults](self, "internalDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("ICDefaultsKeyAgeVerificationExpirationDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSDate())
      v3 = v5;
    else
      v3 = 0;

  }
  return (NSDate *)v3;
}

- (void)setAgeVerificationExpirationDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("ICDefaultsKeyAgeVerificationExpirationDate"));
  else
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("ICDefaultsKeyAgeVerificationExpirationDate"));

}

- (BOOL)isExplicitContentAllowedForCurrentYear
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 1;
  v4 = (void *)v3;
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("ICDefaultsKeyExplicitContentAllowedForCurrentYear"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 1;
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("ICDefaultsKeyExplicitContentAllowedForCurrentYear"));

  return v8;
}

- (void)setExplicitContentAllowedForCurrentYear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("ICDefaultsKeyExplicitContentAllowedForCurrentYear"));

}

- (BOOL)isExplicitContentAllowedForExpirationYear
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 1;
  v4 = (void *)v3;
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("ICDefaultsKeyExplicitContentAllowedForExpirationYear"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 1;
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("ICDefaultsKeyExplicitContentAllowedForExpirationYear"));

  return v8;
}

- (void)setExplicitContentAllowedForExpirationYear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("ICDefaultsKeyExplicitContentAllowedForExpirationYear"));

}

- (BOOL)isGrazingPathEnabled
{
  void *v3;

  -[NSUserDefaults valueForKey:](self->_userDefaults, "valueForKey:", CFSTR("ICDefaultsKeyGrazingPathEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3
      || -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("ICDefaultsKeyGrazingPathEnabled"));
}

- (void)setGrazingPathEnabled:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", a3, CFSTR("ICDefaultsKeyGrazingPathEnabled"));
}

- (BOOL)shouldForcePrivacyAcknowledgementRequiredForMusic
{
  void *v3;
  void *v4;
  char v5;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("ICInternalDefaultsKeyShouldForcePrivacyAcknowledgementRequiredForMusic"));

  return v5;
}

- (void)setShouldForcePrivacyAcknowledgementRequiredForMusic:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("ICInternalDefaultsKeyShouldForcePrivacyAcknowledgementRequiredForMusic"));

}

- (BOOL)shouldForceLibraryRecommendationAnalysis
{
  void *v2;
  char v3;

  -[ICDefaults _musicUserDefaults](self, "_musicUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("forceLibraryRecommendations"));

  return v3;
}

- (BOOL)shouldReduceLibraryRecommendationsXPCInterval
{
  void *v2;
  char v3;

  -[ICDefaults _musicUserDefaults](self, "_musicUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("reduceLibraryRecommendationsXPCInterval"));

  return v3;
}

- (BOOL)shouldTreatSubscriptionStatusAsExpired
{
  void *v2;
  char v3;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICInternalDefaultsKeyTreatSubscriptionStatusAsExpired"));

  return v3;
}

- (BOOL)shouldTreatSubscriptionStatusCheckAsIncomplete
{
  void *v2;
  char v3;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICInternalDefaultsKeyTreatSubscriptionStatusAsIncomplete"));

  return v3;
}

- (BOOL)shouldTreatFavoritingEntityRequestAsFailed
{
  void *v2;
  char v3;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICInternalDefaultsKeyTreatFavoriteEntityRequestAsFailed"));

  return v3;
}

- (BOOL)shouldForceServerToUseDAAPDebugFeature
{
  void *v3;
  char v4;
  void *v5;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("ICInternalDefaultsKeyForceResetSyncRequiredResponseFromCloudLibrary")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[ICDefaults internalDefaults](self, "internalDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "BOOLForKey:", CFSTR("ICInternalDefaultsKeyForceBackoffResponseFromCloudLibrary"));

  }
  return v4;
}

- (BOOL)shouldForceServerToUseDAAPDebugFeatureAlwaysPerformResetSync
{
  void *v2;
  char v3;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICInternalDefaultsKeyForceResetSyncRequiredResponseFromCloudLibrary"));

  return v3;
}

- (BOOL)shouldForceServerToUseDAAPDebugFeatureAlwaysBackoff
{
  void *v2;
  char v3;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICInternalDefaultsKeyForceBackoffResponseFromCloudLibrary"));

  return v3;
}

- (BOOL)shouldTreatSagaAddComputerCallAsFailed
{
  void *v2;
  char v3;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICInternalDefaultsKeyTreatSagaAddComputerCallAsFailed"));

  return v3;
}

- (BOOL)shouldTreatInitialSagaImportAsFailed
{
  void *v2;
  char v3;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICInternalDefaultsKeyTreatInitialSagaImportAsFailed"));

  return v3;
}

- (BOOL)automaticDownloadsEnabled
{
  void *v2;
  char v3;

  -[ICDefaults _musicUserDefaults](self, "_musicUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DownloadOnAddToLibrary"));

  return v3;
}

- (void)setAutomaticDownloadsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[ICDefaults _musicUserDefaults](self, "_musicUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("DownloadOnAddToLibrary"));

  -[ICDefaults synchronize](self, "synchronize");
}

- (void)deleteAutomaticDownloadsKey
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICDefaults _musicUserDefaults](self, "_musicUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("DownloadOnAddToLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICDefaults _musicUserDefaults](self, "_musicUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("DownloadOnAddToLibrary"));

    -[ICDefaults _musicUserDefaults](self, "_musicUserDefaults");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronize");

  }
}

- (BOOL)allowLowAffinityRecommendations
{
  void *v2;
  char v3;

  -[ICDefaults _musicUserDefaults](self, "_musicUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("allowLowAffinityRecommendations"));

  return v3;
}

- (NSNumber)secureKeyRenewalTimeOverride
{
  void *v2;
  void *v3;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ICInternalDefaultsKeySecureKeyRenewalTimeOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)synchronize
{
  id v3;

  -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
  -[ICDefaults internalDefaults](self, "internalDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronize");

}

- (NSNumber)cachedSharedControlsCapability
{
  return (NSNumber *)-[NSUserDefaults valueForKey:](self->_userDefaults, "valueForKey:", CFSTR("ICDefaultsKeySharedControlsCapability"));
}

- (void)setCachedSharedControlsCapability:(id)a3
{
  -[NSUserDefaults setValue:forKey:](self->_userDefaults, "setValue:forKey:", a3, CFSTR("ICDefaultsKeySharedControlsCapability"));
}

- (BOOL)socialProfileSupported
{
  void *v2;
  void *v3;
  char v4;

  -[NSUserDefaults valueForKey:](self->_userDefaults, "valueForKey:", CFSTR("ICDefaultsKeySocialProfileSupported"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setSocialProfileSupported:(BOOL)a3
{
  NSUserDefaults *userDefaults;
  id v4;

  userDefaults = self->_userDefaults;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setValue:forKey:](userDefaults, "setValue:forKey:", v4, CFSTR("ICDefaultsKeySocialProfileSupported"));

}

- (NSArray)prefetchKeyIdentifiers
{
  return (NSArray *)-[NSUserDefaults valueForKey:](self->_userDefaults, "valueForKey:", CFSTR("ICDefaultsKeyPrefetchKeyIdentifiers"));
}

- (void)setPrefetchKeyIdentifiers:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (_NSIsNSArray())
    v4 = v5;
  else
    v4 = 0;
  -[NSUserDefaults setValue:forKey:](self->_userDefaults, "setValue:forKey:", v4, CFSTR("ICDefaultsKeyPrefetchKeyIdentifiers"));

}

- (BOOL)shouldForceWatchInitialSyncCompletion
{
  void *v2;
  char v3;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICInternalDefaultsKeyForceWatchInitialSyncCompletion"));

  return v3;
}

- (BOOL)shouldForceSilentAuthentications
{
  void *v2;
  char v3;

  -[ICDefaults internalDefaults](self, "internalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ICDefaultsKeyForceSilentAuthentications"));

  return v3;
}

- (void)_setOrRemoveInternalDefaultsObject:(id)a3 forKey:(id)a4
{
  NSUserDefaults *internalDefaults;

  internalDefaults = self->_internalDefaults;
  if (a3)
    -[NSUserDefaults setObject:forKey:](internalDefaults, "setObject:forKey:", a3, a4);
  else
    -[NSUserDefaults removeObjectForKey:](internalDefaults, "removeObjectForKey:", a4);
}

- (ICAuthServiceClientTokenProviderDebugConfiguration)debugFetchConfiguration
{
  void *v2;
  void *v3;
  uint64_t v5;

  -[NSUserDefaults objectForKey:](self->_internalDefaults, "objectForKey:", CFSTR("ICDefaultsKeyDebugFetchConfiguration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICAuthServiceClientTokenProviderDebugConfiguration *)v3;
}

- (ICAuthServiceClientTokenProviderDebugConfiguration)debugRefreshConfiguration
{
  void *v2;
  void *v3;
  uint64_t v5;

  -[NSUserDefaults objectForKey:](self->_internalDefaults, "objectForKey:", CFSTR("ICDefaultsKeyDebugRefreshConfiguration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICAuthServiceClientTokenProviderDebugConfiguration *)v3;
}

- (BOOL)presetsFound
{
  ICDefaults *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = self;
  -[NSUserDefaults objectForKey:](self->_internalDefaults, "objectForKey:", CFSTR("ICDefaultsKeyDebugFetchConfiguration"));
  v3 = objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults objectForKey:](v2->_internalDefaults, "objectForKey:", CFSTR("ICDefaultsKeyDebugRefreshConfiguration"));
  v4 = objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = (v3 | v4) != 0;

  return (char)v2;
}

- (void)addDebugConfiguration:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  char v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB36F8];
  v9 = 0;
  v5 = a3;
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  objc_msgSend(v5, "commandOption");
  -[NSUserDefaults setObject:forKey:](self->_internalDefaults, "setObject:forKey:", v6, CFSTR("ICDefaultsKeyDebugFetchConfiguration"));
  v8 = objc_msgSend(v5, "commandOption");

  if ((v8 & 2) != 0)
    -[NSUserDefaults setObject:forKey:](self->_internalDefaults, "setObject:forKey:", v6, CFSTR("ICDefaultsKeyDebugRefreshConfiguration"));
  -[NSUserDefaults synchronize](self->_internalDefaults, "synchronize");

}

- (void)clearAllPresets
{
  -[NSUserDefaults removeObjectForKey:](self->_internalDefaults, "removeObjectForKey:", CFSTR("ICDefaultsKeyDebugFetchConfiguration"));
  -[NSUserDefaults removeObjectForKey:](self->_internalDefaults, "removeObjectForKey:", CFSTR("ICDefaultsKeyDebugRefreshConfiguration"));
  -[NSUserDefaults synchronize](self->_internalDefaults, "synchronize");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDefaults, 0);
  objc_storeStrong((id *)&self->_musicUserDefaults, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

void __57__ICDefaults_lastCookieHeadersForRevokingMusicUserTokens__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (_NSIsNSString() && _NSIsNSString())
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKey:", v5, v9);

}

void __76__ICDefaults_mediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (_NSIsNSString() && _NSIsNSDate())
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v6, "setObject:forKey:", v5, v10);
  }

}

@end
