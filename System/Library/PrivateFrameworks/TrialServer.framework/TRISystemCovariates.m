@implementation TRISystemCovariates

- (TRISystemCovariates)initWithPaths:(id)a3
{
  id v4;
  TRISystemCovariates *v5;
  uint64_t v6;
  TRISystemConfiguration *sysConfig;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRISystemCovariates;
  v5 = -[TRISystemCovariates init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B90]), "initWithPaths:", v4);
    sysConfig = v5->_sysConfig;
    v5->_sysConfig = (TRISystemConfiguration *)v6;

  }
  return v5;
}

- (id)tri_contextValueWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[TRISystemCovariates dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The system covariates do not contain the key %@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exceptionWithName:reason:userInfo:", CFSTR("KeyNotFoundException"), v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v10);
  }

  return v6;
}

- (id)dictionary
{
  TRISystemCovariates *v2;
  NSDictionary *dictionary;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  NSDictionary *v8;
  NSDictionary *v9;
  NSDictionary *v10;
  TRISystemConfiguration *sysConfig;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDictionary *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[28];
  _QWORD v54[30];

  v54[28] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  dictionary = v2->_dictionary;
  if (dictionary)
  {
LABEL_21:
    v10 = dictionary;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternalBuild");

  if (!v5)
  {
LABEL_6:
    v51 = 0;
    v52 = 0;
    v50 = 0;
    sysConfig = v2->_sysConfig;
    if (sysConfig)
    {
      -[TRISystemConfiguration marketingOSVersion](sysConfig, "marketingOSVersion");
      sysConfig = v2->_sysConfig;
    }
    v53[0] = CFSTR("OS");
    -[TRISystemConfiguration osType](sysConfig, "osType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v12;
    v53[1] = CFSTR("OSBuild");
    -[TRISystemConfiguration osBuild](v2->_sysConfig, "osBuild");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v49;
    v53[2] = CFSTR("DeviceModelCode");
    -[TRISystemConfiguration deviceModelCode](v2->_sysConfig, "deviceModelCode");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v48;
    v53[3] = CFSTR("DeviceClass");
    -[TRISystemConfiguration deviceClass](v2->_sysConfig, "deviceClass");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v54[3] = v47;
    v53[4] = CFSTR("DeviceId");
    -[TRISystemConfiguration deviceId](v2->_sysConfig, "deviceId");
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = v46;
    if (!v46)
      v13 = &stru_1E9336E60;
    v54[4] = v13;
    v53[5] = CFSTR("iCloudId");
    -[TRISystemConfiguration iCloudId](v2->_sysConfig, "iCloudId");
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = v45;
    if (!v45)
      v14 = &stru_1E9336E60;
    v54[5] = v14;
    v53[6] = CFSTR("DeviceLocale");
    -[TRISystemConfiguration userSettingsLanguageCode](v2->_sysConfig, "userSettingsLanguageCode");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v54[6] = v44;
    v53[7] = CFSTR("IsInternalBuild");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TRISystemConfiguration isInternalBuild](v2->_sysConfig, "isInternalBuild"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v54[7] = v43;
    v53[8] = CFSTR("IsBetaBuild");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TRISystemConfiguration isBetaBuild](v2->_sysConfig, "isBetaBuild"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v54[8] = v42;
    v53[9] = CFSTR("IsBetaUser");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TRISystemConfiguration isBetaUserWithIsStale:](v2->_sysConfig, "isBetaUserWithIsStale:", 0));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v54[9] = v41;
    v53[10] = CFSTR("UserSettingsLanguageCode");
    -[TRISystemConfiguration userSettingsLanguageCode](v2->_sysConfig, "userSettingsLanguageCode");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v54[10] = v40;
    v53[11] = CFSTR("UserSettingsRegionCode");
    -[TRISystemConfiguration userSettingsRegionCode](v2->_sysConfig, "userSettingsRegionCode");
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = v39;
    if (!v39)
      v15 = &stru_1E9336E60;
    v54[11] = v15;
    v53[12] = CFSTR("UserKeyboardEnabledInputModeIdentifiers");
    -[TRISystemConfiguration enabledInputModeIdentifiers](v2->_sysConfig, "enabledInputModeIdentifiers");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v54[12] = v38;
    v53[13] = CFSTR("MarketingOSMajor");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v50);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v54[13] = v37;
    v53[14] = CFSTR("MarketingOSMinor");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v51);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v54[14] = v36;
    v53[15] = CFSTR("MarketingOSPatch");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v52);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v54[15] = v35;
    v53[16] = CFSTR("TrialVersionTag");
    -[TRISystemConfiguration trialVersionTag](v2->_sysConfig, "trialVersionTag");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v54[16] = v34;
    v53[17] = CFSTR("TrialVersionMajor");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TRISystemConfiguration trialVersionMajor](v2->_sysConfig, "trialVersionMajor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v54[17] = v33;
    v53[18] = CFSTR("TrialVersionMinor");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TRISystemConfiguration trialVersionMinor](v2->_sysConfig, "trialVersionMinor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v54[18] = v32;
    v53[19] = CFSTR("UserSettingsSiriLocale");
    -[TRISystemConfiguration userSettingsSiriLocale](v2->_sysConfig, "userSettingsSiriLocale");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (const __CFString *)v16;
    else
      v18 = &stru_1E9336E60;
    v54[19] = v18;
    v53[20] = CFSTR("BCP47DeviceLocale");
    -[TRISystemConfiguration userSettingsBCP47DeviceLocale](v2->_sysConfig, "userSettingsBCP47DeviceLocale");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v54[20] = v31;
    v53[21] = CFSTR("CarrierBundleIdentifier");
    -[TRISystemConfiguration carrierBundleIdentifier](v2->_sysConfig, "carrierBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v54[21] = v19;
    v53[22] = CFSTR("CarrierCountryIsoCode");
    -[TRISystemConfiguration carrierCountryIsoCode](v2->_sysConfig, "carrierCountryIsoCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v54[22] = v20;
    v53[23] = CFSTR("DiagnosticsUsageEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TRISystemConfiguration isDiagnosticsAndUsageEnabled](v2->_sysConfig, "isDiagnosticsAndUsageEnabled"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v54[23] = v21;
    v53[24] = CFSTR("HasANE");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TRISystemConfiguration hasAne](v2->_sysConfig, "hasAne"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v54[24] = v22;
    v53[25] = CFSTR("ANEVersion");
    -[TRISystemConfiguration aneVersion](v2->_sysConfig, "aneVersion");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
      v25 = (const __CFString *)v23;
    else
      v25 = &stru_1E9336E60;
    v54[25] = v25;
    v53[26] = CFSTR("IsAutomatedTestDevice");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TRISystemConfiguration isAutomatedTestDevice](v2->_sysConfig, "isAutomatedTestDevice"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v54[26] = v26;
    v53[27] = CFSTR("SiriUserActivitySegment");
    -[TRISystemConfiguration siriUserActivitySegment](v2->_sysConfig, "siriUserActivitySegment");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v54[27] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 28);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v2->_dictionary;
    v2->_dictionary = (NSDictionary *)v28;

    dictionary = v2->_dictionary;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("systemCovariatesOverride"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v2->_dictionary;
  v2->_dictionary = (NSDictionary *)v7;

  v9 = v2->_dictionary;
  if (!v9)
  {

    goto LABEL_6;
  }
  v10 = v9;

LABEL_22:
  objc_sync_exit(v2);

  return v10;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TRISystemCovariates dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_sysConfig, 0);
}

@end
