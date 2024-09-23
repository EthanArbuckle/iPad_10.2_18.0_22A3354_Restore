@implementation CellularReachability

+ (unint64_t)cellularStatus
{
  unsigned __int8 v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  const __CFString *Value;
  _BOOL4 v15;
  __CFString *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  CFDictionaryRef theDict;
  uint8_t buf[4];
  __CFString *v28;
  __int16 v29;
  CFDictionaryRef v30;

  if ((+[PSCellularDataSettingsDetail deviceSupportsCellularData](PSCellularDataSettingsDetail, "deviceSupportsCellularData") & 1) != 0)
  {
    v2 = +[PSCellularDataSettingsDetail isEnabled](PSCellularDataSettingsDetail, "isEnabled");
    v3 = sub_100432C3C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if ((v2 & 1) != 0)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Fetching cellular data policy from CT...", buf, 2u);
      }

      v6 = qword_1014D33B8;
      if (qword_1014D33B8)
      {
        theDict = 0;
      }
      else
      {
        v10 = sub_100432C3C();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Creating CT server connection for cellular data request...", buf, 2u);
        }

        v6 = _CTServerConnectionCreateOnTargetQueue(kCFAllocatorDefault, 0, &_dispatch_main_q, 0);
        qword_1014D33B8 = v6;
        theDict = 0;
        if (!v6)
        {
          v22 = sub_100432C3C();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "No CT server connection; cannot fetch cellular data policy.",
              buf,
              2u);
          }

          v17 = 0;
          v16 = 0;
LABEL_31:
          v24 = sub_100432C3C();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v28 = v16;
            v29 = 2048;
            v30 = (CFDictionaryRef)v17;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Could not fetch a cellular data usage policy from CT (domain: %lu, error: %lu)", buf, 0x16u);
          }

          return 2;
        }
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = _CTServerConnectionCopyCellularUsagePolicy(v6, objc_msgSend(v12, "bundleIdentifier"), &theDict);

      if (theDict)
      {
        Value = (const __CFString *)CFDictionaryGetValue(theDict, kCTCellularDataUsagePolicy);
        if (Value)
          v15 = CFStringCompare(Value, kCTCellularDataUsagePolicyDeny, 0) != kCFCompareEqualTo;
        else
          v15 = 0;
        v18 = sub_100432C3C();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = CFSTR("NO");
          if (v15)
            v20 = CFSTR("YES");
          v21 = v20;
          *(_DWORD *)buf = 138412546;
          v28 = v21;
          v29 = 2112;
          v30 = theDict;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Allow cellular data:%@ Policy:%@", buf, 0x16u);

        }
        CFRelease(theDict);
        if (v15)
          return 3;
        else
          return 2;
      }
      v16 = (__CFString *)(int)v13;
      v17 = v13 >> 32;
      goto LABEL_31;
    }
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Global cellular data setting is disabled", buf, 2u);
    }

    return 1;
  }
  else
  {
    v7 = sub_100432C3C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Device does not support cellular data", buf, 2u);
    }

    return 0;
  }
}

@end
