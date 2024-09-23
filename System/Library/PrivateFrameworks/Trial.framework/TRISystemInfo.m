@implementation TRISystemInfo

+ (id)_persistentSystemInfoPath
{
  void *v2;
  void *v3;

  +[TRIStandardPaths sharedSystemPaths](TRIStandardPaths, "sharedSystemPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemDataFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)info
{
  void *v3;

  objc_msgSend(a1, "loadSystemInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (+[TRIProcessInfo hostingProcessIsTriald](TRIProcessInfo, "hostingProcessIsTriald"))
    {
      objc_msgSend(a1, "createSystemInfoWithFactorProvider:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

+ (id)loadSystemInfo
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_persistentSystemInfoPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemInfoFromFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)systemInfoFromFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v3))
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v3, 2, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (v5)
    {
      v10 = v6;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v6 = v10;
    }
    else
    {
      TRILogCategory_ClientFramework();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v3;
        v14 = 2112;
        v15 = v6;
        _os_log_error_impl(&dword_19B89C000, v8, OS_LOG_TYPE_ERROR, "failed to read system info from file %@: %@", buf, 0x16u);
      }
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)createSystemInfoWithFactorProvider:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[TRISystemInfo initFromSystemWithFactorProvider:]([TRISystemInfo alloc], "initFromSystemWithFactorProvider:", v3);

  return v4;
}

- (id)initFromSystemWithFactorProvider:(id)a3
{
  TRISystemInfo *v3;
  uint64_t v4;
  NSArray *enabledInputModeIdentifiers;
  uint64_t v6;
  NSString *carrierBundleIdentifier;
  uint64_t v8;
  NSString *carrierCountryIsoCode;
  uint64_t v10;
  NSString *iCloudIdentifier;
  uint64_t v12;
  NSString *aneVersion;
  uint64_t v14;
  NSString *siriUserActivitySegment;
  uint64_t v16;
  NSDate *siriDeviceAggregationIdRotationDate;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TRISystemInfo;
  v3 = -[TRISystemInfo init](&v19, sel_init, a3);
  if (v3)
  {
    v3->_isEnrolledInBetaProgram = objc_msgSend((id)objc_opt_class(), "_sysIsEnrolledInBetaProgram");
    objc_msgSend((id)objc_opt_class(), "_sysEnabledInputModeIdentifiers");
    v4 = objc_claimAutoreleasedReturnValue();
    enabledInputModeIdentifiers = v3->_enabledInputModeIdentifiers;
    v3->_enabledInputModeIdentifiers = (NSArray *)v4;

    objc_msgSend((id)objc_opt_class(), "_carrierBundleIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    carrierBundleIdentifier = v3->_carrierBundleIdentifier;
    v3->_carrierBundleIdentifier = (NSString *)v6;

    objc_msgSend((id)objc_opt_class(), "_carrierCountryIsoCode");
    v8 = objc_claimAutoreleasedReturnValue();
    carrierCountryIsoCode = v3->_carrierCountryIsoCode;
    v3->_carrierCountryIsoCode = (NSString *)v8;

    objc_msgSend((id)objc_opt_class(), "_iCloudIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    iCloudIdentifier = v3->_iCloudIdentifier;
    v3->_iCloudIdentifier = (NSString *)v10;

    v3->_isDiagnosticsAndUsageEnabled = objc_msgSend((id)objc_opt_class(), "_isDiagnosticsAndUsageEnabled");
    v3->_hasAne = objc_msgSend((id)objc_opt_class(), "_hasAne");
    objc_msgSend((id)objc_opt_class(), "_aneVersion");
    v12 = objc_claimAutoreleasedReturnValue();
    aneVersion = v3->_aneVersion;
    v3->_aneVersion = (NSString *)v12;

    v3->_isAutomatedTestDevice = objc_msgSend((id)objc_opt_class(), "_isAutomatedTestDevice");
    objc_msgSend((id)objc_opt_class(), "_siriUserActivitySegment");
    v14 = objc_claimAutoreleasedReturnValue();
    siriUserActivitySegment = v3->_siriUserActivitySegment;
    v3->_siriUserActivitySegment = (NSString *)v14;

    -[TRISystemInfo _getSiriDeviceAggregationIdRotationDate](v3, "_getSiriDeviceAggregationIdRotationDate");
    v16 = objc_claimAutoreleasedReturnValue();
    siriDeviceAggregationIdRotationDate = v3->_siriDeviceAggregationIdRotationDate;
    v3->_siriDeviceAggregationIdRotationDate = (NSDate *)v16;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRISystemInfo)initWithCoder:(id)a3
{
  id v4;
  TRISystemInfo *v5;
  void *v6;
  uint64_t v7;
  NSString *carrierBundleIdentifier;
  uint64_t v9;
  NSString *carrierCountryIsoCode;
  uint64_t v11;
  NSString *iCloudIdentifier;
  uint64_t v13;
  NSString *aneVersion;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *enabledInputModeIdentifiers;
  int v20;
  int v21;
  int v22;
  NSObject *v23;
  NSArray *v24;
  uint64_t v25;
  NSString *siriUserActivitySegment;
  uint64_t v27;
  NSDate *siriDeviceAggregationIdRotationDate;
  uint8_t buf[16];
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)TRISystemInfo;
  v5 = -[TRISystemInfo init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isBetaUser"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isEnrolledInBetaProgram = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrierBundleIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    carrierBundleIdentifier = v5->_carrierBundleIdentifier;
    v5->_carrierBundleIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrierCountryIsoCode"));
    v9 = objc_claimAutoreleasedReturnValue();
    carrierCountryIsoCode = v5->_carrierCountryIsoCode;
    v5->_carrierCountryIsoCode = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    iCloudIdentifier = v5->_iCloudIdentifier;
    v5->_iCloudIdentifier = (NSString *)v11;

    v5->_isDiagnosticsAndUsageEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDiagnosticsAndUsageEnabled"));
    v5->_hasAne = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAne"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aneVersion"));
    v13 = objc_claimAutoreleasedReturnValue();
    aneVersion = v5->_aneVersion;
    v5->_aneVersion = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("enabledInputModeIdentifiers"));
    v18 = objc_claimAutoreleasedReturnValue();
    enabledInputModeIdentifiers = v5->_enabledInputModeIdentifiers;
    v5->_enabledInputModeIdentifiers = (NSArray *)v18;

    v20 = objc_msgSend(v4, "containsValueForKey:", CFSTR("logUserSettingsRegionCode"));
    if (v20)
      LOBYTE(v20) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("logUserSettingsRegionCode"));
    v5->_logUserSettingsRegionCode = v20;
    v21 = objc_msgSend(v4, "containsValueForKey:", CFSTR("logUserSettingsLanguageCode"));
    if (v21)
      LOBYTE(v21) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("logUserSettingsLanguageCode"));
    v5->_logUserSettingsLanguageCode = v21;
    v22 = objc_msgSend(v4, "containsValueForKey:", CFSTR("logUserKeyboardEnabledInputMode"));
    if (v22)
      LOBYTE(v22) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("logUserKeyboardEnabledInputMode"));
    v5->_logUserKeyboardEnabledInputMode = v22;
    if (!v5->_enabledInputModeIdentifiers)
    {
      TRILogCategory_ClientFramework();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19B89C000, v23, OS_LOG_TYPE_ERROR, "initWithCoder: enabledInputModeIdentifiers is nil", buf, 2u);
      }

      v24 = v5->_enabledInputModeIdentifiers;
      v5->_enabledInputModeIdentifiers = (NSArray *)MEMORY[0x1E0C9AA60];

    }
    v5->_isAutomatedTestDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAutomatedTestDevice"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriUserActivitySegment"));
    v25 = objc_claimAutoreleasedReturnValue();
    siriUserActivitySegment = v5->_siriUserActivitySegment;
    v5->_siriUserActivitySegment = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("siriDeviceAggregationIdRotationDate"));
    v27 = objc_claimAutoreleasedReturnValue();
    siriDeviceAggregationIdRotationDate = v5->_siriDeviceAggregationIdRotationDate;
    v5->_siriDeviceAggregationIdRotationDate = (NSDate *)v27;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];

  v4 = a3;
  -[TRISystemInfo enabledInputModeIdentifiers](self, "enabledInputModeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    TRILogCategory_ClientFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_error_impl(&dword_19B89C000, v6, OS_LOG_TYPE_ERROR, "encodeWithCoder: enabledInputModeIdentifiers is nil", v17, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TRISystemInfo isEnrolledInBetaProgram](self, "isEnrolledInBetaProgram"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("isBetaUser"));

  -[TRISystemInfo carrierBundleIdentifier](self, "carrierBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("carrierBundleIdentifier"));

  -[TRISystemInfo carrierCountryIsoCode](self, "carrierCountryIsoCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("carrierCountryIsoCode"));

  objc_msgSend(v4, "encodeBool:forKey:", -[TRISystemInfo isDiagnosticsAndUsageEnabled](self, "isDiagnosticsAndUsageEnabled"), CFSTR("isDiagnosticsAndUsageEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TRISystemInfo hasAne](self, "hasAne"), CFSTR("hasAne"));
  -[TRISystemInfo aneVersion](self, "aneVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("aneVersion"));

  -[TRISystemInfo enabledInputModeIdentifiers](self, "enabledInputModeIdentifiers");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = v11;
  else
    v13 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("enabledInputModeIdentifiers"));

  objc_msgSend(v4, "encodeBool:forKey:", -[TRISystemInfo logUserSettingsRegionCode](self, "logUserSettingsRegionCode"), CFSTR("logUserSettingsRegionCode"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TRISystemInfo logUserSettingsLanguageCode](self, "logUserSettingsLanguageCode"), CFSTR("logUserSettingsLanguageCode"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TRISystemInfo logUserKeyboardEnabledInputMode](self, "logUserKeyboardEnabledInputMode"), CFSTR("logUserKeyboardEnabledInputMode"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TRISystemInfo isAutomatedTestDevice](self, "isAutomatedTestDevice"), CFSTR("isAutomatedTestDevice"));
  -[TRISystemInfo siriUserActivitySegment](self, "siriUserActivitySegment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("SiriUserActivitySegment"));

  -[TRISystemInfo siriDeviceAggregationIdRotationDate](self, "siriDeviceAggregationIdRotationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("siriDeviceAggregationIdRotationDate"));

  -[TRISystemInfo iCloudIdentifier](self, "iCloudIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("cloudIdentifier"));

}

- (BOOL)save
{
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_persistentSystemInfoPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TRISystemInfo saveToFile:](self, "saveToFile:", v3);

  return (char)self;
}

- (BOOL)saveToFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  char v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;
  if (!v5)
  {
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      v13 = "failed to encode system info -- %@";
      v14 = v12;
      v15 = 12;
      goto LABEL_8;
    }
LABEL_12:

    v10 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v6;
  objc_msgSend(v7, "triCreateDirectoryForPath:isDirectory:error:", v4, 0, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;

  if (!v8)
  {
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v4;
      v22 = 2112;
      v23 = v9;
      _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, "failed to create directory for path %@ -- %@", buf, 0x16u);
    }
    v6 = v9;
    goto LABEL_12;
  }
  v17 = v9;
  v10 = 1;
  v11 = objc_msgSend(v5, "writeToFile:options:error:", v4, 1, &v17);
  v6 = v17;

  if ((v11 & 1) == 0)
  {
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v4;
      v22 = 2112;
      v23 = v6;
      v13 = "failed to write system info to path %@ -- %@";
      v14 = v12;
      v15 = 22;
LABEL_8:
      _os_log_error_impl(&dword_19B89C000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:

  return v10;
}

- (id)externalParamManager
{
  if (qword_1ECED7DC8 != -1)
    dispatch_once(&qword_1ECED7DC8, &__block_literal_global_10);
  return (id)qword_1ECED7DC0;
}

void __37__TRISystemInfo_externalParamManager__block_invoke()
{
  void *v0;
  TRIExternalParameterManager *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  v1 = objc_alloc_init(TRIExternalParameterManager);
  v2 = (void *)qword_1ECED7DC0;
  qword_1ECED7DC0 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (id)_getSiriDeviceAggregationIdRotationDate
{
  void *v2;
  void *v3;

  -[TRISystemInfo externalParamManager](self, "externalParamManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriDeviceAggregationIdRotationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)_isSeedBuild
{
  return 0;
}

+ (BOOL)_sysIsEnrolledInBetaProgram
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  uint8_t *v6;
  __int16 v8;
  __int16 v9;

  v2 = objc_msgSend(a1, "_isSeedBuild");
  TRILogCategory_ClientFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v9 = 0;
      v5 = "RC_SEED_BUILD is true. Considering device as enrolled in beta program";
      v6 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_19B89C000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    v8 = 0;
    v5 = "RC_SEED_BUILD is false. Not considering device as enrolled in beta program";
    v6 = (uint8_t *)&v8;
    goto LABEL_6;
  }

  return v2;
}

+ (id)_sysEnabledInputModeIdentifiers
{
  void *v4;
  id v5;
  _QWORD v7[6];

  v4 = (void *)MEMORY[0x1A1AC6B8C]();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__TRISystemInfo__sysEnabledInputModeIdentifiers__block_invoke;
  v7[3] = &__block_descriptor_48_e5_v8__0l;
  v7[4] = a2;
  v7[5] = a1;
  if (qword_1ECED7DD8 != -1)
    dispatch_once(&qword_1ECED7DD8, v7);
  v5 = (id)qword_1ECED7DD0;
  objc_autoreleasePoolPop(v4);
  return v5;
}

void __48__TRISystemInfo__sysEnabledInputModeIdentifiers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v2 = (void *)MEMORY[0x1A1AC6B8C]();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v3 = (void *)qword_1ECED7E00;
  v21 = qword_1ECED7E00;
  v4 = MEMORY[0x1E0C809B0];
  if (!qword_1ECED7E00)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __getTIInputModeControllerClass_block_invoke;
    v17[3] = &unk_1E3BFF5D0;
    v17[4] = &v18;
    __getTIInputModeControllerClass_block_invoke((uint64_t)v17);
    v3 = (void *)v19[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v18, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("TRISystemInfo.m"), 243, CFSTR("Unable to load soft-linked TIInputModeController class"));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "enabledInputModeIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  v13 = 3221225472;
  v14 = __48__TRISystemInfo__sysEnabledInputModeIdentifiers__block_invoke_2;
  v15 = &unk_1E3BFF528;
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v8 = v16;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v12);
  v9 = objc_msgSend(v8, "copy", v12, v13, v14, v15);

  v10 = (void *)qword_1ECED7DD0;
  qword_1ECED7DD0 = v9;

  objc_autoreleasePoolPop(v2);
}

void __48__TRISystemInfo__sysEnabledInputModeIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3900];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

  v6 = objc_alloc_init(MEMORY[0x1E0CB3940]);
  v8 = v6;
  objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("@"), &v8);
  v7 = v8;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
}

+ (id)_carrierBundleIdentifier
{
  void *v2;
  void *v3;

  +[TRICellularParameterManager sharedInstance](TRICellularParameterManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "carrierBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_carrierCountryIsoCode
{
  void *v2;
  void *v3;

  +[TRICellularParameterManager sharedInstance](TRICellularParameterManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "carrierCountryIsoCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_iCloudIdentifier
{
  double v2;
  double Helper_x8__OBJC_CLASS___ACAccountStore;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  Helper_x8__OBJC_CLASS___ACAccountStore = gotLoadHelper_x8__OBJC_CLASS___ACAccountStore(v2);
  objc_msgSend(*(id *)(v4 + 696), "defaultStore", Helper_x8__OBJC_CLASS___ACAccountStore);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_ClientFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "aa_primaryAppleAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_19B89C000, v6, OS_LOG_TYPE_DEFAULT, "Updating iCloudID using Alt. DSID of account: %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aa_altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)_isDiagnosticsAndUsageEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "optInApple");

  return v3;
}

+ (BOOL)_hasAne
{
  void *v2;
  char v3;

  v2 = (void *)MEMORY[0x1A1AC6B8C](a1, a2);
  if (qword_1ECED7DE0 != -1)
    dispatch_once(&qword_1ECED7DE0, &__block_literal_global_73);
  v3 = _MergedGlobals_9;
  objc_autoreleasePoolPop(v2);
  return v3;
}

void __24__TRISystemInfo__hasAne__block_invoke()
{
  void *v0;
  id ANEDeviceInfoClass;
  NSObject *v2;
  uint8_t v3[16];

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  ANEDeviceInfoClass = get_ANEDeviceInfoClass();
  if (!ANEDeviceInfoClass)
  {
    TRILogCategory_ClientFramework();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_error_impl(&dword_19B89C000, v2, OS_LOG_TYPE_ERROR, "Unable to load soft-linked _ANEDeviceInfo class", v3, 2u);
    }

  }
  _MergedGlobals_9 = objc_msgSend(ANEDeviceInfoClass, "hasANE");
  objc_autoreleasePoolPop(v0);
}

+ (id)_aneVersion
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1A1AC6B8C](a1, a2);
  if (qword_1ECED7DF0 != -1)
    dispatch_once(&qword_1ECED7DF0, &__block_literal_global_74);
  v3 = (id)qword_1ECED7DE8;
  objc_autoreleasePoolPop(v2);
  return v3;
}

void __28__TRISystemInfo__aneVersion__block_invoke()
{
  void *v0;
  id ANEDeviceInfoClass;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  ANEDeviceInfoClass = get_ANEDeviceInfoClass();
  if (!ANEDeviceInfoClass)
  {
    TRILogCategory_ClientFramework();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_19B89C000, v2, OS_LOG_TYPE_ERROR, "Unable to load soft-linked _ANEDeviceInfo class", v5, 2u);
    }

  }
  objc_msgSend(ANEDeviceInfoClass, "aneSubType");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ECED7DE8;
  qword_1ECED7DE8 = v3;

  objc_autoreleasePoolPop(v0);
}

