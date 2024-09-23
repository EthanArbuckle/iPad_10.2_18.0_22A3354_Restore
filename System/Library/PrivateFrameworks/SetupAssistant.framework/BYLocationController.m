@implementation BYLocationController

+ (id)sharedBuddyLocationController
{
  void *v2;
  BYLocationController *v3;
  void *v4;

  v2 = (void *)sharedBuddyLocationController_sharedBuddyLocationController;
  if (!sharedBuddyLocationController_sharedBuddyLocationController)
  {
    v3 = objc_alloc_init(BYLocationController);
    v4 = (void *)sharedBuddyLocationController_sharedBuddyLocationController;
    sharedBuddyLocationController_sharedBuddyLocationController = (uint64_t)v3;

    v2 = (void *)sharedBuddyLocationController_sharedBuddyLocationController;
  }
  return v2;
}

- (void)configureForAnalytics:(id)a3
{
  void *v4;
  BYAnalyticsEventRecommendedLocale *v5;
  id v6;

  v6 = a3;
  -[BYLocationController recommendedLocaleAnalyticsEvent](self, "recommendedLocaleAnalyticsEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[BYAnalyticsEventRecommendedLocale initWithAnalyticsManager:]([BYAnalyticsEventRecommendedLocale alloc], "initWithAnalyticsManager:", v6);
    -[BYLocationController setRecommendedLocaleAnalyticsEvent:](self, "setRecommendedLocaleAnalyticsEvent:", v5);

  }
}

- (id)_countryFromTelephony
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", 0);
  v34 = 0;
  objc_msgSend(v2, "getSubscriptionInfoWithError:", &v34);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v34;
  if (v4)
  {
    v5 = v4;
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BYLocationController _countryFromTelephony].cold.3((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v3, "subscriptionsInUse");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v14, "count");

  if (!v13)
  {
    v5 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v3, "subscriptionsInUse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v17 = (void *)objc_msgSend(v2, "copyMobileCountryCode:error:", v16, &v33);
  v5 = v33;

  if (v5)
  {
    _BYLoggingFacility();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BYLocationController _countryFromTelephony].cold.2((uint64_t)v5, v18, v19, v20, v21, v22, v23, v24);
    v13 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v32 = 0;
  v13 = (void *)objc_msgSend(v2, "copyMobileSubscriberIsoCountryCode:error:", v17, &v32);
  v5 = v32;
  if (v5)
  {
    _BYLoggingFacility();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BYLocationController _countryFromTelephony].cold.1((uint64_t)v5, v18, v25, v26, v27, v28, v29, v30);
    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v13;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "Country from Telephony: %@", buf, 0xCu);
  }
LABEL_18:

  return v13;
}

- (id)aliasDict
{
  NSDictionary *aliasDict;
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *v7;

  aliasDict = self->_aliasDict;
  if (!aliasDict)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", CFSTR("CountryAlias"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v5);
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_aliasDict;
    self->_aliasDict = v6;

    aliasDict = self->_aliasDict;
  }
  return aliasDict;
}

- (id)_checkForAliases:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[BYLocationController aliasDict](self, "aliasDict");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("countryAlias"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v4, "count");
    if (v7)
    {
      v9 = v7;
      v10 = 0;
      *(_QWORD *)&v8 = 138412546;
      v18 = v8;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v10, v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          _BYLoggingFacility();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            v21 = v11;
            v22 = 2112;
            v23 = v12;
            _os_log_impl(&dword_1A4E92000, v13, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Found country '%@', but this is an alias for '%@'", buf, 0x16u);
          }

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = v12;
          }
          else
          {
            v19 = v12;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
            v14 = (id)objc_claimAutoreleasedReturnValue();
          }
          v16 = v14;
          objc_msgSend(v4, "replaceObjectsInRange:withObjectsFromArray:", v10, 1, v14);
          v15 = objc_msgSend(v16, "count");

        }
        else
        {
          v15 = 1;
        }
        v10 += v15;

      }
      while (v10 < v9);
    }

  }
  return v4;
}

