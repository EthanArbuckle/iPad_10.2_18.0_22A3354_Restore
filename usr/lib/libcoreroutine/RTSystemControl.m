@implementation RTSystemControl

+ (id)valueForKey:(id)a3
{
  id v3;
  void *v4;
  u_int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  size_t v12;
  uint8_t buf[4];
  int v14;
  uint8_t v15[32];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = _MergedGlobals_97;
    if (!_MergedGlobals_97)
    {
      _MergedGlobals_97 = 48;
      sysctlnametomib((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), dword_1ED942970, (size_t *)&_MergedGlobals_97);
      v5 = _MergedGlobals_97;
    }
    v12 = 256;
    memset(v15, 0, sizeof(v15));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    if (sysctl(dword_1ED942970, v5, v15, &v12, 0, 0) < 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v10 = *__error();
        *(_DWORD *)buf = 67109120;
        v14 = v10;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "could not retrieve value due to error (errno: %d)", buf, 8u);
      }
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject stringByTrimmingCharactersInSet:](v6, "stringByTrimmingCharactersInSet:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v15 = 136315394;
      *(_QWORD *)&v15[4] = "+[RTSystemControl valueForKey:]";
      *(_WORD *)&v15[12] = 1024;
      *(_DWORD *)&v15[14] = 22;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key (in %s:%d)", v15, 0x12u);
    }

    v8 = 0;
  }

  return v8;
}

+ (id)valueForMib:(int *)a3 miblen:(int)a4
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  size_t v9;
  uint8_t buf[4];
  int v11;
  _OWORD v12[16];
  uint64_t v13;

  v4 = 0;
  v13 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v9 = 256;
    memset(v12, 0, sizeof(v12));
    if (sysctl(a3, a4, v12, &v9, 0, 0) < 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7 = *__error();
        *(_DWORD *)buf = 67109120;
        v11 = v7;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "could not retrieve value due to error (errno: %d)", buf, 8u);
      }
      v4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject stringByTrimmingCharactersInSet:](v5, "stringByTrimmingCharactersInSet:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v4;
}

+ (unint64_t)sysctlByName:(id)a3
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  size_t v9;
  uint8_t buf[4];
  int v11;
  _BYTE v12[12];
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v12 = 136315394;
      *(_QWORD *)&v12[4] = "+[RTSystemControl sysctlByName:]";
      v13 = 1024;
      v14 = 72;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name.length (in %s:%d)", v12, 0x12u);
    }

  }
  if (!objc_msgSend(v3, "length"))
    goto LABEL_11;
  *(_QWORD *)v12 = 0;
  v9 = 8;
  if (sysctlbyname((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), v12, &v9, 0, 0) == -1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *__error();
      *(_DWORD *)buf = 67109120;
      v11 = v7;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "could not retrieve value due to error (errno: %d)", buf, 8u);
    }

LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = *(_QWORD *)v12;
LABEL_12:

  return v5;
}

@end
