@implementation RCConfigurationSettings

- (NSArray)requestInfos
{
  return self->_requestInfos;
}

- (RCDebugOverrides)debugOverrides
{
  return self->_debugOverrides;
}

- (NSString)userID
{
  return self->_userID;
}

- (unint64_t)requestMode
{
  return self->_requestMode;
}

uint64_t __57__RCConfigurationSettings_requestInfoForRequestCacheKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "requestCacheKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)useBackgroundRefreshRate
{
  return self->_useBackgroundRefreshRate;
}

- (id)requestInfoForRequestCacheKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[RCConfigurationSettings requestInfos](self, "requestInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__RCConfigurationSettings_requestInfoForRequestCacheKey___block_invoke;
  v9[3] = &unk_1E470EE60;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "rc_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointConfig, 0);
  objc_storeStrong((id *)&self->_backgroundFetchConfiguration, 0);
  objc_storeStrong((id *)&self->_loggingKey, 0);
  objc_storeStrong((id *)&self->_debugOverrides, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_requestInfos, 0);
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[RCConfigurationSettings requestInfos](self, "requestInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[RCConfigurationSettings userID](self, "userID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[RCConfigurationSettings storefrontID](self, "storefrontID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[RCConfigurationSettings bundleID](self, "bundleID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          -[RCConfigurationSettings deviceInfo](self, "deviceInfo");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7 != 0;

        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)dictionaryRepresentation
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationSettings userID](self, "userID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v4, CFSTR("feldsparId"));

  -[RCConfigurationSettings storefrontID](self, "storefrontID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("storefrontId"));

  -[RCConfigurationSettings bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v6, CFSTR("bundleId"));

  -[RCConfigurationSettings deviceInfo](self, "deviceInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v8, CFSTR("deviceInfo"));

  -[RCConfigurationSettings debugOverrides](self, "debugOverrides");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v10, CFSTR("debugOverrides"));

  -[RCConfigurationSettings applicationStateDescription](self, "applicationStateDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v11, CFSTR("applicationState"));

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (RCDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)loggingKey
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[RCConfigurationSettings requestInfos](self, "requestInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; requestInfos: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (double)endpointTimeoutDuration
{
  return self->_endpointTimeoutDuration;
}

- (RCBackgroundFetchConfiguration)backgroundFetchConfiguration
{
  return self->_backgroundFetchConfiguration;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 requestMode:(unint64_t)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  RCRequestInfo *v23;
  RCConfigurationSettings *v24;
  void *v25;
  void *v26;
  RCConfigurationSettings *v27;
  uint64_t v29;
  void *v30;
  id v31;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v31 = a10;
  if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:].cold.6();
    if (v17)
      goto LABEL_6;
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:].cold.5();
LABEL_6:
  if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:].cold.4();
    if (v20)
      goto LABEL_11;
  }
  else if (v20)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:].cold.3();
LABEL_11:
  if (!v21 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:].cold.2();
  if (!v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:].cold.1();
  v23 = -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:]([RCRequestInfo alloc], "initWithRequestKey:responseKey:fallbackURL:", v16, v17, v18);
  v24 = [RCConfigurationSettings alloc];
  v33[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v30 = v16;
  v25 = v18;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = 0;
  v27 = -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:](v24, "initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:", v26, v19, v20, v21, v22, v31, 1.79769313e308, 1.79769313e308, v29, 0, a11);

  return v27;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 requestMode:(unint64_t)a10 endpointTimeoutDuration:(double)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  RCConfigurationSettings *v24;
  uint64_t v26;

  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  LOBYTE(v26) = a9;
  v24 = -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:]([RCConfigurationSettings alloc], "initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:", v23, v22, v21, v20, v19, v18, a11, 1.79769313e308, v26, a10);

  return v24;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 requestMode:(unint64_t)a10 endpointTimeoutDuration:(double)a11 fallbackTimeoutDuration:(double)a12
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  RCConfigurationSettings *v26;
  uint64_t v28;

  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  LOBYTE(v28) = a9;
  v26 = -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:]([RCConfigurationSettings alloc], "initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:", v25, v24, v23, v22, v21, v20, a11, a12, v28, 0, a10);

  return v26;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 backgroundFetchConfiguration:(id)a10 requestMode:(unint64_t)a11 endpointTimeoutDuration:(double)a12 fallbackTimeoutDuration:(double)a13
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  RCConfigurationSettings *v28;
  uint64_t v30;

  v21 = a10;
  v22 = a8;
  v23 = a7;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  LOBYTE(v30) = a9;
  v28 = -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:]([RCConfigurationSettings alloc], "initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:", v27, v26, v25, v24, v23, v22, a12, a13, v30, v21, a11, 0);

  return v28;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 userID:(id)a5 storefrontID:(id)a6 bundleID:(id)a7 deviceInfo:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  RCRequestInfo *v20;
  RCConfigurationSettings *v21;
  uint64_t v22;
  NSArray *requestInfos;
  id obj;
  id v26;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  obj = a7;
  v18 = a7;
  v26 = a8;
  v19 = a8;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:].cold.6();
    if (v15)
      goto LABEL_6;
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:].cold.5();
LABEL_6:
  if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:].cold.4();
    if (v17)
      goto LABEL_11;
  }
  else if (v17)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:].cold.3();
