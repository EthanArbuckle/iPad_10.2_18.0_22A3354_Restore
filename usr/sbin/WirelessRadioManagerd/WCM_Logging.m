@implementation WCM_Logging

+ (void)logLevel:(int)a3 message:(id)a4
{
  uint64_t v4;
  id v6;
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  NSDate *v19;
  id v20;
  id v21;
  uint64_t v22;
  char **v23;
  const char *v24;
  _QWORD block[7];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v4 = *(_QWORD *)&a3;
  block[6] = &v28;
  v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", a4, &v28);
  v7 = 1 << v4;
  if (v4 > 5)
  {
    if ((v7 & 0x3FFF0000) == 0)
      goto LABEL_17;
    if ((v7 & 0x26030000) != 0)
    {
      v8 = qword_100271298[(v4 - 16)];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v6;
        v9 = "%@";
LABEL_15:
        v17 = v8;
        v18 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v17, v18, v9, buf, 0xCu);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    v10 = qword_100271298[(v4 - 16)];
    if ((v7 & 0x14C0000) != 0)
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_17;
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      v9 = "%@";
      goto LABEL_31;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    goto LABEL_10;
  }
  if (v4 > 2)
  {
    if ((v7 & 0x20) != 0)
    {
      v8 = qword_100271268[v4];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v6;
        v9 = "%{public}@";
        goto LABEL_15;
      }
      goto LABEL_17;
    }
    v10 = qword_100271268[v4];
    if ((v7 & 8) != 0)
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_17;
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      v9 = "%@";
LABEL_31:
      v17 = v10;
      v18 = OS_LOG_TYPE_INFO;
      goto LABEL_16;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
LABEL_10:
    sub_10012ED50((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_17;
  }
  v8 = qword_100271268[v4];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    v9 = "%@";
    goto LABEL_15;
  }
LABEL_17:
  if (byte_100271258 && objc_msgSend(a1, "isLogLevelEnabled:", v4))
  {
    v19 = +[NSDate date](NSDate, "date");
    v20 = objc_msgSend((id)qword_100271260, "stringFromDate:", v19);
    v21 = objc_alloc((Class)NSString);
    v22 = getpid();
    if (v4 <= 5)
    {
      v23 = &(&off_100204CF8)[v4];
    }
    else
    {
      if ((v7 & 0x3FFF0000) == 0)
      {
        v24 = "LogUnknown";
        goto LABEL_24;
      }
      v23 = &(&off_100204D28)[(v4 - 16)];
    }
    v24 = *v23;
LABEL_24:
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B49B0;
    block[3] = &unk_100201B18;
    block[4] = a1;
    block[5] = objc_msgSend(v21, "initWithFormat:", CFSTR("%@ [%d] <%s>: %@\n"), v20, v22, v24, v6);
    dispatch_async((dispatch_queue_t)qword_100271318, block);
  }

}

+ (void)setLogToFile:(BOOL)a3
{
  byte_100271258 = a3;
}

+ (BOOL)getLogToFile
{
  return byte_100271258;
}

+ (void)setCurrentLogLevel:(unsigned int)a3
{
  *(_DWORD *)asc_100270DE0 = a3;
}

+ (BOOL)isLogLevelEnabled:(int)a3
{
  return (*(_DWORD *)asc_100270DE0 >> a3) & 1;
}