+ (BOOL)_isAutomatedTestDevice
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D64EE0], "automatedDeviceGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = objc_msgSend(a1, "_isVirtualMachine");

  return v4;
}

+ (BOOL)_isVirtualMachine
{
  if (qword_1ECED7DF8 != -1)
    dispatch_once(&qword_1ECED7DF8, &__block_literal_global_75);
  return dword_1ECED7DBC != 0;
}

void __34__TRISystemInfo__isVirtualMachine__block_invoke()
{
  void *v0;
  int v1;
  int v2;
  NSObject *v3;
  size_t v4;
  int v5;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  v5 = 0;
  v4 = 4;
  v1 = sysctlbyname("kern.hv_vmm_present", &v5, &v4, 0, 0);
  if (v1)
  {
    v2 = v1;
    TRILogCategory_ClientFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v7 = v2;
      _os_log_error_impl(&dword_19B89C000, v3, OS_LOG_TYPE_ERROR, "Unable to read 'kern.hv_vmm_present' code: %d", buf, 8u);
    }

  }
  dword_1ECED7DBC = v5 != 0;
  objc_autoreleasePoolPop(v0);
}

+ (id)_siriUserActivitySegment
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  __CFString *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.siri.userfeedbacklearning"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Segment/SegmentStore.plist"));
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject path](v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((objc_msgSend(v2, "fileExistsAtPath:", v6) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v5);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("activitySegment"));
          v9 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = v9;
            v10 = (__CFString *)v9;
LABEL_20:

            goto LABEL_21;
          }
          TRILogCategory_ClientFramework();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v16) = 0;
            _os_log_error_impl(&dword_19B89C000, v14, OS_LOG_TYPE_ERROR, "Error: The activitySegment in the plist is not a string.", (uint8_t *)&v16, 2u);
          }

        }
        else
        {
          TRILogCategory_ClientFramework();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v16 = 138412290;
            v17 = (const __CFString *)v5;
            _os_log_error_impl(&dword_19B89C000, v9, OS_LOG_TYPE_ERROR, "Error: Failed to read the plist dictionary from %@", (uint8_t *)&v16, 0xCu);
          }
        }
        v10 = CFSTR("unknown");
        goto LABEL_20;
      }
      TRILogCategory_ClientFramework();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_13:
        v10 = CFSTR("unknown");
