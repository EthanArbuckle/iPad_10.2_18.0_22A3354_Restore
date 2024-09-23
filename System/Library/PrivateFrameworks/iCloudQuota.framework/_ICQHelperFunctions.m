@implementation _ICQHelperFunctions

+ (id)_darwinNotificationNameForRequestType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  else
    return off_1E8B384B8[a3 - 1];
}

+ (int64_t)_getOfferRequestTypeFromOptions:(id)a3 bundleId:(id)a4 isBuddy:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(a1, "_requestedFetchOffersInOptions:", v8);
  v11 = objc_msgSend(a1, "_requestedPremiumOfferInOptions:", v8);
  if (objc_msgSend(a1, "_requestedDefaultOfferInOptions:", v8))
  {
    v12 = objc_msgSend(a1, "_requestedEventOfferInOptions:", v8);
LABEL_4:
    v10 = 1;
    v14 = 1;
    goto LABEL_6;
  }
  v13 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.icq"));
  v12 = objc_msgSend(a1, "_requestedEventOfferInOptions:", v8);
  if (v13)
    goto LABEL_4;
  v14 = 0;
LABEL_6:
  v15 = 3;
  if (v12)
    v15 = 5;
  if (v5)
    v15 = 4;
  if (v11)
    v15 = 2;
  if (v10)
    v16 = v14;
  else
    v16 = v15;

  return v16;
}

+ (BOOL)_checkOptions:(id)a3 forKey:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

+ (BOOL)_requestedEventOfferInOptions:(id)a3
{
  return objc_msgSend(a1, "_checkOptions:forKey:", a3, CFSTR("isEventOffer"));
}

+ (BOOL)_requestedPremiumOfferInOptions:(id)a3
{
  return objc_msgSend(a1, "_checkOptions:forKey:", a3, CFSTR("isPremiumOffer"));
}

+ (BOOL)_requestedFetchOffersInOptions:(id)a3
{
  return objc_msgSend(a1, "_checkOptions:forKey:", a3, CFSTR("isForFetchOffers"));
}

+ (BOOL)_requestedDefaultOfferInOptions:(id)a3
{
  return objc_msgSend(a1, "_checkOptions:forKey:", a3, CFSTR("isDefaultOffer"));
}

+ (id)_getOfferDescriptionFromRequestType:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("premium");
  else
    return off_1E8B38488[a3];
}

+ (BOOL)userDefaultsBoolValueForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", v4);

  return v6;
}

+ (BOOL)backupRestoreCompletedInOptions:(id)a3
{
  return objc_msgSend(a1, "_checkOptions:forKey:", a3, CFSTR("backupRestoreComplete"));
}

+ (id)replaceWordsIn:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(v6, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", v12, v13);
        v5 = (id)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)stringFromTemplates:(id)a3 key:(id)a4
{
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v5 = (__CFString *)a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v6;
    v9 = v5;
  }
  else
  {
    v9 = CFSTR("default");
    v8 = v6;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)findPlaceholdersInString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "containsString:", CFSTR("%$")))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "hasPrefix:", CFSTR("%$"), (_QWORD)v15))
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    v13 = (void *)objc_msgSend(v6, "copy");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (void)setUserDefaultsBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99EA0];
  v6 = a4;
  objc_msgSend(v5, "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v4, v6);

}

+ (void)setUserDefaultsObject:(id)a3 forKey:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0C99EA0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "standardUserDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

+ (id)userDefaultsObjectForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)userDefaultsDictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(a1, "userDefaultsObjectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[_ICQHelperFunctions userDefaultsDictionaryForKey:].cold.1();

    v6 = 0;
  }

  return v6;
}

+ (id)userDefaultsStringForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(a1, "userDefaultsObjectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[_ICQHelperFunctions userDefaultsStringForKey:].cold.1();

    v6 = 0;
  }

  return v6;
}

+ (BOOL)defaultKeyExists:(id)a3
{
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue((CFStringRef)a3, CFSTR("com.apple.cloud.quota"), &keyExistsAndHasValidFormat))
    v3 = keyExistsAndHasValidFormat == 0;
  else
    v3 = 1;
  return !v3;
}

+ (id)defaultValueForKey:(id)a3
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.cloud.quota"));
}

+ (id)defaultStringValueForKey:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_ICQHelperFunctions defaultValueForKey:](_ICQHelperFunctions, "defaultValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    if (v4)
    {
      _ICQGetLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412290;
        v9 = v3;
        _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "defaults key %@ is not of correct type", (uint8_t *)&v8, 0xCu);
      }

    }
    v5 = 0;
  }

  return v5;
}