+ (void)initSettingsFromPreferences
{
  id v2;
  NSArray *v3;
  NSArray *v4;
  NSFileManager *v5;
  NSFileManager *v6;
  uint64_t v7;
  id v8;
  int out_token;

  v2 = (id)qword_100271260;
  if (!qword_100271260)
  {
    v2 = objc_alloc_init((Class)NSDateFormatter);
    qword_100271260 = (uint64_t)v2;
  }
  objc_msgSend(v2, "setDateFormat:", CFSTR("MM/dd/yy HH:mm:ss.SSS"));
  qword_100271268[0] = (uint64_t)os_log_create("com.apple.WirelessRadioManager.Coex", "Error");
  qword_100271270 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.Coex", "Warning");
  qword_100271278 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.Coex", "Info");
  qword_100271280 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.Coex", "Trace");
  qword_100271288 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.Coex", "Detail");
  qword_100271290 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.Coex", "Public");
  qword_100271298[0] = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "Error");
  qword_1002712A0 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "Warning");
  qword_1002712A8 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "Info");
  qword_1002712B0 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceWifi");
  qword_1002712B8 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceSymptom");
  qword_1002712C0 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceMotion");
  qword_1002712C8 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceCellular");
  qword_1002712D0 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceRTP");
  qword_1002712D8 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceHandoverManager");
  qword_1002712E0 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceMetrics");
  qword_1002712E8 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceOther");
  qword_1002712F0 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceIDS");
  qword_1002712F8 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceMediaStreaming");
  qword_100271300 = (uint64_t)os_log_create("com.apple.WirelessRadioManager.iRAT", "TraceFTHandoverManager");
  out_token = 0;
  notify_register_dispatch("com.apple.WirelessRadioManager.PrefChangeNotification", &out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_100204D98);
  +[WCM_Logging reloadLogSettingsFromPreferences](WCM_Logging, "reloadLogSettingsFromPreferences");
  _set_user_dir_suffix("com.apple.WirelessRadioManager");
  NSTemporaryDirectory();
  v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v4 = v3;
  if (!qword_100271308)
    qword_100271308 = (uint64_t)objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), "stringByAppendingPathComponent:", CFSTR("Logs/WirelessRadioManager/"));
  v5 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  if (!-[NSFileManager fileExistsAtPath:](v5, "fileExistsAtPath:", qword_100271308))
  {
    v6 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", qword_100271308, 0, 0, 0))
    {
      NSLog(CFSTR("Created %@"), v4);
    }
  }
  if (!qword_100271310)
    qword_100271310 = (uint64_t)objc_msgSend((id)qword_100271308, "stringByAppendingPathComponent:", CFSTR("WirelessRadioManager.log"));
  v7 = 1;
  do
  {
    v8 = objc_msgSend((id)qword_100271308, "stringByAppendingFormat:", CFSTR("/WirelessRadioManager%i.log"), v7);
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v8))
    {
      NSLog(CFSTR("Remove old-style log file %@"), v8);
      -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v8, 0);
    }
    v7 = (v7 + 1);
  }
  while ((_DWORD)v7 != 10);
  if (!qword_100271318)
    qword_100271318 = (uint64_t)dispatch_queue_create("com.apple.WirelessRadioManager.Log", 0);
}

+ (void)setLogSettingsToPreferences
{
  const char *v2;
  CFDictionaryRef v3;
  CFDictionaryRef v4;
  void *values[2];
  void *keys[2];

  if (byte_100271258)
    v2 = "TRUE";
  else
    v2 = "FALSE";
  *(_OWORD *)keys = off_100204DB8;
  values[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v2);
  values[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%08x"), *(unsigned int *)asc_100270DE0);
  v3 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v3)
  {
    v4 = v3;
    CFPreferencesSetAppValue(CFSTR("LogInfo"), v3, CFSTR("com.apple.WirelessRadioManager.debug"));
    CFRelease(v4);
  }
  if (!CFPreferencesAppSynchronize(CFSTR("com.apple.WirelessRadioManager.debug")))
    NSLog(CFSTR("%s: Failed to sync the preferences."), "+[WCM_Logging setLogSettingsToPreferences]");
}

