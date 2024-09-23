@implementation NSManagedObjectContext(Cloud)

- (id)currentDevice
{
  void *v2;
  __CFString *v3;
  void *v4;
  id v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  char *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("RTPersistenceDriverUserInfoDeviceMOIDKey"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "userInfo");
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v31 = CFSTR("RTPersistenceDriverUserInfoDeviceMOIDKey");
      v32 = 2112;
      v33 = v13;
      v34 = 2080;
      v35 = "-[NSManagedObjectContext(Cloud) currentDevice]";
      v36 = 1024;
      LODWORD(v37) = 92;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "userInfo returned is nil for key, %@, userInfo, %@ (in %s:%d)", buf, 0x26u);

    }
    v4 = 0;
    goto LABEL_18;
  }
  v27 = 0;
  objc_msgSend(a1, "existingObjectWithID:error:", v3, &v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v27;
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 0;
  if (!v6)
  {
    v18 = v5;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "userInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      if (v4)
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      objc_msgSend(v4, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v31 = v22;
      v32 = 2112;
      v33 = CFSTR("YES");
      v34 = 2112;
      v35 = (const char *)v23;
      v36 = 2112;
      v37 = v25;
      v38 = 2112;
      v39 = v18;
      _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "hasUserInfo, %@, hasDeviceRecordID, %@, hasCurrentDeviceMO, %@, currentDeviceMo.identifier, %@, error, %@", buf, 0x34u);

    }
    v28 = *MEMORY[0x1E0CB3388];
    v29 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("No existing current device!"), objc_claimAutoreleasedReturnValue());
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
  }
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      objc_msgSend(v4, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v31 = v15;
      v32 = 2112;
      v33 = CFSTR("YES");
      v34 = 2112;
      v35 = CFSTR("YES");
      v36 = 2112;
      v37 = v17;
      v38 = 2112;
      v39 = 0;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "hasUserInfo, %@, hasDeviceRecordID, %@, hasCurrentDeviceMO, %@, currentDeviceMo.identifier, %@, error, %@", buf, 0x34u);

    }
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v31 = v3;
        v32 = 2080;
        v33 = "-[NSManagedObjectContext(Cloud) currentDevice]";
        v34 = 1024;
        LODWORD(v35) = 124;
        _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "objectWithID, %@, returned nil (in %s:%d)", buf, 0x1Cu);
      }

    }
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v3;
      _os_log_fault_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_FAULT, "No existing device with object ID: %@", buf, 0xCu);
    }
LABEL_18:

  }
  return v4;
}

- (uint64_t)mirroringQualityOfService
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a1, "mirroringQualityOfService");
  else
    return 0;
}

- (uint64_t)setMirroringQualityOfService:()Cloud
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(a1, "setMirroringQualityOfService:", a3);
  return result;
}

@end
