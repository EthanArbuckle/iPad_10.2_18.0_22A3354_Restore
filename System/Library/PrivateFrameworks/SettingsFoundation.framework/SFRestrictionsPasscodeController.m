@implementation SFRestrictionsPasscodeController

+ (BOOL)legacyRestrictionsInEffect
{
  void *v2;
  BOOL v3;

  if (SpringBoardPreferenceDomain_once != -1)
    dispatch_once(&SpringBoardPreferenceDomain_once, &__block_literal_global_62_0);
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsPIN"), (CFStringRef)SpringBoardPreferenceDomain_springBoardDomain);
  if (v2)
    v3 = 1;
  else
    v3 = +[SFRestrictionsPasscodeController hasHashAndSaltLegacyPassword](SFRestrictionsPasscodeController, "hasHashAndSaltLegacyPassword");

  return v3;
}

+ (void)migrateRestrictionsPasscode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_20AC93000, v0, v1, "Migrating Restrictions passcode from springboard file.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (BOOL)hasHashAndSaltLegacyPassword
{
  void *v2;
  BOOL v3;

  +[SFRestrictionsPasscodeController hashForHashAndSaltLegacyRestrictions](SFRestrictionsPasscodeController, "hashForHashAndSaltLegacyRestrictions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)hashForHashAndSaltLegacyRestrictions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.restrictionspassword"));
  objc_msgSend(v2, "dataForKey:", CFSTR("RestrictionsPasswordKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)settingEnabled
{
  void *v2;
  BOOL v3;
  void *v4;

  +[SFRestrictionsPasscodeController _migrateRestrictionsPasscodeIfNeeded](SFRestrictionsPasscodeController, "_migrateRestrictionsPasscodeIfNeeded");
  getSTManagementState();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v2, "isRestrictionsPasscodeSet") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    +[SFRestrictionsPasscodeController _keychainPasswordForRestrictions](SFRestrictionsPasscodeController, "_keychainPasswordForRestrictions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v3 = 1;
    else
      v3 = +[SFRestrictionsPasscodeController legacyRestrictionsInEffect](SFRestrictionsPasscodeController, "legacyRestrictionsInEffect");

  }
  return v3;
}

+ (id)_keychainPasswordForRestrictions
{
  __CFDictionary *Mutable;
  OSStatus v3;
  void *v4;
  void *v5;
  BOOL v6;
  CFTypeRef result;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], CFSTR("user"));
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9128], CFSTR("ParentalControls"));
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE94C8], (const void *)*MEMORY[0x24BDBD270]);
  result = 0;
  v3 = SecItemCopyMatching(Mutable, &result);
  v4 = 0;
  v5 = (void *)result;
  if (v3)
    v6 = 1;
  else
    v6 = result == 0;
  if (!v6)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", result, 4);
  CFRelease(Mutable);

  return v4;
}

+ (void)_migrateRestrictionsPasscodeIfNeeded
{
  if (_migrateRestrictionsPasscodeIfNeeded_onceToken != -1)
    dispatch_once(&_migrateRestrictionsPasscodeIfNeeded_onceToken, &__block_literal_global_5);
}

uint64_t __72__SFRestrictionsPasscodeController__migrateRestrictionsPasscodeIfNeeded__block_invoke()
{
  +[SFRestrictionsPasscodeController migrateRestrictionsPasscode](SFRestrictionsPasscodeController, "migrateRestrictionsPasscode");
  return +[SFRestrictionsPasscodeController validateKeychainWithScreenTime](SFRestrictionsPasscodeController, "validateKeychainWithScreenTime");
}

+ (void)validateKeychainWithScreenTime
{
  void *v2;
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  _QWORD v6[4];
  dispatch_semaphore_t v7;

  objc_msgSend(a1, "_keychainPasswordForRestrictions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    getSTManagementState();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = dispatch_semaphore_create(0);
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke;
      v6[3] = &unk_24C397DD0;
      v7 = v4;
      v5 = v4;
      objc_msgSend(v3, "authenticateRestrictionsPasscode:completionHandler:", v2, v6);
      dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

    }
  }

}

