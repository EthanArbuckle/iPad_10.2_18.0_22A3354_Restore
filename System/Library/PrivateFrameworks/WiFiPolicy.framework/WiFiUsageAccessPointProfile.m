@implementation WiFiUsageAccessPointProfile

+ (id)profileForBSSID:(id)a3 onlyIfCurrent:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  void *v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    if (_useShortProfile)
      v7 = CFSTR("apProfile_shortID");
    else
      v7 = CFSTR("apProfileID");
    v8 = v7;
    v9 = objc_msgSend(a1, "_isProfileValidForUse:withCachedDict:onlyIfCurrent:", v6, 0, v4);
    v10 = 0;
    if (v9)
    {
      +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v6, v8, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), _apProfileVersionString, v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)profileForBSSID:(id)a3
{
  return (id)objc_msgSend(a1, "profileForBSSID:onlyIfCurrent:", a3, 0);
}

+ (BOOL)_isProfileValidForUse:(id)a3 withCachedDict:(id)a4 onlyIfCurrent:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  BOOL v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  double v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  double v28;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  unint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  double v52;
  uint64_t v53;

  v5 = a5;
  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7 && _apProfileVersion == 1)
  {
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v7, CFSTR("apProfileVersion"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v7, CFSTR("apProfileBeaconInfoOccurrencies"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v7, CFSTR("apProfileMaxAssocTime"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v7, CFSTR("apProfileCacheTimestamp"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v7, CFSTR("apProfileForLatestAssoc"), v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v7, CFSTR("apProfileBeaconInfoParsingSuccessful"), v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (!v5 || (v16 & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend((id)_apProfileVersionString, "isEqualToString:", v9) & v18) == 1
        && v11 >= _apProfileMinOccurrencies
        && (*(double *)&_apProfileMinAssoc <= (double)v13
         || v16
         && (objc_msgSend(v14, "timeIntervalSinceNow", (double)v13, *(double *)&_apProfileMinAssoc),
             *(double *)&_apProfileMinAssoc < -v23)))
      {
        v19 = 1;
      }
      else
      {
        if (!v9)
        {
LABEL_25:
          v19 = 0;
          goto LABEL_26;
        }
        v19 = 0;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v24 = _apProfileVersionString;
          if (v18)
            v25 = CFSTR("YES");
          else
            v25 = CFSTR("NO");
          v26 = _apProfileMinOccurrencies;
          v30 = _apProfileMinAssoc;
          if (v16)
            v27 = CFSTR("YES");
          else
            v27 = CFSTR("NO");
          objc_msgSend(v14, "timeIntervalSinceNow");
          *(_DWORD *)buf = 136317698;
          v32 = "+[WiFiUsageAccessPointProfile _isProfileValidForUse:withCachedDict:onlyIfCurrent:]";
          v33 = 2112;
          v34 = (uint64_t)v7;
          v35 = 2112;
          v36 = v9;
          v37 = 2112;
          v38 = v24;
          v39 = 2112;
          v40 = v25;
          v41 = 2048;
          v42 = v11;
          v43 = 2048;
          v44 = v26;
          v45 = 2048;
          v46 = v13;
          v47 = 2048;
          v48 = v30;
          v49 = 2112;
          v50 = v27;
          v51 = 2048;
          v52 = -v28;
          v20 = MEMORY[0x1E0C81028];
          v21 = "%s: Profile for bssid: %@ is NOT valid: version:%@ (current:%@) parsingSuccessful:%@ occurrencies:%lu (>"
                "=%lu) maxAssocTime(sec):%lu (>=%f) isCurrent:%@ lastUpdated/currentAssocTime(sec):%f";
          v22 = 112;
          goto LABEL_24;
        }
      }
    }
    else
    {
      v19 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v32 = "+[WiFiUsageAccessPointProfile _isProfileValidForUse:withCachedDict:onlyIfCurrent:]";
        v33 = 2160;
        v34 = 1752392040;
        v35 = 2112;
        v36 = v7;
        v37 = 2112;
        v38 = (uint64_t)v14;
        v20 = MEMORY[0x1E0C81028];
        v21 = "%s: bssid %{mask.hash}@ has not been derived from a beacon retrieved after the current association (last updated: %@)";
        v22 = 42;
LABEL_24:
        _os_log_impl(&dword_1CC44E000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
        goto LABEL_25;
      }
    }
LABEL_26:

    goto LABEL_27;
  }
  v19 = 0;
LABEL_27:

  return v19;
}

+ (id)_loadFromUserDefaults:(id)a3 withKey:(id)a4 withCachedData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[WiFiUsagePrivacyFilter reformatMACAddress:](WiFiUsagePrivacyFilter, "reformatMACAddress:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
    {
      v12 = v10;
      if (!v9)
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(a1, "_getDefaults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dictionaryForKey:", v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_11;
    }
    if (v12)
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("apProfileID"))
        || objc_msgSend(a1, "_isProfileValidForStorage:", v12))
      {
        objc_msgSend(v12, "objectForKey:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
        v13 = v15;

        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stale (from %s)"), "+[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_submitProfileFor:withCachedDict:AndEraseWithLog:", v8, v12, v28);

LABEL_15:
      v15 = 0;
      goto LABEL_16;
    }
LABEL_11:
    if (v12)
    {
      v15 = (void *)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("apProfileBeaconInfo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addEntriesFromDictionary:", v16);

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("apProfileWPSInfo"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addEntriesFromDictionary:", v17);

      objc_msgSend(v15, "setValue:forKey:", 0, CFSTR("apProfileBeaconInfo"));
      objc_msgSend(v15, "setValue:forKey:", 0, CFSTR("apProfileWPSInfo"));
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("apProfileCacheTimestampCreated"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceNow");
      v20 = -v19;

      objc_msgSend(a1, "_getBinTimeInterval:As:", 1, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forKey:", v21, CFSTR("ageAtRemoval"));

      objc_msgSend(v15, "setValue:forKey:", 0, CFSTR("apProfileCacheTimestampCreated"));
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("apProfileCacheTimestamp"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceNow");
      v24 = -v23;

      objc_msgSend(a1, "_getBinTimeInterval:As:", 1, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forKey:", v25, CFSTR("timeSinceLastRefresh"));

      objc_msgSend(v15, "setValue:forKey:", 0, CFSTR("apProfileCacheTimestamp"));
      objc_msgSend(v15, "setValue:forKey:", 0, CFSTR("submittedToCA"));
      objc_msgSend(v12, "objectForKey:", CFSTR("apProfileBeaconInfoParsingSuccessful"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "BOOLValue");

      if (v27)
        objc_msgSend(v15, "setValue:forKey:", 0, CFSTR("apProfileBeaconRaw"));
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v13 = 0;
LABEL_17:

  return v13;
}

+ (id)_getDefaults
{
  return (id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
}

+ (id)prefixForCA
{
  return CFSTR("BeaconInformationElement_");
}

+ (void)initialize
{
  void *v2;

  v2 = (void *)_configError;
  _configError = (uint64_t)CFSTR("Waiting on MobileAssets callback");

}

+ (id)_config
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = _apProfileMinAssoc;
  v4 = _apProfileMinOccurrencies;
  v5 = _apProfileMinSecsBetweenOccurrencies;
  v6 = _maxProfiles;
  v7 = _profileCacheTimeout;
  v8 = _apProfileVersionString;
  v9 = _shortProfileBytesLen;
  v10 = *(double *)&_profileCacheTimeout / 86400.0;
  v11 = objc_msgSend((id)_apProfileFields, "count");
  if (_apProfileListVendorIEs)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v13 = _apProfileListVendorIEsLen;
  v14 = objc_msgSend((id)_apProfileVendorFields, "count");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("apProfileMinAssoc(sec):%f apProfileMinOccurrencies:%lu apProfileMinIntervalBetweenOccurrencies(sec):%f maxProfiles:%lu maxAgeDays:%f (%f sec)\napProfileVersion:%@ shortApProfileBytesLen:%lu { fields:%u ; listVendorIEs:%@ ; listVendorIELen:%u ; vendor fields:%u ; vendor exclude:%u }"),
               v3,
               v4,
               v5,
               v6,
               *(_QWORD *)&v10,
               v7,
               v8,
               v9,
               v11,
               v12,
               v13,
               v14,
               objc_msgSend((id)_apProfileVendorExcludeFields, "count"));
}

+ (void)setMaxProfiles:(unint64_t)a3
{
  _maxProfiles = a3;
}

+ (void)_defaults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _apProfileVersion = 0;
  v2 = (void *)_apProfileVersionString;
  _apProfileVersionString = (uint64_t)CFSTR("profile_AP__UNDEFINED");

  _apProfileMinAssoc = 0;
  _apProfileMinOccurrencies = 1;
  _apProfileMinSecsBetweenOccurrencies = 0;
  _maxProfiles = 0;
  _profileCacheTimeout = 0x4122750000000000;
  _shortProfileBytesLen = 20;
  _apProfileListVendorIEs = 0;
  _apProfileListVendorIEsLen = 0x7FFFFFFFFFFFFFFFLL;
  _apProfileIncludeIELen = 1;
  v3 = (void *)_apProfileFields;
  _apProfileFields = 0;

  v4 = (void *)_apProfileVendorFields;
  _apProfileVendorFields = 0;

  v5 = (void *)_apProfileVendorExcludeFields;
  _apProfileVendorExcludeFields = 0;

}

+ (void)updateConfig
{
  void *v3;
  __objc2_class **p_superclass;
  void *v5;
  id v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:](WiFiUsageAccessPointProfileConfiguration, "getConfigForKey:", CFSTR("apProfileVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_superclass = TBTileFetchRequestDescriptor.superclass;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("impossible to parse %@. Expected String, found: %@"), CFSTR("apProfileVersion"), v3);
LABEL_41:
      v26 = objc_claimAutoreleasedReturnValue();
LABEL_42:
      v13 = 0;
LABEL_43:
      v27 = (void *)_configError;
      _configError = v26;

      objc_msgSend(a1, "_defaults");
      goto LABEL_44;
    }
  }
  else
  {
    objc_msgSend(a1, "_defaults");
  }
  v5 = (void *)_apProfileVersionString;
  _apProfileVersionString = (uint64_t)v3;
  v6 = v3;

  _apProfileVersion = 1;
  v7 = CFSTR("apProfileMinAssocSec");
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:](WiFiUsageAccessPointProfileConfiguration, "getConfigForKey:", CFSTR("apProfileMinAssocSec"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_40;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_40;
  objc_msgSend(v3, "doubleValue");
  _apProfileMinAssoc = v8;
  v9 = CFSTR("apProfileMinOccurrencies");
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:](WiFiUsageAccessPointProfileConfiguration, "getConfigForKey:", CFSTR("apProfileMinOccurrencies"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_47;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_47;
  _apProfileMinOccurrencies = objc_msgSend(v10, "unsignedIntegerValue");
  v7 = CFSTR("apProfileMinIntervalBetweenOccurrencies");
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:](WiFiUsageAccessPointProfileConfiguration, "getConfigForKey:", CFSTR("apProfileMinIntervalBetweenOccurrencies"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_40;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_40;
  objc_msgSend(v3, "doubleValue");
  _apProfileMinSecsBetweenOccurrencies = v11;
  v9 = CFSTR("useShortAPProfile");
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:](WiFiUsageAccessPointProfileConfiguration, "getConfigForKey:", CFSTR("useShortAPProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_47;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_47;
  _useShortProfile = objc_msgSend(v10, "BOOLValue");
  v7 = CFSTR("shortApProfileBytesLen");
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:](WiFiUsageAccessPointProfileConfiguration, "getConfigForKey:", CFSTR("shortApProfileBytesLen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_40;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_40;
  _shortProfileBytesLen = objc_msgSend(v3, "unsignedIntegerValue");
  v9 = CFSTR("maxProfilesCount");
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:](WiFiUsageAccessPointProfileConfiguration, "getConfigForKey:", CFSTR("maxProfilesCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_47:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("impossible to parse %@. Expected Number, found: %@"), v9, v10);
    v26 = objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v3 = v10;
    goto LABEL_43;
  }
  _maxProfiles = objc_msgSend(v10, "unsignedIntegerValue");
  v7 = CFSTR("maxAgeDays");
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:](WiFiUsageAccessPointProfileConfiguration, "getConfigForKey:", CFSTR("maxAgeDays"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("impossible to parse %@. Expected Number, found: %@"), v7, v3);
    goto LABEL_41;
  }
  objc_msgSend(v3, "doubleValue");
  *(double *)&_profileCacheTimeout = v12 * 86400.0;
  +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:](WiFiUsageAccessPointProfileConfiguration, "getConfigForKey:", CFSTR("apProfileDefinition"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("impossible to parse %@. Expected Dictionary, found: %@"), CFSTR("apProfileDefinition"), v13);
    v26 = objc_claimAutoreleasedReturnValue();
    v3 = v13;
    goto LABEL_42;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("includeIELen"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("impossible to parse %@.includeIELen. Expected Number, found: %@"), CFSTR("apProfileDefinition"), 0);
      v26 = objc_claimAutoreleasedReturnValue();
      v3 = 0;
      goto LABEL_43;
    }
  }
  _apProfileIncludeIELen = objc_msgSend(v14, "BOOLValue");
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("fields"));
  v15 = objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("impossible to parse %@.fields. Expected Array, found: %@"), CFSTR("apProfileDefinition"), 0);
      v26 = objc_claimAutoreleasedReturnValue();
      v3 = 0;
      goto LABEL_55;
    }
  }
  v16 = (void *)_apProfileFields;
  _apProfileFields = v15;

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("listVendorIEs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("impossible to parse %@.listVendorIEs. Expected Number, found: %@"), CFSTR("apProfileDefinition"), v3);
LABEL_50:
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_55:
    p_superclass = (__objc2_class **)(TBTileFetchRequestDescriptor + 8);
    goto LABEL_43;
  }
  _apProfileListVendorIEs = objc_msgSend(v3, "BOOLValue");
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("listVendorIEsLen"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("impossible to parse %@.listVendorIEsLen. Expected Number, found: %@"), CFSTR("apProfileDefinition"), v17);
LABEL_54:
    v26 = objc_claimAutoreleasedReturnValue();
    v3 = v17;
    goto LABEL_55;
  }
  _apProfileListVendorIEsLen = objc_msgSend(v17, "integerValue");
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("vendor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("impossible to parse %@.vendor. Expected Dictionary, found: %@"), CFSTR("apProfileDefinition"), v3);
    goto LABEL_50;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("vendor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("fields"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("impossible to parse %@.vendor.fields. Expected Array, found: %@"), CFSTR("apProfileDefinition"), v17);
    goto LABEL_54;
  }
  v19 = (void *)_apProfileVendorFields;
  _apProfileVendorFields = (uint64_t)v17;

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("vendorExclude"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("impossible to parse %@.vendorExclude. Expected Dictionary, found: %@"), CFSTR("apProfileDefinition"), v3);
    goto LABEL_50;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("vendorExclude"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("fields"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v21;
  if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("impossible to parse %@.vendorExclude.fields. Expected Array, found: %@"), CFSTR("apProfileDefinition"), v21);
    goto LABEL_50;
  }
  objc_storeStrong((id *)&_apProfileVendorExcludeFields, v21);
  v22 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_config");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%s: configParseError:%@ (%@)]\n%@"), "+[WiFiUsageAccessPointProfile updateConfig]", CFSTR("NO"), &stru_1E881F240, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v24), "UTF8String"));
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v29 = objc_msgSend(v25, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  p_superclass = (__objc2_class **)(TBTileFetchRequestDescriptor + 8);
LABEL_44:
  if (*((_BYTE *)p_superclass + 3632) == 1)
    objc_msgSend(a1, "_cleanUpStaleProfiles");

}

+ (BOOL)_isProfileValidForStorage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;
  double v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("apProfileVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("apProfileCacheTimestampCreated"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend((id)_apProfileVersionString, "isEqualToString:", v4);
LABEL_5:
    v8 = 0;
    if (v6 && v5)
    {
      objc_msgSend(v5, "timeIntervalSinceNow");
      v8 = *(double *)&_profileCacheTimeout >= -v9;
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", _apProfileVersion);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqual:", v4);

    goto LABEL_5;
  }
  v8 = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "+[WiFiUsageAccessPointProfile _isProfileValidForStorage:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: unknown version format: %@", (uint8_t *)&v11, 0x16u);
    v8 = 0;
  }
