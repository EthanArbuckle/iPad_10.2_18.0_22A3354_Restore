@implementation NSBundle

+ (id)_gkBundleIdentifierFromAuditToken:(id *)a3
{
  __int128 v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __SecTask *v16;
  __SecTask *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  NSObject *v22;
  id v23;
  CFErrorRef error;
  audit_token_t token;

  error = 0;
  v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v4;
  v5 = CPCopyBundleIdentifierAndTeamFromAuditToken(&token, &error, 0);
  if ((_DWORD)v5)
  {
    v6 = error;
    v7 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v8 = (id)GKOSLoggers(v5);
      v7 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_1000C90D0((uint64_t)v6, v7, v9, v10, v11, v12, v13, v14);
    return v6;
  }
  v15 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v15;
  v16 = SecTaskCreateWithAuditToken(0, &token);
  if (!v16)
  {
LABEL_14:
    v6 = 0;
    return v6;
  }
  v17 = v16;
  error = 0;
  v6 = (void *)SecTaskCopySigningIdentifier(v16, &error);
  CFRelease(v17);
  if (error)
  {
    v19 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v20 = (id)GKOSLoggers(v18);
      v19 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      token.val[0] = 138412290;
      *(_QWORD *)&token.val[1] = error;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "bundleIdentifierFromAuditToken: SecTaskCopySigningIdentifier() failed %@", (uint8_t *)&token, 0xCu);
    }
    CFRelease(error);
    goto LABEL_13;
  }
  if (!v6)
  {
LABEL_13:

    goto LABEL_14;
  }
  v22 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v23 = (id)GKOSLoggers(v18);
    v22 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    token.val[0] = 138412290;
    *(_QWORD *)&token.val[1] = v6;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "bundleIdentifierFromAuditToken: SecTaskCopySigningIdentifier(): %@", (uint8_t *)&token, 0xCu);
  }
  return v6;
}

+ (id)_gkBundleIdentifierFromConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _OWORD v9[2];

  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "auditToken");
  else
    memset(v9, 0, sizeof(v9));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_gkBundleIdentifierFromAuditToken:", v9));
  if (!v6)
  {
    v7 = objc_msgSend(v5, "processIdentifier");
    if ((_DWORD)v7)
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_gkBundleIdentifierFromPID:", v7));
    else
      v6 = 0;
  }

  return v6;
}

+ (id)_gkBundleIdentifierOrProcessNameForPID:(int)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  const __CFURL *v7;
  const __CFURL *v8;
  const __CFURL *v9;
  __CFBundle *v10;
  __CFBundle *v11;
  CFStringRef Identifier;
  uint64_t v13;
  const __CFDictionary *v14;
  id v15;
  NSObject *v16;
  CFDictionaryRef v17;
  CFDictionaryRef v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  int v29;
  const __CFDictionary *v30;
  uint8_t buf[4];
  CFDictionaryRef v32;

  v4 = objc_msgSend((id)objc_opt_class(a1, a2), "executablePathForPid:", *(_QWORD *)&a3);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v6 = objc_autoreleasePoolPush();
    v7 = CFURLCreateWithFileSystemPath(0, v5, kCFURLPOSIXPathStyle, 0);
    v8 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
    if (v8)
    {
      v9 = v8;
      v10 = CFBundleCreate(0, v8);
      if (v10)
      {
        v11 = v10;
        Identifier = CFBundleGetIdentifier(v10);
        v13 = objc_claimAutoreleasedReturnValue(Identifier);
        v14 = (const __CFDictionary *)v13;
        if (!os_log_GKGeneral)
          v15 = (id)GKOSLoggers(v13);
        v16 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v14;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Getting bundleId from bundleURL %@", buf, 0xCu);
        }
        CFRelease(v11);
        CFRelease(v9);
        if (v14)
          goto LABEL_28;
      }
      else
      {
        CFRelease(v9);
      }
    }
    v17 = CFBundleCopyInfoDictionaryForURL(v7);
    if (!v17)
      goto LABEL_23;
    v18 = v17;
    v19 = objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v17, "objectForKey:", CFSTR("CFBundleIdentifier")));
    v14 = (const __CFDictionary *)v19;
    if (!os_log_GKGeneral)
      v20 = (id)GKOSLoggers(v19);
    v21 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Getting bundleId from plist in binary %@", buf, 0xCu);
    }

    if (!v14)
    {
LABEL_23:
      if (!proc_name(a3, buf, 0x400u))
        goto LABEL_24;
      v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", buf));
      v14 = (const __CFDictionary *)v22;
      if (!os_log_GKGeneral)
        v23 = (id)GKOSLoggers(v22);
      v24 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        v29 = 138412290;
        v30 = v14;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Getting bundleID in debug from pid/procname %@", (uint8_t *)&v29, 0xCu);
      }
      if (!v14)
      {
LABEL_24:
        v25 = objc_claimAutoreleasedReturnValue(-[__CFString lastPathComponent](v5, "lastPathComponent"));
        v14 = (const __CFDictionary *)v25;
        if (!os_log_GKGeneral)
          v26 = (id)GKOSLoggers(v25);
        v27 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v14;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Getting bundleId from process name %@", buf, 0xCu);
        }
      }
    }