- (id)_checkForAliasesOrInvalid:(id)a3
{
  id v4;
  void *v5;
  NSSet *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSSet *validCountries;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  NSObject *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  if (!self->_validCountries)
  {
    v6 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(MEMORY[0x1E0C99DC8], "availableLocaleIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      v11 = *MEMORY[0x1E0C997B0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v13 = (void *)MEMORY[0x1E0C99DC8];
          objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "componentsFromLocaleIdentifier:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "objectForKey:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            -[NSSet addObject:](v6, "addObject:", v16);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v9);
    }

    validCountries = self->_validCountries;
    self->_validCountries = v6;

    v4 = v26;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[BYLocationController _checkForAliases:](self, "_checkForAliases:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        if (-[NSSet containsObject:](self->_validCountries, "containsObject:", v23))
        {
          objc_msgSend(v5, "addObject:", v23);
        }
        else
        {
          _BYLoggingFacility();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v23;
            _os_log_impl(&dword_1A4E92000, v24, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Found country '%@', but this is not a valid country code, ignoring", buf, 0xCu);
          }

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v20);
  }

  return v5;
}

- (id)_checkedArrayForString:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BYLocationController _checkForAliases:](self, "_checkForAliases:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_countriesFromDefaults
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  const char *v7;
  id v8;
  NSObject *v9;
  id v10;
  int v12;
  id v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("GuessedCountry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "Y";
    if (!self->_fakeMode)
      v7 = "N";
    v12 = 138412546;
    v13 = v5;
    v14 = 2080;
    v15 = v7;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: stored in defaults: countries = '%@' fake mode? %s", (uint8_t *)&v12, 0x16u);
  }

  if (objc_msgSend(v5, "count") && self->_fakeMode)
    v8 = v5;
  else
    v8 = 0;
  _BYLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_1A4E92000, v9, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: countries from defaults = '%@'", (uint8_t *)&v12, 0xCu);
  }

  v10 = v8;
  return v10;
}

- (void)_setGuessedCountryDefault:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("GuessedCountry"));

}

- (BYLocationController)init
{
  BYLocationController *v2;
  BYLocationController *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)BYLocationController;
  v2 = -[BYLocationController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_numberOfWiFiScanAttemptsRemaining = 5;
    +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("SuggestedCountries"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      _BYLoggingFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v5;
        _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "Using override suggested countries: %@", buf, 0xCu);
      }

      objc_storeStrong((id *)&v3->_guessedCountries, v5);
    }
    if (!v3->_guessedCountries)
    {
      -[BYLocationController getCountryFromTelephony](v3, "getCountryFromTelephony");
      -[BYLocationController recommendedLocaleAnalyticsEvent](v3, "recommendedLocaleAnalyticsEvent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSource:", 2);

      if (!v3->_guessedCountries)
      {
        -[BYLocationController _startWifiScan](v3, "_startWifiScan");
        if (!v3->_guessedCountries)
          -[BYLocationController getCountryFromNVRAM](v3, "getCountryFromNVRAM");
      }
    }

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BYLocationController _closeWifiConnection](self, "_closeWifiConnection");
  v3.receiver = self;
  v3.super_class = (Class)BYLocationController;
  -[BYLocationController dealloc](&v3, sel_dealloc);
}

- (id)guessedCountryFromTelephony
{
  return self->_guessedCountryFromTelephony;
}

- (BOOL)getCountryFromTelephony
{
  NSString *guessedCountryFromTelephony;
  NSString *v4;
  NSString *v5;
  NSUInteger v6;
  void *v7;
  void *v8;

  guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
  if (!guessedCountryFromTelephony)
  {
    -[BYLocationController _countryFromTelephony](self, "_countryFromTelephony");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_guessedCountryFromTelephony;
    self->_guessedCountryFromTelephony = v4;

    v6 = -[NSString length](self->_guessedCountryFromTelephony, "length");
    guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
    if (v6)
    {
      -[NSString uppercaseString](guessedCountryFromTelephony, "uppercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BYLocationController _checkedArrayForString:](self, "_checkedArrayForString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BYLocationController setGuessedCountries:](self, "setGuessedCountries:", v8);

      -[BYLocationController _setGuessedCountryDefault:](self, "_setGuessedCountryDefault:", self->_guessedCountries);
      guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
    }
  }
  return guessedCountryFromTelephony != 0;
}

- (BOOL)getCountryFromNVRAM
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (getCountryFromNVRAM_onceToken != -1)
    dispatch_once(&getCountryFromNVRAM_onceToken, &__block_literal_global_17);
  if (!getCountryFromNVRAM_nvramCountry)
    return 0;
  v5[0] = getCountryFromNVRAM_nvramCountry;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYLocationController setGuessedCountries:](self, "setGuessedCountries:", v3);

  -[BYLocationController _setGuessedCountryDefault:](self, "_setGuessedCountryDefault:", self->_guessedCountries);
  return getCountryFromNVRAM_nvramCountry != 0;
}