+ (id)parseTemplates:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("format"), (_QWORD)v17);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("key"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("format"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("key"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKey:", v14, v15);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)standardDateFormat:(unint64_t)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setDateStyle:", a3);
  objc_msgSend(v4, "setTimeStyle:", a3);
  objc_msgSend(v4, "dateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isServerMockingEnabled
{
  return +[_ICQHelperFunctions defaultKeyExists:](_ICQHelperFunctions, "defaultKeyExists:", CFSTR("_ICQEnableServerMocking"));
}

+ (id)getStringFromNumber:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend(v4, "setNumberStyle:", 1);
  objc_msgSend(v4, "setUsesGroupingSeparator:", 1);
  objc_msgSend(v4, "setMaximumFractionDigits:", 0);
  objc_msgSend(v4, "stringFromNumber:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)base64EncodeString:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v6;
  uint8_t v7[16];

  if (a3)
  {
    objc_msgSend(a3, "dataUsingEncoding:", 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "Invalid string", v7, 2u);
    }

    return 0;
  }
}

+ (int64_t)_offerRequestTypeForStub:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isDefaultOffer") & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isPremiumOffer") & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isBuddyOffer") & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEventOffer"))
  {
    v4 = 5;
  }
  else
  {
    v4 = 3;
  }

  return v4;
}

+ (id)followUpIdentifierPrefixForRequestType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("com.apple.iCloudQuotaDaemon.ICQFollowupRegular");
  if (a3 == 5)
    v3 = CFSTR("com.apple.iCloudQuotaDaemon.ICQFollowupEvent");
  if (a3 == 2)
    return CFSTR("com.apple.iCloudQuotaDaemon.ICQFollowupPremium");
  else
    return (id)v3;
}

+ (BOOL)isBackupEnabledForAccount:(id)a3 accountStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "accountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    LOBYTE(v8) = objc_msgSend(v6, "isEnabledForDataclass:", *MEMORY[0x1E0C8F360]);
  }
  else
  {
    objc_msgSend(v5, "enabledDataclassesForAccount:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0C8F360]);
    v6 = v9;
  }

  return v8;
}

+ (BOOL)isICPLEnabledForAccount:(id)a3
{
  return objc_msgSend(a3, "isEnabledForDataclass:", *MEMORY[0x1E0C8F380]);
}

+ (BOOL)isPhotosLibraryIncludedInBackupForAccount:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D4E0A8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "personaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithDelegate:eventQueue:personaIdentifier:", 0, 0, v6);
  LOBYTE(v4) = objc_msgSend(v7, "isBackupEnabledForDomainName:", CFSTR("CameraRollDomain"));

  return (char)v4;
}

+ (void)getPhotosLibrarySizeWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D73220], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58___ICQHelperFunctions_getPhotosLibrarySizeWithCompletion___block_invoke;
  v6[3] = &unk_1E8B38390;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "getLibrarySizes:", v6);

}

+ (void)getOriginalPhotosSizeWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v5 = v3;
  PLRequestSizeOfOriginalResourcesForLibrary();

}

+ (id)usedCapacityForVolume:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = ICQUsedDiskSpaceForVolume(v3);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C99BB8];
  v7 = *MEMORY[0x1E0C99BA8];
  v32[0] = *MEMORY[0x1E0C99BB8];
  v32[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v5, "resourceValuesForKeys:error:", v8, &v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v25;

  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "unsignedLongLongValue");
    if (v13 <= objc_msgSend(v12, "unsignedLongLongValue"))
    {
      v17 = objc_msgSend(v12, "unsignedLongLongValue");
      v14 = v17 - objc_msgSend(v11, "unsignedLongLongValue");
      if (v14 > v4)
      {
        _ICQGetLogSystem();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v27 = v3;
          v28 = 2114;
          v29 = v23;
          v30 = 2114;
          v31 = v24;
          _os_log_error_impl(&dword_1CDEBD000, v18, OS_LOG_TYPE_ERROR, "Somehow reclaimable space is bigger than used space for %{public}@: %{public}@, %{public}@", buf, 0x20u);

        }
        v19 = (void *)MEMORY[0x1E0CB37E8];
        v20 = v4;
        goto LABEL_12;
      }
    }
    else
    {
      v14 = 0;
    }
    v19 = (void *)MEMORY[0x1E0CB37E8];
    v20 = v4 - v14;
LABEL_12:
    objc_msgSend(v19, "numberWithUnsignedLongLong:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _ICQGetLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v27 = v3;
      v28 = 2114;
      v29 = v16;
      _os_log_impl(&dword_1CDEBD000, v21, OS_LOG_TYPE_DEFAULT, "Used Capacity on %{public}@: %{public}@", buf, 0x16u);
    }

    goto LABEL_15;
  }
  _ICQGetLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    +[_ICQHelperFunctions usedCapacityForVolume:].cold.1();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v16;
}