+ (void)reloadLogSettingsFromPreferences
{
  CFPropertyListRef v2;
  const void *v3;
  CFTypeID TypeID;
  CFTypeID v5;
  CFComparisonResult v6;
  const char *v7;
  int v8;
  CFTypeID v9;
  void *value;

  v2 = CFPreferencesCopyAppValue(CFSTR("LogInfo"), CFSTR("com.apple.WirelessRadioManager.debug"));
  if (!v2)
  {
    NSLog(CFSTR("LogInfo not Found"));
    byte_100271258 = 0;
    *(_DWORD *)asc_100270DE0 = 458759;
LABEL_17:
    +[WCM_Logging setLogSettingsToPreferences](WCM_Logging, "setLogSettingsToPreferences");
    return;
  }
  v3 = v2;
  TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v3))
  {
    NSLog(CFSTR("LogInfo not Found"));
    byte_100271258 = 0;
LABEL_16:
    *(_DWORD *)asc_100270DE0 = 458759;
    CFRelease(v3);
    goto LABEL_17;
  }
  value = 0;
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)v3, CFSTR("LogToFile"), (const void **)&value)
    && (v5 = CFStringGetTypeID(), v5 == CFGetTypeID(value)))
  {
    v6 = CFStringCompare(CFSTR("TRUE"), (CFStringRef)value, 0);
    byte_100271258 = v6 == kCFCompareEqualTo;
    v7 = "FALSE";
    if (v6 == kCFCompareEqualTo)
      v7 = "TRUE";
    NSLog(CFSTR("LogToFile read from preference %s"), v7);
    v8 = 0;
  }
  else
  {
    NSLog(CFSTR("LogToFile not found"));
    byte_100271258 = 0;
    v8 = 1;
  }
  if (!CFDictionaryGetValueIfPresent((CFDictionaryRef)v3, CFSTR("LogLevels"), (const void **)&value)
    || (v9 = CFStringGetTypeID(), v9 != CFGetTypeID(value)))
  {
    NSLog(CFSTR("LogLevels not found"));
    goto LABEL_16;
  }
  sscanf((const char *)objc_msgSend(value, "UTF8String"), "0x%08x", asc_100270DE0);
  NSLog(CFSTR("LogLevels read from preference 0x%08x"), *(unsigned int *)asc_100270DE0);
  CFRelease(v3);
  if (v8)
    goto LABEL_17;
}

+ (int)getNumberOfSavedLogFiles:(int *)a3 new:(int *)a4
{
  NSDate *v6;
  NSDate *v7;
  NSFileManager *v8;
  NSArray *v9;
  NSArray *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  NSDictionary *v16;
  NSDictionary *v17;
  NSScanner *v18;
  NSDate *v19;
  id v20;
  int v21;
  id v22;
  int v23;
  int result;
  int v25;
  int *v26;
  int *v27;
  int v28;
  int v29;
  int v30;

  v30 = 0;
  v6 = +[NSDate distantFuture](NSDate, "distantFuture");
  v7 = +[NSDate distantPast](NSDate, "distantPast");
  v8 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v9 = -[NSFileManager contentsOfDirectoryAtPath:error:](v8, "contentsOfDirectoryAtPath:error:", qword_100271308, 0);
  if (v9)
  {
    v26 = a3;
    v27 = a4;
    v10 = -[NSArray filteredArrayUsingPredicate:](v9, "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF like %@"), CFSTR("WirelessRadioManager-????.log")));
    v11 = -[NSArray count](v10, "count");
    v25 = v11;
    if (v11 >= 1)
    {
      v12 = 0;
      v13 = v11;
      v28 = -1;
      v29 = -1;
      while (1)
      {
        v14 = -[NSArray objectAtIndex:](v10, "objectAtIndex:", v12);
        v15 = objc_msgSend((id)qword_100271308, "stringByAppendingPathComponent:", v14);
        v16 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", v15, 0);
        if (!v16)
        {
          NSLog(CFSTR("Failed to get attributes for %@"), v15);
          goto LABEL_11;
        }
        v17 = v16;
        v18 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v14);
        -[NSScanner scanString:intoString:](v18, "scanString:intoString:", CFSTR("WirelessRadioManager-"), 0);
        if (!-[NSScanner scanInt:](v18, "scanInt:", &v30))
        {
          NSLog(CFSTR("Failed to get index number from %@"), v14);
          goto LABEL_11;
        }
        v19 = -[NSDictionary objectForKey:](v17, "objectForKey:", NSFileCreationDate);
        v20 = -[NSDate compare:](v19, "compare:", v6);
        if (v20)
        {
          if (v20 != (id)-1)
            goto LABEL_16;
          v21 = v30;
        }
        else
        {
          v21 = v30;
          if (v30 >= v29)
            goto LABEL_16;
        }
        v6 = v19;
        v29 = v21;
LABEL_16:
        v22 = -[NSDate compare:](v19, "compare:", v7);
        if (v22)
        {
          if (v22 == (id)1)
          {
            v23 = v30;
LABEL_20:
            v28 = v23;
            goto LABEL_12;
          }
        }
        else
        {
          v23 = v30;
          if (v30 > v28)
            goto LABEL_20;
        }
LABEL_11:
        v19 = v7;
LABEL_12:
        ++v12;
        v7 = v19;
        if (v13 == v12)
          goto LABEL_23;
      }
    }
    v28 = -1;
    v29 = -1;
