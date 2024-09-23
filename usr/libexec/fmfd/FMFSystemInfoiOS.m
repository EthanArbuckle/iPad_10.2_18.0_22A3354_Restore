@implementation FMFSystemInfoiOS

- (BOOL)e928760c5fbc1719e59c427e2be01ce6
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

- (BOOL)isFMFAppRemoved
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v3 = objc_msgSend(v2, "applicationIsInstalled:", CFSTR("com.apple.findmy")) ^ 1;

  return v3;
}

- (id)deviceUDID
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020734;
  block[3] = &unk_1000993C8;
  block[4] = self;
  if (qword_1000B36F8 != -1)
    dispatch_once(&qword_1000B36F8, block);
  return (id)qword_1000B36F0;
}

- (id)deviceClass
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[FMFSystemInfoiOS _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("DeviceName")));
  v3 = v2;
  if (v2)
  {
    if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("iPod")))
      v4 = CFSTR("iPod touch");
    else
      v4 = v3;
  }
  else
  {
    v4 = CFSTR("Unknown");
  }
  v5 = v4;

  return v5;
}

- (id)appVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString")));

  return v3;
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

- (id)productType
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000202B8;
  block[3] = &unk_1000993C8;
  block[4] = self;
  if (qword_1000B36D8 != -1)
    dispatch_once(&qword_1000B36D8, block);
  return (id)qword_1000B36D0;
}

- (id)osVersion
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[FMFSystemInfoiOS _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("ProductVersion")));
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

- (id)_deviceInfoForKey:(__CFString *)a3
{
  return (id)MGCopyAnswer(a3, 0);
}

- (id)osName
{
  return CFSTR("iPhone OS");
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
  if (qword_1000B36E8 != -1)
    dispatch_once(&qword_1000B36E8, &stru_100099C68);
  return (id)qword_1000B36E0;
}

- (id)deviceName
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[FMFSystemInfoiOS _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("UserAssignedDeviceName")));
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

- (id)deviceModelName
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[FMFSystemInfoiOS _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("DeviceName")));
  v3 = v2;
  if (v2)
  {
    if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("iPod")))
      v4 = CFSTR("iPod touch");
    else
      v4 = v3;
  }
  else
  {
    v4 = CFSTR("Unknown");
  }
  v5 = v4;

  return v5;
}

- (BOOL)isInMultiUserMode
{
  return 0;
}

@end