void __43__BYLocationController_getCountryFromNVRAM__block_invoke()
{
  io_registry_entry_t v0;
  io_object_t v1;
  char isKindOfClass;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *CFProperty;

  v0 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], "IODeviceTree:/options");
  if (v0)
  {
    v1 = v0;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v0, CFSTR("SetupCountryOverride"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    IOObjectRelease(v1);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v3 = CFProperty;
    if ((isKindOfClass & 1) != 0)
    {
      v4 = objc_retainAutorelease(CFProperty);
      v5 = objc_msgSend(v4, "bytes");
      if (objc_msgSend(v4, "length"))
      {
        v6 = 0;
        while (*(_BYTE *)(v5 + v6))
        {
          if (++v6 >= (unint64_t)objc_msgSend(v4, "length"))
            goto LABEL_10;
        }
        if (!v6)
          goto LABEL_11;
LABEL_10:
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v5, v6, 4);
        v8 = (void *)getCountryFromNVRAM_nvramCountry;
        getCountryFromNVRAM_nvramCountry = v7;

      }
LABEL_11:

      v3 = CFProperty;
    }

  }
}

- (id)guessedLanguages
{
  BYLocationController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSArray *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  NSObject *v22;
  NSArray *guessedCountries;
  BYLocationController *v25;
  NSArray *obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  NSArray *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v2 = self;
  v41 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_guessedCountries, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v25 = v2;
    obj = v2->_guessedCountries;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v32 != v7)
            objc_enumerationMutation(obj);
          v9 = *(NSArray **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0D3EFB0], "preferredLanguagesForRegion:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "reverseObjectEnumerator");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "allObjects");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          _BYLoggingFacility();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v37 = v9;
            v38 = 2112;
            v39 = v12;
            _os_log_impl(&dword_1A4E92000, v13, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Languages (in reverse order) for country %@ = %@", buf, 0x16u);
          }

          objc_msgSend(v4, "addObject:", v12);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v6);
    }

    while (1)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v14 = v4;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (!v15)
        break;
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v20, "lastObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            if ((objc_msgSend(v3, "containsObject:", v21) & 1) == 0)
              objc_msgSend(v3, "addObject:", v21);
            objc_msgSend(v20, "removeLastObject");
            v17 = 1;
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v16);

      if ((v17 & 1) == 0)
        goto LABEL_27;
    }

LABEL_27:
    v2 = v25;
  }
  else
  {
    v3 = 0;
  }
  _BYLoggingFacility();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    guessedCountries = v2->_guessedCountries;
    *(_DWORD *)buf = 138412546;
    v37 = guessedCountries;
    v38 = 2112;
    v39 = v3;
    _os_log_impl(&dword_1A4E92000, v22, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Languages for countries %@ = %@", buf, 0x16u);
  }

  if (!v2->_firstGuessedLanguages)
    -[BYLocationController setFirstGuessedLanguages:](v2, "setFirstGuessedLanguages:", v3);
  return v3;
}

- (void)setFakeMode:(BOOL)a3
{
  void *v4;
  id v5;

  self->_fakeMode = a3;
  if (a3)
  {
    -[BYLocationController _countriesFromDefaults](self, "_countriesFromDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BYLocationController setGuessedCountries:](self, "setGuessedCountries:", v4);

    -[BYLocationController recommendedLocaleAnalyticsEvent](self, "recommendedLocaleAnalyticsEvent");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSource:", 1);

  }
}

- (void)_startWifiScan
{
  __WiFiManagerClient *v3;
  NSObject *v4;
  uint8_t v5[16];

  self->fWifiManager = 0;
  self->fWifiDevice = 0;
  v3 = (__WiFiManagerClient *)WiFiManagerClientCreate();
  self->fWifiManager = v3;
  if (v3)
  {
    CFRunLoopGetCurrent();
    WiFiManagerClientScheduleWithRunLoop();
    -[BYLocationController _getWifiDevice](self, "_getWifiDevice");
  }
  else
  {
    _BYLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: WiFiManagerClientCreate failed", v5, 2u);
    }

  }
  if (self->fWifiDevice)
    -[BYLocationController _scanWifiList](self, "_scanWifiList");
  else
    WiFiManagerClientRegisterDeviceAttachmentCallback();
}