intptr_t __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    SFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke_cold_2();
  }
  else
  {
    +[SFRestrictionsPasscodeController _removeKeychainPasswordForRestrictions](SFRestrictionsPasscodeController, "_removeKeychainPasswordForRestrictions");
    SFLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke_cold_1();
  }

  AnalyticsSendEventLazy();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke_16()
{
  const __CFString *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  v1 = CFSTR("KeychainMigration");
  v2[0] = &unk_24C39B0E8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke_21()
{
  const __CFString *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  v1 = CFSTR("KeychainMigration");
  v2[0] = &unk_24C39B100;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)setPIN:(id)a3
{
  id v3;
  const __CFString *v4;
  BOOL v5;
  int v6;
  void *v7;
  CFPropertyListRef *v8;
  Boolean keyExistsAndHasValidFormat;

  v3 = a3;
  if (SpringBoardPreferenceDomain_once != -1)
    dispatch_once(&SpringBoardPreferenceDomain_once, &__block_literal_global_62_0);
  v4 = (const __CFString *)SpringBoardPreferenceDomain_springBoardDomain;
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("SBParentalControlsEnabled"), (CFStringRef)SpringBoardPreferenceDomain_springBoardDomain, &keyExistsAndHasValidFormat))
  {
    v5 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v5 = 1;
  }
  v6 = !v5;
  getSTManagementState();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "setRestrictionsPasscode:completionHandler:", v3, &__block_literal_global_29_0);
    if (v3)
      goto LABEL_16;
  }
  else if (v3)
  {
    +[SFRestrictionsPasscodeController _setKeychainPasswordForRestrictions:](SFRestrictionsPasscodeController, "_setKeychainPasswordForRestrictions:", v3);
    goto LABEL_16;
  }
  +[SFRestrictionsPasscodeController _removeKeychainPasswordForRestrictions](SFRestrictionsPasscodeController, "_removeKeychainPasswordForRestrictions");
LABEL_16:
  if ((v3 != 0) != v6)
  {
    if (v3)
      v8 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
    else
      v8 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
    ADClientAddValueForScalarKey();
    CFPreferencesSetAppValue(CFSTR("SBParentalControlsEnabled"), *v8, v4);
    CFPreferencesAppSynchronize(v4);
    GSSendAppPreferencesChanged();
  }

}

void __43__SFRestrictionsPasscodeController_setPIN___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    SFLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __43__SFRestrictionsPasscodeController_setPIN___block_invoke_cold_1();

  }
}

+ (BOOL)validatePIN:(id)a3
{
  id v3;
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  char v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = a3;
  +[SFRestrictionsPasscodeController _migrateRestrictionsPasscodeIfNeeded](SFRestrictionsPasscodeController, "_migrateRestrictionsPasscodeIfNeeded");
  getSTManagementState();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v5 = dispatch_semaphore_create(0);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__SFRestrictionsPasscodeController_validatePIN___block_invoke;
    v10[3] = &unk_24C397E38;
    v13 = &v14;
    v11 = v3;
    v6 = v5;
    v12 = v6;
    objc_msgSend(v4, "authenticateRestrictionsPasscode:completionHandler:", v11, v10);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v7 = *((_BYTE *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    +[SFRestrictionsPasscodeController _keychainPasswordForRestrictions](SFRestrictionsPasscodeController, "_keychainPasswordForRestrictions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "isEqualToString:", v8);

  }
  return v7;
}

intptr_t __48__SFRestrictionsPasscodeController_validatePIN___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  if (a2)
  {
    +[SFRestrictionsPasscodeController _keychainPasswordForRestrictions](SFRestrictionsPasscodeController, "_keychainPasswordForRestrictions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = *(void **)(a1 + 32);
      +[SFRestrictionsPasscodeController _keychainPasswordForRestrictions](SFRestrictionsPasscodeController, "_keychainPasswordForRestrictions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "isEqualToString:", v5);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (void)_removeKeychainPasswordForRestrictions
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_20AC93000, v0, v1, "%{Public}s: Could not remove password for Restrictions: error %ld", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)_setKeychainPasswordForRestrictions:(id)a3
{
  void *v3;
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  void *v6;
  __CFDictionary *v7;
  NSObject *v8;
  NSObject *v9;
  CFTypeRef result;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], CFSTR("user"));
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9128], CFSTR("ParentalControls"));
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8F60], (const void *)*MEMORY[0x24BDE8FA0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9150], MEMORY[0x24BDBD1C8]);
  +[SFRestrictionsPasscodeController _keychainPasswordForRestrictions](SFRestrictionsPasscodeController, "_keychainPasswordForRestrictions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = CFDictionaryCreateMutable(v4, 0, 0, 0);
    CFDictionaryAddValue(v7, (const void *)*MEMORY[0x24BDE9550], v3);
    if (SecItemUpdate(Mutable, v7))
    {
      SFLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[SFRestrictionsPasscodeController _setKeychainPasswordForRestrictions:].cold.2();

    }
    CFRelease(v7);
  }
  else
  {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9550], v3);
    if (SecItemAdd(Mutable, &result))
    {
      SFLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[SFRestrictionsPasscodeController _setKeychainPasswordForRestrictions:].cold.1();

    }
  }
  CFRelease(Mutable);

}

