id sub_100001FAC(uint64_t a1)
{
  id v1;
  int v2;
  uint64_t v3;
  id v4;
  id v5;
  int v6;
  id v7;
  int v8;
  id v9;
  int v10;
  uint64_t v11;
  NSNumber *v12;
  NSNumber *v13;
  NSNumber *v14;
  id v15;
  NSNumber *v17;
  NSNumber *v18;
  uint64_t v19;
  unsigned int v20;
  NSNumber *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  id v25;
  unsigned int v26;
  unsigned int v27[3];
  unsigned int v28;
  NSNumber *v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  uint64_t v33;
  id v34;
  int v35;
  id v36;
  uint64_t v37;
  uint64_t v38;

  v38 = 0;
  v1 = objc_msgSend(objc_alloc((Class)NSScanner), "initWithString:", a1);
  if ((objc_msgSend(v1, "isAtEnd") & 1) != 0)
  {
    v20 = 0;
    v30 = 0;
    *(_QWORD *)v27 = 0;
    v26 = 0;
    v22 = 0;
    v23 = 0;
    v28 = 0;
    v2 = 0;
    v31 = 0;
    v3 = 0;
  }
  else
  {
    v3 = 0;
    v31 = 0;
    v2 = 0;
    v28 = 0;
    v24 = 0;
    v22 = 0;
    v23 = 0;
    v26 = 0;
    *(_QWORD *)v27 = 0;
    v30 = 0;
    v20 = 0;
    do
    {
      v37 = 0;
      objc_msgSend(v1, "scanUpToString:intoString:", CFSTR("\n"), &v37);
      v4 = objc_alloc((Class)NSScanner);
      v5 = objc_msgSend(v4, "initWithString:", v37);
      if (objc_msgSend(v5, "scanString:intoString:", CFSTR("Date="), 0))
      {
        objc_msgSend(v5, "scanUpToString:intoString:", CFSTR(";"), &v38);
      }
      else
      {
        objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("]"), 0);
        if ((objc_msgSend(v5, "scanString:intoString:", CFSTR("]"), 0) & 1) != 0)
        {
          v36 = 0;
          objc_msgSend(v5, "scanUpToString:intoString:", CFSTR(":"), &v36);
          if (objc_msgSend(v36, "isEqualToString:", CFSTR("reset")))
          {
            v35 = 0;
            v34 = 0;
            if (objc_msgSend(v5, "scanString:intoString:", CFSTR(": reason="), 0))
            {
              objc_msgSend(v5, "scanUpToString:intoString:", CFSTR(";"), &v34);
              if ((objc_msgSend(v34, "isEqualToString:", CFSTR("baseband crash")) & 1) != 0
                || objc_msgSend(v34, "rangeOfString:", CFSTR("modem reset")) != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                v3 = (v3 + 1);
                v6 = 1;
              }
              else
              {
                v6 = 0;
                v24 |= objc_msgSend(v34, "rangeOfString:", CFSTR("FTO")) != (id)0x7FFFFFFFFFFFFFFFLL;
              }
            }
            else
            {
              objc_msgSend(v5, "scanUpToString:intoString:", CFSTR(";"), 0);
              v6 = 0;
            }
            objc_msgSend(v5, "scanString:intoString:", CFSTR(";uptime="), 0);
            objc_msgSend(v5, "scanInt:", &v35);
            ++v31;
            v8 = v35;
            if (!v6)
              v8 = 0;
            v2 += v8;
          }
          else if (objc_msgSend(v36, "isEqualToString:", CFSTR("disconnect")))
          {
            v34 = 0;
            v35 = 0;
            v33 = 34;
            v32 = 0;
            objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("duration"), 0);
            if (objc_msgSend(v5, "scanString:intoString:", CFSTR("duration="), 0))
              objc_msgSend(v5, "scanInt:", &v35);
            objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("cause"), 0);
            if (objc_msgSend(v5, "scanString:intoString:", CFSTR("cause="), 0))
              objc_msgSend(v5, "scanUpToString:intoString:", CFSTR(";"), &v34);
            v7 = objc_msgSend(v5, "scanLocation");
            objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("txPower"), 0);
            if (objc_msgSend(v5, "scanString:intoString:", CFSTR("txPower="), 0))
              objc_msgSend(v5, "scanInt:", (char *)&v33 + 4);
            else
              objc_msgSend(v5, "setScanLocation:", v7);
            v9 = objc_msgSend(v5, "scanLocation");
            objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("maxTxPower"), 0);
            if (objc_msgSend(v5, "scanString:intoString:", CFSTR("maxTxPower="), 0))
              objc_msgSend(v5, "scanInt:", &v33);
            else
              objc_msgSend(v5, "setScanLocation:", v9);
            objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("rat"), 0);
            if (objc_msgSend(v5, "scanString:intoString:", CFSTR("rat="), 0))
              objc_msgSend(v5, "scanInt:", &v32);
            if ((objc_msgSend(v34, "isEqualToString:", CFSTR("kNoError")) & 1) != 0
              || (v24 & (v35 == 0)) != 1)
            {
              ++v28;
              v30 += objc_msgSend(v34, "isEqualToString:", CFSTR("kNoError")) ^ 1;
              if ((objc_msgSend(v34, "isEqualToString:", CFSTR("kNoError")) & 1) == 0
                && (objc_msgSend(v34, "isEqualToString:", CFSTR("kTemporaryFailure")) & 1) == 0
                && (objc_msgSend(v34, "isEqualToString:", CFSTR("kCongestion")) & 1) == 0
                && (objc_msgSend(v34, "isEqualToString:", CFSTR("kResourcesUnavailable")) & 1) == 0
                && (objc_msgSend(v34, "isEqualToString:", CFSTR("kCallEndFade")) & 1) == 0
                && (objc_msgSend(v34, "isEqualToString:", CFSTR("kNoNetworkService")) & 1) == 0)
              {
                if (v32 == 1001)
                {
                  ++HIDWORD(v22);
                }
                else if (v32 == 1000)
                {
                  LODWORD(v22) = v22 + 1;
                }
                else
                {
                  ++v20;
                }
              }
            }
            else
            {
              ++v27[0];
            }
            if (HIDWORD(v33) == (_DWORD)v33)
            {
              ++v27[1];
            }
            else if (HIDWORD(v33) == (_DWORD)v33 - 1)
            {
              ++v26;
            }
            else if (HIDWORD(v33) == (_DWORD)v33 - 2)
            {
              LODWORD(v23) = v23 + 1;
            }
            else
            {
              v10 = HIDWORD(v23);
              if (HIDWORD(v33) == (_DWORD)v33 - 3)
                v10 = HIDWORD(v23) + 1;
              HIDWORD(v23) = v10;
            }
            v24 = 0;
          }
        }
      }

    }
    while (!objc_msgSend(v1, "isAtEnd"));
  }
  v25 = objc_alloc((Class)NSArray);
  v19 = kCFProblemTypeBasebandStats;
  v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3);
  if ((_DWORD)v3)
    v11 = (v2 / (int)v3);
  else
    v11 = 0;
  v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11);
  v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v28);
  v21 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20);
  *(_QWORD *)&v27[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v27[1]);
  v12 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v26);
  v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v23);
  v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIDWORD(v23));
  v15 = objc_msgSend(v25, "initWithObjects:", v19, v18, v17, v29, v21, *(_QWORD *)&v27[1], v12, v13, v14, v38, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v31), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v30), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v27[0]), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v22), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIDWORD(v22)), 0);

  return v15;
}

