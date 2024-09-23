@implementation MobileGestaltHelperListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MobileGestaltHelper));
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)getServerAnswerForQuestion:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  CFTypeRef cf;
  unsigned int v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  _QWORD v26[2];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = objc_autoreleasePoolPush();
  if (qword_100008798 != -1)
    dispatch_once(&qword_100008798, &stru_1000042E0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v20 = 0;
  cf = 0;
  v10 = (void *)_MGServerCopyAnswerWithError(v9, v6, &v20, &cf);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (_MGServerQuestionIsPlatform(v6))
  {
    v12 = _MGGetFastPathLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener processNameForConnection:](self, "processNameForConnection:", v9));
      *(_DWORD *)buf = 138412546;
      v22 = (uint64_t)v14;
      v23 = 2112;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "platform fast path elided: caller = %@, question = %@", buf, 0x16u);

    }
  }
  if (v10)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      goto LABEL_11;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener processNameForConnection:](self, "processNameForConnection:", v9));
    *(_DWORD *)buf = 138412802;
    v22 = (uint64_t)v15;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26[0] = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "asked question: p = %@, q = %@, a = %@", buf, 0x20u);
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v17 = objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener processNameForConnection:](self, "processNameForConnection:", v9));
    v15 = (void *)v17;
    v18 = (const __CFString *)cf;
    if (!cf)
      v18 = CFSTR("no log");
    *(_DWORD *)buf = 138413058;
    v22 = v17;
    v23 = 2112;
    v24 = v6;
    v25 = 1024;
    LODWORD(v26[0]) = v20;
    WORD2(v26[0]) = 2112;
    *(_QWORD *)((char *)v26 + 6) = v18;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "asked question: p = %@, q = %@, e = %d [%@]", buf, 0x26u);
  }

LABEL_11:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("error"));

  if (v10)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("answer"));
  if (cf)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", cf, CFSTR("logString"));
    CFRelease(cf);
  }
  v7[2](v7, v11);

  objc_autoreleasePoolPop(v8);
}

- (id)processNameForConnection:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  const char *v9;
  char *v10;
  int *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  char *v19;
  const char *v20;
  uint32_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  unsigned int v31;
  uint8_t buf[4];
  _QWORD v33[3];
  __int128 buffer;
  _OWORD v35[3];

  v3 = a3;
  v4 = v3;
  buffer = 0u;
  memset(v35, 0, sizeof(v35));
  if (v3)
  {
    objc_msgSend(v3, "auditToken");
    v5 = v31;
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[unknown caller].%d"), v5));
  v7 = proc_pidinfo(v5, 13, 0, &buffer, 64);
  if (v7 == 64)
  {
    v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s.%d"), v35, v5));

    v6 = (void *)v22;
  }
  else
  {
    v8 = v7;
    if (v7 == -1)
    {
      v9 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m";
      v10 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m", 47);
      if (v10)
        v9 = v10 + 1;
      v11 = __error();
      v12 = strerror(*v11);
      sub_100001A5C((uint64_t)v9, 56, (uint64_t)CFSTR("proc_pidinfo: %s"), v13, v14, v15, v16, v17, v12);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v18 = __error();
        v19 = strerror(*v18);
        *(_DWORD *)buf = 136315138;
        v33[0] = v19;
        v20 = "proc_pidinfo: %s";
        v21 = 12;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
      }
    }
    else
    {
      v23 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m", 47);
      if (v23)
        v29 = v23 + 1;
      else
        v29 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m";
      sub_100001A5C((uint64_t)v29, 58, (uint64_t)CFSTR("proc_pidinfo: wrong size: actual = %d, expected = %lu"), v24, v25, v26, v27, v28, v8);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        LODWORD(v33[0]) = v8;
        WORD2(v33[0]) = 2048;
        *(_QWORD *)((char *)v33 + 6) = 64;
        v20 = "proc_pidinfo: wrong size: actual = %d, expected = %lu";
        v21 = 18;
        goto LABEL_16;
      }
    }
  }

  return v6;
}

- (void)getSpringboardRegionOverride:(id)a3 reply:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  v5 = (void (**)(id, void *))a4;
  v6 = objc_autoreleasePoolPush();
  if (qword_100008798 != -1)
    dispatch_once(&qword_100008798, &stru_1000042E0);
  v7 = (void *)MGCopyAnswer(CFSTR("h63QSdBCiT/z0WU6rdQv6Q"), 0);
  CFPreferencesSynchronize(kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  v8 = (void *)CFPreferencesCopyValue(CFSTR("AppleLocale"), kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  v9 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    goto LABEL_8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "regionCode"));

  v12 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
  {

LABEL_8:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "regionCode"));

    goto LABEL_9;
  }
  if (!v11)
    goto LABEL_8;
