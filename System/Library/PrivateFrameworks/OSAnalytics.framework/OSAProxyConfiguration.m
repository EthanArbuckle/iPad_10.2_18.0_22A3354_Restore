@implementation OSAProxyConfiguration

- (id)init:(id)a3 fromMetadata:(id)a4
{
  id v7;
  id v8;
  OSAProxyConfiguration *v9;
  uint64_t v10;
  NSString *logPath;
  uint64_t v12;
  NSString *modelCode;
  uint64_t v14;
  NSString *productVersion;
  uint64_t v16;
  NSString *osTrain;
  uint64_t v18;
  NSString *targetAudience;
  uint64_t v20;
  NSString *buildVersion;
  uint64_t v22;
  NSString *uiCountryCode;
  uint64_t v24;
  NSString *systemId;
  uint64_t v26;
  NSString *crashReporterKey;
  uint64_t v28;
  NSString *awdReporterKey;
  uint64_t v30;
  NSString *internalKey;
  uint64_t v32;
  NSString *releaseType;
  uint64_t v34;
  NSString *seedGroup;
  uint64_t v36;
  NSString *experimentGroup;
  uint64_t v38;
  NSString *automatedDeviceGroup;
  uint64_t v40;
  NSString *automatedContextURL;
  uint64_t v42;
  NSDictionary *currentTaskingIDByRouting;
  void *v44;
  uint64_t v45;
  NSString *productNameVersionBuildString;
  OSAProxyConfiguration *v47;
  OSAProxyConfiguration *v48;
  objc_super v50;

  v7 = a3;
  v8 = a4;
  v50.receiver = self;
  v50.super_class = (Class)OSAProxyConfiguration;
  v9 = -[OSAProxyConfiguration init](&v50, sel_init);
  if (!v9)
    goto LABEL_14;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("path"));
  v10 = objc_claimAutoreleasedReturnValue();
  logPath = v9->_logPath;
  v9->_logPath = (NSString *)v10;

  objc_storeStrong((id *)&v9->_identifier, a3);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("machine_config"));
  v12 = objc_claimAutoreleasedReturnValue();
  modelCode = v9->_modelCode;
  v9->_modelCode = (NSString *)v12;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("product_version"));
  v14 = objc_claimAutoreleasedReturnValue();
  productVersion = v9->_productVersion;
  v9->_productVersion = (NSString *)v14;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("os_train"));
  v16 = objc_claimAutoreleasedReturnValue();
  osTrain = v9->_osTrain;
  v9->_osTrain = (NSString *)v16;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("target_audience"));
  v18 = objc_claimAutoreleasedReturnValue();
  targetAudience = v9->_targetAudience;
  v9->_targetAudience = (NSString *)v18;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("os_version"));
  v20 = objc_claimAutoreleasedReturnValue();
  buildVersion = v9->_buildVersion;
  v9->_buildVersion = (NSString *)v20;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UI_country_code"));
  v22 = objc_claimAutoreleasedReturnValue();
  uiCountryCode = v9->_uiCountryCode;
  v9->_uiCountryCode = (NSString *)v22;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("system_ID"));
  v24 = objc_claimAutoreleasedReturnValue();
  systemId = v9->_systemId;
  v9->_systemId = (NSString *)v24;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("crashreporter_key"));
  v26 = objc_claimAutoreleasedReturnValue();
  crashReporterKey = v9->_crashReporterKey;
  v9->_crashReporterKey = (NSString *)v26;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("awd_device_ID"));
  v28 = objc_claimAutoreleasedReturnValue();
  awdReporterKey = v9->_awdReporterKey;
  v9->_awdReporterKey = (NSString *)v28;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("internal_key"));
  v30 = objc_claimAutoreleasedReturnValue();
  internalKey = v9->_internalKey;
  v9->_internalKey = (NSString *)v30;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("release_type"));
  v32 = objc_claimAutoreleasedReturnValue();
  releaseType = v9->_releaseType;
  v9->_releaseType = (NSString *)v32;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SeedGroup"));
  v34 = objc_claimAutoreleasedReturnValue();
  seedGroup = v9->_seedGroup;
  v9->_seedGroup = (NSString *)v34;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ExperimentGroup"));
  v36 = objc_claimAutoreleasedReturnValue();
  experimentGroup = v9->_experimentGroup;
  v9->_experimentGroup = (NSString *)v36;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AutomatedDeviceGroup"));
  v38 = objc_claimAutoreleasedReturnValue();
  automatedDeviceGroup = v9->_automatedDeviceGroup;
  v9->_automatedDeviceGroup = (NSString *)v38;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AutomatedContextURL"));
  v40 = objc_claimAutoreleasedReturnValue();
  automatedContextURL = v9->_automatedContextURL;
  v9->_automatedContextURL = (NSString *)v40;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("currentTaskingIDByRouting"));
  v42 = objc_claimAutoreleasedReturnValue();
  currentTaskingIDByRouting = v9->_currentTaskingIDByRouting;
  v9->_currentTaskingIDByRouting = (NSDictionary *)v42;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isComputeController"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_isComputeController = objc_msgSend(v44, "BOOLValue");

  if (!v9->_osTrain)
  {
    v9->_osTrain = (NSString *)CFSTR("<unknown>");

  }
  if (!v9->_targetAudience)
  {
    v9->_targetAudience = (NSString *)CFSTR("<unknown>");

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v9->_osTrain, v9->_buildVersion);
  v45 = objc_claimAutoreleasedReturnValue();
  productNameVersionBuildString = v9->_productNameVersionBuildString;
  v9->_productNameVersionBuildString = (NSString *)v45;

  if (-[NSString length](v9->_modelCode, "length")
    && -[NSString length](v9->_productVersion, "length")
    && -[NSString length](v9->_buildVersion, "length")
    && -[NSString length](v9->_uiCountryCode, "length")
    && -[NSString length](v9->_crashReporterKey, "length"))
  {
    if (-[NSString length](v9->_releaseType, "length"))
      v47 = v9;
    else
      v47 = 0;
  }
  else
  {
LABEL_14:
    v47 = 0;
  }
  v48 = v47;

  return v48;
}