LABEL_11:
  if (!v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:].cold.2();
    if (v19)
      goto LABEL_16;
  }
  else if (v19)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:].cold.1();
LABEL_16:
  v20 = -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:]([RCRequestInfo alloc], "initWithRequestKey:responseKey:fallbackURL:", v14, v15, 0);
  v27.receiver = self;
  v27.super_class = (Class)RCConfigurationSettings;
  v21 = -[RCConfigurationSettings init](&v27, sel_init);
  if (v21)
  {
    v28[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    requestInfos = v21->_requestInfos;
    v21->_requestInfos = (NSArray *)v22;

    objc_storeStrong((id *)&v21->_userID, a5);
    objc_storeStrong((id *)&v21->_storefrontID, a6);
    objc_storeStrong((id *)&v21->_bundleID, obj);
    objc_storeStrong((id *)&v21->_deviceInfo, v26);
    v21->_requestMode = 2;
  }

  return v21;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  RCConfigurationSettings *v18;
  RCConfigurationSettings *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id obj;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  obj = a7;
  v16 = a7;
  if (!v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:].cold.5();
  v29 = v13;
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:].cold.4();
    if (v14)
      goto LABEL_9;
  }
  else if (v14)
  {
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:].cold.3();
LABEL_9:
  v17 = v12;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:].cold.2();
    if (v16)
      goto LABEL_14;
  }
  else if (v16)
  {
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:].cold.1();
LABEL_14:
  v34.receiver = self;
  v34.super_class = (Class)RCConfigurationSettings;
  v18 = -[RCConfigurationSettings init](&v34, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_requestInfos, a3);
    objc_storeStrong((id *)&v19->_userID, a4);
    objc_storeStrong((id *)&v19->_storefrontID, a5);
    objc_storeStrong((id *)&v19->_bundleID, a6);
    objc_storeStrong((id *)&v19->_deviceInfo, obj);
    v19->_requestMode = 2;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v20 = v12;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "fallbackURL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v19->_requestMode = 1;
            goto LABEL_25;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v22)
          continue;
        break;
      }
    }