+ (void)remoteBackupSizeForAccount:(id)a3 timeoutInSeconds:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  dispatch_time_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  uint64_t *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v8 = a3;
  v9 = a5;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("com.apple.icloud.quota.remote-backup-size-timeout-queue", v10);

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__0;
  v36 = __Block_byref_object_dispose__0;
  v37 = 0;
  v12 = (void *)MEMORY[0x1E0CB34C8];
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __78___ICQHelperFunctions_remoteBackupSizeForAccount_timeoutInSeconds_completion___block_invoke;
  v27[3] = &unk_1E8B383E0;
  v14 = v8;
  v30 = &v32;
  v31 = a1;
  v28 = v14;
  v15 = v9;
  v29 = v15;
  objc_msgSend(v12, "blockOperationWithBlock:", v27);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v33[5];
  v33[5] = v16;

  v18 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v21 = v13;
  v22 = 3221225472;
  v23 = __78___ICQHelperFunctions_remoteBackupSizeForAccount_timeoutInSeconds_completion___block_invoke_2;
  v24 = &unk_1E8B38408;
  v26 = &v32;
  v19 = v15;
  v25 = v19;
  dispatch_after(v18, v11, &v21);
  objc_msgSend(a1, "_remoteBackupSizeOperationQueue", v21, v22, v23, v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addOperation:", v33[5]);

  _Block_object_dispose(&v32, 8);
}

+ (id)_fetchNextBackupSize:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  v26 = 0;
  objc_msgSend(v3, "getBackupListWithError:", &v26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v26;
  objc_msgSend(v3, "backupDeviceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[_ICQHelperFunctions _fetchNextBackupSize:].cold.1();

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v4;
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "backupUUID", (_QWORD)v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if (v14)
        {
          v9 = v12;
          goto LABEL_15;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_15:

  objc_msgSend(v9, "snapshots");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v28 = v8;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v9;
    v33 = 2112;
    v34 = v16;
    _os_log_debug_impl(&dword_1CDEBD000, v17, OS_LOG_TYPE_DEBUG, "Backups array %@, current device uuid %@, matchingBackup %@, available snapshots %@", buf, 0x2Au);
  }

  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v16, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberWithLongLong:", objc_msgSend(v19, "estimatedRestoreSize"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_remoteBackupSizeOperationQueue
{
  if (_remoteBackupSizeOperationQueue_onceToken != -1)
    dispatch_once(&_remoteBackupSizeOperationQueue_onceToken, &__block_literal_global_100);
  return (id)_remoteBackupSizeOperationQueue_operationQueue;
}

+ (id)dictionaryForKey:(id)a3 from:(id)a4
{
  void *v4;
  id v5;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

+ (id)numberForKey:(id)a3 from:(id)a4
{
  void *v4;
  id v5;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

+ (id)followUpGroupIdentifierForString:(id)a3
{
  id v3;
  id *v4;
  int v5;
  id v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLGroupIdentifierDevice")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0D15DF0];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLGroupIdentifierNoGroup")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0D15E00];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLGroupIdentifierAppleServices")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0D15DE8];
  }
  else
  {
    v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("FLGroupIdentifierNewDeviceOutreach"));
    v4 = (id *)MEMORY[0x1E0D15DE0];
    if (v5)
      v4 = (id *)MEMORY[0x1E0D15DF8];
  }
  v6 = *v4;

  return v6;
}

+ (void)appLaunchLinkTrackerSetLastShownDate:(id)a3 forBundleID:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[ICQAppLaunchLinkTracker shared](ICQAppLaunchLinkTracker, "shared");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLastShownDate:forBundleID:", v6, v5);

}

+ (void)bubbleBannerTrackLastDismissed:(id)a3 forReason:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[ICQBubbleBannerTracker shared](ICQBubbleBannerTracker, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trackLastDismissed:date:reason:", v7, v9, v5);

  }
}

+ (BOOL)shouldDisplay:(id)a3 forReason:(id)a4 dismissedInSession:(BOOL)a5 supressUntil:(double)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "aa_primaryAppleAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[ICQBubbleBannerTracker shared](ICQBubbleBannerTracker, "shared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "account:shouldDisplay:forReason:dismissedInSession:supressUntil:", v12, v9, v10, v7, a6);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)lastUpdatedForReason:(id)a3 decayUntil:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[ICQBubbleBannerTracker shared](ICQBubbleBannerTracker, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "account:lastUpdated:decayUntil:", v7, v5, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)userDefaultsDictionaryForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1CDEBD000, v0, v1, "Could not find a dictionary at key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

+ (void)userDefaultsStringForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1CDEBD000, v0, v1, "Could not find a string at key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

+ (void)usedCapacityForVolume:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1CDEBD000, v1, OS_LOG_TYPE_ERROR, "Failed to get resource values for %@: %@", v2, 0x16u);
  OUTLINED_FUNCTION_0_0();
}

+ (void)_fetchNextBackupSize:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1CDEBD000, v0, OS_LOG_TYPE_ERROR, "Unable to retrieve remote backup info: %@", v1, 0xCu);
  OUTLINED_FUNCTION_0_0();
}

@end