LABEL_21:

        goto LABEL_22;
      }
      LOWORD(v16) = 0;
      v11 = "Error: SegmentStore.plist does not exist at the expected location.";
      v12 = v8;
      v13 = 2;
    }
    else
    {
      TRILogCategory_ClientFramework();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v16 = 138412290;
      v17 = CFSTR("group.com.apple.siri.userfeedbacklearning");
      v11 = "Error: Failed to create the plist path for the app group identifier: %@";
      v12 = v8;
      v13 = 12;
    }
    _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v16, v13);
    goto LABEL_13;
  }
  TRILogCategory_ClientFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v16 = 138412290;
    v17 = CFSTR("group.com.apple.siri.userfeedbacklearning");
    _os_log_error_impl(&dword_19B89C000, v5, OS_LOG_TYPE_ERROR, "Error: Failed to retrieve the container URL for the app group identifier: %@", (uint8_t *)&v16, 0xCu);
  }
  v10 = CFSTR("unknown");
LABEL_22:

  return v10;
}

- (BOOL)isEnrolledInBetaProgram
{
  return self->_isEnrolledInBetaProgram;
}

- (void)setIsEnrolledInBetaProgram:(BOOL)a3
{
  self->_isEnrolledInBetaProgram = a3;
}

- (NSArray)enabledInputModeIdentifiers
{
  return self->_enabledInputModeIdentifiers;
}