LABEL_28:
    CFRelease(v7);
    objc_autoreleasePoolPop(v6);
    goto LABEL_29;
  }
  v14 = 0;
LABEL_29:

  return v14;
}

+ (id)executablePathForPid:(int)a3
{
  int v3;
  _BYTE buffer[4096];

  v3 = proc_pidpath(a3, buffer, 0x1000u);
  if (v3 < 1)
    return 0;
  else
    return objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", buffer, v3, 4);
}

+ (id)executableURLForPid:(int)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend((id)objc_opt_class(a1, a2), "executablePathForPid:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));
  else
    v5 = 0;

  return v5;
}

+ (id)_gkBundleWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationProxyForBundleID:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundle"));
  return v6;
}

+ (id)_gkBundleWithPID:(int)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_msgSend((id)objc_opt_class(a1, a2), "executableURLForPid:", *(_QWORD *)&a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)v5;
  if (v5)
  {
    v7 = (void *)_CFBundleCopyBundleURLForExecutableURL(v5);
    if (v7)
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bundleWithURL:", v7));
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_gkBundleInfoWithPID:(int)a3
{
  id v3;
  const __CFURL *v4;
  const __CFURL *v5;
  CFDictionaryRef v6;

  v3 = objc_msgSend((id)objc_opt_class(a1, a2), "executableURLForPid:", *(_QWORD *)&a3);
  v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4)
    v6 = CFBundleCopyInfoDictionaryForURL(v4);
  else
    v6 = 0;

  return v6;
}

+ (id)_gkBundleIdentifierFromPID:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleWithPID:](NSBundle, "_gkBundleWithPID:"));
  if (v4)
  {
    v5 = v4;
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
    v7 = (void *)v6;
    v8 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v9 = (id)GKOSLoggers(v6);
      v8 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_1000C906C((uint64_t)v7, v8, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleInfoWithPID:](NSBundle, "_gkBundleInfoWithPID:", v3));
    v5 = v16;
    if (!v16
      || (v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("CFBundleIdentifier")))) == 0)
    {

      v7 = 0;
      return v7;
    }
    v7 = (void *)v17;
    v18 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v19 = (id)GKOSLoggers(v17);
      v18 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      sub_1000C9008((uint64_t)v7, v18, v20, v21, v22, v23, v24, v25);
  }

  return v7;
}

+ (id)_gkLocalizedMessageFromDictionary:(id)a3 forBundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;

  v5 = a4;
  if (a3)
  {
    v6 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("loc-key")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("loc-args")));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("loc-default")));

    if (!v9)
      v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
    if (objc_msgSend(v11, "isEqualToString:", v5))
    {

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
      v14 = objc_msgSend(v13, "applicationIsInstalled:", v5);

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleWithIdentifier:](NSBundle, "_gkBundleWithIdentifier:", v5));
LABEL_10:
        v16 = v15;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_gkLocalizedStringForKey:defaultValue:arguments:", v7, v9, v8));

        goto LABEL_11;
      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    goto LABEL_10;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)_gkLocalizedMessageFromPushDictionary:(id)a3 forBundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  if (a3)
  {
    v6 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("k")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("a")));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("d")));

    if (!v9)
      v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
    v11 = objc_msgSend(v10, "applicationIsInstalled:", v5);

    if (v11
      && (v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleWithIdentifier:](NSBundle, "_gkBundleWithIdentifier:", v5))) != 0)
    {
      v13 = v12;
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_gkLocalizedStringForKey:defaultValue:arguments:", v7, v9, v8));

    }
    else
    {
      v14 = v9;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_gkIsGameCenterEnabled
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle bundleIdentifier](self, "bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationProxyForBundleID:", v2));

  LOBYTE(v3) = objc_msgSend(v4, "isGameCenterEnabled");
  return (char)v3;
}

- (BOOL)_gkIsBadgingEnabled
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle infoDictionary](self, "infoDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("GKGameCenterBadgingDisabled")));

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue") ^ 1;
  else
    LOBYTE(v4) = 1;

  return v4;
}

@end