LABEL_10:

  return v8;
}

+ (void)_cleanUpStaleProfiles
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *context;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D17AC818](a1, a2);
  objc_msgSend(a1, "_getDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v49 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        +[WiFiUsagePrivacyFilter reformatMACAddress:](WiFiUsagePrivacyFilter, "reformatMACAddress:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v4, "objectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(a1, "_isProfileValidForStorage:", v12))
          {
            objc_msgSend(v12, "objectForKey:", CFSTR("apProfileCacheTimestamp"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setObject:forKeyedSubscript:", v10, v13);

          }
          else
          {
            objc_msgSend(v43, "addObject:", v10);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v7);
  }

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v43, "count");
    v15 = objc_msgSend(v42, "count");
    *(_DWORD *)buf = 136315906;
    v54 = "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]";
    v55 = 2048;
    v56 = v14;
    v57 = 2048;
    v58 = v15;
    v59 = 2048;
    v60 = _maxProfiles;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - staleEntries:%lu validEntries:%lu _maxProfiles:%lu", buf, 0x2Au);
  }
  v16 = objc_msgSend(v42, "count");
  if (v16 > _maxProfiles)
  {
    objc_msgSend(v42, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compare_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: sortedEntries:%@"), "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v19), "UTF8String"));
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = objc_msgSend(v20, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v54 = (const char *)v21;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v22 = objc_msgSend(v42, "count");
    if (v22 != _maxProfiles)
    {
      v23 = 0;
      v24 = MEMORY[0x1E0C81028];
      do
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObject:", v26);

        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v18, "objectAtIndexedSubscript:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v54 = "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]";
          v55 = 2112;
          v56 = (uint64_t)v28;
          _os_log_impl(&dword_1CC44E000, v24, OS_LOG_TYPE_DEFAULT, "%s - marking %@ as stale", buf, 0x16u);

        }
        ++v23;
        v29 = objc_msgSend(v42, "count");
      }
      while (v29 - _maxProfiles > v23);
    }

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v30 = objc_msgSend(v43, "count");
    v31 = objc_msgSend(v42, "count");
    *(_DWORD *)buf = 136315906;
    v54 = "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]";
    v55 = 2048;
    v56 = v30;
    v57 = 2048;
    v58 = v31;
    v59 = 2048;
    v60 = _maxProfiles;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - staleEntries:%lu validEntries:%lu _maxProfiles:%lu", buf, 0x2Au);
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v32 = v43;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v45 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v4, "objectForKeyedSubscript:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stale (from %s)"), "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_submitProfileFor:withCachedDict:AndEraseWithLog:", v37, v38, v39);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v34);
  }

  objc_msgSend(a1, "_getDefaults");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "synchronize");

  objc_autoreleasePoolPop(context);
}