+ (id)pinFromHashAndSaltLegacyPassword
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  char v7;
  NSObject *v8;

  +[SFRestrictionsPasscodeController hashForHashAndSaltLegacyRestrictions](SFRestrictionsPasscodeController, "hashForHashAndSaltLegacyRestrictions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFRestrictionsPasscodeController saltForHashAndSaltLegacyRestrictions](SFRestrictionsPasscodeController, "saltForHashAndSaltLegacyRestrictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  while (1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%04d"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[SFRestrictionsPasscodeController newHashDataForPassword:andSalt:](SFRestrictionsPasscodeController, "newHashDataForPassword:andSalt:", v5, v3);
    v7 = objc_msgSend(v6, "isEqualToData:", v2);

    if ((v7 & 1) != 0)
      break;

    v4 = (v4 + 1);
    if ((_DWORD)v4 == 10000)
    {
      SFLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[SFRestrictionsPasscodeController pinFromHashAndSaltLegacyPassword].cold.1(v8);

      v5 = 0;
      break;
    }
  }

  return v5;
}

+ (id)_generateSalt
{
  uint32_t v3;

  v3 = arc4random();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newHashDataForPassword:(id)a3 andSalt:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 20);
  if (v5 && v6)
    SecKeyFromPassphraseDataHMACSHA1();

  return v7;
}

+ (id)saltForHashAndSaltLegacyRestrictions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.restrictionspassword"));
  objc_msgSend(v2, "dataForKey:", CFSTR("RestrictionsPasswordSalt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)removePasswordForHashAndSaltLegacyRestrictions
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.restrictionspassword"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("RestrictionsPasswordKey"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("RestrictionsPasswordSalt"));

}

void __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_20AC93000, v0, v1, "Keychain passcode matches Screen Time Passcode.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_20AC93000, v0, v1, "Keychain passcode does not match Screen Time Passcode. User should reset restriction passcode.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __43__SFRestrictionsPasscodeController_setPIN___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_20AC93000, v0, v1, "Passcode failed to save in Screen Time.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)_setKeychainPasswordForRestrictions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_20AC93000, v0, v1, "%{Public}s: Could not add password for Restrictions: error %ld", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)_setKeychainPasswordForRestrictions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_20AC93000, v0, v1, "%{Public}s: Could not change password for Restrictions: error %ld", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)pinFromHashAndSaltLegacyPassword
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "+[SFRestrictionsPasscodeController pinFromHashAndSaltLegacyPassword]";
  _os_log_error_impl(&dword_20AC93000, log, OS_LOG_TYPE_ERROR, "%{Public}s: Couldn't find legacy hash and salt restrictions pin.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