- (id)initFromPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("deviceMetadata.proxy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[OSAProxyConfiguration init:fromMetadata:](self, "init:fromMetadata:", v8, v7);

  if (v9)
  {
    v10 = objc_msgSend(v4, "copy");
    v11 = (void *)v9[1];
    v9[1] = v10;

  }
  return v9;
}

- (BOOL)isProxy
{
  return 1;
}

- (BOOL)isInternalBridge
{
  return -[NSString containsString:](self->_logPath, "containsString:", CFSTR("Bridge"));
}

- (id)assembleMetadataAt:(double)a3 withOptions:(unsigned int)a4
{
  char v4;
  double v5;
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
  void *v27;
  _QWORD v29[2];
  _QWORD v30[3];

  v4 = a4;
  v5 = a3;
  v30[2] = *MEMORY[0x1E0C80C00];
  if ((a4 & 4) != 0)
    a3 = OSATimeIntervalApproximate(a3);
  OSADateFormat(5u, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  if ((v4 & 4) != 0)
    v5 = OSATimeIntervalApproximate(v5);
  objc_msgSend(v9, "numberWithDouble:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("submissionTime"));

  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("submissionTimeISO"));
  -[OSAProxyConfiguration releaseType](self, "releaseType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v11, CFSTR("release_type"));

  -[OSAProxyConfiguration modelCode](self, "modelCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v12, CFSTR("machine_config"));

  -[OSAProxyConfiguration automatedDeviceGroup](self, "automatedDeviceGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v13, CFSTR("AutomatedDeviceGroup"));

  -[OSAProxyConfiguration automatedContextURL](self, "automatedContextURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v14, CFSTR("AutomatedContextURL"));

  -[OSAProxyConfiguration seedGroup](self, "seedGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v15, CFSTR("SeedGroup"));

  -[OSAProxyConfiguration experimentGroup](self, "experimentGroup");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v16, CFSTR("ExperimentGroup"));

  -[OSAProxyConfiguration internalKey](self, "internalKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v17, CFSTR("internal_key"));

  if (-[OSAProxyConfiguration isComputeController](self, "isComputeController"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isComputeController"));
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v8, "setValue:forKey:", 0, CFSTR("crashreporter_key"));
    if ((v4 & 2) != 0)
      goto LABEL_9;
  }
  else
  {
    -[OSAProxyConfiguration crashReporterKey](self, "crashReporterKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v18, CFSTR("crashreporter_key"));

    if ((v4 & 2) != 0)
    {
LABEL_9:
      objc_msgSend(v8, "setValue:forKey:", 0, CFSTR("system_ID"));
      goto LABEL_12;
    }
  }
  -[OSAProxyConfiguration systemId](self, "systemId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v19, CFSTR("system_ID"));

LABEL_12:
  if (-[OSAProxyConfiguration isProxy](self, "isProxy"))
  {
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = CFSTR("os_version");
    objc_msgSend(v20, "productNameVersionBuildString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = CFSTR("machine_config");
    v30[0] = v21;
    objc_msgSend(v20, "modelCode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    if (objc_msgSend(v20, "appleInternal"))
    {
      objc_msgSend(v20, "crashReporterKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKey:", v25, CFSTR("crashreporter_key"));

      objc_msgSend(v20, "automatedDeviceGroup");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setValue:forKey:", v26, CFSTR("AutomatedDeviceGroup"));

      objc_msgSend(v20, "internalKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setValue:forKey:", v27, CFSTR("internal_key"));

    }
    objc_msgSend(v8, "setValue:forKey:", v24, CFSTR("proxyingDevice"));

  }
  return v8;
}

- (id)metadata
{
  void *v3;
  void *v4;
  void *v5;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSAProxyConfiguration modelCode](self, "modelCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("machine_config"));

  -[OSAProxyConfiguration productVersion](self, "productVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("product_version"));

  -[OSAProxyConfiguration osTrain](self, "osTrain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("os_train"));

  -[OSAProxyConfiguration targetAudience](self, "targetAudience");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("target_audience"));

  -[OSAProxyConfiguration buildVersion](self, "buildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("os_version"));

  -[OSAProxyConfiguration uiCountryCode](self, "uiCountryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("UI_country_code"));

  -[OSAProxyConfiguration systemId](self, "systemId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("system_ID"));

  -[OSAProxyConfiguration crashReporterKey](self, "crashReporterKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("crashreporter_key"));

  -[OSAProxyConfiguration awdReporterKey](self, "awdReporterKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("awd_device_ID"));

  -[OSAProxyConfiguration internalKey](self, "internalKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("internal_key"));

  -[OSAProxyConfiguration releaseType](self, "releaseType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("release_type"));

  if (-[OSAProxyConfiguration isComputeController](self, "isComputeController"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isComputeController"));
  -[OSAProxyConfiguration seedGroup](self, "seedGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v15, CFSTR("SeedGroup"));

  -[OSAProxyConfiguration experimentGroup](self, "experimentGroup");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v16, CFSTR("ExperimentGroup"));

  -[OSAProxyConfiguration automatedDeviceGroup](self, "automatedDeviceGroup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v17, CFSTR("AutomatedDeviceGroup"));

  -[OSAProxyConfiguration automatedContextURL](self, "automatedContextURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v18, CFSTR("AutomatedContextURL"));

  -[OSAProxyConfiguration currentTaskingIDByRouting](self, "currentTaskingIDByRouting");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v19, CFSTR("currentTaskingIDByRouting"));

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[OSAProxyConfiguration metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  return v5;
}

- (BOOL)usesLegacySubmission:(id)a3
{
  return 0;
}

- (BOOL)isConfigEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eOS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eOS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isFile:(id)a3 validForSubmission:(id)a4 reasonableSize:(int64_t)a5 to:(id)a6 internalTypes:(id)a7 result:(const char *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  BOOL v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  const char *v32;
  int v33;
  uint64_t v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __CFString *v41;
  void *v42;
  int v43;
  int v44;
  int64_t v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  id v52;
  __int16 v53;
  __CFString *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  if (!a8)
    -[OSAProxyConfiguration isFile:validForSubmission:reasonableSize:to:internalTypes:result:].cold.1();
  v18 = v17;
  *a8 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "stringValue");
    v19 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v15, "length"))
  {
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "appleInternal"))
    {
      v21 = objc_msgSend(v18, "containsObject:", v15);

      if (v21)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v14;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Logfile '%@' allowed for submission for testing", buf, 0xCu);
        }
        v22 = 1;
        goto LABEL_62;
      }
    }
    else
    {

    }
    v46 = a5;
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "getLogBlacklist");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "containsObject:", v15);

    if (v26)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v48 = v14;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Logfile '%{public}@' blacklisted from submission", buf, 0xCu);
      }
      v22 = 0;
      *a8 = "rejected-blacklist";
      goto LABEL_62;
    }
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "getPropsForLogType:", v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v48 = v14;
        v49 = 2114;
        v50 = (unint64_t)v15;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Logfile '%{public}@' invalid for submission: unknown type %{public}@", buf, 0x16u);
      }
      v32 = "rejected-unregistered";
      goto LABEL_60;
    }
    if (!-[OSAProxyConfiguration isConfigEnabled:](self, "isConfigEnabled:", v28))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v48 = v14;
        v49 = 2114;
        v50 = (unint64_t)v15;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Logfile '%{public}@' type %{public}@ invalid for platform", buf, 0x16u);
      }
      v32 = "rejected-platform";
      goto LABEL_60;
    }
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("<transfer>")))
    {
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("disabled"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v46;
      if (!v29)
      {
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("watchSync"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v31)
          goto LABEL_51;
LABEL_41:
        v22 = 1;
LABEL_52:
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("limit"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "intValue");

        if (v43)
          v44 = v43;
        else
          v44 = 0x100000;
        if (!v22 || v44 >= v30)
          goto LABEL_61;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v48 = v14;
          v49 = 2048;
          v50 = v30;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Logfile '%{public}@' is too large (%lld) for submission", buf, 0x16u);
        }
        v32 = "rejected-size";
LABEL_60:
        v22 = 0;
        *a8 = v32;
LABEL_61:

LABEL_62:
        v23 = v22 != 0;
        goto LABEL_63;
      }
    }
    else
    {
      v33 = objc_msgSend(v16, "isEqualToString:", CFSTR("<sync>"));
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("disabled"));
      v34 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v34;
      v30 = v46;
      if (!v33)
      {
        if (v34)
        {
          v35 = 0;
        }
        else
        {
          +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v37, "appleInternal") & 1) != 0)
          {
            v35 = 1;
          }
          else
          {
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("gm"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v39 != 0;

          }
        }

        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("routing"));
        v40 = objc_claimAutoreleasedReturnValue();
        if (v40)
          v41 = (__CFString *)v40;
        else
          v41 = CFSTR("da3");
        if ((-[__CFString isEqualToString:](v41, "isEqualToString:", v16) & 1) == 0
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138544130;
          v48 = v14;
          v49 = 2114;
          v50 = (unint64_t)v15;
          v51 = 2114;
          v52 = v16;
          v53 = 2114;
          v54 = v41;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Warning: Logfile '%{public}@' type %{public}@ routing %{public}@ does not match config %{public}@", buf, 0x2Au);
        }

        if (!v35)
          goto LABEL_51;
        goto LABEL_41;
      }
      if (!v34)
      {
        +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "appleInternal"))
        {

          goto LABEL_41;
        }
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("gm"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
          goto LABEL_41;
LABEL_51:
        v22 = 0;
        *a8 = "rejected-config";
        goto LABEL_52;
      }
    }

    goto LABEL_51;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v48 = v14;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Logfile '%{public}@' invalid for submission: no type", buf, 0xCu);
  }
  v23 = 0;
  *a8 = "rejected-invalid";
LABEL_63:

  return v23;
}