+ (void)_endPrevAssoc
{
  void *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  BOOL v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  __int128 v26;
  id obj;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_getDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = v3;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v31;
    *(_QWORD *)&v5 = 136316162;
    v26 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        +[WiFiUsagePrivacyFilter reformatMACAddress:](WiFiUsagePrivacyFilter, "reformatMACAddress:", v10, v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v29, "objectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("apProfileMaxAssocTime"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "unsignedIntegerValue");

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("apProfileCacheTimestamp"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("apProfileForLatestAssoc"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "BOOLValue");

          objc_msgSend(v15, "timeIntervalSinceNow");
          if (v17)
          {
            v19 = -v18;
            if ((double)v14 >= v19)
            {
              v22 = a1;
            }
            else
            {
              v20 = *(double *)&_apProfileMinAssoc > (double)v14;
              if (*(double *)&_apProfileMinAssoc > v19)
                v20 = 0;
              v7 |= v20;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (unint64_t)v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = a1;
              objc_msgSend(a1, "_saveToUserDefaults:withKey:andValue:", v10, CFSTR("apProfileMaxAssocTime"), v21);

            }
            objc_msgSend(v22, "_saveToUserDefaults:withKey:andValue:", v10, CFSTR("apProfileForLatestAssoc"), MEMORY[0x1E0C9AAA0]);
            if ((v7 & 1) != 0)
            {
              if (objc_msgSend(v22, "_isProfileValidForUse:withCachedDict:", v10, 0))
              {
                v23 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v22, "profileForBSSID:", v10);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v26;
                  v35 = "+[WiFiUsageAccessPointProfile _endPrevAssoc]";
                  v36 = 2160;
                  v37 = 1752392040;
                  v38 = 2112;
                  v39 = v10;
                  v40 = 2160;
                  v41 = 1752392040;
                  v42 = 2112;
                  v43 = v24;
                  _os_log_impl(&dword_1CC44E000, v23, OS_LOG_TYPE_DEFAULT, "%s: profile for %{mask.hash}@ is valid: %{mask.hash}@", buf, 0x34u);

                }
              }
              v7 = 1;
            }
            else
            {
              v7 = 0;
            }
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    }
    while (v6);
  }

  objc_msgSend(a1, "_getDefaults");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "synchronize");

}