uint64_t sub_100002670(void *a1, void *a2, uint64_t a3)
{
  id v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t SysIDWithDescription;
  uint64_t v17;
  id v18;

  v4 = a2;
  if (objc_msgSend(objc_msgSend(a2, "pathExtension"), "isEqualToString:", CFSTR("txt")))
    v4 = objc_msgSend(v4, "stringByDeletingPathExtension");
  v6 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("stats"), 2);
  v7 = kCFProblemTypeBasebandStats;
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    v8 = kCFProblemTypeBaseband;
  else
    v8 = kCFProblemTypeBasebandStats;
  v9 = objc_msgSend(objc_msgSend(a1, "stringByAppendingString:", v4), "stringByAppendingPathExtension:", CFSTR("plist"));
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", a3, 4);
  if (!v10)
  {
    v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", a3, 1);
    if (!v10)
      v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithString:", CFSTR("Invalid data in log file."));
  }
  if (v7 == v8)
  {
    v11 = sub_100001FAC((uint64_t)v10);
    logEventForAppleCare();

  }
  v12 = (void *)MGCopyAnswer(CFSTR("InverseDeviceID"), 0);
  v13 = kCRProblemReportProblemTypeKey;
  v14 = kCRProblemReportDescriptionKey;
  v15 = kCRProblemReportCrashReporterKey;
  SysIDWithDescription = GetSysIDWithDescription(0);
  v17 = kCRProblemReportSystemIDKey;
  v18 = -[OSASystemConfiguration productNameVersionBuildString](+[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance"), "productNameVersionBuildString");
  -[NSDictionary writeToFile:atomically:](+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v8, v13, v10, v14, v12, v15, SysIDWithDescription, v17, v18, kCRProblemReportOSVersionKey, 0), "writeToFile:atomically:", v9, 1);

  return 1;
}

