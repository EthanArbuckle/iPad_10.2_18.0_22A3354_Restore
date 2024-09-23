@implementation RTAuthorizationManager_Embedded

- (RTAuthorizationManager_Embedded)initWithMetricManager:(id)a3 platform:(id)a4 userSessionMonitor:(id)a5
{
  id v7;
  RTAuthorizationManager_Embedded *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const __CFString *v12;
  objc_super v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTAuthorizationManager_Embedded;
  v8 = -[RTAuthorizationManager initWithPlatform:userSessionMonitor:](&v14, sel_initWithPlatform_userSessionMonitor_, v7, a5);
  if (v8)
  {
    if (objc_msgSend(v7, "supportsCoreRoutineCapability"))
      v9 = objc_msgSend(v7, "supportsMultiUser") ^ 1;
    else
      v9 = 0;
    -[RTAuthorizationManager setSupported:](v8, "setSupported:", v9);
    _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = -[RTAuthorizationManager isSupported](v8, "isSupported");
      v12 = CFSTR("NO");
      if (v11)
        v12 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "CoreRoutine's services supported, %@", buf, 0xCu);
    }

  }
  return v8;
}

- (BOOL)isLocationServicesEnabled
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled:", 1);
  _rt_log_facility_get_os_log(RTLogFacilityAuthorization);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = CFSTR("NO");
    if (v2)
      v4 = CFSTR("YES");
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "Location services enabled, %@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

@end