LABEL_25:

  }
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unint64_t v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1E0DE7910];
    -[RCConfigurationSettings requestInfos](self, "requestInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestInfos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "rc_object:isEqualToObject:", v7, v8))
    {
      -[RCConfigurationSettings userID](self, "userID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        -[RCConfigurationSettings storefrontID](self, "storefrontID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "storefrontID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v12))
        {
          v45 = v11;
          -[RCConfigurationSettings bundleID](self, "bundleID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "bundleID");
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = v13;
          if (objc_msgSend(v13, "isEqualToString:"))
          {
            -[RCConfigurationSettings deviceInfo](self, "deviceInfo");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "deviceInfo");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v14;
            if (objc_msgSend(v14, "isEqual:"))
            {
              v39 = (void *)MEMORY[0x1E0DE7910];
              -[RCConfigurationSettings debugOverrides](self, "debugOverrides");
              v15 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "debugOverrides");
              v16 = objc_claimAutoreleasedReturnValue();
              v17 = v39;
              v38 = (void *)v16;
              v40 = (void *)v15;
              if (objc_msgSend(v17, "rc_object:isEqualToObject:", v15)
                && (v18 = -[RCConfigurationSettings useBackgroundRefreshRate](self, "useBackgroundRefreshRate"),
                    v18 == objc_msgSend(v5, "useBackgroundRefreshRate")))
              {
                v21 = (void *)MEMORY[0x1E0DE7910];
                -[RCConfigurationSettings backgroundFetchConfiguration](self, "backgroundFetchConfiguration");
                v22 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "backgroundFetchConfiguration");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = (void *)v22;
                if (objc_msgSend(v21, "rc_object:isEqualToObject:", v22)
                  && (v23 = -[RCConfigurationSettings requestMode](self, "requestMode"),
                      v23 == objc_msgSend(v5, "requestMode")))
                {
                  -[RCConfigurationSettings endpointConfig](self, "endpointConfig");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "endpointConfig");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = v24;
                  v25 = objc_msgSend(v24, "isEqual:");
                  v20 = (void *)v43;
                  v13 = v44;
                  if (v25
                    && (-[RCConfigurationSettings endpointTimeoutDuration](self, "endpointTimeoutDuration"),
                        v27 = v26,
                        objc_msgSend(v5, "endpointTimeoutDuration"),
                        v27 == v28)
                    && (-[RCConfigurationSettings fallbackTimeoutDuration](self, "fallbackTimeoutDuration"),
                        v30 = v29,
                        objc_msgSend(v5, "fallbackTimeoutDuration"),
                        v30 == v31))
                  {
                    v32 = -[RCConfigurationSettings applicationState](self, "applicationState");
                    v19 = v32 == objc_msgSend(v5, "applicationState");
                  }
                  else
                  {
                    v19 = 0;
                  }

                }
                else
                {
                  v19 = 0;
                  v20 = (void *)v43;
                  v13 = v44;
                }

              }
              else
              {
                v19 = 0;
                v20 = (void *)v43;
                v13 = v44;
              }

            }
            else
            {
              v19 = 0;
              v20 = (void *)v43;
              v13 = v44;
            }

          }
          else
          {
            v19 = 0;
            v20 = (void *)v43;
          }

          v11 = v45;
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  -[RCConfigurationSettings requestInfos](self, "requestInfos");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v31, "hash");
  -[RCConfigurationSettings userID](self, "userID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v30, "hash") ^ v3;
  -[RCConfigurationSettings storefrontID](self, "storefrontID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v29, "hash");
  -[RCConfigurationSettings bundleID](self, "bundleID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v28, "hash");
  -[RCConfigurationSettings deviceInfo](self, "deviceInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v27, "hash");
  -[RCConfigurationSettings debugOverrides](self, "debugOverrides");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v26, "hash");
  -[RCConfigurationSettings backgroundFetchConfiguration](self, "backgroundFetchConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v8 ^ objc_msgSend(v25, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RCConfigurationSettings useBackgroundRefreshRate](self, "useBackgroundRefreshRate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCConfigurationSettings requestMode](self, "requestMode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  -[RCConfigurationSettings endpointConfig](self, "endpointConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11 ^ v13 ^ objc_msgSend(v14, "hash");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[RCConfigurationSettings endpointTimeoutDuration](self, "endpointTimeoutDuration");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[RCConfigurationSettings fallbackTimeoutDuration](self, "fallbackTimeoutDuration");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v18 ^ objc_msgSend(v20, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCConfigurationSettings applicationState](self, "applicationState"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v15 ^ v21 ^ objc_msgSend(v22, "hash");

  return v23;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v22 = (void *)MEMORY[0x1E0CB3940];
  v21 = objc_opt_class();
  -[RCConfigurationSettings requestInfos](self, "requestInfos");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationSettings userID](self, "userID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationSettings storefrontID](self, "storefrontID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationSettings bundleID](self, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationSettings endpointConfig](self, "endpointConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationSettings deviceInfo](self, "deviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCConfigurationSettings debugOverrides](self, "debugOverrides");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@: %p; requestInfos: %@\n userID: %@\n storefrontID: %@\n bundleID: %@\n endpointConfig: %@\n deviceInfo: %@\n debugOverrides: %@\n useBackgroundRefreshRate: %d requestMode: %lu applicationState: %lu"),
    v21,
    self,
    v20,
    v19,
    v18,
    v3,
    v4,
    v6,
    v8,
    -[RCConfigurationSettings useBackgroundRefreshRate](self, "useBackgroundRefreshRate"),
    -[RCConfigurationSettings requestMode](self, "requestMode"),
    -[RCConfigurationSettings applicationState](self, "applicationState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RCConfigurationSettings endpointTimeoutDuration](self, "endpointTimeoutDuration");
  if (v10 != 1.79769313e308)
  {
    -[RCConfigurationSettings endpointTimeoutDuration](self, "endpointTimeoutDuration");
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(" endpointTimeout: %.1f"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  -[RCConfigurationSettings fallbackTimeoutDuration](self, "fallbackTimeoutDuration");
  if (v13 != 1.79769313e308)
  {
    -[RCConfigurationSettings fallbackTimeoutDuration](self, "fallbackTimeoutDuration");
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(" fallbackTimeout: %.1f"), v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v15;
  }
  objc_msgSend(v9, "stringByAppendingString:", CFSTR(">"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (id)applicationStateDescription
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[RCConfigurationSettings applicationState](self, "applicationState");
  v3 = CFSTR("foreground");
  if (v2 != 1)
    v3 = 0;
  if (v2 == 2)
    return CFSTR("background");
  else
    return (id)v3;
}

- (NSString)JSONRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[RCConfigurationSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  return (NSString *)v5;
}

- (id)fallbackURL
{
  void *v2;
  void *v3;
  void *v4;

  -[RCConfigurationSettings requestInfos](self, "requestInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fallbackURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 userID:(id)a5 storefrontID:(id)a6 bundleID:(id)a7 deviceInfo:(id)a8 debugOverrides:(id)a9 backgroundFetchConfiguration:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  RCRequestInfo *v24;
  RCConfigurationSettings *v25;
  void *v26;
  RCConfigurationSettings *v27;
  uint64_t v29;
  id v30;
  id v31;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v31 = a9;
  v30 = a10;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:].cold.6();
    if (v16)
      goto LABEL_6;
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:].cold.5();
LABEL_6:
  if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:].cold.4();
    if (v18)
      goto LABEL_11;
  }
  else if (v18)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:].cold.3();
LABEL_11:
  v21 = v18;
  if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:].cold.2();
  v22 = v17;
  v23 = v20;
  if (!v20 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:].cold.1();
  v24 = -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:]([RCRequestInfo alloc], "initWithRequestKey:responseKey:fallbackURL:", v15, v16, 0);
  v25 = [RCConfigurationSettings alloc];
  v33[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = 0;
  v27 = -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:](v25, "initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:", v26, v22, v21, v19, v23, v31, 1.79769313e308, 1.79769313e308, v29, v30, 1);

  return v27;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  RCRequestInfo *v22;
  RCConfigurationSettings *v23;
  void *v24;
  RCConfigurationSettings *v25;
  uint64_t v27;
  void *v28;
  id v29;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v29 = a10;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:].cold.6();
    if (v16)
      goto LABEL_6;
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:].cold.5();
LABEL_6:
  if (!v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:].cold.4();
    if (v19)
      goto LABEL_11;
  }
  else if (v19)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:].cold.3();
