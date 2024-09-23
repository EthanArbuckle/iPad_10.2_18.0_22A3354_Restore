@implementation RTAuthorizedLocationBiometricsManager

- (RTAuthorizedLocationBiometricsManager)initWithTrustedTimeCache:(id)a3 defaultsManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  RTAuthorizedLocationBiometricsManager *v12;
  uint64_t v13;
  NSDate *dateOfLastUpdate;
  NSDate *dateOfMostRecentBiometricAuthentication;
  uint64_t v16;
  RTPlatform *platform;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[RTAuthorizedLocationBiometricsManager initWithTrustedTimeCache:defaultsManager:]";
    v22 = 1024;
    v23 = 39;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: trustedTimeCache (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTAuthorizedLocationBiometricsManager initWithTrustedTimeCache:defaultsManager:]";
      v22 = 1024;
      v23 = 40;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  v19.receiver = self;
  v19.super_class = (Class)RTAuthorizedLocationBiometricsManager;
  v12 = -[RTAuthorizedLocationBiometricsManager init](&v19, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v13 = objc_claimAutoreleasedReturnValue();
    dateOfLastUpdate = v12->_dateOfLastUpdate;
    v12->_dateOfLastUpdate = (NSDate *)v13;

    dateOfMostRecentBiometricAuthentication = v12->_dateOfMostRecentBiometricAuthentication;
    v12->_dateOfMostRecentBiometricAuthentication = 0;

    objc_storeStrong((id *)&v12->_trustedTimeCache, a3);
    objc_storeStrong((id *)&v12->_defaultsManager, a4);
    v16 = objc_opt_new();
    platform = v12->_platform;
    v12->_platform = (RTPlatform *)v16;

  }
  return v12;
}

- (id)updateDateOfLastSuccessfulBiometricAuthentication
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSDate *v8;
  NSDate *dateOfMostRecentBiometricAuthentication;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSDate *v14;
  const char *v15;
  objc_class *v16;
  objc_class *v17;
  NSObject *v18;
  uint32_t v19;
  objc_class *v20;
  NSDate *v21;
  double v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  NSDate *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[RTTrustedTimeCache getApproximateTrustedDateNowWithUnsecureFallback](self->_trustedTimeCache, "getApproximateTrustedDateNowWithUnsecureFallback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    v15 = "%@:%@ BKDevice, BKDeviceDescriptor, unable to fetch trustedNow, not updating dateOfMostRecentBiometricAuthentication.";
    goto LABEL_13;
  }
  objc_msgSend(v4, "timeIntervalSinceDate:", self->_dateOfLastUpdate);
  v7 = v6;
  if (v6 > 900.0)
  {
    v23 = 0.0;
    if (-[RTAuthorizedLocationBiometricsManager _getTimeSinceLastSuccessfulBiometricAuthentication:](self, "_getTimeSinceLastSuccessfulBiometricAuthentication:", &v23))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v5, -v23);
      v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
      dateOfMostRecentBiometricAuthentication = self->_dateOfMostRecentBiometricAuthentication;
      self->_dateOfMostRecentBiometricAuthentication = v8;

      objc_storeStrong((id *)&self->_dateOfLastUpdate, v5);
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = self->_dateOfMostRecentBiometricAuthentication;
        *(_DWORD *)buf = 138412802;
        v25 = v12;
        v26 = 2112;
        v27 = v13;
        v28 = 2112;
        v29 = v14;
        v15 = "%@:%@, updated dateOfMostRecentBiometricAuthentication to %@.";
LABEL_10:
        v18 = v10;
        v19 = 32;
LABEL_14:
        _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEFAULT, v15, buf, v19);

        goto LABEL_15;
      }
      goto LABEL_15;
    }
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    v15 = "%@:%@, unable to get time since last successful biometric authentication (possibly none since last boot), not "
          "updating dateOfMostRecentBiometricAuthentication.";
LABEL_13:
    v18 = v10;
    v19 = 22;
    goto LABEL_14;
  }
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    v28 = 2048;
    v29 = *(NSDate **)&v7;
    v15 = "%@:%@, updated dateOfMostRecentBiometricAuthentication %f seconds ago, not updating now.";
    goto LABEL_10;
  }
LABEL_15:

  v21 = self->_dateOfMostRecentBiometricAuthentication;
  return v21;
}