- (void)_getWifiDevice
{
  const __CFArray *v3;
  const __CFArray *v4;
  __WiFiDeviceClient *ValueAtIndex;
  CFTypeID v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v11;
  uint8_t v12[2];
  uint8_t buf[16];

  v3 = (const __CFArray *)WiFiManagerClientCopyDevices();
  if (v3)
  {
    v4 = v3;
    if (CFArrayGetCount(v3))
    {
      ValueAtIndex = (__WiFiDeviceClient *)CFArrayGetValueAtIndex(v4, 0);
      self->fWifiDevice = ValueAtIndex;
      if (ValueAtIndex)
      {
        v6 = CFGetTypeID(ValueAtIndex);
        if (v6 == WiFiDeviceClientGetTypeID())
        {
          CFRetain(self->fWifiDevice);
LABEL_15:
          CFRelease(v4);
          return;
        }
      }
      _BYLoggingFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 0;
        v9 = "Setup Assistant Location: could not get wifi device";
        v10 = (uint8_t *)&v11;
LABEL_13:
        _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }
    else
    {
      _BYLoggingFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        v9 = "Setup Assistant Location: no WiFi devices found";
        v10 = v12;
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }
  _BYLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: WiFiManagerClientCopyDevices failed", buf, 2u);
  }

}

- (void)_scanWifiListWithDevice:(__WiFiDeviceClient *)a3
{
  if (a3)
  {
    self->fWifiDevice = a3;
    CFRetain(a3);
    -[BYLocationController _scanWifiList](self, "_scanWifiList");
  }
  else
  {
    -[BYLocationController _closeWifiConnection](self, "_closeWifiConnection");
  }
}

- (void)_scanWifiList
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD block[5];
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Starting Wi-Fi scan...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYLocationController setWirelessScanStartDate:](self, "setWirelessScanStartDate:", v5);

  v6 = WiFiDeviceClientScanAsync();
  if (v6)
  {
    v7 = v6;
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v13 = v7;
      _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Wi-Fi scan failed with error %d", buf, 8u);
    }

    if (-[BYLocationController numberOfWiFiScanAttemptsRemaining](self, "numberOfWiFiScanAttemptsRemaining"))
    {
      _BYLoggingFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E92000, v9, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Retrying Wi-Fi scan after a delay...", buf, 2u);
      }

      -[BYLocationController setNumberOfWiFiScanAttemptsRemaining:](self, "setNumberOfWiFiScanAttemptsRemaining:", -[BYLocationController numberOfWiFiScanAttemptsRemaining](self, "numberOfWiFiScanAttemptsRemaining") - 1);
      v10 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__BYLocationController__scanWifiList__block_invoke;
      block[3] = &unk_1E4E26958;
      block[4] = self;
      dispatch_after(v10, MEMORY[0x1E0C80D38], block);
    }
    else
    {
      -[BYLocationController _closeWifiConnection](self, "_closeWifiConnection");
    }
  }

}

void __37__BYLocationController__scanWifiList__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[2] || !v1[6])
  {
    _BYLoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Wi-Fi scan re-attempt unnecessary", v3, 2u);
    }

  }
  else
  {
    objc_msgSend(v1, "_scanWifiList");
  }
}