- (void)setEnabledInputModeIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_enabledInputModeIdentifiers, a3);
}

- (BOOL)logUserSettingsLanguageCode
{
  return self->_logUserSettingsLanguageCode;
}

- (void)setLogUserSettingsLanguageCode:(BOOL)a3
{
  self->_logUserSettingsLanguageCode = a3;
}

- (BOOL)logUserSettingsRegionCode
{
  return self->_logUserSettingsRegionCode;
}

- (void)setLogUserSettingsRegionCode:(BOOL)a3
{
  self->_logUserSettingsRegionCode = a3;
}

- (BOOL)logUserKeyboardEnabledInputMode
{
  return self->_logUserKeyboardEnabledInputMode;
}

- (void)setLogUserKeyboardEnabledInputMode:(BOOL)a3
{
  self->_logUserKeyboardEnabledInputMode = a3;
}

- (NSString)carrierBundleIdentifier
{
  return self->_carrierBundleIdentifier;
}

- (void)setCarrierBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_carrierBundleIdentifier, a3);
}

- (NSString)carrierCountryIsoCode
{
  return self->_carrierCountryIsoCode;
}

- (void)setCarrierCountryIsoCode:(id)a3
{
  objc_storeStrong((id *)&self->_carrierCountryIsoCode, a3);
}

