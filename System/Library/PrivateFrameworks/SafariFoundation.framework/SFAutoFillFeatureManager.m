@implementation SFAutoFillFeatureManager

+ (SFAutoFillFeatureManager)sharedFeatureManager
{
  if (sharedFeatureManager_onceToken != -1)
    dispatch_once(&sharedFeatureManager_onceToken, &__block_literal_global_2);
  return (SFAutoFillFeatureManager *)(id)sharedFeatureManager_sharedObserver;
}

void __48__SFAutoFillFeatureManager_sharedFeatureManager__block_invoke()
{
  SFAutoFillFeatureManager *v0;
  void *v1;

  v0 = objc_alloc_init(SFAutoFillFeatureManager);
  v1 = (void *)sharedFeatureManager_sharedObserver;
  sharedFeatureManager_sharedObserver = (uint64_t)v0;

}

- (SFAutoFillFeatureManager)init
{
  SFAutoFillFeatureManager *v2;
  void *v3;
  void *v4;
  SFAutoFillFeatureManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFAutoFillFeatureManager;
  v2 = -[SFAutoFillFeatureManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "registerObserver:", v2);
    else
      objc_msgSend(v3, "addObserver:", v2);
    -[SFAutoFillFeatureManager _refreshCachedAutoFillRestrictionValues](v2, "_refreshCachedAutoFillRestrictionValues");
    -[SFAutoFillFeatureManager _refreshCachedIsPasswordManagerAppInstalled](v2, "_refreshCachedIsPasswordManagerAppInstalled");
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__refreshCachedIsPasswordManagerAppInstalled, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__refreshCachedIsPasswordManagerAppInstalled, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);
    v5 = v2;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "unregisterObserver:", self);
  else
    objc_msgSend(v3, "removeObserver:", self);
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SFAutoFillFeatureManager;
  -[SFAutoFillFeatureManager dealloc](&v5, sel_dealloc);
}

+ (id)_syncManager
{
  void *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = (void *)_syncManager_syncManager;
  if (!_syncManager_syncManager)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2050000000;
    v3 = (void *)getNPSManagerClass_softClass;
    v12 = getNPSManagerClass_softClass;
    if (!getNPSManagerClass_softClass)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __getNPSManagerClass_block_invoke;
      v8[3] = &unk_24C9356D8;
      v8[4] = &v9;
      __getNPSManagerClass_block_invoke((uint64_t)v8);
      v3 = (void *)v10[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v9, 8);
    v5 = objc_alloc_init(v4);
    v6 = (void *)_syncManager_syncManager;
    _syncManager_syncManager = (uint64_t)v5;

    v2 = (void *)_syncManager_syncManager;
  }
  return v2;
}

+ (void)autoFillPreferencesDidChange
{
  void *v3;
  id v4;

  CFPreferencesAppSynchronize((CFStringRef)objc_msgSend(a1, "autoFillPreferencesDomain"));
  objc_msgSend(a1, "_syncManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("AutoFillPasswords"), CFSTR("AutoFillFromAddressBook"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.WebUI"), v3);

}

- (BOOL)shouldAutoFillPasswordsFromKeychain
{
  BOOL v2;
  int v3;
  const __CFString *v4;
  int AppBooleanValue;
  Boolean keyExistsAndHasValidFormat;

  if (self->_shouldOverrideShouldAutoFillFromKeychain)
  {
    v2 = !self->_overrideShouldAutoFillFromKeychainValue;
  }
  else
  {
    if (!self->_cachedIsPasswordManagerAppInstalled || self->_cachedAutoFillRestrictionValue == 2)
    {
      LOBYTE(v3) = 0;
      return v3;
    }
    v3 = -[SFAutoFillFeatureManager shouldAutoFillPasswords](self, "shouldAutoFillPasswords");
    if (!v3)
      return v3;
    keyExistsAndHasValidFormat = 0;
    v4 = (const __CFString *)objc_msgSend((id)objc_opt_class(), "autoFillPreferencesDomain");
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AutoFillPasswords"), v4, &keyExistsAndHasValidFormat);
    if (!keyExistsAndHasValidFormat)
    {
      LOBYTE(v3) = objc_msgSend((id)objc_opt_class(), "defaultValueForPasswordAndCreditCardAutoFill");
      return v3;
    }
    v2 = AppBooleanValue == 0;
  }
  LOBYTE(v3) = !v2;
  return v3;
}

- (void)setShouldAutoFillPasswordsFromKeychain:(BOOL)a3
{
  CFPropertyListRef *v3;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("AutoFillPasswords"), *v3, +[SFAutoFillFeatureManager autoFillPreferencesDomain](SFAutoFillFeatureManager, "autoFillPreferencesDomain"));
  +[SFAutoFillFeatureManager autoFillPreferencesDidChange](SFAutoFillFeatureManager, "autoFillPreferencesDidChange");
}

- (BOOL)shouldAutoFillPasswords
{
  return self->_cachedPasswordAutoFillEffectiveValue != 2;
}

- (void)setShouldAutoFillPasswords:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoolValue:forSetting:", v3, *MEMORY[0x24BE63A60]);

  if (!v3)
  {
    +[SFCredentialProviderExtensionManager sharedManager](SFCredentialProviderExtensionManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v5, "extensionsSync", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v5, "setExtension:isEnabled:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), 0);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

+ (BOOL)defaultValueForPasswordAndCreditCardAutoFill
{
  if (isUsingEducationMode_onceToken != -1)
    dispatch_once(&isUsingEducationMode_onceToken, &__block_literal_global_120);
  return isUsingEducationMode_usingEducationMode
      || CFPreferencesGetAppBooleanValue(CFSTR("DefaultValueForPasswordAndCreditCardAutoFill"), +[SFAutoFillFeatureManager autoFillPreferencesDomain](SFAutoFillFeatureManager, "autoFillPreferencesDomain"), 0) != 0;
}

+ (__CFString)autoFillPreferencesDomain
{
  if (autoFillPreferencesDomain_onceToken != -1)
    dispatch_once(&autoFillPreferencesDomain_onceToken, &__block_literal_global_24);
  return (__CFString *)autoFillPreferencesDomain_sAutoFillPreferenceDomain;
}

uint64_t __53__SFAutoFillFeatureManager_autoFillPreferencesDomain__block_invoke()
{
  uint64_t result;

  result = CPCopySharedResourcesPreferencesDomainForDomain();
  autoFillPreferencesDomain_sAutoFillPreferenceDomain = result;
  return result;
}

- (void)_refreshCachedAutoFillRestrictionValues
{
  id v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_cachedAutoFillRestrictionValue = objc_msgSend(v3, "BOOLRestrictionForFeature:", *MEMORY[0x24BE63A90]);
  self->_cachedPasswordAutoFillEffectiveValue = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63A60]);

}

- (void)_refreshCachedIsPasswordManagerAppInstalled
{
  self->_cachedIsPasswordManagerAppInstalled = objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppInstalled");
}

- (BOOL)isAutoFillFromKeychainRestricted
{
  return self->_cachedAutoFillRestrictionValue == 2;
}

- (void)test_overrideShouldAutoFillFromKeychain:(BOOL)a3
{
  self->_shouldOverrideShouldAutoFillFromKeychain = 1;
  self->_overrideShouldAutoFillFromKeychainValue = a3;
}

@end