+ (BOOL)_compareBytes:(id)a3 FromStart:(unint64_t)a4 WithLen:(unint64_t)a5 With:(id)a6
{
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  BOOL v14;
  _BYTE v16[12];
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = objc_msgSend(v9, "length");
  if (a5 > 4 || v11 < a5 + a4)
  {
    v14 = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v16 = 136316162;
      *(_QWORD *)&v16[4] = "+[WiFiUsageAccessPointProfile _compareBytes:FromStart:WithLen:With:]";
      v17 = 2048;
      v18 = objc_msgSend(v9, "length");
      v19 = 2048;
      v20 = a4;
      v21 = 2048;
      v22 = a5;
      v23 = 2048;
      v24 = 4;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - fieldData len is %lu but start=%lu and len=%lu (<= %lu) - returning FALSE", v16, 0x34u);
      v14 = 0;
    }
  }
  else
  {
    v12 = objc_msgSend(objc_retainAutorelease(v9), "bytes");
    *(_QWORD *)v16 = objc_msgSend(v10, "unsignedIntValue");
    if (a5)
    {
      v13 = (_BYTE *)(v12 + a4);
      v14 = 1;
      do
        v14 = v14 && v16[--a5] == *v13++;
      while (a5);
    }
    else
    {
      v14 = 1;
    }
  }

  return v14;
}

+ (void)_applyMask:(id)a3 FromStart:(unint64_t)a4 WithLen:(unint64_t)a5 WithMask:(id)a6 AppendTo:(id)a7
{
  id v11;
  id v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v17 = a3;
  v11 = a6;
  v12 = a7;
  if (objc_msgSend(v17, "length") >= a5 + a4)
  {
    v13 = objc_msgSend(objc_retainAutorelease(v17), "bytes");
    v18 = objc_msgSend(v11, "unsignedIntValue");
    if (a5)
    {
      v14 = (_BYTE *)(v13 + a4);
      v15 = &v18;
      do
      {
        if (v11)
          v16 = (*v14 & *(_BYTE *)v15);
        else
          v16 = *v14;
        objc_msgSend(v12, "appendFormat:", CFSTR("%02X"), v16);
        ++v14;
        v15 = (uint64_t *)((char *)v15 + 1);
        --a5;
      }
      while (a5);
    }
  }

}