LABEL_11:
  if (!v20 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:].cold.2();
    if (v21)
      goto LABEL_16;
  }
  else if (v21)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:].cold.1();
LABEL_16:
  v22 = -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:]([RCRequestInfo alloc], "initWithRequestKey:responseKey:fallbackURL:", v15, v16, v17);
  v23 = [RCConfigurationSettings alloc];
  v31[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v28 = v17;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = 0;
  v25 = -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:](v23, "initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:", v24, v18, v19, v20, v21, v29, 1.79769313e308, 1.79769313e308, v27, 0, 0);

  return v25;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 useBackgroundRefreshRate:(BOOL)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  RCRequestInfo *v23;
  RCConfigurationSettings *v24;
  void *v25;
  void *v26;
  RCConfigurationSettings *v27;
  uint64_t v29;
  void *v30;
  id v31;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v31 = a10;
  if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:].cold.6();
    if (v17)
      goto LABEL_6;
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:].cold.5();
LABEL_6:
  if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:].cold.4();
    if (v20)
      goto LABEL_11;
  }
  else if (v20)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:].cold.3();
LABEL_11:
  if (!v21 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:].cold.2();
  if (!v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:].cold.1();
  v23 = -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:]([RCRequestInfo alloc], "initWithRequestKey:responseKey:fallbackURL:", v16, v17, v18);
  v24 = [RCConfigurationSettings alloc];
  v33[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v30 = v16;
  v25 = v18;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = a11;
  v27 = -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:](v24, "initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:", v26, v19, v20, v21, v22, v31, 1.79769313e308, 1.79769313e308, v29, 0, 0);

  return v27;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 useBackgroundRefreshRate:(BOOL)a11 requestMode:(unint64_t)a12 endpointTimeoutDuration:(double)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  RCRequestInfo *v27;
  RCConfigurationSettings *v28;
  void *v29;
  void *v30;
  RCConfigurationSettings *v31;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a9;
  v35 = a10;
  if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:].cold.6();
    if (v20)
      goto LABEL_6;
  }
  else if (v20)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:].cold.5();
