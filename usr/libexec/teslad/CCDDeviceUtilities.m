@implementation CCDDeviceUtilities

+ (id)deviceType
{
  __CFString *v2;

  v2 = (__CFString *)MGCopyAnswer(CFSTR("DeviceClass"), 0);
  if (!v2)
    v2 = CFSTR("iPhone");
  return v2;
}

+ (BOOL)isiPad
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003F9C;
  block[3] = &unk_1000188D8;
  block[4] = a1;
  if (qword_1000215B8 != -1)
    dispatch_once(&qword_1000215B8, block);
  return byte_1000215B0;
}

+ (BOOL)isAppleTV
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004050;
  block[3] = &unk_1000188D8;
  block[4] = a1;
  if (qword_1000215C8 != -1)
    dispatch_once(&qword_1000215C8, block);
  return byte_1000215C0;
}

+ (BOOL)isWatch
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004104;
  block[3] = &unk_1000188D8;
  block[4] = a1;
  if (qword_1000215D8 != -1)
    dispatch_once(&qword_1000215D8, block);
  return byte_1000215D0;
}

+ (BOOL)isHomePod
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000041B8;
  block[3] = &unk_1000188D8;
  block[4] = a1;
  if (qword_1000215E8 != -1)
    dispatch_once(&qword_1000215E8, block);
  return byte_1000215E0;
}

+ (BOOL)isiPhone
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000426C;
  block[3] = &unk_1000188D8;
  block[4] = a1;
  if (qword_1000215F8 != -1)
    dispatch_once(&qword_1000215F8, block);
  return byte_1000215F0;
}

+ (BOOL)isRunningInRecovery
{
  return 0;
}

+ (BOOL)isRunningInRootLaunchdContext
{
  return 0;
}

+ (BOOL)isRunningInDiagnosticsMode
{
  if (qword_100021608 != -1)
    dispatch_once(&qword_100021608, &stru_100018918);
  return byte_100021600;
}

+ (BOOL)isInternalBuild
{
  return +[CCDFeatures isAppleInternal](CCDFeatures, "isAppleInternal");
}

+ (id)serialNumber
{
  return (id)MGCopyAnswer(CFSTR("SerialNumber"), 0);
}

+ (id)UDID
{
  return (id)MGCopyAnswer(CFSTR("UniqueDeviceID"), 0);
}

+ (id)modelNumber
{
  return (id)MGCopyAnswer(CFSTR("ModelNumber"), 0);
}

+ (id)deviceCapacity
{
  void *v2;
  void *v3;

  v2 = (void *)MGCopyAnswer(CFSTR("DiskUsage"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", kMGQDiskUsageTotalDataCapacity));

  return v3;
}

+ (id)deviceColor
{
  return (id)MGCopyAnswer(CFSTR("DeviceColor"), 0);
}

+ (id)_systemInfo
{
  if (qword_100021618 != -1)
    dispatch_once(&qword_100021618, &stru_100018938);
  return (id)qword_100021610;
}

+ (id)productName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_systemInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ProductName")));

  return v3;
}

+ (id)productVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_systemInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ProductVersion")));

  return v3;
}

+ (id)productBuildVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_systemInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ProductBuildVersion")));

  return v3;
}

@end