+ (void)_extractFieldsFor:(id)a3 From:(id)a4 Into:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id obj;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("subfields"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("subfields"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("subfields"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("len"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("len"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("len"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mask"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mask"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mask"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  if (v12)
  {
    v37 = v18;
    v38 = v15;
    v41 = v9;
    v39 = v12;
    v40 = v7;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v12;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    if (v19)
    {
      v20 = v19;
      v44 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v46 != v44)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("start"), v37, v38, v39, v40);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("start"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("start"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v25 = 0;
            }

          }
          else
          {
            v25 = 0;
          }
          v26 = v8;

          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("len"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("len"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("len"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v29 = 0;
            }

          }
          else
          {
            v29 = 0;
          }

          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("mask"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("mask"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("mask"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v32 = 0;
            }

          }
          else
          {
            v32 = 0;
          }

          v8 = v26;
          if (objc_msgSend(v26, "length"))
          {
            if (v29 && v25)
            {
              objc_msgSend(a1, "_applyMask:FromStart:WithLen:WithMask:AppendTo:", v26, objc_msgSend(v25, "integerValue"), objc_msgSend(v29, "unsignedIntValue"), v32, v41);
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v33 = objc_msgSend(v25, "unsignedIntValue");
              v34 = objc_msgSend(v29, "unsignedIntValue");
              *(_DWORD *)buf = 136315906;
              v50 = "+[WiFiUsageAccessPointProfile _extractFieldsFor:From:Into:]";
              v51 = 1024;
              v52 = v33;
              v53 = 1024;
              v54 = v34;
              v55 = 2112;
              v56 = v22;
              _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Subfield has wrong format (start:%u, len:%u) - ignoring %@", buf, 0x22u);
            }
          }

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      }
      while (v20);
    }

    v12 = v39;
    v7 = v40;
    v9 = v41;
    v18 = v37;
    v15 = v38;
  }
  else
  {
    v35 = objc_msgSend(v8, "length");
    if (v35 >= objc_msgSend(v15, "unsignedIntValue"))
      v36 = objc_msgSend(v15, "unsignedIntValue");
    else
      v36 = objc_msgSend(v8, "length");
    objc_msgSend(a1, "_applyMask:FromStart:WithLen:WithMask:AppendTo:", v8, 0, v36, v18, v9);
  }

}

+ (id)_toMobileAssetsProfile:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint32_t v32;
  const __CFString *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  unint64_t v69;
  id v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t m;
  id v84;
  id v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  id obj;
  id obja;
  void *v96;
  id v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  uint8_t v122[128];
  uint8_t buf[4];
  const char *v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  uint64_t v128;
  __int16 v129;
  uint64_t v130;
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v90 = a3;
  v89 = (void *)objc_opt_new();
  v84 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v84, "setNumberStyle:", 1);
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  obj = (id)_apProfileFields;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
  if (v3)
  {
    v4 = v3;
    v97 = *(id *)v116;
    do
    {
      v5 = 0;
      v91 = v4;
      do
      {
        if (*(id *)v116 != v97)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v5);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = 0;
          }

        }
        else
        {
          v9 = 0;
        }

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("len"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("len"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("len"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mask"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mask"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mask"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

        if (v9)
        {
          if (objc_msgSend(v9, "hasPrefix:", CFSTR("EL ")))
          {
            v96 = v15;
            objc_msgSend(v9, "substringFromIndex:", objc_msgSend(CFSTR("EL "), "length"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "numberFromString:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "taggedIEList");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("BeaconInformationElement_"), v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v89, "appendFormat:", CFSTR("%02X"), objc_msgSend(v17, "unsignedIntValue"));
            if (_apProfileIncludeIELen)
            {
              objc_msgSend(v89, "appendFormat:", CFSTR("%02X"), objc_msgSend(v20, "length"));
              v4 = v91;
            }
            else
            {
              v4 = v91;
              if (v20)
                v33 = CFSTR("1");
              else
                v33 = CFSTR("0");
              objc_msgSend(v89, "appendString:", v33);
            }
            objc_msgSend(a1, "_extractFieldsFor:From:Into:", v6, v20, v89);

          }
          else
          {
            if (!objc_msgSend(v9, "hasPrefix:", CFSTR("exEL ")))
            {
              objc_msgSend(v90, "valueForKey:", v9);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "unsignedLongValue");

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%%0%ulX"), 2 * objc_msgSend(v12, "unsignedIntValue"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
              {
                if (objc_msgSend(v12, "longValue") < 1 || (unint64_t)objc_msgSend(v12, "longValue") < 9)
                {
                  if (v15)
                    v27 &= objc_msgSend(v15, "unsignedLongValue");
                  if (objc_msgSend(v12, "longValue") == -1)
                    objc_msgSend(v89, "appendFormat:", CFSTR("%lu"), v27);
                  else
                    objc_msgSend(v89, "appendFormat:", v28, v27);
                }
                else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  v29 = objc_msgSend(v12, "longValue");
                  *(_DWORD *)buf = 136315906;
                  v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
                  v125 = 2112;
                  v126 = v6;
                  v127 = 2048;
                  v128 = v29;
                  v129 = 2048;
                  v130 = 8;
                  v30 = MEMORY[0x1E0C81028];
                  v31 = "%s - Field %@ len (%ld) is too large for non TLV values (max=%lu)";
                  v32 = 42;
                  goto LABEL_48;
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
                v125 = 2112;
                v126 = v6;
                v30 = MEMORY[0x1E0C81028];
                v31 = "%s - Field %@ has wrong format (missing len) - ignoring";
                v32 = 22;
LABEL_48:
                _os_log_impl(&dword_1CC44E000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
              }

              goto LABEL_58;
            }
            v96 = v15;
            objc_msgSend(v9, "substringFromIndex:", objc_msgSend(CFSTR("exEL "), "length"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "numberFromString:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "extendedIEList");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@255_%@"), CFSTR("BeaconInformationElement_"), v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v89, "appendString:", CFSTR("FF"));
            if (_apProfileIncludeIELen)
            {
              objc_msgSend(v89, "appendFormat:", CFSTR("%02X"), objc_msgSend(v25, "length"));
              v4 = v91;
            }
            else
            {
              v4 = v91;
              if (v25)
                v34 = CFSTR("1");
              else
                v34 = CFSTR("0");
              objc_msgSend(v89, "appendString:", v34);
            }
            objc_msgSend(v89, "appendFormat:", CFSTR("%02X"), objc_msgSend(v22, "unsignedIntValue"));
            objc_msgSend(a1, "_extractFieldsFor:From:Into:", v6, v25, v89);

          }
          v15 = v96;
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
          v125 = 2112;
          v126 = v6;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Field has wrong format (missing name) - ignoring : %@", buf, 0x16u);
        }
LABEL_58:

        ++v5;
      }
      while (v4 != v5);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
    }
    while (v4);
  }

  v86 = (void *)objc_opt_new();
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  objc_msgSend(v90, "vendorIEList");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "allKeys");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sortedArrayUsingSelector:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = v37;
  v88 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
  v38 = v89;
  if (!v88)
    goto LABEL_128;
  v87 = *(_QWORD *)v112;
  do
  {
    for (i = 0; i != v88; i = v75 + 1)
    {
      if (*(_QWORD *)v112 != v87)
        objc_enumerationMutation(v85);
      v92 = i;
      v40 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * i);
      objc_msgSend(v90, "vendorIEList");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", v40);
      obja = (id)objc_claimAutoreleasedReturnValue();

      if (_apProfileListVendorIEs)
      {
        v109 = 0u;
        v110 = 0u;
        v107 = 0u;
        v108 = 0u;
        v98 = (id)_apProfileVendorExcludeFields;
        v42 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
        if (!v42)
          goto LABEL_93;
        v43 = v42;
        v44 = *(_QWORD *)v108;
        while (1)
        {
          for (j = 0; j != v43; ++j)
          {
            if (*(_QWORD *)v108 != v44)
              objc_enumerationMutation(v98);
            v46 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * j);
            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("match_len"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (v47)
            {
              objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("match_len"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("match_len"));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v49 = 0;
              }

            }
            else
            {
              v49 = 0;
            }

            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("match_value"));
            v50 = objc_claimAutoreleasedReturnValue();
            if (!v50)
            {
              v53 = 0;
LABEL_88:
              v54 = MEMORY[0x1E0C81028];
LABEL_89:
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
                v125 = 2112;
                v126 = v49;
                v127 = 2112;
                v128 = (uint64_t)v53;
                v129 = 2112;
                v130 = (uint64_t)v46;
                _os_log_impl(&dword_1CC44E000, v54, OS_LOG_TYPE_DEFAULT, "%s - Field has wrong format (missing match_len (%@) and|or match_value (%@) and|or matchLen is larger than 8) - ignoring : %@", buf, 0x2Au);
              }
              goto LABEL_91;
            }
            v51 = (void *)v50;
            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("match_value"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("match_value"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v53 = 0;
            }

            if (!v49)
              goto LABEL_88;
            v54 = MEMORY[0x1E0C81028];
            if (!v53 || objc_msgSend(v49, "unsignedIntValue") >= 9)
              goto LABEL_89;
            v55 = objc_msgSend(obja, "length");
            if (v55 >= objc_msgSend(v49, "unsignedIntValue")
              && objc_msgSend(a1, "_compareBytes:FromStart:WithLen:With:", obja, 0, objc_msgSend(v49, "unsignedIntValue"), v53))
            {

              v38 = v89;
              v75 = v92;
              v76 = obja;
              goto LABEL_125;
            }
LABEL_91:

          }
          v43 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
          if (!v43)
          {
LABEL_93:

            break;
          }
        }
      }
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v98 = (id)_apProfileVendorFields;
      v56 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v103, v120, 16);
      if (!v56)
        goto LABEL_121;
      v57 = v56;
      v58 = *(_QWORD *)v104;
      do
      {
        for (k = 0; k != v57; ++k)
        {
          if (*(_QWORD *)v104 != v58)
            objc_enumerationMutation(v98);
          v60 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * k);
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("match_len"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (v61)
          {
            objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("match_len"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("match_len"));
              v63 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v63 = 0;
            }

          }
          else
          {
            v63 = 0;
          }

          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("match_value"));
          v64 = objc_claimAutoreleasedReturnValue();
          if (!v64)
          {
            v67 = 0;
LABEL_116:
            v68 = MEMORY[0x1E0C81028];
LABEL_117:
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
              v125 = 2112;
              v126 = v63;
              v127 = 2112;
              v128 = (uint64_t)v67;
              v129 = 2112;
              v130 = (uint64_t)v60;
              _os_log_impl(&dword_1CC44E000, v68, OS_LOG_TYPE_DEFAULT, "%s - Field has wrong format (missing match_len (%@) and|or match_value (%@) and|or matchLen is larger than 8) - ignoring : %@", buf, 0x2Au);
            }
            goto LABEL_119;
          }
          v65 = (void *)v64;
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("match_value"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("match_value"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v67 = 0;
          }

          if (!v63)
            goto LABEL_116;
          v68 = MEMORY[0x1E0C81028];
          if (!v67 || objc_msgSend(v63, "unsignedIntValue") >= 9)
            goto LABEL_117;
          v69 = objc_msgSend(obja, "length");
          if (v69 >= objc_msgSend(v63, "unsignedIntValue")
            && objc_msgSend(a1, "_compareBytes:FromStart:WithLen:With:", obja, 0, objc_msgSend(v63, "unsignedIntValue"), v67))
          {
            v74 = (void *)objc_opt_new();
            v76 = obja;
            objc_msgSend(a1, "_extractFieldsFor:From:Into:", v60, obja, v74);
            objc_msgSend(v86, "addObject:", v74);

            v38 = v89;
            v75 = v92;
            goto LABEL_125;
          }
LABEL_119:

        }
        v57 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v103, v120, 16);
      }
      while (v57);