- (BOOL)isDiagnosticsAndUsageEnabled
{
  return self->_isDiagnosticsAndUsageEnabled;
}

- (void)setIsDiagnosticsAndUsageEnabled:(BOOL)a3
{
  self->_isDiagnosticsAndUsageEnabled = a3;
}

- (BOOL)hasAne
{
  return self->_hasAne;
}

- (void)setHasAne:(BOOL)a3
{
  self->_hasAne = a3;
}

- (NSString)aneVersion
{
  return self->_aneVersion;
}

- (void)setAneVersion:(id)a3
{
  objc_storeStrong((id *)&self->_aneVersion, a3);
}

- (BOOL)isAutomatedTestDevice
{
  return self->_isAutomatedTestDevice;
}

- (void)setIsAutomatedTestDevice:(BOOL)a3
{
  self->_isAutomatedTestDevice = a3;
}

- (NSString)siriUserActivitySegment
{
  return self->_siriUserActivitySegment;
}

- (void)setSiriUserActivitySegment:(id)a3
{
  objc_storeStrong((id *)&self->_siriUserActivitySegment, a3);
}

- (NSDate)siriDeviceAggregationIdRotationDate
{
  return self->_siriDeviceAggregationIdRotationDate;
}

- (void)setSiriDeviceAggregationIdRotationDate:(id)a3
{
  objc_storeStrong((id *)&self->_siriDeviceAggregationIdRotationDate, a3);
}

- (NSString)iCloudIdentifier
{
  return self->_iCloudIdentifier;
}

- (void)setICloudIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_siriDeviceAggregationIdRotationDate, 0);
  objc_storeStrong((id *)&self->_siriUserActivitySegment, 0);
  objc_storeStrong((id *)&self->_aneVersion, 0);
  objc_storeStrong((id *)&self->_carrierCountryIsoCode, 0);
  objc_storeStrong((id *)&self->_carrierBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_enabledInputModeIdentifiers, 0);
}

@end