LABEL_23:
    result = v25;
    *v26 = v29;
    *v27 = v28;
  }
  else
  {
    NSLog(CFSTR("Failed to get contents of %@"), qword_100271308);
    return -1;
  }
  return result;
}

+ (void)logToFile:(id)a3
{
  NSFileManager *v5;
  void *v6;
  NSFileManager *v7;
  NSFileHandle *v8;
  NSFileHandle *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;

  v5 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  if (-[NSFileManager fileExistsAtPath:](v5, "fileExistsAtPath:", qword_100271310))
  {
    v6 = (void *)qword_100271320;
    if (qword_100271320)
      goto LABEL_8;
  }
  else
  {
    v7 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    -[NSFileManager createFileAtPath:contents:attributes:](v7, "createFileAtPath:contents:attributes:", qword_100271310, 0, 0);
    if (qword_100271320)
    {
      objc_msgSend((id)qword_100271320, "closeFile");

      qword_100271320 = 0;
    }
  }
  v8 = +[NSFileHandle fileHandleForWritingAtPath:](NSFileHandle, "fileHandleForWritingAtPath:", qword_100271310);
  qword_100271320 = (uint64_t)v8;
  if (!v8)
  {
    NSLog(CFSTR("Failed to open handle to %@"), qword_100271310);
    return;
  }
  v9 = v8;
  v6 = (void *)qword_100271320;
LABEL_8:
  objc_msgSend(v6, "writeData:", objc_msgSend(a3, "dataUsingEncoding:", 4));
  if ((unint64_t)objc_msgSend((id)qword_100271320, "seekToEndOfFile") >= 0x989681)
  {
    v14 = 0;
    v10 = objc_msgSend(a1, "getNumberOfSavedLogFiles:new:", (char *)&v14 + 4, &v14);
    if ((v10 & 0x80000000) != 0)
    {
      NSLog(CFSTR("Just return because of numberOfSavedLogFiles(%d)"), v10);
    }
    else
    {
      if (v10 >= 3)
        -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend((id)qword_100271308, "stringByAppendingFormat:", CFSTR("/WirelessRadioManager-%04i.log"), HIDWORD(v14)), 0);
      if ((_DWORD)v14 == 9999)
        v11 = 0;
      else
        v11 = (v14 + 1);
      v12 = objc_msgSend((id)qword_100271308, "stringByAppendingFormat:", CFSTR("/WirelessRadioManager-%04i.log"), v11);
      if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v12))
      {
        NSLog(CFSTR("Remove %@ existing already"), v12);
        -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v12, 0);
      }
      v13 = objc_msgSend((id)qword_100271308, "stringByAppendingPathComponent:", CFSTR("WirelessRadioManager.log"));
      if (-[NSFileManager copyItemAtPath:toPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "copyItemAtPath:toPath:error:", v13, v12, 0))
      {
        objc_msgSend((id)qword_100271320, "truncateFileAtOffset:", 0);
      }
      else
      {
        NSLog(CFSTR("Failed to copy %@ to %@"), v13, v12);
      }
    }
  }
}