LABEL_121:

      v38 = v89;
      v75 = v92;
      v76 = obja;
      if (_apProfileListVendorIEs)
      {
        v70 = objc_retainAutorelease(obja);
        v71 = objc_msgSend(v70, "bytes");
        v72 = objc_msgSend(v70, "length");
        v73 = _apProfileListVendorIEsLen;
        if (v72 < _apProfileListVendorIEsLen)
          v73 = objc_msgSend(v70, "length");
        +[WiFiUsagePrivacyFilter toHEXString:length:](WiFiUsagePrivacyFilter, "toHEXString:length:", v71, v73);
        v98 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "addObject:");
LABEL_125:

      }
    }
    v88 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
  }
  while (v88);
LABEL_128:

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  objc_msgSend(v86, "allObjects");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "sortedArrayUsingSelector:", sel_compare_);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v99, v119, 16);
  if (v79)
  {
    v80 = v79;
    v81 = *(_QWORD *)v100;
    do
    {
      for (m = 0; m != v80; ++m)
      {
        if (*(_QWORD *)v100 != v81)
          objc_enumerationMutation(v78);
        objc_msgSend(v38, "appendFormat:", CFSTR("DD%@"), *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * m));
      }
      v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v99, v119, 16);
    }
    while (v80);
  }

  return v38;
}

+ (void)_saveToUserDefaults:(id)a3 withKey:(id)a4 andValue:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_getDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter reformatMACAddress:](WiFiUsagePrivacyFilter, "reformatMACAddress:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v11, "addEntriesFromDictionary:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v15, CFSTR("apProfileCacheTimestampCreated"));

    objc_msgSend(v11, "setValue:forKey:", _apProfileVersionString, CFSTR("apProfileVersion"));
  }
  objc_msgSend(v11, "setValue:forKey:", v9, v10);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v16, CFSTR("apProfileCacheTimestamp"));

  objc_msgSend(a1, "_getDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter reformatMACAddress:](WiFiUsagePrivacyFilter, "reformatMACAddress:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v11, v18);

}

+ (id)_cachedProfile:(id)a3
{
  return +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", a3, CFSTR("apProfileID"), 0);
}

+ (id)profileFromBeaconData:(id)a3 andParsedIE:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  WiFiUsageParsedBeacon *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  WiFiUsageParsedBeacon *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  WiFiUsageParsedBeacon *v26;
  void *v27;
  _BOOL4 v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  void *v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _BOOL8 v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  WiFiUsageParsedBeacon *v90;
  void *v91;
  id v92;
  void *v93;
  _BYTE buf[22];
  __int16 v95;
  void *v96;
  __int16 v97;
  const __CFString *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7
    || (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BSSID")),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[WiFiUsageAccessPointProfile profileFromBeaconData:andParsedIE:]";
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: no BSSID in ParsedIE", buf, 0xCu);
    }
    v9 = 0;
  }
  if (_apProfileVersion == 1)
  {
    objc_msgSend(a1, "_endPrevAssoc");
    v10 = objc_alloc_init((Class)a1);
    objc_msgSend(v10, "setBssid:", 0);
    objc_msgSend(v10, "setApProfile:", 0);
    if (!v6)
    {
      v20 = 0;
      goto LABEL_59;
    }
    v92 = a1;
    v11 = -[WiFiUsageParsedBeacon initWithBeaconData:andAdditionalMetadata:]([WiFiUsageParsedBeacon alloc], "initWithBeaconData:andAdditionalMetadata:", v6, v8);
    -[WiFiUsageParsedBeacon bssid](v11, "bssid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBssid:", v12);

    -[WiFiUsageParsedBeacon vendorIEList](v11, "vendorIEList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF BEGINSWITH[c] '00:17:F2-6' OR SELF BEGINSWITH[c] '00:17:F2-9'"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v15);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString count](v16, "count"))
    {
      v17 = v11;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "bssid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "+[WiFiUsageAccessPointProfile profileFromBeaconData:andParsedIE:]";
        *(_WORD *)&buf[12] = 2160;
        *(_QWORD *)&buf[14] = 1752392040;
        v95 = 2112;
        v96 = v18;
        v97 = 2112;
        v98 = v16;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: (%{mask.hash}@) contains PersonalHotspotIEs:%@ -- skip", buf, 0x2Au);

      }
      goto LABEL_64;
    }
    -[WiFiUsageParsedBeacon taggedIEList](v11, "taggedIEList");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v21, "allKeysForObject:", MEMORY[0x1E0C9AAA0]);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    -[WiFiUsageParsedBeacon extendedIEList](v11, "extendedIEList");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allKeysForObject:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = -[WiFiUsageParsedBeacon parsingSuccessful](v11, "parsingSuccessful");
    v26 = v11;
    a1 = v92;
    if (!v25 || objc_msgSend(v91, "count") || objc_msgSend(v24, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "bssid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[WiFiUsageParsedBeacon parsingSuccessful](v26, "parsingSuccessful");
        *(_DWORD *)buf = 136316418;
        v29 = CFSTR("NO");
        *(_QWORD *)&buf[4] = "+[WiFiUsageAccessPointProfile profileFromBeaconData:andParsedIE:]";
        *(_WORD *)&buf[12] = 2160;
        *(_QWORD *)&buf[14] = 1752392040;
        v95 = 2112;
        if (v28)
          v29 = CFSTR("YES");
        v96 = v27;
        v97 = 2112;
        v98 = v29;
        v99 = 2112;
        v100 = v91;
        v101 = 2112;
        v102 = v24;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: (%{mask.hash}@) parsingSuccessful: %@ invalidElements:%@ invalidExtElements:%@ -- skip", buf, 0x3Eu);

      }
      if (!+[WiFiUsagePrivacyFilter isInternalInstall](WiFiUsagePrivacyFilter, "isInternalInstall"))
      {
        v45 = 0;
        v20 = 0;
        goto LABEL_58;
      }
    }
    v86 = v24;
    objc_msgSend(v10, "bssid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _cachedProfile:](WiFiUsageAccessPointProfile, "_cachedProfile:", v30);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "bssid");
    v90 = v26;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v31, CFSTR("apProfileBeaconInfoOccurrencies"), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "unsignedIntegerValue");

    objc_msgSend(v10, "bssid");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v34, CFSTR("apProfileCacheTimestamp"), 0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "bssid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v35, CFSTR("apProfile_shortID"), 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v90;
    if (_apProfileVersion == 1)
    {
      +[WiFiUsageAccessPointProfile _toMobileAssetsProfile:](WiFiUsageAccessPointProfile, "_toMobileAssetsProfile:", v90);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setApProfile:", v36);

    }
    objc_msgSend(v10, "apProfile");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
      goto LABEL_27;
    v38 = v37;
    if (v89)
    {
      objc_msgSend(v89, "timeIntervalSinceNow");
      v40 = -v39;
      v41 = *(double *)&_apProfileMinSecsBetweenOccurrencies;

      if (v41 >= v40)
      {
LABEL_27:
        objc_msgSend(v10, "bssid");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "isEqualToString:", v9);

        if (!v43)
        {
          v20 = 0;
LABEL_57:
          v24 = v86;

          v45 = 1;
LABEL_58:

          if (!v45)
          {
LABEL_64:
            v19 = 0;
LABEL_65:

            goto LABEL_66;
          }
LABEL_59:
          if (v8)
            objc_msgSend(a1, "updateWithWPS:", v8);
          if (v20)
            objc_msgSend(a1, "_cleanUpStaleProfiles");
          v19 = v10;
          goto LABEL_65;
        }
        objc_msgSend(v10, "bssid");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:](WiFiUsageAccessPointProfile, "_saveToUserDefaults:withKey:andValue:", v44, CFSTR("apProfileForLatestAssoc"), MEMORY[0x1E0C9AAB0]);
        v20 = 0;