LABEL_9:

  v14 = 0;
  if (v7 && v11)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringWithFileSystemRepresentation:length:", "/System/Library/CoreServices/RegionalOverrideSoftwareBehaviors.plist", 68));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v7));

    if (v18 && (v19 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v18, v19) & 1) != 0))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v11));
      if (v20 && (v21 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v20, v21) & 1) != 0))
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", v22));
      else
        v14 = 0;

    }
    else
    {
      v14 = 0;
    }

  }
  v5[2](v5, v14);

  objc_autoreleasePoolPop(v6);
}

- (void)getAppleTVMode:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void (**)(id, void *))a3;
  v5 = objc_autoreleasePoolPush();
  if (qword_100008798 != -1)
    dispatch_once(&qword_100008798, &stru_1000042E0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (objc_opt_class(CADisplay))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentMode"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v9, "width")));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("width"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v9, "height")));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("height"));

    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_1000028A4(self, (uint64_t)v6, (uint64_t)v9);

  }
  v4[2](v4, v7);

  objc_autoreleasePoolPop(v5);
}

- (void)rebuildCache:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;

  v4 = (void (**)(id, uint64_t))a3;
  v5 = objc_autoreleasePoolPush();
  if (qword_100008798 != -1)
    dispatch_once(&qword_100008798, &stru_1000042E0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener processNameForConnection:](self, "processNameForConnection:", v6));
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Requested a cache rebuild: p = %@", (uint8_t *)&v9, 0xCu);

  }
  v8 = _MGRebuildCache();
  v4[2](v4, v8);

  objc_autoreleasePoolPop(v5);
}

- (void)setCacheSentinel:(id)a3
{
  void (**v4)(id, BOOL);
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = (void (**)(id, BOOL))a3;
  v5 = objc_autoreleasePoolPush();
  if (qword_100008798 != -1)
    dispatch_once(&qword_100008798, &stru_1000042E0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener processNameForConnection:](self, "processNameForConnection:", v6));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Requested a cache sentinel: p = %@", (uint8_t *)&v8, 0xCu);

  }
  v4[2](v4, -[MobileGestaltHelperListener setCacheSentinel](self, "setCacheSentinel"));

  objc_autoreleasePoolPop(v5);
}

- (id)queryBootUUID
{
  void *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  size_t v11;
  uint8_t buf[4];
  const char *v13;
  _OWORD v14[3];
  __int16 v15;

  v15 = 0;
  memset(v14, 0, sizeof(v14));
  v11 = 50;
  if (sysctlbyname("kern.bootsessionuuid", v14, &v11, 0, 0) == -1)
  {
    v3 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m", 47);
    if (v3)
      v9 = v3 + 1;
    else
      v9 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltHelpers/MobileGestaltHelper/MobileGestaltHelper.m";
    sub_100001A5C((uint64_t)v9, 221, (uint64_t)CFSTR("Could not lookup %s"), v4, v5, v6, v7, v8, (char)"kern.bootsessionuuid");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "kern.bootsessionuuid";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not lookup %s", buf, 0xCu);
    }
    v2 = 0;
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v14));
  }
  return v2;
}

- (id)getSentinelPath
{
  return objc_msgSend(CFSTR("/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.mobilegestaltcache/Library/Caches/com.apple.MobileGestalt.plist"), "stringByAppendingString:", CFSTR(".rebuild"));
}

- (BOOL)setCacheSentinel
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  unsigned __int8 v7;
  id v8;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener getSentinelPath](self, "getSentinelPath"));
  if (!v3)
  {
LABEL_8:
    v8 = 0;
    v5 = 0;
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener queryBootUUID](self, "queryBootUUID"));
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100002944();
    goto LABEL_8;
  }
  v5 = v4;
  v10 = 0;
  v6 = 1;
  v7 = objc_msgSend(v4, "writeToFile:atomically:encoding:error:", v3, 1, 4, &v10);
  v8 = v10;
  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100002988((uint64_t)v5, (uint64_t)v3, v8);
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (BOOL)needsNewCachePostBoot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  _BOOL4 v10;
  id v11;
  char v12;
  unsigned __int8 v13;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener getSentinelPath](self, "getSentinelPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = v4;
  if (v3 && objc_msgSend(v4, "fileExistsAtPath:", v3))
  {
    v16 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", v3, 4, &v16));
    v7 = v16;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MobileGestaltHelperListener queryBootUUID](self, "queryBootUUID"));
      v9 = objc_msgSend(v6, "isEqualToString:", v8);
      v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if ((v9 & 1) != 0)
      {
        if (v10)
        {
          *(_DWORD *)buf = 138412290;
          v18 = v6;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Boot UUIDs match %@", buf, 0xCu);
        }
        v11 = v7;
      }
      else
      {
        if (v10)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "New cache needed", buf, 2u);
        }
        v15 = v7;
        v13 = objc_msgSend(v5, "removeItemAtPath:error:", v3, &v15);
        v11 = v15;

        if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100002AC4(v11);
      }
      v12 = v9 ^ 1;

      v7 = v11;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100002A44(v7);
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