uint64_t sub_100002850(void *a1, void *a2)
{
  id v4;
  id v5;
  id v7;
  id v8;

  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:", +[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
  v5 = objc_msgSend(a2, "rangeOfCharacterFromSet:", +[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
    return -1;
  v7 = v5;
  v8 = objc_msgSend(a1, "substringFromIndex:", v4);
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 1;
  else
    return (uint64_t)objc_msgSend(v8, "compare:", objc_msgSend(a2, "substringFromIndex:", v7));
}

void sub_10000290C(void *a1, unsigned int a2)
{
  NSFileManager *v4;
  NSArray *v5;
  NSArray *v6;
  unsigned int v7;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __asl_object_s *v14;
  const char *v15;
  __asl_object_s *v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];

  if ((a2 & 0x80000000) == 0)
  {
    v4 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v22 = 0;
    v5 = -[NSFileManager contentsOfDirectoryAtPath:error:](v4, "contentsOfDirectoryAtPath:error:", a1, &v22);
    if (v5)
    {
      v6 = v5;
      v7 = -[NSArray count](v5, "count");
      v8 = -[NSArray sortedArrayUsingFunction:context:](v6, "sortedArrayUsingFunction:context:", sub_100002850, 0);
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
LABEL_5:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          if (v7 <= a2)
            break;
          v13 = objc_msgSend(a1, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12));
          if (-[NSFileManager removeItemAtPath:error:](v4, "removeItemAtPath:error:", v13, &v22))
          {
            --v7;
          }
          else
          {
            v14 = (__asl_object_s *)qword_100008130;
            v15 = (const char *)objc_msgSend(v13, "UTF8String");
            asl_log(v14, 0, 3, "Failed remove log '%s' (%s)", v15, (const char *)objc_msgSend(objc_msgSend(v22, "description"), "UTF8String"));
          }
          if (v10 == (id)++v12)
          {
            v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
            if (v10)
              goto LABEL_5;
            return;
          }
        }
      }
    }
    else
    {
      v16 = (__asl_object_s *)qword_100008130;
      v17 = (const char *)objc_msgSend(a1, "UTF8String");
      asl_log(v16, 0, 3, "Failed to get dir contents at '%s' (%s)", v17, (const char *)objc_msgSend(objc_msgSend(v22, "description"), "UTF8String"));
    }
  }
}

id sub_100002AF0()
{
  NSFileManager *v0;
  id v1;

  v0 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v1 = objc_msgSend(-[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 8uLL, 1), "lastObject"), "stringByAppendingPathComponent:", CFSTR("DBCShutdownCookie"));
  return (id)-[NSFileManager fileExistsAtPath:](v0, "fileExistsAtPath:", v1);
}