LABEL_56:

        goto LABEL_57;
      }
    }
    else
    {

    }
    objc_msgSend(v10, "apProfile");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "isEqualToString:", v87);

    if (v33
      && (v48 = v33 + v47) != 0
      && v47
      && v88
      && (v49 = objc_msgSend(v88, "length"), v49 == 2 * _shortProfileBytesLen))
    {
      v82 = v48;
      v20 = 0;
    }
    else
    {
      objc_msgSend(v10, "bssid");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("replaced (from %s)"), "+[WiFiUsageAccessPointProfile profileFromBeaconData:andParsedIE:]");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "_submitProfileFor:withCachedDict:AndEraseWithLog:", v50, 0, v51);

      objc_msgSend(v10, "bssid");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "apProfile");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:](WiFiUsageAccessPointProfile, "_saveToUserDefaults:withKey:andValue:", v52, CFSTR("apProfileID"), v53);

      objc_msgSend(v10, "bssid");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "apProfile");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = _shortProfileBytesLen;
      v56 = v54;
      memset(buf, 0, 20);
      v84 = v56;
      if (v56)
      {
        v57 = (void *)MEMORY[0x1E0C99D50];
        v58 = objc_retainAutorelease(v56);
        objc_msgSend(v57, "dataWithBytes:length:", objc_msgSend(v58, "cStringUsingEncoding:", 4), objc_msgSend(v58, "length"));
        v56 = (id)objc_claimAutoreleasedReturnValue();
      }
      v59 = objc_retainAutorelease(v56);
      if (CC_SHA1((const void *)objc_msgSend(v59, "bytes"), objc_msgSend(v59, "length"), buf) == buf)
      {
        +[WiFiUsagePrivacyFilter toHEXString:length:](WiFiUsagePrivacyFilter, "toHEXString:length:", buf, 20);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v60 = 0;
      }
      v61 = 2 * v55;
      if (v61 < objc_msgSend(v60, "length"))
      {
        objc_msgSend(v60, "substringFromIndex:", objc_msgSend(v60, "length") - v61);
        v62 = objc_claimAutoreleasedReturnValue();

        v60 = (void *)v62;
      }

      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:](WiFiUsageAccessPointProfile, "_saveToUserDefaults:withKey:andValue:", v83, CFSTR("apProfile_shortID"), v60);
      objc_msgSend(v10, "bssid");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageParsedBeacon dictionaryRepresentation](v90, "dictionaryRepresentation");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:](WiFiUsageAccessPointProfile, "_saveToUserDefaults:withKey:andValue:", v63, CFSTR("apProfileBeaconInfo"), v64);

      objc_msgSend(v10, "bssid");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:](WiFiUsageAccessPointProfile, "_saveToUserDefaults:withKey:andValue:", v65, CFSTR("apProfileBeaconRaw"), v6);

      v82 = 1;
      v20 = 1;
      a1 = v92;
    }
    objc_msgSend(v10, "bssid");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v66, CFSTR("apProfileBeaconInfo"), 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = v67;
    objc_msgSend(v67, "objectForKey:", CFSTR("apName"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageParsedBeacon apName](v90, "apName");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      v69 = v68;
      if (v93)
      {
        -[WiFiUsageParsedBeacon apName](v90, "apName");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "isEqualToString:", v93);

        if ((v71 & 1) != 0)
          goto LABEL_52;
      }
      else
      {

      }
      objc_msgSend(v10, "bssid");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageParsedBeacon dictionaryRepresentation](v90, "dictionaryRepresentation");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:](WiFiUsageAccessPointProfile, "_saveToUserDefaults:withKey:andValue:", v72, CFSTR("apProfileBeaconInfo"), v73);

      objc_msgSend(v10, "bssid");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:](WiFiUsageAccessPointProfile, "_saveToUserDefaults:withKey:andValue:", v74, CFSTR("apProfileBeaconRaw"), v6);

    }
LABEL_52:
    objc_msgSend(v10, "bssid");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (void *)MEMORY[0x1E0CB37E8];
    v77 = -[WiFiUsageParsedBeacon parsingSuccessful](v90, "parsingSuccessful")
       && !objc_msgSend(v91, "count")
       && objc_msgSend(v86, "count") == 0;
    objc_msgSend(v76, "numberWithBool:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:](WiFiUsageAccessPointProfile, "_saveToUserDefaults:withKey:andValue:", v75, CFSTR("apProfileBeaconInfoParsingSuccessful"), v78);

    objc_msgSend(v10, "bssid");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v82);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:](WiFiUsageAccessPointProfile, "_saveToUserDefaults:withKey:andValue:", v79, CFSTR("apProfileBeaconInfoOccurrencies"), v80);

    v26 = v90;
    v44 = v85;
    goto LABEL_56;
  }
  v19 = 0;
LABEL_66:

  return v19;
}

+ (void)updateWithWPS:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BSSID")), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPS_PROB_RESP_IE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IE_KEY_WPS_PRIMARY_DEV_TYPE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WPS_DEV_TYPE_CAT"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("apProfileWPSDeviceCategory"));

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("WPS_DEV_TYPE_SUB_CAT"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("apProfileWPSDeviceSubcategory"));

      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IE_KEY_WPS_MODEL_NAME"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsagePrivacyFilter reformatMACAddress:](WiFiUsagePrivacyFilter, "reformatMACAddress:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("dropped"), CFSTR("apProfileWPSDeviceModelName"));
      }
      else
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IE_KEY_WPS_MODEL_NAME"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("apProfileWPSDeviceModelName"));

      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IE_KEY_WPS_MODEL_NUM"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsagePrivacyFilter reformatMACAddress:](WiFiUsagePrivacyFilter, "reformatMACAddress:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("dropped"), CFSTR("apProfileWPSDeviceModelNumber"));
      }
      else
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IE_KEY_WPS_MODEL_NUM"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("apProfileWPSDeviceModelNumber"));

      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IE_KEY_WPS_MANUFACTURER"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsagePrivacyFilter reformatMACAddress:](WiFiUsagePrivacyFilter, "reformatMACAddress:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("dropped"), CFSTR("apProfileWPSDeviceManufacturer"));
      }
      else
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("IE_KEY_WPS_MANUFACTURER"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, CFSTR("apProfileWPSDeviceManufacturer"));

      }
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:](WiFiUsageAccessPointProfile, "_saveToUserDefaults:withKey:andValue:", v6, CFSTR("apProfileWPSInfo"), v8);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315138;
    v23 = "+[WiFiUsageAccessPointProfile updateWithWPS:]";
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: no BSSID in ParsedIE", (uint8_t *)&v22, 0xCu);
  }

}