LABEL_6:
  if (!v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:].cold.4();
    if (v23)
      goto LABEL_11;
  }
  else if (v23)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:].cold.3();
LABEL_11:
  if (!v24 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:].cold.2();
  v36 = v24;
  v26 = v23;
  if (!v25 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:].cold.1();
  v27 = -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:]([RCRequestInfo alloc], "initWithRequestKey:responseKey:fallbackURL:", v19, v20, v21);
  v34 = v19;
  v28 = [RCConfigurationSettings alloc];
  v38[0] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v29 = v21;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = a11;
  v31 = -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:](v28, "initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:", v30, v22, v26, v36, v25, v35, a13, 1.79769313e308, v33, 0, a12);

  return v31;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 useBackgroundRefreshRate:(BOOL)a11 backgroundFetchConfiguration:(id)a12 requestMode:(unint64_t)a13 endpointTimeoutDuration:(double)a14 fallbackTimeoutDuration:(double)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  RCRequestInfo *v27;
  RCConfigurationSettings *v28;
  void *v29;
  RCConfigurationSettings *v30;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v22 = a4;
  v35 = a5;
  v23 = a6;
  v24 = a7;
  v25 = a8;
  v26 = a9;
  v34 = a10;
  v33 = a12;
  if (!v21 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.6();
  if (!v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.5();
  if (!v23 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.4();
    if (v24)
      goto LABEL_12;
  }
  else if (v24)
  {
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.3();
LABEL_12:
  if (!v25 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.2();
  if (!v26 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.1();
  v27 = -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:]([RCRequestInfo alloc], "initWithRequestKey:responseKey:fallbackURL:", v21, v22, v35);
  v28 = [RCConfigurationSettings alloc];
  v37[0] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v32) = a11;
  v30 = -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:](v28, "initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:", v29, v23, v24, v25, v26, v34, a14, 1.79769313e308, v32, v33, a13, 0);

  return v30;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 useBackgroundRefreshRate:(BOOL)a11 backgroundFetchConfiguration:(id)a12 requestMode:(unint64_t)a13 endpointConfig:(id)a14 endpointTimeoutDuration:(double)a15 fallbackTimeoutDuration:(double)a16
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  RCRequestInfo *v29;
  RCConfigurationSettings *v30;
  void *v31;
  uint64_t v33;
  RCConfigurationSettings *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v24 = a4;
  v39 = a5;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a9;
  v37 = a10;
  v36 = a12;
  v35 = a14;
  if (!v23 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.6();
    if (v24)
      goto LABEL_6;
  }
  else if (v24)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.5();
LABEL_6:
  if (!v25 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.4();
    if (v26)
      goto LABEL_11;
  }
  else if (v26)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.3();
LABEL_11:
  if (!v27 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.2();
  v38 = v26;
  if (!v28 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.1();
  v29 = -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:]([RCRequestInfo alloc], "initWithRequestKey:responseKey:fallbackURL:", v23, v24, v39);
  v30 = [RCConfigurationSettings alloc];
  v41[0] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = a11;
  v34 = -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:](v30, "initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:", v31, v25, v38, v27, v28, v37, a15, a16, v33, v36, a13, v35);

  return v34;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  RCConfigurationSettings *v20;
  uint64_t v22;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  LOBYTE(v22) = 0;
  v20 = -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:]([RCConfigurationSettings alloc], "initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:", v19, v18, v17, v16, v15, v14, 1.79769313e308, 1.79769313e308, v22, 0);

  return v20;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  RCConfigurationSettings *v21;
  uint64_t v23;

  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  LOBYTE(v23) = a9;
  v21 = -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:]([RCConfigurationSettings alloc], "initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:", v20, v19, v18, v17, v16, v15, 1.79769313e308, 1.79769313e308, v23, 0);

  return v21;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 requestMode:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  RCConfigurationSettings *v22;
  uint64_t v24;

  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  LOBYTE(v24) = a9;
  v22 = -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:]([RCConfigurationSettings alloc], "initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:", v21, v20, v19, v18, v17, v16, 1.79769313e308, 1.79769313e308, v24, a10);

  return v22;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 backgroundFetchConfiguration:(id)a10 requestMode:(unint64_t)a11 endpointConfig:(id)a12 endpointTimeoutDuration:(double)a13 fallbackTimeoutDuration:(double)a14
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  RCConfigurationSettings *v27;
  RCConfigurationSettings *v28;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v22 = a3;
  v31 = a4;
  v23 = a4;
  v32 = a5;
  v24 = a5;
  v33 = a6;
  v25 = a6;
  v26 = a7;
  v36 = a8;
  v35 = a10;
  v34 = a12;
  if (!v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.5();
    if (v23)
      goto LABEL_6;
  }
  else if (v23)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.4();