void sub_100002B40()
{
  id v0;

  if ((sub_100002AF0() & 1) == 0)
  {
    v0 = objc_alloc_init((Class)NSData);
    objc_msgSend(v0, "writeToFile:atomically:", objc_msgSend(-[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 8uLL, 1), "lastObject"), "stringByAppendingPathComponent:", CFSTR("DBCShutdownCookie")), 0);

  }
}

BOOL sub_100002BB0()
{
  return -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend(-[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 8uLL, 1), "lastObject"), "stringByAppendingPathComponent:", CFSTR("DBCShutdownCookie")), 0);
}

uint64_t start()
{
  id v0;
  NSArray *v1;
  __asl_object_s *v2;
  const char *v3;
  passwd *v4;
  passwd *v5;
  uid_t v6;
  int v7;
  signed int v8;
  signed int AppIntegerValue;
  passwd *v10;
  passwd *v11;
  uid_t v12;
  unsigned int v13;
  id v14;
  id v15;
  __CFString *v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  const std::__fs::filesystem::path *v21;
  FILE *v22;
  FILE *v23;
  id v24;
  uint64_t v25;
  __CFString *v26;
  NSArray *v27;
  int64_t v28;
  _BYTE *v29;
  _BYTE *v30;
  _BYTE *v31;
  int64_t v32;
  id v33;
  const std::__fs::filesystem::path *v34;
  std::error_code *v35;
  __asl_object_s *v36;
  int *v37;
  char *v38;
  __asl_object_s *v39;
  int *v40;
  void *v42;
  unsigned int v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  stat keyExistsAndHasValidFormat;
  id v49;
  _BYTE v50[128];

  v0 = objc_alloc_init((Class)NSAutoreleasePool);
  v49 = 0;
  qword_100008130 = (uint64_t)asl_open("DumpBasebandCrash", "Crash Reporter", 0);
  sleep(5u);
  asl_log((asl_object_t)qword_100008130, 0, 7, "Launched DumpBasebandCrash");
  v1 = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", CFSTR("/var/wireless/Library/Logs/Baseband/"), &v49);
  if (!v1)
  {
    v2 = (__asl_object_s *)qword_100008130;
    v3 = (const char *)objc_msgSend(CFSTR("/var/wireless/Library/Logs/Baseband/"), "UTF8String");
    asl_log(v2, 0, 3, "Failed to get log contents at '%s' (%s)", v3, (const char *)objc_msgSend(objc_msgSend(v49, "description"), "UTF8String"));
  }
  v4 = getpwnam("mobile");
  if (v4)
  {
    v5 = v4;
    v6 = getuid();
    v7 = seteuid(v5->pw_uid);
    v8 = 48;
    if (v7 != -1)
    {
      LOBYTE(keyExistsAndHasValidFormat.st_dev) = 0;
      AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("BasebandLogLimit"), CFSTR("com.apple.CrashReporter"), (Boolean *)&keyExistsAndHasValidFormat);
      if (LOBYTE(keyExistsAndHasValidFormat.st_dev))
        v8 = AppIntegerValue;
      else
        v8 = 48;
      seteuid(v6);
    }
  }
  else
  {
    v8 = 48;
  }
  endpwent();
  if (sub_100002AF0())
  {
    asl_log((asl_object_t)qword_100008130, 0, 3, "DumpBasebandCrash found old shutdown cookie");
    if (v8 != -1)
      sub_10000290C(CFSTR("/var/wireless/Library/Logs/Baseband/"), 0);
    sub_100002BB0();
  }
  else
  {
    sub_100002B40();
  }
  v10 = getpwnam("_wireless");
  if (v10)
  {
    v11 = v10;
    v12 = getuid();
    if (seteuid(v11->pw_uid) != -1)
    {
      memset(&keyExistsAndHasValidFormat, 0, sizeof(keyExistsAndHasValidFormat));
      if (stat("/var/wireless/Library/Logs/CrashReporter/Baseband", &keyExistsAndHasValidFormat) == -1)
      {
        mkdir("/var/wireless/Library/Logs", 0x1EDu);
        mkdir("/var/wireless/Library/Logs/CrashReporter", 0x1EDu);
        if (mkdir("/var/wireless/Library/Logs/CrashReporter/Baseband", 0x1EDu))
          asl_log((asl_object_t)qword_100008130, 0, 3, "Failed to create CrashReporter/Baseband directory");
      }
      seteuid(v12);
    }
  }
  endpwent();
  v42 = v0;
  if (v8 == -1)
  {
    asl_log((asl_object_t)qword_100008130, 0, 5, "Saving all baseband logs");
  }
  else
  {
    if (-[NSArray count](v1, "count") <= v8)
    {
      v13 = v8 - -[NSArray count](v1, "count");
    }
    else
    {
      sub_10000290C(CFSTR("/var/wireless/Library/Logs/Baseband/"), v8);
      v13 = 0;
    }
    sub_10000290C(CFSTR("/var/wireless/Library/Logs/CrashReporter/Baseband/"), v13);
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v1, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v14)
  {
    v15 = v14;
    v43 = 0;
    v16 = CFSTR("/var/wireless/Library/Logs/Baseband/");
    v17 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(v1);
        v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        v20 = -[__CFString stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:", v19);
        v21 = (const std::__fs::filesystem::path *)objc_msgSend(v20, "fileSystemRepresentation");
        if ((objc_msgSend(objc_msgSend(v20, "pathExtension"), "isEqualToString:", CFSTR("txt")) & 1) != 0)
        {
          v22 = fopen((const char *)v21, "r");
          if (v22)
          {
            v23 = v22;
            v24 = v15;
            v25 = v17;
            v26 = v16;
            v27 = v1;
            fseek(v22, 0, 2);
            v28 = ftell(v23);
            rewind(v23);
            v29 = malloc_type_malloc(v28, 0x100004077774924uLL);
            if (!v29)
            {
              asl_log((asl_object_t)qword_100008130, 0, 3, "Failed de-nullification of '%s'", (const char *)v21);
              asl_close((asl_object_t)qword_100008130);
              exit(1);
            }
            v30 = v29;
            fread(v29, 1uLL, v28, v23);
            if (v28 >= 1)
            {
              v31 = v30;
              v32 = v28;
              do
              {
                if (!*v31)
                  *v31 = 46;
                ++v31;
                --v32;
              }
              while (v32);
            }
            v33 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytesNoCopy:length:freeWhenDone:", v30, v28, 1);
            if (v33)
            {
              sub_100002670(CFSTR("/var/wireless/Library/Logs/CrashReporter/Baseband/"), v19, (uint64_t)v33);
            }
            else
            {
              asl_log((asl_object_t)qword_100008130, 0, 3, "Failed to write baseband log '%s' to disk", (const char *)v21);
              ++v43;
            }
            v1 = v27;

            v16 = v26;
            if (unlink((const char *)v21))
            {
              v39 = (__asl_object_s *)qword_100008130;
              v40 = __error();
              asl_log(v39, 0, 3, "Failed to remove baseband log '%s' (errno=%d)", (const char *)v21, *v40);
            }
            v17 = v25;
            v15 = v24;
          }
          else
          {
            v36 = (__asl_object_s *)qword_100008130;
            v37 = __error();
            v38 = strerror(*v37);
            asl_log(v36, 0, 3, "fopen of '%s' failed with %s", (const char *)v21, v38);
          }
        }
        else
        {
          v34 = (const std::__fs::filesystem::path *)objc_msgSend(objc_msgSend(CFSTR("/var/wireless/Library/Logs/CrashReporter/Baseband/"), "stringByAppendingString:", v19), "fileSystemRepresentation");
          rename(v21, v34, v35);
        }
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v1, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v15);
  }
  else
  {
    v43 = 0;
  }
  sub_100002BB0();
  asl_close((asl_object_t)qword_100008130);

  return v43;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decimalDigitCharacterSet");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAtEnd");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_productNameVersionBuildString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productNameVersionBuildString");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_scanInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanInt:");
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanLocation");
}

id objc_msgSend_scanString_intoString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanString:intoString:");
}

id objc_msgSend_scanUpToString_intoString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanUpToString:intoString:");
}

id objc_msgSend_setScanLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanLocation:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sortedArrayUsingFunction_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingFunction:context:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}