- (NSString)logPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)modelCode
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)buildVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)osTrain
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)productName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)productNameVersionBuildString
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)targetAudience
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)uiCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)systemId
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)internalKey
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)crashReporterKey
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)awdReporterKey
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)releaseType
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)seedGroup
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)experimentGroup
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSString)automatedDeviceGroup
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)automatedContextURL
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (BOOL)isComputeController
{
  return self->_isComputeController;
}

- (BOOL)isComputeNode
{
  return self->_isComputeNode;
}

- (NSDictionary)currentTaskingIDByRouting
{
  return (NSDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTaskingIDByRouting, 0);
  objc_storeStrong((id *)&self->_automatedContextURL, 0);
  objc_storeStrong((id *)&self->_automatedDeviceGroup, 0);
  objc_storeStrong((id *)&self->_experimentGroup, 0);
  objc_storeStrong((id *)&self->_seedGroup, 0);
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_internalKey, 0);
  objc_storeStrong((id *)&self->_awdReporterKey, 0);
  objc_storeStrong((id *)&self->_crashReporterKey, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_systemId, 0);
  objc_storeStrong((id *)&self->_uiCountryCode, 0);
  objc_storeStrong((id *)&self->_productReleaseString, 0);
  objc_storeStrong((id *)&self->_productNameVersionBuildString, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_productBuildString, 0);
  objc_storeStrong((id *)&self->_osTrain, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_targetAudience, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_modelCode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logPath, 0);
}

- (void)isFile:validForSubmission:reasonableSize:to:internalTypes:result:.cold.1()
{
  __assert_rtn("-[OSAProxyConfiguration isFile:validForSubmission:reasonableSize:to:internalTypes:result:]", "OSASystemConfiguration.m", 306, "reject_reason");
}

@end