+ (void)reloadiRATSettingsFromPreferences
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  CFTypeID TypeID;
  CFTypeID v5;
  CFComparisonResult v6;
  _BOOL8 v7;
  const char *v8;
  int v9;
  CFTypeID v10;
  uint64_t v11;
  CFTypeRef cf;
  void *value;

  v2 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("iRATDebug"), CFSTR("com.apple.WirelessRadioManager.debug"));
  if (!v2)
  {
    NSLog(CFSTR("iRATDebug not Found"));
    sub_1000BB280(0);
    v7 = 0;
LABEL_25:
    +[WCM_Logging setiRATSettingsToPreferences:](WCM_Logging, "setiRATSettingsToPreferences:", v7);
    return;
  }
  v3 = v2;
  TypeID = CFDictionaryGetTypeID();
  if (TypeID == CFGetTypeID(v3))
  {
    value = 0;
    if (CFDictionaryGetValueIfPresent(v3, CFSTR("HandoverAlert"), (const void **)&value)
      && (v5 = CFStringGetTypeID(), v5 == CFGetTypeID(value)))
    {
      v6 = CFStringCompare(CFSTR("TRUE"), (CFStringRef)value, 0);
      v7 = v6 == kCFCompareEqualTo;
      v8 = "FALSE";
      if (v6 == kCFCompareEqualTo)
        v8 = "TRUE";
      NSLog(CFSTR("HandoverAlert read from preference %s"), v8);
      v9 = 0;
    }
    else
    {
      NSLog(CFSTR("HandoverAlert not found"));
      v7 = 0;
      v9 = 1;
    }
    cf = 0;
    if (CFDictionaryGetValueIfPresent(v3, CFSTR("iRATPolicy"), &cf)
      && (v10 = CFStringGetTypeID(), v10 == CFGetTypeID(cf)))
    {
      if (CFStringCompare(CFSTR("DYNAMICPOLICY"), (CFStringRef)cf, 0))
      {
        if (CFStringCompare(CFSTR("WIFIPREFERRED"), (CFStringRef)cf, 0))
        {
          if (CFStringCompare(CFSTR("IMSPREFERRED"), (CFStringRef)cf, 0))
          {
            if (CFStringCompare(CFSTR("CELLULARPREFERRED"), (CFStringRef)cf, 0))
              v11 = 0;
            else
              v11 = 3;
          }
          else
          {
            v11 = 2;
          }
        }
        else
        {
          v11 = 1;
        }
      }
      else
      {
        v11 = 0;
      }
      NSLog(CFSTR("reloadiRATSettingsFromPreferences iRATPolicy = %lu"), v11);
      sub_1000BB2C8(v11);
    }
    else
    {
      NSLog(CFSTR("stored iRAT Policy not found"));
    }
  }
  else
  {
    NSLog(CFSTR("iRATDebug not Found"));
    v7 = 0;
    v9 = 1;
  }
  CFRelease(v3);
  sub_1000BB280(v7);
  if (v9)
    goto LABEL_25;
}

+ (void)setiRATSettingsToPreferences:(BOOL)a3
{
  const char *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  void *values;
  void *keys;

  v3 = "FALSE";
  if (a3)
    v3 = "TRUE";
  values = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v3);
  keys = CFSTR("HandoverAlert");
  v4 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v4)
  {
    v5 = v4;
    CFPreferencesSetAppValue(CFSTR("iRATDebug"), v4, CFSTR("com.apple.WirelessRadioManager.debug"));
    CFRelease(v5);
  }
  if (!CFPreferencesAppSynchronize(CFSTR("com.apple.WirelessRadioManager.debug")))
    NSLog(CFSTR("%s: Failed to sync the preferences."), "+[WCM_Logging setiRATSettingsToPreferences:]");
}

+ (id)stringFromXPCObjectWithPrefix:(id)a3 prefix:(id)a4
{
  char *v4;
  NSString *v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = 0;
  if (a3)
  {
    if (a4)
    {
      v4 = xpc_copy_description(a3);
      if (v4)
      {
        v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4);
        free(v4);
        v7 = -[NSString componentsSeparatedByString:](v6, "componentsSeparatedByString:", CFSTR("\n"));
        v4 = (char *)objc_alloc_init((Class)NSMutableString);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v15;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(_QWORD *)v15 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v12, "length"))
                objc_msgSend(v4, "appendFormat:", CFSTR("%@%@\n"), a4, v12);
            }
            v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          }
          while (v9);
        }
      }
    }
  }
  return v4;
}

@end
