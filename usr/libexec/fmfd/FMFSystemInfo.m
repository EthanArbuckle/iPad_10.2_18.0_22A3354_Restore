@implementation FMFSystemInfo

- (int)processId
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("CFBundleIdentifier")));

  return v3;
}

- (id)appName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "infoDictionary"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CFBundleName")));
  return v4;
}

- (id)clientInfoVersionTagString
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  char *v9;
  uint64_t v10;
  _BYTE *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_claimAutoreleasedReturnValue(-[FMFSystemInfo sourceVersionFromVersionFile](self, "sourceVersionFromVersionFile"));
  v4 = (void *)v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = CFSTR("dev");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFSystemInfo appVersion](self, "appVersion"));
  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("dev")) & 1) != 0)
  {
    v8 = CFSTR("100.000000");
  }
  else
  {
    v9 = (char *)-[__CFString length](v6, "length") - 1;
    if ((unint64_t)v9 <= 2)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", *(&off_10009A168 + (_QWORD)v9), v6));

      v6 = (__CFString *)v10;
    }
    v11 = objc_msgSend(v7, "rangeOfString:", CFSTR("."));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v11, (_BYTE *)objc_msgSend(v7, "length") - v11));
    if ((unint64_t)objc_msgSend(v12, "length") <= 2)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("0")));

      v7 = (void *)v13;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), &stru_10009B948));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringToIndex:", 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringFromIndex:", 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v15, v16));

    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v7, v6));
  }

  return v8;
}

- (id)sourceVersionFromVersionFile
{
  FMFSystemInfo *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = self;
  objc_sync_enter(v2);
  if (!qword_1000B3758)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("version"), CFSTR("plist")));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("SourceVersion")));
      v7 = objc_msgSend(v6, "copy");
      v8 = (void *)qword_1000B3758;
      qword_1000B3758 = (uint64_t)v7;

      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000B3758, "substringWithRange:", 0, 3));
      v10 = (void *)qword_1000B3758;
      qword_1000B3758 = v9;

    }
  }
  objc_sync_exit(v2);

  return (id)qword_1000B3758;
}

+ (id)sharedInstance
{
  if (qword_1000B3748 != -1)
    dispatch_once(&qword_1000B3748, &stru_10009A128);
  return (id)qword_1000B3740;
}

- (id)osBuildVersion
{
  if (qword_1000B3768 != -1)
    dispatch_once(&qword_1000B3768, &stru_10009A148);
  return (id)qword_1000B3760;
}

- (unint64_t)unlockState
{
  int v3;

  v3 = MKBDeviceUnlockedSinceBoot(self, a2);
  if (v3 != 1 && (v3 & 0x80000000) == 0)
    return 1;
  if (-[FMFSystemInfo isLocked](self, "isLocked"))
    return 2;
  return 3;
}

- (BOOL)isLocked
{
  int v2;

  v2 = MKBGetDeviceLockState(0, a2);
  return v2 == 1 || v2 == 4;
}

- (BOOL)isAudioAccessory
{
  return MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 7;
}

- (id)productType
{
  return 0;
}

- (id)deviceClass
{
  return 0;
}

- (id)appVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString")));

  return v3;
}

- (int64_t)bundleVersion
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion")));
  v4 = objc_msgSend(v3, "integerValue");

  return (int64_t)v4;
}

- (id)sourceVersion
{
  return 0;
}

- (id)buildVersion
{
  FMFSystemInfo *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = self;
  objc_sync_enter(v2);
  if (!qword_1000B3750)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("version"), CFSTR("plist")));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("ProductBuildVersion")));
      v7 = objc_msgSend(v6, "copy");
      v8 = (void *)qword_1000B3750;
      qword_1000B3750 = (uint64_t)v7;

      if (!qword_1000B3750)
      {
        qword_1000B3750 = (uint64_t)CFSTR("unknown");

      }
    }

  }
  objc_sync_exit(v2);

  return (id)qword_1000B3750;
}

- (id)longVersionString
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFSystemInfo appVersion](self, "appVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFSystemInfo buildVersion](self, "buildVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v3, v4));

  return v5;
}

- (id)deviceUDID
{
  return 0;
}

- (id)osName
{
  return 0;
}

- (id)osVersion
{
  return 0;
}

- (id)deviceName
{
  return 0;
}

- (id)deviceModelName
{
  return 0;
}

- (BOOL)e928760c5fbc1719e59c427e2be01ce6
{
  return 1;
}

- (id)regionCode
{
  return 0;
}

- (BOOL)isInMultiUserMode
{
  return 0;
}

- (BOOL)isBuddyDone
{
  return 1;
}

- (id)iCloudAccountName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iCloudId"));

  return v4;
}

- (BOOL)isFMFAppRemoved
{
  return 0;
}

@end