+ (void)updateWithAssocTime:(double)a3 forBssid:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  void *v14;
  BOOL v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v6, CFSTR("apProfileVersion"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v6, CFSTR("apProfileMaxAssocTime"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v6, CFSTR("apProfileForLatestAssoc"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11 && (v12 = (double)v9, (double)v9 <= a3))
    {
      v13 = *(double *)&_apProfileMinAssoc;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (unint64_t)a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_saveToUserDefaults:withKey:andValue:", v6, CFSTR("apProfileMaxAssocTime"), v14);

      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:](WiFiUsageAccessPointProfile, "_saveToUserDefaults:withKey:andValue:", v6, CFSTR("apProfileForLatestAssoc"), MEMORY[0x1E0C9AAA0]);
      v15 = v13 <= v12 || v13 > a3;
      if (!v15
        && objc_msgSend(a1, "_isProfileValidForUse:withCachedDict:", v6, 0)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1, "profileForBSSID:", v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 136316162;
        v18 = "+[WiFiUsageAccessPointProfile updateWithAssocTime:forBssid:]";
        v19 = 2160;
        v20 = 1752392040;
        v21 = 2112;
        v22 = v6;
        v23 = 2160;
        v24 = 1752392040;
        v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: profile for %{mask.hash}@ is valid: %{mask.hash}@", (uint8_t *)&v17, 0x34u);

      }
    }
    else
    {
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:withKey:andValue:](WiFiUsageAccessPointProfile, "_saveToUserDefaults:withKey:andValue:", v6, CFSTR("apProfileForLatestAssoc"), MEMORY[0x1E0C9AAA0]);
    }
  }

}

+ (void)_submitProfileFor:(id)a3 withCachedDict:(id)a4 AndEraseWithLog:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v16;
  unint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v8, CFSTR("apProfileVersion"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_msgSend(a1, "_isProfileValidForUse:withCachedDict:", v8, v9);
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v8, CFSTR("submittedToCA"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    v15 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
    v17 = 0x1E881B000;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v12)
        v18 = &stru_1E881F240;
      else
        v18 = CFSTR("NOT ");
      if (v14)
        v19 = &stru_1E881F240;
      else
        v19 = CFSTR("NOT ");
      if (v14)
        v20 = &stru_1E881F240;
      else
        v20 = CFSTR("-- skip");
      if (((v14 | v12) & 1) == 0)
      {
        if (+[WiFiUsagePrivacyFilter isInternalInstall](WiFiUsagePrivacyFilter, "isInternalInstall"))
          v20 = CFSTR("-- skip");
        else
          v20 = &stru_1E881F240;
      }
      *(_DWORD *)buf = 136316418;
      v29 = "+[WiFiUsageAccessPointProfile _submitProfileFor:withCachedDict:AndEraseWithLog:]";
      v30 = 2112;
      v31 = (uint64_t)v8;
      v32 = 2112;
      v33 = v18;
      v34 = 2112;
      v35 = v19;
      v36 = 2112;
      v37 = v20;
      v38 = 2112;
      v39 = v10;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: profile for %@ is %@valid and %@already sentToCA%@ (%@)", buf, 0x3Eu);
      v17 = 0x1E881B000uLL;
    }

    if ((v14 & 1) == 0 && ((v12 & 1) != 0 || objc_msgSend(*(id *)(v17 + 3104), "isInternalInstall")))
    {
      +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v8, 0, v9);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_saveToUserDefaults:withKey:andValue:", v8, CFSTR("submittedToCA"), v22);

        if (v10)
        {
          -[__CFString componentsSeparatedByString:](v10, "componentsSeparatedByString:", CFSTR("("));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setValue:forKey:", v24, CFSTR("reasonForSending"));

        }
        v21 = v21;
        AnalyticsSendEventLazy();

      }
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(a1, "_getDefaults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v17 + 3104), "reformatMACAddress:", v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeObjectForKey:", v26);

    if (v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v17 + 3104), "reformatMACAddress:", v8);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v29 = "+[WiFiUsageAccessPointProfile _submitProfileFor:withCachedDict:AndEraseWithLog:]";
      v30 = 2160;
      v31 = 1752392040;
      v32 = 2112;
      v33 = v27;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: removed %{mask.hash}@ from defaults: %@", buf, 0x2Au);

    }
  }
  else
  {
    v21 = 0;
  }

}

id __80__WiFiUsageAccessPointProfile__submitProfileFor_withCachedDict_AndEraseWithLog___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)_getBinTimeInterval:(double)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", (unint64_t)a3, &unk_1E8864298, CFSTR("0"), a4);
}

+ (BOOL)_isProfileValidForUse:(id)a3 withCachedDict:(id)a4
{
  return objc_msgSend(a1, "_isProfileValidForUse:withCachedDict:onlyIfCurrent:", a3, a4, 0);
}

+ (id)longProfileForBSSID:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "_isProfileValidForUse:withCachedDict:", v4, 0);
  v6 = 0;
  if (v5)
  {
    +[WiFiUsageAccessPointProfile _cachedProfile:](WiFiUsageAccessPointProfile, "_cachedProfile:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), _apProfileVersionString, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)shortProfileForBSSID:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "_isProfileValidForUse:withCachedDict:", v4, 0);
  v6 = 0;
  if (v5)
  {
    +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", v4, CFSTR("apProfile_shortID"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), _apProfileVersionString, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)beaconsAndWPSInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_getDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (id)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
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
        v9 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        +[WiFiUsagePrivacyFilter reformatMACAddress:](WiFiUsagePrivacyFilter, "reformatMACAddress:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = (void *)objc_opt_new();
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_loadFromUserDefaults:withKey:withCachedData:", v9, CFSTR("apProfileBeaconInfo"), v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", CFSTR("BeaconInformationElement_0"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "setBssid:", v9);
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_loadFromUserDefaults:withKey:withCachedData:", v9, CFSTR("apProfileBeaconRaw"), v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setBeacon:", v16);

          if (v14)
          {
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v14, 4);
            objc_msgSend(v11, "setSsid:", v17);

          }
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_loadFromUserDefaults:withKey:withCachedData:", v9, CFSTR("apProfileWPSInfo"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setApProfileWPSInfo:", v19);

          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_loadFromUserDefaults:withKey:withCachedData:", v9, CFSTR("apProfileVersion"), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setApProfileVersion:", v21);

          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_loadFromUserDefaults:withKey:withCachedData:", v9, CFSTR("apProfileID"), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setApProfileID:", v23);

          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_loadFromUserDefaults:withKey:withCachedData:", v9, CFSTR("apProfile_shortID"), v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setApProfile_shortID:", v25);

          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_loadFromUserDefaults:withKey:withCachedData:", v9, CFSTR("apProfileCacheTimestampCreated"), v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 && v27)
            objc_msgSend(v29, "setObject:forKey:", v11, v27);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v6);
  }

  return v29;
}

+ (id)apNameForBSSID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:](WiFiUsageAccessPointProfile, "_loadFromUserDefaults:withKey:withCachedData:", a3, CFSTR("apProfileBeaconInfo"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("apName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
  objc_storeStrong((id *)&self->_bssid, a3);
}

- (NSString)apProfile
{
  return self->_apProfile;
}

- (void)setApProfile:(id)a3
{
  objc_storeStrong((id *)&self->_apProfile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apProfile, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
}

@end