- (BOOL)defaultOverrideTimeSinceLastSuccessfulBiometricAuthentication:(double *)a3
{
  void *v4;
  float v5;
  BOOL v6;

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsAuthorizedLocationSecondsSinceLastBiometricAuthentication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "floatValue");
    *a3 = v5;
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_getTimeSinceLastSuccessfulBiometricAuthentication:(double *)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  int v35;
  double v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  objc_class *v40;
  double v41;
  objc_class *v43;
  void *v44;
  void *v45;
  double v46;
  double *v47;
  NSObject *v48;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  _BYTE v61[24];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (-[RTPlatform internalInstall](self->_platform, "internalInstall")
    && -[RTAuthorizedLocationBiometricsManager defaultOverrideTimeSinceLastSuccessfulBiometricAuthentication:](self, "defaultOverrideTimeSinceLastSuccessfulBiometricAuthentication:", a3))
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)a3;
      *(_DWORD *)buf = 138412802;
      v57 = v7;
      v58 = 2112;
      v59 = v8;
      v60 = 2048;
      *(_QWORD *)v61 = v9;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Using defaults override for timeSinceLastSuccessfulBiometricAuthentication_s, %.3f", buf, 0x20u);

    }
    v10 = 1;
    goto LABEL_34;
  }
  v47 = a3;
  objc_msgSend(MEMORY[0x1E0D02800], "availableDevices");
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v11 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  v48 = v5;
  if (!v11)
    goto LABEL_17;
  v12 = v11;
  v13 = *(_QWORD *)v53;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v53 != v13)
        objc_enumerationMutation(v5);
      v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v57 = v18;
        v58 = 2112;
        v59 = v19;
        v60 = 2112;
        *(_QWORD *)v61 = v15;
        _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ BKDevice, BKDeviceDescriptor, %@, ", buf, 0x20u);

        v5 = v48;
      }

      if (objc_msgSend(v15, "type") == 1 || objc_msgSend(v15, "type") == 2)
      {
        v51 = 0;
        objc_msgSend(MEMORY[0x1E0D027E8], "deviceWithDescriptor:error:", v15, &v51);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v51;
        _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v57 = v25;
          v58 = 2112;
          v59 = v26;
          v60 = 2112;
          *(_QWORD *)v61 = v21;
          _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@ BKDevice, %@, ", buf, 0x20u);

          v5 = v48;
        }

        if (!v21)
        {
          v20 = v22;
          goto LABEL_25;
        }
        v50 = v22;
        -[NSObject lastMatchEventWithError:](v21, "lastMatchEventWithError:", &v50);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v50;

        v10 = v27 != 0;
        if (v27)
        {
          -[RTTrustedTimeCache convertMachContinuousTicksToSeconds:](self->_trustedTimeCache, "convertMachContinuousTicksToSeconds:", objc_msgSend(v27, "timeStamp"));
          v29 = v28;
          -[RTTrustedTimeCache machContinuousTimeSeconds](self->_trustedTimeCache, "machContinuousTimeSeconds");
          *v47 = v30 - v29;
          _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          v31 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
LABEL_31:
            v5 = v48;
            goto LABEL_32;
          }
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v27, "result");
          v36 = *v47;
          *(_DWORD *)buf = 138413314;
          v57 = v33;
          v58 = 2112;
          v59 = v34;
          v60 = 1026;
          *(_DWORD *)v61 = v35;
          *(_WORD *)&v61[4] = 2050;
          *(double *)&v61[6] = v29;
          *(_WORD *)&v61[14] = 2050;
          *(double *)&v61[16] = v36;
          v37 = "%@:%@ BKDevice, BKMatchEvent, result %{public}d, timestamp, %{public}.1f, timeSinceLastSuccessfulBiometr"
                "icAuthentication, %{public}.1f";
          v38 = v31;
          v39 = 48;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
          v31 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
LABEL_32:

            goto LABEL_33;
          }
          v40 = (objc_class *)objc_opt_class();
          NSStringFromClass(v40);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = *v47;
          *(_DWORD *)buf = 138413058;
          v57 = v33;
          v58 = 2112;
          v59 = v34;
          v60 = 2112;
          *(_QWORD *)v61 = v20;
          *(_WORD *)&v61[8] = 2050;
          *(double *)&v61[10] = v41;
          v37 = "%@:%@ BKDevice, BKMatchEvent, nil, error, %@, returning timeSinceLastSuccessfulBiometricAuthentication, %{public}.1f";
          v38 = v31;
          v39 = 42;
        }
        _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);

        goto LABEL_31;
      }
    }
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v12)
      continue;
    break;
  }
LABEL_17:

  v20 = 0;
LABEL_25:
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = *v47;
    *(_DWORD *)buf = 138413058;
    v57 = v44;
    v58 = 2112;
    v59 = v45;
    v60 = 2112;
    *(_QWORD *)v61 = v20;
    *(_WORD *)&v61[8] = 2050;
    *(double *)&v61[10] = v46;
    _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%@:%@ BKDevice, failed to get device, error, %@, returning timeSinceLastSuccessfulBiometricAuthentication, %{public}.1f", buf, 0x2Au);

    v5 = v48;
  }
  v10 = 0;
LABEL_33:

LABEL_34:
  return v10;
}

- (NSDate)dateOfLastUpdate
{
  return self->_dateOfLastUpdate;
}

- (void)setDateOfLastUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfLastUpdate, a3);
}

- (NSDate)dateOfMostRecentBiometricAuthentication
{
  return self->_dateOfMostRecentBiometricAuthentication;
}

- (void)setDateOfMostRecentBiometricAuthentication:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfMostRecentBiometricAuthentication, a3);
}

- (RTTrustedTimeCache)trustedTimeCache
{
  return self->_trustedTimeCache;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_trustedTimeCache, 0);
  objc_storeStrong((id *)&self->_dateOfMostRecentBiometricAuthentication, 0);
  objc_storeStrong((id *)&self->_dateOfLastUpdate, 0);
}

@end
