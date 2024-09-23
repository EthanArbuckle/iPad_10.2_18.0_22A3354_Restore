@implementation RTBootInfo

+ (id)getCurrentBootSessionID
{
  uint64_t v2;
  void *v3;
  size_t v5;
  _BYTE v6[37];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(v6, 0, sizeof(v6));
  v5 = 37;
  if (!sysctlbyname("kern.bootsessionuuid", v6, &v5, 0, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)getCurrentBootSessionID_bootUUID;
    getCurrentBootSessionID_bootUUID = v2;

  }
  return (id)getCurrentBootSessionID_bootUUID;
}

+ (BOOL)isFirstRunSinceBootWithDefaultsManager:(id)a3 defaultsKey:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "+[RTBootInfo isFirstRunSinceBootWithDefaultsManager:defaultsKey:]";
      v16 = 1024;
      LODWORD(v17) = 29;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }

  }
  +[RTBootInfo getCurrentBootSessionID](RTBootInfo, "getCurrentBootSessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v5, "objectForKey:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = !v9 || (-[NSObject isEqual:](v9, "isEqual:", v8) & 1) == 0;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 136315650;
      v15 = "+[RTBootInfo isFirstRunSinceBootWithDefaultsManager:defaultsKey:]";
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%s, currentBootUUID, %@, lastBootUUID, %@", (uint8_t *)&v14, 0x20u);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "+[RTBootInfo isFirstRunSinceBootWithDefaultsManager:defaultsKey:]";
      v16 = 2112;
      v17 = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "%s, unable to read a valid currentBootUUID, %@", (uint8_t *)&v14, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

+ (void)setBootSessionIDWithDefaultsManager:(id)a3 defaultsKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  +[RTBootInfo getCurrentBootSessionID](RTBootInfo, "getCurrentBootSessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "+[RTBootInfo setBootSessionIDWithDefaultsManager:defaultsKey:]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, storing boot session ID in defaults, %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v6, "setObject:forKey:", v7, v5);
}

@end