- (void)_scanComplete:(id)a3 error:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *j;
  uint64_t v24;
  unint64_t v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  BYLocationController *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  int v57;
  char v58[3];
  uint8_t v59[128];
  uint8_t buf[4];
  unint64_t v61;
  __int16 v62;
  uint64_t v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!a4 && !self->_guessedCountries)
  {
    v8 = objc_msgSend(v6, "count");
    if (!v8)
    {
LABEL_46:
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "postNotificationName:object:", CFSTR("BYCountryScanCompletedNotification"), 0);

      goto LABEL_47;
    }
    v9 = v8;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v12 = 0;
    v57 = 3;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v12);

      if (WiFiNetworkGet11dCountryCodeFromIe())
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v58, 2, 1);
        objc_msgSend(v10, "addObject:", v13);

      }
      ++v12;
    }
    while (v9 != v12);
    -[BYLocationController _checkForAliasesOrInvalid:](self, "_checkForAliasesOrInvalid:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v54 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
      }
      while (v16);
    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v19 = v11;
    v20 = (void *)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
    if (v20)
    {
      v41 = v14;
      v42 = v10;
      v43 = v7;
      v44 = self;
      v21 = 0;
      v22 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(_QWORD *)v50 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)j);
          v25 = objc_msgSend(v19, "countForObject:", v24, v41);
          _BYLoggingFacility();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v61 = v25;
            v62 = 2112;
            v63 = v24;
            _os_log_impl(&dword_1A4E92000, v26, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Wifi scan found %lu APs for '%@'", buf, 0x16u);
          }

          if (v25 > v21)
            v21 = v25;
        }
        v20 = (void *)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
      }
      while (v20);

      if (!v21)
      {
        v20 = 0;
        v7 = v43;
        v14 = v41;
        v10 = v42;
        goto LABEL_39;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v27 = v19;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
      v10 = v42;
      v7 = v43;
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v46;
        do
        {
          for (k = 0; k != v29; ++k)
          {
            if (*(_QWORD *)v46 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
            if (objc_msgSend(v27, "countForObject:", v32) == v21)
              objc_msgSend(v20, "addObject:", v32);
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
        }
        while (v29);
      }
      self = v44;
      v14 = v41;
    }

LABEL_39:
    v33 = objc_msgSend(v20, "count");
    _BYLoggingFacility();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    if (v33)
    {
      if (v35)
      {
        *(_DWORD *)buf = 138412290;
        v61 = (unint64_t)v20;
        _os_log_impl(&dword_1A4E92000, v34, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Wifi scan guessed countries: '%@'", buf, 0xCu);
      }

      -[BYLocationController setGuessedCountries:](self, "setGuessedCountries:", v20);
      -[BYLocationController _setGuessedCountryDefault:](self, "_setGuessedCountryDefault:", self->_guessedCountries);
      -[BYLocationController wirelessScanStartDate](self, "wirelessScanStartDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "timeIntervalSinceNow");
      v38 = -v37;

      -[BYLocationController recommendedLocaleAnalyticsEvent](self, "recommendedLocaleAnalyticsEvent");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setSource:", 3);

      -[BYLocationController recommendedLocaleAnalyticsEvent](self, "recommendedLocaleAnalyticsEvent");
      v34 = objc_claimAutoreleasedReturnValue();
      -[NSObject setDurationOfWiFiScan:](v34, "setDurationOfWiFiScan:", v38);
    }
    else if (v35)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v34, OS_LOG_TYPE_DEFAULT, "No valid countries in Wifi scan.", buf, 2u);
    }

    goto LABEL_46;
  }
LABEL_47:
  -[BYLocationController _closeWifiConnection](self, "_closeWifiConnection");

}

- (void)_closeWifiConnection
{
  __WiFiDeviceClient *fWifiDevice;

  if (self->fWifiManager)
  {
    CFRunLoopGetCurrent();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(self->fWifiManager);
    self->fWifiManager = 0;
  }
  fWifiDevice = self->fWifiDevice;
  if (fWifiDevice)
  {
    CFRelease(fWifiDevice);
    self->fWifiDevice = 0;
  }
}

- (void)reset
{
  NSString *guessedCountryFromTelephony;

  -[BYLocationController setGuessedCountries:](self, "setGuessedCountries:", 0);
  guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
  self->_guessedCountryFromTelephony = 0;

}

- (NSArray)guessedCountries
{
  return self->_guessedCountries;
}

- (void)setGuessedCountries:(id)a3
{
  objc_storeStrong((id *)&self->_guessedCountries, a3);
}

- (NSArray)firstGuessedLanguages
{
  return self->_firstGuessedLanguages;
}

- (void)setFirstGuessedLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_firstGuessedLanguages, a3);
}

- (BOOL)fakeMode
{
  return self->_fakeMode;
}

- (NSDate)wirelessScanStartDate
{
  return self->_wirelessScanStartDate;
}

- (void)setWirelessScanStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_wirelessScanStartDate, a3);
}

- (BYAnalyticsEventRecommendedLocale)recommendedLocaleAnalyticsEvent
{
  return self->_recommendedLocaleAnalyticsEvent;
}

- (void)setRecommendedLocaleAnalyticsEvent:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedLocaleAnalyticsEvent, a3);
}

- (unint64_t)numberOfWiFiScanAttemptsRemaining
{
  return self->_numberOfWiFiScanAttemptsRemaining;
}

- (void)setNumberOfWiFiScanAttemptsRemaining:(unint64_t)a3
{
  self->_numberOfWiFiScanAttemptsRemaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedLocaleAnalyticsEvent, 0);
  objc_storeStrong((id *)&self->_wirelessScanStartDate, 0);
  objc_storeStrong((id *)&self->_firstGuessedLanguages, 0);
  objc_storeStrong((id *)&self->_validCountries, 0);
  objc_storeStrong((id *)&self->_aliasDict, 0);
  objc_storeStrong((id *)&self->_guessedCountries, 0);
  objc_storeStrong((id *)&self->_guessedCountryFromTelephony, 0);
}

- (void)_countryFromTelephony
{
  OUTLINED_FUNCTION_1_0(&dword_1A4E92000, a2, a3, "Failed to get subscription info: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