LABEL_6:
  if (!v24 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.3();
    if (v25)
      goto LABEL_11;
  }
  else if (v25)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.2();
LABEL_11:
  if (!v26 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.1();
  v37.receiver = self;
  v37.super_class = (Class)RCConfigurationSettings;
  v27 = -[RCConfigurationSettings init](&v37, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_requestInfos, a3);
    objc_storeStrong((id *)&v28->_userID, v31);
    objc_storeStrong((id *)&v28->_storefrontID, v32);
    objc_storeStrong((id *)&v28->_bundleID, v33);
    objc_storeStrong((id *)&v28->_deviceInfo, a7);
    objc_storeStrong((id *)&v28->_debugOverrides, a8);
    v28->_useBackgroundRefreshRate = a9;
    objc_storeStrong((id *)&v28->_backgroundFetchConfiguration, a10);
    v28->_requestMode = a11;
    objc_storeStrong((id *)&v28->_endpointConfig, a12);
    v28->_endpointTimeoutDuration = a13;
    v28->_fallbackTimeoutDuration = a14;
  }

  return v28;
}

- (void)setDebugOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_debugOverrides, a3);
}

- (void)setLoggingKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setBackgroundFetchConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundFetchConfiguration, a3);
}

- (void)setUseBackgroundRefreshRate:(BOOL)a3
{
  self->_useBackgroundRefreshRate = a3;
}

- (void)setRequestMode:(unint64_t)a3
{
  self->_requestMode = a3;
}

- (RCEndpointConfig)endpointConfig
{
  return self->_endpointConfig;
}

- (void)setEndpointConfig:(id)a3
{
  objc_storeStrong((id *)&self->_endpointConfig, a3);
}

- (void)setEndpointTimeoutDuration:(double)a3
{
  self->_endpointTimeoutDuration = a3;
}

- (double)fallbackTimeoutDuration
{
  return self->_fallbackTimeoutDuration;
}

- (void)setFallbackTimeoutDuration:(double)a3
{
  self->_fallbackTimeoutDuration = a3;
}

- (unint64_t)applicationState
{
  return self->_applicationState;
}

- (void)setApplicationState:(unint64_t)a3
{
  self->_applicationState = a3;
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:.cold.5()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:.cold.6()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:.cold.5()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestInfos", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:.cold.5()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:.cold.6()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:.cold.5()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:.cold.6()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:.cold.5()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:.cold.6()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:.cold.5()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:.cold.6()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:.cold.5()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:.cold.6()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.5()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.6()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.5()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.6()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.5()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestInfos", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
